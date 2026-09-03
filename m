Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022096.outbound.protection.outlook.com [52.101.101.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BA11E5B9F;
	Thu,  3 Sep 2026 01:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398693; cv=fail; b=I8RWHJXaMqHxEN7wngeHYHGUccGpC+ao18SYnuNLqUMjKM+G3v1zSEzM0HLbJVAE8xQKHW6fbHO/dMo5RkWHdpjdPC9vk3P5b0Qw0LvypQSl6t6LqOU9i2wpChyiwX0UqW4/miipFbPYBqOLu7BcqCOh1jzMTsC8VBBNNFHJBdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398693; c=relaxed/simple;
	bh=Bv1rW09XZlvVAoOKehM4S+VjArmrZNCY+99Pmo2JYLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TZ2Q2U4KoCQ6H1jk6pWjq3bGP7w+JPa+LgKMwAtY/gd7Kci7NKyZVkbOasy7xa1s37fMOH9AqZFeKfKtZ2Z+ivF2KOLiBDC5SOCSU5CnmLR+vmZ+ZGZLs/FZ/7nFlGamkZDImm2kHkt/V+/sAiiaj2G/unsNvJ3IGU2FrDYE4go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSV/heeVE5V1zDuDtzdiLNeHt4URMBmEHgnZgnNlzY2gZdGkmDgmeOSRzqLHJkfpNZdPIAAIhK4wPBCBorCf1wd6TL/XxmBBsqFU+TGq9F8yQKaZjc4x1J5U67MEz9nGLrvZJ+rKbk6ID/eceevS8k+R7egRjrPgX4FbV5lFXbaP8JibbL0/01nFwvUsWGjwJ+bkGdPjYa77M81Q9CahcPTGKdGVz4U8psC06ZOFdKDTxTPB8H3MNKjeOldq++QrSz68zWfgliSmImSKV2iW8Zb0CEQk7zkcZ/RQ6X4BndNGdi8e2Y0Fj9/7IherfLDL5MVbmcHC1SI3mwcgPWZQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=XpvAg3Lybn3JO8U2E5rIgLCCZMLP3hxLNO/ww4XcdsQ=;
 b=hqNptieXF2gODeOf9nWv81bw0r7ew1yudMls3tRs4tlY3YbQ/AL3cQaPKA/OYL6AouXTQqZ38PDNN89En9sxbLutWUnEGOeclMlgnCbRxbRU180JyNor0PYdsm1UzFMkoEEz/OEezyhTKRbBLRdlSriPOaycrRgqlxiKNsDhLBZTIvF6lW5Gj6BjwQMSlt21lF98lkU2IS3jbPOtuAVc5GKPzVaAX6WWpoQSD1ivUDDiDU/UF4bLMJVAtN7thTAUH51gk3v+PhoTLVQBPnbeqEur0rqOCqNhgdmI3FqPIcsKJY7EoZkxe/V3JikpgW9DAlzQmVOshGn9Gw+KoBy8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB6050.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:24:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:24:47 +0000
Date: Wed, 2 Sep 2026 21:24:43 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Message-ID: <gxpcjovnoouqnwoqfp3gsqqzpl5fhnuwornnv6rpmvyailwutk@nfkv7bxx6pfg>
References: <20260902020234.149814-1-atomlin@atomlin.com>
 <20260902020234.149814-3-atomlin@atomlin.com>
 <q763ak7xrotyqmzuu4uwxtk5aec5p4mrdwdtsnq6i5sdtlnm5q@ujq4y6wtztlf>
 <aphZr7bHxvkhBKiX@agluck-desk3>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aphZr7bHxvkhBKiX@agluck-desk3>
X-ClientProxiedBy: BN9PR03CA0454.namprd03.prod.outlook.com
 (2603:10b6:408:139::9) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: d85159b1-890f-40ac-9fed-08df095a2428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TGHkHHaD2BLDlHKR+LmeuiY6f/UCj7Qsg9VWwBXBmxKaTB9/cITNcj/rWs8lTVnocM3j9PkYyCqSFcXBezEhGZElA+NP2u3ME7isHwaeXCg1f0uUqfGWW7nNwTWdx4bL7urV/TEq7BjxP9myLyDCff2mKG+LagkPok2GEfcyoFp0EZZCGGBR7BoHr4KNDgJJR5ZgFDoXM0qQYsZGpZxQPAxF1CR7FxsKDbnSh5sWntL3LEDda+yDcM+z5gtJJPOfT+5Lt4fSMMEfH0gGmnNKbFIf7Aev5ox7frZWBqyO6HaWiV5gcHPDEVwl0idyW4KQLYn5bgnOjc8cFs8QKcsmNz/q87c/57bezOnjFXXyGZyz/2DXsNMMiU4n1rtdS1CM1esA2o6G+7mt0yDqRhB5Yf/ASW/9V9XK388WJOQQM6wGrUB2FyDHycP0noi+vXr2qahXdNYdrmKPHNifLUcFCruiayz0zrngWcXx1ngJHQ0JDxenBEC6QcR+AI9HpXIYtR4e47+BRH+m82QFYKD4KaJE8B6oBbIS7VDYcWOO3l1giknDVUvMaOAZKcVk2Wlf91nsALL8G5JpuXN2odcTHyl8IJ71kVeyCfl8Vrs2WlWK5Lf4kIc2pEwNz/8Qp6O2kP9hI+JxKjeqllL9s+ZVVXNlhVgM/vpL+KkPKN+oWDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5xYThySVJMQmVQbTRIRFp1ZHFWZEpVQ1pZM3l6UnExL2dNOVhmQzJpY1dI?=
 =?utf-8?B?dVZLOGVoYjdKdlFiMHpBK2pYSUhMZkZqVGtkWXpsd2wyS1FaMWsrNWtoOGVH?=
 =?utf-8?B?NVBvcVVVaHh2TjhZSEVSZXUrZFJlZ1J1Z2NwbndoY3FDZExsNFplOGZaYjND?=
 =?utf-8?B?bllGWEJieithOTJuYjBVb04zT2wxT1BoOXF4QXlnVzlrais1N1JUYjdXemZP?=
 =?utf-8?B?czgycWZNQ1RONkV0VU44Yjk3SWtiM3QzTjQ3UE9tTHZaeHlxc21wZnhPWk9r?=
 =?utf-8?B?NXlhVm1EaHlHSkU4alE5ODl6WEV3YjByWUpIM05wRVZQQ3FxN0pCUk8raVpr?=
 =?utf-8?B?Q0RtdkVRc1R6WmJacTVLU01yTElSbEFNUzBqcTdIQlE2L3l4Z3JWSlNmL3NN?=
 =?utf-8?B?TFY5b3RPSkpLQUtMY2o5VFJzZHgwUXlSdmIvNTdVcDJoSmVMdUZIUXBuTWVn?=
 =?utf-8?B?cUxheTI5cjNSMUZHRWJGMmRHQTg1OVc2a1A1QXkwNVJJZTJhV1hNRmpzM2Q4?=
 =?utf-8?B?ZUFrT0tGUElPVDg2T3dNSmN3NzVKVHArL1dXREpFWXBnYWh0OTlOdHBwTUNJ?=
 =?utf-8?B?UnprK3dOT0ZjZ1JpNW9MVE5MeFdoVzFsdDZqa3k0RzZwV1p3NWRNUkRmT1Vi?=
 =?utf-8?B?NTFpVHhDK3ZWenBST3RFdy9JNEVINFMzUmwvUmt5MDBPVWtSaFhhdHBjZ2VY?=
 =?utf-8?B?Umt6ZkZBeXo5NG41UklEa2Z1WjVXZHh0VjhJY0ZDYU8rcTRReEtJZEd2RnBo?=
 =?utf-8?B?L3A0NkhnZGFFQmVBeUVScDk5OWtIUG8ycDVYMjYvS1dOVUN0dXNLQlVHR3I1?=
 =?utf-8?B?dUFPb1Jqckxyd3NGRDhobkxIeldJSjZkR0pBOERwbFVicHJUQyt2NE5oTmVw?=
 =?utf-8?B?dXh2TjFmVy9RNEx5RGVRSVlGQ0hvRm9aeUJ4THNxWHQ0MzNTdTl2bUE5MUk3?=
 =?utf-8?B?TkFnYldMMWw1bHdmUXVQVlhOaGZMN2Y4RVNJbmgram80eTZCZzZsQ1NrZFlI?=
 =?utf-8?B?OFgyVHNYRTl4SVI4QmJuMEp4YmpqMTlxSFh3U3BOZGVOVW1LU0p6M0MwOWdM?=
 =?utf-8?B?S0F0RThDa2tvcS92bEkrY0VET0dyaHdMSWdMWG1OKzNxdjU0QkwrcDFRbGk2?=
 =?utf-8?B?ei9MZUF3N2dldlNpb1owblRQeGpITEhxc3hORTA4QWRIZ2E3amJnKzI0dmsw?=
 =?utf-8?B?YWgzTE5iaUZYMDYwdXVESE5SbGJlRThSaFNkNmxqVlRBa1g2RGRERW5BYzJQ?=
 =?utf-8?B?R0t1ajNGMDR4NnJGL1JQYkV5aGtkYzNqNjV4V2NvM04zOXEzRlpCOXlaaXZu?=
 =?utf-8?B?S3BDaGNmQ3NnSXBjbWkxK0xLdzZEcmwxaStJZmtDNkVWYVVoR3hwREVjOEph?=
 =?utf-8?B?ZS83dkFET05FcEhUaldwUDBmckxIVGYwWUpUSDBlemZTZGVlWlNVZXQ2U3h2?=
 =?utf-8?B?eXRvRFdxNDZIVXRtUFllOEVuM2YzaXlHZU1ZREhrRUozQWVOMTc4S0F3ckN4?=
 =?utf-8?B?UXA5QjFKMWFBTFAyTU03c0V0N29YOG5KTEZJMHZFNlo5VTNieGlTeGpCMURr?=
 =?utf-8?B?UklCUE5ldnVlQlFlY20yV1dSRnpIVVorRi8rUW5UM3hPMXAzQWRIWW82VlI5?=
 =?utf-8?B?SEdYZVNFSExNcTZaWEVHOHpMSkp0Yjh3cVZ4WER6RUJVU2NPMlRCZFFCUHps?=
 =?utf-8?B?YlVCZklwV2lORkZlZ1lPQ0JmQS9vN0M0Smx1SkFtTDloN1dQa05WWjlHcTBY?=
 =?utf-8?B?MzhNOXVtVng0SU9adDltS3JHZ0RCV2t6S0w3NlZtU3ZHbFJuL0pBSTA4eGNB?=
 =?utf-8?B?QUNmVTZLTmMzUEFsMUZjNVdQQ2I2OFlsRk1KZ290bGlsYXRDY3NweDZSQmdx?=
 =?utf-8?B?UndrZCtNYlhiNG40L29DNjZjQWpUWTBTWUgrZHJTOUdzWUNUalFqQ0Y1WXh4?=
 =?utf-8?B?bVZoZlZpWW9uWHJjcG1xWTJtTW5OL2JmWmhjWGQ5by9VZnFvNVlpbnlsZ1dm?=
 =?utf-8?B?T1h2TlY4b2JRME1oTlU4RERSWEFNUFJxVVJITGVBYTBibkhEWHhvWWFqMHIz?=
 =?utf-8?B?NGxaWXp0MzlqMVBNeE5sb0c5MHFUMGhKMGlKREhCVTJFK1hOVTVBMGtNR2w5?=
 =?utf-8?B?M0FhZ1FiY2RRazhpRHhHUXF5bE1SY2Mzb0dFUC9vT0tleVZiOHFkaWd6Y3A2?=
 =?utf-8?B?OWFCOGJneE9lN1J4U2M4bktMTExCVTlCRFI3a3plSVNZWWZhREdjWnVwa2tl?=
 =?utf-8?B?VHRXU0t3U016bVBQdlNZYkt2V2psby9uN3FiTmF1dFp0YXNNVy90MGZUL2x6?=
 =?utf-8?B?NGVUVGJUOTh2TTlsT3hBUC9ZdEpzQzA4THdJdGF0MVdtSERnaWs5QT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85159b1-890f-40ac-9fed-08df095a2428
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:24:47.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dJ2VjnXIkOYQ07qP/dB3QEqqW2prXXJu8uFpaiR/BGbvRrbxCM7LOJrXn6V4gf6w26Qrle7Aainn8u8iO/2MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB6050

On Wed, Sep 02, 2026 at 10:15:27AM -0700, Luck, Tony wrote:
> Hi Aaron,
> 
> You have one small bug. Your check whether mce_poll_banks is empty looks
> at all MAX_NR_BANKS (64). But all Intel systems implement fewer banks,
> and only clear the bits for banks that exist, leaving some upper bits
> set in the bitmask.
> 
> This means the timer keeps running.
> 
> Please send a v3 with the updates to the commit message listed above,
> and with the change below folded into your change.
> 
> Thanks
> 
> -Tony

Hi Tony,

Indeed, since mce_poll_banks is initialised to ~0UL across all
MAX_NR_BANKS, the unimplemented upper bits above mce_num_banks remained
set, preventing bitmap_empty() from ever returning true.

    DEFINE_PER_CPU(mce_banks_t, mce_poll_banks) = {
        [0 ... BITS_TO_LONGS(MAX_NR_BANKS)-1] = ~0UL
    };

I will send out the v3 series shortly. Thank you.

Kind regards,
-- 
Aaron Tomlin
