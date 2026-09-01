Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66A345ECC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261950; cv=none; b=V4/Nfi46Th0BEsCcIK8bYF+DXwu8wG32rXRBL2WFNwLRaSTG9zeefGfzEMvaGZBKirqWuYSgEWlvAN/fbtygq23CE/hUXlxFO5f6Ov/o8Z7hkoiwtfcSG/4a0gD2gvGd64LWrsU1XkkNDTDc6vGWxQmn1MjJf4XD9oFc8P04reQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261950; c=relaxed/simple;
	bh=t8jY9n+NB1hkrO5pIPQgSVcruFMFK2dLlsqf+UuXHrE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pxs5uIei6DR0PLHwTcJ5+wsqWb9k10Jay3VIZM7oPLVm9O8wMeLX1VFn2lBjpSwXxCcUQwHy1rCov5L6gDoVrZimAXSDbTRfgwEychSvxQ1f0DtL8ykJxn5AWtPH+mRpMT+8uneEqxrKOkaU2o8dtCM09UXIbMV10UVwqsuh+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swIYdqXC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swIYdqXC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso3845900f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261947; x=1788866747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O15Reb8K9UpgINjG0MBTMyi3oJTA2sKCTZI1fZ2J21s=;
        b=swIYdqXCfklRIa6NjAgYjiOJGE9MVBB9LWtciNcnItbzZ9VWvKSdzfHITx1rVyjpMM
         OpQXwbYCxWT0kGMyf1FnT9do0dv9omplrdk7x5FLv3GUfVrTR1niYDrrb9fntYgJiav6
         UqjGJmjw5HGE9kCmUQkSY8FYMPyBMw9p9K9RCJvu8wNdvOhYvmBCxnOhZiYEjAgbktVI
         aEPrpqYeHdgGOznnkkrdeg9d4JgAHFXhtolBemf5wBsBMlgDgnvmQ1CbS2Qall+vNjGW
         3iLYfNWYc/qoARIoXwYaP5brzaUtL7lfgokhek8Ug1CRgLoEU4BhiJyC3mj2un7Q83xd
         +uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261947; x=1788866747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O15Reb8K9UpgINjG0MBTMyi3oJTA2sKCTZI1fZ2J21s=;
        b=RiO5nAVZL8dgXTGiA0/HfH2HFU5pX+02pKWqnvsnB5blYO/dFZzpJ170popboqiogL
         pNBrW7AO1hUacufNYBwh+ysneOycSod0nwN/38TFQTaSDZgqQxf8SEPACiGg0pV4nvbk
         c4m5ocvvxwwIlr5oMagdS64eDjd5FF6pwK2qT/99iL3E2+SSUdwGPjEFgbPejll1X8/c
         08R9P3EnU+EdM/JLcFBIk5VTUbTRId7pmrd66O4FP9DjapsSJrnrYOQNkPmfBWcQvVLm
         uk4be55EOtqVNE5bsNA6FVZ3Jqw90F3GtDNHgiFp5fBWlQN6dwsj3VwtUr66lZchS/z+
         CKRA==
X-Forwarded-Encrypted: i=1; AHgh+RoxQJCVD50CkguW6PMlJxksqIFjQF31Tqj/XmnDp6efCeDxb+16r4L5NjpO01GWQLKd+3k+0GtiGuVsmd0=@vger.kernel.org
X-Gm-Message-State: AFuF++mwsex4+xOWdGBe1JDeQDrVvQTh6NfyvFpcB/2qO3jJv2Xsiw04
	gOLzI1LS7w2K+zJ9E+G+4VXQPrhw5ldJH/Y5Il9q3Ep0xsb7sAM4F6bJGbVchAmv
X-Gm-Gg: AR+sD11IJsnhADGi8hWXuaaZa6+pz9BKwDNy+sHCIlABunSkbqHHyodXGvy5Qrxlf/5
	vYu0B6ZS0YGU19+0JDVHRZIEI9zw89SqAHMrBvB/4wFMNmgOjhdSZx+d0lcr3gPov2AOf3cgd6T
	8cgmV05kn5IlDv7pIfYWmLugnTxiuB/xO6XB/uVc+oFH30JC1Ajl749g/tFmAPQZ3UXnHP3uX1u
	U7+VHC94+83tXtxuwbmc1nbCs2B3/fD7yUCTOQZSDt4ZN1F9Ojl21eVVwJuHzD0GA5RRx9dz4f9
	X+oCKvcKcLPZ6PKGfn9yFsx/oTFuvo/YzhbGTd6M6Of0HAxWgff7h0uhS4rXIk+eqOXHCM6TYMx
	dk97854ujoJpO4ZkCqgHUVOpnHFJxgpYcuQEHw0cx3ZbX8WHlCO5+5F/xjugeqzTdXpoHOqI2A5
	vmrez3PihBTgAkYEQ8MCieS7jtLHaUjzfEvz5q2aLO/SQcRwUKwPc/cfbchK6YDxRu
X-Received: by 2002:a05:600c:8011:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49cdc5660bamr148450025e9.12.1788261947024;
        Tue, 01 Sep 2026 04:25:47 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm226325455e9.0.2026.09.01.04.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:25:46 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi-qp: Compute ACR CTS for unlisted TMDS rates
Date: Tue,  1 Sep 2026 11:25:41 +0000
Message-ID: <20260901112541.84588-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_tmds_cts_table[] holds only six TMDS character rates (25.175,
25.2, 27, 54, 74.25 and 148.5 MHz), so dw_hdmi_qp_find_cts() returns 0
for everything else. dw_hdmi_qp_set_cts_n() then clears the CTS override
enable and programs a value of 0, leaving the sink with no CTS to
regenerate the audio clock from.

Any deep colour link falls into this gap: a 10 bpc RK3576 HDMI output
runs at 185625000 Hz (148.5 MHz * 1.25), which is absent from both
tables. N is computed dynamically and comes out correct at 6144, but
AUDPKT_ACR_CONTROL1 reads back as 0.

Give CTS the same dynamic fallback that N already has, using the formula
from the Audio chapter of the HDMI specification, and drop the -ENOENT
returned into an unsigned int for the unlisted sample rates.

Fixes: fd0141d1a8a2a ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
This was found after testing unrelated patches from DetlevC that rename
the RK audio cards to see the impact in Kodi. RK3588 had audio output,
while RK3576 did not. I'd not used an RK3576 board for a while so tasked
Claude to help triage the problem, and this was the finding. The problem
appears to have been exposed since Kodi reworked plane selection logic
and support for 10bpc planes; earlier Kodi/LibreELEC images were using
8bpc planes thus avoiding the problem.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 45 ++++++++++++--------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 5f4718c3b9db..7cf327de0249 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
+#include <linux/math64.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -307,8 +308,15 @@ static unsigned int dw_hdmi_qp_find_n(struct dw_hdmi_qp *hdmi, unsigned long pix
 	return dw_hdmi_qp_compute_n(hdmi, pixel_clk, sample_rate);
 }
 
+static unsigned int dw_hdmi_qp_compute_cts(unsigned long pixel_clk,
+					   unsigned long sample_rate,
+					   unsigned int n)
+{
+	return div64_u64((u64)pixel_clk * n, 128ULL * sample_rate);
+}
+
 static unsigned int dw_hdmi_qp_find_cts(struct dw_hdmi_qp *hdmi, unsigned long pixel_clk,
-					unsigned long sample_rate)
+					unsigned long sample_rate, unsigned int n)
 {
 	const struct dw_hdmi_audio_tmds_cts *tmds_cts = NULL;
 	int i;
@@ -320,23 +328,24 @@ static unsigned int dw_hdmi_qp_find_cts(struct dw_hdmi_qp *hdmi, unsigned long p
 		}
 	}
 
-	if (!tmds_cts)
-		return 0;
-
-	switch (sample_rate) {
-	case 32000:
-		return tmds_cts->cts_32k;
-	case 44100:
-	case 88200:
-	case 176400:
-		return tmds_cts->cts_44k1;
-	case 48000:
-	case 96000:
-	case 192000:
-		return tmds_cts->cts_48k;
-	default:
-		return -ENOENT;
+	if (tmds_cts) {
+		switch (sample_rate) {
+		case 32000:
+			return tmds_cts->cts_32k;
+		case 44100:
+		case 88200:
+		case 176400:
+			return tmds_cts->cts_44k1;
+		case 48000:
+		case 96000:
+		case 192000:
+			return tmds_cts->cts_48k;
+		}
 	}
+
+	dev_dbg(hdmi->dev, "Rate %lu missing; compute CTS dynamically\n", pixel_clk);
+
+	return dw_hdmi_qp_compute_cts(pixel_clk, sample_rate, n);
 }
 
 static void dw_hdmi_qp_set_audio_interface(struct dw_hdmi_qp *hdmi,
@@ -471,7 +480,7 @@ static void dw_hdmi_qp_set_sample_rate(struct dw_hdmi_qp *hdmi, unsigned long lo
 	unsigned int n, cts;
 
 	n = dw_hdmi_qp_find_n(hdmi, tmds_char_rate, sample_rate);
-	cts = dw_hdmi_qp_find_cts(hdmi, tmds_char_rate, sample_rate);
+	cts = dw_hdmi_qp_find_cts(hdmi, tmds_char_rate, sample_rate, n);
 
 	dw_hdmi_qp_set_cts_n(hdmi, cts, n);
 }
-- 
2.43.0

