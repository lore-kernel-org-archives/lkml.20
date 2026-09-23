Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B126581220
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202064; cv=fail; b=ZTHWW3B0pG7z1yP/44PKWjNXvNTUqkJkmhj46sWPbErPqti9X+1v9f5qvNtPlqVuOR3qgnGThkkbVzP87VESy7hfCYFnMj4IV25/taenVqL4McFkf4caw9yCMRzWXf0QTmTPUr8DfTXeGTHijuEttYbhMu1mfxX2OJqfSJs+rW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202064; c=relaxed/simple;
	bh=ukwytGHLp4xwjCUl1fQIhxo+I/tziLbswCt49XRActk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hYcYmk2jf36FMbQGnWVfsOti0V0TR8971JndI/bAA6/hhL/tNh22NNEmgRqKE9aoPvQb3IFq/eqSShh7QWkKrCcg7mRuyNU4WnN4D54ljVWTsGOV80HnmipJ76PkoH+g8HgbKG0OucXn5AYFd9m8veahgfb4vjc2kyh4sh7tEAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sV+YpgCS; arc=fail smtp.client-ip=52.101.53.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sV+YpgCS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYXVmIyu3qOOaklVD0joa9eeDNzywd5W1BwLi77gpsPXKfiqkgDka/MJIHe2umi8LAW+/lTzXf7SbaYuSYvKgZZWg+MsWCY+yZRuHBB/HmtOlORrNUvp9ZRgM6QX6A+yg37dgqqmEurgNdak2B5ctZdELA64/K4zL+/mZJEHrSDaIhTEsTw+c1s6gcTTsamtocNF0LNxdwhP6so2U5N2n6WFfvqaNFhiBl2KQTqjGXv9IOivThi1K4IvTO368N4LitdPmU/67la0NiNwJv3+7yXRaPuqopwzp196noWwyzhB1KqyJevBTp0g2aUOgab0u3xvgBAp8SVg8wONxiHFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zipT3MM9Ee6OGz/yUbrox25/NqcxCZLg4MVzcO3xU+o=;
 b=lK13d8uSkHVDzkZqEtmc9z7y71Du0vYAeiQDGfyrlSI4OdfdQBrtGtXRbveC8hwxZzih7jAEuIT6dST0wxP6WfXngeDTWWPV2+NDJeFVISKn3e9wvP/UnEwW8nzMrgxtkCO18Kvfqd0R18RUxep8m7vx2wqvLxp9DzMRSXqs30mpsTBbFBDXYEaM1O4ZUZgU24LqGk1RcB+DgUG26GDqGsHupQchVkPpd8qWc6wBgTYGxrfT/HTCTcBvUcgjxOm0hKY9Pj/y52YNuZCSMVc7Obxb7bKqcG+VkQDKwPGIVD4lBV2Gg4Z/Km/Ly+hPmfDuu2LG7RJSFrGRSZogO9ravw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zipT3MM9Ee6OGz/yUbrox25/NqcxCZLg4MVzcO3xU+o=;
 b=sV+YpgCSOkc6FaCgzxQ0B6DSZGuowzn52h55q/icIUti1jEGeNwWksSQjJ1U6jhZdi3jWLkgk0RTEDpuETC+0jz0f6PxYgFSOinxdijvMNcOtg9mnIir7bgDXYAQT3W87Vs523m405KKUSpQSYLRD+i88vYxhw/OLmK33vjvLcQ4/SbcmDRToeU8ni7yh/VgsJ7woEm8jP6seIVOzwiHaQ4zw0dxI802j6ixMNPya5el+xNReJT4LA3AImAOSMQpcJVVQ++3MiLufEGddV9stB8zf1Wb6Y1bOo9+Df6Ia9/6alPmydgmXgxdSmO1OYApFuX6TC+EJHlxUrgM6Eh8SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 22:20:58 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 22:20:58 +0000
Date: Wed, 23 Sep 2026 18:20:55 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Janani Sunil <janani.sunil@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bitfield: Restore be16_replace_bits()
Message-ID: <arRQswv-zAzN3FdV@yury>
References: <20260923-bitfield-be16_replace_bits-v1-1-71b6388b8385@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-bitfield-be16_replace_bits-v1-1-71b6388b8385@kernel.org>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 429182a1-293b-41ae-2627-08df19c0f147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XyCQBEKDnhkyK4D5E8PykzCx0pD1mQPH1em+hsW/rsG3egZMvHaq6HloKTSrneu69TMrXCGcVcua904mlGYa2oGE0EFywgXBG1kVHuK42/VnwiMnNifZCwXZooIdfAb9mSuZOORPuiXuMVq4XLbRc3nguLZXLfHXJuVUs1pUslr+R9tBfefnMW102K1cMwwLSDgCytqMgJvKTxwXouR+6e++wsJr9iPbJgArsy00s3obNwYZVVj0bBoL/xOMNQqDEDxFmam7C8Mm22S83tYqRbGrojCfbrrlj41+7ATtJ3YnvpNiaTOjWMIeuNbd9rTSHXP4jYXweYD3n5zWL0bTb5csTkwUDDbDNHNyKkPVocdkOqTkrBZv//zV3o/kravp0Kbq+e2O0xL9/c9RWrIDk19ofO6ZGCBiH9LIpRidiWxOtasJ3y8Y53qdRe3BZ7ninJMBic7rXyYD4mO4cRW8XxyoZW8MB5ancTH5O68VCaMHlThvk38khmYtO1lNPjJuh2E4FEHYQci/DQEoClIOxM4gvTkSn6/4X+yR2oAwuA/bMQSXQw3hRNSoywfmw2Va4KEepYidJQuBkanBNUyfV/sPrGZ3FnOTdZOEj0XE0TgOaELktrg1FaH1i7eeOuqgRG2VrFJrxvNaXG70c4rshaUwTyB/XwPeXBzk+Wdb1Dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qh1iTza5q7hEUQZY6Gp+Pg6/4csDM/q1JzWrQwu1aytlaBAg3M3YdOdNEHZ5?=
 =?us-ascii?Q?kL6ynhxb22RGtDxlcZ7X368SIioDvwtvPRKBnNvOsgDMz+JdV7IFUM3lrN8t?=
 =?us-ascii?Q?T3tEYxDRfrXQ6TbN0NRy6sMZl7XJu77pHVFMA/FSIpvwVQrcOE9qUZkuNXfz?=
 =?us-ascii?Q?iRxkF/jp2/2hD59FeY9wXBY+8EcBwBkWcSJV12rMpNNGbxSM8zziR8PPM2O/?=
 =?us-ascii?Q?FpAo1XpqCQTBus25I+N/1Fnvoc8kLyekkwO6KXs0/y9hMO24ekZo1boyBlxS?=
 =?us-ascii?Q?NwgHBE1ASdoPIvq0JPY90P19jWXbZkeEWh1f7hAvKoZ4Pq0eLB7f+dw4wOol?=
 =?us-ascii?Q?OMfDkj0PeiiGI3oB3iof5jucJOfWrn+OUCzLtEv5kMgm5lm68kFYT3u9bI/N?=
 =?us-ascii?Q?CoIphZkNvmTbx6GuD4daMh/kZMlqh+baDyuraef6mP94rC4Ld2oUlhVlDbJ6?=
 =?us-ascii?Q?Q48GZwCpE4Qq+A7EQXw1NpS0PQNMT0toYo2ZME11N1XCcndpmUG2332BY8ZV?=
 =?us-ascii?Q?YvwcK0n1jXjq3gDYQp/n+53YKbThG020N4vWxKmpy0jmoH3tpJ5bjP3QM7jz?=
 =?us-ascii?Q?XzBwOxC0gShd6u6dZm8N20oJqIgzmSC1h5w4qbWUBLw7xLr+62zAhrBkO0ZE?=
 =?us-ascii?Q?pd5u+7uXwT25YZ8UgOdLxmHuZYu6eJpXayyyVdEIhIhtoKV2HiA2Ok6ZZBkl?=
 =?us-ascii?Q?Q0unb3+APzSGYoist6ZeQ1RiJI/wjOVfU7IkwXjs0GvvoMzTwhLn6BEJQMXP?=
 =?us-ascii?Q?cekHsxqdCyreBfP1NLIMgbnpJHHADSNJrTosmDcgOknjI53oR6qCTYqOzIo8?=
 =?us-ascii?Q?zK3Z/uJBZiNZeSx0s52AcbrFN/neLx/bvoFlIMxoyLRuPVdJP5wXqzCrSy24?=
 =?us-ascii?Q?r9e3nF7Sz17zlIdBacJbPhWyARKTOQPWGGzjIgxigNMDfB3DTeSJYS2oyoWg?=
 =?us-ascii?Q?5rZM9eDIq8SPum0vpGBq+a9zIDB44DAbeVSqeP4ZpLclgLaBcGNSW332oQF8?=
 =?us-ascii?Q?I09dhsQ2wIHib/u8vNLtJPjkAf8AZyWkIJlvFGgg2Zz2oF70JrEBLSaqj/MZ?=
 =?us-ascii?Q?QOjq0yx63Houu0j/xQM2oaq/YhozwqmQxSVSGrFRppi4xg/WFN9vfIZkGKnG?=
 =?us-ascii?Q?s1H0Zb45kVszHGTxCCXBPJ2odILpW7aWMg9TfW0HN84lF8OkgHiS9FK3lZ5P?=
 =?us-ascii?Q?+3GhZd2hb4KkYPKg+F4/SQORM/dRMnLTNNVcCwt99Z/0Rx5lX6jeID5NXPBg?=
 =?us-ascii?Q?1X3sl3OU7ckVYBNtzIV/whz7PBmesBio5gZGXeQtQRv9NW/WYTHgWr0qzxkb?=
 =?us-ascii?Q?X6DZ/b9EOPbTTuU6hkoA7YGKXR9Qr4FeAmI8/V7d4Z335GUhPiL2QPMCTP6L?=
 =?us-ascii?Q?llMaU/Q5QKT1QXazKMBRt+2K2VFj060ejlN1QNb3CVQVhJ0XMUOVM+CBOFV6?=
 =?us-ascii?Q?cajkWqquh5F6DKSPOnwpKtq2VltIZsPiyTYkCifkzE95tkqclSSxyJc7JwtT?=
 =?us-ascii?Q?GjSXwVaaCoHaA3P0K83ukDf7ErWBkPYhn5Fp9ci2fI7mCWlkERijzvLVlAok?=
 =?us-ascii?Q?q0cprO5xHuAsHOFCEAww8yhRmMysO+MSEMdlAz6CJuTPP9WDlkBEE/sCKSi+?=
 =?us-ascii?Q?zpsnlpsnfZ3UV32RFHHAIaWT55KJnK0jaMYHMkxaid7g7B28wtCXzhsM2KyU?=
 =?us-ascii?Q?MJUG4g5/NSdKeYWV/7Yv/XtACxKJ0qdBZHZnAPnBxcuvix3Yzemt9fjRHqXb?=
 =?us-ascii?Q?Ec5uEdcEuw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429182a1-293b-41ae-2627-08df19c0f147
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 22:20:58.4985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvP+vDZg0iMHqKQ4WitTCSi3KRowpVPX+gHcIdbKVsH67zbqA36ZM0a8+MXRzR4u11vjArzd9/C65nYmTgV87g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299

On Wed, Sep 23, 2026 at 11:09:53PM +0100, Mark Brown wrote:
> Commit 1c88ceb09d5e5 ("bitfield: get rid of __MAKE_OP machinery")
> removed a bunch of unused bitfield operations including
> be16_replace_bits() but commit 508bdb4938928 ("iio: adc: Add AD7768 and
> AD7768-4 core support") introduces a new user.  Restore the function so
> the build still works once both branches are merged.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied, thanks!

> ---
>  include/linux/bitfield-fix-width.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/bitfield-fix-width.h b/include/linux/bitfield-fix-width.h
> index fba86bb76999..f73b8cd65601 100644
> --- a/include/linux/bitfield-fix-width.h
> +++ b/include/linux/bitfield-fix-width.h
> @@ -93,6 +93,12 @@ u16 be16_get_bits(__be16 v, u16 field)
>  	return (be16_to_cpu(v) & field) / field_multiplier(field);
>  }
>  
> +static __always_inline __must_check
> +__be16 be16_replace_bits(__be16 old, u16 val, u16 field)
> +{
> +	return (old & ~cpu_to_be16(field)) | be16_encode_bits(val, field);
> +}
> +
>  static __always_inline __must_check
>  __u16 u16_encode_bits(u16 v, u16 field)
>  {
> 
> ---
> base-commit: 1c88ceb09d5e5506456a625043bc9b35ce86fc41
> change-id: 20260923-bitfield-be16_replace_bits-1d6c48fb608b
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
