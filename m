Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572458;
	b=FZxOdj0hEhbaRaUhgKGDjQXi/5rAlLHviimMDKHRk8hsbPXCfHN821tXrE71PXXCLT5Y
	 t64EsaI1Cn0cJpy4w/voeIczuZ8NcrUP2c+5yfGjVBEAj8wFHFsAXDxosvqiUu1KhAhLj
	 Opts/CrpZwE94I8VqomF+IHkooXf1jPgZsqzSklu9erQ1Ey/PNNES9Xp1Ord8cSn/g3qq
	 dtNtmyjLsXY3o8BSsFoLUgEoyJQ37rBCW7OEoT6SG1GQpmB9+25mh5+5HGyJXxaIrlN1b
	 YBcTZEydHS3seZkwlfke63ll/b+Ao/JWbdyC8pR7TKmQ0ARF1XK3aG9xwpe28WlwgPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572458;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wDkXlzlv3jzsc4Ncou8I9WNxbAbhe8xG98RgzcGw6OY=;
	b=YVxeAWh/L7h+DpaSBLfeBOoohD5A2MCHv0fl8B+w8ixJZkKr5RZ19/wyAn0IY0HTEYcw
	 bgqj2RYGq6ghyXqzufLcmkhrcz/an8kwbatODmM5g2lWv7c270LxaJfxcfn33jg7cy4jW
	 xAOJY8uGV+/nGTm27nsHiLHdi2PGUTofYEtkskdsNqHi+dMM5MAb3YwN5OfJpw32SwJO8
	 5WFSsY4sGhbkjzIMuT8RRvyOca4iAl1zPtOZtFb/LlPGjekdoRsbz5AlxOJehXRPzJJJV
	 Gh/dreu57VJzrHa6/liqV7keKTWzrmPv/V+cU2vQqieaVtHWh03Ek4RjjiNYIPcY/gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Xo6m19za;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.1
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F6606A8AB;
	Fri, 13 Nov 2026 12:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752F6606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Xo6m19za
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEn/eiv2jvjHj6C2hDoctJzDt3BaBdw2z0yIg37GjqdeDrtoaDz2cp9bo5qx6THlI6Q6m7gqb9sT9XTTSrrs9TcuCSQSGsjTNlMFe9V2I1ARQbdSHQbkJsY62t2nPJbwb4w1A0ZozQ82/D0ISwj7MFXlhJBxOvhJs9x9unz4nXg7PbTKCY6wsJAIbBr7qrXgijuHSqYo8hSOqTLFxNvh937ECF6RjTX1cb+iAlb3NBx+2Wx/yiP8Lykb5pEeLVbpQwJkq3XLs3jFD1KYCLzVCDMgDp4Hg4P1dktCj51clZVpQ5koBhhQ0lNFkDJyQ5TmGrqTE1W/HKuOH/RjMPu0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDkXlzlv3jzsc4Ncou8I9WNxbAbhe8xG98RgzcGw6OY=;
 b=oldYEhYeOsqh4/Y2qmFm71iJRNZtsQOhl+R3UG05Dp4XbF/jIPdnLWPFT3QKU4aH2aFJTpPz9bo8/iTTNEnW4py+PsF81/oplevKJpV6ENPYKaPKV4vFV1hAZY0JKGlK4of0wrV7GpWc+z3dOsv8Lel0lgPsjoyFRDhW7hizb+ZAYbGrlWj8bD0khy/jBc31eMZj9OJam9U3NFCWx/ul6uKSgNUMnDEcYbLGNgRch6YIu9rnV6KR24Z64iaS/dL181Bmi53rSMpgOlVl8ekNdMIj8lPfvCO3yYolnYfp0Vkhi3l8o9OSC+BfLCtKVliG52FRsVkTY7EscQ6XiS3NnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDkXlzlv3jzsc4Ncou8I9WNxbAbhe8xG98RgzcGw6OY=;
 b=Xo6m19zaQj3pJWcYAgEumU9SVrrabnNaEW0VPSxZlFYp2OAGlIkYvwnS2XFdUb43QKxszk7KODHxJYpwXU3MvuzooEKTEhjywQzDpSTko0QdDSQEnOAN6NazrTxKfMcoXgsZMLe+g5Mmh1PMxMMRYwLb1cxiPb6gs4SbjLYi1FQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TY4PR01MB14799.jpnprd01.prod.outlook.com
 (2603:1096:405:25e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 12:20:53 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 12:20:53 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 02/12] drm: renesas: rz-du: vsp: Keep the planes in the VSP
Date: Fri, 13 Nov 2026 13:19:58 +0100
Message-ID: <6e420483129b494a4522c952de593b8082b9510a.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0038.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::21) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TY4PR01MB14799:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a1bda3-5a4d-40a5-0439-08df41808fc3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KF1X3MaAdFXGXPcniIlydNWVWw1W9Pt021Jr/TuJAMukcGKWEnbmXoHrHo0duEzouX5PgFB16NhzNPZVpQ1kACcD8OozQ6HefJJvHq2j8J5u6hzdsFv0GAqKKJfs5N4A9e5Dc+GqsE+pwqzsNVFP03I23gEPVo/OR3UxQDHjnFTEk3BU8v7hJVkySNgRbGqdhJwhwRB/77XBKKC0LNl+eVjr2wBGc40D4Mb5qRGtq7WpRQ4gXAf5UZKZ2tIel1GaamoftVSVPKTQJmRGkj3ltrgZsk6otYDoyLU/qS6b2nhxN/M9K5AQrpiTZRSdScdWPv4qcp+uunOCpVq5uWPnKzguumVVGdlRu73eLXLaUCXNC8eVD7MH0GpsyhjUwEpaGdTq2TjHFD7KCIAkZ7zvHFw4qHwfgTc1r69n8st9YgRZaxvOMj2LpOWtrtJrTEfjlV68pEI4s5o6n+5LejVz+2fzPMoHDKWNLXAySeVh1UZZw2oFY6JFkWLNrrE/RgBjJNNsiF6FCx/24+O5DsAvziil7N0Ur6XC4RUW0W4cEz+vnBywj/u5QbtDXdx910WuhorpqRtOpu5pSb7ZZxco7ig6SKeS30Ka1OiAvOgJ1AASidLQKmYpuNoxUhhi7t2bzkzkc7YiXPROpKPzFHMLzll8h2vzjU/koiJ0inieVQAr7UGCNAKHXbuCkb5fC/QSvy2uI7m7DU43267G/js7SKPyqQdv63NyudhKZOgQ6a0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BX3L3/DYEGI1ANnjTJPAgKJkBystxftWP27dCvyIJDjDgrh5788aPx7sXOR0?=
 =?us-ascii?Q?tWGe4qRRAYnO5s4KVhiZS8C1dxqi9l9S6qzJ7Zr7tnt0Koup9PWMhRk0N11n?=
 =?us-ascii?Q?8H60xXsjxUAbn/ClZ8T9pFj+z0GKdJ6J8Y1q8h3TlnMGMWOMZ9LKDaBBrL+h?=
 =?us-ascii?Q?N/+acBwL2Pyy/M+UEAFxl/oaQrZB2JeSTnWowq81lafsr8zYwhA+Y9cwTpEc?=
 =?us-ascii?Q?gk4/qN3Mx+WpsK5caavAD4uP7OxahL7YbfYL+ilhhYj/Fo2AqK1eFacxsv6u?=
 =?us-ascii?Q?oCfL+bf+z/JB2KwO6JgRjBlAnfbBEk33TzsTfYQDPJu48y0j6gRS34u1B95g?=
 =?us-ascii?Q?oWmbTQTH5nw4mbX6dZnNGOMlUo/BMVqY7RKCDqsYJlc4Yf/ul0XCH0suctdo?=
 =?us-ascii?Q?nxMizrxcm/rd5Le/JTTJDxpzmncfGOx1SpmgSXzkaqfLSUQtP5YoOlnuCzDF?=
 =?us-ascii?Q?tjLjIcQWaybWlDOpHjVqD5Pd5IRvn/3Vd2N1sLjxZifBsbhBscx8nqWfGsOt?=
 =?us-ascii?Q?1pjGa5lNjL7ZGg7d4lQboxNsz4vYAysQY0y4gGNiWAFe6hBZC2pvilXicsiv?=
 =?us-ascii?Q?QFj6Lp76GwfGUP6eRwjPZyAV0BncWqnedxCM4S2rxoXDEZp4RMPkEGWFsKd9?=
 =?us-ascii?Q?rZRJxk/3T3w07reJtk7AG4J/1JWfaOjhN+HQFPtOQKpepvVT3r+dnfn78ayv?=
 =?us-ascii?Q?4cXW7Wh3NSRafUyDEPnAtQaeGJSgbupFPE/hEttRpSG5HMdJoOXQvlGs7i5G?=
 =?us-ascii?Q?0nfOeWFFAtlpIrXFI15nwpCB9YaEg0u4Tw65eenu2ANNEDgTo9Gp2610W19D?=
 =?us-ascii?Q?t1jToy/GNIuciVmKh5ucDNivSR5lGkk3kivs+rEJ89Zhdvs6eHebTGxRZx9r?=
 =?us-ascii?Q?ZLapczqBOdxprajmfQmbYSOE/8zcHq/Z2RRrK0CL9A0Hgi/UjzVgtGe3GAat?=
 =?us-ascii?Q?f/4xmOsKVUZfEMnMI/H2B/avbyIMCGu+aV2umtqCZOtA23YR3LY2QOKymZf+?=
 =?us-ascii?Q?B7qBCcNYdfTKQjNgJDICCNGsvNwZWtDgfCLhDexIv4Yx8ItMwnzdIkhWHaY1?=
 =?us-ascii?Q?qO4WdBKlhG+N+Kdfb4DuFaTIOzNqtj82ziOofM+5hUiD+VdZ0SKk0Wh0haLI?=
 =?us-ascii?Q?Z6WV16nn4jxIDYEwlU9PBlDORftoubtpItXWImHr6Am5lSb6+8XJIOFkOm7z?=
 =?us-ascii?Q?mrEvldSfVIejgxmB20T1Vi9s6EjEufYOkYM6pmjiPhsSjM/nfQEONC/v+g5q?=
 =?us-ascii?Q?ZY0SNJmG12SD5IZz23ipFszATMXN6dKxnyR4mnKIwE8i2bNaQbPPPxcQmxdW?=
 =?us-ascii?Q?KsxrSKyq3O/Zwpy4800Nqjox+OIe5uPoTQTk4NSAh3R/R8euwDE+SB5gvAfF?=
 =?us-ascii?Q?F68bfqEtaOhgtQ17HcnoIiwD6H6IHBmj5vKDcewLgVNACV7Ox4L3ruqa5Mtt?=
 =?us-ascii?Q?TxKCtB0QCmrvw7Cs81UPoME9PWXK4SAWtqCxtrS5XH50snw4Bz46MtSvKISP?=
 =?us-ascii?Q?d+sFdua4sxZeTe2U9dQhKksk136foevHQ2mzX6cmaTU7ZoJxqG7+OBfykW4P?=
 =?us-ascii?Q?dT1mg6vF7IFsZQMid0XqrDUnfoKFgB9Qgn0dqBLo5eBWpjSvrt+SurKXCVHW?=
 =?us-ascii?Q?HUxigxpU/3MB7grGO7IWeDlVPZPBKsuqmesN22Rk6NROE2yk591MTTr+6CiS?=
 =?us-ascii?Q?jVU2+UoSKoGG7vxCcdloD0znJG3R57DY33565PjImkqiAQHuQl6F6ijlG/zk?=
 =?us-ascii?Q?UwT4mmhHbydvjC19c2MrA3atfX4DMSFnw6gEn27IJoaE+GtD1CcO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a1bda3-5a4d-40a5-0439-08df41808fc3
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:20:53.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9DgrL9a+l1sic4GGAojNjyjykYVcpSO77pz8FYPaJerOTvqMV8O6WT2jAn22ekutREyeXZY4SGiARbfYHQdgulO45iirTy8v/aZbVLD2FUTw1kme2FQVksjT6/aLPaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14799

Each VSP numbers its planes from zero, so the device-wide search in
rzg2l_du_vsp_get_drm_plane() picks the wrong plane as soon as a SoC has
more than one VSP: the primary plane of the second CRTC is looked up on
the first VSP, whose possible_crtcs mask does not cover that CRTC.

In preparation for supporting RZ/G3E, store the planes in the VSP that
owns them and index the per-VSP array directly from
rzg2l_du_crtc_create(), as the R-Car DU driver does, and drop the now
unused search helper.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v9->v10:
 - No changes.

v8->v9:
 - Dropped the vsp_pipe bounds check in rzg2l_du_crtc_create() and the
   now unused num_planes field, aligning with rcar_du_crtc_create().
 - Updated commit message accordingly.

v7->v8:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  4 +---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 19 ++-----------------
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  | 10 +++-------
 3 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index ab2f24cc7683..c57884ab5b9b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -409,9 +409,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	init_waitqueue_head(&rcrtc->flip_wait);
 	rcrtc->dev = rcdu;
 
-	primary = rzg2l_du_vsp_get_drm_plane(rcrtc, rcrtc->vsp_pipe);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
+	primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe]->plane;
 
 	ret = drmm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
 					 &crtc_funcs_rz, NULL);
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 944bc9ac9589..12fe35740c62 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -71,22 +71,6 @@ void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
-					     unsigned int pipe_index)
-{
-	struct rzg2l_du_device *rcdu = crtc->vsp->dev;
-	struct drm_plane *plane = NULL;
-
-	drm_for_each_plane(plane, &rcdu->ddev) {
-		struct rzg2l_du_vsp_plane *vsp_plane = to_rzg2l_vsp_plane(plane);
-
-		if (vsp_plane->index == pipe_index)
-			break;
-	}
-
-	return plane ? plane : ERR_PTR(-EINVAL);
-}
-
 static const u32 rzg2l_du_vsp_formats[] = {
 	DRM_FORMAT_RGB332,
 	DRM_FORMAT_ARGB4444,
@@ -303,7 +287,7 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 	struct rzg2l_du_device *rcdu = vsp->dev;
 	struct platform_device *pdev;
 	unsigned int num_crtcs = hweight32(crtcs);
-	unsigned int num_planes = 2;
+	unsigned int num_planes = RZG2L_DU_VSP_MAX_PLANES;
 	unsigned int i;
 	int ret;
 
@@ -350,6 +334,7 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 
 		plane->vsp = vsp;
 		plane->index = i;
+		vsp->planes[i] = plane;
 
 		drm_plane_helper_add(&plane->plane,
 				     &rzg2l_du_vsp_plane_helper_funcs);
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
index a22aaf0843ed..acb41d343297 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
@@ -27,11 +27,14 @@ struct rzg2l_du_vsp_plane {
 	unsigned int index;
 };
 
+#define RZG2L_DU_VSP_MAX_PLANES		2
+
 struct rzg2l_du_vsp {
 	unsigned int index;
 	struct device *vsp;
 	struct device_link *link;
 	struct rzg2l_du_device *dev;
+	struct rzg2l_du_vsp_plane *planes[RZG2L_DU_VSP_MAX_PLANES];
 };
 
 static inline struct rzg2l_du_vsp_plane *to_rzg2l_vsp_plane(struct drm_plane *p)
@@ -62,8 +65,6 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
 void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc);
 void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc);
-struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
-					     unsigned int pipe_index);
 #else
 static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 				    unsigned int crtcs)
@@ -74,11 +75,6 @@ static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node
 static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) { };
 static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc) { };
 static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc) { };
-static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
-							   unsigned int pipe_index)
-{
-	return ERR_PTR(-ENXIO);
-}
 #endif
 
 #endif /* __RZG2L_DU_VSP_H__ */
-- 
2.54.0

