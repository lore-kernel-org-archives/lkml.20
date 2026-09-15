Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9613411FBE;
	Tue, 15 Sep 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469265; cv=fail; b=tPOP9SMPHgxiDgKptu0AJqeDOiYohd4zF6S8GJxAEUbg1OA/Q5XOmRDhJ5QFtjd0XVLZUdX20Jx2cJ9F22Cn9Ih4M1lPwclKR2i1+sBPAgWBT+oJv5fb4pLRo7v7bPOCFczG7y0JIL8n3o+FXDhV9yiOSRtdD3m+ZgSvNP2yRFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469265; c=relaxed/simple;
	bh=6w6lrq48fkaZnvVVXctRLdR5hnexAPbbSe77QtdWGY8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pQmDM/OLV2DShbj3OZg1dmW/aX0cmLqXrG/jtnkGFUvaPRSYJVupyL4JwMNLI+ow20MhA6UTovWt71Hlb84d/KiIp9VDzuExELwFjUIUIzHbiUNHzm39G9GeEQoDFVWmkgLSymqyETuh6LQzXbvbvqk/OGT7Hzcy4uVmdzkCVH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z7JIZpFW; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z7JIZpFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmA6rL4JjkD/3h9ucuTeDH0ji5sdYH+tjnwRfMXKzhPmSqFT2m9VNsqSW6204zo5VKifW8Xtif8NmGKpoFU2oA7+VDK72y88uL85L6nCY/0Ja4KbBPKy+UejzIxr+fRH+P3TnQ0dwUlj0y8HFUoQGco+bZU9zLwT7KlqcyV4NblKVoPJHRkFw6oUzvvD8yBok+luGP5l1ptM45MK4HiurzvrPOQujcpQ2JnhjZpHsC+ol8UhB9/VkZKYu+UsDBqNA1FYJogjodzG5orMVsdM3jHUuu2YzY1RKkEP7WXJ3JM74qwd35/Pmi84qqA1nKY/VMry9KhI0+vER5rdmPzoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=902Qem0l7z7Y2GC8Yoif2BiLtzak76nbZc4zvf/aaoA=;
 b=rA4r/m20AqYOmvqdX3r7bWGPqdIPaBeXJKLLhsqE2VR0+DRZw02VJ2Iu0puDAygBzncZjg4Ao3MsDG46+RbE0ESMNoO36iieX66kUhfA2GZmQ+gRJHTuFMJb3d0ydK4nTDQi2aBwKr2up0KGK7C8UQApSK6HAGZfGAs4mnH0fIrIl3YO6v1ZfNWw7tdsHx6NeY2lfQZ+k2P4v0RAIpElVpq/qDD5xYIJkCQj1+0Te90ZOBbGNoqiAaX/+SIS6Vm3UfIi3S0YgeJqKdBfjAfRLGC0O2WD+Ud2zXhCfZ+tjsImnVrozdqn4Xv9YaEQXw6dnbm/R9nuddtWAWYvQKmoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=902Qem0l7z7Y2GC8Yoif2BiLtzak76nbZc4zvf/aaoA=;
 b=Z7JIZpFWfgiA5a7DwI/0gHb9t42mMalhWskKVdUIhAVOcvV4qON7Bb6KIjqbSDpAbQyoExw0+FZXWE10xKzfaIQr9I+JB3mbOABFNCkXEcsWq2w6Zf9vNP0aP9v7FJ326CUJrlp4QYOu8RZ8hWzzUkSQWUseDXNziuQQVO7NJlo8Oi2kx1EumKyyAbwAL+koknQjptN9pRdhZETjuYzF/SGTM5lqiHCjbPeGnPEF4YUNCY5F8Ac9PcmACtWA5eUa4Ok8ifGsekoQ3aaV6fGDauGAuaeHbK9EAjFtsoAVONc92GAT8TVtB62XiogVLzUggVpmGGcZ8uDg0B+4XfG8Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 10:47:38 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:47:37 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/5] media: imx8-isi: Add i.MX952 ISI support
Date: Tue, 15 Sep 2026 18:51:47 +0800
Message-Id: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMjqWoC/1WMzQ6DIBAGX8XsuRj+pNpT36NpGkCoHBQDDaExv
 nvR9KB7m803s0A0wZkIt2qBYJKLzk8F2KUCPcjpbZDrCwPFVOCWXFFZvNyYu4YiIbQUje2UYC0
 UYQ7GurzHHs/Cg4sfH757O5Ht+89QccwkgjDSykopmcXl7j7Gespzrf0IWyjRg8zISaZFttL2i
 ivORc/P8rquPz4rIZrjAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469512; l=3484;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=6w6lrq48fkaZnvVVXctRLdR5hnexAPbbSe77QtdWGY8=;
 b=f+6EEV774020Ti70pVKu6A7o+wsSepB9MH5/SMUGZf5pV0cMYZ0RjO/ax77hmTH6pXRxO4ajz
 /TgyLQoJukwD1VVLbA4FvdwHZt6etAL5C+Qmyx8Ux+NsUx9XaJ/PEMf
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::13) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 96318de0-50ab-48c7-47d5-08df1316c187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|18002099003|3023799007|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pE17M8hn8dMiokBSGc7Di4Akj60fYyOPqROJfy+QcMGoEg//ka/2nb0Bh5/+4CcOPQIv2651m45/xnnAoyBfl5JstMPSpQ7EhmHlOgv0UTs66BtWV0osZFD7EFNqC8Ge0m4r2YPMpJdktLkt7JM7bYI6Ubi89cMt+9HAtq0SF8OFJyPBpxLsLr4mZaDotR7TScxjQYW5jvGWFXUgzxDwy4Tg1Y3dQfnB126YDCcGspZWx+aQXSBkSuXqJulw/1xKSgTrH/056PHDz97jgH1P7odme81PayN1XxMnUbjqdk6E9ixWxyvIZpOB5ftJp+8fB81+LWJKztJ5hJlkkl5x9Vp0tq8ev4V2+jJYR1kK3HwpGGMfCqVm4QnJpW8JIb7yEAakCiU44spzSOU/6963Rz2BGoiFkgpa2GD5xQgs703ZDVqJkt49WXADcLmGv/MJeIQGUU6UF8znhYcmPSqOjmz4IUwsqvvznYx2QPelX9jbim0TBW6gLwbEWAOPVpq/uO/HRNT4SKFpYvD8nit12EjVz/7vLPzNCKaNUmKO7Mdh/47Pz/lwsOl6rg2YOoC+Dqpl6s8G8zI2z/EZhkVMaj6fw2Zo6u6ZFCiBv3BVPqA2O65UkqAxcRpiwMWgBhfGZKT1B41K8sf4G53GJKT30gKa3KfR9B0CMeiOpJNoKUHpQXal8rnn4SbPnHwKeqFbQvPyxWHwHs4hurnUlzoIew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(18002099003)(3023799007)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFQxZ1ZObG5wN0VNczY2STl5azN4WmYxdlhiK3hFV3FqM0gzZlF3SFBQZ3hS?=
 =?utf-8?B?TjA2VTJiTDA1cnFSUkZyekVDSDU4cWZaYmNOak5EY3ZkSHBvWDJkanAvSkd0?=
 =?utf-8?B?eTUyV3NxTDNyVitTUU84SUpTd3lpOEV5dmRwcGpBdVR2MlNpa1NtT3hDcThh?=
 =?utf-8?B?UG5EUlVFdVlNd2VpenRmT2ZnbXUxN3BsTnVwV3QzSWRzc3psWWNJTzlvV3Mr?=
 =?utf-8?B?ckd3ZUJqRkd2N2MxZG5EeVZKUmI0WFdvdGJEeGw3L2VONG54T0VEQkxHd2Mx?=
 =?utf-8?B?VEl5bFdEYXRwUDJ3RnR5czh0VHdDSG41SkQ4eUlnYU5iam94bUZSZmVaNlZO?=
 =?utf-8?B?Nkx1dWpqNytHOVJ3djVTQitpeVdzQlVNNkxTZ1RNSjJTK1kwVnlMOUhQU2lw?=
 =?utf-8?B?elNWWGsycGtTTzlZMFhPMHROK1A3SldGYnh2VkZZQU1iQXEzMzV6c0liQ2Jz?=
 =?utf-8?B?ZUpmVXdocDJMb2ZQVmttNXJIaCtjN01kalJBUmNRS2NZODhncktWUTRObXhT?=
 =?utf-8?B?MHYvN1BlRUY2OGZsSmZpTTNsbjZsdER5WVNVVG1FRkZ0SDFYUVdJc3BleUM1?=
 =?utf-8?B?OU50MlByMWpkSXNGc0l1OWlkZ3FFZ1hOZDNvSTZHcnUvS0pHMmxsSXZpeUFv?=
 =?utf-8?B?Ylh3N0tJdUw5eU5XbDk0ZysvZmxhVGxZVVNXTFkxOHRkMGt6a2pXM0N0cmFB?=
 =?utf-8?B?SGpKNWRRZXJJTk9ySU9Rb3BWRERTbDdEcCtTUy9UTmduUEI5c1ovbWZEN2Z2?=
 =?utf-8?B?c3JyaWVXZjFmNkJqdkd2QWppemFoUlJrTkppNHdubmlCd0VCYjlNT2dFbExk?=
 =?utf-8?B?QklBNEtqYzd6R0t5Y0p6VVFjeWFjbHZNT0xrQmJTS3p3L2N4OFpxK3dtaUxG?=
 =?utf-8?B?QlpzMGMyQ1oxeTU4TjdGUXFIaDltQ0p2NVdpeEQxQkVPYnJoeUZHVnc1NmJ6?=
 =?utf-8?B?bkxhR1RvTlBjK0NtRVpnNlVyM0xOL29tZWNVeWtRdTgweWt3bjBzVkxvMDBa?=
 =?utf-8?B?MFdxMHd0VzQ3NCttcXBUY2IyM2o3Y3ViOTBBTHR4OFRQb1Y2UnRvUGRDamJz?=
 =?utf-8?B?cVpLdmEyVzJhd2daZFhYbStnbUphQjRycEpYaEdPZlIvQzJaa2hXKzRnbmNp?=
 =?utf-8?B?QVZ4c2dLK2VFaGxQRE80ZGZpakJWUU5PTlBvRWZySGM5TmtxMW56S203eU4y?=
 =?utf-8?B?aDAxMGtTRFRPSjJabXNadzNxL2p5dzdHRWtYd1R0SzUvdjFxVXZ3dXdWNGFw?=
 =?utf-8?B?RmRCMHh0RnluWVNtb01ERm1odDhYNC9LUXc0U3JubzBMYk8vMW5qWjUvVzdo?=
 =?utf-8?B?RW9WN0trWEVTWnh2dVRwSFlDNDBZUzB0RXo2U05xWVk0emNpeFJjYTR2UTJG?=
 =?utf-8?B?QUhhWC9ZSDZTdXR5UHJQUGRzNXpRYXdrSDR2SEdoanEveW82Y1pMSldqR0pN?=
 =?utf-8?B?bE4rNmNkWDhaaFlmclpleEw5YVR0S0pOTzF6UjRpZmlUZ2xMaUhWRVNFcmZO?=
 =?utf-8?B?bklNVjR3UlNrZFNGK1F0WTlnMGx4TkxIYXdaWlVkdnFyN0I3NGQzVlMzV2JS?=
 =?utf-8?B?Z0VGamVlY245Ui9Sazhkbi9ZZS9vbVNTRXhaTStwWHI4ZWlLK3RlWmh0MlVz?=
 =?utf-8?B?TUNGN1pGSjZScmZDT2Y2MjRDRWVWb1U4RlRiV2VENEt0eStiYzAyaVdraVJa?=
 =?utf-8?B?cXF0RG9QSDNFZjQyNXg2Tm1qVTZ4aUpPcVd1TTM4YnFHTjlYOUdBMUlRSGpN?=
 =?utf-8?B?dlh1ZFgra2RhQkU5a1lnek9UMmlOWittVzRCT2twM0xLWFdDMnZrTnU2TVYx?=
 =?utf-8?B?bWl3bVhPV0VEMmpwWVpoMWpCUU4zb0oxOXNzSTVqMy84Y2FOTW8zeldWbnA0?=
 =?utf-8?B?ZzB6SlBDZ2N5SzgzVFV6MjdXTkEram9xTStDTGM5V3RBOWF3QWltVnp4ZWtO?=
 =?utf-8?B?QnJ5NTJ2NzM5enRRdDV6dzFNdEthblNxUjRSM2wzazlUa2RXTVdNL2F1bkNl?=
 =?utf-8?B?LytSYjkzRzRhbGttdEdBK056c1dQWXdMM2U1RWtwK0d4MXBMbEdoSHVTdllr?=
 =?utf-8?B?QmVVTmFBZnJ3MzZBUU0yR29ac1IycWJaS1VqU1Z4MUFxZU92L2J5MmVsY3Yy?=
 =?utf-8?B?TUR0SFM4eGFYNncvblFha0h2THhmMzBaM0tOb1NTc3ZsWUFmS0U1cU9Bandl?=
 =?utf-8?B?NzJOQXN5aGkraVI5M1M3aXhkU01xM3JCckhXYXNzcGxGblo1RUZ2cngyc1RY?=
 =?utf-8?B?eTRiVjQ0NjJtV3hVZmd0K2FEUlZxK0c2YTdTcFROYUh4enI1cXUwYUJrdnZV?=
 =?utf-8?B?MGs4cnpPVk56VkNHWS9qWkFYV3VGTy9MMFc2VFZvR2lSY010azhIOEVNdU4r?=
 =?utf-8?Q?f0qFJbHJ2Y7kjLap9bT5UjQdVfo5Nj7zuwhgy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96318de0-50ab-48c7-47d5-08df1316c187
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:47:37.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndRptgNiv6SeagMxowX6otGWhOclFKZhqYUX76hwrCZUHCx76MCXXg/zETACXBvAPRKsD/onrNU0ZLnq0nGafzu3J0ml+pM/OoDfQ8VValQMnZ12R30zY06LNff4O3aa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

The series adds support for the i.MX952 Image Sensing Interface (ISI),
which is a minor silicon revision of the i.MX95 ISI.

The i.MX952 ISI reuses the i.MX95 ISI core with the same 8-channel
pipeline and 4 pixel link inputs. The key hardware improvement is the
addition of RAW10/12/14 output LSB alignment, which allows the ISI to
output right-aligned RAW data directly, matching the V4L2 format
requirement without the RAW16 workaround needed on earlier platforms.

The series is organized as follows:

  1. Reorder mxc_imx95_data definition to follow mxc_imx93_data,
     matching the order in the of_match array.
  2. Extend output format mask to 7 bits unconditionally since
     bit 30 is unused on older platforms.
  3. Add the i.MX952 compatible string to the DT binding, using
     fallback compatible fsl,imx95-isi.
  4. Add the i.MX952 platform data and of_match entry.
  5. Enable RAW10/12/14 output LSB alignment on i.MX952, removing
     the RAW16 workaround which no longer works due to the CSI
     formatter providing MSB-aligned data.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- [1/5] Add Reviewed-by tag from Laurent
- [2/5] Use unconditional 7-bit mask instead of per-platform approach (Laurent)
- [2/5] Drop Reviewed-by from Frank Li due to significant change and request to review again
- [3/5] Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley
- [4/5] Extend mask globally instead of per-platform (Laurent)
- [4/5] Add Reviewed-by tag from Frank
- [5/5] Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- [5/5] Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- [5/5] Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is documented
  on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- [5/5] Rewrite commit message to explain why the RAW16 workaround fails on i.MX95+ (Laurent)
- [5/5] Add Reviewed-by tag from Frank
- Drop "Remove unused model field" patch; model field is now used to derive
  raw_out_lsb capability (Laurent)
- Link to v2: https://lore.kernel.org/r/20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com

Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank)
- Remove unused model field from platform data (Frank)
- Add Reviewed-by tag from Frank Li for patch 1/6 and 2/6
- Link to v1: https://lore.kernel.org/r/20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com

---
Guoniu Zhou (5):
      media: imx8-isi: Reorder mxc_imx95_data to follow mxc_imx93_data
      media: imx8-isi: Extend output format mask to 7 bits
      media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI compatible string
      media: imx8-isi: Add i.MX952 ISI support
      media: imx8-isi: Enable ISI RAW10/12/14 output LSB alignment

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 18 +++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 37 ++++++++++------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 50 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  8 +++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 ++++++++---------
 6 files changed, 112 insertions(+), 42 deletions(-)
---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260817-isi_imx952-66ca65f9b638

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

