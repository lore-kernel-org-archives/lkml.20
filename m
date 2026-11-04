Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805627;
	b=WCSGn3Qlc7sQNPjgjQ79aIRLgX+HSfCKNtHCfua2SHMntGiB6MOMsYnrpU01DH/18rSA
	 JyWFOvLNGNyEMd2eZvCQbgTvFzXP/tHZ/TWF16NNqMo6RHqfa5NqXS/8BJgdheYb59jf/
	 WChnPQMEEhwmkn1P4vdTXoiBVjGcYfKcVz/UPEaBWTaaB79UI9Qr+00pHiUQAVs7nCVO2
	 jq/vnkDIZiWEuADsfdFWFtJ7dGOoHbckhjGGGCyGznyYHA1nOJpOUMrcYGzivXg3kaOOk
	 1jcZ1iBWddj1QqS0xedLCtDuPhQwL9g/oETVjDnc1UgOA+1Y/t3VT2BuQRL1kRX90sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805627;
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
	bh=nM0Z2uWbG+hr6LXa6fXQ6AJQN9+NInAsGxJ1Yq28WXg=;
	b=AtA24YDfselL4RraAAiwKQfWvQSG13gl130il7L1b7gaP+1wi3T4ivf+K/04ndb64h9B
	 vKysck1iZKV6f/L7O55JWS24cIWjScuOHViTy68lkqoEiYAnNMrnsI6DrgkM/rTy/Cj9k
	 ZK8NlsHJTZPDHlGh9bD3qvclV9K1PW7zKI4s6esipD7nmcnKYAo/cNEOTos1AanAXXcTS
	 ZU26LN67ah/ZxoKQPSwQJTdlhP1nI8P7MJFN9aaj4r2VEl1H1M8c2Xc9Gff4WNBRUMgD9
	 yrMWlUF7uGV6mbBdQvGYAKreNK09lkzKmZB1hw5j7rqlY7cQBSjL7CNECCMu8tsmqkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=CC7g9GA8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262D606D82E;
	Wed,  4 Nov 2026 15:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9262D606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=CC7g9GA8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7Se85G6tqh82ibs262xNCK6JW2oP4AP63ahXWcq/bKDJcDP778nJb5qGBcDun7VFMYBlH5x0D+oLCwVI9wKV23YEZHO1hd/pEAJ2JMzf0f+ykMGdU56M03UcjYGUUCyv8FAJzJg5BHp/B7X9YgoOx5Y7gmhgyEGVXJFfuFEOaHTozhSFI7rAzRZ81svIA3jySbwcvfvVrbfG1g5lRzm4cs6q8rYWMsG88U44x7ycJZa7oFcAm93Z3UF3m9wOOqgX0DitGarnWR6wywYxpNrYGv8WrJ1gN4Vd+9/LCRsASTdtSwq6AzC1sXjvkaw1AqOf8HXyZcJJdqo+9gk/82ZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nM0Z2uWbG+hr6LXa6fXQ6AJQN9+NInAsGxJ1Yq28WXg=;
 b=ci/Oowa4abAUzgfZgWO02SXvDiBwCwWU4XH1Udt/2uvo+azppdB9ELD1xoKYf+q8VKxzUPKS2FNXSbExsVsOVVZiZdlAHMMsm4hsTvPfCzr2CLjgn80v5naW56HdVNZQzHNXh+c1DkMQ7aAOTsG4ihRdQM4cigptLAKKY6MVaNYOhXl391ZbhH7JwG2dwUnJMSCQvmY0o+qLzuVT+hLqFFa/Gc1yo0OP/f1AVX3gcLa0xr457IA8OIkagLnjiOyt+B4HSLf9OLH/ufnheVeO08J2t4X8wFnHrM1J9YdjDmwuRD1q1fGzswdytvW/2wLKisX35aeSsr2nb1/rIugWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM0Z2uWbG+hr6LXa6fXQ6AJQN9+NInAsGxJ1Yq28WXg=;
 b=CC7g9GA8wz8wUiPEosYK/hlbgrIRRzNPTJngcakq6bOUtaZfZ6Sr7MKO+Lh0kXcpA2EEZgAysbTZv44erRXuHicKmLvO7kqmIXnHRRMipxxgaUbuuydjG0EiUlvcDu4WJd5PD5i0AJ+mvY03YZyoqBT0fZAnWJHLg7nXwiobwVjiGqNJ2/u3qEuJ9/J7Z8lidC4aPhwAaSu2B2IUirNJyBxyBeYmHk/bKePY0jJh+ktHPqPOaAdnoM4GXkgBxNwLhIvB3wHUekNhr0/+4p+AgeK+y3vf4okTSEeHQqP2uWabCQy19n8rACGAg5+E6Gk2EZC2/9dh4tkd/oSY8nBWQw==
Received: from DU7PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::19) by DU0PR10MB6343.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:411::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 15:20:19 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::2e) by DU7PR01CA0017.outlook.office365.com
 (2603:10a6:10:50f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 15:20:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 4 Nov 2026 15:20:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:21:04 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:20:18 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v4 0/3] Add STM32 TAMP nvram driver support
Date: Wed, 4 Nov 2026 16:20:07 +0100
Message-ID: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIACdN62oC/33NQWrDMBAF0KsEraswI8uW1VXvUUqw5VGjllhB4
 ygJwXevnJYSUtLNwIc/718EUwrE4nl1EYly4BDHEvTTSrhtN76TDEPJQoFqwIKVhz1PibrdZsy
 p3ETHmD5pkL7Vne4r06JxonzvE/lwusqvb9+ZD/0HuWnhlsY28BTT+Tqdcen9rCA8XMkoQdYKH
 TZoakf+xUfmNU9rF3di2cnqRqr+kVSRnB86oy0R9OavVP1KCNg8lqoi+aa20GoLzt9J8zx/AXk
 lgP1mAQAA
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EB:EE_|DU0PR10MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: deaf73e1-47d9-4ead-b756-08df3a872340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261021130227099003|261021121427099003|261021133027099003|261021123027099003|261021135927099003|261009223027099003|261022115727099003|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261022113327099003|261028144727099003|261026121527099003|261026130827099003|261026135527099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	TA60yv0Rz3UO1K5SVgpyg8lCY6eK56gtgWlVBJEcvLTcAJ6E/qEeiyeW4+fAQvMatImcusafId9Eo/nHys87mXEL1ywuMWpRw8RS+enMJal9H8wiepBSB4h2Uvv5bEExX6H9TglRKwZSbw8rQq45f7QCz8pgZLleYrNOCMtD+HGnmGcV9kWoAW0q7owsYyomAsDoyhhYJPtJ+W9p+NPerYzcIiUhezkHNn+djJI8//mHS8Ajru3mqEWA4WLeo4YjyHLhZRnO4mjp95RP9GgavPlXtOVDqZoCnfY6xbsDFPsI7M97FvWVywKTGJl3ZaTzufmYOJvGjLxNGoSFH3pgriQ43P+tvntbLU4ZnYwcq4Gp6N1OZVcGpTVRUtpz15z18Evc2tAWUqnm/gmU4PkditXCYl/PdYeOSgKO7tgr2Uvs6lusw6Qr6PLOh77Ig1Ryme66ml0tf8fdHtrJZw1yUCRO4E37iaoNXqxY3TZ9gJyh6nUbQ9qd9ZRTBMhtIUWpIwyKFaZ8QBV2TSFMB90lvDHTlXzUTSajNjnzNBM0PqnFZGHcEyA4+UIS3X+c55OQnabBcgDrt+Eigks/kTiCtoIC8S7HTZWAINA5sG4JQEnVNqjiA4P6l5VcrXpGW3lCsaMSIF4rfdFh+Ap23GSw/w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021130227099003)(261021121427099003)(261021133027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261022115727099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261026121527099003)(261026130827099003)(261026135527099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qBatrqWoJ9J8hoGAMgQP0pwnwVQcngQ7PZWylOv9y2fI5idEhkKxGt/CAKh1M9RFTW5LegJZresjKq5L3gE4LDscaJpK2A3fddKtwqwSmNkDOqutBBc/vMYpc5vhSPyjwycBjrbpiifa5BF3sQxpL3nsscn8HkKpeAwmFEqp3epp5nbMPNJ9H4A8oI9eB7ExgWiUePCRHNLZAM6xNftBLKKq1Hjr8LYpZIBW+miUqqftdjlSgzP6jG8pWFjKxxShETg607/mTADK4u2yBWYUbw/VPVfoIqOgwErgRmydu2DzlN+bsDyohBqc6oM0VLYEJ1w5wm+2fzmI6yX1wcNmOqpaAnRfrwIoy/irpw7cMIHJqHcqWmeaCtkgWZOu7Lzl6cLuzi2v+b2SKubLURPVXyFQR0QiHg1lW/kAOYrczXWf79EvGlEgQKp5lPphTRoq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:20:19.5181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deaf73e1-47d9-4ead-b756-08df3a872340
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6343

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
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
Patrice Chotard (1):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

Simeon Marijon (2):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  38 +-
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/nvmem/Kconfig                              |  11 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 680 +++++++++++++++++++++
 6 files changed, 793 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

