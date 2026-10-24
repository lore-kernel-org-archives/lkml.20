Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792846416;
	b=kMUUVkK46kdnhbWhQApxFPDKUOZFqH0LRfnbzcgw4PCBK0oZvdy21yXj4cnGemq4wykY
	 GSBFMeisYQACeNH9SHxAlCfthHOiMpqw35mHzHdu/KmZVnZygbg2U8A89g9w2YgZZChGw
	 c7/NTc9KbKcOez322F29qufCSMfdy75pjGxWK4ZzEDz2VHtV8qcOIKcqYDc8wnndW7bgh
	 IaTn8ItSaPrzf/n5U2j4utCJynv/zBveYCinqqzgQ73KsuKjB1dWkCzPl/LNtulFRcb/r
	 Uk5G9uRyCFoIHGQXZ/s5p4JsONY+dlBsgD1/bJkzyUTSDj8D7Ie0Km/So2lmE9Tj7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eOAYbZiH4x6SHtvIeJhRKrK8ZEV2eHwdec8xlqf3xRY=;
	b=DbvTdgxHfhqUiVnhq4tXN5+nzex4FPHS/vg+tHK+3/ZC0rf6YKmFrRzQRRhOY2VdSSf/
	 6Ut/P1V6bT461gkWWWuQB0AgxiG6iTGjkCd9pWM/OhBBx8rSeP1ppXJSnTBxynk5tR0/Y
	 KchD/vX190zzlHY+4JUMSt/lvXRnsaIwYIF2Muy/tjZKGSIU5xDdTF7rN4HX38//5F7R2
	 HGrFkUy2E5KWcaQwoUeqJFMe7XVy9kwRZ8/FzXalKPDU0iBDtQN0BW5v1ITQUJHZurSRK
	 JguFx9pHXSPULtQy6mZG+KAvcTQYO0TxV0JKulKY/l/6OQQxi5KyKeJADyYhRJVEcNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNGUT6Yb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E018606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E018606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNGUT6Yb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3009479eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792846415; x=1793451215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eOAYbZiH4x6SHtvIeJhRKrK8ZEV2eHwdec8xlqf3xRY=;
        b=cNGUT6YbE+fmo83xg8TLhlyn9Ku47H6Qmax2E+N7GSCmG4j3EVr+K28ROhr7wg3B+1
         6NWPeQryrteNbUWFk3YVoy3KuJI6kJsR0BOoNtk53Nu6p4vBqrK1sisiUlfGvtcc2uYb
         sPmrtI8WINsbZ5YXtKWihOjH7C8DMTcMYqqS/Gdk36InYjLdHWWFmm2KEbDBmvZj2iWg
         DFygyQr3Rbj0KullaPjQZ+s4dWY3XP/j5uLyas0+y3neBmovssuk7rB3sGQNraDWMmCL
         B9aB1O47DNj3UZBcpDIvu8X1dOIg51Q6sf9SCYpM2IY/94Y4eEeqS6jb8gI+6FOHzmLh
         PLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792846415; x=1793451215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOAYbZiH4x6SHtvIeJhRKrK8ZEV2eHwdec8xlqf3xRY=;
        b=2xwwuzMFWD8r1O2EE2/4uCluyaN06komW4ed+Z0dVbSOpx/PTslCVK5O2BYNGEk1H1
         wB+4TEYLkgwb6Rpr2pQNs3TVfTVXk/JkNEWJjLdPsFlnGQak14PA74l/SuedejR4xR9e
         6Oivdr9nxPrOWbfMawOAZRFeN9v729iHff8/C6KJc0kFj3xpuiRzxq6azaQfHZMpT499
         o4M6Wig/OKPfe9V4fah4KVQ7Scw6YLU5U56q7914O5bNH6122JDZAD/Aaa3rhQdp6u1k
         xnXb5D1WYY3WmeYVBG/o2Y2BHL9keTMiEr1WwUuIFSLaJRBNNcaAcCtDOhQFNWqaXMqQ
         0qkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz49JKfyp/N601jZosVvQWFFWdzepr+blWIE/hiGpxreZhbvFojMe7ESgCzeMmfJFDUxAA36TMNPgTrW+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjExCADkvMOm3NL8tQHYxXt8+5yNDKhdR2fWssODEWybvqv3NA
	lYuLanq0NqdgfWl+7YVfD2A9ThyPMgL8BN66Qs4w0lUp1yY1GXEXzscu
X-Gm-Gg: AYBFou3rraxqeOf4UZg0kiyVfw0BypRWsFwt0844q2WDYl/Byv6/NGaR+A4xj+XWfUb
	9jVSnhfbuSsMAMYIbimWMT1A+vw9Wy8SxWpYv40GLsHNAo+gJWbCWbfdHS06NVvhLb2vN0fVcuL
	/1zMCRiTHgvEWqTasHCUKzztnWhdvTUBznMUx7QlzUWNmx45l9GDAdNroK+yI3GR2kyF3ROoS+f
	SAt4mgx0VoPR1/kviP64HoBrgzfRt4i5xV7mHL3CP75d58W8CeaH5y47IJnx+PvWS4ayzu5NrAh
	jr0VHVILtsg+5CvpttxusvzCe7hzy6O6iuS/NqRW8gqn+mJtvplWjFB1exFVaeM2qUamddJeA9a
	OwWpqwEhZ+dt7jDxs1TZBV6m6sMmJkQGeFtCEwba7W8WRcmFsMNe5mRh+kcOLXlnGuRBa38paxf
	RSz7CbeQaM28sG+LEUJqcUrs702g5avC/2ELbriVggyezeP0GEcge071crjrGu0xa5GivwcPhyt
	S98GsB9Pak8uXJd+A2Ar8qSCZoNgrlvSy+3i1o+LcXwFzKC0BKslW0T++oO9Um6lIQV
X-Received: by 2002:a05:693c:839b:20b0:365:cdcc:9f57 with SMTP id 5a478bee46e88-369e83547aemr3342308eec.4.1792846414983;
        Sat, 24 Oct 2026 05:53:34 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:129:3e65:f4a6:5e8f:7da4:c9bb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm8006260eec.6.2026.10.24.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:53:34 -0700 (PDT)
From: Aman Sharma <amansharma6122002@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Aman Sharma <amansharma6122002@gmail.com>
Subject: [PATCH v3] drm/i915/hdmi: preserve cached EDID on DDC failure when connector is forced
Date: Sat, 24 Oct 2026 18:23:28 +0530
Message-ID: <179284640822.1672477.8751430644960613659@gmail.com>
In-Reply-To: <179284522321.1666644.7085985666852699043@gmail.com>
References: <179284356403.1659508.10439113185286055496@gmail.com> <179284522321.1666644.7085985666852699043@gmail.com>
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

Currently, intel_hdmi_detect() and intel_hdmi_force() unconditionally call
intel_hdmi_unset_edid() before calling intel_hdmi_set_edid(). When
drm_edid_read_ddc() returns NULL during monitor standby, the connector's
cached detect_edid is wiped out and
drm_helper_probe_single_connector_modes() falls back to the 1024x768 VESA
no-EDID mode. When the monitor wakes back up, because the connector status
remained forced to connector_status_connected, no hotplug state transition
occurs and the display remains stuck at 1024x768 until a manual mode probe
(such as toggling the laptop lid) is triggered.

Fix this by moving intel_hdmi_unset_edid() into intel_hdmi_set_edid() after
checking whether a forced-on connector (DRM_FORCE_ON or
DRM_FORCE_ON_DIGITAL) already has a valid cached EDID (detect_edid and
edid_blob_ptr) when DDC fails, and preserving connector_status_connected
on Gen11+ digital port disconnect when a forced-on connector has a cached
EDID. When the monitor is awake or a different monitor is plugged in,
drm_edid_read_ddc() succeeds, resets the previous EDID and dp_dual_mode
state via intel_hdmi_unset_edid(), and updates the connector with the new
EDID.

v3:
- Explicitly check for DRM_FORCE_ON / DRM_FORCE_ON_DIGITAL so DRM_FORCE_OFF
  still clears the cached EDID as expected.
- Report connector_status_connected on Gen11+ disconnect when a forced-on
  connector retains its cached EDID, and jump to out in
  intel_hdmi_set_edid() so CEC physical address remains valid and
  drm_helper_probe_detect_ctx() does not increment epoch_counter on
  standby HPD pulses.

v2:
- Move intel_hdmi_unset_edid() into intel_hdmi_set_edid() so hotplug
  detection via intel_hdmi_detect() also preserves the cached EDID on
  forced connectors and resets dp_dual_mode when updating EDID.
- Clear detect_edid on Gen11+ disconnect when the connector is unforced,
  and verify edid_blob_ptr is non-NULL before retaining detect_edid.

Signed-off-by: Aman Sharma <amansharma6122002@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 31 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..a14a857dfe94 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2570,6 +2570,21 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 		intel_gmbus_force_bit(ddc, false);
 	}
 
+	/*
+	 * If the connector is forced on (e.g. video=HDMI-A-1:e) and the sink's
+	 * DDC/I2C bus is powered down during DPMS standby, keep the previously
+	 * cached EDID rather than wiping it and falling back to 1024x768.
+	 */
+	if (!drm_edid &&
+	    (connector->base.force == DRM_FORCE_ON ||
+	     connector->base.force == DRM_FORCE_ON_DIGITAL) &&
+	    connector->detect_edid && connector->base.edid_blob_ptr) {
+		connected = true;
+		goto out;
+	}
+
+	intel_hdmi_unset_edid(&connector->base);
+
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
@@ -2580,6 +2595,7 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 		connected = true;
 	}
 
+out:
 	intel_display_power_put(display, POWER_DOMAIN_GMBUS, wakeref);
 
 	cec_notifier_set_phys_addr(intel_hdmi->cec_notifier,
@@ -2611,10 +2627,15 @@ intel_hdmi_detect(struct drm_connector *_connector, bool force)
 	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
 
 	if (DISPLAY_VER(display) >= 11 &&
-	    !intel_digital_port_connected(encoder))
+	    !intel_digital_port_connected(encoder)) {
+		if ((connector->base.force == DRM_FORCE_ON ||
+		     connector->base.force == DRM_FORCE_ON_DIGITAL) &&
+		    connector->detect_edid && connector->base.edid_blob_ptr)
+			status = connector_status_connected;
+		else
+			intel_hdmi_unset_edid(&connector->base);
 		goto out;
-
-	intel_hdmi_unset_edid(&connector->base);
+	}
 
 	if (intel_hdmi_set_edid(&connector->base))
 		status = connector_status_connected;
@@ -2638,10 +2659,10 @@ intel_hdmi_force(struct drm_connector *_connector)
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
