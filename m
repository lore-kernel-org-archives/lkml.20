Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2903ADB99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263676; cv=fail; b=UI6AwEsSvwajoucPlU48+NKgXcAbTVdP9hItU18f78vD+Mf09Qn1Tfa+bOzLGEiMOtds6cu8i+GbUcWNXvfEdimOcZd/7xSz+PkxABCQ8dCo/lQF/oR4GrxeVDCAUM1WpITFh0q2BHQzx9I8B8ZSooTv79EgIDQYpGQ58a39zSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263676; c=relaxed/simple;
	bh=s7e2sIjwSMGIVncfRxOlJzIx4TYrUjsClVqGmiGvh3A=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rFxSBh5HcmBfFlKG4Mp/iPxu8/VnrKM98820TerC5DfJlFUh2ACizpNPCd+ioTVwGmLR9uEcqtNwpgL46657K2DGrOOhYB+V6FBDFo7+/MmwL7EgJKpEuszMipJ/e2zdYT5MHgORuzj0c3uchGw+MDxdkVVvYDzYWt+xOn0W7AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=L75OBKVA; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="L75OBKVA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iICdu8dsGybhoDIX9ux18lWW5SHq1uK1vxOLgLIbL7ExMDhXJjS4qEKLz9emqEajd1CQk7wZ+K9DiN8f5AhrE47RLqgw38KwbATiVrMAniGF1NlV7UoSWv78YmQ3Inq7cYr1RYwFx951l8BsNbt9Io2xHCb9sGnKIcdoIE50nDaHq1e6PePQbfXxHdGGAMUNfphMiqDz0pb8E6lazxKsQWn5OdaX77XgsqBveR6hJIChgfmiHj7XwNIn6Rc48j3MMdHytIzU65OMTVh1jgfNQ5pkuvZelLXv2tmJgbi7uhDBmkGBcoUUbjvhPLEGCu3PQZCrtPhQFE2iaQIzay5ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktsc41aARCSkkLRkAvQ1RTaErJazSSAIy4STJje0WNA=;
 b=qR2PJIn7ivRO4nMr0c/9/M4+ThBb9h7y5FKONOJOEJA+m0oElQ4UZcMQ51hHswRhbgEcZdzox65a6iHaJsN45t3J0NOMCDzi0TH+Bruwn5BM3xR0oSS8ACZnrFCJR6JA5qKLDN3YtMnaw/9PSl9bJ5OlDD8AnzFgS5JZGCHr9Oiu1VCGrAxp5KxfVy4y300btukeT52CkrjWm25Tq0PszRJQfPfQFpW2NCTZJhFtMI4T/LEavCdsryvm3jsOCFOxR3yMsFKyfyL8KX0hvBqNc+fytlw2/iysoNrtayMXcCyeyDlGofBBS/a7vOrw8DmZpoQFe6bHviZ0P9lpJHNhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=baylibre.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ktsc41aARCSkkLRkAvQ1RTaErJazSSAIy4STJje0WNA=;
 b=L75OBKVAkoHbytPesCSxgiNnkrMl1eh//xdDoMTfGdA1iqHwu+ZFfmhnd4Kmdb8DVs3H9/gE5hmP0L+kEvgxrQEABeXix+CGPeO/YeBW75B+I3mmWjObJSOAdASvW4qSp849N7N39pSD4agOpCKe8p1Lo6UZVmU7KLKMYRQznPQ=
Received: from MM0P280CA0091.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::29) by
 DU2PR02MB10208.eurprd02.prod.outlook.com (2603:10a6:10:46f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 11:54:28 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:190:9:cafe::3a) by MM0P280CA0091.outlook.office365.com
 (2603:10a6:190:9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 11:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 11:54:28 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 1 Sep
 2026 13:54:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 1 Sep 2026 13:54:26 +0200
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 301FC18C6;
	Tue,  1 Sep 2026 13:54:26 +0200 (CEST)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 2BAAE60867D7; Tue,  1 Sep 2026 13:54:26 +0200 (CEST)
From: Tobias Johansson <tobias.johansson@axis.com>
Subject: [PATCH RESEND 0/2] drm/tiny: sharp-memory: fix TX buffer
 corruption on partial update
Date: Tue, 1 Sep 2026 13:53:22 +0200
Message-ID: <20260901-flickering-v1-0-eaf7bbf9c000@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|DU2PR02MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: c65681f6-0b4b-472e-e5d3-08df081fc6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|82310400026|376014|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/qgFMQH5BAqsJz7jws+WK7Z1F+jg72TPi9824Y/YbP2ojUCDbJqOMxJTphtDUZ7Ppghmq6CyGzyqfeOSWXgAlml5Z4OGLImGnAInjJhCasRevEbZubV3s1b72s5tUNtjxWy8pecLde/NMYBsKyGlvjKXO0At+vHr/UneJAUTPklXJCA+gvDx2JvpuwfdGrME4kxKZWcm2BZWhJIZ9XC1JYLanYQ8YOba3PZGa3U2ycItYJ+2jhHm/A9P1E4p08zbwzAxx1b70NOs+BBMv3FUgr3TYqxaA0s+Sr+W3i1Fqu8Rpccshezf4YZb4+9iJhX1sOnCUI7iWGRs0brgCFPb181flsjSGNCoWIim0iGO/VhAN2N9jEA9eg9HNGfnP5BVFHZCqYx2V0imI3tUhxUD1ZjO+P69XPAdWThM1bX0WfFxcx+1N9LwCRYDLWaDeeVKFFL09AfUKeCKuDd0RZrgfAIOybpZRxYrOOXzge7faXAqhwX7vQ9SmC5hlIgmDaovxI5HGgjbt6NNhPnyq1wBZdxrFfQMlhJL7UM5SxJ4RoAYbDjSsR0k9dfXEcqGJwqhEGbjrYk00OxJzTvuaANB/1hMvx+kLKMy3NI/Mm5Sb0kJsL9vvKWn7jZH34OCuSE68nDk+rfTHygQvL+4wiEvIwenj17rIMHmp/9ZbuWU6qjS00jHvvli5cVnsGVu0eDD5nPM3YFzbYbKy0sns+X8+A==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(82310400026)(376014)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yr1Q6dZ5P6SPAovGemHjE/IJXSPk955pE6Gw29AoxWCVOXP+7wX1ag3BT9FepkhSJ1DNqdw7juMcUKNjZOqTe6Yzct416lpgidax9QyL8uxSnntbsbeISeFCUc+sqxyPt2yvcig5t1dpcLgJf7e+vcbdyv28o1AQi9ezrdGmReQYApRp6Uzg0lAH/xDcFJ0uIdWCdn780Z2cxlFQaYUXYYoWFl8XEXwty4885yqwrfFdEClCM0Zx5kmLAJFmwItFOpQopUrn3fEFDOnQNS/L7rmxBuF5zE9SzDe6i7jJ28/D6cLr1G6uPaqJLX808KGGbvfmo3mYkTg95wDSRKOywsWSRg2y1gNyVVDwsskzrGMON2nY8SZxgtenF7gJp6hXfUF130QDLeYEdVI5ZxuIJWLRDekpNTb+30sLkcdeIgS4UyKRnbK2r88jBT+tTUEL
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:54:28.0862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c65681f6-0b4b-472e-e5d3-08df081fc6ba
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10208

Users running applications that submit partial framebuffer updates
(such as LVGL with dirty-region tracking) can observe persistent
flickering on the display when using animations.

The flickering is caused by two bugs that corrupt the TX buffer on
partial updates. The first patch fixes incorrect line address
assignment in sharp_memory_set_tx_buffer_addresses(). The second
patch fixes stale data transmission in
sharp_memory_update_display(). Both patches are needed to fully
eliminate the flickering.

Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
---
Tobias Johansson (2):
      drm/tiny: sharp-memory: fix line address assignment on partial update
      drm/tiny: sharp-memory: avoid transmitting stale TX buffer data

 drivers/gpu/drm/tiny/sharp-memory.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: ba683f774299d89d17cde03bb1bdb13f3513cd20
change-id: 20260316-flickering-f9df09243d2f

Best regards,
-- 
Tobias Johansson <tobias.johansson@axis.com>

