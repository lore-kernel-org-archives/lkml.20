Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazhn15012012.outbound.protection.outlook.com [52.102.160.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26514DE719;
	Fri, 16 Oct 2026 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.160.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164379; cv=fail; b=bwiYWUJWSrimAqUTauUB02nIi3RJuDr7yYLv2EEzHYpJYhUSa10yhl5DKs+WZUC4OQChE8rlfELhJS/U0EbXyqVCF9HGa6fEme4paHRIm4Wbee2yabqZCjKfCkTDWEHpni770mXrAnC7QPMgT9HnpNSCJhRBqmBaSTHu+zqG1mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164379; c=relaxed/simple;
	bh=10UrBELQnKNr0jWf2+WZpeKPSI+gDTKhnYQTRKnVFqo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Q3rCmODusVZF3DWiNMmaNx7HetcV9X0rYTuDt5mU7K0XhbGGsGHr1ymuqnS1GdmTNbrtUfvau2Yzjrdn588F/unJjmmd9UUzHMXywYyTmrtDHHTatlpqFYm6gvX9HNTYH3K3o0XLN89VEJMaGZPA3otOmzizWr3YQj8MfhK8vKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CRkvSHGk; arc=fail smtp.client-ip=52.102.160.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CRkvSHGk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3qjUoF4W7LnbuEu1U94DM6TqRsfX6FLVX7ykkqXlmL2h0md+AsNaY4qzHUpMDCoymPLmUVn4zEmyzkabNzwtzhxFKei1qUvcEdcdNgLYv447EL136+6m4nIzsJPIe2IyUF//MdtaYeU58AE58pn3iTvL3D+Kr+MCyGtj0QRTeykCoaqhrLhakDluMeW0WCpw7LMHZr8P+nWPkJbodYCECM1ZyObSINzT4N4QjxAdmWktVSf8Gj4RpRyin/Dq7rckAcsi/6E2ihE1kIBQoS8rqhiohOQp/F4NnDm9INkCglrxtKfooHTHP48ykvLUwOqZcOLOOzKFLTl2AC3NfM/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+yZrW9Gw6gxRT+9zf5caC/jZu4x0gXayHDZKmozMko=;
 b=OULChh/jno6MHl8/ofOX1rwI+/wauHgd3ExpyKMMOJlbP0yNYRiX61hd6qldzmrFDTAuz7bdGec2fBnAM6we/EnvOUQXCjrm7OsiPvoSuUDRUyKA3IIHUfhbr9rMq4wihOUzP2ccleK9Quc6OdfjlVq70UxNG0rsgKz1ohEj0vEmIX8nEnNEZCXxZSFRxcz7txX1IzbFOjAJW5BcDmAfjNfHIfrHCKp8wLVPk8s3KZ7S6WJLoqkfX7v1/OqJKSHzTBekqnCBkyZZ0ZC8cNtwIK8Zl6amr/jTwJC6YsnlcZreK52Rqb6bFNiri/sVlGAmP1OP1z6gmCC8z/Wio/ic3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+yZrW9Gw6gxRT+9zf5caC/jZu4x0gXayHDZKmozMko=;
 b=CRkvSHGkpE+biWJrbuJCr2f31fRWpPQmhJUmuly3XyEgjrMpzWNeUrnhG9DpAMspZLJA+8yg9V9XlO+qGrT68cUiVMJ/qlZn7UZ/5GiQ0ow0LM/rvDwNsOnVZi4hwqmafwEaRlaVptI6AJpyCCIMVmdVwOMMM51rzqsya8ZmqK5AhANaLdVTjKoAXoy0qqR406kNykwIdi+XwCJ8uXHi0I6wu0nscfRZnkYDv6fVwKiKr7Rl3lWn2xU4ICfSRKn7/zPN/uG9nKw3H5csHBXHLa53hibhzqFfmfdx1nhZnXEfzCnaPBLFGz/N3BmmJorkTWHuOgVihpPpkmxpl/my1A==
Received: from AS9PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::23) by AS2PR10MB6823.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:26:13 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:469:cafe::2b) by AS9PR0301CA0034.outlook.office365.com
 (2603:10a6:20b:469::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 15:26:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 15:26:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:39 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:10 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v3 0/3] Add STM32 TAMP nvram driver support
Date: Fri, 16 Oct 2026 17:26:02 +0200
Message-ID: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAApC0moC/32NzQ6CMBAGX8X0bElbfgqefA9jDJStVAMlXagaw
 rtb0IMe9LLJJN/OTATBGUCy20zEgTdobBcg3m6IasruDNTUgYlgImMFK+jY4+CgbE+dd+E6uFl
 3hZrqPCmTKpY5l4qE796BNvfVfDi+GMfqAmpYdMuiMThY91jTni+7d4WznxXPKaOp4IpnXKYK9
 F5bxAiHSNmWLB0vPkzxH5MIJqXrUiYFAKvkt2me5yfE1zk5HAEAAA==
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
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|AS2PR10MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: d81ef669-84ed-40d6-f3ea-08df2b99cf0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|34020700016|1800799024|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	PtcyJhS8OI/dWaGkMGOiJ4rjAtM4blrfGxH3g36tdaWFFT+bRVj968uxgByV/rQiwbbvx6k0mKhcu6P18J0iP7ky0DcJIEfkrqZm5k1aoNsVpUqP8+Wd2EnNLNpdP6vhhgHI/aS1nbmb7auyltSiBsWhrhwdBlpUFUw5sLBy9i59PvrPNzgCJaWGvdAm63NT0l0fgPYRyIBEuA5wvO59ZYeczXag7CSDNjNLrxmE8JBXQXno6RpapLepXcnChj+PtKp/cWonj/P8+EHghBSzWKxvS4/ug2xfePUT5eJ3SZZjXdXNkJuYa4pVz1EPb58k63paym6KQ2tZKeOM4tBYK+QbJs2BMbLnB3w5YsdrCyHH8pKCKbVwH4JzoQjXviTXmCjasMLovzOKiJY9dEI9COmvWyvhT4LapWEwqEUbSMXXSqyNjb07Vx6RScBuFOXzOoSLFSOa3L9atwRumL6DFg9wSEnxGzLP1y6ktiZEv3oI2hCke9Mbdk5xJsdBb/Qvnq1uSzWE759B3xvMRGAkq1bj6Y9/3Oi/4uDo2eeZn/EyXtU35iIcuKx58yVu8Jyqs/kSg5wh0IpJQbFQU/yo+PDHpOW0oXkYx8rbK6dmQchtlYGWIZPWysQAuAUI/vWArOmaSnCz7fFiCjsCo8HdOg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(34020700016)(1800799024)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BgshUx7pxiTdMtXN9M3qAIBrQc5yRB5N4f/4UpZ5t+Q3lRpps0h/ivHNxV7/bXMlF+clRd1kokWPbHplBoDl0ACQJiiEVmUKIl1mhkkX6YWS3V8AS7WEaZnXNUXaS+e+66Vvnt5vQQs2RdvCOsQz+RS6Or7v0wl/EGK7GAlkMZPtrRBVajA+HMfb/ie/s7heSlGFvjgPbwrAEuQSay8RZufqyWCBGzorNuveCOvizEJHYRh4qudVpUEp9TingCsApWe0H9CwGsWz6eC7NGhNdDvN1g/dZj7TCzOyGPf6I72FhFIn69tQC6SC7Yb23Awo6Sx8ogmuuWodApUS/7+pBeVAck0d9V3sfug9rGZ2tLpELM3GBknKvZ4g9HmM3SGvuaaNLF7eiuRaw6Vimwo3j9m+tBVF7Is/OGMJ2s52u6XKnLipuKgmlANlmJVGbczH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:26:11.2921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d81ef669-84ed-40d6-f3ea-08df2b99cf0f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6823

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
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
Patrice Chotard (1):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

Simeon Marijon (2):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  30 +
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 741 +++++++++++++++++++++
 6 files changed, 848 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

