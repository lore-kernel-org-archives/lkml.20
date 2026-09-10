Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C54AE8B7;
	Thu, 10 Sep 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055752; cv=fail; b=CUXGpnoRebIBv6ebT5yFbT+GGB5ukuk5zaB0H+wFrdzBBkrQJHc1R9OMEuFgUl4aLWrraLc67lR4IHQokuR3MVrRCM584FEelV3CRHVk4jkUKYVQrmxIxdWGl1bSsJlXM8p90ofqTPx37+mRD0fLEOq/z6PO3t0275goCpdmeZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055752; c=relaxed/simple;
	bh=16Y3c1xt305PfEIgkguJ1D9BOtYFtrqw4dI33W+Bk8Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CVL/gLHlFtsByWVuDQGb3VbWzELSG3ybwgkaUyx/LYPWIu88sY/ZoYpMTMnhKR/ehqfb8WHMcby1KNPU9CN/JfUTfxbnV2HsPinqcOpgPHlVymZSH9sBfUqdDp2ZWLNDT2ZFs5++jA4OofgOJ5npjvUCu5Oqq8ATreaz0ZDy4ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ih00Ma+T; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u1+ljam2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ih00Ma+T";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u1+ljam2"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF6qOo3411211;
	Thu, 10 Sep 2026 10:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=utMTgpVSQfe31
	lUlBsIRkn1rDfyJavwJ6Jvss32aycE=; b=ih00Ma+TX4piBploNXLKKAkGTVc/x
	CQ6GERhnvLZ7tkHPBQGW2SjNXznu3Aqi67vhbnI7dfQQoFihNhWJ2CohOzkq6H24
	PxU0nLxbMmcwLrzKCHwLnsVpZWiOx+zR8cR0HWaTHjajJnD/fQvkVH/CdxWku6v9
	thMw6fT4RdP6qUvvY35Ct30Ho9qXHRhRCT6LDOb69+ijsUDT/Kpjq9DLDFqONbmW
	ril4wQItaSpS1k59eFl/ba1xyPzcI7jIEFNv8W9KmitwediBVj49eY5g1X/73Br9
	zlDUSpdIzdAj6ceg9RZffhtBK80eL84tfieVftucK93aXG1Csx60LNJug==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfxv54-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:55:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBc+unuItbIaR5F3JTpiQeK1SiPx8wze6zlXlK1/VVk63VMOkSpBrNLYEW2pIHWBmxujD8oAEBW/C3tesXs6Z2KDm34WkiHn95dotU92EXdt5RwFM3rzrB85H7NVnq/xuOshqUfEN/e3xK4YZIL1Th6Nly7aUs57VxQKJejAzMzoqyiXVp8RJU2+D2+hCWKAgv7wZ914+9HLRp5XRN0DAoiQBgBVW0eMENLmNg29v5zedNH+Ovy4X7M1pRMlHuQ0Fon6XDC282yjzRnehVreoqUi8LTTQ+DBmYJjiVXUELGErMDu6zJ6u4V8D1kxC7gEXNjmlkgid9m1SzaydhypBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utMTgpVSQfe31lUlBsIRkn1rDfyJavwJ6Jvss32aycE=;
 b=OyN5Jnt1X7Xnz9nSkUlBhz4cKajAWK6jCeJDOlcqmATXSBtv1Ksv0CJuLOIk1qaXzrBpW4ENrVa6ZXh8RPefjfBSvuMSskj90H0NdPyby+mBoMr6Q9POW0gV6yc6rCeYZaDGaHrk09YoP0QfBdxIjjfzqZgbcS7p1LdU/Xm2OU1wZ2uoTIHne1SkLFvojfAnosXQB2rs9BuNXGMDBDcuK39RLdLdnRJl1OSaak11+LrsXTe9sRn9pqFf0rdkQjDrfc9iQMyxolbsljGVbayIRJj1wtnxVFo3+yUTR+czaawb353GOF/vWpTsp++oy72vZHmkvQclJhtzU8ZpKUdYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utMTgpVSQfe31lUlBsIRkn1rDfyJavwJ6Jvss32aycE=;
 b=u1+ljam2BhkTz89cXrIsXozKpGP7nK6dCTqXZGxBiNmRQsFvLnmIcxLdyiuy5Sh0UFCGL0DBxLzlHGUYsUAIwqZn9FbEda4furU7Q3W9ZDJnn5khDCaQV6BSdhbtqrOFZlYWpDJlYjX137ucsGKTupf1h+cVMtNiXztVkI9ZHAU=
Received: from SJ0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:33b::25)
 by CO6PR10MB5619.namprd10.prod.outlook.com (2603:10b6:303:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 15:55:29 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::46) by SJ0PR05CA0020.outlook.office365.com
 (2603:10b6:a03:33b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 15:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:55:29 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 10:55:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 10:55:10 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AFt9F93587197;
	Thu, 10 Sep 2026 10:55:09 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Support AM62P silicon revision detection via uniphier-efuse
Date: Thu, 10 Sep 2026 10:55:06 -0500
Message-ID: <20260910155509.1425682-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CO6PR10MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bca473-944a-486f-6cf6-08df0f53f02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ulf5QUHEYB31tg0vLolBzgaFiAou7+8zkerVWOtFYXmhO3ABrfrUqOptOMosmrxr1eJPr8D33k1IlFr0pd1Z1D7ptmcc8nsMBRBQo0Uxbn5B4XLPGRsS4lVG6+tIXEUs2CYsbW34TOjrOnXGQpPpEqZPVWo3tghCjejPxV7gYrHpqAnNNp+KwpHkVKiCV/yK/DHyyQ7YJ33GqdcRiVdI/qXyPL4QgHhP6DfjnJsyLG0/sL3E1+hwPJgIXJNeyZVwTqaCuX0e7t3P88WUEX64KEURxq36988k9PG6ffJJfGWrhRiO234oD7dgzP7KfAsls5YzYEy4yl15+0C+P83rhKEzDZdTtaOL4qKejpkzBMGPgqvLQLDAO/03Dt1tMzy1nA6FrTarF1725zAfkfzvpyw3Q/h6O2IHDTe92fARtu7UOqrIeSC6f68Yz/mDvAAxHdrlD1LqVtlfoAJLQY0shQd1063pdhgbbozuWIrrhPtNF3XKFn1hBa0LGYs854anhovePQkupom8HDVvU5FoOQTdtERgoCrjfrPijQ/fSB4fMM8CJC3l/ReQ4UBWDXgtP9AGgNKpR2aFYmvRSadp1O1d1YKJtlTR1OK4V13CrMSMRM2LjdUQPsYD9NbjGtY1ocr4B6xHU4uR4j6Bymgd2tOVU8zg2JmgpdQXvjQBhOI0kmfHvHG2LnJMGj3wivMBwol260WiutI3EGScHjE1WQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nfFtzdcGsfm5BCsm8n29aLbnpLO0DIq9OR2Tsi75VpqQpg8ndDkiSSj6R++S3uUxBIRHX7nthFae/ML25NDrlbjSxuHZ6l8B69BLLYy/0bOwxmRWyUiaubPq6rpjbPesJFRAOkF3Dnt61WcGYGk9Wb/CGvAzxImUx5fIEg5rslN/xhZIuRlf5hin3QS1W4CkaPJ1p507+fjhISwTpKxbgxpD1gh/xOn1bBYfLThR8XIrN6sdF9k4xfmz75fy7sKkcB2zsKW1R1DcWGuwQW2qYGQ9Ru1pD3/+Jkp99IkRfnKsO5rt9a74o0UYplJNsMMWpWk9CHhixiALh8fqPuNKwaNZw5L3sD8PAcHymDGorEiX9D81g2NfGEsMa6RjZbR1e23YigbSSYKIz7iIzarG6p7Y3ogDJXjaYqkEp6eJBo/1qpcBPgp1kupNS5+anNwK
X-Exchange-RoutingPolicyChecked:
	5Ne98Eqri2m0vtG2PZAaB/scIEMXmkxSKJYnpRmuks8a/ek9ZYiN9eVPhCBDPDYjwMjl8hi4CLY3WQAv4CTanCc/9Yrwpp6jMto1ipaPviT0uYXe/+mstXpfcgPjDFbZy1YHU1F1moy4GSd+DP/SsDKH9GItx82LSQ2ChkkmfAuj/+kBB3KpY8Jf7ojhDFec6+O905kXXJyWW1F11WxBzkw1HNEkm0Y8doToonjIAmJkOOdOjKAj/yzgJvwza9wyrxlDFwLBNGvqKXkg2Jo4eg8fQ6PqNGgBFOUrrY5dCS+qUopnrxLu6sTAW2QfQWQSHtltgTb+/U0GbBhby6Y1aA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:55:29.5094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bca473-944a-486f-6cf6-08df0f53f02a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5619
X-Proofpoint-ORIG-GUID: JJH1Jli-nFdYNYCM2qjOCkR4LRCAWz_1
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa2d2f7 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=5lGjH7dW5flOdyZUQF0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfXyrYVSZflb8zL
 BSbzJOP6Dezcq1sEypznYJaqj5AWMhB9aozX/VnQ0unL2X8TMyXTBBCaZWjKjdmVR3cUVkWFyDk
 ery+BF9+jlXR3+m/cN0cnAJgTH2WYqwtiB9nQy8VJa2nOjqDBXN/MxZ1X5setZRAmzIUnHCwrpx
 fHowuuERPrekk5Uuy3HSBD1QbUqcvE/cz8Iciohe04TRuHjTZa9JXDtDkpntF+cOF7rB+2nsbA5
 Jxg4CkRZwUTobOmhcM21jYzbr6DF1EHKlMRO7RH7p24v6fpDJm+L6t6u1Objm454diY8yc4y6xO
 ie/ZepoTKugd5MiMhlEfziYQkx/N9XKY1tYs5mOVSeMeGkniviERrzsZTcMLM6xyBL6mF9iGnU1
 1XJDTxsf4shhV65IYteFyEp9/dHyr9Gftd3EgXd0/iLo1V1SO72DRGRaliiwlETyBUMGlJArX1b
 2DYLjkUuP0Qa37zcfcA==
X-Proofpoint-GUID: JJH1Jli-nFdYNYCM2qjOCkR4LRCAWz_1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5MiBTYWx0ZWRfXwPAnW/xayRR2
 vLAA7MtTxtp+vW+XR2bkuxBSn8hSmln831ZWKVWzB9dh1JQS7vmeb3yD80OuKNQqv4u0QQta0Md
 3slHcUZpqLDX9+/ryNJ2MaZeFghqrh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100192

This series adds support for reading AM62P silicon revision from the
efuse GP_SW register. The solution reuses the  existing uniphier-efuse
driver by adding ti,am62p-efuse as a compatible string. The three patches
update the devicetree binding to document the new compatible, configure
the driver as mandatory builtin for K3 architectures, and extend the driver
to support AM62P devices. The uniphier-efuse driver is simple enough to be
reused for efuse register reads on the AM62P SoC.

Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
silicon.

Changes since v2:
- Add Kunihiko's review tag
- Update binding to include fallback compatible as per Conor's review [0]

Link to v2:
https://lore.kernel.org/all/20260902222759.736124-1-jm@ti.com/
Link to rfc:
https://lore.kernel.org/all/20260812154442.3379851-1-jm@ti.com/

[0] https://lore.kernel.org/all/aqEuyLac2OGkSYX7@squawk/

Judith Mendez (3):
  dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
  nvmem: uniphier-efuse: Enable for K3 SoCs
  nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml | 6 +++++-
 drivers/nvmem/Kconfig                                       | 3 ++-
 drivers/nvmem/uniphier-efuse.c                              | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

