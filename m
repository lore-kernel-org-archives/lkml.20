Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCD4266B8;
	Mon, 14 Sep 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380813; cv=fail; b=IxuVqshDTNbDq8Kyv2DOO4Kjl9/VCrBTf2jOncayXS1IVzBqIJs06ULeqMOh4itRhEOYFFEkIjnuVnIffNgfz+Uw1umRxTCVt3jl/dihpW4tlYpDkUkUGUstPq5HIOuJ3ObSmiJRXd75UfI8ZcqzqYPKfrs0iGYPxucn09TMlDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380813; c=relaxed/simple;
	bh=UvafRSwWJzSYN4zg9xEISHBpIeo3AAh969DLFdJwG8s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ARNk0Sv77rJszvzwaN901KNDHVcPsAHQdk5oJ3KJd+Ii75RAXv8OU+x85MF6lwB9KnFVa0jPgeOdWr/lnEXB/OfZpmBtl6fZHBi5cWjBTO2HB4JXsEJexyyAGxC245GcZRk9GVDdWHwX8gF/Oz50XMPPP+zoD2WJ4JIsTgnkJM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bD9ir+0P; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bD9ir+0P"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9m8Gb3782640;
	Mon, 14 Sep 2026 06:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8OABS
	C1uqp0RQClj8pPbSQBi9p+O/5xZV9M54A/gJyM=; b=bD9ir+0P1pZLp4JzSKryi
	E6Slm3TwyAOkswPFlASfx1FNpvQFWPJ28wZPII4AEiVhKX2f+u8up4btSuFhcHkK
	DxZMVYwE+cqqa+zeSuG0of9490IdNLqDlFeWpP8azG7XBRqX3hL4+u+nDInVcfLq
	vfq1IGW0gG96CVdFmtkOa6H1I6Z31GrWt83AK6sIsw4gf6lDGtIsi//rzFmrW/ao
	Jk5ZDBxI83xXzWy1mjs9VexfORA1PFBlJT32tzEQiuQm/FRGLj85SUEjowX7an5e
	w7PnRkMbebsNiK7x6OLrWtSFxcL+W8y7KFHRYOefnkm8pSETgpbIU4blytu0pqAJ
	w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013054.outbound.protection.outlook.com [40.107.201.54])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gn3c45fc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 06:12:50 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGepAflsj7SkEXaLGfwBP4lTR/9ENqwaXYlenlq+tfPYawGIS5+csYRjmBtN7rdygopHyFVMa3uYyYBrp/0FIQ4b0EGVFrXXI++jVpHh3wuQWTHI3VN5T233JzuTUjyR8BPF+CuUyfAfee9Qld9IW8BwB9XyhDlmbpkYNCQQuzhAZeg6zp9UKvagtBpG+xm4SRr3FxaPUMj7zQM1iu6awXOrkI6uTWH9iXytjarnEljZiqgH910Xo8BNP3iBAO/KIyj+IW5uh9cUSvOEuBML5AZqiV5Pkl5G63uF1vlJI5BaybG9K4qJ/AdvQHqoIUWOj4neFGn7Q5edaZ1/nZoTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OABSC1uqp0RQClj8pPbSQBi9p+O/5xZV9M54A/gJyM=;
 b=D44IeJ+Ow+KKux8cC6AaQGsvnRuex76qKRoDNOuf/yyC+Oe4Y8KjSky1JbHMwBBULjX2mGMomof6vJk+H2fgsoG+2hquykAKE2Nh6oqZD/lUx/wJsJRBjbC1rjkk6Wcue2JqG7LPmJf7263mAgR4lF8UFdfgj+hhTLuS71f7Q2x7SY9zm5MRKstEwiHDzn2B2S1pZdtMM2QNr1Ofl/xxDndSdtu5IaHWPxzlGDc8zdoF5c3J8sG+hBE/tFlveL0Lk4bN3Gb03pK5uWP+LJUwxF01MZNi3GnIvkHfyciZy6QpxMkZ3unE5slHW+dRIwdv9CMnomGFGQmUBLL4V662+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS7PR03MB8243.namprd03.prod.outlook.com (2603:10b6:8:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:12:49 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:12:49 +0000
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Date: Mon, 14 Sep 2026 12:12:35 +0200
Subject: [PATCH 1/3] ASoC: adau1977: make the Kconfig symbols user
 selectable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-asoc-adau1977-fixes-v1-1-aa2f0cabd728@analog.com>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CPAP307CA0011.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::8)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS7PR03MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c07447c-c015-4391-339c-08df1248bb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hgqS4B3OXSixFnaBsIk7s5ipNqVXi0xtaeBdlWNUeEP3gG0H9BKDjGZhJtiuUikQFaG/YW4bKRwcsGCmq/LJYMNwuD6o3HmiaJfcdL7wdEx0LsMgWldhbvQ38YCFR5XPMQimjm2PJxow2NDzv4ZeXqtbFC6psz8FPGmESKnx6pMki3DjxebhOMhc4qqdgMlC8U6eibUIavj8jg9tMQr3fKFO9vgPWwMUQbw+XT/g9rqE6xV9CQsAs4NDoH7ybouij8yAwpDQZfyXStyFc5xdU3hIUI+QAHyAYDAF6I57kfx0zeQ1KFnPqrgJ8gta3BMWQchEjo5OpY8Vysv2kDNkkVUYEuw8P4b3ubpg7lVLGsovc3mXrGWr0MZzRJoS155ZQHwQ8ppco6fj/QY0lnSkZ1E43zFsNDn2wJqIidQXviKY5URmyJd2o8hOu4x+O4YWxURqc1jakt31hsH0lx9vrNI858XnCqMsnhORQZv9q/yeBXE6cNH0NQ/9Du+W2BOFwl3D0W9ih5a51oBNLVteXyW5CVu2yd9QJ+UY5eD4/DqxavUitLSUQDyD/Nzmqq+iXW+ydLJs1fh7bnhaN2KgMJcRt6nf7i53WPcG1OdnqDXyV42osD7pr25jcN8peOHWS/SrEdAYFrQd1SLeahqgHkwVagk6rZYUT1NGowfFN6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTNPM0xYN2NzUWdtc0tBdEFSS2dJNUVHR2lmd3YzbTBHQmdyUTExQm51L05N?=
 =?utf-8?B?NUljQm5lT2tvRnd4K3lLamJiU2pWQUM2a3VmcHZKUXNtQXQ5Yk1EOS9mNC9X?=
 =?utf-8?B?aVBBN0VmYjJRZWtMZk5JNkpDMWc3SDRGNnJPck5iM2VuT0FJdk5FOFY4Z25s?=
 =?utf-8?B?YzU3amlHWWpaYXhvb29kb2hSeUk0RjlGdGJCRGtUYUxqSFZjbzBibXF3aUZK?=
 =?utf-8?B?WE5UUk41SUZpU2VKR2c5ZHluMDVXVmRJRzRZNGtUbzlFM1QyRjNRU1VITytv?=
 =?utf-8?B?N2RzUXZPcUFvdXBPQ2U1cXd5bHc0dXI2UWcrM2pvOFNvWUJHMGNkMjhCcUta?=
 =?utf-8?B?UVlpOWRJd3RlenlBTk40Y2xvcmNVVUlPYUVuTVlNVTMyRHBOc0EybmdpbEJm?=
 =?utf-8?B?QWpRZktVeU45RGloQ1JtTVpiUWJDY1YzRitwN1IxQ1UvMmsrZmRoOEZhYmht?=
 =?utf-8?B?bzlpSGx1eHFWNUFoVVZzUTZZQ1hjaG9VZDBKbmhOeDdxdFFaSklZVWNLY3lP?=
 =?utf-8?B?TGJxSFFmeWJ0YVJmdXlPL3h6V0J3Tzg2SVZzQWtQdDN5dzEzUmNFbkdMMUhn?=
 =?utf-8?B?UDNuaWE2SXY0OS83RHg3eW9rYXc0VnQrMjZjeVdrRVBnSGVkUm5BOTN5bVlk?=
 =?utf-8?B?RGY3dUpUZG85bUxqYTgzTW5IaVQ3T1c0MHJkSHRIbGsyejVoZUY2bDF1N1hu?=
 =?utf-8?B?eDJvZng5Uzl3SHVWTXhna1YzTnhDZVRVNVlZMGRKNVJpcmphSm9uNzBpSW5z?=
 =?utf-8?B?MHBlY245Z1ZpMkxHZzhBODVzdVozUCtxdm1HNXA1Sk9jTHgzdU96V2tVdFNh?=
 =?utf-8?B?NTJKVjF1azBZVWtPcUQrSkVrNnhVUjhjQkdQdGtZL2luclF0VW5LV0NiVDlo?=
 =?utf-8?B?aFFidko0bzJQdklTVnpxM2E3OEkyckxuZmFoRHlKdVVPbVhHQURFdzRpVXVk?=
 =?utf-8?B?MnVUV1hITnZ2R0NzcGhsd1owR1R1Q2EraUFNN1Y5RjZrMFNLSy9DMDdQWkNU?=
 =?utf-8?B?M1BKejlkaGNIRERFUmYwZVBhQm1ob0p0cUQ1YytqTkdnc2NtL1ZqYm1mY0pp?=
 =?utf-8?B?LzZ1bWwrVDB3RXRheFdTWlBtS0QxMGhQNktNWHZ2UUcrRkVLSXJwZmFxblF6?=
 =?utf-8?B?VmF5SWp5S3daY1grZUg5TSsvTmwzbWhUVGczdFZaTXZudEhTVElVTVdFZm1h?=
 =?utf-8?B?YlB3TzRvY29TdDkwY0U5UG1FQXl0QUJZWTg4VEtoVWpOSlU5VmdKVWQydHBJ?=
 =?utf-8?B?c1ZiZ3lsSXhHOFk2REdtVkZTNWVyQ2RzWHNBb3RZMUUyZ2JWVGpzNVJvaG9m?=
 =?utf-8?B?MXVFVlRmTHQwWlJ3WHl3SUtnL0F1OUNoNk9VS1RSbnNSejNDMUVoTnI3dnFF?=
 =?utf-8?B?Qms5dnJlc2dBR1V6S3crMlFWWnBtTnYrbUZ2SXlTWWRjYnN2c3MrejlScmhj?=
 =?utf-8?B?N01rdHNiVDB3UzUrVFBaY0tYdWhvbDYvRW9OSTJaL2ppbi9Uck5QcGlHa2VZ?=
 =?utf-8?B?a215aWY1QXZja080V2xrajZHVEt5aWVJVzk2eFdCVllPajJ4cmk3MUhDdm4y?=
 =?utf-8?B?RjJ2ajlkMmUxNzRVMS93VG9JMVJpbkswTk9WekkvcGlybjVuUUE1bkZBakpz?=
 =?utf-8?B?c3VZNm1XOXRBcTRpU1JlZWhHSXdVV2Nsd0ErTStOY0ZoWm9KMytmcFZYUUFR?=
 =?utf-8?B?S3FPRGp0MTJKQWpqaUVEaHlMcGwyR25PRXVMUXBnNVMrOWIyUlJVeGNCbWFY?=
 =?utf-8?B?R3diWTZwc20wWWR5UGxLV29Tdm54S1BoWTdoUkUwa1ZyK1F1bjFxMjBFWnA2?=
 =?utf-8?B?K0JkMnR2QmFsTEFTUHRpRHIwajhubWs1TFFjdDlnOUZwbkZWT1E2U0g1MnRN?=
 =?utf-8?B?Z1FsZmdPSGMwNEFoQTNlK1BRaXZraDZaS1gzVS9YUElGWndnR0JYblMvVFIr?=
 =?utf-8?B?RndzUU9tcklhdW5YdUFQQ2tKb2ExYXJjWHpsSTZqaHZKUzJ5WHNmZmdERkZm?=
 =?utf-8?B?SWV4cW9ZcVo3SWorVTVEalMydTF3UDRzU2sxUCthRnpmei84bzdSQXBrMjQ1?=
 =?utf-8?B?SzM3aDhhZ2d5akd6aDUrU1FGSDRFdGx2WlFaZ3BkbG5ZWlVrTWVXZjVJSWlT?=
 =?utf-8?B?c2RuUnFiK29iTGc0eXY3ZjZZcWxHZkRpYU1RVE1MeEJXY3g4MGZZQlRtUTBP?=
 =?utf-8?B?dWxhV2p5L3VidGRHSHg1R0UrTXh5d21hMSs4Vk5qdGJKZlo5SCtnaWNJQU5a?=
 =?utf-8?B?RUNEeTNZeGRCNCsrRXNFendmK29TRkdReU0rUjgxaU9JUW1SemJrKzFtdjRW?=
 =?utf-8?B?Ym0xdDM5Y1hDOXBKbStqOTJlUS9BQ3VUQ1UxaWZaQ2lNRDQyYWtFQT09?=
X-Exchange-RoutingPolicyChecked:
	Z2VNghniQKoGNG3RBeKoYJ3pEyA2yI5gfgz/+TBBzk/pspSA/pNeTB7npY/0a9f+TH4OME4njRVx4l5VuNesP7tqYPM6TVhFI8DlJqWJc6Eh1Ozbmp9x8fT7ak79WUQ9NfZLGxqoADYlRwvC96+mX7GMWVXY5hSOoWy1cIlyWy0AiL3zrhhFl+ACnoA6Gom0vRvSs8zR7AeHnJWJq+Re13fEphyXuGP87hxeJ12ATCjeIM9u5yr7vAZnJbSAXVntBWwdfgpfzYyb1fUpGhMP9Nbf8nCXh0iWBhLm5B7LrlHdQL9xqoAGt1mwzDw6ShXmCmWLWD+CedL6iPxpN/ad3Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c07447c-c015-4391-339c-08df1248bb02
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:12:49.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVg4I8j59OicghW3zpQjpCwStZOEK7wp+qW1B39+uRICR24LHi1rTexRZJZIhryhpTIjiPg1kZcLKZXSqg5vMyb0Zh6ESL/8+FF9LIcpSpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8243
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfXz1+SLi/MEu9M
 4aSLJIruWcjdF5VM3JA6DH2tZtHWwZO7hqQ804cH40QMIqV8P3clR1CEKjdij0/XNb/xw/meWim
 Zxu1dvllQBO/KrrlKZLKeaCBeqmGALZic3K2n5ebvXiH1ZRO0DbbzQqS7pFCkOVnXPx1T6m1QQj
 ZlOA1ylsfWE7nQFPLeS8gAxMwE02IGgUUYqfm9FH+VhYmJVEX1KM3Hn506PIb7OMWkXKshdcR9d
 zioXrU77vlTrUqhO0RlwfBZ87MWKrMIHvh8+MVAcAUk280OR93GaMed38FenEUTMnbLAfix9DWQ
 zdTLhINSVCoYfWpx+/wtygysTSFA6Og/6fPAN2CTsqRmkgYXGT/XS05z/vg2wU+AgdTv5HYq3BM
 uqZzdLUA/I2XbcP5hDml0rtnJn48/y9CjZSSyExZHd3xHuK1QdamRKjDVwLAwmzitZDejr45xR3
 k7zmGA6M5WyvFpDfeng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NiBTYWx0ZWRfX1he77yimr3Rz
 NC9KtdyDsatp/WPM1JolDHEDOmwW03ESMEo4ixR8jzzNb/OILaKeEZwThTvb2KKOv2g0KT3b6VJ
 wMuUlkonGv4X6HOe6ylkDO4si87N8ofyJ9iS0hT//omgJ9uKyWE7
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6aa7c8a2 cx=c_pps
 a=ikWRpWbkSoEIfbFFe8At+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=gAnH3GRIAAAA:8 a=3v6g2t50OEfYg5BgxcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4Zsnhiy4uV7cqjKChTQOqGaTW8FWvhI8
X-Proofpoint-GUID: 4Zsnhiy4uV7cqjKChTQOqGaTW8FWvhI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140146

SND_SOC_ADAU1977_{SPI,I2C} are missing Kconfig text, so they don't show
up in menuconfig and can't be selected by a user - only by another
symbol such as a machine driver. Add the text to make these symbols
selectable and usable with generic machine drivers like the simple audio
card.

Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 sound/soc/codecs/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f9a47e262a77..d88593c2bac8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -524,13 +524,13 @@ config SND_SOC_ADAU1977
 	tristate
 
 config SND_SOC_ADAU1977_SPI
-	tristate
+	tristate "Analog Devices ADAU1977/ADAU1978/ADAU1979 CODEC - SPI"
 	depends on SPI_MASTER
 	select SND_SOC_ADAU1977
 	select REGMAP_SPI
 
 config SND_SOC_ADAU1977_I2C
-	tristate
+	tristate "Analog Devices ADAU1977/ADAU1978/ADAU1979 CODEC - I2C"
 	depends on I2C
 	select SND_SOC_ADAU1977
 	select REGMAP_I2C

-- 
2.54.0

