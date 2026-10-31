Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483826;
	b=IbasXKhsrSLyB0HlFiTOUWqqxyRHl7mgzF2KdVGPv5Iiau8IQJMsWcyK1SPn82/yyldn
	 CsAT7tDznlmUx/0wXI0PDJJczRz/w/6mG3w2hWeUj13c+6SmT4rW2IPn1CjEKamJnz9Ly
	 cDvbsFIcz9P1SfMDaJLDE+V15mwxJ3gHJMf8dYEqGInRbsk7ChbWpkAHXe1Jy/vcIcv4b
	 +L4zb/4jG7nuT45uhp00AR/Ptj77nSodXv0aoaXV1rXArwRrOz88CSEWPEFKPhZeI8Mym
	 ISAsa5K1JrmHk2x5X/YwrL7XvWCJ/MvjUcREOKbQDKx1jtnuoTuRn4/8dVaNsrE7D3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483826;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=+mdX8qPo+Ygv049Nh0fcFgBYwmXuC2JUmslOg97T4Og=;
	b=B3QKS6F0N1sAsdQyUlPUnBHT2BDGaOrlxphV4g0HeocM/0gK6AbPeWLSFJnqGfc8lYis
	 5gD2+whFAzSd5A1MaS3qR4ktvigak38OjCkNt6dbQ3SRYg8H+Iq3Ly/LiSMRsyGxiAlE8
	 1mkjEUygVPvH3VyZb7gjg/Sr03oED/dwqJd5b1Cg8j08b0CTw838HFNjXB1/Lzs3SV40p
	 wXq/xETqJSGCPBfYOjBsmKhtmJlwWBZuc3CO4tLVTYhmweGhiK2b3IFJX6t8U4/Nf7/90
	 MUh4byQWavveVzV3hwAn7oCdSMP5STXmlyLsIj71x3OHdSJ1eGHOVkiCWIFRikRoYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=XRrzFZa0;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB4606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCB4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=XRrzFZa0
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jHBdW29lgzMljg;
	Sat, 31 Oct 2026 22:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793483823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mdX8qPo+Ygv049Nh0fcFgBYwmXuC2JUmslOg97T4Og=;
	b=XRrzFZa059tp/B16hCtEo3jg0U3XB91ko3VFg9unhc9rx9ogd9xmLKEwJYcml0HoUkZTOu
	ZmR9K2+Ldb3oHyPDJcj6SKMgtbQJqL2t/c9iNjZt79VDeFYhPCFxrdIuY55MPIAYNGBR7Q
	H6f2FeONx0Ibi7yD5f8CeMADzNP/UZZnDVFBOcJOqAFnuu/7yPdbvdbrv54qA/M9J2Kl/v
	sJliRa1TcH5jc9n6oToeOBhLxWwDz8sIP7HL0PySlFNaL8MjF9VIdAFJOIr0sD7S74CNlI
	TkG7QPHjjNim13wBamXt9yio2wxnviDZOeoXq2VoniGYD5j/pKubug2VAg/Udw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/client: Clear cmdline modes before the 1024x768 clone pass
Date: Sat, 31 Oct 2026 21:56:59 +0000
Message-ID: <20261031215700.1077873-2-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031215700.1077873-1-hugo@hsal.es>
References: <20261031215700.1077873-1-hugo@hsal.es>
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
X-Rspamd-Queue-Id: 4jHBdW29lgzMljg

drm_client_target_cloned() first tries to clone with each connector's
cmdline mode. That pass fills modes[] as it goes and stops at the first
enabled connector without a cmdline mode, or ends with modes that don't
match. Either way the earlier slots keep their cmdline modes

The 1024x768 pass that follows only writes a slot when the connector has
a matching mode, and relies on an empty slot to spot a connector it
can't clone. A connector with a mode from video= and no 1024x768 mode
keeps its cmdline mode instead, so the function returns true with modes
that differ. drm_client_target_preferred() then never runs, and on a
single-CRTC device drm_client_pick_crtcs() leaves one of the connectors
without a CRTC

Free the modes from the cmdline pass before looking for 1024x768

Fixes: 1d42bbc8f7f9 ("drm/fbdev: fix cloning on fbcon")
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Sashiko flagged this while reviewing my fbdev probe series [1]. The bug
predates that series, so I'm sending the fix on its own. I haven't hit
it on hardware. The KUnit test in the next patch fails without this fix
and passes with it

DRM KUnit on UML passes 672/672, also with KASAN and with kmemleak.
kmemleak reports six objects leaked by drm_bridge tests, which it also
reports on the base without this series

[1] https://lore.kernel.org/all/20261024165355.2782145-1-hugo@hsal.es/
---
 drivers/gpu/drm/drm_client_modeset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0080a8e9556a5..5e45beea66438 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -343,6 +343,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 		return true;
 	}
 
+	modes_destroy(dev, modes, connector_count);
+
 	/* try and find a 1024x768 mode on each connector */
 	can_clone = true;
 	dmt_mode = drm_mode_find_dmt(dev, 1024, 768, 60, false);
-- 
2.56.0

