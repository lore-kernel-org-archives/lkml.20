Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC7471246
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042105; cv=none; b=GSzozF6dZ7fhXlnaGzMAXtjiNPOlI9z/UTbt00hxHVltwiCy++dPk3N6OlERmic4MRSQAhZ3VKkhNO1KpcfuMkzfPzAEfkUA7VTl2A9UkI5pHf6JiFuLRKOptgRhDZTkRrzIQkrwFPEbT7OkpIkwTXqNLBFWs1++zg9Ck++Jrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042105; c=relaxed/simple;
	bh=CCJg+gA6k5cGOU3SmBMdyo7VC/bOq+f1/pHk41HmmWA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=uZ3XzqsibjcI2u8RGw4CWxXFtxe9uSeRqS7nbq21Ea21f3VDJ4ILFc9SQA+yWy1uap+AQ3RPJ19l8139Ueaq3SyxGmUTcbxtQ/OtbFVRJfgyEWZSmdg4vWvLKJY7MYU2ALKYx9SiqsdnifsBGmIrIIXyJyutNNhVy9ZHCzlYCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdRCo9V9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdRCo9V9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1225336f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042102; x=1789646902; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kr90axAl39Wct6vUhubTPo3djvuufRCk0pWZynFpKbM=;
        b=gdRCo9V9kPPlNj9GfbyI7Th5Scxr/X98Z8eTv1zzJG0SyOvoiZc4otqfI2ttE0lyHI
         rr6YhwjyzeYMT01gnbSxcGyk8yed7fhe+nZSwZpOerc1nBp4UEG3SHOZXl15T0q3mYx5
         K0R73AYoNYcHMGG6xUZay1VhPCT0SchGKISVdDgWxhxmNwTpNMLUVfj5g/paImzYKyIJ
         mGOT2qTFZ75iLq8JyoJAnjhAyfJt9hWcQhsurXBI1306MJ69zKwFEAtqbsh3PXun1d17
         RfZpILsg9dlwGf0/Qi5v9dxxkEp07Tu8MzQQ8aEPRkxVl7ln4nZfQU8s8/MUQJ8RfpmR
         jduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042102; x=1789646902;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr90axAl39Wct6vUhubTPo3djvuufRCk0pWZynFpKbM=;
        b=ThM0YtfeTHsP1zmmSp5RCSZYxEZfaFLqVX/RLdn4zBc6RZRnFt6Cq89Py85ENr/Zql
         JYVQ1n/dhRHSjBGs1yYTH3+mSr1UVxEpnoUWaxvHaYfbKEoHa23thybWdwngYqktDx+j
         WaMKVqZ05IXCMs0I/FOqoegb4JbYUbe9uMfvHUnFgbVD0y8y0peRgY7n1d85UWTWCKGu
         PEFfN45iVGBWhjbVP50IzS8vfGWEQTMv4KAemTDArZD2QZCiGHKt9jn0qCyk5gJbNx4+
         6tBi78nSkEtiGkJYP+VcZTGXLXVI2XDSqZnDg8bLfuvrqHQOSA0xKglSpXCjYz2zV98w
         rlIg==
X-Forwarded-Encrypted: i=1; AKwUvBxjL+JuSi31IGXl2p5XIpbxtKnjXkCPMQu913nU3U7MsCIzB0Vv3trUSrPfoq3iFBD+NmHusTy0uxvbtDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mS9usul2TFvrYuemnFfA/JgQb5ycz8aTwDpakhiF3EamLv971y
	gyCZgZV4AupVNVkJD+5Nv3dixK6Y4aNiNDtD+3wGJGxRhPAIGDRuhRqPBNl29gWgiPpSow==
X-Gm-Gg: AYBFou0mD/CkHtFQODw3QQhoKY2SI6LSO6Nu8sMMshidqaudI3nGGSwlPqQyAZDF7Vm
	3eED7PbHAk6VXhJ8ldbfQXED2c5olwC4FlItpZsZvdnB9Tu3VOSRLkrRG82+aj4iNOV4Fn4GnqP
	SdXmq03sqtCmHu2qdaXxv6LeKdpGWaleNdkyvmVv/JwZo6ci5o7CzWhpKoNokOtjkZYJr11ZRHz
	u2MgRWyNRFns3mu2kne9VJgKceD0UHjC+UekFdyV8/h3x7j/JvjJrs8LR5woHvVAOlI2AChwAKG
	lS0Tl8/n1A8lVtx7+dA+7Sp9vjB+ESsS4XGUI7Z0g4vW/0wUjBh8FjqfFm7KYgduycf2aP5FKF+
	0ZNKyqRPdMqJ3fr5qfrXEYz3lO/cpo0cVVUmVPcf66RvqkftBbtrin/hhjiKJFG5PJE+8FQ5/GL
	T0t7IwuHuryOu6jm79f4E2vTedtJAKuANZGWJRc+4rcb32C9lKW2rmjj2/wQIfuLUC68zfSYFxe
	DAsJDfL0Gu5Tz20AMQcENb9bSJdsOzkS5nKhaKvKVK2bs6pStwF1QoKLnmUn4K0kKpzjZyth5sf
	2owCMHGox+Lb2Q==
X-Received: by 2002:a05:6000:1883:b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-485aad9458dmr21686931f8f.2.1789042101895;
        Thu, 10 Sep 2026 05:08:21 -0700 (PDT)
Received: from localhost (adsl-178-39-48-248.adslplus.ch. [178.39.48.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm51597465f8f.26.2026.09.10.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:08:20 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:08:20 +0200
Message-ID: <4d885f9e201df6f48a06f4ab3b27a7f1@gmail.com>
From: Robin Räber <robin.raebi@gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Cristian,

I tested this series on a Xunlong Orange Pi 5 (RK3588S) driving an
AOC Q32G1WG4 monitor (2560x1440@144, TMDS char rate 592 MHz) and can
report that scrambling works, with one interop issue described below.

A note on the test base: drm-misc-next at the series' base commit does
not boot on this board for reasons unrelated to the series (the
unpatched base commit hangs early as well; I can dig into that
separately). I therefore backported the series onto v7.2.3, dropping
the vc4/sun4i/tests patches and adjusting for minor context drift in
drm_connector.c and the scdc/hdmi helpers. The dw-hdmi-qp, rockchip,
bridge_connector and helper patches applied without functional
changes.

With the backport applied, all four 2560x1440 modes (60/100/120/144)
are exposed and 144 Hz works, but scrambling initially failed:

  rockchip-drm display-subsystem: [drm] Sink doesn't support scrambling.
  dwhdmiqp-rockchip fde80000.hdmi: Failed to enable scrambling: -22

The cause is the monitor's EDID: its HF-VSDB declares a Maximum TMDS
Character Rate of 600 MHz but leaves the SCDC Present flag unset, so
drm_scdc_sink_supports_scrambling() rejects it. The SCDC interface of
this display is nevertheless fully functional: reading SCDC via DDC
returns sink version 1, writes are accepted, and after the change
below TMDS_CONFIG reads back 0x03 (scrambling + 40-bit clock ratio)
with a stable picture at 592 MHz.

Since HDMI 2.0 mandates SCDC support for character rates above
340 MHz, I worked around it by trusting the declared rate:

--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ static bool drm_scdc_sink_supports_scrambling(struct drm_connector *connector)
 {
 	const struct drm_display_info *info = &connector->display_info;
 
-	return info->is_hdmi &&
-	       info->hdmi.scdc.supported &&
-	       info->hdmi.scdc.scrambling.supported;
+	if (!info->is_hdmi)
+		return false;
+
+	/*
+	 * Some displays (e.g. AOC Q32G1WG4) declare a Max TMDS Character
+	 * Rate above 340 MHz in their HF-VSDB but leave the SCDC Present
+	 * flag unset, even though SCDC is functional. The spec mandates
+	 * SCDC support for rates above 340 MHz, so trust the declared rate.
+	 */
+	if (info->max_tmds_clock > 340000)
+		return true;
+
+	return info->hdmi.scdc.supported &&
+	       info->hdmi.scdc.scrambling.supported;
 }

I'm happy to test further revisions on this hardware, and to submit
the above as a proper patch if you think this is the right place to
handle such non-conformant EDIDs.

For the dw-hdmi-qp/rockchip/helper parts, on the backport described
above:

Tested-by: Robin Räber <robin.raebi@gmail.com>

Best regards,
Robin
