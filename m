Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845232;
	b=nYJfUTLVibx0wwEAGkJHlZuNIFJWyldsAbVh5xP7ejZrJxaqpfHgv3xQdm5ya06KB+KP
	 43sNQCxBifNlxsoNlMBHoc2dQsvQkEE+RX3FzZjYIdrVu0oKoMHcyTvdELSxaNpxePN8S
	 MDYVSEdoAQ8L0AahaaETsc6Q8iz3rPBZ9MMJLVXKNEjjiK9mel027q6w6CR8o8ERRTBq0
	 J/iHHWBZHprPgmKUWUBbUJwN6sk0bt/EVtsoH79Y4aWT8NUbTtG+++ulcMROTiN6HUuwh
	 6kjAPs6aT7+21q+S1mu7yaZ12kvptT3Kyok4ZBg+OWuWXXJ1kij/B4dlSmS3FQ0hIWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UcH8rYHopQiyfN2N9CeJ5UIPAEXGC3cUJ4H4eP6mIrA=;
	b=dcdJUHeCeZXjJQtnSwa0zkDoK0LFrv1RCKqhkUFplS7HyAdEnAm1bT5N79fggt+UvpOs
	 GysbHcBRh/W9LoQ7j84twopZgMxByUoOlT5MnNASDJm59+5FimBy2Yb/Q/WMoZnYD3dXX
	 84rllLQbzil6CnYAQyt2nMQyqB2wt2Oo95/7TszZfDwvBQAB2KWNfdzc+u0Y+FnvCXH9S
	 tE3b7+qYRssnloPn50/focRSZaYEnaaWgdOgR1YQup7Ky8JRB5ovABFe5K3irt52shgF2
	 MAREvlulQCKZgh8P27GpeDYUDBag0tO4KXjn01ouJLp5uQH8T50EtcGcH9XuHyFmUrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IIeMd/xT";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0453606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0453606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IIeMd/xT
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fd9dafb0dso994407c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792845231; x=1793450031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcH8rYHopQiyfN2N9CeJ5UIPAEXGC3cUJ4H4eP6mIrA=;
        b=IIeMd/xTKVdBVT6y5kUxVk+2HYTOiJpVfWfxEXe4Ihb/0jwLIA/hJu5Vscj6e6c4TA
         sFO+Tkkaz1sJtU7Gq7jkphObo1Y3lXeV1z8qkOwyaLlsfAU6RiyzQ10t8vZjFQkkdk6b
         6yCL2v49d5bdrTF/bgpU2EIsGYdgcsRB++PAOoxYKHRAC/fywjFJNsB+ZYj41QtF9X67
         qkuojxQgKhRBFGIZzLsSrnfQe5/auyd205RL34vP7UIMLjBUeyWN5ZPgN5bP9KnQvbUn
         ECkHfHmF3y9EXsGn6SbLNpXXajVCWwt/MBYNpCTGr2jafs4GrdYTgo5V2dCKzQK+tdcD
         UYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792845231; x=1793450031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcH8rYHopQiyfN2N9CeJ5UIPAEXGC3cUJ4H4eP6mIrA=;
        b=hOOKHw8i/J3PfddJK3EB6P7qrb8rwXPra87w6uU7efuTrhreRt9DzwGU4BsBsnYuYu
         SivG5ib+yFXS1T9QOE/FiVWxN49IcNgSEyMOfWNwQzsZDBjThF1XzckWQg8O0Mzrvp6R
         rlCK5dn3VDTTHxZHW9ZmxmkOWrLsM3qIP4nCL+TUclhg9sl2A2plV3NqfJsPncuiQC9n
         6vg5NiW3uHEtS/3GePwu/I00H2ordigFpmxSPZ1EwgwHPwHNlbDKDOckj9k0Xu146DvM
         Me/yLt9bAibfzaCWdP9CwrFVxk/GNB/3uGwYjB4GAhKukWUTxJ6O7y4MiVpye1RtXtkg
         rl6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTwoMqGsLkJI5Lw4aN+XOorPziX5JAVFdWHN9nvWFvqPIvR5rSa53jlokJHMxh92VZkiwGZgIG9cgMaEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8EDhAASVkMjeS+cGzdPsAIc1X9/4v70ui6rgY9U+WQ2GgNXKB
	rmlZVqGiZWNnQR1qCDPKwl+aZxRYQmRHhp9h1m05h6As995Ev9746ZiC
X-Gm-Gg: AYBFou0DDVIEuoB9M2YbXyRwf4JQy6QOChSiDvNve7woq2ocjG+THyq0rsZCTcjmezD
	TEGn4EoDh02Cv/3kNevkUbZ8wzCyHn/+Oyagjb+gdPbvg3i9HvfdTrVoIkiI8iL6TvK2nxHnpzW
	gwSBwZKT9PU/B8QZ0Rx49TRKavQVlKrUnkcY8GolOiQsLjeLfi7YRoCffMAyoJ2Pn71SwGUJc21
	a1YLnmL1KF/OrtL1ZmSNrKQ2jFyDcYNBpmwcpulrzjQrlWKrZnM4PJGeQf/6j8BsFY60mk6nMtm
	ocx7qGx+OiVJ6gUcQtO9KOR8yD8wJ7q24+8jixbgNiD4lp/3JHajLTx5Xz/mc+6VcxrhRm0d9LV
	17MdnHOMw8jwcEbca0DpJROw0wPtRbpUNCKJHnFJ9MoN2NMAFwgHpMyW0rWbLhS/ceXFiQjrvcB
	4gQWWAfhBJpjNMGXJYMNpi0B/MPWYAXXngRCPSFHUORpmxzvSAWkx9KT3T1cayr06pWAchJbr2q
	OYtUU9kJ3mHUyW5HuWU4ru4D/nLR3Vgx2kLhKCsNH+0sQmnsRKzEj2Q5h665odwo+PBUp10PDXC
	XsALdlF1HubOVPY=
X-Received: by 2002:a05:7022:7f18:b0:143:296a:3ee with SMTP id a92af1059eb24-1993571a3bemr3230839c88.25.1792845230770;
        Sat, 24 Oct 2026 05:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:129:3e65:f4a6:5e8f:7da4:c9bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a470sm6295559c88.2.2026.10.24.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:33:50 -0700 (PDT)
From: Aman Sharma <amansharma6122002@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Aman Sharma <amansharma6122002@gmail.com>
Subject: [PATCH v2] drm/i915/hdmi: preserve cached EDID on DDC failure when connector is forced
Date: Sat, 24 Oct 2026 18:03:43 +0530
Message-ID: <179284522321.1666644.7085985666852699043@gmail.com>
In-Reply-To: <179284356403.1659508.10439113185286055496@gmail.com>
References: <179284356403.1659508.10439113185286055496@gmail.com>
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
checking whether a forced connector already has a valid cached EDID
(detect_edid and edid_blob_ptr) when DDC fails, and only clearing
detect_edid on Gen11+ digital port disconnect when the connector is not
forced. When the monitor is awake or a different monitor is plugged in,
drm_edid_read_ddc() succeeds, resets the previous EDID and dp_dual_mode
state via intel_hdmi_unset_edid(), and updates the connector with the new
EDID.

v2:
- Move intel_hdmi_unset_edid() into intel_hdmi_set_edid() so hotplug
  detection via intel_hdmi_detect() also preserves the cached EDID on
  forced connectors and resets dp_dual_mode when updating EDID.
- Clear detect_edid on Gen11+ disconnect when the connector is unforced,
  and verify edid_blob_ptr is non-NULL before retaining detect_edid.

Signed-off-by: Aman Sharma <amansharma6122002@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 +++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..89ab9a790a41 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2570,6 +2570,19 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 		intel_gmbus_force_bit(ddc, false);
 	}
 
+	/*
+	 * If the connector is forced on (e.g. video=HDMI-A-1:e) and the sink's
+	 * DDC/I2C bus is powered down during DPMS standby, keep the previously
+	 * cached EDID rather than wiping it and falling back to 1024x768.
+	 */
+	if (!drm_edid && connector->base.force &&
+	    connector->detect_edid && connector->base.edid_blob_ptr) {
+		intel_display_power_put(display, POWER_DOMAIN_GMBUS, wakeref);
+		return true;
+	}
+
+	intel_hdmi_unset_edid(&connector->base);
+
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
@@ -2611,10 +2624,11 @@ intel_hdmi_detect(struct drm_connector *_connector, bool force)
 	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
 
 	if (DISPLAY_VER(display) >= 11 &&
-	    !intel_digital_port_connected(encoder))
+	    !intel_digital_port_connected(encoder)) {
+		if (!connector->base.force)
+			intel_hdmi_unset_edid(&connector->base);
 		goto out;
-
-	intel_hdmi_unset_edid(&connector->base);
+	}
 
 	if (intel_hdmi_set_edid(&connector->base))
 		status = connector_status_connected;
@@ -2638,10 +2652,10 @@ intel_hdmi_force(struct drm_connector *_connector)
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
