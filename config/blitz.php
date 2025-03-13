<?php
/**
 * @copyright Copyright (c) PutYourLightsOn
 */

/**
 * Blitz config.php
 *
 * Once copied to 'craft/config', this file will be multi-environment aware as
 * well, so you can have different settings groups for each environment, just as
 * you do for 'general.php'
 */

return [
    '*' => [
        'cachingEnabled' => true,
        'cacheStorageType' => 'putyourlightson\blitz\drivers\storage\YiiCacheStorage',
        'cacheStorageSettings' => [],
        'includedUriPatterns' => [
            ['uriPattern' => '.*']
        ],
        'excludedUriPatterns' => [
            ['uriPattern' => 'dynamic/.*']
        ],
        'includedQueryStringParams' => [
            ['queryStringParam' => '.*']
         ],
        'clearCacheAutomatically' => true,
        'warmCacheAutomatically' => true,
        'refreshCacheAutomaticallyForGlobals' => true,
        'queueJobTtr' => 600, // 10 mins
        'queryStringCaching' => 1,
        'debug' => true
    ],
    'dev' => [
        'cachingEnabled' => false,
        'cacheStorageType' => 'putyourlightson\blitz\drivers\storage\FileStorage',
        'cacheStorageSettings' => ['folderPath' => '@root/cache/blitz']
    ],
    'staging' => [
    ],
    'production' => [
        'debug' => false
    ]
];