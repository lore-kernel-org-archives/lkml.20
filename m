Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269156;
	b=OPzcRaXm1YNkH1e1nfKWzM28+QJD/YJdpn1b6v7bEIeNhvYuV/GIw6l2MTJ1Nmi3V5hN
	 K0zV4GRN//H/QP/NwcT2qiomPHqUirdjR5VER9Z7KHbgye7JM66R4eXBdmZegqjaNGZer
	 emOrOc7xok5sFSuGouttd7DjqmXYx7nKrNuUHOtMN7LKiWxXfA2t8XDox8HTEWKY9wPDd
	 FAa7m5MiEmNKMiV6RNwHDb3TUwu+fr8FPR3szNAjrzYM59wdRkbeq/6zOAlJUQyoNbcy/
	 88taYU7eKPpNGyKm5TLBnX2EAV9agfUBj8KO/8h6t85vaARo3GPRKCpxUzewUIgx3Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269156;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=X1NIgwPPPady9vNgsqWp6u79hEpohZvkKV5SA0cXjbM=;
	b=dgptmhfJU691m8h9euLX4+Y/VoheSfsxka3ofagB/m+VcU2UozS3N1ds/BVT+76edybC
	 svZf1zAIfI98fOC75LN8+OOPyHyQLP/x/EstOmXEARqSw90DhMdTQ8dxQQuZwhEYXR+VP
	 6eYoTO89IaJ9RwR2GEC0uSRj1lTKBDAOZzTPV8X3bbgg1ukEbjlI2ZeyeZUM0O2BiRY2j
	 tEpC8xwQN9WagBQxTsDFywqlvGHMtTEuGuQY7xUU8j6+5AcyYumkifXCJIo+oxLhQg1ju
	 qI6C6xYEmM4GogPY6NNxOW6otMKxnQn+FKfbrFYKOGD72UZI220/N3iUE+niHju0Qig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oqf0J9td;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FA606A325;
	Thu, 29 Oct 2026 10:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oqf0J9td
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01E57C4A;
	Thu, 29 Oct 2026 11:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269021;
	bh=KTIXB27nV2CogfdCuFPaogEUe+KRWZ9o8/7dUF1G94I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oqf0J9tdCm4ZUOdAESn4YX7LKcnXqNXV3CUipoDP333o/0Mr/PjDO0x327/wLNYSz
	 DwUyL8eo7tmGUAo0wEK5sc/51FVy5AfQOBpPfoIW/G3B9jEw4Vo8kX9Lh9ZKpDJTXu
	 rIEtOpZaZ0EP8JQDGZUGmNNjWL8Ijv0ElVPYU4As=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:51 +0200
Subject: [PATCH v4 05/14] drm/tidss: Remove the unused vp_bus_type feat
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
Message-Id: <20261029-beagley-ai-display-v4-5-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KTIXB27nV2CogfdCuFPaogEUe+KRWZ9o8/7dUF1G94I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2XEf8ivNkuiJveCq0pdDBohqKlTqYGkJxv6
 +G6AolREv2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlwAKCRD6PaqMvJYe
 9SY3D/oCmh0YA1xqzjDpIEzJxurRNfvRtc5r/cFKtelMdyULN6GDNmm0KUtreKMFBg6/HObLuyC
 GY7pJ4Pw2RvWnrEq5bck+XVRPr0FOJ6j+xPssYoajyz1schpcAk0/xtGhfDhmIES/JEeApH4f5N
 wM4Wuj9PScGrQ6A+8BwlJovY0GHW4bstGWyngvoSasoOptTTwVviGMEBbI6Wo5J+Cy08IGvYk7z
 4otFGUqsERwbUjSxV71POoENnDI2PUYQ8miBVspNIXjf+OcX/Xvqe7hx3w1GKcGr2lufmptfadp
 w0lEULQNuQMsPkAPjxzJTZr5iF4PXz1yRElvVA3kPrNrdShi85uPeE+gOkn7QI1rcvQg2CWznii
 SsPG5Er+DVr3HeTwPtZrVR88lADDuj8W+dnhNv6A/pC3Y/0tXQWM8RTfOrTGcMjs01Y04yLJs72
 MVvyopn1OieZY3azoyJiy7y85fqZSD5kpOQfNMToNz8aWTkCONJgPD91v1+xPqDaALFykmMJIrs
 yYxIOJxcDbumbwBM521pXNGDSKzpxX4xnSCkCxIff9SubczHeBgeeGWfswr51x4x4B/zs0F2v3I
 cLK3ydm49d0c8hJ7B2Oe7iNUL6shvhx8KLWcHwch9ZHiSQUg2s+1aZyps1l7dl3tO6MX3x9oso/
 FhlGauVdJpCIIBg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Nothing reads the 'vp_bus_type' feat any more, and can be removed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 9 ---------
 drivers/gpu/drm/tidss/tidss_dispc.h | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 8c537280faf5..028cf78df3fe 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -90,7 +90,6 @@ const struct dispc_features dispc_k2g_feats = {
 	.vp_name = { "vp1" },
 	.ovr_name = { "ovr1" },
 	.vpclk_name =  { "vp1" },
-	.vp_bus_type = { DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -167,7 +166,6 @@ const struct dispc_features dispc_am65x_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_OLDI_AM65X, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -262,9 +260,6 @@ const struct dispc_features dispc_j721e_feats = {
 	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
 	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
 	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
-	/* Currently hard coded VP routing (see dispc_initial_config()) */
-	.vp_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
-			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
 	.vp_feat = { .color = {
 			.has_ctm = true,
 			.gamma_size = 1024,
@@ -328,7 +323,6 @@ const struct dispc_features dispc_am625_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_INTERNAL, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -384,8 +378,6 @@ const struct dispc_features dispc_am62a7_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	/* VP1 of the DSS in AM62A7 SoC is tied off internally */
-	.vp_bus_type = { DISPC_VP_TIED_OFF, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -422,7 +414,6 @@ const struct dispc_features dispc_am62l_feats = {
 	.vp_name = { "vp1" },
 	.ovr_name = { "ovr1" },
 	.vpclk_name =  { "vp1" },
-	.vp_bus_type = { DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 3dff391d3fec..ebaf559d56e5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -59,14 +59,6 @@ struct dispc_errata {
 	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
 };
 
-enum dispc_vp_bus_type {
-	DISPC_VP_DPI,		/* DPI output */
-	DISPC_VP_OLDI_AM65X,	/* OLDI (LVDS) output for AM65x DSS */
-	DISPC_VP_INTERNAL,	/* SoC internal routing */
-	DISPC_VP_TIED_OFF,	/* Tied off / Unavailable */
-	DISPC_VP_MAX_BUS_TYPE,
-};
-
 enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM625,
@@ -87,7 +79,6 @@ struct dispc_features {
 	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
-	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
 	struct tidss_vp_feat vp_feat;
 	u32 num_vids;
 	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];

-- 
2.43.0

