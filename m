Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB649B214;
	Wed,  2 Sep 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354092; cv=fail; b=SzlwTq94UG1FIu7tVBJERYLs8sFbAhvvBLcq9LbjeIViEbxeEHs+nAhf85Pan+Dq49tcSLeorACpWCAoGPXAMvuNaa2hsCMjCymiVGOU9/qawIpRmzm5j1igYiS1wkg6ouFxHdLPWyD/OHdIPPQjGgFF/S08p+P85uArsgIjr58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354092; c=relaxed/simple;
	bh=/DGzHAdM3fYie/3yx1yd2ixpo2z0i/0TDKggo9nfTC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cUSzObQoEJecXDVh4Y3W1DrOO55RF99GZWJ9leSXKQglKGrybCNuVS+aaDwjG8sCOZ0/H5QV7ujTPs1kmsJSSo2HyL3nkJR46YKnCAZvpr0OvpGulPLnIVW8T5VLKF+s7Jbo+JBsQvp55DWL3lMgmm4OZRophog5LgjXHcqupLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=kzVIIwmh; arc=fail smtp.client-ip=52.101.57.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="kzVIIwmh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HotPzEUZzyNz+kWrWKGeUwXeo5ZJ9QQVNg2nr/t59tnE/rlWvBsZuResfawDcm/F98StinKLZ6nRO75qOJ3ujIECKqZ3nBIm5G+3DQEX1s8PDswnVOCfPGe88vtJcw+fiPn42S/mgD+6HsRZIgcYZ6IB2BZ6SQoT9DrbVIjoSQBR30WtZkbGlJhBPZUdynzgy4Xdu9FeSX798KsIPo/qYzn+Im9bd9+B9jO8tBQAWaztjaR+GroCJvC7Uf3066mGhHOnS/o/S/goauux3TLN2wcCZlRqfGSEjj6Jqzu27baMfkN9TqWoPxdSkELerMZ+FeiLQO2j532eLDXnNv6MgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v0ZGbTEU8MTehrYpqFaIAFAhHuVbtcXKNj6VwasCBU=;
 b=qUldGx9AJdU8C2SF+E7ndBCAS4UmGQnX8781ins8yqwXfosRkrKQ2vdd7jzE6pY+Oo1lRTwRGJ77HMChvY/GuabeZ+fRVlTdg/TJIOuy+ur69W7uDFyrPPPjb5JaMOEEwLKGdxDUwthEWoqI9wz/q5t84P+QKGuT4R7hsa3q+0VBs/n0NuaPZ3P2Jdcg8sar08jlMKXaM1UL6JH7kElcDvvpyOVccBqGrZllyD9A2+oH48jc+kxztuiHH8Y7/QW1BzngqTt3vBYJ8RlyGUMXYlu2nHA6cx8EnPxY6tJizpphIc7ApwlCRlv5LDTs/Ay1QatEgZkMcN2BcjQYp48TkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v0ZGbTEU8MTehrYpqFaIAFAhHuVbtcXKNj6VwasCBU=;
 b=kzVIIwmh654vbZt7oS8PPkwpxTtbb3/OgN3Ap4YssGxKUHpUoM44h88h02DH2Oqy8odQaaeFIKKq58XaGfQKr9KFM+u47rJ4JydOgVo+B5NwPlZpBGFXRknJd/NnMMPht3JuDUukMimtz6JEWKHx5gpZbDKvFTlU+xBW+4Kre8Zypp3O4bZL82faogrxqPDjSsp+Y81fuicgwf+6dxK6x1aeA3AVorcjZkr8aGfJrelPb+mypfbMgRqnGVqqRz02SdayP7kTAiAdZ94eLin5kQwzCmnNjZTCFsSNGEsK6EWwGgg9ECdoYkwf+8Pu6WioEfi9waafVt5qGUQcgACoqg==
Received: from CH0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:610:b1::28)
 by SJ2PR22MB5262.namprd22.prod.outlook.com (2603:10b6:a03:58b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:25 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::a4) by CH0PR13CA0023.outlook.office365.com
 (2603:10b6:610:b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 13:01:25 +0000
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
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:24 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id DE291E4DB;
	Wed,  2 Sep 2026 16:01:20 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: display: synopsys,dw-hdmi: add ignore-rxsense
Date: Wed,  2 Sep 2026 16:01:13 +0300
Message-ID: <20260902130117.2731-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SJ2PR22MB5262:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a6408b7-58ef-48f7-bf6f-08df08f24b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|921020|10067099003|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qwFVE9np2H8Es5djbpQcFrxxFT8QuSKMfpTVBJRvUo1BqbCBklG6nIJzUS31Zb2kh5+Pg44YSR98t9uBm9LkMTUb5HTWhbJjOyzcEiE7cPxxQ/ehETNyoGtF+qK4VEyCNfKwlXqJU6E43XZlFuVDknGEdMErXyayLfFR227l+wdyMd76xcP+GQpks/+NqfqRTY8Yrc67Z6rtMk5uxWQI/QGvwhW/etBXA58BKboxj+iDOV4WVUOIwIgqJkyVaLnfNwaDz7tBlOpXp/UiZbAbwdQxO7MSvhgHMTC+i09RCi9Tdx7mlc9v78LV00qxOWXQNsWwzt8rOXfWhE12BsiuCuoznUnzeI5HVsBJUbZxqY1wqOpeZzDaP+kgomdqjcwOJ/MLYy1lf/qloWG6M7PSaaTJiypPB29wTJ7TTVXk6bz9hxFT0uMrEQXij3TP64RpSTkUrqvsYniCeH76MvYtPHI9erhm11gGYlpcEtCRUDeW/80qFadYnnUUBExyl32zgDTZa5Xtb+74hgXuSILNP76GcfKTyXZ4Qdw+hHw3bSQKzs6GKIjcRQcfXfcXfloMcKcRcBu5DaU7zMqSSOtLrIKjt0KeuZPC+p1TlUEpfO7R7l6NapN38kqz17h4+r6mnpTouyhcVhxOMsEAXpC0pchFcYRZUP/PoZOSaCsSMET+KefaGFT0AdQESE3Tb7iLKbNrWKN58epsCT3xAjQ4bR1SRe2Kh/WR4yWeOOpUjI8fqpfqVVQaEUZioisg0jlM
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0EQPs8TXHv8lx9ldWTOoQ273P0APTC+7iufskAQAOYGPXHy8+XMytOdQvbHD2YlDlUiSHIptLOFouNLlVFu3Iw5w+xG7J4Vb+N2FmUbPeX2/bVCeaqKNA4WaERl2Tjrh/cd5eDmOlGOvz2eTMEbR6oNNZjbkfTcn9h9b4pcJ/cRDQfHJJ140OLknGGn4zV8l5oZ+XmbrOv9tvYfac/r0+6Hlw0rslVqvO2OmZpfouSxmg7b4vjlCDQxjRQ/fQCRZuR9BJMg1eqO0XcLZvynp8MM5CDMQGPXXCOX3/8dXGfHFbgNeGVo0Zn/KHc32Mku3Fmhr+c6iW7i8xDdZKz4L3DEuUXl10YNMPH5SJi7feRruHt9QAGqg0lQoEkpuNnHzsHZgLZRBuR77zdBDPh2CBhfP2tAv/pdkqMcnHZVD9EVTRBAfad4ZaIXCLC/DQkyH
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:24.8202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6408b7-58ef-48f7-bf6f-08df08f24b6c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5262

Add a new property to ignore RXSENSE during hotplug events.

Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 33481381cccc..0f6e4dabe11d 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -61,6 +61,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  ignore-rxsense:
+    type: boolean
+    description:
+      Determine the connector status from the HPD signal alone and ignore RX
+      sense. Set this on boards where a downstream device (for example an HDMI
+      to DP converter) keeps the TMDS lines permanently loaded, so that RX
+      sense is always asserted and can never signal a disconnect.
+
 additionalProperties: true
 
 ...
-- 
2.47.3

