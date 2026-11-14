Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794668831;
	b=5spp866e0ri/nJJAgyOtwHt+oh0jZid3YPI3mLxjyMMTOxiQrpB+LvQ0yyBey4cgsb39
	 l2L22yYfRkISqIVZuFAH3rVJLkk1GM/cNxHBFd4yCOLz/O+Fi8J4xei6wENtwqCcU3Ct0
	 3C2mpCD5cR+TCEPFSiU8nGOW0m0UWya2qpzTx9BZUex+hgJPRq1+4X7+eBzJ2w5aQCnev
	 ySh+ukUz3WThxQRnHk5Wvh+PtJNQlYi6BnlxCS7XWwO4ArMwUQTU9y+ZfQCPxGuWgBm+x
	 guR9gABY633ah13wChKP92PO6O/F1TYFlkjCmF6bASQOyij52+H4YqTy5Ca57jo2XfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668831;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T70LPbqwjTquBXMKAl/WRAP8aX7L0BcLFYclaMsQMj4=;
	b=drF/DWJHQG80elTHFgYT6NAoLpCrwlJ0mT2YAzGWI8k0ImpxfL5YiI6EWVBiLtTU6o6H
	 8qNu2A33E/SgKUF3waXNlxQw/z0wsCgfm05bDeu+f5Qf+eIBrnV9OUd6ttIstklaVAfz7
	 7L4B3oOE4fc+H9csDjPVQFkVy3CIidfCApLxn//NLyfpAmB1Yi0rkC1kezjkN8pttf0yt
	 0YSU6lq/v7HAJ4yomi0E6YLFD0jgLoKkC92oZItTYOToFtAk8HTyc1dM3RRKZH+bRH2Jj
	 jHS6OLnjF0kUfCamiYhNwSmkAuiO1vn1HKvuD51pjPVDsj4kYip8a7uKEre8uDB3a/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9pPhS0l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79A606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9pPhS0l
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794668831;
	b=qg58YAgJLiaOey5c23T/cBWL+XHgTuu6m6SJwz6J/dqcXJ43tfR7si8cUtQ83+xOmzFf
	 oN5wwfpb6XR8nEz/REU/jtUphu9Pohfn1Q4KewxoqxR4XVqpDfH0lg9r5KfhW/xGUizYr
	 DCru5/4+j27J9fztQr7CkNEA5BNehiv1D3cCUIS7FrPmYyuiABFpygprDQmYikJO5mhOf
	 BzEL3D5KeqPU8mAClcjNqaoQzqLn6FEI+12nNPl+UND5M551hj5QfJ4sxFED+WDPtIfHl
	 6rwfqGoqVEE3OuZzjp6Owml1uK+LOXCdWDImBIfo7pLWnqIxxRpfMOB802haTJ01PAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794668831;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T70LPbqwjTquBXMKAl/WRAP8aX7L0BcLFYclaMsQMj4=;
	b=C+cvxf9RFEZw6xeWc+cWp+yeKZGdtP0/s50I+CEKbTxj+EE616RcREu5kpEeB+wEysLR
	 eWFjeStb+xCvFYRMwvV6x0FuapKJRu3apxBDqhWzvnKB54080D5QrWUbKHVe94dHrx/oH
	 BSp9UIOHluDEPTsh4OUVhSfOnmLoRFQeZGmVw1qqiCCRvZv2GO8ei5r5UxeD4Zz30hdUI
	 9ZzPNMZHrWRwEDu5HJEgd8BwrXqF94o0wC14CeMD8ae7Eeld8Pnwi1ydM/67QvEVG6DMZ
	 4a7b0RJQg93Y5VOn2Hk31fNbEY6CLsNJ9CiYNUCYfcrNPCsZGbC7wmvPH5lDvNL1f4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B7021F000C7;
	Sat, 14 Nov 2026 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668831;
	bh=T70LPbqwjTquBXMKAl/WRAP8aX7L0BcLFYclaMsQMj4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=I9pPhS0l3XzoPyD90EKB9deLshbJ4wEBS+7WuPuhXihNznM8UF4AZaiEeVisHJnA3
	 CraHFY+areC54mQ2fIregymgC/gyg+Qun/FwrISGVTPp3hnygG7IJdsXpgDUe37dAR
	 I9UuXb4z/N2TJwAWGubQdfiW9glp/ju6YOUnRfwtBT7rL3Lj1XIJHV8mx9o+Ewi6SO
	 h9SgBHJ05rVkTlBmr70GglqxuUrKomm7+kFG/EfifqSF4Ln7fpM9Te3sWfZ7in1ZxD
	 PTTJDiYZVGpKMgc+Hm86Jrga+565Mz3i+y1F+qxQQTukG9IWJ3u15zK21ZYLUaK2DK
	 xum4pAMHbCanA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D07DB49DDA;
	Sat, 14 Nov 2026 15:07:09 +0000 (UTC)
From: Alexis Calin via B4 Relay <devnull+alexiscalin.protonmail.com@kernel.org>
Date: Sat, 14 Nov 2026 16:06:32 +0100
Subject: [PATCH] drm/i915/backlight: Keep ACPI brightness requests while
 the display is off
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
Message-Id: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NSwqEMBAFryK9tsH2B85VBhcxdvShaEiGQRHvb
 nBZUFRdFDVAI32yi4L+EbFvCSTPyM5mm5QxJqayKFsRqRmdNGysBw/GLium+ccjol/Nybtz3Fq
 pNIlD0TlKFR/U4XgP3/6+H987PfFxAAAA
X-Change-ID: 20261114-i915-acpi-backlight-display-off-6c13e114b09f
To: intel-gfx@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jesse Barnes <jbarnes@virtuousgeek.org>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Alexis Calin <alexiscalin@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794668829; l=3928;
 i=alexiscalin@protonmail.com; s=20261114; h=from:subject:message-id;
 bh=yfV5siqoHW/ZsYrHAiTnfqWhV+mA/En7svlIUOMAlGQ=;
 b=R1pN8mDR1lCIq9lN2N09YjigxDNNUkgL6X2/m8UmvRxMuUpITR3BCsjacT8gMmKWXYeQ58TYV
 1gUs380NXXdD9iVWIbXJql5Qj7Q4QQsDbVEW87+PetIbKG0a/+6M/eN
X-Developer-Key: i=alexiscalin@protonmail.com; a=ed25519;
 pk=oNYBG1X8+3bGmJMn0tnt+BbJC1vI7dgqomx4pGPM+4c=
X-Endpoint-Received: by B4 Relay for alexiscalin@protonmail.com/20261114
 with auth_id=1528
X-Original-From: Alexis Calin <alexiscalin@protonmail.com>
Reply-To: alexiscalin@protonmail.com
Content-Transfer-Encoding: 7bit

From: Alexis Calin <alexiscalin@protonmail.com>

intel_backlight_set_acpi() returns early when the connector has no
crtc. This is meant for requests that the BIOS sends during driver init,
but the connector also has no crtc while the display is turned off, e.g.
when the desktop blanks the screen. A brightness request received then
is dropped, while asle_set_backlight() still reports it as done in CBLV.
When the display is turned on again, the backlight is enabled with the
old level.

With the ACPI video backlight interface, this happens on the GNOME idle
path: the screen is dimmed, then blanked, and on wake-up GNOME restores
the previous level while the display is still off. The panel then comes
back at the dimmed level, while the backlight class device and CBLV
report the restored one.

The crtc is only needed to program the hardware, as vlv_set_backlight()
gets the pipe from it. Store the new level in all cases, like
intel_panel_set_backlight() does for the native backlight interface, and
only program it when the backlight is enabled and there is a crtc. The
next backlight enable then uses the new level.

Fixes: 752aa88a1e78 ("drm/i915: make backlight functions take a connector")
Assisted-by: LLM
Signed-off-by: Alexis Calin <alexiscalin@protonmail.com>
---
Tested on a ThinkPad T480s (Kaby Lake-R) with coreboot firmware, which
makes Linux use the ACPI video backlight. With the display turned off
through Mutter's PowerSaveMode, a level written to acpi_video0 is
reported in CBLV, but without this patch the panel comes back at the
previous level (40 instead of 75 on 6.12.117). With this patch on
drm-tip, it comes back at the new level (75). The GNOME idle path was
also tested: after the idle dim (31) and blank, wake-up now restores the
level (74) instead of staying at 31. Brightness changes with the display
on and S3 suspend/resume behave as before. Not tested on VLV/CHV, where
programming the level needs the crtc.

checkpatch.pl in drm-tip reports the Assisted-by tag, as it predates
commit 816d9992d9ed ("coding-assistants: simplify attribution").
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index b128896cb1c2..3f2c75b249ed 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -310,13 +310,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
 	struct intel_panel *panel = &connector->panel;
 	u32 hw_level;
 
-	/*
-	 * Lack of crtc may occur during driver init because
-	 * connection_mutex isn't held across the entire backlight
-	 * setup + modeset readout, and the BIOS can issue the
-	 * requests at any time.
-	 */
-	if (!panel->backlight.present || !conn_state->crtc)
+	if (!panel->backlight.present)
 		return;
 
 	mutex_lock(&display->backlight.lock);
@@ -332,7 +326,15 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
 					 panel->backlight.level,
 					 panel->backlight.device->props.max_brightness);
 
-	if (panel->backlight.enabled)
+	/*
+	 * Lack of crtc may occur during driver init because
+	 * connection_mutex isn't held across the entire backlight
+	 * setup + modeset readout, and the BIOS can issue the
+	 * requests at any time. There is no crtc either while the
+	 * display is off. Keep the new level for the next backlight
+	 * enable, but only program it with a crtc.
+	 */
+	if (panel->backlight.enabled && conn_state->crtc)
 		intel_panel_actually_set_backlight(conn_state, hw_level);
 
 	mutex_unlock(&display->backlight.lock);

---
base-commit: 419bb0e4cadd214a0847010c02ade95e5fc511f7
change-id: 20261114-i915-acpi-backlight-display-off-6c13e114b09f

Best regards,
-- 
Alexis Calin <alexiscalin@protonmail.com>


