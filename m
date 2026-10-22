Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669443;
	b=ogJAKdzuI2L7uqjhxdfGa0g7ahUjEI1IziAgVfG8zyFZLUxgAd37SQFjFaUMplTASxFN
	 D81e5xym2/ei5pAlSw4T8EQxsiZVM057MHyIudfbUgpSVsGvh56rZ5Oe86TLCc//KbE04
	 8W14aExlT7Mr+tSvxaUFP85IQL3r4yxCuVpkVOLUpvmR507znaTTRzK8gPIa1eEeplt6Y
	 UuUogUinVUacP7Oa7JtkzqU9iTVrC2fVQhQcvFUTEtbM4AYXpspFIgXOFb4wINk5ul6YP
	 JDZM9++EZK2atf7rmmTfvlNWWnpGJvmG7/Zj4JM2FQUN08jwj6v4UL7EUq57mUvL9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669443;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=GvtSA2Shz25CrsYn4ZnOQ56BgUS6CKhMK1jzzc7BlSc=;
	b=lelL2jC7Pw4vuHyWOHV+t6S6lnZZz33UjhPgamfqRDaqE7RNfxpw5/832/X5UHbNtPEi
	 SHU7TorANRTZ144fpMfm9GJTghISGyl09e25spX4O8TEt4HGeyqo7hTktTCNC/5oG1lSj
	 xzoHLEUOkYeUaXHDX6Y2PgeGrC9ArzFn6qs4jO9ufqU9v4KPPlMnrBhOsomzfwLqmnoI/
	 MNY+Q/l5vs3hQrbMxMOyov6vVvdltQCP8eFVChheI9/NEDgVtHG8R+qkDJ/CL56CVZjKD
	 zutnMO9IIedJ/tkRnITvPev2mvWvlzXwhbC0+dGPNdNrbX5t7iCivsMiJCwNadqvejQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=iqBI3hGF;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B158606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B158606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=iqBI3hGF
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j9PSG1LQ6zMldX;
	Thu, 22 Oct 2026 13:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792669438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GvtSA2Shz25CrsYn4ZnOQ56BgUS6CKhMK1jzzc7BlSc=;
	b=iqBI3hGFppLyJK0ygEG3k+8qzzDCPGXFNg3aGJzdw3V7spcNMS/Y4PW4fyoTtUNzRihgzu
	rfEi9Y2VwzOkru+7tkN3JSIwkLimW1oq08EEeNs1RF8THkoQ4Pe0G1h1OdRN8dc+Z5ODS6
	4OL8gm/G60Q22WcKwWMTa5w/37bLlTScU/l8xdEkDaX4i7y8m61ZM5AD85ZRoRbfPoS69O
	Vot3rTrh8LLuZN4FtJTEuyMfoV1OmygSSwalIe5flpToektLnJyVYS/7HJZJbJtKreCFZg
	25/Qex8dJoKmVVXXrJ9sPcgqY2vd37ZI/CVEOIWyFRzRfU6hIzjO5xTM4NMlqA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hugo Sales <hugo@hsal.es>
Subject: [PATCH] drm/client: Don't print a NULL firmware config mode
Date: Thu, 22 Oct 2026 12:43:56 +0100
Message-ID: <20261022114356.669988-1-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4j9PSG1LQ6zMldX

When some tiles of a tiled display are missing,
drm_client_firmware_config() replaces the connector's mode with
drm_connector_fallback_non_tiled_mode(). That returns NULL when
connector->modes has no mode other than the tile size, but the debug
message after it still reads modes[i]->name. Accessing a member through
a NULL pointer is undefined behaviour. Today printk happens to get an
address below PAGE_SIZE and prints "(efault)"

Print which step found no mode instead, "no non tiled mode found" in
this case, from the mode_type the function already tracks. A connector
whose mode is NULL is skipped by drm_client_modeset_probe(), so it is
left off, as before

Sashiko found this while reviewing a series that makes the fallback
return NULL more often, by also skipping modes larger than the client

Fixes: cf1d0180f571 ("drm/fbdev: Fallback to non tiled mode if all tiles not present")
Link: https://lore.kernel.org/all/sashiko-outbox-173425@kernel.org/
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Sashiko found this while reviewing my fbdev probe series:
https://lore.kernel.org/all/20261015212545.1989962-1-hugo@hsal.es/
That series makes the fallback return NULL more often

I ran checkpatch and built drm_client_modeset.o with W=1

 drivers/gpu/drm/drm_client_modeset.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0080a8e9556a..a8cbe4c0e166 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -754,10 +754,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		}
 		crtcs[i] = crtc;
 
-		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
-			    connector->base.id, connector->name,
-			    crtc->base.id, crtc->name,
-			    mode_type, modes[i]->name);
+		if (modes[i])
+			drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
+				    connector->base.id, connector->name,
+				    crtc->base.id, crtc->name,
+				    mode_type, modes[i]->name);
+		else
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s] no %s mode found\n",
+				    connector->base.id, connector->name,
+				    crtc->base.id, crtc->name, mode_type);
 
 		fallback = false;
 		conn_configured |= BIT(i);

base-commit: cf5d8e390e2ac2cfa24a50645efdbb9f0eebe65f
-- 
2.56.0

