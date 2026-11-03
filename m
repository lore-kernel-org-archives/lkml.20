Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705767;
	b=a08gDNE6BQRObQcLVqL6W0pQo0iEvdQCrqJRG2/OqonlOxYO6U3SsPwSl0//i9epYBuT
	 5+p2xh4AQ1lzj+M0lTa/qjCok5no1s/1NFFcpahjyMKQDt2y4G/d7KuZOeIZB8R5I+deK
	 oOCEJSJ677V6FQKd+u89k5XKYyTEpxXaap93ilmLxxUdP0mRgpf2bVT4GBRLqbb2nH6UN
	 Rw5PrLmvC6onyw8P/tQ7pH7fOIr0Cv138AwYTvpi2F9eP9JCczOkAafOrlwSe3GWXyCfK
	 vSw55YH4nYbnOV02dRn0Vy/+98LaQ279rz02wXV7ZjUV1piHL7R7SMjzbGLfRWMiPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705767;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zU4kl0mX/GXG5BeCFMDFgVZ52hKPapwIf/DsKjgXa5Q=;
	b=rYOC3GXn8jzHn6Z2NV2igNS71VOIBRwsLdgpAOhy07bNPHj4+RJxN+7+CgaKNoCJ+KbD
	 V9nX8qhIDA0AZnIik0zb1SUEJTcHsNYNN8+CUg/OhgX/ueMkLWkIrhLK9nd+FHSIEOsUU
	 G3f5wM5oL0QDcOkIiD33h/jg1tq8YSIkFS7L1CGUQvO6tKwlIU8jiEYhl+EZvZjorqVdn
	 jgDq/zp+JPjvosiuTo3NJaeiZJxxnUBbOBF/ysW2SLeOg1RbDpZBk4XaECgBZxrsZk9y8
	 6QqHAl6tH4L33qCZnx7qTOd7kk4chWpJwqzXLuU6gfZV0CZDrLnd8pMnJEsGf/Soq7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mbRvEgyo;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0F606D807;
	Tue,  3 Nov 2026 11:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F0F606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mbRvEgyo
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 003CD1F37;
	Tue,  3 Nov 2026 12:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705621;
	bh=GYgjpXl2KPS6tl9HCXSe+l1hlCq+cTCfu96zrs1c7ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mbRvEgyowleKWitEVlzYy7aMCIScMSP6SSSsHWi2VHxW1y3rs3UhaUfGK4iDV9Vh2
	 fqNXzdQ2knplWsMDCNgjuwe1z7aMemSPFhkojswfVtqsiSqYH5F1jm//QrQ5SxY4WA
	 0t3HH3l6cAfrjt/Do1TcTBli3z7O5dkxZ/5QQURU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:22 +0200
Subject: [PATCH v5 02/15] drm/tidss: Add helper to identify the AM65x OLDI
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
Message-Id: <20261103-beagley-ai-display-v5-2-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GYgjpXl2KPS6tl9HCXSe+l1hlCq+cTCfu96zrs1c7ic=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccWjJkYtFf8AwfRAzUviDW60UcpVCNwa0ZjO
 +7GckPVGVSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFgAKCRD6PaqMvJYe
 9RJ5D/9akc83uWOXUeER0tEGahJD1BqQ1EGsqI4PkWVNJs8/8Tsb3em4jtgEm1SXfWKWQqaFvUq
 g6DQK04ijHDlUtlUJuPrzLsQVeMeJsS2z56Iv8WDxnzKv7CCAi5URagdUt0uJaD49gnC3YBP74m
 0flxQnEpyn+R4yZ6chiwEvGt4Ao8KYS1w+jrxgCtFvEM7pwgPbQw6niVddKHtfUI18N2L2WIkpn
 9ZyFBpg6YidyGFlr5GoblJUH4fjDRfxEUuCZCm8HCDq7vr1BIpdXPb73mr2Pjm/U9ghqpuxqr4J
 ZUqZAJb91kLvYrdGWOjdGIRPM0f+BcgOt7UHN1ZqwQrEBg1Ob3rwbI0nkKGjN/obfvwmCsLzpYL
 BhFgf3D3mJGS/PI8fobtF1swvRu+Hes0W2UTUZnpA0130oiHiYLytgGDn7wIRprK08hPHUqfj5e
 uZzAbndVhL7M1nt78k+vycBVMOmiRRJ1o7MPAfD7o09yuxrdu6O574satL7b1KpF3clLRHPjyNI
 m+4Bs+bnkJrKmAdCL5MNxf7qVCoA5m3rpRu/Z2nBfoxSfZQXmy1b7kguBxAxEJRinKw6S1MHEsS
 TRe3S6AEA7b1VSmbjPIFGFo8VMqE7JyJx8VriSZe6E3Iqd560x1Y8V7tHmaW1zkrz3bJNAGd23M
 qaTrFtJtvuj90PA==
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

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

