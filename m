Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021107.outbound.protection.outlook.com [40.107.51.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892182EEE62;
	Tue, 15 Sep 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463399; cv=fail; b=cpcXI/yuB862lUh5biRbp6/dX025+CyfAlW+OZr0ZjahCXuQ3Vte+X6AxQ0+CMjQ62JRpJop/ZARYgno9EjV22qvtolbT80mgDolbkW+5Yj5ZwZFqqELc8oYw4sALJH7lQNG4vMHZDaX8xkbs2uX0wWhMTlUx4pkqez/KSliZis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463399; c=relaxed/simple;
	bh=TZ3MfEf1esGaGE6ubEzrdtrlIa7AWJbbCJza721UFb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tcnr0QdSR9HA++5tUtD3JyxPHdNL7bgiUuze+sU8zsKnE7egMRnCEgm036jusSE5TYcHzEhklu+h1EGo9gkYuWIZZQbnRhoRuqlC3DxPnOhH7YZtTq6zGQ82LtF228xjzgUxwgyq2C7uhEtzRClb/u5DFueFGwHQBn0SeKeBpeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqIds8r8Easeowluxrp31ej0VDDNG+Y0t6YbIPHhIJ5tjmZlNDBaQK43bLfenbqRbJTdtlB2tYZOnslA+mqfH90FI4OE6dbAjOk8s/CpvDH1VNR2iFk1xcXQ6tvoLi+gPXxV2hsNpiDgM3aQtTaTF7WDdoqJma814hYYp/rlKDboisCZEbz6xxTe7nZ/xI1sfLlB43G8+wZHPKdUZsv3W6NKGw5ZCg/4PM4O/CYTycT6zX82Pjvgd25jZHOehjAT+ITMP6PhxTyKLyvkRWeJ4F9AfdZbcQwh7Ef428mH+bbJhyJPErmK8U+ip8TfjaZIaOFT46rNGddr3KF4YydemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ3MfEf1esGaGE6ubEzrdtrlIa7AWJbbCJza721UFb0=;
 b=Wbn1pvxPrOpLoEcFtqROJgUUN15fxingz2vw1vTedIiUSVDWn90DmcD76VbjAM7Q/7EUS2x5XeSRZ5vEbAF8QBTGpGgYFHEt6lCCitxGGNn5xwB37o/KGh0Iltu31URK3t/AAOSNsCoInx8kqlbnk2z5tIJUGdzz1heMbMOeIOKv6cv9ogE1wyDm/y+lTdO8hqfsR4n/5JJFSo96iXa0b+X9wNk4xwB4OtF0SKWP7tkZVxVRnVWa5gZFudnChW+DkVIZW0FZUSeAhOtfYNtFazI7+A5WzCbrX+roqkGxIAy7O2dt1oOyaVbpZg+96etznskGuUEdiEaBdyNnryQNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:54 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:54 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 5/8] media: qcom: camss: vfe: only reset the VFE when its last line stops
Date: Tue, 15 Sep 2026 14:38:41 +0530
Message-ID: <20260915090929.1284112-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <01fd3d46-2588-4d54-a131-ffe8d16e5dc1@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-6-hitesh@ebytelogic.com> <01fd3d46-2588-4d54-a131-ffe8d16e5dc1@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: bb887ff7-4797-459f-b0d5-08df13091b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	19CFjH0NffjwreflSeN9yzVa+oIJnEPVUSBDTs5dDwv91PYoZUjnSs7gIFAlhCc/h5HdKOGGygTlbTabtIkjjxHXQIhIE/vzNItFDOJPR+047PN6AGCyxCJ6f2N0J8UhUBNtmPntQZ04rC1WejfP/J9hzrcnkhKnIWD7ecIyzA+hGHywMnWH1Um4uEHzLLKQhfKEfy17IyNNF4KMSvzGAW/nXTY917PGXNZVvlUv+B1ZiRj8S4wt18nLB2+yX8u/PvuHpg+1esiQAqveVEICWVutze0XTih+CryVOY7z/geTBJF/WmKHvzphN1xf53TwpwynqxcPiFVPRU3k/2LWUNWQzDKUuiDVTpjfM6zzAeGiBuLS62pl/70NaOa/91vhUUIfsPYiuoOgSf7eiL7cSl2cOCsn3VB31hMo1UBEoFXxoGOGPLG4u7DbwQKqKFqd42/9UsC+lcaFHIdiS5hghoncePnCDnb0NyDJtWlu0YaUS5qshTRza3z7ZrhzQRpKfbZbkPxJbx5vzPN1bRS/nTTQBCbGdrFdx499mGTGlfBE8CkUYJ9215U/O2x0e5VMDRGUh5lJZ1hcWNC2qWDwhEU6dcOqaMHjZ8RCIFvudCMxxpKpTbiNh4ASjlXabXdMTIeaqHAjZP/Qjo7Yh3kt5I8Wg1Gfrm3BHavBSnd4hwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cF7qiZ+kV7jeR00WYuRKlJ82fNUct1PHo4IqTrhT9kfw+JD9xfeETt3u/tK9?=
 =?us-ascii?Q?RlE200Q+KdU/KbQ5O6U1uK6e0x7VdpNZoy3tjkc6hn6gD4J72vwxepUPtprE?=
 =?us-ascii?Q?z/maSSCTbw0ic7gSJf2xePbHe27cBUcrLAzEL/H5Vy5zefHVmxnPE3UBM9Yx?=
 =?us-ascii?Q?XKWk1BqnwtYLVgqw8lLElWPyjqB28jE4juR0YGzQ8CWrqJwACIvtrzx/Ar/V?=
 =?us-ascii?Q?iNB5RxblRf/ByxJg0xS9OckxETt3h7l1YGc1vWj2tz8s+bVMykIIXN7TmXvv?=
 =?us-ascii?Q?kEmYN+MTE5zMF1GeTucQvn4WZVs29CTYV73YOyjtWrBvdbTMDJgQM/h/+dpX?=
 =?us-ascii?Q?fTbPBiFeiAXTmvl81vYXti4SfKqX/6AgbZbTkrmGU5bbu1x6PD5zVtFOhTgs?=
 =?us-ascii?Q?T/DrmOxg42VEHKgXje5MUx8XGbIomDFAko71RvVs6mCnDRL5wg3kZqYryaD0?=
 =?us-ascii?Q?gzTAxGGbMCVeBX/jY5dIH0lpVBWoYmdDt/Fp67KANQlbm3iK852M8SwrOigj?=
 =?us-ascii?Q?VVAhqQRVIcPoblphFsPVcc6g6ECL72nHR5xCbqYYJPurGVUnPBP8Gpb80scY?=
 =?us-ascii?Q?L2bWqJU627MuZlHVcYOtfk4g/hcQ5cEj397b13Rtfa+BvSaRJJlUb50H+lgp?=
 =?us-ascii?Q?TWFdi17LFA3o/mvEuA0OBqRxTIWfEG+VNuhXCjGIJirQ2qEHj0n313dgSIxP?=
 =?us-ascii?Q?zxS8t1xm0Rad1ERB8SxQisQF+T0m3Tx3+eoUIhdw5EKxtZ5y30/mRf0xBUHX?=
 =?us-ascii?Q?BcL+BBAGYD8FDkyMixWIzIVpUUFosteozOB6pcTl3ww8A41PY81goPJjsz6w?=
 =?us-ascii?Q?go+iHwwh9ILlSwkq+mLHHCcETfrRWg0uakZARSGJsqmG7cUSn+7yFsxyLq0G?=
 =?us-ascii?Q?7fHBz7H7aCFFDe4tjIgc+xW8x+RsaWz1qRJyEZzgTnNArfNDqJkuAa3gFnsP?=
 =?us-ascii?Q?bx6MQNH3vfaIoceYyb6Gvua6OMhU5KJOwHTULt30xxS0oNCEihEB0dhLcJzW?=
 =?us-ascii?Q?TGQdHO9amDE848bVieq6XQBUD7Q+CJ1PKkjvOYrtgKfG3xHcyFm0+Cf/B2BX?=
 =?us-ascii?Q?G37ntWcqm8jRidGfL0X4bGHMCkuoM519U9hYchp3jLd40uxbS08Od51Z0SGV?=
 =?us-ascii?Q?cDg92dqFjOBbw7qWW5Mc7SHUHA+oPdhvpdg1ywqU0uz/rTgZv/WBSopTuS9k?=
 =?us-ascii?Q?0jD1utKEfvZYU9BbsiUUbjWrpWbtsVaGvymflgq+Hogp7D36c0pRrLZR1L2K?=
 =?us-ascii?Q?UCzsu6irL+mXST9nb4pJ98vrrxPiWIVpVoxOXDVx9mmXzIURmF79hTpE7Izp?=
 =?us-ascii?Q?R0nlVotb+xC5YlEgg/31ISNPt9PZHxN0FSme+7okko88U/0fy+V36iuafJu8?=
 =?us-ascii?Q?rrAkL7AhqvhzoqEcJYdZUrHErSGkdI415fzJbqlCpwKpg5zNeH511/Cs7Fme?=
 =?us-ascii?Q?Ms/F/zsrRKQzeN4SsPLt/WWaMMrL6oDZPIxRDTL21X5Z13LgHQGr95XgDEA7?=
 =?us-ascii?Q?OnKtoXpUy6zBwrn44Od6KdxoUVuIPS1AQ+5AwYIQmdkraMdzolqSZXQUZj3l?=
 =?us-ascii?Q?+IJ+6YS+wqRQjezu2HdKg3V75RgvAY+AdBkXicSu8jM+UH/4g8nUPYbbsXrJ?=
 =?us-ascii?Q?wLHTogeiy35+YFqKHpoM8xplaSlmqi8s0OeZ6PL/DAtyR6wayNpD8hFfja6d?=
 =?us-ascii?Q?7n2Vm0ABXGTdxHRqVsZDmjzogOxDCuYuKIBHWJegp6MJwxwfwQiv03LPIupw?=
 =?us-ascii?Q?x8Q3fwOe9nwvvD7EsEuJvYfYZCX59C6I+CZlD6WKMGhQI0pvCoSTgNg9abh+?=
X-MS-Exchange-AntiSpam-MessageData-1: xFZu0NRyJ6ting==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb887ff7-4797-459f-b0d5-08df13091b11
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:54.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3sKWBbtghm/mm9S5m28kkfUmhXjARfaHCF9KP4XrFgwOwn4t1LzTSbPKzPeU4UYNXCgHVKB0pvT0831ujAnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> You can drop references to a particular part - all aggregators would
> do this.
> ...
> What it ? Define the object instead of assuming the reader knows what
> is meant by it.

Will rewrite: no part names, and the object spelled out (stopping one
RDI line resets the whole VFE, so the other RDI line still streaming on
the same VFE loses its write master configuration and its in-flight
buffers).

> Other than the rambling commit log - looks like a valid Fix to me.
> - Fixes tag
> - Fixes to first
> - Fix in the patch title name

Will do. The reset-on-every-disable came in with the VFE 170 support:

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")

Thanks,
Hitesh
