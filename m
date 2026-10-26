Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032834;
	b=QNGjipPUrDu1iQpMVk6tLCEpXcyOzTLQNoZMYbnSw/69wWAxIAXKBCK0LqkMfdfIMP7Y
	 Wh+j5dXpozC7IMG/2moSs8DuxoyzuHE1SsNb+YSv+HuxvbAUYoyeqI9jT1nO1HUDlRNe4
	 suqptUmxSbRvlDHv0t9FEQpQuCm0vMdFjeqRAsGTTRL4pDrajJzjBcbFWBBo4sfIlUNcS
	 854XDpsWc3NnFysnVYO7NjZ1WqeodtGJpoN8EEid62fG+i4dbRyyudhdr81nCCI4rQ4kp
	 etzBsqktsbSrFnkDYthTJZghkFp2Wxma7WqDZDNbfKKkyma3/LpKRj/pG170igMzsUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oG0OCrqpe0XEV+bay86LwUo+wIO5sgYnrEJ8HAsyUYo=;
	b=FRQ1cYDAqCVMiYslK9LYsUGYDKl6ZTq9n6ScS077xjan/dH4lu/OJfZ3/o2sxq0xs0Ob
	 RQw8sIIUXVkZ3IaALIBwlFFwK0zQQ/5weYn5HEg90uGEdbfn8NXKUm1yyP0UzdNBRAtb6
	 2A3JYtAf+SmasBNmvc0WqMDBzGvmdBU9q0cI/s+gfyY//qEVIKPAE+T1KYffo77/9tlk5
	 KmrLDrSDNua8XSbovIMzht7KTgE01eW3Nvk00oVUPYSiX6zFfkI8Artm5x2iHYkiBU8ez
	 2Xmy/zsP4nUisNGCrm5FoSX+y7nHpJxcu85IjcZnr1LyoIrOyemsan2HkFGBAaWd72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=gWDcGF5y;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD27C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=gWDcGF5y
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso2527965e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793032832; x=1793637632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oG0OCrqpe0XEV+bay86LwUo+wIO5sgYnrEJ8HAsyUYo=;
        b=gWDcGF5yTCl+ltUDUmx/EnIgMcv9cYZ45OAt4KEzCH/FGL+HfkLw8Jzw+f2sewUcB2
         y17Je6QGxvKQmyjWvFqT8ILCHIpgVBOezjYEN3CeDh4Zx27yJwhvZZXlG2N/+iHKM+b3
         Rja7q+PXBGGrt0tQBtM4CCeDn3z9fwALWTHLNXLOCU0TpzuhCxd4leFmfUzf0pQnYyDm
         fY/tltoI0TpdBu7oKcsU2yD9zaYFLPHINo0GyfW7TDMBBLTKFSrbcmX25mNU+giaPqyi
         C5H/kl+d0wv4mguweDiPc0Z41rGa5aaIbs3mqUEopLkaUy8Idw+Tn2/DTVANbu5qrPNV
         onOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032832; x=1793637632;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG0OCrqpe0XEV+bay86LwUo+wIO5sgYnrEJ8HAsyUYo=;
        b=Cdf+Q62aLW76Yq8UDaOxegG2/8ejtPABWuA8OvUtU1qCIQ75dCBeKgof0ktWytHxp3
         vvWPZJ7kNuWxMMD8sGsPdb3gJwmQnD+oFasuYVtVZB03eVX7zrJSxl/ADUZpF+bJIpg3
         icOWRp7I05AGbxKQop1xieogm2X4odSBKR39hSJ0uXt9oeO8A1eHwuPRbpTqlBA6Skg7
         6MGVXKANQDpfbu919OpfZfW1eCpqg0Js2qFl/l1OXN5rp0kudMkQ/qb8NC/AusWxHpaL
         VqpfkHqR5gN7v2QSsY5JOWCeUVDyg2oQOOtqwMeOqvvEBOXWJJotK4ApJpS25eHHnRYF
         0N0A==
X-Forwarded-Encrypted: i=1; AKwUvByH+M/WLyC8ZbnXuk5kQvXYaJCpEwb5Q1/5d1y7aLDbiKdl+tnvPcRZTOmU0MHTxNb+hG1GyG1s8+sLBuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9p59cZPM+YIaTIp3fJoDUfZKFrlxIDChRfuh9ZdayDYhqjc+E
	/m3j7dH2ON2oqBhaDDSFp87/OBE7+WEeVboekGgtiIGKwRbY1F7MNKw/NtTbZQeVvFWKb78nJlQ
	N4pSAV2RUeCTb6cYpJE+gSkwFu6MOsvSrF+3FmBnWWbZcAVWh1imtvesiN+h1bYeUXY9y/zlNPr
	1ylwwD4GlLp/lsY+eSXYmkC2pnZEucUtGf5aDrJ15m+hdfEG/DathI4RaLJvWO8xvTIrAml+rEt
	WTUKvJdGcFrBYQDEjY=
X-Gm-Gg: AYBFou0tnai3GoF447Z0AgQdLOEMKNU6XbdQnf/lt+pGQ6hvyRne0xDEmgGJpqzAfeu
	DDoY5k3fnuYsChmaLL/juEYXDnL1W55RbGCSleLE6qcvJgXUa9AlwpS8OKcaRJ1PHe/TIaIDt7j
	nEmO4p6i7N4mxiEMPdatldH4A+jRtDuJA/nrMB3ZgoX9S5o6lhD/UQizRof58FhtY6uhIp7+O8u
	mxSZIvnq0PWEI27fd6XufdZwXyPvJB4hqWPk0Ms8wTpdd/0CPRk9kHY6VoCCgfyW2TFNbaXGpvp
	6vJBgQ8IE/Awp70M+UckOo17rNAN5vg00WwNj5LGRFcK+IgwOsnxnGZCC4YvpGq7nIv/GxOPzTM
	utt+vVBeuXwrrpBck/UzKCyQmPS0Xq1bn2xl+HyLbeXp+lTyScy2KF+8uRkLlguXMgedlbkcPfO
	H/fqMkNl/bVYd9eibS3VFabE/cuO9+LJ3TC1DIDKTnobiV1qe7l2spwqRgdlwm1V0WYlKdziibJ
	wFbC3wqyWmflYZ7CAoldVVI+ft+PqkTb24g5PbXrfy4bG9t9q9pCOrqmfqKnWhT
X-Received: by 2002:a05:600c:19d4:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4a35ac3f123mr144774155e9.2.1793032832124;
        Mon, 26 Oct 2026 09:40:32 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm205961655e9.2.2026.10.26.09.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:40:31 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm/vc4: hdmi: enable scrambling before the TMDS clock starts
Date: Mon, 26 Oct 2026 16:40:28 +0000
Message-ID: <20261026164028.78792-4-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026164028.78792-1-lucas.tanure@neat.no>
References: <20261026164028.78792-1-lucas.tanure@neat.no>
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

HDMI 2.0 requires a source to suspend the TMDS clock, write the
TMDS_Bit_Clock_Ratio bit in the sink's SCDC registers, wait at least
1 ms and only then resume the clock. vc4 does the opposite: the PHY
starts at the new rate first, and the SCDC bits are written tens of
milliseconds later, at the very end of the enable sequence, together
with the source side scrambler. On disable the bits are cleared while
the clock is still running.

Some sinks sample the bit only when the clock appears. One HDMI 2.0
sink we tested then sets up its receiver for a 1/10 clock and never
recovers: a Raspberry Pi 5 at 3840x2160@60 shows no picture, while
1080p60 and 4K30 work and other sources work at 4K60 on the same sink.
Writing the bit by hand before enabling the output makes the same mode
lock every time.

Enable scrambling, on the sink and in the controller, before the PHY is
started, and disable it only after the PHY has been stopped. The SCDC
helper already waits the required time after writing the ratio bit.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Link: https://github.com/raspberrypi/linux/issues/7693
Assisted-by: LLM
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a386e053d3f..e57fc33af6b3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -918,8 +918,6 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 	}
 
-	vc4_hdmi_disable_scrambling(encoder);
-
 	drm_dev_exit(idx);
 
 out:
@@ -947,6 +945,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
+	vc4_hdmi_disable_scrambling(encoder);
+
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -1554,6 +1554,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		goto err_disable_pixel_clock;
 	}
 
+	vc4_hdmi_enable_scrambling(encoder);
+
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
 
@@ -1688,7 +1690,6 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
-	vc4_hdmi_enable_scrambling(encoder);
 
 	drm_dev_exit(idx);
 
-- 
2.56.0

