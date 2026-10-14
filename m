Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C6434D382
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791939816; cv=none; b=k7HSUoIo4a24P6Q0Yis8OaDv94QFO/COuhQd5g2UcEhT7106ZEx7IYeC+zvADAa+JROZS1bMM1zJ/tCfMkqq/XMbUYxwYpyWQxpE05IdwGO2uSPdWshB1lgUC61T1/y7CWSqbyoV0c0cYFAifMD6pIL7ki1ZUWoxR1cNvYRG68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791939816; c=relaxed/simple;
	bh=MckGun2gtejT560FK9QmGTltX7GCFvSkoYjqkh14MG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWGa+3GNGERYRCqqLuOgaD1ki9pRuMu7aaSh5oI+z+piMO6+xUJJKeDb+6hdT9oNCjeyArsJB1pmLvq5n2hVjy3bgTX5TMzUWgaIhZKtdJ/vm+PkJo+kTR1n4gjQYS8ih/BcOSH8D/3gm3ooN+Ycr/0mhkWQU+GFiwYj7FqoTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mObrdfij; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mObrdfij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791939813;
	bh=MckGun2gtejT560FK9QmGTltX7GCFvSkoYjqkh14MG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mObrdfijFmViOyGYT9/2LsSylhyCXZJa6mmBSF/27GuhyH6futliqAHEQSGj0+ZQ4
	 xAqEXn/0sCqZx8tR6kgCvE10um473Bdv+ms552qmC7sYX4nv3RZ1CWVKNElVtG0FKp
	 HeSaogRmk8cpvssnMieDbh7/iRyeSnSsAik0Dbk/aSPlX3IEZMU70ap0jtNWVHrTE4
	 wBoIsYprlCimRFIMsMxX97A4YFcr7lR1q9f7pgF/7Sexkg3UR/JWnV84fcZEQljG/b
	 LJaETlUEkcT2PBloe5A9lgOPUQlHd/NvpiSDNHnc3mXcG3V9FLQ99IXYBAJFbaduUG
	 I7K6qEPUbPP8A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44A0717E0EA9;
	Wed, 14 Oct 2026 03:03:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 04:03:14 +0300
Subject: [PATCH v3 7/9] drm/vc4: hdmi: Clamp CEC clock divider to its
 register field width
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-vc4-common-scramb-v3-7-c68d58d959a2@collabora.com>
References: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
In-Reply-To: <20261014-vc4-common-scramb-v3-0-c68d58d959a2@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2451ff85e759..0a95e14792e8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -231,9 +231,14 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 
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

