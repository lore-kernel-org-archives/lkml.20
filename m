Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E949C4A6;
	Wed,  2 Sep 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354084; cv=fail; b=YODxF0QOJ+/mONkhghUTwkzu5QNmEkJsCM1ZUhdR0s1Ie3bSTIBupC6o6lCE2sedXAbCIeIJ8tuUemOggBayRAyfbHsG6XRjPlLB6+P372GQoWJhkCHTIZ4sNW3br69oB4/Vs77rZA3zxA6xG1zrJvzBfrdDp18ag0n3n34adgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354084; c=relaxed/simple;
	bh=z1wd+19NTVuhwI1qhb9NqRcjqMBq/4d4PtcA6xIqsXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O8CysP0UqKwG+VxlNssSgej06tyHDFYm8s6ReyQjyVhlpiy4uoCIukdj/ka7JTNkJH0bxAxaYICAKVcSFAqERqsmwllblv88Am28J5oMKp3mEPYecnFA68vlSAP0vokoXFoObP8nGsOaRvpQr3SJ5CKL4BUCDW8EvaLg4ErbrIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=ZjUxId66; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="ZjUxId66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9+N8ZTe7YBMNp2CKpNxdROYCg+YhOguh/Xh/3/N+FEdBkbM68VNu3lgzLTbmGvs4dEftMwgsfc1ghDLgipd6pAQdKHWhUWIZ2unnfQMjYfgNmra3pn9Xgf2l0joOXSVHNXgsqBcsAbXKVx7aMaD+7S3F0ucveocyIVrhRTSmSBq04XRHBUx3WFfUddf7f6iNmpA5ml1CdDLui2f1okXXugSM+yfYuuXXYjn00SAiV5iANGJ9kPpuGFE1FuZtcGtm425v5d6enY1ef9LtPYe2wlhAtAWvahg3j+MWG+mIYXrrm1H2cJ8NNBTXw0V/tlIZ/G6L1/V0Uj3TcF5+haDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=SG5L3Be8tQnf8ShRfBlH+ysX+tfuBxuzF9FJu109GUMSqMYqOmGPdsyS43KJxpBkHs7lGroEq2bnZLJsCNx9gBY+vLBzVVUCOYTsid8k1MBdxdu52sfBFf7ttpKQbdFj9KtDlQUGWOuibq3USdQNi+DtW6kVR31TCYQc1x3u0jOG8aTnUACX2TjTKP618l2/TcqMVmn5f+QEJ/DhuUo33F2+DAlG7P7v7POX07gf97cAr2DTXYKEBq2yPfFz3CPRlgxajMxel3VEYAxUpiE3u5YHsuw8C4wJ9mzS1dexJCBEUNsq9xcUVAbzi/sgtDoiQ688fJNJ4ooQJoDabGxwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=ZjUxId66AgV8rDnyPhsPlNW81ee8W2SK5JksQo1dbaUd/qAuHPBktwgqUM+LwG4BCrP9KVviAQdmdtjuGj28GgWoG8P2EY2ABdS0J9oSEUVLPI2a4HD5nnXh3heiSkbG6haHY2DEOkPuy8DxO5SE5lVSHz6r937Fxu6cUVicInWgNKGqmlgTG+eSkNyKK99ONmjHuA5NCUFAUt8UweZRaBSGr64CyEcD5uzZpOjYgorLzzbnr8D7he0nAHe0taPAXp0ngxPtoqREeR6x4w5a+WoS72h1qfVaTd0G9uHmsRxdYCyov8g6BTitUJOpuWH+xYpV9qI2TTeYvVn8xs8mpw==
Received: from CH0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:610:b1::9)
 by SACPR22MB504276.namprd22.prod.outlook.com (2603:10b6:806:549::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:20 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::68) by CH0PR13CA0004.outlook.office365.com
 (2603:10b6:610:b1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:19 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 62D81E4DB;
	Wed,  2 Sep 2026 16:01:15 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ian Ray <ian.ray@gehealthcare.com>
Subject: [PATCH v1 0/3] drm/bridge: dw-hdmi: allow ignoring rxsense for hotplug
Date: Wed,  2 Sep 2026 16:01:13 +0300
Message-ID: <20260902130113.2720-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SACPR22MB504276:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 850ebf19-752f-4e21-56ea-08df08f2487d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|3023799007|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ja2nTVtvPfj5UnahV8zHVSQLzbEBy8pWXAgrsFm+wsm4dcm9Sewn6wjnbd3qZ7hjWjH0SthmOFsNzyxJeW0OPi1eaG1cZtBRNP+YSLYuarik3e3fiEtGGgee4Fw1DbMOSQZxwm2g3Fznfu6MXQJlHpw2d1lUIJUUZSZ3zxZSaBL9WqzNkqj0oewTPxERC9PsEo3SrP5thHQv+TMqeGYKt9NBwdCxHm6lSQVmqj/8JRPJ5i0WOLeJMAg94ul0YYSUsHX9rm1jAPVONxmfg11iwTU9JxZdT/U4lkL0mKiPe5UtZt26Baq9uXE9rObbnPn5WLJqbQXB+qmbIEhY27NIICHkoj/MUsKS9Hr7ZSr0Mdm8cMf0Px1g2zYCX55ATkvf5VY2cbrXWHkMGknqXbmcEpTgTyjzWwb5Yl9ds/vgmGuhtYiUaeNEBnp7U0t4GmcfAM1JAzSaUjkc4OjyzYyWrxD/2rVuTDbv5S6DsyiC2YD74xGZLeFjFBJZF/mnXHcgxTiZIlj35hnRS44Nr7Nxr0c9ZKpbo3Wtg6kGN73xeLwLnZAw6wst2jVblW02EuOMakvBFyk8gPUY/M/NL7t9pseuS9jiU14UazigPE5l0F17v5QzCb/qM4mtltX7KJT2+VCXutptt6QJZnSRlOt1dJsv/nBfR4/kRxbDhCZQ89QUoWNISqjYFsVP7AAeJKr+2PO35t/0hebAfv9ramYImg==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PkjB4yJa3QMHwj76YEYKNDyP8hnMlMe8mfTmtt5Vl4Ega7ATkOCXBr5lztW/FeEaMD6FY3Znz0wTOcQdQlcW85tRK3FNS425DgXYvbjXSL1/u9qJTglpItJ/v5ewFYpecX/Kp6iYQZJpgQvi2N185mqB+niSxkSd//CAsGdn+LCe+PP983yVXrJ/nyrkGlanimCLaIpxY6bX6H3kywwH2T9Rb/mfu8KrmWqHkwnuNnsCe60W4aE/THGC5a60vQhWSlHC3iki+KzywgarK5PXNUrEqwuwif3c7ovB5NfRpGaZJlG4HnNGEkA2DU/pEo2zVTXc+sc1q1vj2UZpFK1ay50pTK1zQm8i71SmvWbQkB2/171gvXi8iDM/GRKztKVi2EEomRdwhWaVmiaRwx32q6ouOGMG8CcfTSXILpO9s2CPMjsHhqrKF3nlzhN8TXM0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:19.8372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 850ebf19-752f-4e21-56ea-08df08f2487d
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR22MB504276

Commit da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event
on link change") made hotplug detection also consider rxsense: a
disconnect is now reported only when both HPD and rxsense are low.

This is a problem for boards that route the HDMI output through a
downstream device which keeps the TMDS lines permanently loaded. On the
GE B450/B650/B850 (bx50v3) boards an STDP2600 HDMI-to-DP converter is
used, so rxsense is always asserted and a disconnect is never reported,
even though the HPD signal works correctly. The connector is stuck in
the "connected" state.

This series adds an optional 'ignore-rxsense' device tree property that
restores HPD-only detection for such boards, and enables it on the
bx50v3 boards. The change is backward compatible: without the property
the existing behaviour is unchanged, so old device trees are unaffected.

  Patch 1 adds the device tree binding.
  Patch 2 adds the driver support in the common dw-hdmi layer.
  Patch 3 enables the property on the imx6q bx50v3 boards.

  `make dt_binding_check' is clean for the schema.
  `make CHECK_DTBS=y' is clean for the device trees.

Note: The series touches two subsystems. Patches 1-2 target drm-misc;
patch 3 (ARM dts). Sent together for context, but driver support must
land first.

Ian Ray (3):
  dt-bindings: display: synopsys,dw-hdmi: add ignore-rxsense
  drm/bridge: dw-hdmi: optionally ignore rxsense when detecting hotplug
  ARM: dts: imx: bx50v3: ignore HDMI rxsense

 .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi               | 5 +++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                 | 6 ++++++
 3 files changed, 19 insertions(+)

-- 
2.47.3

