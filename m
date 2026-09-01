Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA29330301
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263676; cv=fail; b=hwZ8anv5LrfzKOTiF1UIszDBDHnWum4hl9HbvtPNgHqBJDVGwHAFfy7/AqSJYfoBc1dQeYcGdFri1T0o2x8qDZNxohVQ9QmulkJZoRz4ubLcCflahoBWo6T6cakrNQ3fj0eDRBwLA0JwX4/JeBSMMgYqrBl4OPTMKaPzTaDIYRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263676; c=relaxed/simple;
	bh=xD/XNvcuXmTdkuKqASNTGFXF4BKn1Vb938+s1j3+xaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=H9Hw8b3P1IIk9r3ykqvF/0dyTPUTB+dyS6blQDbNK5hwAWkEegFexjicCv2HQ8MY9ktGucLJeDNORb3ShDuwUDt8r7bZoZGcQFzNN9AwVVm+AZ8jNzCBG3lzuRugGjl03ECi+PiFCCVB3ZvTfhaxDyM59XbHgFQEES72iAfnTts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Cl52dwz9; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Cl52dwz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuvP+iAql8844O3Cw7R/gqqxHDA/FZmWjDnIAPIsrDfp9kjbkih2vaLoo8TUZZ3JnL0U9aJPMVUJilqcvWGRfDtgdNZ/+O+Y1Wm95TlkGh5dfYrLK+XBrlxechoPJcEE6nrbowex2hPpf8oihu7xkZauJa0ZHhEOxSnCh/lUfNdfo6o+REEGj/LKPI1WzhStAn11lBI4AkTnVlb5KaXeDHDdXXc75JBBTCHkuYuMp/oPlgGm4v+xU5lPShrUvXelWTTiCvEC6zNzELtnNPW435kH8sQhIGAEqAbThfwYiy7dNZqPeeDrPDWJr4pGPieUVHiOufdkYTVK2pdDKEcCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCu3gjKeiE0fqeVwJuiS1jFx4PaIzKW1OG4qxDjshE4=;
 b=vAqbFC4cQ5LyAhi7I1jSETpPCpL0YycMFVrmfA9vkBOXG+e4TC/x7OBSnkSP5fI+HK3PZJIpLa1UnBdvOE43e2CHT+aVu/AtcZv0gvDxJrrWF7KB4ImCQ6bcM2QiBFwrD/ucQeMNgrXWVtJeDzPL0X/WOsb87gFpd6SLruLMK+arI7N9i6k2q1OlF0jXV2YhYRiW7St+MdmDY9S2Ao9RU9bXCopyGa4Jk/EvGrEquTbfM1UEN/HZCZmlpajsT0MqDWAGdTukqJl29GOSKI7CmDx44yp0uEzzJ/MSnr8WFMCxXAi7/3THL0+BzWqCkUeA+oWNEn1fkGrU0SEs+AQS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=baylibre.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCu3gjKeiE0fqeVwJuiS1jFx4PaIzKW1OG4qxDjshE4=;
 b=Cl52dwz93TMzXFUy3tweMu/ugeJGnNgqcH+CATE3S5q9gtzWZCCBSxtDFrHNh+e6GO6AI4yp0EkqKP0hTQv4Z9YU0BlY/yclW1NXyhYVUuiotATrGXmDzsVFp4FzX5jzmydFw29ipXciCEPy1GAIbo8JAGQ7c/r4vdAQORDKxgw=
Received: from MM0P280CA0097.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::6) by
 VI1PR02MB10125.eurprd02.prod.outlook.com (2603:10a6:800:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:54:29 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:190:9:cafe::6f) by MM0P280CA0097.outlook.office365.com
 (2603:10a6:190:9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 11:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 11:54:29 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 1 Sep
 2026 13:54:26 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 1 Sep
 2026 13:54:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 1 Sep 2026 13:54:26 +0200
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2EB311511;
	Tue,  1 Sep 2026 13:54:26 +0200 (CEST)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 2DD5960867D9; Tue,  1 Sep 2026 13:54:26 +0200 (CEST)
From: Tobias Johansson <tobias.johansson@axis.com>
Date: Tue, 1 Sep 2026 13:53:23 +0200
Subject: [PATCH RESEND 1/2] drm/tiny: sharp-memory: fix line address
 assignment on partial update
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-flickering-v1-1-eaf7bbf9c000@axis.com>
References: <20260901-flickering-v1-0-eaf7bbf9c000@axis.com>
In-Reply-To: <20260901-flickering-v1-0-eaf7bbf9c000@axis.com>
To: Alex Lanzano <lanzano.alex@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Tobias
 Johansson" <tobias.johansson@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|VI1PR02MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fec558d-2bcf-4c9b-bc12-08df081fc74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HBNJco24kb73klezF9yCUTXXmbNfFrjPuwXA5s7WCCVpD8sOclcjqxD3SjnmJx7kJ2VTLVTvKa0lhug8WW/A91isLdI/7PvUIQHs/dM7K4AmDoYUXfCMFvbOV1gZBa9AD2bLbmMNmANf6qGkAQtfU7rHeRn+CNO9PckrKid1lJZlGF3QR2SoYD5K0uobsnqAr0Dhsx/YCws2h5nn5xku0iyhAJR5gBhCgIc9CBWL2gxj0XfzoGlzS3hmsqRoXkMrV+sr+2Lnr2Uk3LQti/jp9PGWrIxQAKZIO8o1nMPaDOP56SR2qb1h397gGk+0uHH04rI1iF/hjh8ESdEtIisnW6ufzsWPvaz/YSdHgRUHcXriBXB7vYIy7afOIN/2XiT2pRtQWyLMm7sTwegE5BWdW4yV6IPE/YNrpryFUJS9VA+o3qj0/X/jTIb3DGkQkDlQkEGG7BIqhaIXz/2A2UHoKcUYtv9w1TZkYr4e5PW72fg9VxhzQSfNu8fpE9q/lBd3cJcg5YgGeiXnsTzr3+GHYSe5hY8yI3kfvsYWhIpKCh0a+xjymn2z1OqGbNtDsBJz9I0QdT1NFT60hUzuVf2EfoXMCWTCS1CChmuoztjCETGHlRZskcscVVlq15yf05vm6YMhkq7zjw3IS0pIqq0hpCEYcuMJxaLa4dyFZfsBFOf5+ndwfU8Nje+100kyRfec7K5F+xIihzmR8VmOTOXSKQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sjCY/I20uIlAITCrlxSLeREZq/OiZJi93/LT3m31LpQDEUbnjq+QWeXLMmA7OOLp0/ONTek4VCeFctHq5CSl7nEib7T5uoM7m1fpM8h2on0yxynuQzLtObw+2py4lK9/71xn57p9fc38QFzuxCiu8IA1H890xKARskEUmgxdE8azf37kMq8ByinEMN4ZXU9oAztDbrQQkBzN335Xi5VNlGy0kNoUub1oWrkubYtlkZddmzXgiStNyfnAcTxHBDVow/QCoIZFWhqt6xjUrSCXeEYazG697i049qnikcuRDNj90wr9tFkUdjuzae/57nbRfLO6KU/VvOiJN/9BUplJWBCfGCwRAEsvnxp/vuUZ3J88rpNc+q52cmECLBpqXzVP5JsDIlUCbpabiadAv3q+8cjfa2kKmDILTMIA2v34AAk8wLbE1shI81v+9+nzZB/Q
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:54:29.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fec558d-2bcf-4c9b-bc12-08df081fc74b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10125

When only a subset of lines is dirty, the TX buffer sent to the
panel contains incorrect line addresses, resulting in visible
flickering on the display.

sharp_memory_set_tx_buffer_addresses() iterates from line 0 to the
last damaged line, assigning addresses sequentially from 1. When
only lines 10-20 are dirty, line 10's pixel data is written to the
slot with address 1 instead of address 11, corrupting the address-
to-data mapping.

Fix sharp_memory_set_tx_buffer_addresses() to iterate over only the
damaged line count and offset assigned addresses by the clip start,
so that addresses match the pixel data that follows.

Fixes: b8f9f21716fec ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index cbf69460ebf3..595926ed660e 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -120,8 +120,8 @@ static inline void sharp_memory_set_tx_buffer_addresses(u8 *buffer,
 							struct drm_rect clip,
 							u32 pitch)
 {
-	for (u32 line = 0; line < clip.y2; ++line)
-		buffer[line * pitch] = line + 1;
+	for (u32 line = 0; line < drm_rect_height(&clip); ++line)
+		buffer[line * pitch] = clip.y1 + line + 1;
 }
 
 static void sharp_memory_set_tx_buffer_data(u8 *buffer,

-- 
2.43.0

