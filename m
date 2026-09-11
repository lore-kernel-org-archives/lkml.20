Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50DF339389
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136339; cv=fail; b=B29oHwOd0nfkTlNxBa7lZK9kIS2Iiw0tnBXF4Mrg6FsE1qexzuigYqlJZ5epGYq9kMIdxwrMGkY7EgWtwAe8AkGYC0GvfZWfttZ3hMHQIsD9iWB17XmOG6lEK2a1nmsljLgFs3ALYzuhNZC0IC0g1s3nNPHeoXWW39jR/FrZZzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136339; c=relaxed/simple;
	bh=JQIoDMbqAebxNHJYeaPPUT6026jJcDycxvGyQlD/7AQ=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=b3cmwxe8AUGQRs62ssG/sOdQt2axp/R0EUrC4k++X2vZuA9nHY24+blqOhcm9maeBJoxiKRMLgXDMhFJD/FnLJj8ZlSq1mhYPNYNe5xELq0RDnK7URUcjSm2/mFf62fFdyjjX5COAlCU7mYTJXD+WWnhua+dXkGNT9IxG6LIRKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=U8zGR6fJ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="U8zGR6fJ"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjlGr1570118;
	Fri, 11 Sep 2026 10:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=CT7HiA3AqeMBKcn6L1qetUYyIQu
	JQMpqn2zp289FbAI=; b=U8zGR6fJTc/XennIZtwn3qODL47pAPHU+C/S9jsbmAc
	CE3dkHE0Yq2i6BAp+fOOZ0xqZCmnfJX6m0MHOh6jfLR5SrOYURHs9JvQdEChsrdq
	qbrg86BC20aVaKral1IjRWHEbrRQS3pJxZksTv9xBHU6n3f3uoepRYwJs8ogVTT8
	C1SYOtXIkuMcViH5Pyi40UcxtsKD+BUokS76F9Tf/uVAX4g/0d+oCklU1VJBDtIZ
	T1Ri0fy/ZFRXAU89/2AVxT2a6meanOOI86u+0Ab3cvUfioRYcw4XpldzU37bfmyF
	CK54I9TgMSFSkpchOtaKOG7yAnleRptWcZiktN0EYbw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxchd0x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 10:18:36 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ce5DrUBXx7Ft1JCfPaU+S5mHc7KUDTuXgEP6Pa3HzLTLgeZh6j31HXg++WmI111OUvzgiQC7eBysVUbZJr4Dh1IuvW3K2CN5JnVQ+qCGuRmD7SHIhDALx5Et7mr2hPwa3/4zndFguMMugWcpID1Gq9npB3QSqjXfuyFTxjWdCozFbr7FwEfaHSHQpgUpMe3de5wnLYvoTq6ueYiawucM2A4CMz63uAAiPu8Y67bXC1XgFquHgpBhgi4d6SRLu+f5VsRb8EAuj++xF8xMO6v7jvuGNthaddcHPlkkZHRndOW+24Wa6MrrcvbWpcOLXUVvkgwVAlzXL87d3hyYPFJcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT7HiA3AqeMBKcn6L1qetUYyIQuJQMpqn2zp289FbAI=;
 b=HX6uMr3S6MmtOVAUCYuRo0a9tDjkuF0sqmguq2TNT0TIY9N9jfB2BeximiggjjqgX38isY7JeKTN0OPGZ/Td5XGYpXOnRQqCEvbyAdphm7v1UBxflzU5yue4lyVUJLh6XtbuTQ8yp9TNTGp6b47zKKs1deTxhuh+oPDMLlpbaarXX0DjFJAkmLRD+dsNinHkuslEvdpFBZkVsbmEBuUX0AeVHpJ4x0Muno/gZph+SqizygLxDwcfJRF+OQn6RM/NZUw9t1bCNWFOytDG64Rzv1woQnT0LiHWuTCZTok0HG2aoGltvRhQqeU9bQ3mB3bUxAFJc8avkxa8vC7GfUPCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by LV8PR03MB7374.namprd03.prod.outlook.com (2603:10b6:408:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 14:18:34 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:18:34 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 15:19:49 +0100
Subject: [PATCH v2] mtd: spinand: winbond: Add support for W25N08LW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-mtd-nand-new-chip-support-v2-1-e2925bf78c26@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBSEr0K69pn+IIor72FYlPIKNdI2bUEN4
 e4WvICbSb5kZr6FRAwGI7kWCwk4m2iczcAPBVGDtD2C6TITTnlFL4LBmDqw0ubAF6jBeIiT9y4
 kKMuW0ep05qXQJO99QG3e+/e9+XGc2geqtB1ujcHE5MJnl89s6/3jmRkw6JSsdSWkorq+SSufr
 j8qN5JmXdcvKTEtPtUAAAA=
X-Change-ID: 20260831-mtd-nand-new-chip-support-44b10657243f
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789136390; l=4451;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=JQIoDMbqAebxNHJYeaPPUT6026jJcDycxvGyQlD/7AQ=;
 b=I1wp8m3EsuXRw6zBsyeyGTFGrFzE2CdUCfFKDB++85m84Vmyi8cwQajjfiWGvB6j4qJmXrVIw
 IOWSmixf18CAP7lut42Sorka0r3qLwP4JvWRNFT/hHtuL891YRG/I5o
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA4P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::6) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|LV8PR03MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c9b0c1-9219-4b44-c97d-08df100f908b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	xSQBYfm0dGSV4hJ10oR7I3/UmOs8e8ZB1iCe2gRBqJAu1iLb9+Zih14Cvbo1fareSOgxTSOwYRJS+zOiixsl4yTCTcMXy8GGNXsP6KJGXg+piJWGKZfTNpeJUoFv5Vsw1oXl6VY95hrQTlrDNj4RjEZYMU5zqjul+eOdXaxkETyfx0sBFiQymqPrApOiffvM6ms/TkJJ1mX/LmnfYffRZUNBHZQeA0k8hsOTJJWVrxNmq7WdESZJ8PXO2S1nBCRXe8CuYhJ6Y/QPeKaxpU3m7IyUzLbnAJ182Sw8qtBMh2dT+iSBegyTbtCcAem38VzUiAHngxLUY+4T/M6ccVvo7aKVFiyTlbkDI+00/Z4+uO78HIfwhyZeMgM8YH/Nw63bER6pebXygewHI2gR6LDzi7FGn2C0IgRthdFenuIox1OEL+6Q+eER/Vc66vFl/TvCbQVK5+Zg7WbQ46hKOiH6ZkFGglt7zevXdAaQA4OFILU15qKx13qk8m3QK+uD6MYj3TavX0tM0BtDzw8Zg3jH2mND82QRlI41bh2SlhGUeghIeQMcPQdJVyX3A+eDd5JLS0XoSwXRgH6sZYFYWkAtBdJ/F+2f/i07h7ZhtzDdxYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a09KSWJhaG5acklWQlFOQzJhVC9NV3ByT0NCMUxsZTZCaGJrZHNwZFZyTU5L?=
 =?utf-8?B?Z3ExY1FPcmtRdWluWmFaRUxRVWtEWkNPWlhLSXpRdDZKZlk0L3dZcmhyYkNW?=
 =?utf-8?B?OUtOQm1QZ1BvZ3FPaEpiczM0QXBjTzFQaklLcW9iNGVENStndTA1U1NMN0Fw?=
 =?utf-8?B?WTR4VXZMWWllUis4THhQbzl2WmRQZUdmY2hhZzMxZmhaMERheHFEdm5qb3A1?=
 =?utf-8?B?dWdiWXRDdG81eGNDR1h2d0dWUHRzN2dPTUd3TFNmMEZVTlhSUThoSE1hbklq?=
 =?utf-8?B?VjFoTGoyemZBdlFNdU9zS3ZVSUYwYysvdXlPRXBvelVKVHFCUVZhWUdla2ov?=
 =?utf-8?B?L0s2QWNyVUsrSGJIWFdBcU1UQ09IbENRU0pJZlR4YmNQOW85YmpCOElFdmRI?=
 =?utf-8?B?Z3JsRG1uU1JGN1pyRVVVbTlvdGpoY2RKd052OVJLU1lYd0tOUzRZQ3BIQWtk?=
 =?utf-8?B?M1c5TjNNeWovb1dqamZlYldzREVIZE9tVGs4UTluYjJaOFAvaVIyNFd3anhQ?=
 =?utf-8?B?dEVoMkV3YVY0TzNxTFJPNUd5L1ROT2hOK1A4bmFMdDNGbkoxUFVhUmZhSUNl?=
 =?utf-8?B?cloxWHl2bHZyZHZUNXZ4TG1VNWUvNjdsWXV2TEIrZjYxci9oVWRCdkJOVkdh?=
 =?utf-8?B?d0Y3TGQwaFN0N2NGYWFlekhMUWd5SWc0SkRHSkQrY0I4QlVsUVdCelBrbjl3?=
 =?utf-8?B?NE5TMlNmbXNTTDhnZ25BeXhvY3R3WnlvendreVlDTE9oUzNSa2lPSWRaczFr?=
 =?utf-8?B?ckk1bWJzNDVMNzN4TjNMS2lDT01CZEI2emRMTlYwa3RxMjFTS1FDZEpXdHZn?=
 =?utf-8?B?Sm9nRzBZejYrMkZJTmVSN1lPUm41L29oaS9pNjlEdGdWTytKbmpqeEZkc2Yr?=
 =?utf-8?B?aGJGVkxGWWk0YUs5d2VEeGVEUDdhelhEa2hGM0JJMVJ4ZzNkeDA4UE0vN2dG?=
 =?utf-8?B?MkJYL3A2L1FlQkJBdlRNL0MxTEgrbXg3MVQzVFUyZmR4S3Y4KzRkOWNnTjYv?=
 =?utf-8?B?QW9yRnMxcUVkQnhOY1VPcUptVmxOR3ZjaXFpQmQ1amR5RU5iajAzbVlTRjU4?=
 =?utf-8?B?c3JjcW5YM0c5NllLekJiNkpna1RxTGhDbjVvSnJKa04xMDEwaDRFOERvenNp?=
 =?utf-8?B?WEdvRzlpeS9jK0JyRlFoTWRlNmMzTmoxRm5FNSs1N215TkRRZTJ5Zkh1aXha?=
 =?utf-8?B?bkVTODlta1U5cnl3dWp3UlNTaDBGSDV4SlQvUUVhVXRpMVZJY3RER3ZkalNF?=
 =?utf-8?B?ek0wUTFRV0gzVEFVejVVMW5RTzRkaWdnZ3RoWm9zSGVEcjJ5UVpOZHhQWllz?=
 =?utf-8?B?ajdsbTF3VmNRUW1LQk5CSS96eGppREVUd1ZsTEhycW9RNi9vUXJiWFlqODdH?=
 =?utf-8?B?eFI3a3lnUUk5aFFveDRKbFFiSGtxTnVBeStuNzhVR1VrOWhhSWJzTjdZSUFJ?=
 =?utf-8?B?Zi9rSjZ5emJYdklqd2xjaGJ0S0V4ZWdUM1pvWUVzSXkyeWJKcjdIek9UMWVH?=
 =?utf-8?B?b0dIR25zcGlZMldHQ1NyNHlhU0ozWVpNeGJLbU4xTVI4MXhYWnRoamJoWjZ6?=
 =?utf-8?B?N1JGdHFCSk5Lb25lUU1kdzdMR0dMaVFVNms4Vk80a2NsVW5VdXY3d0ZJUWN1?=
 =?utf-8?B?VDgzS0pGY05LbnBiRFNGVWoxSnUxRHUwelAvTDZRUzM0K2Fib2Y0d3BiTXRu?=
 =?utf-8?B?VEF0eGdDYTRjVXZ5Vy9hSFEwTmNITVM1cnduTFU4RXo3eXVRaE9uaERBK2NK?=
 =?utf-8?B?UEdYSk5DRDhYS1prck8zcno1dmhycTM3Y2NlNExPYmVmOW91Sk1Mekc3TzRr?=
 =?utf-8?B?MUNGdks5V2NsWUxRRjJCak43eGpPd1lXVC9FWFV2Y1hnZTN2aEZyd2o4ZThj?=
 =?utf-8?B?aUd3TVV5ZVlvOExLSnJraGNGbzhRd3N6RTY4Rk9qN0VZeUlTR3VMeGdzZGJh?=
 =?utf-8?B?c29maDR0VE9lTEl2R0xna3ZFdlFCM1B1Sk5zYjZSdkpYdnVrWW1lNXVEdisv?=
 =?utf-8?B?MUFYaEI1ajdjbTU0eU1aUERKOGRsSnN1dDRUMVJoNlRWUS9pOTJjOUxOaW5N?=
 =?utf-8?B?STE3OGNQZDVMR04xcXNMTGdtamc1cTJnOFluOUVCSnJCYlJhS1dIMFVJMmts?=
 =?utf-8?B?TktLSE5uSWV3ZzB4QnFhZ2JMTjByb1FCUzFZREdYSkJzdnNJQi96RVV3NHNX?=
 =?utf-8?B?OWtOeE1MdjZ0L2wrUWNxYy94cGkrYzR6RnBNRnpQNXFQRm1kaW9xMFFaclgz?=
 =?utf-8?B?RE9tU3dwWjcrd2tKQ1dFRWEvcXh5bmN2VjVQNmF1aG9iOCs2ZzRmQXdJVW1Y?=
 =?utf-8?B?NWwvWEo2TmRQS2F1TzV2dkpzLzRYWlVLMkhLV1h4cUwzcHZxUnYwdz09?=
X-Exchange-RoutingPolicyChecked:
	phGCw5TVDqMD1aXKB193ZdlYFFas90upu7fV4nPGc0zXaFo+FNrL9bS7+GbyEkpYSZfIswiL5iMGVaupnaNwe+92IBXe9t7K8c4rVt9GlaKwem9Y8i72UX0nYF4ZEQiXnKSAwt0zX8u6zSYz4PsGtvsYyYRkT79NLTnt0V83IfjusvmPK9YhKshatq9TdDOeJhWykJLPvBfC+VkRfv96Z3u9lMjvWACtrRx670G5N8gE/AcPykG1h8upF0VN8/Rh7zJU330dM5TJpZa5jD83McPqoWC275mhGHEziO3Juyxl+loDt+czjdANqC09d2eWPTqKrKqluGwMjfUInzD7xg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c9b0c1-9219-4b44-c97d-08df100f908b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:18:34.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeoJvSyQ60SwVIhxoJrAMtSEAVXTW9V4iQqzOvqudbTC3ThFSgozDLtzNOv4YkgtSFFvKbrZvzBQ2Hdge2r5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7374
X-Authority-Analysis: v=2.4 cv=PZFqFShd c=1 sm=1 tr=0 ts=6aa40dbc cx=c_pps
 a=pKPYWX2mfyrwmcKrUbCwIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=C8gYX-aa70u0wLh4TRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uyGcPTPyCB5dSyiohPSaTYKNSiGI8DOe
X-Proofpoint-ORIG-GUID: uyGcPTPyCB5dSyiohPSaTYKNSiGI8DOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5OSBTYWx0ZWRfX/+6nBTOIF7Wc
 7WgJuW4TXixubcOugXPW28vRVEBCDK95A/7gmpDPf6fIsAZSk0RZN7xq6K9MQgubk7DwTmX67DY
 69awFTiOuXkjboPAUtYOP0FBpREBz2/6dkxDmVohUZhzlWbkEEKH5PLTBU4qd5i7AaaRVkkJV9U
 /ut/+NMfcupTimGyDXf2HAAi+8zz+yEfWXkbXY3j5FB7rN24FwccTznBdAlLNrNg3iNH4AcxOxm
 OtMkChK6nrLeMGfIIHI66aLLa5xoWdYn5hK5NmazD5tJ8QJo3j2PyOQ4CUiDB0QP0zLDoFqjv5V
 WVmQmHR8cta6aHVbN+eb5dOlQ7x0KYqVA2nv7/AugmYlvWqdeH+K+IqQTpMmIfhewRvsiDRDdAi
 JA/WwHUfklDkmF6pMZsmGy/W2/p9IiH1SzMOT7N2d2CnJEFgZJXUcxMFy5zw7jVkCaqpCogYgX1
 8gz3UCeSrwflvqkbPyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5OSBTYWx0ZWRfX+VQC4tMZDlOt
 w/BEHb5ErlgLbZx28Q30Mg0ONdJuRuPVOOSeMEWjTL1auZTFWDiiZQbyHK+xnXsx7CRuFWPk3Ly
 HeTSsX67vozy7fwO01S/bgGu01AR537VF6UAeguj6OVttGgp2+ss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110199

Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.

The chip reuses the KV ECC status helper, but needs its own OOB
layout because the geometry of its spare area differs from the
existing Winbond parts. Only half of it is visible while the
internal ECC is enabled, so the ECC region is reported as
inaccessible and just the free bytes are exposed.

Assisted-by: Claude:Opus-5
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v2:
- Only expose the ECC-protected "User Data I" bytes in the OOB free
  layout. The "User Data II" bytes are not covered by the on-die ECC
  engine, so they are no longer exposed (suggested by Miquel). This
  lowers oobavail from 126 to 96 bytes.
- Add continuous read support: add the continuous read operation
  variants and wire the chip entry to them via
  SPINAND_INFO_OP_VARIANTS_WITH_CONT() and SPINAND_CONT_READ(). The
  existing Winbond continuous read templates and the W25NxxJW cache
  read enable helper are reused as-is.
- Link to v1: https://patch.msgid.link/20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com
---
 drivers/mtd/nand/spi/winbond.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index a1807fa9ae03..810975808c97 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -211,6 +211,13 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
@@ -365,6 +372,39 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.free = w25n02kv_ooblayout_free,
 };
 
+static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	/*
+	 * With ecc enabled the parity bits are not accessible. So we can
+	 * only see page + 128. Without ecc the full page + 256 is accessible.
+	 * To make it simple just return the area as not accessible.
+	 */
+	return -ERANGE;
+}
+
+static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	/*
+	 * Only expose the ECC protected "User Data I" bytes. The "User Data II"
+	 * bytes at offset + 2 are not covered by the on-die ECC engine, and the
+	 * first two bytes of the section hold the BBM.
+	 */
+	region->offset = (16 * section) + 4;
+	region->length = 12;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
+	.ecc = w25n08lw_ooblayout_ecc,
+	.free = w25n08lw_ooblayout_free,
+};
+
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -810,6 +850,18 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
+	/* 8G-bit densities */
+	SPINAND_INFO("W25N08LW", /* 2x4G-bit 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb3, 0x24),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 2, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260831-mtd-nand-new-chip-support-44b10657243f
--

Thanks!
- Nuno Sá

