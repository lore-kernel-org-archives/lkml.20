Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ABE470122;
	Fri, 16 Oct 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144014; cv=fail; b=kXD2NE9h1RApOp0WsW7PriKC88wgChMHsjOSi24NoE1gk7TrkszsWiGngMlRJanq/aHjQRQePbz0F8lKi2HSRG/MA4xpltc+CXqGC1uddwvSvBAVh4PMirvbZ8t/aCnOTzbrmSJc/sHPiskE/oqOa+P3OrttNseVc6U96DRPTNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144014; c=relaxed/simple;
	bh=d2kDcuNLPBpawvi0fG2Ny7hhzvnD6pe++LXtVsK+Heo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fQJhY+nKeAJ0nxJW1YH88+q02nNi0GI/rOq4sWpcY5oBkPEVIEA8IUYwUNJd6OVV1c2W1Gd1iPtyhFn7pGs8pDaNlnJr1gwaAVp/5oXkeXmSkTchjZHJqAWFXLkvF8Xw1MkmpO3PyVTGN9Fm3Kp2kPSEu7Em1GJAgdj5iAb25Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dno9lBO0; arc=fail smtp.client-ip=52.101.57.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dno9lBO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR15l32Cq7T8KzzXyJ9o8qRBmSoUdxndATOr2XRgW++SwJh0mTG21EiiaBruHh50+aXaIQbNVm5bu/tlkKvRPUDiMPMqrZh2RceHXGjRiB4/lYPKHljg+Q8/bTkv6aKKWwFnN3ih/Eoluhq1GORq0JIRPLtLvegUCEHAy8aEyY04N+rJ6tp6SifkOii3Z6jkPZqascojNKwqyShTRcn+vtDf2CUiYk/YGbjRZdQt98Idtcp09MoMAvdurNOvbeitlkJY9qgYDmW2e/iVLnnyhGZttwfLMo5GYlwIv3F0d3BxhGBgc7lRIoVs076qbU9SNuN7DhZUVqGRd2v1/uP4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSZ0vyh0RkOQPDzEUfYJfYaSdlBmxK/94uaNo55oEAk=;
 b=XKxFgwjd5AWcsglGir2HNNR7Lds/0cdMUa+I0ijmnJ9ecp7ynnhcEShx4/ZUrZYO1E2TjwhmD2dh1yKtP0MsFudbdMU5hQ0jr15tg0bKIxSajMmw4kKpgtCl6XJ++hXgY+SdF8TlrhfVLrKjU8ajj0PE+y8IIQOAMqY0b6dU9xrruwvdaS3FbTkw2qwfKOcEYpdpUb8PiGZU6GiRewPZEtAbcHMen0evLUAIOSAPnKMxvHLLDbJDW2YjyOQwh/HzQPgzh18s9tlwAxqXZfZOhsp9LFNO3XISFMCAZjgJuVhyaNZfQnRoH5uX9QxVXRzckjWkJgZSZQQQlLP1MivJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSZ0vyh0RkOQPDzEUfYJfYaSdlBmxK/94uaNo55oEAk=;
 b=dno9lBO0VHqKy6XFDMi7X7w53KBg3RUv8FTUOWK619QOAxhz2dTbb7KqJ7gC04OIleAfsYngGH1sLk6usigYWk0yXuIsemVhkQzCHqLsefPEIdyeQAiz23+saNZucrimJPtE2NrJuOWQm+uWArt3jcK4kvNJ7Djm8H4LfbAP30Y=
Received: from BN9PR03CA0285.namprd03.prod.outlook.com (2603:10b6:408:f5::20)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 16 Oct
 2026 09:46:49 +0000
Received: from BL2PEPF000352CE.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::1b) by BN9PR03CA0285.outlook.office365.com
 (2603:10b6:408:f5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 09:46:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL2PEPF000352CE.mail.protection.outlook.com (10.167.249.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 09:46:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 04:46:41 -0500
Received: from xhdasiikbal50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 16 Oct 2026 04:46:37 -0500
From: Asif Ikbal <asif.ikbal@amd.com>
To: <neil.armstrong@linaro.org>
CC: <jesszhan0024@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <michal.simek@amd.com>,
	<naveen.gaddipati@amd.com>
Subject: [PATCH 1/2] dt-bindings: panel-simple-dsi: Add AUO B101UAN01
Date: Fri, 16 Oct 2026 15:16:37 +0530
Message-ID: <20261016094638.2958431-2-asif.ikbal@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261016094638.2958431-1-asif.ikbal@amd.com>
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CE:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ed3060-8595-4287-5c9f-08df2b6a6651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|23010399003|376014|82310400026|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	hLnkE0xb6+tg1mUMRDQJ/XpBrz9FT87GyZA5jHqZoC6R2SJHKlMX5jwyInPR2fz/AfoTdHGgI+PulkWxsQ67z9ia0W5ZtGu/XmmrSRhExhz7PoCiFrDIdp+b5gQRaup4suBXa6xUSWe83FWqotLGUffUNyEGATpGg2gpj0LzDl5AJshXgtKDevLnPJyyESx+1tgBb4hrkS51rIxoWKA4fMIeknkjEJ8JBOI6JZhJnBIMz7YdhcXWICHhzBggZFdhLQPYSNZmTR34JClU7u39BS5dXHLdhyy4u8HjGkqLThdn4eGS0xmpPb0fazSaxKRYck3WrDGFPN6y19h2R57z896A6Uxd+BIsGVmP4XKZqGYLSepjMEDIVpPndkf6eIJIfqHJrmyCfbos7TGjMKhmU+OJcvc1FFBuKyRooWfuLThC/SMa2EY3YbWvpBvr/c954MExlZEQR2OAqqSgHCCJrTYHLShC/09IRCG++UglzG0DxyafphTXu3Mu7wluNGTUrTsmxuvovNeH3kfrAyO8B5Jki2ZGp+4W7PyhZb/OXACTFZ3uu+m+1CouS9Ako0dmz75lX3zBuECOLhL+s72+MNjrUZ7Jw98IPkeV8ElxxmdT4KH+LGsceNCvldbbCAT4/a2bY+RJdeSU4uvaAQoYzKjw7eVWlgXK0Q+zCv6wbV034wjf8FJAmpPV8izHLqOz0LZx2DeHWR0xN9BUKddhBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(23010399003)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XzoLX43Tlwk14J7PX9003svPc9vCMuIQhXOlm8hPRA0gIihX10VaFXNnpGGuYzSCEopWYdGK54TN+N+1jhmXJoDWvx1OFi0mY3mYh9HbmWSCPA61Hik2Rk/KPJuBo4uqcuf4jkQUprCtSIoj/H6hueZ9qVK+dfCkC3z5QGcZZHstTRDQr8uCJ7EU0KGnV3JUv60SVRDQmVsRNqCY+XXsah5Fp3Po6uswYQgod/kmjYEwxhIxMvr9urRwQfSKGGqStAyAaqKkyO2PDvD9h2EodMjIDIDDv/A0RhBuFF9EEg3ivw0N3cpEAraOtQADLdaEuVDPM89cND4hQwZNBGyRIo6vyJPg6qVIFTiNAp1R3Mm0T6YbMDyl6GTj5+f9zMfOwyxRSBl6NSD80/noW1LmS7Ztip9ZcdNdhwfElmyvqjx0H7GzQLS8d772sam7Jpcs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:46:49.2696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ed3060-8595-4287-5c9f-08df2b6a6651
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637

Add the bindings for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
MIPI-DSI TFT LCD panel to panel-simple-dsi.

Signed-off-by: Asif Ikbal <asif.ikbal@amd.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 6d4133b91e7c..e1af3cbddc35 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -31,6 +31,8 @@ properties:
 
         # AU Optronics Corporation 8.0" WUXGA TFT LCD panel
       - auo,b080uan01
+        # AU Optronics Corporation 10.1" WUXGA TFT LCD panel
+      - auo,b101uan01
         # Boe Corporation 8.0" WUXGA TFT LCD panel
       - boe,tv080wum-nl0
         # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
-- 
2.43.0

