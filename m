Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983501;
	b=QVMPTfhURH7ZzL6OsG0IIs8OJmBrtyi4OCpxstaL0ONUOO/DZ6zb1vzNvv4CThYLvNsX
	 uHulOImlcx6hh46YgcRZlu7f6C4p3GYU36C7y+FOw3B7B2/5UzVG0wXdhfUachBy2G5jK
	 Ngo0gziZEkOLVfCBWQ/32rpfu6aEaBw1l8uwAnD8X5aGedkhAFoPUdevp3GDedhZELdNM
	 PZUPsIY0jjoC0pWhc/Bjl2Bssm2bW09/Gs3VRhflenNMNjuqvdIryalsba+Zz1qUq8tuU
	 10AhpCDbG+VsvuCIWobRBEz5gaoyIGbDryrmGqc9f+cUN5Q9GdXTJPjFhuILXgKDCEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983501;
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
	bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=;
	b=26gqQxTv1Ne80NEzYk0kdTCLZRrjYcTQjrioXPREnbwudlCI39v5yEPcAPicQmJuloXf
	 sPugHbM0X+sv6mcdy/Jn2SCOg0bZFLokZDMXRH+ETYBY4hjE/4tDPSwOxGL/vFZhrDYCx
	 3HcOU8j7F9rUZ1iFdc37hxaRdCsSV/G0Xtejz74argesRMXxcKDIFQp9+XEQ7nSWHNIwu
	 AxXkp1+4syprm7u96cpsO07UWwJUto+udiGlMIzxyMyG+rVbIxL1QNhck477GQgWjjL2j
	 qF8NX6A6WydM9JCKa9Ak50gW/haP2WamMzq0MNxxcWkVKkBnM3KtHRMwTRYXrIhKU4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="tR0hY/j3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBB4606A335;
	Fri,  6 Nov 2026 16:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBB4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tR0hY/j3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjgjMaLWi+/oa2If8h1QedBOisNKHCl05HAKNgzsClDZYC/n0/HNbO0Qgl5Evn5Fd92eNnWqhMxG63pMHNfqHl80w9J1GhhIz90Vkzc9oC+sHPnGV5Rk3II3Q8enS9BW0zTi/HLJcPTH8Hea6cuh/AfCuQ+55OXyJEcKz6zSYoGgv57boTKOxjbiSQuXLxiDaYN305RnlkpT8T63jWrvAFfUJRlvMK4KHr+kVWBBpvIkhbIFp2LPoeY75NP5mE7vJWyYVLS6xjOF6xllSX4sIgm2eumDlNmjo6xj8n9QcuboCKK6Kv5seclDUhbmer+Vb3Vl64eoGAc1HLMSM8xM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=;
 b=DmmTpuFRiV9DH7EdE5RL47f+BPGM5D0guiAFLwsRg+bcXOX9gpgL9WvkeFvTNB+B41FBqvboD2EKSkV8HgV4llh0xJM/lIRgj9u6x9m0KVesQbn1zYidrBuUqYmMGcZm6IStXv7n2Wp4b6UnwT2gR/S5dAydm3mb+ILlQWaJ7mP5o5vhkInJ2Oba+il71erbdkflkSo3jblmT4XzcFFIjT7/68FFQkgYE+0jv4v2Hwwet0TNSiyIwDeYqoaYQBrzc0QeXkNKSQgKkKU149WzuZshFdF9edj/UEXHgl87zLMwz4NchOMMGJJtWDnzXiLX8RwiNlpC8pKv+5hmp50pCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTQY82W0uNq8p3mN3w5NPzX/PNjvwPz4KL9yh5lHRwI=;
 b=tR0hY/j3UJPGJtGVOGe3Ng67xBuEMfxEe5D7UN7qfedqpuOI4qzf1ozFalCiZ0Cfgkb5ZNVmofxySX/1mnr15Kz7ZfmyTbHaCzvji0hMxLdiGynMVi7No6Dfmy8I3KNc606ztp2jeVDbXlU/vSj6+yBpI2JFin77cMi+vnmUddFdlfvtgpNxAp7VQ0RqN9eAhWLBrwM+b43WIJYyQemLRFKtjRH3OlgHtw2xFAqUZMvlcuXBohhDkSySakgj9MMAleNrrq0BEh7TKS0SUFInQ6/vzlqf5eEdz5GPYuRYZEVL9gkv606Yw/GaGNEHTdYdgVT4ohXU961K580A4pgBgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:44:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:44:56 +0000
Date: Fri, 6 Nov 2026 10:44:45 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Florian Ager <florian.ager@bshg.com>
Subject: Re: [PATCH v2 8/8] dts: imx: Enable USB OTG mode on BSH SMM-M2 and
 SMM-S2
Message-ID: <au4D_aHhd9kBmpQi@SMW015318>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a09761-944f-4b1d-d15f-08df3c254a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5ev8iYOvy42b8LCiNinMIJQI5o99A8ie/b1soG0x01WZCFmwR3W24d3K8Zzztt8FKiLziV+RA3OMXnM+mxCXFK3x/cKdWUEgcD9AdrBgYuPw+PeLSZVsSpp8QmgHfyG3tN3Af+UxHAa0e4d15ZCPojQc5jmvqH1B7OCPRMncaf4Kz8hBHniRj/KCNKwRDKzG6B1ewIhA/QFlql3f+wm5B4ViMcarZfBm8ScZhZpINw0QXgwT+WGe4rHSV4ld7ZiThW0OarD9rP4WsvhgHD8TkObGtXMqbx/nZSx4IfHMqYRFXUu0l8lYRqHwVnrKnv5bXS5cD47N2MOzh2cNb+MiJ/m1U2qLSVwyM+afaG+DfCIhYTO+/VaMHa8dTP7GhjbVtzw+UhX+pAPpZiJQn4FEp75lID0TDQZWZCQkQG6K5qy5vGkxdMU10xBieMKO71Hw/ebm8Pw8kl7rREP9UV2RnBx8qmv5pGmqXkqJzrkrKQjgWdsWT4XYKNAqAIWBux0bWvZMdHdXqKxmzr6Qy6/k2PdH85N5cx0d6FW24CjQKhuTtwXzXPlCvR+Z340lTtuu3S2MwZ0/OmJJ/FzfZi5Zmlc/qFpkR5trsZ816jwL1vh+OJecWKOULlWjDhOfI+sxS/K+gaJTzLIz/DCESrsUCcUWJ3cJBCE5hSsBsUYMLGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i8ZAg4ANYpqOOLlt5hFh5w92tnYrIa4QHyJsdo04PbahCXahKy7QtljjuQem?=
 =?us-ascii?Q?bsWiDeSa6lJza3JEYAhqiFqtZ1KDzY9GJhnec/+uFh/Dus1jCiI5s72mz8kD?=
 =?us-ascii?Q?HI41XnQotxdu++7g40l7FroDfSdxSgGIiUO6EOWnGeaOF0TL6CqcRfmiywE4?=
 =?us-ascii?Q?xn1+2hGgxWCzL42bKYJIRhfjBo7AF18iiHtWi+b67QZN4Bwbz5kOlzOnHcfg?=
 =?us-ascii?Q?f2eLCSMveVOFhsauF2g7/s/1rQoiXiqNYApDZ+rgrJ91ToO5KrQubtLKiqy5?=
 =?us-ascii?Q?K6UVuuWDVmOI/b3OzJMbGForA14S1UGlgjVCAgqvcGO6pTsAmT01dUlry1zS?=
 =?us-ascii?Q?d7XyWZw8cNlGWtj30V4798uO2iBMiw43C8VK+afDmYjFE6btCrp+X/xMQRSg?=
 =?us-ascii?Q?EECZkpPT/fSZ0LEEP8YIh3uoVw8/k7pweXLooPPs+81G3sVvC3IYfrdHAru9?=
 =?us-ascii?Q?TQsnaF91yB3irMQ5NH9Zm/LL2xKKes72dtDVYYKyTUbphyCF0SPqug0y2Qyh?=
 =?us-ascii?Q?d2Dvv/e1MmTrL2gj/mkWVjgqsJOsEX2fidJZNGm1Vmo+VIgTWmBbuYyRkVyk?=
 =?us-ascii?Q?RR6qY47XXgistlXVaDWXYlZ7ekItzWAhTKJ0fuRXsu2X5s4BniP8HKcKYp6B?=
 =?us-ascii?Q?IJKD1wmPc7o5zIHYYID9HjRLuyCrql2B4qgH/mBYgWuK7A7xxObNiVaSWhuo?=
 =?us-ascii?Q?nWOs0e7J8nAvZPF9XLkdvBSBx1uMZJrVbD7Gs/FPQ+KqzfyenDzv2XhqzlVO?=
 =?us-ascii?Q?maPo+sSeiSLn1WnGnE8UKNRwO9zka75/IRba7TOXMqBC/ZyOf8MQIkSMj+bg?=
 =?us-ascii?Q?yCrkneBQnFiEpGS01VXnQie3L2PFJ7CgX+WtP99YvTgutkEZIC0OSYMvWtx1?=
 =?us-ascii?Q?Brx883txcGybahSA2YIz/m0Q5a9kuXdtP8zkF+1qdro7ALeyma1DPmNM7wnu?=
 =?us-ascii?Q?a+1k1++PLrBu8wFpWTbXVk19lIGbeFegfFo6nhaGqqmM/3sa+xzz2HuUJmUi?=
 =?us-ascii?Q?82Qg1XEpK4iXaCtSAiR/MaC/dCTo7cP6IVOQrEMtmFvCAHPJh5WXM/kyezvw?=
 =?us-ascii?Q?L0vdLDE27R6ClyKH3hGWtE2kPqlt6qkM2XMTvgN7DuVIwfiTH/dQrjg/DNoR?=
 =?us-ascii?Q?kEqhraeI6mpPc4NzyS/+Axy5AXQfGzlu4TNDTkDh/b8AfU06t5VHGih5fUyn?=
 =?us-ascii?Q?Iu3HRPsUTsEkABzmxT0B4r7YAuhCyu/i9yE6LVgjadONSCuOvMF/aE6mBWCT?=
 =?us-ascii?Q?ouQd/MwpQLbA9rBpD+RZ8jFKXPPlK2cs4+KOaC0dH9I1dtJ23LqOdrc/Vw8t?=
 =?us-ascii?Q?TVnh9Bx0fvqWIHCvxd2+BDv9kAu+cd8a7/w3DctUzb3slBiX0HFV30wtpZ+v?=
 =?us-ascii?Q?D2Md/qg0OOyhIpyWe0xUvkQsGRG348aPseXVQDZMWaOADKnMAx7ePqeH6YiI?=
 =?us-ascii?Q?IvW3TMZliG9m856TRb6WGtoPqOA3NCS5i+tChjnb0BNcXLT8TltPwoAACDe7?=
 =?us-ascii?Q?f0X1iATbJb9S8Rv/VbM/Cjp9/ZXgrDOW52pcZSfU3MIfLkf2Nbq2AYv0mOJr?=
 =?us-ascii?Q?QKeDFQ+nK/R0r/b3RswJ4SFOEjRR9L5VC2pVsSZ3/cuZsM3UgjUrrcG7TWSc?=
 =?us-ascii?Q?XkplbcXtgQpPVk1H9NiC0hJVMqRHXPJYKpYQADOCs/Z4mjZaVaXP7G08+PdF?=
 =?us-ascii?Q?ePtNFPyEqy5MhfObBAdKyw+8yswzlt0m8dSLN0d+nZOBe6DPIGWoKuPKSxm+?=
 =?us-ascii?Q?z28hcAd30ycfPThhjSv/9WON/kopHm+JWEQb7n9YZcuFGAF0H3cJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a09761-944f-4b1d-d15f-08df3c254a10
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:44:56.4594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqBNpXJU80E6Tz+4dcesBSkN+CyIEfvdyomk3Ml5etMK69ne1ZecKL4XOzY1ZAzU904HG23sHhQdYSFk4gcluFNvqdYiT/71byYPqW8iKx4N0HdVqbvIquMEMg4WmF6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

On Thu, Nov 05, 2026 at 10:41:22AM +0800, Haoning Cheng wrote:

Subject missed ARM tags

ARM: dts: imx: ....

check others

Frank
