Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907311;
	b=ygUOXm75WbGrhEkrzCNYs4XnvMt9/DHXDTifENT7o6It0nF4skPp3acVSLYS5vaR6VJ5
	 rai/bAZ8ITMGfv/S+m2ZBMHf7y75yzyfwLADp/leDC/LQ4Bqtww8nBQbLT7AGHN9Oseaf
	 499/1EJEW6R5dfMQmZvPcbTRd08n7MPvzsQBGgExuAg/VjOJVyURPX0vlwRwx0M0oyz5W
	 TgqUgEoQhcdAXXTBw7/KCQUdjZvhLjPoqr3XRggZ3fAM3Mf/BHPAHcHDZEkcDFpDXTrHt
	 lc2TIfkd451754Vjw58L73IiTL/64tQbIHqDXpJF/6CqjX3VsB66m9b1zsfRZJpo5hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907311;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=g2hn58NgHjuLliCTM7DuYoWbfr04rRPGx5z7KIVmxe0=;
	b=g0N24Ce7yMgODuBt6twuMsgZcGsEHlms9Fl9+HmeYQLg67vBdh649oYYNNKXWjiiYiM/
	 U3YwBWz49cRfW7mZk+FGDv0ilrPUGETFVkD4MbU4Z1vp1QAv2SNSJmn51ShvWQSYL3enV
	 f9SbqrK4z+yBPVrY2NIuIJlF/ZE+XJmzSpYP6M3U+6c9Wm0f8hcpJJfKAwBiZqy8Lbk8F
	 WNtPzNHCvfEkk0vUSjvRF2pkL8HXYwsfIaId5VlAsPYAGvzVK1wli+f5EqHwaZKvhteBF
	 6+HyFMoiP6AGBewPb36Xt8yFeKt8OiSVNkOzxEG9b0Iyj8O7oGBFGwzMN5RafypHDrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JtXSSjP+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C067606E42F;
	Thu,  5 Nov 2026 19:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C067606E42F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JtXSSjP+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6018msRzspSnOeFPIYj1q6+JZxSQDonNUtcoJ04g1xsgz9XiaQ6Dw75D9F8bfUP5KSZUc8EuxdcMeOFMdPdA1/Y7G2s5Ik37XpqUeY56bXLl9CTaKuSObXyweBLprxHnNJ6m7/4PZn4qGPaaHdslSV4CaVSNhZXUa1MPbHOg83qe/Mpg3CeNWV8HusNccTQ3RNbzxbyOnkX0WpSlQaT7HeMa97tkeVOhTb4P6XrHnarMVRbuhmSiNEKIrIOlwvzvbD4q432wZqUvvtJ5fNK17x4r3PvyllxuxQXh0d9D7Cc9Xp+hRV8ZiyFh4yBA6IYyC0yUe+QJTgPmkReqVyQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2hn58NgHjuLliCTM7DuYoWbfr04rRPGx5z7KIVmxe0=;
 b=o98nrx8Kx20sU94XRTzXMcCjZHaPY2hA4M0JRFGnqwlUXehiHZIpVWudBxOW1NdH+SQtqAZHJ8vYuWl86NZ1AB2tM8P6e0NbltJAHH/ex0GreklMx6pr2kf0RTYUWKJasBgLFxGQep+w/v5K/HICZCeGTQBa8/DTaSJj0Em2z7JW5vTbnbFAuJEbk2ElX+6R9YFwyy4bo3F/1qlqFBEd9d/wjtx9bMtzaQPDBjPEpJSHc/0fD08r+8IEqF70HeAnpjxl1xJeagF4P2awIAT0NKYAMBIRw1l/z/Vj9Bbqhk5Pzn5u0W3ocS6negbaCWq6blvf8jdnix0yxph5Wkb2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2hn58NgHjuLliCTM7DuYoWbfr04rRPGx5z7KIVmxe0=;
 b=JtXSSjP+j+2HOsYW97OKvo5KttgkQe75EUERC44GL+IZdKpWw3X6D3IHtDRuOHPr/iFo/BeCKovCJeRyFME/QLS+jEgXA9hRrNLuHvehqVHkthn3+9kiFl73NMFKgAVUm54sFsrb1DNTP71UfoDu/ySp634OAr+XkPbQATjRDiTz5ile+wQYCZjO7MvT40TeOoTmbuIvhwy6UK9lR397v+ViwY6A6ATG/OK05UWPIPxrg9zlmwI82u09HzN46FBtBZVy5l6iXRa9VPxI8SyGkl15o/yM8Bblie37uuUG+fcXGKi2328ZRLAcCtg4USt4wFYTkUPKPe1YCd55ICQRkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9956.eurprd04.prod.outlook.com (2603:10a6:800:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:34:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 19:34:56 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
Date: Thu,  5 Nov 2026 14:34:48 -0500
Message-ID: <179390728552.1611796.5258257491078318914.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026092858.10591-1-stefano.r@variscite.com>
References: <20261026092858.10591-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:510:324::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: b813d1a3-838c-454f-20a9-08df3b73df37
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|7416014|261021121427099003|261022075727099003|11063799006|56012099006|261102123227099003|10067099003|18002099003|22082099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 lDNPHre7sR6xUFJKds554s9FrzF0GnOlfxLoDH+88ldOCP1Zk+WvDiH/qqFXoiHQuE/IBMouYv/G33oIpaHk09j387nJX5Llq+CsARFzjnmAJUb9k+wAtrjyM8kYcYAiRKIje/6Rw4u+ipBXCzGgHqCj9BlRW55RaobT8KR2lZI11O4RlZBmdL23ShRs0UPe+DjC5bzyh2gLz+WYdIT6P+/93WWoQgdGBHzsk70QlEuEt8h4eWDl6QGJ6gyiKjjxrSF2hW0CXQx8vQ9lLjCk8uBf2wjsC561X5W94Qjx3g66uDqSb7nva5dEPXiqKzRnNiv0+jReNqLsU5dsQc7cUPM3IGqUxMR1VUCtFJHhUodu51jmOfdG9dBnLosJ64DCkiu2FLGXUfRu7TODY3I/lM4+GCVdLQ8RKBugXhnJiFJzjdy2xVTomyEEMeEnWO6oK3zsx8oUBHdKq4pygNVxYC3SyMD9mQBALS356Cq9hq1SvOFoheeZ5Gu/bW03RE/rCD/8yqRye6/yrkxylJ9EibTfmMTCDbjck+hsE89wezvmuWrR1tLfDaf4E+VeY1PT1iij/zNncfG4Uc7/vYShUSvPLUxlu2mFeE4bYV1SLYDmCvNrbTJ+Jnsl/6Tv5VMVHVjIhVs7JAc+Xv/h0oqaBKTd9XNNBmv4I1/2jdnD1XI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(7416014)(261021121427099003)(261022075727099003)(11063799006)(56012099006)(261102123227099003)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dnRXamVNRHdQRFlqVmUzMGc3UWc4cmhjTEQ2TXhHSkFFL0MzVmkxanhjQjlZ?=
 =?utf-8?B?SUlRY2FkRW8yTnRTVE1lWktiL1VsNFNEVmY1NHoyZjVsZ0FYcTdIek14a2du?=
 =?utf-8?B?TThoY2d0c040MFYvSE95dDIvMXUxV0V4WlNHMFVwNm9iYUczQW5vNkVwUGJk?=
 =?utf-8?B?OEJjWVRaYjM0eTFHdjZHNzFINlQxeThpRTEzVEJxVmdVNi95TE9HTGZYU1Na?=
 =?utf-8?B?dFNIZEs3VllmYmNXQUVRaXlUSThEelpYSkpIcWk2cnJjVjlXemN2aDhPdWwr?=
 =?utf-8?B?bytvZGlFelJadEJYQUI2UWpYM1hJVUpjVG9MeFZsVUYxUjlkNENObjZCN0Zr?=
 =?utf-8?B?YzNaWDdGZUhPRlNHRzNPbmFWaTBJdUxJUDRYeEtSOHVMbS96WTRrMzhFaU53?=
 =?utf-8?B?OTcrUXZKbkpPMFNqM3ZobFRzQ1BRTXVKVGZzOCttRjhSeGdQaEJhVktSZnY0?=
 =?utf-8?B?cU11TlYrL1diMHRucDhndi91NGdjOTlFRitObk8zMlN0NXdhSUp1Q0lGd1p0?=
 =?utf-8?B?ZnJteVRUTkU3SHA4b002UDdUWkl6aUo5VHRGWFhVNm00SVVkWm5jWnF0bmNM?=
 =?utf-8?B?eHpKc1BKamtWWVIvcHFHQTRBMDFVOTZWem01RXBrL3A0Z2l5RVQzMnlNSFVU?=
 =?utf-8?B?MWtNNmxzUi9kcHhqVmEva0Rqd3Y0eTRla3pyUjRkUWw2N0ZKdllIMm1NMHlr?=
 =?utf-8?B?aENGekZrK2FCWHM3SGJ0Zzh3bk1yajN3eWhueWdyTzV6Q3psS0VQR21pY1lz?=
 =?utf-8?B?bHVhSmFzVzdyQW4zQjFXaGM0MlYyUDZiVmpzU0IrTmFhLzl0T2JleS9FWnVH?=
 =?utf-8?B?QlpLM1dvNnhpZk5wVUpPM1l2SXcveW9CRFlSWTRxdEFwdldIUmMyelY3VDFC?=
 =?utf-8?B?RXdFVkpCOXRQS0JlWHJEc1RGcklLTUhNcHlWZlFZSVd0TkhMOGFqMVYrbFV3?=
 =?utf-8?B?dkhpRFBEV1RsM1lzaDVkQ3lBRkQ0VG9pZ1hJd2xiT0FXYXR0dnV0cWplTlFH?=
 =?utf-8?B?K2NoRERHZlZtcW5ZUnl6TDhxaGhPSEpHTFNOeG5KcEw5eTJyQUtuTXBFQUhh?=
 =?utf-8?B?ZGJ0MTQrOStSbEZPVisrUWxiOWt5SzZJY21uNENEWGRZK0o3TUQrVi9QTUdT?=
 =?utf-8?B?bDRyTmw5SlpMY2Z5M3BiTE5SdnBRazgwMVYxNXVkdndiaDRqemdsTnVKWE1u?=
 =?utf-8?B?eDRFYzFHbTZLSjlvOHRyaU1PS0JTOWhzeFk4RUlTOVdJditaRXBtU1JENSt0?=
 =?utf-8?B?NWsxbXprZndiWWtJWHVnVHJkRVJOWUVqYUZSWC9HZmNFSTJTQWNPWlFBWXFG?=
 =?utf-8?B?V1dvUU40bkJpNTh0d1I1TW5pU0JmRmd4YWcrTjNCMHN5eE9iQmR5KzV0TlJX?=
 =?utf-8?B?eDZkNll6OXFqc0ZYODVhL0lRQXd2NU5GL2pxaEdhWWJHcVhqdVN5TExwNHZI?=
 =?utf-8?B?YjJCOU84NzhmUW5BUFcvNmhMTHcwOUNYWEZKdkI2S2JNeWhETmdZdW5iT3dM?=
 =?utf-8?B?ZnBORmpxcDNCYThwckRxQnNUakM0SW5ac1JPNkhGd1dNSE9qZVpCL2QzS1hn?=
 =?utf-8?B?L1BBeVd4aVpRUXZ6RXhiMHlodzMzY3MyMjc3SkxlakxZVmRQTm53eXBmYWJo?=
 =?utf-8?B?eE9yNFh2OFFzOCtZT2dPRFlRVDJXT0FXM09TcnMvRHY4Nk9Kb1p2dmQ3SENT?=
 =?utf-8?B?aEV3Q3pkcm0zQXlvMVlOT2ZYenRRZlJwWGVrU0daVmNPOEZaWnpUSVRPRVJz?=
 =?utf-8?B?VjJsUi9vQmwyb1R4Sjl5YnVVNm5nVWNWR3RKU3A0aHZ2b01uSGY0VWJnMkJn?=
 =?utf-8?B?eHpTRTdSaTdteTB6ZlNnbElZRGt2Wi91WGJFUXZIazJWeWVwc2VOT1pZdUFM?=
 =?utf-8?B?allxb1IySUN4MC9tUnhxWG91Mm9oUE9ncWN2ZGdXMUp3NjBMZkExQ1RYL29I?=
 =?utf-8?B?bHZyRW5BNG9nREUzV2Y4TzlrZmlHb3VNSnBnU3lDZjExcU5QTWpEQTJJeE02?=
 =?utf-8?B?VEowelVodjNnU2hjZ0YzelVabjJNOUJnNTlhZmZUWm00L2FMNnRXWVN6Y0FS?=
 =?utf-8?B?RUR0dUkzZW1GQ2lhdFNYV1Y3UVYySkhuRnZmVGtnK0hZWFpaOXc0L1NiOGcw?=
 =?utf-8?B?Y0NjMmlXNWNXZGJ3VS9nSStSckwxUzE2VlhSS3dCcjUwdjFjVmRqSWlOUzV1?=
 =?utf-8?B?NDVmREpJeFJ3SDk2RHZKdThIS2MvbXdxSEhQb1ZWb1NDUldUUlB2c1JOL2I4?=
 =?utf-8?B?RUpYbkxkYlI4YlcrUW5weHI1dHVLVGtUMDlHVEMvRVRxZlp6ZEg2c05sZ2xq?=
 =?utf-8?B?U21SNSs3aWowczJMVFdsVldnVllvZnROR1RTNHowNFRqMHdGYnhCMEQ4bzVN?=
 =?utf-8?Q?Z/tZVfCKdzArDnLWYRGDkL66pMxVgIrSawcIe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b813d1a3-838c-454f-20a9-08df3b73df37
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:34:56.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZbGjX8RZ2ETBbghm+oImdcElV53ttLEnD19wL4Wk8qkGhYK4siRNeYhz6RP2pvB1HEg3sVIk4fSZqUY7BBc064hp7ilos4UQRBIY1wPdi9YqF/jAGpOVR2+7TopEmrS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9956

From: Frank Li <Frank.Li@nxp.com>


On Mon, 26 Oct 2026 10:28:58 +0100, Stefano Radaelli wrote:
> The PCIe PHY times out during initialization on the DART-MX8M Mini
> with the Sonata carrier, preventing PCIe device enumeration.
> 
> Add fsl,clkreq-unsupported to configure the PHY for operation without
> CLKREQ# support. This makes the PHY driver clear AUX_EN_OVERRIDE,
> allowing PHY initialization to complete.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
      commit: 7f7556b5b09c1287cfa3cd3325547a4eb897f4c0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
