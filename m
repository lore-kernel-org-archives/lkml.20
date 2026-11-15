Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700824;
	b=TwlvzFRTtM8g5Ne2qkwtXEaPhR9WJxuK7pKwrqcceZ/hGo15WpSyFnQ0j3mVY8gcEtPq
	 JkqttZRb+b2DTuNfAMeWMmGrOQjUNtXm68pX0B6Fa4dqYuMMTJqSfH5bxQ9ci6ZdLwDBn
	 insAhGMCITk0CFZiCmngaKhARVxLkJWQhGTbyfIpPpGiWqNjqhzgaBGusXoZ08Hc6ClVN
	 1+/PfiB7qDzlJ09KOmijZVyM3jbFQgewyGKZmzdOIFLnbRj3f26z5TIcS+T9+s1UOT6S9
	 A6CT5i3xEDzDulzlevs6Ckd+IK2xEUWbB6o5WiA06QnoqwRBNTrwgqx1LdVZ8GIHHyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
	b=eov/9EQIcB/D8+Y+FZxwlrTuuXiFDMH8hYiIg4gwqRrqY0paTrMOmYNINV0zbeOfOqGY
	 gUbYCdyFslKHMFux016exepfEI8TGjw8FzjsHEdjqs7YPHIQZCQ+/31RviPai4jt2v8I4
	 2NWqDFcfOtaWFYDMfjlaAvext8+abHyHwbqSW6dWjq5ZkBLZMvkmleHWWrwj8cEVXmBk6
	 H/CzooXtH8RQjNs39bZbsFErXily+JfJAXnpfxX03L/IXe6OcHaUQVB4ePRoechkqNegu
	 ov1MaPe/79dVaZ40ZMB5xOxle4/ijgCosYq7wuD2DMOUo1mXkiQDeOHx0ILv6vSKdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQyl8f22;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAA606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BAA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQyl8f22
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91f0b9f0b1cso32514046d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700823; x=1795305623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
        b=PQyl8f22/c3gghnWE2LGTIohsdt76WYwo/5YSjvXwwSESCjFlxldyVhVcbxVmDMMoj
         ylqCa9z0BylOho52I2dMQ5Hy/AdSQFBSlDYih1vSq0W5/Z5OG2sqt4hDMPMtpuhUpf+N
         c51qT2hq1h7hI7JcDm9P9T0Cc40x+hprFp1G7QWwZSqLIJ0RcRNaQHlzq7W720oh3yVx
         j0fDAaCMNb85JTTy+BKirlQF5Y2ydIY0WK99PJ41qhDUmtPuEi1ReVcB1xWVUc4dxTgT
         bPULwS+YwypQo3idazwbRSDuhJeVZ2X3AAnKct5ZWODhdaAzkEd4wr+6DC/ziDWNgFeU
         jPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700823; x=1795305623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47yra+ALozbc0fVpexoyxbUMKoA6BWbtB+u45dbkO3Y=;
        b=wAiyy7VSlOxMMAfRzCvgH+MhDw5L8vK7I6Hp5NJDkD4sfURd6CPzd9qMc3qJRiGkRT
         1g1dGnvVPkmsbfmxFWCgwQj/NDBEPFgRJ/7QuXduTtY8cESjS7mVZp/Vf9Pm99UHHYoi
         c4ZqUtHNR5Do127F/6XWCIQSXMIQ2s+1ycjuUl0hokovKi7S36CMoCCSixNVH6fxhpno
         fuFiGjm+YD6QueXATy+zyJvGMNSciT6l+TihTGDW1UFi6JtFt8QE470AhkTng4QwMGm2
         a0rbPW637G1UaSOdZvg2tgxDeNVQLb63LxjUjorc7g7KWSZtExy/FIlLkQ5hS2vw6kUD
         tPSQ==
X-Forwarded-Encrypted: i=1; AL+hErFj+r9wJP3MxF/UWcj6yE+kqyscUiM9H0jOULcq39Cn7T4mW6Bl8eL7dWoo8RCPAJ6xiy795ExbZcTNHA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zhvCi+6BWo/lTrENIBPbN231f6oo4Ljy6+7GUIgKF1iXo5SfK
	uctKTst9anITMaq9leK02yESLM7nM0sFCGJmHG552m1cyYhXVM+7/My+0vyBOXUne+pyAA==
X-Gm-Gg: AYBFou03htdM7txcHJdHkGZsY/CJxYy7ykNYE+MqCQgroFTy0DUlICuF43+3jxK1Crm
	10kq6Zqv2Enl50Spat1xkk3ZhRoTj0T/e8mdYbKK9vV9g0K3x1WCKYCedm8ENcBt5lrod4K/Kw8
	QKa33KY5Vnf5jLtmNxOqb3CMjPAQdjzAUHMDCoLwiq2xYC4Wcsd+3azSCwCeXorhumkFXxqg8k0
	a3jcsYaI+2Szunb0c4SgFxpayPkI/sd9QnULwpKdbIxhiT7OamYiyDEDBgG/XERthlh+LBqWXjK
	C5fCbhJN7+P6LzGR+p0+XK9XsXwbdl6A8mrjItIXSedo/OFtAbHe4+eLUop3TMwomq5dkPfZnO/
	XTgKdHvplte5oXzM6w0y9SygcR+sMzQjNKcOfEQzhhzmHdOHDoYkU/L4awl+2oA1ndYX+/2Urbl
	VySMzgZWvqDH0GnAuFw7+nCl/7xLKH3knk4QPMb2PO/Vs6szKacr7eQnA9UoyUPA+gBN0udrkw7
	hhI7h4lnXC/ZkuWVyd0gSrOxoVA8Y+YIBkNyapzNrdkoME5VrViJvtjAVJc5V+zdjMzsoktmL+s
	a45+NdXzxhuovvtMrlgpkIrRu9YU9pqzODh70OHyLf+6SnvREWVlwTFVMUB0WDiNPDPRczEapxv
	yl3aGMF0SB5KvLa25M5IuXMlSjjPaz71uSbqLPw6P6FlyMZzgdgINFsdlOEYH8MCMuk5/KiIupC
	Mbz58aY4HZTGVW9KGxAwvEiynUWWqICFrZL+zVuc9GGmiZYvSUzvrnWPDcJcA09l6nKNcgM9Mle
	d+q6iuwbJfYfjebZtGwzdLekRU+QMNF4RvCHGl+T0ysGg==
X-Received: by 2002:a05:6214:5284:b0:91e:a38a:74e with SMTP id 6a1803df08f44-91f241cd1f4mr112380336d6.28.1794700822815;
        Sat, 14 Nov 2026 16:00:22 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:2cba:4fbd:5596:d1cd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm52516536d6.21.2026.11.14.16.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 16:00:22 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: don't fall back to a link that can't carry the eDP mode
Date: Sat, 14 Nov 2026 19:00:21 -0500
Message-ID: <20261115000021.78869-1-jesse.casco@gmail.com>
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

When channel equalisation fails after clock recovery succeeded,
msm_dp_ctrl_on_link() halves the lane count and trains again. Nothing
checks that the reduced link can still carry the current mode.

On the ASUS Zenbook A16, channel equalisation at 4 lanes x HBR2 fails
on some DPMS wakes. The 2-lane retry trains but can't carry the mode
(17.03 Gbps needed, 8.64 Gbps available), so the panel stays dark
while userspace sees the output as on.

For eDP, check the reduced link against the mode with the same
bandwidth check as msm_dp_display_mode_valid(), and retry at the
previous parameters when it falls short. External DisplayPort keeps
the existing fallback.

Tested with 100 DPMS off/on cycles before and after: channel
equalisation failed on 6-7% of wakes either way. Without this patch
each failure left the panel dark; with it, each one recovered on the
first retry at 4 lanes.

Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcd..261645c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1587,6 +1587,16 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static bool msm_dp_ctrl_link_fits_mode(struct msm_dp_ctrl_private *ctrl,
+				       struct msm_dp_panel *panel,
+				       unsigned long pixel_rate)
+{
+	const struct msm_dp_link_info *params = &ctrl->link->link_params;
+
+	return (u64)pixel_rate * panel->msm_dp_mode.bpp <=
+	       (u64)params->num_lanes * params->rate * 8;
+}
+
 static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *panel)
 {
@@ -2383,6 +2393,9 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	struct msm_dp_ctrl_private *ctrl;
 	u32 rate;
 	int link_train_max_retries = 5;
+	bool is_edp = panel->connector &&
+		      panel->connector->connector_type == DRM_MODE_CONNECTOR_eDP;
+	struct msm_dp_link_info prev_params;
 	u32 const phy_cts_pixel_clk_khz = 148500;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned int training_step;
@@ -2420,6 +2433,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 		return rc;
 
 	while (--link_train_max_retries) {
+		prev_params = ctrl->link->link_params;
 		training_step = DP_TRAINING_NONE;
 		rc = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 		if (rc == 0) {
@@ -2472,6 +2486,18 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 		}
 
+		/*
+		 * An eDP panel has one fixed mode. A lower rate or lane count that
+		 * cannot carry it trains, but leaves the panel dark: retry at the
+		 * previous parameters instead.
+		 */
+		if (is_edp && !msm_dp_ctrl_link_fits_mode(ctrl, panel, pixel_rate)) {
+			ctrl->link->link_params = prev_params;
+			drm_dbg_dp(ctrl->drm_dev,
+				   "eDP mode needs rate=%d lanes=%d, retrying\n",
+				   prev_params.rate, prev_params.num_lanes);
+		}
+
 		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl, panel);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
-- 
2.56.0

