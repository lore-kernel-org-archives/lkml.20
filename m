Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269627;
	b=TPMRlQ/bpdT/3o+zwbNEXvbWr7dXgvf+wSjm3ZlfXOXrKo1XV2r/kcLeBbJRu1tHtp+o
	 cYeX4tRzhTiA8O6vVMh6BluI9etxdSgha1E8lsqjKn1o3XmthLw0aX9frJiuJdpcuv/Xv
	 NgoeCJmB6PV8UD1zObqZxiphtaG7/hGn593AkhlwisS5OoA+LxTrZMWXWLXfI7nYmgBny
	 7Oiyoy89URdxgXOtskWcP4exN6lx4LGG644GSJzXt46+WoyHtRL6p3b3P2CG8SKCHTAj1
	 SEkUGJ22SZsXVUDzK/BeWSmPK0y/JsAxGbsoUywxrqJDoeZ45S8vvp66YBg8qUrh+Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269627;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=GlL+fFh6BZV43hyf/+2P4bqacyxrzal/ntnQpcBggQA=;
	b=g8eQY/YS01ie6bqBsb3ZXqrhJQtVFnNjrJZPUZ973KbAqqb21s53zmQyzGY9Qw9rjUNc
	 D6cs+MuaibM7Fpt4P7JAhXCOvuy8NNsOCX5yGmFTSYYgu8KEsvicLThoZCw2bhr31mXSx
	 MB4hzRGZA8VmpvIQRFtEagIX6XyXyIFlRehfd9cRqXnfbFh8w/bOeR3f0Er31nReaHKfj
	 yZVi65Lnoc6RZKYdJcy//vzN8n+X8i1GATstBAL96qgaqCWboxHjWVEZrWbHXHafjRAL/
	 LajNpjMBMO50PR9L2DbgtxtFxNBfk32WLgjvTzNDAKOgrBWeSw7lHHjG9M+cdVY8hJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VWHOSG0t;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3D60A2628
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C3D60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VWHOSG0t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269625;
	bh=OnECVmvllvWZgJSm0XNuESSmGoHiaIZB6HDpLy2gW18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VWHOSG0tSZDB0ocveOKcfnD+SKNcs6Sen+HOvetAbB7nH73SpshVTt3tvNEvA+fcm
	 dait7DQmCLflfOkOZRnSEyC+RHTauDY/C1OU1vpilWLzI21P+Hu9zHyTM5QikZou2F
	 RndhrSwNIoxw2Zcfoi44pd+do25k5LBYfkn95x3N7NRK03M1eEvazxFGhJVBSXYqWm
	 dfMwoT6gAa/pk8tou8b+vV52AexzPkc3Z0PdO0EWFFKWVV3Pni/05MX2ttgSniWjiS
	 Jt4KtCWBu6pzONIsMSMupJTcTJieFmhZu5bM70ZVx3oCNM7gJTD2frecMypc/46agY
	 xGLxi7CH/wb/Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8BE917E35E9;
	Tue, 10 Nov 2026 01:13:45 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:44 +0200
Subject: [PATCH v4 7/9] drm/vc4: hdmi: Clamp CEC clock divider to its
 register field width
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-vc4-common-scramb-v4-7-eaa141a0da0f@collabora.com>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
In-Reply-To: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The CEC clock divider computed in vc4_hdmi_cec_update_clk_div() is
written unmasked into the 12-bit DIV_CLK_CNT field of the CEC_CNTRL_1
register.  On BCM2835, the CEC clock is obtained by dividing the HSM
clock, which in turn is scaled to 101% of the pixel clock.  For HSM
clock rates above 163.8 MHz, the divider exceeds the field limit (4095),
corrupting the adjacent CEC_ADDR field and truncating the effective
divider, which breaks CEC entirely.

The BCM2835 maximum pixel clock of 162 MHz yields an HSM clock of 163.62
MHz, so the overflow cannot currently be triggered.

Clamp the divider to the field maximum.  This is a prerequisite for
raising the BCM2835 maximum pixel clock to 165 MHz, which pushes the HSM
clock up to 166.65 MHz.  The CEC bit clock will then run up to ~1.75%
faster than the nominal 40 kHz, i.e. ~40.7 kHz, which is still within
the CEC bit-timing tolerances.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-168686@kernel.org/
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d7ef47dc4b02..04712e975051 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -230,9 +230,14 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 
 	/*
 	 * Set the clock divider: the hsm_clock rate and this divider
-	 * setting will give a 40 kHz CEC clock.
+	 * setting will give a 40 kHz CEC clock. Clamp the divider to
+	 * its 12-bit field to avoid corrupting CEC_ADDR; for HSM rates
+	 * above 163.8 MHz, the CEC clock runs marginally faster, but
+	 * still within CEC timing tolerances.
 	 */
-	clk_cnt = cec_rate / CEC_CLOCK_FREQ;
+	clk_cnt = min_t(unsigned long, cec_rate / CEC_CLOCK_FREQ,
+			VC4_HDMI_CEC_DIV_CLK_CNT_MASK >>
+			VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
 	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 

-- 
2.55.0

