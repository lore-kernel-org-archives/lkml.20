Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338643B3F9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276541; cv=fail; b=mIz5KgWyXQ77Cj2qMycq3dAnv1M3qpStyjr8K34GN/adbRCyRG05UaHMkNJIJhWdV5FkjRSWGfl4jIjAOkSmcYRWw02S3MvnfkJtvnZMPdBW/lWEiIGEywU0b/tPo1HJ6AdEghNkyQwk1LBjnlwyasna3ZgALo37FrAK4OxPna8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276541; c=relaxed/simple;
	bh=19hNIyKIyoq+7/8gCSKNQ5Szwhxih78Py5xbBbHNofU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CqD3Q2z3WOYC65YXyzRfYBc9HdCQa+x4urUHUT2asXI0XoDStigISJccorQ1yzM2N0P8ul3thlKZhcCmfauSl4f1R/IkKXgz600fIsx8D0AGhbob20QCGoqW/uHu75l/m5il7FhcjF8q1iHRLxJECfRUS77oGItqKc6fDkdFZrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RTdaD/pj; arc=fail smtp.client-ip=52.101.46.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RTdaD/pj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEeuXwbCVShSpFQQX/1vYHI+43u7DVlxjrOf66j+X6bf1n6DDDp1NRZjIIii0vZbU3LqvZDv3W0aIje+EB2Fw5nea0s3O8+k59BukIZhaSwYIYjl5Wl4cQ398hBuIFbSQ9qj33qqbI7gwA2iToYYinABoNrc3UzgiUPoIBbs2skAdFu1ms5NVBipuVEd79CeDd8kdsyXzwfSWC03CZTUVC6lWFMrAja345Z67iw/TbeF4vLsxS4KR1A3YUA/UthH2N+YuL23KlLWOIKBfWllaDweahOE3omWoRKtfIpHVo6dRiR6vm+QdDUTjsXaXzp7z8xasEEBrZeiF+UqZOYcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sITt+ACr1XlIar85qtOZSors+4HbzigMhUiS2PuSltI=;
 b=kZI1tSsgJrkY9Z+Y9ssXd3odR7z0jVPW3BpL01LsCx80fcaX+D/jomVYqZ/PBClInXrkcQGwBboSJQCgmx6HETr6NwDW/ER7XOJxT6HfgVJEoil2yK6f9VvY7wumD+vWJaH/aWzd9dj3psnZZpx1KXrTbDvfUfF1L5INcxce1i68QsxC0a1F1w9monHU2GdEx2S4qGBSyMo6IWXkBcvfu3q5BL5ST1EsFpXwY7EVQGw2sus6nF2xPODDntlrpluZomIFng629WsQN5P/h2h3U/mQGeDLCgr9jpFFI2u3OyZvAniyxLlk9qO+xwaDszSEkpOUU5vS3wYhe/FI5CKcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sITt+ACr1XlIar85qtOZSors+4HbzigMhUiS2PuSltI=;
 b=RTdaD/pjRaWpexwPQv7MsmtMk8y+zAy93Gb0k8HyJxsqvDM5TWP+EpEPesU9tRsf7EvyoBfaVLhZaZ/bns/ToUo3V3dGcfWWGaUjvkhEfynFp3x1IcYuwheacg9Vy1HMcXtcloar9Xh4oAXiP1SJ4fcrglxDq0w4jxm+LzceFYvzvzggezXS+qPP3mBeaKU87e/qj7JA0wCoJLSIoK4idxMd5klo2KCQQn6bgXUsMe+0o2DKcyJmzzj5FgB/TlbaAvoqhiP6L/uKzPs08hsGxC4hiqqUUOc+jRNKb/80NHb7au9xbAkYGRAZgKLVlZC6leMLkL888TwtKn3/ir5MOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:28:53 +0000
Received: from PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544]) by PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:28:52 +0000
Message-ID: <c50e498a-72d3-4ade-8d82-224581a4f6c3@nvidia.com>
Date: Tue, 1 Sep 2026 10:28:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_ffa: Tear down driver during shutdown
To: Sudeep Holla <sudeep.holla@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nat Gurumoorthy <natg@google.com>, Maxi Saparov <masaparov@coreweave.com>
References: <20260901131112.3437516-1-sudeep.holla@kernel.org>
Content-Language: en-US
From: Carol Soto <csoto@nvidia.com>
In-Reply-To: <20260901131112.3437516-1-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PH7PR12MB6882.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6882:EE_|MW3PR12MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b779f5-5569-492b-96b1-08df083dbaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FPIDwY3Fu95nisMIzWGCiDfIuRr60RdJYceyN4oo7VW+f5xWdq9SBhrdDt7/Ncv3tgnAzTSfsABWIRPbK9FxcNPuMjS/PrhfywuhqJsdEpgYYcevTVOqIBerM/551anfAY77BCc9Xf+nKDy+/ePLtkGD0RMEZl9CoLLTqzP02UTh21oYgpdJ0i+nThsfznL6Z1MjsIVWNrGxvDjIWZBzSvxkBx1HDuegYBIZsVpwuK5FoMmh61pu55gLLiFJE/6Hnnqrpf3z8+gPpIo5vZrVM5j/e/LN4V69D2bIiSC/60BAQ7Lc6rpfqX3u8bWqUCoK0pD+Q3T8hE7exhPGi8c4IuU5+jiMRMGwRx8U2NpCJUfH0CA8jOBrfiZ9OSkNBh6H7P2qSmnp7s4E9qB4GvWjtVHk18oTRI5Y1KzaYcaW6az5p7KQITIsEZ99h0rj7qIMg47hDVdpDhdSuCjARN/VYNHJCHcbJ2AsyUe40mqEFdSK8+5T4v5la04eky8qEf87ou6k06nDWKJudskfM61/ik1Q0RXx7gric3VyVr9fCr8DgaAGg/naJiMuyuoRBKyD2u1bHOTcoICo5a3dQyXkUwlTL/cxNAqsuPrLHz9uPI7+ICcm9CY6s10Mq/O0HTac21m8xHKR2RQ3ROA91Nxqvf/biPrkqWpYeDOCxmpJvig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6882.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amliS2tDRFRmZGpUZXZhRWpiVURpNUgra3M5WWE3UkRESlM0by9ENVQ1dS9W?=
 =?utf-8?B?bmJ5UmFKZStuYThRbDdKMEJoT0FGME1pdGVTUTBnQlUrK2dtZ1dQSmFDMk1u?=
 =?utf-8?B?dUxsV1pJb0RDVGFNek4ySW9xZFBPWHRHcFFCOE8xUk9mRzcwL25oL3NaM3Fh?=
 =?utf-8?B?UkhPdFZPcXczVEFMRlVMd3RacVhEdUV5Q1RsRGRubkJlUWMrQ3lSSVdKUk9J?=
 =?utf-8?B?TEdzZ2F3d0hxSFJZcWpGRFBlU0lHcDZ2SUpVVzVFRkZ3eEFUVnhzbUltZEVV?=
 =?utf-8?B?eDRLT1lxbGFTYWdYakh1L1ZUUHZlejVjOVRiK3N0WW5KMEQzRS95cVUvdHpM?=
 =?utf-8?B?OFUxWUs0ZVZOcGVveldDcUFpV0ZZYUtUa1BsMDY2bW5LVjBUZWY4NGJ0eFRl?=
 =?utf-8?B?V3IxS2cxbVZJUUhpUTRWOGNpQVhzNFJLbTh4UFNjQzV3aEYrZjRXRThkaUIw?=
 =?utf-8?B?eVFBc2ZXQ3RSUE9jTkx0OWNjaHlvT3V1Tndna1pWS242Z3htWUJZUk5Da1pq?=
 =?utf-8?B?NU5XUCswZ0RkYzlhMno0cjdvRDRPaFlxRkhHT2VHV243dVRNTTNYRldtamFD?=
 =?utf-8?B?Sk5ZQUlJQmVpbXVsemc2MVR4a1dlT3N1VnNjYWF6djV4U3dqa1hKQkh2TU1k?=
 =?utf-8?B?Q1VQOVhMSU9FMDFyT0c3bCs1RXBua2VHd3JkbVlNL0lmN21OTmJFYS9yTVd3?=
 =?utf-8?B?aElxbU5kb0xCM3lsVEswc2RwMTBaQ3lnMjRmOGNSckdFd2pkK0pqbCt0Qzht?=
 =?utf-8?B?SkdLV3AveW1qZnNwdksrY0JTNkJVMkV0K25Kd3BiYnF4Sk9NbjJzWENPSnFi?=
 =?utf-8?B?OHFLUXVnMmFrUWR5M1dTKzAzWTZuYmpYaWFqTnc1YnJnaTd6dXNEN29IWG1p?=
 =?utf-8?B?VVhEOStrQ0phSm5KRU1KWkZ6Y1dSa0tJNmYwQUZTMkVGb0k3ZERCdGFLRzdY?=
 =?utf-8?B?Qk1hanlnb1Q0NjRwV21yVDhjMnhKeWhDV0pKVCtkaXJuSXp1cWZ2UkRRUU5H?=
 =?utf-8?B?ZkZjU1B2WDRtbFlZY2xLc0F1TUJNWjRadmlXMXlsWmhHKytoeml3VC9SdHNX?=
 =?utf-8?B?L2FLWVJ3Z2dlTXVBYkZMb3Zydlk1dSt0YlhPdWpBZXpZNEdGR3Eza3ZIWS9j?=
 =?utf-8?B?eDdYQUd4UTRieDN4OVV2eXBpOW4xdDJWVjdjc2c4Q0g5YkNiS3loV25INUs0?=
 =?utf-8?B?Z3BCK0dkN214M2FJNFJFdDJsQkdYS2hIdXpOQjI4Y2lYelk1dkw1UXpqVWw0?=
 =?utf-8?B?eFR3MEpVZ2RsMTRWME1RQnE5dEMya3g3Ni93b2xUd1BUQnMwa1ZncFh4NDJE?=
 =?utf-8?B?eDh4eDRXcC9kaHJ3OWV2ZEs1K2hoL01vdWc3b3ZlaitWczY4SjlzeTVnVmJW?=
 =?utf-8?B?WjcyNkFVWm1xL2g4T0wrYU05alh1dzB5NjFtQTZUMzYyVTgyTStCaWlzbzhN?=
 =?utf-8?B?L2Q4cTRtRXhRZm5IT2xNbDZjUHFDUXZlRjBFQ1MwWXIrSmJGejJsL0lOMGZM?=
 =?utf-8?B?em9Nc1ZGclQ0czFLY3pBUVBaMTFhSUVCUTYxK3pQaGYrdFI0eUYxNVUzSU4r?=
 =?utf-8?B?WnVrRVVJUXA1QXNhYVF3TDJoUXdrQkZaYzI4SVpucGdUYXc5TEVvUVRzMkxP?=
 =?utf-8?B?M0pBbTlqejd4SEZ6RlRoTFlKVzByWlZEQUZqc3JRVkNFOVFjcjl2aGN0U21W?=
 =?utf-8?B?M0VQbjhXbmVFVVkxZWRDOWh1OU42TFlqeWxKdklTQkgweUhLcHIxTFZ0SW5J?=
 =?utf-8?B?Q3RwbGkxNXpqUU9leFRUcFgrQTdzbE4wV2ZEK0xvbys4YW5XMlg5WnJRdzZh?=
 =?utf-8?B?cTE5dGhMQkQzRUxlVnZINDFjSTlzVHN1SDdUY0VFK1lNSGNCeVU0aTdjUzgx?=
 =?utf-8?B?M2VNRno4a1kxa1RzV2Y3VUVUWFFsVkg2Zm1oRTBrZzZLM00vcFk0S1hNZXF4?=
 =?utf-8?B?ajd1blRGekRONU10TTJtMy9QcGZRK2d5YmZuY0FaS1BaS3dxL2VwVklQcVJl?=
 =?utf-8?B?c0w2aFlHNzdTaC9hTURLdnBIdWlZd0VEcitMSlc5Ly96UTZjYnYwTkZaVkVN?=
 =?utf-8?B?aDFRZGl4cTQrc2QyUlBEV09GK0ZlZnl1QnZoYXF0cWJkTU0vUlV5U000RlZk?=
 =?utf-8?B?dlVsdG1ZYytTb2F2ZkVleU54WVlsT3Roc3JxTzNsMFpzYWhLc2hqeG51bEJ5?=
 =?utf-8?B?NnBlSEJ5RHU4SlhBQTBkWFBSbEJMTnlsNWh4Q2pEWm5wZHF5am1OYncybzFN?=
 =?utf-8?B?NUY1ZVM5b25KWXpqcHdaejJNeE1qbHJERUZnVTJGNHdlL1FmMTFQUHJPdk5l?=
 =?utf-8?Q?f7OVMufZeMCrh3uAo9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b779f5-5569-492b-96b1-08df083dbaa9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:28:52.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao2sUxNtqpEbKegD3i8zDXgcyCdbxdrAh6k++uJPeJkh+NRLUEv84psy5h23JJIug+96brP0JU4kLJMazrZsqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345


On 9/1/26 8:11 AM, Sudeep Holla wrote:
> The platform core invokes a driver's shutdown callback, rather than its
> remove callback, while preparing devices for a normal kexec. Without a
> shutdown callback, the FF-A driver leaves notifications, partition devices,
> and the RX/TX mapping active before the replacement kernel is booted.
>
> Use ffa_remove() for shutdown so the existing cleanup runs before a normal
> kexec and other orderly system shutdowns.
>
> Reported-by: Nat Gurumoorthy <natg@google.com>
> Closes: https://lore.kernel.org/all/20260729162731.1383875-1-natg@google.com/
> Reported-by: Carol L Soto <csoto@nvidia.com>
> Closes: https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com
> Reported-by: Maxi Saparov <masaparov@coreweave.com>
> Closes: https://lore.kernel.org/all/20260826222337.73480-1-maxi.saparov@gmail.com
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>   drivers/firmware/arm_ffa/driver.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 0121bd0a7e01..7f42ffe79f22 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2271,6 +2271,7 @@ static void ffa_remove(struct platform_device *pdev)
>   static struct platform_driver ffa_driver = {
>   	.probe = ffa_probe,
>   	.remove = ffa_remove,
> +	.shutdown = ffa_remove,
>   	.driver = {
>   		.name = FFA_PLATFORM_NAME,
>   	},

Thanks, I tested this solution and it works for me.
Tested-by: Carol L Soto <csoto@nvidia.com>

