Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843573;
	b=NRfuon1wDrNn9ijMlAYzbRKz3KUlX+PvaGlRFrf2W96PAMRFJSJvr3HtVnZM8B01Qy0D
	 FKTI8YFA5U5NnGOeuO2K+fGHNWhxIHMwUmrZ1B3cCaRLtT8wbrgnb+eoSrLCTJgu34T2O
	 JTul6/3/1w6hb7JGcmU9boAoOX8vx3Ud+kXZXU8aJ6X2JtQYQXf64GYJXXyRJVpiEwTbK
	 XxEKTM/UhvyKiY2t2HGKIHcOZ6qenyGkWPwzvMcLKwI+1Q2JB4XOKFUl3AleRd5LwTruA
	 A0MsdjCVWaOes0kfyf8/t85FC7trC2xGaRlBfooHmhSr9qvMykq5xyuWlp2II6YideA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bVCdTHtpt7GG8JcgCc7bG+9s3eoRT/FFD1Bgu+2KeOg=;
	b=sWmapbdJqgY1I42vcFXnNL61qNx9962YD2Qcxc40H+2S9hpYDysjlZLr2MFd88dq86pR
	 6QuyIcHPhGuHFIFenVGXdQW5k76URcLVdItsdrLK+uWK2+u67HOD4EkFIKGj0LF5YdWsr
	 C9qzI0vVDWUV7Es1MRShKymwxv+clxHcAcPC+3K7z0zQgupTEBocyLB2qO5wt5j5Ql+NB
	 5lIFlfyn8B3E9zhGmApf/BkSvLH/jd3g2Uu/FonFxLDM6bqc9yxwtx5dJlepOjGEYytxm
	 I/8JUIyA2A1mYOee0GXSwK4n+zB50DBXtVWBknvoKI+1pINQW4i9MpZqezs0vVNBHwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="M7d/fanJ";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E135606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E135606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M7d/fanJ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so2718991c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843572; x=1793448372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVCdTHtpt7GG8JcgCc7bG+9s3eoRT/FFD1Bgu+2KeOg=;
        b=M7d/fanJVLn+mKCHa+IqxUbId2WSzV6WMSX/3OsU0eB3dm6rpOzb57sXZbSOlMEbjh
         /C1K5eJSR/e60JsHjuHzfAY+XM/2UrUAXa/6DKEXOsnI+kyhq1tHtj7jEaNClwICk4mX
         hMcNZJVdcgMSNmvcEk7QL5WPWSQyQKnyuMW/qm5su0UMrumkYkNYXUMZAK2vOyQWqMZH
         VPJQdQ1cYW6Kqn7FiLvRoygn/3AHj+QmcFmecKowWLK9dk+na0xEn4lmcF5x4eI1IJAJ
         2+pJVg+G5o1epOrmeqU1YLoReuNjo2tDm5uwwef4HrWNq3MgUj4XXv5fKuUWC2XAykKQ
         TGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843572; x=1793448372;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bVCdTHtpt7GG8JcgCc7bG+9s3eoRT/FFD1Bgu+2KeOg=;
        b=BO8LlE39UG42Rmg0ztNNj+zru2Dx2Y3jgEeXnPogpHI2xZFgQfRXQzqrrSiqH6AS1L
         crgrFjobfY3Ho2w7mSgS+B4e86Ot0dN6HNzw2l9KYw3OhOzCZGk3KIzpP0F1v+W633Zm
         PxujIEtKv5KJa+PS026hL/QEz11oICnwWL/lC6sW75ngfn4UCVmgYsVux0wSU+78Eu6a
         XBnoiSdQzBPwUDrmeg2EEPPz+IpQyI6OOhRnJ4C3fAmJ5YS0z02N8GczgT33mvs+GLiE
         IneWxAUPAJK2Qe/hZd3CeubvZ06h44fAZACbN1YmaF9+6LyirbQCfQoKcwSIpvMVKzNR
         DRjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNpOO1dIiIBQ7Y2Y2L1Pc4axYJT5mKXRAWGv9KMdhmlFJhHv89d611D872MKaK1C475SdG/nMq5DpSHtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiKFnvykVdYMPqTYo2OBaCRNvGQgprNij8NLpolPcJZ3IP1XwJ
	9ntPo6FPzNoyQkTlj6f1rspVbK9uaPFNo5fqqBw7uI4V7mVXHUr8AgIj
X-Gm-Gg: AYBFou2oJyNHy+wKdl67xwErV/K9RDUhPxBhNlFh9GWg5Kgcq6dxm7c2FeBcsvJUJ3q
	dBGIQOGN/A8kEZBd1XII8yBxaETY1PiWovVRizqj/6He84h3g8WoppacGg33iInhoD0M5fmFVBO
	Sznpxfjkc6uwLfeTFJy5wl8RPfrdVjiC3ZdJrlsCvtfAh1EIp1QvaUsYbi/XOqDflLoRNgxI5nt
	kYSs4mJIxzC71uMYSsNRsPczY85IxFVoNTrY+cxtILWj/MdozZvYdnVlWA0+M5HYiNZ3h/46PoF
	F8hXuZ5bO0Aalpurclzj/Q12Bn0/NTVjaNTRavZltXPOKKpXa/oxpKYehJhp5PMbRE7Arrx+Ouv
	AN47ngvwEpj79O0KOUdfmrC75XpKFCapMexW0SKsdLeoBEh4EQtnGHBe0cr55YN056IeRu+MkbC
	RlZ6QK9iB0rpgoleCVJfhJCzERj9A8jrfCS3O6D3cm9lLFjLXUItea+gbZFWwz0xocY0DP9+HOy
	idnv5UyUcHUNaMJA+Xn5UovHWK0Oqafg1DN82edJtdrI+I1vJYi9qGUNjSDB9NHKmDn
X-Received: by 2002:a05:7022:7e0b:b0:143:2982:1043 with SMTP id a92af1059eb24-1993639f0f2mr2801303c88.36.1792843571494;
        Sat, 24 Oct 2026 05:06:11 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:129:3e65:f4a6:5e8f:7da4:c9bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm15569309c88.17.2026.10.24.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:06:10 -0700 (PDT)
From: Aman Sharma <amansharma6122002@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Aman Sharma <amansharma6122002@gmail.com>
Subject: [PATCH] drm/i915/hdmi: preserve cached EDID on DDC failure when connector is forced
Date: Sat, 24 Oct 2026 17:36:04 +0530
Message-ID: <179284356403.1659508.10439113185286055496@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an HDMI connector is forced enabled (e.g. via video=HDMI-A-1:e for
laptop clamshell operation) and the external monitor enters DPMS standby,
some monitors (such as the BenQ GW2790Q) power down their internal DDC/I2C
controller, causing SCDC/EDID reads to fail with -ENXIO (-6).

Currently, intel_hdmi_force() unconditionally calls intel_hdmi_unset_edid()
before calling intel_hdmi_set_edid(). When drm_edid_read_ddc() returns NULL
during monitor standby, the connector's cached detect_edid is wiped out and
drm_helper_probe_single_connector_modes() falls back to the 1024x768 VESA
no-EDID mode. When the monitor wakes back up, because the connector status
remained forced to connector_status_connected, no hotplug state transition
occurs and the display remains stuck at 1024x768 until a manual mode probe
(such as toggling the laptop lid) is triggered.

Fix this by retaining the previously cached detect_edid when a DDC read
fails on a forced-on connector. When the monitor is awake or a different
monitor is plugged in, drm_edid_read_ddc() succeeds and replaces the
cached EDID normally.

Signed-off-by: Aman Sharma <amansharma6122002@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..140d98a61a9c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2570,6 +2570,18 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 		intel_gmbus_force_bit(ddc, false);
 	}
 
+	/*
+	 * If the connector is forced on (e.g. video=HDMI-A-1:e) and the sink's
+	 * DDC/I2C bus is powered down during DPMS standby, keep the previously
+	 * cached EDID rather than wiping it and falling back to 1024x768.
+	 */
+	if (!drm_edid && connector->base.force && connector->detect_edid) {
+		intel_display_power_put(display, POWER_DOMAIN_GMBUS, wakeref);
+		return true;
+	}
+
+	drm_edid_free(connector->detect_edid);
+
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
@@ -2638,10 +2650,10 @@ intel_hdmi_force(struct drm_connector *_connector)
 	if (!intel_display_driver_check_access(display))
 		return;
 
-	intel_hdmi_unset_edid(&connector->base);
-
-	if (connector->base.status != connector_status_connected)
+	if (connector->base.status != connector_status_connected) {
+		intel_hdmi_unset_edid(&connector->base);
 		return;
+	}
 
 	intel_hdmi_set_edid(&connector->base);
 }
-- 
2.43.0
