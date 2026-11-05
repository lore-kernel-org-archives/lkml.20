Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880190;
	b=P0l283RXdnKsja/K8WtHBAkJU3IGKGbxCgHJ+y0nBwesOoPu5EhpBAA+dDGCZZPQcSjm
	 wR30rA+xkMg6upjrfZs3jQvU0SIHPY86vYvXuMCdsGWz1KAsOvbi4fveV4unRbYfCa4er
	 BLysi1KqG/9boiufgkKWZiZfxDkzHTu1rTxR8bwiOhQxkqeTdtxiwZgYmZD0oBPy66Ded
	 xgu0RWjiy1zPAmMgq+odI2COY7hgp6VOHW5Y4FMyw6/dLZ/hdsW6GMen5Ke4LL/6kEmwl
	 C9NsRj4gQWddsFKygn1Y15riVAALRMxTx3OAzkoqW2jp/0Orkn+s+FEQlKnM7qd11Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880190;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yf1mUCSg8ddhkF6niOz1LOXPxL+agN9sqDLZsjq4Y7k=;
	b=dNsRvhiwczaXA1robfZIacVkvAMmUfpAgkDpunOJcbGTOCFCfV8NybV8JGyl9IymRHR/
	 BaVCIIsE0OwUCmhhNSVMjPWxMk2MwaDazhRsPF3ONqP8ZZgiNwyuEw+v24NfAimOukS6V
	 ODp3shcbiT2C10nA4sJnxBDeI1SXhtw+JLfY/aeoLrvnVRaHrXUxXajVLTTUk3/xqniXV
	 LOHmeHVigRESVLZW8w5hWtLHgLSADItL58XiDMBkuxV5fYhyL1iMgjB4ldFYAI0mRw6gA
	 o2OAK503JcD+K7n9E5xXELv9HpGblQWeGG5uTbH5cGEKbYoQTVqlqoo93rJSdcuvFtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YRWMZg8G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.63
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EDC606D805;
	Thu,  5 Nov 2026 12:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EDC606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=YRWMZg8G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6lfPPm4dP5wfa1IHoEfWMCrYuBnlcvUTANAb+cx2pSzSU/2ulXxLKMYZJoogBaGymRwRH8i2ENmfKTQSsUkrjqiKO3j43J44f3Vuj+QJfrPwuGrDU2AO8HQS/zcNDo937gVXIaPwJddGea/k7y/pBiYMnxJKs8V3VHzINkYvy/Dv8oGsWsm6lBL3tChddHrDBz8IX54qjseAimzb2zOpvJN10Ky0lR4xz1qpgBx8X5D0b0vagJdNZbERl6Gi1vQtzA3T+Jr7KhAnA00dt9cUdV0u3x74ZcwGTvX0Gkm3IFPsXv4Nwy3DXy1pJrJskyW4zC6d4fR+oSQOypo6GFo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf1mUCSg8ddhkF6niOz1LOXPxL+agN9sqDLZsjq4Y7k=;
 b=OUebQhrDkf4tZsgXpmRgzkqfOaecn02OIhymkx2tRycHnThhk5fPk/EwrVOuGjGG7hPGBUA6E42nYgGNdcIfduEuTxNlC5RzYFQtXNKNamNgt1SOOmtnxJp6/p0Y8Zxo/9OUnYXsE1dZdKS305rNhoJ8aE8ZodQVOdfQmLUWTdUuo0EO8xHk4pyp6uOM83nmAjsolUr7lbJr6n8gKBMg7vZ5xpWA+yqYx8/uEFhPbX5SwzeEE+Nd9iWk172FVFAtQKGXLn/rSTM9PhTiDHuQoshgPap6BPsClGhpn8wfTFr0cTfIQ94uotrNg2Jx5dbBZ1JNPKbTA+beHf/N51zZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf1mUCSg8ddhkF6niOz1LOXPxL+agN9sqDLZsjq4Y7k=;
 b=YRWMZg8GMenJC4jNyz0R9g0X4KFRbfuvjZatHASd8e27TIEoOJDFSxSY2gUUORGUMz8jFGWGI2KxeYhGsrxBKwZOtU3TSq/AuCyc+qRZHUvvrySgEYSvNza3+4SDFFCaOBN+G++0VJYCV1+fiHnELtfGVnzGFEh4m/GzA8kQcDJBO5oyT9pR4prs9Xv8i2p7FLU7wEI27eLs2j7+MGD5RQ/D3GjGbr6hCthjLvqKRr2B2gG+sdyMdaEB1hR95PH8cAe7aWhYy23EH+bHQZZ9UtxdySd7xehvcp+xZCaitR0pOdwDqDJhcdLVDJbg07AWvGFHMVfsnQ8xysVEXTe+mQ==
Received: from PAZP264CA0112.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::15)
 by AS2PR10MB6639.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:04 +0000
Received: from MAD0EPF000008C5.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::ac) by PAZP264CA0112.outlook.office365.com
 (2603:10a6:102:1ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 12:03:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008C5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:30 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:00 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v5 0/8] Add STM32 TAMP nvram driver support
Date: Thu, 5 Nov 2026 13:02:58 +0100
Message-ID: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJw7GoC/33NTU7DMBAF4KtUXuNqxpnEMSvugVDlOGNqUJPKT
 l1QlbvjFMSPIGxGetKb711E4hg4idvNRUTOIYVxKKG+2Qi3t8Mjy9CXLBSoBgwYeTqmKbI97IY
 cy418HuMz99K3ZKmrdIvaifJ9jOzDy1W+f3jP6dQ9sZsWbmnsQ5rG+Hqdzrj0PlYQVlcySpC1Q
 ocN6tqxv/NjSts0bd14EMtOVt+k6h9JFcn53moyzNDp31L1KSFgsy5VRfJNbaAlA87/IdGXhED
 rEhUJiUARmcYS/ZTmeX4DH+wpEbABAAA=
X-Change-ID: 20260909-upstream_nvram_reworked-f84a4b37817c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C5:EE_|AS2PR10MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcd906e-f2ed-440a-655e-08df3b34bd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261022113327099003|261022075727099003|261021123027099003|261009223027099003|261021135927099003|261021133027099003|261102123227099003|261021130227099003|261022115727099003|261026121527099003|261026135527099003|261026130827099003|261026140227099003|261028144727099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	KbBdUu6qOvHfQDW++Nug/iIRS46WGbrt4yrzs1ony3+TlinX7YRu3cw2cqKEYXPMphjFDpyKT3oA8bzvAYdaZ6+v2m+wbtAwynpUBonZ6rVFm63jfB3ROw1YKPIudcH+SgLI1aLl4c4mhrsv/91t00Xsk5AY2X7UUDCZClfmWfxYjwy1cO7J5ag7BAntBUh9ul6rJbv3Mx8QwKutMfT7wIZMuHorwhh5MBRg9g83lS4Dzq/6/EhtI7shJNic7vXC/6PoZfWrdjYLdEzVoP9sxThD6sxvAUlJeCxXnndTGD/TJsNRLK4yNib/yuI5mRv3/ibk+D4sDAGCh1lnLSvKyhNmlaU4cPH50ctekdLpgZDytTsr0RKe7vVBbwqVDx7bfWrbLaJ2C1rN9mGz73pcO6KBSwXmeYpH5pp9tOC3zyLexshFoHhjEbWHXtDWNAZn0u5VVNOx2PTApUSzgvkOp2J7Cr747wtEGm4xdIesEXclbl/7f95vUOqs3xFUOXZXyKLXbU7N0h4WWjrPYOTUpd+Y6sJZynIP2R8Q1yJ/bwHpOAZmpgnm4A4E9aNR/iZI5XWjisk5JpQAqUN5XuOO39nFWc3ub37fwtNOzg6Kbj326aij6XkzMH9r5W+p1N57DUSVkTddwYqdDXliMjMz5Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261021123027099003)(261009223027099003)(261021135927099003)(261021133027099003)(261102123227099003)(261021130227099003)(261022115727099003)(261026121527099003)(261026135527099003)(261026130827099003)(261026140227099003)(261028144727099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EOotTUiQCJcxtJj8hU2RQ90xT4h16WbvFELktEdqWk/M1+bsDgRTjYr8pAG1r6Agb0lOWmX2eSvdkt/USXu14bNbVKUIR4XiyFwnlAi2MLNPQQ4GwMjvryWhFEjLEvxHWHFaZpVXw9BHB1zdeFy8lIB0mshqOJ2tMZKYuDF57UW0fvcKV+emo6MWqmXj6/bavihX/u48dBirKNi6v1vVVGEMk6X+ePsvPM5+EQE1MTKstFdxzh+F2OtwVtUOG/jbeMiCYFrjJfOuEvamPMEKP1hsQWkxFlIS128LhiSvWFoFaXM/1iZQujnhvShWY7BWeQ3saT+1pyJeLB+oCC8G63k4oZwBaW3zLI1fvz819e3nTAqMwxO3q4OkenCTJAPcS1oz5frIYd2Jt4DnsLifHp2auiJvERA7ysvgtwV1nu1MJsn9CMzJgnqzUUYtFZ2N
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:01.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcd906e-f2ed-440a-655e-08df3b34bd8c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6639

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v5:
- include DTS patches previously submitted separately in https://patchwork.kernel.org/series/1176665/
- Link to v4: https://patch.msgid.link/20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com

Changes in v4:
- Make usage of of_device_get_match_data() wrapper.
- Rework ioremap of syscon's memory region to avoid overlapping 
  between parent and child node. This allows to remove 
  bkpregs_regmap_cfg declaration for both STM32MP1 and STM32MP2.
_ Add select MFD_SYSCON in Kconfig.
- Link to v3: https://patch.msgid.link/20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com

Changes in v3:
- Fix issue found by sashiko-bot:
  - rely on the already resolved priv->data->nb_zones instead of 
    of_device_is_compatible() to set priv->bkpreg_access
  - Fix max_register of stm32mp1_tamp_nvram_regmap_cfg and 
    stm32mp2_tamp_nvram_regmap_cfg
  - Update zones_end type to int*
  - Replace both memcpy by put_unaligned_le32 and get_unaligned_le32
  - Link to v2: https://patch.msgid.link/20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com

Changes in v2:
- Update commit title of nvmem dt-bindings's patch.
- Add required compatible for patternProperties in stm32/st,stm32-syscon.yaml.
- Fix issue found by sashiko-bot:
  - Add freeing compartment_owner.
  - Replace regmap_read/regmap_write by regmap_update_bits in stm32_tamp_nvram_write_byte().
  - Update error return in stm32_tamp_nvram_read_byte(), stm32_tamp_nvram_write_byte(),
    stm32_tamp_nvram_read() and stm32_tamp_nvram_write() to return the actual regmap_read() /
    regmap_write() error instead of -EIO.
 - Add freeing field and update error return values for stm32_tamp_nvram_get_backup_zones().
 - Update error return for stm32_tamp_nvram_probe().
- Link to v1: https://patch.msgid.link/20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com

To: Simeon Marijon <simeon.marijon@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Patrice Chotard (3):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon
      arm64: dts: st: add TAMP backup register in stm32mp211.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp231.dtsi

Simeon Marijon (5):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver
      ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi
      ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp251.dtsi

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  38 +-
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |  34 ++
 arch/arm/boot/dts/st/stm32mp151.dtsi               |  83 +++
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |  31 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  31 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  31 +
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 680 +++++++++++++++++++++
 11 files changed, 1003 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

