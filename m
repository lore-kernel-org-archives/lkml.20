Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793289147;
	b=5KXj+FQkDimV0RB+pk83YEFXnh9lBhLJanbG/0zmOivxUNz0q1+5e1UHCsf7ELT26cey
	 QbC3EBf/r9EIU/fWTvUkzYZ0cNcIHHDaJ96MftWSVsSZc1c17fDlyF/uFruvi0M0xXaCz
	 aYnwJFn/00LIVPaA44gksQ5zybkkELdAh+kVVm2ELpJih6v3OZJj7cilNsfgYNg3dbeuO
	 X9nyCPiO3SLETU/8HEZ6N09O7jRUvNw9EtrNDb0k/qAg9Eh4ykUJ7ccP3vp3bPTEczta+
	 otMdvCXwNfiMJwGpHD0e1jqPzNlSRjZAj1xPQbB0vBcjXMuJv9W1IlVmw7KtMGuHiKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289147;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+HKPyTEsJX6AOPeoq+BHNtlsWhpVnNqDDOTzjsS4d0U=;
	b=VZm/VbjWToDF9CyhV7UdiOUjg3lVySRVEO8DnKic4Rq6ZhG1o/miHSSZpcnQTF4wcB9W
	 RvxGaZR+3iL6XzdfmKfw9Lh9hckhWbGqIPsTN3ugStQXUXhTNgaSxWiGyYultOoPDwxgX
	 CQWf1QTtdhQDWvGr6JUl9qU+v8U/V8w2BRbVp12Jh5amXcAf4WRsBVP4rCznD+3nFZpjt
	 ZcJ9GUpJGJMx+h9xNz6+7d4DceG7FXaBi/IJqoRNAJYUW1vPSNuaOXSJtFLIpF4IvMbSx
	 fUIBXc/hgtziO8FYoqOb81sH+VP0yr4buq+UOZ1WFBAKLjxxOaXSJZIP658AGaRXV9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="r/N536p1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.47
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r/N536p1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJseHfX3BbnFlgQqc/iWY7c22uq3GSjnq4A4ui/OFGbTBMZ+uwlweV541Y9In1BQX507fqQZqZ3W1RKp7cF709K/ACXMMXFuvdrHXcZkuP8mSXvZ9BnxSXjjwvfzLfRZbT2nqegzBAEzHUztfdOtYbHkFMcaAz6KBjR401zayNEUadK33JiFhBvisuZdxC9uuK6n4nF8LlVhhIC7jA9yyoyDNjDxgX5Ihi5xTJ7gRJq4XU7s4ljC29Z1VUSS6upXy56RYLETna4lYUT5vVl+6u2wBSo/AsL26F1PNyT3pi5mxUxolWFHSjfPwIPUne3ZhdFyEm14NpQM+8dLybxAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HKPyTEsJX6AOPeoq+BHNtlsWhpVnNqDDOTzjsS4d0U=;
 b=B8BboxwtdS2LOxs/AANAfrj4dA9mbAan6hCO8gfTM6oGDk+WqEM5jmReuhWaf/LyZKbXrMBs0mUC0rAe2fkFSLHzvONWCJPKMLM3XKxrLa44+HZewI+RZSLiFRDlhN09505apHiugGSdTk9cOs5EKpyFe4050ddavTIGFhuKcycRJTYw7bECEp3T7IekpeVmpp8qyGEtzCPA80D6xlOuJgQTBz1mCkQ+p66yGT+glk7blXNbEgCuXNvdb72jfBubRERMG0rSaf4ZjlvfxYoxlkfuF8Fqo2ygvCmd3VN5vkqR4HuUN3ij+C6n1MrMaZs4KkI7TU03r5X4uzADfrOVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HKPyTEsJX6AOPeoq+BHNtlsWhpVnNqDDOTzjsS4d0U=;
 b=r/N536p1tHgzwQKTEzX0MUDLfG0ehMNc76VDIEwKydQL1xXTLFILRBMrB32mdisq0iLBksAoIgyNoipt3Pm3j11xIiiKfUGvTVsCTVp3KCDI1Fuu6ZbFhgkAQyFEVqgDEjNB11VUt3cvIfwujbx0W2aTOq7p04MnUo9Hlc2/CJ0Slp48XUQPa9BqCWX0bE59qXwl98g8GFZBk2wIxSqBRcBIGYISN9yWT0gI3AMNLjubTudWRzkMloIJZKYzAVhmTbTbEkmgl/nXAZVxpLTPm2BW1zzygGwM4G0bPwyssEBvaXTSZJyJakaHJKrOW3GVlBxhJdElZtX3JraDd7G/RQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10704.eurprd04.prod.outlook.com (2603:10a6:150:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 15:52:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 15:52:22 +0000
Date: Thu, 29 Oct 2026 11:52:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/31] accel: ethosu: Fix probe error cleanup
Message-ID: <auNrrlOyKRzSp6vv@lizhi-Precision-Tower-5810>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
 <20261029-ethosu-fixes-v4-3-4aa25e22578e@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-ethosu-fixes-v4-3-4aa25e22578e@kernel.org>
X-ClientProxiedBy: PH0PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:510:e::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10704:EE_
X-MS-Office365-Filtering-Correlation-Id: 525da5f2-13a1-4ca7-b986-08df35d49ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|4143699003|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KRHAlQQ3CW9cmIhZhRx8Cs6MxJv0O/w6PkZ8RJkr8HhFwRIbh6+F14FsOfjK4YizYJBWcM7n3HVzW0jh0GsCRoXPjIocd0CgnuZTn2r5tZVrXHijDnNfGtcnAJfiHPBpj/YkhWwyEzgPJ5ijkQvY4cr0fK76r+5xHkUWW67dn2+WX6sU9hkV0K7MhbXCJrmr/Xlg/4exe2Q0DCY+NlK6c94G5f2xpO5wpKkpidozVd8x5qQlKbUnWZcJCubdEho1K+wFghYGmIoJeXufHhJN7UU9m4mQUKNrLxF0Wj7V0JsalC+/KkLtfN/gsCKAEM+0gSZuVjTyv3IBLzirVbScu8M+y2o3EEXWf5lePggzGGSFqnchd4IKvTq33oXCZt0MKRguS40+Fr90nnvg2H2UT4qoqwH0QWK5hh8YETIVNro1OrOLNRGb+QHGH7OfyEZ0id8utzGQaiwsU1lhS/BOZpdRXtvtKsjrwr3Er4fWILHHyqICRHWzc7g30Ka4z/wwZ8b3+S81XYcT1PYSo5BpZyHqZXMi9n1/rEi5yrIAoRmv0+OqG3TDKkwJwfP8dakfQlXEG9rK0FjPeXGYHZQiEV/SmO4/j5Sz3WZb6l5ic8cWp+vIiGz2aAgWZVYi49nEku4FEbrU1HKL9GzvJ2pEM/ZgV12JUutnh4vO1p03Zvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HsOp2ug1tAwmxM6L/PQY+TzBm9/grHcbicgzqw3g8T1Xtnb929pJ5Il8oFS7?=
 =?us-ascii?Q?byOOwcGOqpWVKhu6/4z28Jn7jdWvd3EkzfNvFKc7lhkSVTixl3s4YI7o7606?=
 =?us-ascii?Q?KJQZEeTw+6uJG0s7xbH1O08ewsPVMjxdztJFfP/c9r6RfsdwMcdYsAAh4q5o?=
 =?us-ascii?Q?h5SkESYtX+8FGLINjXedYReZWHnGgCl8epgxys/ps5BqX0oYMT0ZapqITLuj?=
 =?us-ascii?Q?8JT9bpS7ihFvesAZ1vNVfH2d59ih3bSdWd0pql0YpggZQ3JafHYiL1qKMyJs?=
 =?us-ascii?Q?FKXqaKGGtybZCKmG67idtR3aPztNAm48Gf0mVcngb7YlWrfavQSXr6lgyWkV?=
 =?us-ascii?Q?/LUxsdSRV9CNic37Y+mineN5tv3MM8HzpFf2OrlrUpYfgggcU3/3nRWDrrpg?=
 =?us-ascii?Q?NLnupMoiBQR80RU4Tcs+V6aWmRTxd7GQ0NyM8FkiGX6069+mTeHUFFGl2b74?=
 =?us-ascii?Q?gXazzrW14Xtb9bj1tEee9HALAMM1cDcwTeMC9J/PlKiYnYB6b991gwOAPP9W?=
 =?us-ascii?Q?tMLTiGQmd3MIuP8M5sMIiL29u1GTWoTIS0aBUIoreLv0BXsn8spvamWC4RxH?=
 =?us-ascii?Q?hTSuxz0+W+jG/jxt2sKlR2BT9Pb6X1KWQgfym0aTpr7VZjS9KNg/um1/PicP?=
 =?us-ascii?Q?V3rlXWQmJHpB8+PYUSD4z0nMoz+49oelrqfkhtjV1gKtSu4cSAs1AAkV1duO?=
 =?us-ascii?Q?dPeL3qDUHH371g3ayE6wrqPqWWP85F41/L4N4U7nFCrBUKG+LiqCp+hcY6Ew?=
 =?us-ascii?Q?MGQYYMvf0KGSBGrncQwdhPHII/HLBIF/6MEH/CeSfGDBiAf8pdHZOGpDTHip?=
 =?us-ascii?Q?ce7/NtEFHgFVRB/4BM7XTw2zFu0yxIoJm4vcksjZfmr6mlvTDWoMW1NZWsXK?=
 =?us-ascii?Q?B4Vb0lSNKYxS7INq9N/ZddmlJQ1IoQaZ39f61rF3w71SJEDjlKEEKc4hDcBk?=
 =?us-ascii?Q?VLidzoLCrk/ve8aCkfblS9xQyAZSG6zAqg8tavfQ5rI9GeB4A4V2aLX3sPCs?=
 =?us-ascii?Q?eJQTPQDaxBKX1VYhMkoYCPm+t9Zxz2kxNdJCvph0seeOVjCxBQWddH0/A7Bm?=
 =?us-ascii?Q?3xAzFqVWab8Vq2woEgvxSr/H8XBr/TOhq4Ir6x6ewST3An4kMvolCt4h2TXe?=
 =?us-ascii?Q?ilnA/hSLhxMJPsqBN9973O/0FYPVWbJj+ET4TFbOc9WZCIC3Gmnhl8gMxm05?=
 =?us-ascii?Q?+i+psBR6VPtFX4RC4fqTjT/lw06Z+mOscdEeVS4U15y1/3N5BVDx19D1l41z?=
 =?us-ascii?Q?fOHdxaS9UMl0ZWF7WePqRnExYAK7pTn0lHROlKOxN4DLrTWVsxhfNkXBA1nS?=
 =?us-ascii?Q?BSO74yJOlifSUCMDvnRH2UA+aiKahwd8hLIt7O99P8VBemJHADJA2hPFhrD8?=
 =?us-ascii?Q?qbV3EpChC6IXTt0bRWqDj6++1iWjZcXhF+X1r0huMQrGf/n5i8jCHgZDFznF?=
 =?us-ascii?Q?zXBaLHDdU/6FYLlz3DSQAwBXb3GgXxduQYTAgQaBKJ/nVFEuCk63D0h0vPh3?=
 =?us-ascii?Q?MyB1WL+d74ttnWASkyy72nrPNn5nfdSTvv/Z+Tze6IA6RPtuXMOnDObni98B?=
 =?us-ascii?Q?b0s3gI+a2lLk1B5zVcMEGmo9pWugs0rltiPymCxt93cTe72KKjsdNN8Odwzx?=
 =?us-ascii?Q?YXEBv7QzuNFcVEPONSbMMmINYgO262kx6K952eH7kN/7lLtyJ2PDJ4etzSKe?=
 =?us-ascii?Q?sjVyjRKA6U8CqO1mAH7IymBpj8DBrCnKO8JQurrenWkeDwJLQWxwDRCdeUYZ?=
 =?us-ascii?Q?7m+Y73MRUYE7+ge64V9mftmPKLA4qi9V1mEkA63ec50P/N0lKCvk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525da5f2-13a1-4ca7-b986-08df35d49ec9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 15:52:22.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2PWpOWHnQ6cUmKvRbg16o4+hCivXhi3Qm/KcLNpWkePcWhD5TcQX7JyZfgHPEvCO9C+b1vWosR1ZRSqv11xU65MRAxliHg839hbMud1w/HIdXbCo5JRqyo8WIRw6gXL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10704

On Thu, Oct 29, 2026 at 08:35:50AM -0500, Rob Herring (Arm) wrote:
> Once the job scheduler has been initialized, failures from ethosu_init()
> or drm_dev_register() return from probe without tearing it down. The
> registration failure also leaves the SRAM-pool allocation in use, because
> the platform remove callback is not called after a failed probe.
>
> Unwind the initialized resources on both paths. Also do not call
> drm_sched_fini() after a failed drm_sched_init(): the scheduler initializer
> already unwinds its partial setup, while drm_sched_fini() requires a
> successfully initialized scheduler.
>
> Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Adjust for previous patch reworking runtime-PM suspend
> ---
>  drivers/accel/ethosu/ethosu_drv.c | 13 ++++++++++++-
>  drivers/accel/ethosu/ethosu_job.c |  6 +-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
> index ae7ebf29cb2f..9ee144c41550 100644
> --- a/drivers/accel/ethosu/ethosu_drv.c
> +++ b/drivers/accel/ethosu/ethosu_drv.c
> @@ -375,9 +375,20 @@ static int ethosu_probe(struct platform_device *pdev)
>
>  	ret = ethosu_init(ethosudev);
>  	if (ret)
> -		return ret;
> +		goto err_job_fini;
>
>  	ret = drm_dev_register(&ethosudev->base, 0);
> +	if (ret)
> +		goto err_sram_free;
> +
> +	return 0;
> +
> +err_sram_free:
> +	if (ethosudev->sram)
> +		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
> +			      ethosudev->npu_info.sram_size);

Does worth add devm_gen_pool_dma_alloc()?

Frank

> +err_job_fini:
> +	ethosu_job_fini(ethosudev);
>  	return ret;
>  }
>
> diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
> index d656b3ec670e..b7faa715b47e 100644
> --- a/drivers/accel/ethosu/ethosu_job.c
> +++ b/drivers/accel/ethosu/ethosu_job.c
> @@ -353,14 +353,10 @@ int ethosu_job_init(struct ethosu_device *edev)
>  	ret = drm_sched_init(&edev->sched, &args);
>  	if (ret) {
>  		dev_err(dev, "Failed to create scheduler: %d\n", ret);
> -		goto err_sched;
> +		return ret;
>  	}
>
>  	return 0;
> -
> -err_sched:
> -	drm_sched_fini(&edev->sched);
> -	return ret;
>  }
>
>  void ethosu_job_fini(struct ethosu_device *dev)
>
> --
> 2.53.0
>
