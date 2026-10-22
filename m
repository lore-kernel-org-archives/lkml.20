Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704430;
	b=ym4iOGQ0ub1+WuHjH+/4MCj8ZT740quS9dggg7kxwQuIBkCj49ufoD5TnZPZdPiOW8MI
	 nmQ6zRC7OTxjsjDz/vpneF6syZZ5oPsKQbNgaIW8aeoJJmscp9apd9hoCD1Dj0fyTvKZQ
	 R2vQc0aOIkEyg5Cdh2Q14tR1O7peXagns+esxga9aE/kJsDeE4a+zFq3FppgRZOhCt3Dn
	 5o8eeNMyNvGbIZUpJjkiOyWoiMU3db83a5OI+aOfgmSBn00PNAD88zy9v14+9aYP/gUEG
	 ZObOzO+CNn15HlQugQfp21HKXmkwIVZSzo0rDDuegVhKcQF3OprcEEpqEedjjYWel5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704430;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=;
	b=C1kfQ1fF0rC6+Lguh2LS/QPTSNQ5Hf9ywFc0auw/jVVR4M2/v4BkpR5V4vhLWSLX2jay
	 +lZE2O+JxTMHZWdhCgOKcZQF5zv7MSJTcZ++lDA3pmKyMcxt6fhNBxiz0sO/yVNXNzwSn
	 4lwh8gTuknkbSyNU1XrcZt27fDD13eD5R+C7DPF1UFDKsLbIxeEUQwq8AM0I8bI9PiCan
	 yX/YOEYfPh3fHbvodM30GJmin59QGRgNM0CZ1lryAT+8nMS1VpvT1pprOGO3JamQ0ZFBF
	 iFSbwJBgeRcgJAnehFGwmyUhxQojK5wrF+nP310c4piA6v/GU/J1ZMm5KkyEsfBp4TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="AJW/KLQn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.1
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C247606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C247606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AJW/KLQn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iax888DLyWdJCrAgACnHpDcaBM+TRjYCL9nat8aOKS/rvDwUwN480P92rST0GFawJppWr5R/YLYT7s8Iu8Dn3vCCuMIEsTn+mm1I/s1xm9B9qmb/a+Pug6MUul+OJpxyRKnRvKrR7vLQrqsqlRQ7NStokRqQKQoKQ1OsmPX9uRJjwJrD9+5VFQzEXIqGjurJb9nkhlbXgQ57SURl+pfkhzjB3I6uxb0j8oJnso8gMg3QIj/iRQs8SN67ssDIoJoO1vnbIK+JKji44Lq6iTomx+vrE+25Jbq0rmo7UfB/szufgJj6IfNAUOCPdSjZspkg8etJ5lf6QU8pcIdjl0s58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=;
 b=qTXqGE3DPywIB2wyv999dOwQ+OWL6Ko1EITnVSKRocvtWjrN9IFtrtMd0CRk+6dcgpMc64U4PoOMVOBqSyLxG9yLfY1qExgMHc9/GMRH1SyDHS77/Ea6keN5wEvH4ADJZQxX6GT/ZLrkeC6OhA5DfkjMAZkS86LVfNwsj1W4/QbCnQt5aTLZkZPjNOZipSrzaSDqsxghj/MrnOzO57kZmpLO3KIHac80mEFofE/sG8I2y4a3JDJpxZszhQdY7WVvptwAaqw+Qxh0Yp9UNMfM7+H+mRECAsF5l16GT6AxX+/lTQDjvOT/y3Q/7MTeS3hrYHTCFo206vHNtueHPZpOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s7lxnHqJi1GcXJiuKFuBWOm7hq+rICrq+V71CFlrVw=;
 b=AJW/KLQn6d1h05HI3oUT15jvkc067E3capep9yTZffQGLRyWWIhEMO19aY3xZm6J024NaKJ5YGzPpWtm4Sj7SKGwXRDbJguFzu1cYYNAmnK2X5VwaZVmO9EZU9Jbz2ZIEZr5JIbu6RHupXAzydCbQHZ/wF/+f9zxnGsCnI5y/rOCWvdUd9amBNZRCevIGsMbEeixWzTeplJyyG/rGF20GjNkdrPMe7mjBr9P9YC6bZYD74CIZRlRQ37Yxj/GM+YGSTjimYEDpEyBR1kb2pbEInLk5Ai1zWAUt3rekrLQH8+YVnCvSlVQvP4FTBpe0O1IhluZjsj5Vaw+xv2DQiQODQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 21:27:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:27:06 +0000
From: Frank.Li@oss.nxp.com
To: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: imx: fix typo "interupt" in comment
Date: Thu, 22 Oct 2026 17:26:58 -0400
Message-ID: <179270436166.1370833.7012764860088052875.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006060133.43320-1-hemanth.selam@gmail.com>
References: <20261006060133.43320-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) To
 MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: aceb45c3-d9f5-40a3-c83a-08df308338f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K5xdqglK1pl4BuYt9GUxpCSGre4of893rhyMUKp6xpH9mJwrns+mt9mbxZMxtgCwTsczdsSEooq/JrfonqKAHpM/r9LUWJs5DNfgt7gWZCh3hBSyUfU3T2VcAcXFWrrHHJLM98vYuZ3NYT/d6DNkbrJuGBJzR4ovAg2Ci5Iti9sOothfJhYSAfg8Hi49gYMcGgJH/lGLhYkgtnW2oLBJTq9O5nRjGh5NXhQppySzr5lBVzFApEfeS+zLNwGB0eRDRz3iNZxbEOlSPLB5VCidLygCdNVUXFnmcvNJR74zxJMVPh4te/LgpISP66G4ZHm+rs7KNyGAZ2eugWCSl9EFouTH6EaQmTg9NfYdbA5CnEM/IzGUvKcxJ3kSrfgFGnJCK01Dynm2tE6oFD/mq1OlQ+Ty/twPllqGNiqeyoe5x3o87+bQNLQoShR90S0sMQZ1rEqPnng2YxXm0y6t/2v8utc/len1aS8fEF9hRUXbwrmpKWkOL2Fskuzaj1eXINuU8dcQXq0UsbYGJo0Sbh6yuYb3P2+20DLcW2EYkJUb3dzE4awp5FZaeNALnmpsGHxypsEFgT+Khnhg3jXevnwRkWt5LJYyBABWbK0eTXVDB4NqKJ7rWHbrE+pwkb+VWbloLi3NQiiDviVxUUUndzBwjrYI+pGzf3iJy1kpAJTF4Ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1M2SE1qTUFjc0ZicHZLdWtmRWpEbE00NndGTjM1S1gzb3Rqa0xRd2xxNTUz?=
 =?utf-8?B?YzFLSHNRZlB3NW9NZWUwZ1VuZHltOFBKU0k0aFJMTVk3SFNPQnhZT3NGUElL?=
 =?utf-8?B?ZnZzNDJCclN2anlVOWgrK2RucGFaZkZXbDVJSVlkdkFSOTdQdzM2dG1qQkhP?=
 =?utf-8?B?WFM5MVpBMFJvMGRHd2lheDZoQzN6eVJ2YmQ1SUNTbGpLMVc2RTB2VWoyemwx?=
 =?utf-8?B?N2c0SGhRMFEwaHN6N1o0UUxQQWJoZ3lkN2FtL01tN0JaeVlKWW01WEcwalFr?=
 =?utf-8?B?TkFQNmliL1MwMGRaUFlNWWRod1F6YXlFVTZ1Vkg1cUtxOEtSQkVkNEp6OGNL?=
 =?utf-8?B?S0dCTGNtVndyUlNiZzFjNnpQUllMUmRtYkhzam9XVGxPaHlmQW5pbk81K2JV?=
 =?utf-8?B?U2JiSjFobnRQSVZWbkZGcm9WVktUN0Zkc2dDRXdKQWpHcVRNNXVIajFmb3JJ?=
 =?utf-8?B?R2xiLzRmV3p4aElpSXVlQk5tc2FxRXdpNm9WQnd3U2xDZkdUVXlZNFR5ZkN5?=
 =?utf-8?B?bWZObzU1cnBHUjJzSHRKOEpLNXd2SXl2QlJBT0NwMTFQQ0lYb1lvSWNrOGlD?=
 =?utf-8?B?R3lzVVE3YUoyK2d3Z2t5QnpsYUhCZ3NGUkpndTVDR1YwaU8wVEVMZGNQMzlT?=
 =?utf-8?B?ZnBKdXJEdmd5VG56eVkyQXNmeHVXZHRZdVd5OW9najE5V1BZcTFFWm8yWHFC?=
 =?utf-8?B?YnJtZWUzNmRrMUQ4LzNGZHk0QTh1U2JReTBUa2Qxdnk1eEEwZ2E3TFdMS01N?=
 =?utf-8?B?R1Q1QnlqQU5FWWE4cTc4aDV5dDlESW5aZnhSMEhPNzNTMVVpTVpGYWM3Yi9x?=
 =?utf-8?B?UFUrLzFZMGlCdFhZbzZiSmZzSzhzd2VqbGM4dTYzMXZJcGh6YWxrOHViNFFn?=
 =?utf-8?B?MXRnSGlvZGhVWFhUQlI0Z2pqMHgwc0RIcGZSWXR5UFNqRVlzdGN5YzVsTGl2?=
 =?utf-8?B?aUI2K2xkMFJ5TThIQUI1eFNBNHVyaE1kY1E5ajNJQnRtUUFzSzJ5Nk9xRlND?=
 =?utf-8?B?RmlnZEFSVUtkU3RpbldsY0twNlpYZUdBRDBLTEdOMWVVendjSWRTczE3dThn?=
 =?utf-8?B?UDRnTWlqYmRkYzVkdnNKVmNzQXF4VXdDeEluTTJDS2ZJRTdIN3FhdFI3RkVa?=
 =?utf-8?B?QXQ5T3F2SzkxZDVEekFzNElFb3MrWGxZaHdQWWFpb2JkRXJKb3ZFd3ZjNnRX?=
 =?utf-8?B?cmpsOEtKYm9IQXh4SU9KVWdqNnE3dSs1eHNNQjZFUlR1VGRNZk9sdXYyR1pU?=
 =?utf-8?B?M1ZkdTc2blBJaVMwZDdnNTd6Y2pybkRub1dRZkx3cG0yd1Q1K09RK0duYTB1?=
 =?utf-8?B?KzVmQ2Z0YzRYcG9IVmZ4anRtQURTOTFDVnFpQ1VSekhaaUJERVhxVmc5VThj?=
 =?utf-8?B?UXlnMTNWQnBKNFNBY1FZUVlqNUx5YkFxOCtlWi9FYlI2OVdDWUJDdWVXd2Vm?=
 =?utf-8?B?a0I0TjNWUmVhSDBqWE9hcEF4dVZLUWtFSytPcVliMHJHUWZ0VU5FT0dZcitR?=
 =?utf-8?B?Tll1cTlmUXdZUmwvT3lBOXMrVWUrL2FLbGkvU2FGeE9mdkFJQUIyL0NGZTd1?=
 =?utf-8?B?bjZ3TXZvODhRS0ozbGJNRlIrU29STlliR1lvZUpwUzh1Y1BrVy9PMllQdzll?=
 =?utf-8?B?QmR5cmtjVEZYbHQ0RWhqU2xWdW5hYlBHcGVwRnJCQmxCeHRuQUs5dm4vSTlx?=
 =?utf-8?B?a0kzM0U4NVZuRVB4VUhIWGRNMlF5NUk0bkh3VFkzTkF5THdvVmJJVTltaHpn?=
 =?utf-8?B?T21jWXhCSEVkVHpnd1BIWWwxOS9xT2RVZnozUkpteUxOSTg0RzZNWHk5dXZ2?=
 =?utf-8?B?YTBZS1lPdjJTN1pXNEZUK3hGVDdXanUvVEtuWkozcFJzeTlCREV0dFNnd24z?=
 =?utf-8?B?TkxrcG5yRDd0SW80bkFuME5XbDlidXlvLzg0a3FzWlFHR3p2TnNSSXBBM1JS?=
 =?utf-8?B?ZVdkYXlmLzlQdmM0U2dwbEFYbUk0SG5lQ09CV2k2Tzd6a3gwQWFOa1JTNTEr?=
 =?utf-8?B?N0pROHNSMjlYUTdjUzJJN0pOVVpWOFpEMVF2bGpQYU1VUWx1eW43U2tpUUxp?=
 =?utf-8?B?R0Q4bGQ3d2tZNUxVVVFYeFAwaGlBenluMS9UZUs5VndiZVpzUzhsc1NDQ2ov?=
 =?utf-8?B?N2dyWml6L1EwOGl5MnJyUkNqUGphVHNoaDJZMy9ibVUvaWFoSmFPMk9EcUhi?=
 =?utf-8?B?UnUzWld4dE1IbFNLbmFlRExsZWt1OEtOL1ZqV1pmWXYwWTRPWmJ6eGRRRWVJ?=
 =?utf-8?B?YlFMLzV4cVFQK0I5V3FiMkNRbW5JcVQwWUlyZFpXdS9MZ3NGOENPUURHNzNM?=
 =?utf-8?B?V2N3RlgxdXFUNk5BODFGS1VTdE5IeVoxTGNMSG1LeG9nZFVhWFpSK2RxeURO?=
 =?utf-8?Q?fZsOh+JBu6DdSbt5jz1BNL/RNJ4KY5da6oLSG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aceb45c3-d9f5-40a3-c83a-08df308338f4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:27:06.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yif0TqD/5j+rumpxTJt32u1XuoVmOyjoOiDLo17KgPvOUx7cLc72hxgDr79z9bbFAv57zfkOHOdlsjJOOvYOx2qW0Nr1W2YmK4F1tt0hieRWikwz8MxC4LFFniGYY4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447

From: Frank Li <Frank.Li@nxp.com>


On Tue, 06 Oct 2026 11:31:31 +0530, Hemanth Selam wrote:
> Fix a typo in a comment, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only a comment is touched,
> there is no code change.

Applied to imx/soc-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/1] ARM: imx: fix typo "interupt" in comment
      commit: a395543ce79ad254d2e3ea9012eb659e7031a2c7

Best regards,
--
Frank Li <Frank.Li@nxp.com>
