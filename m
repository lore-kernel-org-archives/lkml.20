Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB746EF8D;
	Wed, 23 Sep 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151750; cv=fail; b=sLuupeCv/U2GpkmFu3YZ88aloopBVZzkd+4RdzwJcp5uk5gBEltiRZZkI0eazzRtunqNrqL2T3EAHakklpqRPwJ70zHV9pTt5kMgN039apZfFbhJEh0ibgf10Ra976LHAiPjlmvBrlFTpNImKblUNpZfggNqIITtM7TJeGMHf0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151750; c=relaxed/simple;
	bh=gmNsEjxPrqeo8VfwlUejpwSQ5984VOQPxkCzpvWqfwg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OAWplGK/A4Ogz8VwR8VhQkvUti5mU1S8YLTKujsOhhtU/Al84hWeazwpYtcTjmXxl3ckDPrUQVjBtktBJdctHjKcDjBQEhaNxq6kE0mPCJba4qKccYDj2ntZIAP5dSPh1cTXTaNMtfe5JsuJfScyxpv2h0p997DMPrlx88tYdZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Fh18201I; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Fh18201I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu/5acOedCKSjQPJteLT3u06mcR7HTV6tTOBBh7UBVOj96mPAB6HPVoxQRqxRifAxjVbWYMTRvbD+dURnymVn88bBPqrMrM8nxVXcsPGBAMKytrPYTUxYkLvIp76It2/RpyV07O3VSItwMI6lziJIsSCtKw02xUXTfOoa9PUwvT+uM7dVaFo/68mudqTElzP6ZvBoLx0oAEweqw59yTsT2rv8dv39BZZZJFVr+B57oiljea/RsQdrn98IVGYO+eCzEZAU4uYp3svfhO8RJ0jJDCJZ3xSMXYv21xduObPYxghfiqAGrKuGyRna8FVU/bCNE+okzeSdR9w7kE5CcIIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtfM8YlfTRnB9+PDNDz3EvIGTXcMUVhmPkDnaR2df1c=;
 b=eVoDuu+rM8MENadW3sGvAGhCGYsBjTRc10MPNzCrD/+/yVg0h2tj/rUQUupqteEPkGwQgtxtBfONkbBxPJ1OWTz0fPDroSeUwUfoKzWpcVxxlz2xaNg6oyhAwtpVlayIeMeI1j/C6VqwkcLMYe8aFTo+5G6NoptEW9R1zTmxF9blhWHna2+kjZnQ0B0ArpIcbBr9vLRWgv2ppFVPK2qfjMOVxVjwq6DdCQTbgXi5Qk/Ev3BlznXCz9npCWLGRRMpPr3N5K6oTZbow2oSTwSVxNGJdKO6Tf2fKC3lDexwlNhOkc7p3iVu2N/+8kdRxeArP+A6VQBDrg3LdTq0ganDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtfM8YlfTRnB9+PDNDz3EvIGTXcMUVhmPkDnaR2df1c=;
 b=Fh18201ICc6T9YNObx1BLNceWSiO4c8BcWjDzixAL0Yct9wMO0n5DpbxsoTHlX9F3tlPa0Sey1rrrrE0gfRjzc2FxXgm0iP8DKi0jlkti8FYTv1ODpuU9kb5XNNdbCfkp+a4vvZicgBEB4v+h2urQe0rWv5tKDKn15bw9V9faq+XC5ccm+ecsLuSdL9w4ovmO7JYAPL+mGvccOmFj6HffvTwXDAG9/ViJ+DAe6tQeIWrnVubiv9zVSyMi1ERKoiMx0xddV7LzNcprvA+LYrCbckaWgdl4Be50UMntANidu+N67XEMc9fuixvhh7AGwuo1wApqsiFVnQdCVKrfVIZmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:24 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:24 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: socfpga: agilex5: enable SD UHS DDR50 on SoCDK
Date: Wed, 23 Sep 2026 16:22:07 +0800
Message-ID: <28066009bcd86b50583f25458842f2a53bf40eba.1790151203.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 163a97ea-fb34-4b98-143d-08df194bcb2f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Te4EX9H0Vtb6HgjaWO96WifNoJX5X1h6AVBwId3OhjgNRN5fIrIdP4qQNbw0qXpTDZydLiJQNLrxgbOSrcII0MjtW0D0GZSQtEKld7ArSBUm1VrjAg2S8gNlp9F+vnuN2TJGHpRWZoaQ1+6wac1mrcA4c8UsR9EC1VG2ujU4YtPlP25a3mO1QgmvjOBDrgzfGbq+BaqmxasrtqPyVcqK6yfdaZsYPt+dfq/gO9bD23vo5iY6sRHuKgvFnoysUBzYEN2Z+oYu+ldkNPvtV52MRFQaPm3TjWFsNw8yQsOfbTB1QUVIGmATo+vtDrZz6FT8MrV3PO7otXAUJcZzxBYAmItlemcDAYIg9xQRaaD6Hoct+EHvU73JttT3k86i1vPLdMzZUUukX1yhjdqe0Yo75q+HZMpfhcB/4weBIzp0Dk6QeUnZ5Cn2iLGEba8IiV6Jx3y5diH7e3ZEINYKNduUdCrTgv1INxHw8W9p+tFI4e59fOCwHEd0IocUuZp4vnfq8tdGhAChM81PYX3UV7zm7Cd611nRdgms2f/IqR9wIrj2L45qeKDsbbH27DUJaBsq4AqOiLukNyCHQDUyjAd7uHKOxhSVqp+b0PffVwbUmG1Doct7VeIHsaOKbDPM4qXICL1OB+HDHy42DohvPvsDXUyV+27cN+BpIT//JcOHqvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WWiRszb3lm/blrXpjpSjQkJwonayig6iE8pPzPZ+8+1U7esXK54UVCWLBPDe?=
 =?us-ascii?Q?VomfZrxfjpvniNdGn+/YGpwCM/j9El3Kyb2ZB50rM7L9lTZisMoJfXPpzGLE?=
 =?us-ascii?Q?jxfRT/l+JDcZcB+fU0Cbu9WsuPgsqOGW2yYN2lf2dMQi4mI5EKAZH4YDKCFi?=
 =?us-ascii?Q?60jB07m+gnyba2LTxt5RFlfT3H45sy//gewpSl7uV8fhgfFGVQ2dYJzhBTKV?=
 =?us-ascii?Q?CPcL1Gy8XRu+6XDVonuO0xsLLSgY/iDrikAd4ntt5jC8kRUgkEvjKcSR0MYI?=
 =?us-ascii?Q?HYcgXDuu4CyLf25Dg26Rv/lCUCmIUvpjKBySeAhv0dxIJnqufpiescpx88fZ?=
 =?us-ascii?Q?AY7Dxm9a7KRG6+G8367KP3okFePHvlqD5evdTbFv7OJ9jcuQYAkSjQ7fF+uI?=
 =?us-ascii?Q?D9wGV3CeyZOmkv+CA7K8VuS0UGfyDwM4RNrSgF4WZdHnutV5DuqJ3NIctySM?=
 =?us-ascii?Q?KpGhNHk33hbO8Cr7dVZXBEGD4cyDrwmgxHxWOl6TugbI0FlPB0AhWae9RYen?=
 =?us-ascii?Q?+XQEP1wiz17MkRw24KI7E2i3Yn0mWuBQ71voCkIdhtsa/pOT16e3QPiHkG+t?=
 =?us-ascii?Q?0fsspQ2Gf5HciKxVYlYLkDrfqbVx928PEXiSxBUCh3aF/vzvq/+ENUfbdHuI?=
 =?us-ascii?Q?U7emo/9MH6QNSbp9iGwCg5RXfcVT6vt7wq0fri3WlkNceG+2s+zIpLIZw4Aa?=
 =?us-ascii?Q?/rSGkzGmUtBnOmrf8jfsldj8e3vaAWpk9iuB40ohcL9QWS+oGPJ4sQacYUhf?=
 =?us-ascii?Q?j1zp1wuLKCSQCpGUXzCGayFqcTgbcz1EWq+fPrru3rfggXacFifNgvhnNAOm?=
 =?us-ascii?Q?n/HipxyPODgAWSDaHzaAFfMBSopW2JUkHwpMxRGD6NqmPnA+jWAitbL5j9nt?=
 =?us-ascii?Q?tML3SC7rYvYtREZtP4iJ3YtVtQUYcpIlLywy9v8nDjJ92+3PaZX70SqTylnF?=
 =?us-ascii?Q?7xRhhbFzO7EGdzcAU0Z/KlG62rdaHG4P5xfEnJVpFiCILwStAaQJNDQ79LNq?=
 =?us-ascii?Q?rIlzlBc4IzsC0vhW5dWaOFjx0KyAV2Xik7BwhT0wpPuMOFz3MWETVPf/WSKK?=
 =?us-ascii?Q?xNU86sDgkWqYKm2va5hR4iFJUFMk4yRmQdIarPFaeKUaaIO/kLujk5l3U7Rk?=
 =?us-ascii?Q?mBEeHCDR79lFGM0IeNGEKjwMc9X6rEoHaw55SoBs+VbpTjVMJ5o6xupMsHu2?=
 =?us-ascii?Q?n5svzT/NJkz+V1LB6JbLuoBFsjU6rUgtZ7I6s4r3s3Wsb7MrjS6Rgl0y8GvI?=
 =?us-ascii?Q?Xm/8G1m2rYarHKXmSdlynYNoZrKedk+ZoOO0r92kfRoUOEZ/31P90OkR+V6N?=
 =?us-ascii?Q?CEjNZzTkj4My8A53skq5rIkToNW6yejUy8m3fUbXjtnWb2knYpD0Y9srKrTd?=
 =?us-ascii?Q?5I6MKSf37YIaxBanWuq8ZDB+NQoh7ZcmCgqPIQeYSSQEZcKHjC3JCVhMgWCz?=
 =?us-ascii?Q?ejJOW+lhNBceUpRYf3Q6R4blISppGz/B4i4DXdvdQfQVTZcpqfoDsZXtYctD?=
 =?us-ascii?Q?VDmLGPbCcdQzZ54wPOGoUJ/IsZN1/rbne/QDCaN9qv0nNws9mGuJFFL0h3KW?=
 =?us-ascii?Q?y0GwsMRifEGBuwQygr0D2ShgLmpVsEouPhkZjVV82tFio4Ni8WTmrdVI+tZy?=
 =?us-ascii?Q?N/iVCEHoIBBIvVzirCA7CGIeBbr30Rt/0k6Lhz1pNzQxgMeMzzpg/EySllwl?=
 =?us-ascii?Q?2YAbnjO2x3UM0IUEtYgJI5LD2cQMEpIkA4VzrjdRvOEiQKoP9woKo52qJGmy?=
 =?us-ascii?Q?0lDsxSx7tg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163a97ea-fb34-4b98-143d-08df194bcb2f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:24.0040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Rg0Ieh2tpG/GnWhNiYke3W6qnCFYPHmmNZMIP9Xv2gXk3+ZoBwnLWHzfJS3cw4ehCN8y3bEArz/DpRj/Zm+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

The SoCDK SD interface already advertises SDR104. Add sd-uhs-ddr50 so
the DDR50 UHS-I mode is available as well, using the DDR50 read-path
tuning defaults from the SoC dtsi.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index bc5b7956a720..8a22b05315a5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -63,6 +63,7 @@ &sdmmc {
 	disable-wp;
 	max-frequency = <200000000>;
 	no-mmc;
+	sd-uhs-ddr50;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vmmc_reg>;
 	vqmmc-supply = <&vqmmc_io_reg>;
-- 
2.43.7

