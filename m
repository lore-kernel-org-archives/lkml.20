Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705767;
	b=J7/A7Tsug90kMsTMUWN8NegBJ0QephoXvJflmB49X3hOjqG1RDwb6R7gFeEMzvv/csZs
	 ARGcHAUbe0bmOrLRbpAGcKjPg9K06BgjuRb0rVX+hyEJLrNH0OchcQ+QUJaPnm+0ONdOw
	 yeMwrQcSIkVY6Md/KhnKfARRb3NAIoGXu4+cCjeDy4z1SH/cZH7CAnAkuXI3+M4t9moTU
	 csY3jdEqDsOdfmJL++OGgsHCATOAVndioBxGpfrLtcbVDNPqz9gPZDPTq3O0o9yyWu5pW
	 XWc3NGgVroGAwApRlaBA/RJC7r/aCPcnuGc+d5ReDuQQht75wAcvZ4B16pKhthow/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705767;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DSwTPqDgbORtmER3+L2+uWMiOMM8wJSshAv4D29Azbg=;
	b=L4SpzpsqFFQWWKHhU155ATLCIP+Wf3KJa/Bh1YGOJh9QLXkfFq5iZocoUPC41Vsc5Rs6
	 NQFewS+lF6JX23VE/kTC+qrdTxdAaigAVEw4wE+TVG6lJDBsGzprmV8pUlzvhdF+oPrOQ
	 aKZZDpFTtNzlpIFtnQVv7vprmjN+Q8gl179qrj06gQY1cO1XrRyfr8Yu/QLFwgqjNJVej
	 T/RBHXquUC/fWFkQKyCNt4ftaL4X3ZAdyKEKAqv8n2+p9rHAXSr3GBXT63y8f4GOWndxg
	 MrNsp6QiAmKdJLacgvxVtoLY+QTyuFqtJ80QgwJgUqVF6fRiufSd2rdzwU+O4/2CifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hq2WYN3I;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1B606D80D;
	Tue,  3 Nov 2026 11:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A1B606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hq2WYN3I
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FC052022;
	Tue,  3 Nov 2026 12:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705623;
	bh=nQxWPvOnHOEf49bvRxeDEbYKlPoV+LdS5+rxhamt3Vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hq2WYN3IlV1aOeXHqCGjc5xuEDebbB6P2sOMoGZEO5dcZjxl5yA0orOzsTFPy3Y2D
	 TzwEHdQNdKCPrcMaCUuLoBgyHekP0nVVGySPeHxTXIFi2sZDPurGoYalH2AboyepY4
	 tUNcM9e9Ht2eoPYiVwQCUdWvSM/ad4vOHImEfjcU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:23 +0200
Subject: [PATCH v5 03/15] drm/tidss: Stop using vp_bus_type for directly
 connected panels
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
Message-Id: <20261103-beagley-ai-display-v5-3-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nQxWPvOnHOEf49bvRxeDEbYKlPoV+LdS5+rxhamt3Vw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccWHLqIYfEiZDqGG6mTCF/KsBI+OSJKt6gMV
 /G5te10M/qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFgAKCRD6PaqMvJYe
 9e5bD/9XC/UZFjpKf/MHmv15HgqyJCacl73oT9IVfHA1wZkZEex/YcsTz7OIQS8xqjNR8JvYeBI
 G5ZSDN3pc5xph+Yb938uFxMNIdPylMJAKXvd3qXzsouSBwIa2J1t22Yvu3QAP5wxS/N0Esi07SK
 LQiUw9EOiGnAhSb9GOy9pj13jC7sBZtKqTjlr+j4/iBcEuTP+B+U54JzaPKqhOvHIrAAEGZdalZ
 +ZQmRPWpea8ZD3XuPs8xEwY/QXmetUzPQLNi8Fhq3btG7DQ+VGA0Z1MIvK9z3ftLEjbYzQV2pW3
 qLwtEiv15+3RTjT33cgSYTBz84J1cHUHVTdu+rAYbLLDEf1rcPrfCjrRoQ/eYWTd4nSPWAv9RFJ
 Gy1iXjYRqwt+bMWn449fNSkktzUmH5EqyLmcHSB7A0+CC9Yq9mj29unDkNheYVmHNRzxNsvxldV
 40zrHbvHfPhtnrIuVknX1BEMEyGvdu7Pf2CQCkDSUupXzAJ/sWhpm75vinu9xKCsat5v+QME4X+
 KI5g4/YNYPs7/n+AtKcyHVUvQLA+yU3Xqh8F7frRQ3PrrssHriKHAQndgModUxGZyhGyUBuWB4o
 Q/4CgxRpCRd/vCyCI/sVRWy/nlTyEUynrvt2lxo07LaBHaLUk0z9nsuKdzDVAsoBb8GXNQKCYT7
 /mw2heS4w4UhPxQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When a panel is connected directly to a video port,
tidss_dispc_modeset_init() sets the encoder and connector types using
the 'vp_bus_type' feat. DISPC_VP_DPI selects DPI and DISPC_VP_OLDI_AM65X
selects LVDS. Any other type triggers a WARN and fails the probe.

vp_bus_type is problematic and is going to be removed. Change
tidss_dispc_modeset_init() to use dispc_vp_is_am65x_oldi() for detecting
the OLDI case, and default to DPI.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index e55e7532e2f7..8b9c5fa96e47 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -232,19 +232,12 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
-			switch (feat->vp_bus_type[i]) {
-			case DISPC_VP_OLDI_AM65X:
+			if (dispc_vp_is_am65x_oldi(feat, i)) {
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
-				break;
-			case DISPC_VP_DPI:
+			} else {
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
-				break;
-			default:
-				WARN_ON(1);
-				ret = -EINVAL;
-				goto put_panel;
 			}
 
 			if (panel->connector_type != conn_type) {

-- 
2.43.0

