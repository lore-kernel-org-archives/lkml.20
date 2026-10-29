Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269154;
	b=HuC8us3pBaRAibgZhK+Iq/8RHkp+ECpTAxbOEeVXJRdauaPEM/e5I6+0tw/E7rdgycLn
	 6BVQjJYlzAOU87rf0jvHzhYseLcdn08KBl0477ProA5Bcl66VFT+u//3jfF3AgwqIIyoG
	 69O2LVYN9jVwZ25NQpAOfjIFusfNGkqP3F+77HjIKjPp7PQ4f2qB10tJiZbeNSTaREJKx
	 Itox1/j1chkRmc1WzcID+p8Jti3s3EOiKTdPn/K25ORAbEo7WN4se5Cb7CuFVsAv1AvSf
	 cFf5E3jYYU6G3aDoqWa5oXDopQvUPPxi4duWteN57q6dzodcUMVyyuikYomlEvSK0iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269154;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DBvMxZ6LslwRYIA/ymXxr6ThNgTHCwGvp5ermnf1upA=;
	b=jBtL8ECtWRdgmgNyHlwd2Zw4pOdXGD0zjT+CoIAHpIwHoWn9rtFZmQH0clbDFs69+CeN
	 UPRdVAk+YpPoUxox/dDiuBJELKD4uaofexJU9VwzwcuJIFDBCTeH9Pw06FOWtxucIdBQZ
	 kxFZ6TZOcCGLyTwfCOwMEJvCfQ9C4TVU+f8hzZXA5a1k+rUPULuDJqcpjg8X7vFDonQGc
	 wz/DlX7jHSkyHvwJFvAv9c3kf6zBCNKyO1n2J+cuaLBYo0bJ75eo6rLAqy8C8Y6YCz2XK
	 9ekfxnvAo0C1I3fK1EzQ5Zg0nyh5902Yu/ojYhhaX9t1SsRc78A18b7lgkvh5Lp1PLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ujm4a+vS;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC679606A31D;
	Thu, 29 Oct 2026 10:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC679606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ujm4a+vS
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A6B9802;
	Thu, 29 Oct 2026 11:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269017;
	bh=TEC0Tn18n1HeiWmbxdsliGWYWPY+kfyznyDz8yGCKEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ujm4a+vSrr7c8O/XChUC+V8GfxvXO71koRNk1MSqf6zyXeWFZQpHwTS4fR4B4on+R
	 +XnuXXSEone8MNfomMQdbQucTTPRyvF4iM1mQYJiRWVZ0/jMktXbuoE2SNhaXsPML0
	 /vDjtX91fIBY0VeDLuc2u3kO8l6rEd/QpknWCe2U=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:48 +0200
Subject: [PATCH v4 02/14] drm/tidss: Add helper to identify the AM65x OLDI
 video port
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
Message-Id: <20261029-beagley-ai-display-v4-2-dc7f2b532478@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3801;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=TEC0Tn18n1HeiWmbxdsliGWYWPY+kfyznyDz8yGCKEY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2V/6l7VZLSSsmY02UwsTXwLCCdLd6CO0x9d
 oZDJN8j1XqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlQAKCRD6PaqMvJYe
 9WF9D/wJllN06e4ZQGxe4UcmfdlPI8/Timg3XLNgFCCS1VCU3zdpEQiYpCnFMHTf79p+UtQMR0y
 2xoZ6+GwZmvkean5cQeVZDZTwU+tjmroukxQnegVKE46u+dptfS/2Gt7Pu5odnV8/QEFZaUKEsO
 cbXucskd/keBs1+1SP+dKoWi8mAXPlMoLRohngd8DVhPKZr7FI7l7lRcsvNQBlhmN4gBox7Gl4+
 1OhHGYEMF6GEjL5ldcaSIfM1bBqBVuaDk4EYPE7pjXAXM2HOOnvdkxdcoqyjhpZYZNHWo8GKK1Q
 XlTbIA+IahUXCDnT19MPFy9rrhAVGS8y94g6RwB50AnQfqVLpE9aSLtz2CaauR2zR5Wvu5QLgJI
 ecxqAlPHlX+SEBIMuVlMTNFu2ezJ/y3KdcUm4ZeK+f89S+7bQ2N3Tl7ggEPco3W+gVYM/6PjK6z
 TWWpZZ+bVRvc2KSC9eYQYmCEdCVXWKrm8aAKpjfV+chq2O085jAQPpMGiz6iAK/S+Kq8KNmXVPl
 XPwFhHf1gttdDvNFJ6OLkL6vBKMf777lTTj9aelclF7xSldQKmukHXWXLoWwnot9BnAZLAnq/p4
 JJfOoYR43aael56tiQhCyA3L53emTXfbLnDb0bAsEV6VR3CD3e/lK/2NmChtdRGngLq1FDplme6
 +anfnc8WZtuFXYQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On AM65x the OLDI TX is modeled as a part of the DSS, not as a separate
bridge as the newer SoCs do, and is fed by the first video port. To
handle the AM65x OLDI, we check for it in multiple places using the
feat's vp_bus_type.

However, vp_bus_type is problematic concept and should be removed, so
this commit adds a helper function to check for the AM65x OLDI by
looking at the DSS subrevision and videoport number.

No functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
 drivers/gpu/drm/tidss/tidss_dispc.h | 7 +++++++
 drivers/gpu/drm/tidss/tidss_kms.c   | 2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index e516f493d6d9..efdabf046d64 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1034,7 +1034,7 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 		return -EINVAL;
 	}
 
-	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI_AM65X &&
+	if (!dispc_vp_is_am65x_oldi(dispc->feat, hw_videoport) &&
 	    fmt->is_oldi_fmt) {
 		drm_dbg(dev, "%s: %s is not OLDI-port\n",
 			__func__, dispc->feat->vp_name[hw_videoport]);
@@ -1143,7 +1143,7 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 	if (WARN_ON(!fmt))
 		return;
 
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
+	if (dispc_vp_is_am65x_oldi(dispc->feat, hw_videoport)) {
 		dispc_am65x_oldi_tx_power(dispc, true);
 
 		dispc_enable_am65x_oldi(dispc, hw_videoport, fmt);
@@ -1186,7 +1186,7 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 	align = true;
 
 	/* always use DE_HIGH for OLDI */
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X)
+	if (dispc_vp_is_am65x_oldi(dispc->feat, hw_videoport))
 		ieo = false;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
@@ -1229,7 +1229,7 @@ void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 		VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
 			       DISPC_VP_CONTROL_DPIENABLE_MASK);
 
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
+	if (dispc_vp_is_am65x_oldi(dispc->feat, hw_videoport)) {
 		dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 0);
 
 		dispc_am65x_oldi_tx_power(dispc, false);
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index df3daccf3f31..3dff391d3fec 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -96,6 +96,13 @@ struct dispc_features {
 	bool has_vp_control_dpienable;
 };
 
+/* On AM65x the OLDI TX is a part of the DSS, on the first video port */
+static inline bool dispc_vp_is_am65x_oldi(const struct dispc_features *feat,
+					  u32 hw_videoport)
+{
+	return feat->subrev == DISPC_AM65X && hw_videoport == 0;
+}
+
 extern const struct dispc_features dispc_k2g_feats;
 extern const struct dispc_features dispc_am625_feats;
 extern const struct dispc_features dispc_am62a7_feats;
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index eefe2221bdde..e55e7532e2f7 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -175,7 +175,7 @@ static bool tidss_is_dpi_output(struct tidss_device *tidss, u32 hw_videoport,
 	 * for the OLDI TX on AM65x, we cannot detect this from the DT data, and
 	 * have to special-case it here.
 	 */
-	if (tidss->feat->subrev == DISPC_AM65X && hw_videoport == 0)
+	if (dispc_vp_is_am65x_oldi(tidss->feat, hw_videoport))
 		return false;
 
 	if (!bridge)

-- 
2.43.0

