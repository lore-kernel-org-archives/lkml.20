Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480301;
	b=FTcR5OI4x9YlGAggOGiJXao3G7Yh3bPrGELr3I2kLKulYE8WTUTlKX+4v/0sUaNJGNG0
	 uUOzUecnjo4GyDnAYH18N1Tcps0ZWfr/JzUgzew304IrJ1SWxLi7y0/TmQ1mAwZJ269w6
	 onTolQniwt4lU2m0ono7rsXl7WLSQYvO8PfXFqsPnCp0BIry8vGcFnPBQkOB0/SKkEA0u
	 jhqX4O2N/Xg9dAsyuSUbz/GCNWatVugZHblrjn1FWFlqfU+hXJD9A35f4dE1xhbumB43S
	 Ob4phL3F34bsLtuAjn1vj2BrPB+EGzkjkgmHhjpJde9xXTUvZpuBvLHSEV/4uiLMOIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480301;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gNJYfmM2kuv0Gwf5YN1v+SnattZ+NzIUMGWD4NeUeS4=;
	b=v/zMdge6zQnjGeKH6gRA2yPNPqwpZSAcarjXxWPJVBiQO73kzfDw7yd+o2xD0ROO5cRB
	 FkzevVSEhgRrAcAEhGrlawLXpqW350aWVRZQT6KFECKGFX1wtku9QxNQ0crZVLFD+Vinl
	 pM72VzxPvWEidyuNeWGpR2wr0EyD24J495wrA3iMqJr74zHSI0w2zFxdtClFuxq/DP4JA
	 2kV+EoD3i3AAYOntmqndukPWU5pBcdwAVPNGPs/sAZ6B7OBKzdMkboz1hBV6PIXY/ZjVO
	 caMHpSyNtiDWzTWT5OafJzeT27UlzolSdwRny1np5iJwg0RVzJ+SSfipFmDqTzjuO+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsdi5c1G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsdi5c1G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794480300;
	b=cn+qkfFM1AeU5qXFeelw9xMEXIHylQLb92GetQsuPt3CHCnHPVVIJ3zZ4MXfmIRRJmZi
	 qDpYLAOhYs7RzyEVHGupB2oZwHxpodrOhng5g7j1yrHrgobdzfX4fjsmAQmACImI/mBMO
	 IrDJO0zbXviYAvu4cv70DllXG2526Kj7ZCqZgBD+6eMCoMxs3KVUYFk9vRCw0orqYWhfa
	 kea25O5EjL8/FHogL0NiOhbVp/9HwNmY2UJkAaul2eOh8HXScvAIW6ub8LiNkMP/muQW+
	 MnxJD9wF/FJ+IwEykvcOx6ET7XtS0z6i4arwuUJ+Dkvmumd2PXW1/JklRMP6muiiasg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794480300;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gNJYfmM2kuv0Gwf5YN1v+SnattZ+NzIUMGWD4NeUeS4=;
	b=xVcftjoSGQlmutdF4BTqTiWbSgZDsFIfxVoNwYTLN/qBrP2UHM7gh/l4z7LhhSS17qqn
	 5ZzRgJ3EkHY29zkGAw8bHMn3BbXFNXZpD0XVcz8wNXlDTdwG4IyXg81t6WU8R/Ni0uE7x
	 h2PdoYVOn6P8gU6Z6JXBCILUiSdNEoSRuFiDQ2DxpbuOz4a/olQIUoIIVsIChVAKbKny2
	 1hsnhUsLXnKXre1X3tGfW8S0uWmDDozur2IiSm7s/GWNDipobepSA7mfjFfIxWjtRJ86e
	 JYbl11GWnlnRokMWa9p38CG7GZ7uRRPuQkJ7J6uKwEaCDotoiI+QS9LPvHGBCqRcvTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CF221F00A05;
	Thu, 12 Nov 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480300;
	bh=gNJYfmM2kuv0Gwf5YN1v+SnattZ+NzIUMGWD4NeUeS4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jsdi5c1GBH8k2pDgBAWE7SfbBQ71ofyY31dcvukqzXUsWpdb0YmX8YkRydigew1Bp
	 CjizL+FR6M/XTqMASJ+ErD1AYeoVnEl09v/0BUawv4rn3+3Rjkl53lxG61m9wP3L9p
	 07xsVp5Ybar4ZBntzGCf0YJURRCIQNysBAMV0s1n7+2/6dg1Vbllpk+V4jK9y54mOY
	 fwBVWzxMn8Dn765hD9bsKoQxMH8ZOAHXfhTkIq/zlCkH6laLSH3vz86FbawLTf/rja
	 1S/6BLtW+NKqXR87wXi7VqfmGyUt0N/lnm13J5+ePj9EAhXHt2/r41II+xUiaM/faf
	 w7A5XS/zFLTiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 80D9449470;
	Thu, 12 Nov 2026 10:44:59 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 10:44:59 +0000
Subject: [PATCH] drm/debugfs: Accept "reset" with a trailing newline in
 edid_override
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
Message-Id: <20261112-drm-debugfs-edid-reset-v1-1-4cd19d83cd22@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA1kBq3gVcRFO/lbI1glaUUov
 bujLr/FeysF3BB0alZyvCzsMVWkXUPl2k0j2LSasuQ2pSSsfmdFv4xDMNSUHYGZ5SD7Lktpj5q
 oxk/HYO/f+Hz5O5b+hjJ/b7RtHyvh3QV6AAAA
X-Change-ID: 20261110-drm-debugfs-edid-reset-0504a20c67d1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794480299; l=2159;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=q9OBm8AG1wALzNkA2iDL4Ckkgs47X7jT9hCbulBfsn4=;
 b=keagsGyaqUeHySKh+LwDiP92tHC1f78fQ47av3Plpx/nKzMNDn0IEVDiy9T1pC99dh+CH2lM5
 eHHLirfi9NSBqjuKaVQy9r9IyGuD68thYQjHso7mtgqDOqh70X64/yr
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Writing "reset" to a connector's edid_override debugfs file removes the
override, but only when exactly those five bytes are written. The
obvious

  echo reset > /sys/kernel/debug/dri/0/HDMI-A-1/edid_override

writes "reset\n", which is handed to drm_edid_override_set() as an EDID
and rejected with -EINVAL, leaving the override in place. A test
harness that cleared its override this way kept running on the
overridden EDID until the next reboot.

Accept a single trailing newline as well. An EDID is at least 128
bytes, so a six-byte "reset\n" can't be a valid override.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found and tested on an Orange Pi 5 (RK3588S), with this change on a 7.3
based kernel: with the HDMI connector's own EDID written to
edid_override, "echo reset > edid_override" succeeds and edid_override
reads back empty, and "printf reset" (no newline) still succeeds. On
drm-misc-next the patch is build-tested only (arm64 and x86_64, W=1).

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit message, and I reviewed and tested it
as described above.
---
 drivers/gpu/drm/drm_debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index a72f9723d3a9..3c6290457fa3 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -569,7 +569,12 @@ static ssize_t edid_write(struct file *file, const char __user *ubuf,
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	if (len == 5 && !strncmp(buf, "reset", 5))
+	/*
+	 * An EDID is at least 128 bytes, so "reset" with the trailing newline
+	 * that "echo reset" adds can't be mistaken for one.
+	 */
+	if ((len == 5 || (len == 6 && buf[5] == '\n')) &&
+	    !strncmp(buf, "reset", 5))
 		ret = drm_edid_override_reset(connector);
 	else
 		ret = drm_edid_override_set(connector, buf, len);

---
base-commit: cb0a63f0c96e8ecb90199eeb99cc2a7fcfa703d4
change-id: 20261110-drm-debugfs-edid-reset-0504a20c67d1

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


