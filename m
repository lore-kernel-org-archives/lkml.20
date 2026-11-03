Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714578;
	b=l61F9emWk9Df0ZXjTi6b/8cU8LgLKsj3b/hqs4FR8QKBq0VQyCWbuRpRvi3DnSh/NZdD
	 qpw80cBYMahvaT/UnJ6PMoHyVDlqkB5QTX1knSp63EajlShJK/Aby2b7PHiUwhDbltyb5
	 LAR3RPoOrdyU4dRlhbLMWxcSYAZcarQAYOlV5i/3N1CRfSLxPPgo0nEOHrK68kP0sgzcj
	 FrlUFZqIXiPY7uyLYUdKLChmDsd+uFtgZyX4XpwW8Ce6cRrzBr2UtKxNDpcQza2JtsJQd
	 ux5zzNaTvzH+gVebDAgSoyrKsZTvtC4e+18v/DvoTpHe7SaY3yvnNZCsvdMSAO8vl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uu68lQxHEs/mkQVI9vO7Af9VdhM6SKqu6dRO3KGsMrE=;
	b=2DzOY7nGAIXrLl+RxpeNWf/RPz0dOy6qW4PigMftAhq5kOtdqae46IhRDGS6fz83nCSA
	 snIKfHgplxcihAHt8+IDYuZUTnuq3aj40N8JHqVFwWMp6KlBgLADPutkKgUzJ8FRPb+56
	 vn0CGEEfmH7AEuh69rIZGqGmyPpzF/mUQJaudqdXlXTjbE/mgD7KXc6hbozf8IvZlwXPW
	 tOuucBYUOLwp7XuDhKYGtfYYllc6BZhd/lEOyj60qcOqNKvILC9TXkO+lupIye4fvxaXx
	 H1YcQLvF7sW8YmYFH3eZJkciNW9xtHANahIfRgUPNxhGHYFrEPkXk5H5DwJSbdPkM9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPfE1rAh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1488606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1488606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lPfE1rAh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2078922f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714576; x=1794319376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu68lQxHEs/mkQVI9vO7Af9VdhM6SKqu6dRO3KGsMrE=;
        b=lPfE1rAhADnprxhkmcgestOH0tvsuzlKjQp5DJpWmyTlzDMCZFugFO98fx9NhoU4c0
         55l5KaOrYezy0SCln/tdno0wgR7AeNRSPKgVpn14RLfmaNNhaSN+zUnUZpkbfSYniNgr
         4q/9B6GTr/lS1wCeJJf2VSfU9w2Kz7ikAxelR8wc5ob5PV50MNq/cMlvVHQQIwGNhU1L
         y5B3R7IvzasDSAclNKx+jQXdWLiDC4XTtf2PB0lX2ocIsa1zBr0Kjmxs4/Hr5rHNg9E1
         g6Tgnz0bmskzCagpWirVVO8TPcKbQlnRu4RLM64NQTscitTpDNyrlIrp4OZfn4cU4z50
         vA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714576; x=1794319376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu68lQxHEs/mkQVI9vO7Af9VdhM6SKqu6dRO3KGsMrE=;
        b=YYA4gjo+xmrAe7ViYpyjKYw5MuhQ6ELEs8JTDk0ohbAuM3mfz7+6cYBPCEWr+0Ms9H
         tcgf8v1aLKacf4jmnqmluCVsF3RCdh1OrsdW2gyXwV0WcVk6EJw6W+yrgtVvX6QSwdSJ
         KNVCP+VuVyrZTYQtDz1Osin9KAZVlf9Be+nqMIGsd7jJJsIwebP6mCClDYoGNga6l3Vh
         MoNElBn8FBylqHy0JdH4LwWZm5sopeV+jvdGWld7+4B9r7v1gQegydf6sqto5q04P1Sz
         go7DJrTIqjmXssy3Eg/yB1tQHSONNgnIBfb5riE7soMdl5me3UEiogxLFWtse26nNjOp
         I/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwXhTuVhaOmFcTKaiN7yu9yUhh4Ej6LCSgLJzBbW1cCz1Fp1znW7RJZPyDTXLkwLEm2WWmQhdczYLwkjKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lzLa8YevzHOhUvUY02A7B7oExr3f5AjOuojaYv+4RGUKANurl
	6s09PAyMDSwSrJ77WxjcalSsvVS472a9bvTpjFC8jaD7Uohygc+15PO1
X-Gm-Gg: AYBFou0wlJjIml2H00XQ+m1ZB8jatp4fEX5fXCrWuWn1aHhiKNbi8VDClymlDt8MDoi
	my2S3HC0hHJWb0SYfHRU9qggMe+MysgsSYDZeGKoC6YMmXRoH7+QPSk2xuFYQRnUpuZwd02stb7
	4Sp2OCD/sZHrt50WbLUnYLUvYj5cXHHv6mXBIE/7Y12PNT9aLK38tnUTM3RCmvsUbPfukMlNWSF
	MjAWgaazbQmM1zpwbnu6FwTkJN2aWAvmFJCBt8mo43gzD1Z4DDhrtKUws98sMo3pGvVZTV46k3J
	uOFOD9hREpYormhDQ8vFMtJ9wO7IkFudrrPrr3z/KRN+snh4gUqXU7tdfLcI0lRSE4wbbOSWY55
	jZ+aEnE2nMR8zoQ6idv9esnFRMdNkdX2INd6kXeA1HGC4IUGxeVN0POywUi7pb5tchdP0nhSC7r
	kY3hnWmXzvccJmzEoyZWpvJYHuXYkt2wT8Qgd1x3i1HvK21nqUypW0nu0z9dOkZnoiG/MUEYYDs
	FloTYvDCEljVuqLFDaUkFSCKPzRahFIROX0aVJbIB0qYZOwxc6Yes5xZ89+2x2jA9DfjVXv+00n
	tApSetg0ZLRn8xDTGJLEJ3Rx7ItVmkQDsEHv1fDdXEzNVGqMfS/wxs/SA0R9lLwHvwN2rNmV7cD
	qac/BXQ==
X-Received: by 2002:a05:6000:2486:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e6e4f44f2mr30393094f8f.41.1793714574925;
        Tue, 03 Nov 2026 06:02:54 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([90.251.75.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm24467507f8f.41.2026.11.03.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:02:52 -0800 (PST)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH] drm/i915/backlight: Keep ACPI backlight requests while the panel is off
Date: Tue,  3 Nov 2026 14:02:35 +0000
Message-ID: <20261103140235.1032320-1-zakbrightonknight@gmail.com>
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

With the ACPI video backlight (acpi_video0), brightness changes reach
i915 as OpRegion ASLE requests: the firmware's _BCM method writes the
level to the mailbox and raises the ASLE interrupt.
intel_backlight_set_acpi() returns early when the connector has no
crtc, so a request made while the panel is off is dropped. The ACPI
video driver still reports the new level, but the panel comes back on
at the old one.

The connector has no crtc whenever userspace turns the screen off by
disabling the crtc and detaching the connector from it, which is what
mutter does for its power saving mode. GNOME's login screen makes this
easy to hit: it dims the screen when idle and turns it off a little
later, and on the next key press it restores the brightness while the
screen is still off. The screen comes back dim, and the next brightness
key press jumps from the level the backlight device reports.

On a ThinkPad T520 (Ivy Bridge, LVDS, coreboot), setting acpi_video0
to 10, turning the screen off through mutter, setting 14 and turning
the screen back on gives, with drm.debug=0x6:

  brightness 10, screen on:
    updating opregion backlight 73/255
    [CONNECTOR:92:LVDS-1] set backlight level = 444
  screen off:
    [CONNECTOR:92:LVDS-1] set backlight PWM = 0
  brightness 14, screen off:
    updating opregion backlight 170/255
  screen on:
    [CONNECTOR:92:LVDS-1] set backlight PWM = 444

after which acpi_video0 reads brightness 14 and actual_brightness 10.

The check goes back to commit 752aa88a1e78 ("drm/i915: make backlight
functions take a connector"). Commit 260d8f98ef9d ("drm/i915: Remove
most INVALID_PIPE checks from the backlight code") dropped it from the
native path, but kept it for BIOS requests, which can arrive during
driver init before the modeset readout, when there is no crtc yet. The
native path, intel_panel_set_backlight(), stores the level whatever the
connector state and leaves it to the next backlight enable.

Do the same for ACPI requests: always store the level, and skip only
the hardware update when there is no crtc, which still covers the
driver init case.

The problem was found and root-caused, and this patch was drafted, with
the help of an AI coding assistant (Claude, by Anthropic).

Fixes: 752aa88a1e78 ("drm/i915: make backlight functions take a connector")
Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
---
Tested on the T520 (i7-3840QM, Ivy Bridge, coreboot 24.08 with SeaBIOS)
with v7.4-rc1 plus this patch, built with PROVE_LOCKING, under GNOME 50
(mutter 50.6). intel_backlight_set_acpi() is the same in drm-intel-next
and drm-tip today, and the patch applies to both.

- The sequence above now ends with "set backlight PWM = 1035" when the
  screen comes back on, and acpi_video0 reads 14 for both brightness
  and actual_brightness. The same from 13 down to 6.
- Setting 12 while the screen is off, then suspending to RAM and
  resuming before turning the screen on: acpi_video re-sends 12 on
  resume ("Restoring backlight state"), and the screen comes back at 12.
- Suspend and resume with the screen on keeps the level, the level
  systemd restores at boot is applied, and there were no lockdep
  reports or warnings.

One case still comes back wrong, differently from before. On this
machine _BQC reports the PWM duty cycle, so reading actual_brightness
while the panel is off makes acpi_video cache its lowest level (2%),
and it re-sends that on resume. Without this patch, that request is
dropped and the panel comes back at the level from before the screen
went off; with it, the panel comes back at 2%. Mutter only reads
brightness, so I have only hit this from a test script.

Not tested: the driver init case the check was kept for. coreboot only
sends requests from _BCM, or from the brightness keys before the OS has
called _BCL, so I couldn't make it send one between the backlight
setup and the modeset readout. Not tested either on other platforms or
with other compositors.

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15987 reports
the same symptom on a MacBookPro11,1: the brightness is wrong after the
display sleeps, and acpi_backlight=native fixes it. It may be this bug,
but I can't test that machine.

 drivers/gpu/drm/i915/display/intel_backlight.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index b128896cb..2310a9258 100644
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
+	 * requests at any time. There's no crtc either while
+	 * userspace has the panel turned off. Keep the level
+	 * anyway, it's applied when the backlight is next enabled.
+	 */
+	if (panel->backlight.enabled && conn_state->crtc)
 		intel_panel_actually_set_backlight(conn_state, hw_level);
 
 	mutex_unlock(&display->backlight.lock);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

