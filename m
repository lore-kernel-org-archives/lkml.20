Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54DE44A411;
	Fri, 28 Aug 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919782; cv=fail; b=FxZp8ZX4wXrQxYCQT3ER0Dgdq1XDMe/WAOdy+vyudJi0sg32zkR2/6jkg91L5E77XbBEVPg6SeKIWOE0pZ0LvnTE5Wt17bGnkHrpdASp94ngifJSirNLyi5R/uUgAhC0HipnMe4FAMzYoPVvvRfHtgj0eNsf7WT0kAaqJasZSco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919782; c=relaxed/simple;
	bh=fxnf+Z5ZVirC9ZIdq0IlpZBh55a8Fk6+ckMFS5GMz50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UtN1hTwbDpYwgeKGZ7nGS3XZsCSGpkYH4WtxWTpDYIs3ILLOgg2u3K4F1RZhXpPYEOcMVlEfG+hR+pMOSd38ZUmDRAWLvfFIrQPzJk//VCTC/2YkMs3SxYpWL42vLMtfz8ETt1Z0YOWbXIH2y6/IIJEO4yE1Nl7kc+EqBaSOeUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FBmVUaqc; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FBmVUaqc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBeSXFFW1A8UV8FyCkDbNaBrak9eLVyWmYHPehsYwvb8eMi+kImXTamI7+7qNhg0qYuE+vBUkOqxL/WKL8L7CwCiJvGpuplbaTaZIFre6W289sbj98PUvptIkDIzwnczJ8EPWXqJwkSB8tDp28zeY126UuVLizlzGL3/kIRn60qWsAzI+zx/EWRwKnE23mnPAY+6hwyRF9rlMsOF4hzIsGN9dXdw+ZR88zt7mIqjDocXDOeepbiIvblLXKDY/acbzcqXVy3xsqUs4SswtvvLzST4Z6N5Y+RWMuxrwE7s1lLqRuS0mKHZ1RHRZCY/ljNOSVX6K/oJb/xN4qkB1Ka7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVs9hamJs8nNqPf+XQZlxqsQWnTJ6PojWE3KZfpGQ6c=;
 b=SDKd7zLTb16UTUGB0wnbOAk+giWi43zQ26cV4DK0ZrVBLBQ4NI1qt3U/nnVOtsZxfwSkYZB07Y91jtxgQ2LKxSpR+z7WactyF0n6Yn5Oj5AQJmPRotPfRCAVDhIxt5OExYytAvMPerdJIhGGsTWbygnUX12gVuK/aqgWXA32F3au0hNdaGX8+C+8tCjeDB9603Isc2H3P+yDpkXBT4RvcLOGre4SPRNxtg4y3g7NjndFPdDQrIQCcv9WWi7h2wM+3AFXmYiH+PabIgVq/PjEVgRPNafnskWrZysb2B9QT2vug+57ARRYInyfA/MmS7ZcWDeBbaxETy8OlgBIugWVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVs9hamJs8nNqPf+XQZlxqsQWnTJ6PojWE3KZfpGQ6c=;
 b=FBmVUaqco28W7iHDDfdA5TaiLwERGSQhiTz86qSPInqCeG6VJAMbfMMDL1AJfmx+SXboezmhb9+lKPsznMpUIxrYhop3qRSFY45muD5CrBo+ljgx0IOMnpoimlt+a/uXZ0GSk84oZxirQCZVcIKmLS3JFqjCABXPOBJAXgJuMAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY6PR01MB17444.jpnprd01.prod.outlook.com (2603:1096:405:360::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:22:25 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:22:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/9] drm: renesas: rz-du: kms: Enable multi CRTC creation
Date: Fri, 28 Aug 2026 14:21:08 +0200
Message-ID: <20260828122113.1426778-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY6PR01MB17444:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dc6966-8e4e-4c5f-ad7d-08df04ff047f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TeiV7QKhwig+vETG6Il3HBGm/xaqycz+fTwwto/mCYzNJQ2TKdUcp//5Hm3DFsbg3UGvYyiGcA/W/HaaU3LRuEV8YP8gKMx2zq1q3Rqmv8/N0TvglAkbugVOzfwdon7J7cNfk7KSzzr5ojOIk5o4I571Wr7He+A+VMbWzJ9uGazvVlknGk2gk6JKqxJSAssUY9HsqCzN55WjxfQZ8B2ykiCJNfG22UEYl4ncoI7/1oTyd8Bej1pTvhR2AxRnZHN+bW4S+tc7NffqJRtVm5gw88gSSZs0FbXeIuLRjuOWkBiCqBHh/VSxcZh+XpvECCF4OqSlYh+7E83PYy9UMwECtdHw8FMLgvy0FujdXMDhlTm2jrj//UCZnudbb0/lLtSA8nZ5Le1jyiahJkyTQ3QmmPhqN1YxaWI+7U4qtoBLyBOjUlsTV/63OCYwIGvCkTW9Wx7d7AXAphhGUWfS7rZj4C7TAPBFZ3hno2WcszcUlryzUviaZ6TWObSUoEDtNC9cdCLNslrsQCC9JUeiC1lPbees4RoCbo7bU/+wxMIq4dT2M0EXmgtzNiUQLTTQUrlAjprMRisVxkitztDubtROhl5EcEUBc1cY+BQ6lB/yWz/FLXaqUYznBPpG5b5ZYqxmkUQNL6HowM3Up+dFZ4OqTqNvcQiw+T655pWuwp0dvwSYcx4vMCc7/unuh9vaDAhtQPbLK8XZoR1Z6alxaq7bJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTbEkVsIbE1rh0yUyF24I8YPmZBITslFWUsPdiu798AnowSvbySw210BPzPJ?=
 =?us-ascii?Q?+eilKoWfXjCvBt/AKfKxBDu+HbiBSzhKPVdQAqXNNF7UFhOIifu4SaRJOtOB?=
 =?us-ascii?Q?PUSE7EQYHlJyqsedi1aaiX0FLmzLTSIdZ57X0T/3dIdp/zwCuzTd02lK6v0N?=
 =?us-ascii?Q?2I4Rkrb8aL5I8NQlc2r5o1VCFYpGIxNB+gW8pSqv4JrTX76S5zMAvv7nmiFj?=
 =?us-ascii?Q?yml/65WVjF5twZtupeL91KBv9cnYk/A4ZKP8rObTYUiszBvnA0+mWyd2BZd/?=
 =?us-ascii?Q?RDw5Lq2mBK3n04PdrxzKE6bjnEkqX8q2M6mC+AlI39GDRwjNWgQZLStUoMJT?=
 =?us-ascii?Q?Aie3YL19dRqXD5pRbNXhRNRpbiYhm4NVJDa38vQsaMDKtbRnUKG4WVOpsAH7?=
 =?us-ascii?Q?BEqWXbhibDrXQj/XhDanGVePn/vxcr0dX2E0WK/VrNRYhTlxL+YXwTWEGooA?=
 =?us-ascii?Q?t0xT+eLQbxjiS1TgS4Gob883Sj7wSM630Sp7f34AbsNfARMdL2lU7Dsy9pmH?=
 =?us-ascii?Q?m/hvt/5XbMZy4Ll16rS8DUh6M1U7Ofg99hnSsJmUALI7EvEqb66yX2AuooTv?=
 =?us-ascii?Q?bsbXEwSem1UTW0v5HitzJV70RsaFZZkqtnpjRHC2e2xMFR8SB3OV6IFXaE6n?=
 =?us-ascii?Q?+QquTbocDQVYdGdC5HwkpdKOM8MENAR2VuiXpJ7/pzjLekbPtMR1UKkySem8?=
 =?us-ascii?Q?08fu+WRUuapmOtMvUrPqbdbJ0zGluHc5NgYMTb+piIqfmF38Is65WOHoa3BN?=
 =?us-ascii?Q?cUSCux0Wnvphj49yUEOLcCe274+WhWTI4IEJg5yKyOeqdL9t9ju2oZ+ssiox?=
 =?us-ascii?Q?zEG+8AsQ05o38bp9zgXL8HCfT6oSzUOJnzArxCKE6MAZcZPlXVchOpI7qjXV?=
 =?us-ascii?Q?L1Tgu61pUOYIVly3MSHeUnfO4AFWOYreR6opX+gRYEqoyq44GYaCYqTjP7zm?=
 =?us-ascii?Q?amWN9fnStvlVjBVsVnTbQyiMvtx7CwxEnJ9rsJBvtNQuzAzK0XnTOJGH0VSP?=
 =?us-ascii?Q?zpTBKp2ra/SJH9IrXPlK9+UNkvulw4yvWXDFaZ6ZnPe8Mbnkimc4iQwR8rxQ?=
 =?us-ascii?Q?7VdQvVGtMwHIAYq25M3adz8yq1v/TWVQKSljQFRXPbCLXP5HKDol1dBzBMFw?=
 =?us-ascii?Q?xffB4nenqt9Bfh/heQ5DBCqM+UVjiGn5v1wZZqhFE96OFRM4xhxPHImCVIVI?=
 =?us-ascii?Q?T10F18xEvo8r+yxbzRQY3/x0RXH7EPTn4rnKpKze8sOOV3WA9d5SeAMrnH2N?=
 =?us-ascii?Q?n26TgxBYzd93THQ/LlhwYbpdfPhla0R3D29M50KOa6mLOYwXn+yEuYR+ec/w?=
 =?us-ascii?Q?ZZzZr9brMdEem+cfy9WZpdhJ39oMjwQPNez+hJFyv92NW21rRZPVXeYF/yQ2?=
 =?us-ascii?Q?cRgXbmerLlmGZjViErrkhuygn156IAhBsd2v8MZuZA+xXuU8mV9ryc6WGuNl?=
 =?us-ascii?Q?ZYjRj53cNs+CNsPUa4x1PXRLSyQyKz+KnrmSiO+5+xic/jhZjdzrnqrcdn/c?=
 =?us-ascii?Q?kskxcgX7uAY5aJyEuZHgc/gYqyLJ1Yw1umZA1Z1akADBiZYcenhWCWLNAIKz?=
 =?us-ascii?Q?ckM6zGXQ1zeDgMIUpPgDjxiFbYMnR5oJ2mSCUatynhX4teOiPJucg5jXMOr6?=
 =?us-ascii?Q?DTl+ZweED64F0G6VxAEqSJOmlGymTqQ0TCLSpi7KDH1IlelRobGAXhAsNeuN?=
 =?us-ascii?Q?pLvCh6zfThELVvHLLnWEDT4Qfe5GGFfCgxQzRpd+Edx08b2OVTJqe/vWpCMe?=
 =?us-ascii?Q?6GKiaejTvhh+E5wAByhNl0CVP79diKUOPhH+DABBGea20l/IqzLA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dc6966-8e4e-4c5f-ad7d-08df04ff047f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:22:24.9511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dYrFmes/ut7BprtLoh4FZGCFW8GhNjxyKIA1gnnBPTC0V7x+2hjtK47mVPTMIccealLLV2SKkgyuSaNCW5v0dYrG2e3kcYJGChP3X0AU+8wjHuJICNHH9EwD3dtNrLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17444

Raise the CRTC and VSP limits to two and create one CRTC per bit set in
the channels_mask of the SoC information, mapping the software CRTC
index to the hardware channel index.

All currently supported SoCs have a single DU channel, so there is no
functional change for them.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h |  4 ++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 14 +++++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 3a649fd438e0..cb9ad869d66b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -59,8 +59,8 @@ struct rzg2l_du_device_info {
 	unsigned int features;
 };
 
-#define RZG2L_DU_MAX_CRTCS		1
-#define RZG2L_DU_MAX_VSPS		1
+#define RZG2L_DU_MAX_CRTCS		2
+#define RZG2L_DU_MAX_VSPS		2
 #define RZG2L_DU_MAX_DSI		1
 
 struct rzg2l_du_device {
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 7cbdf146788e..04f51b9d1dd8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -405,6 +405,8 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
 	unsigned int num_encoders;
+	unsigned int swindex;
+	unsigned int hwindex;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -440,9 +442,15 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 		return ret;
 
 	/* Create the CRTCs. */
-	ret = rzg2l_du_crtc_create(rcdu, 0, 0);
-	if (ret < 0)
-		return ret;
+	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
+		/* Skip unpopulated DU channels. */
+		if (!(rcdu->info->channels_mask & BIT(hwindex)))
+			continue;
+
+		ret = rzg2l_du_crtc_create(rcdu, swindex++, hwindex);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Initialize the encoders. */
 	ret = rzg2l_du_encoders_init(rcdu);
-- 
2.54.0

