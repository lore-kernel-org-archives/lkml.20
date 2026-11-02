Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606259;
	b=q/XLMVYwBTFUfj1tnnzsPNHSEt4pvBP5R1viK5XkK9WExjMs0WBHRCg0MqI/A+OQJcdg
	 5kPHZScAjy6H6VOLEgE91A3Dk7GYm1/+V0eTCMQI5RZYPNtZ9BVVLNMlvQJz2qwH4Nu6s
	 XTbPVfbqzQH4AtH2VoDpEOuyxpRvN4cD/tQ4grik1PO9tdBVoKOuy5ypVHrehLz2mY8GF
	 kHXia7U0P82FV+zBXtrvkYlsYEAtmh0vneJKOfKkuQuLlVsMK1hm4/+DnYrnHulhad5rS
	 aai9Bz7uMjXdZa7r6kfsFMEfU2jvb3pedmYD7gqGzGXD/iTZ06uZa02RhdbUiKehrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606259;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mo6zQ+d5gi81t+VsvqFGKcoAp05AmiPPeEZktM7erws=;
	b=ZOe/jxIyonqoXlhuvOwfSkQL7Eub2Y9S0bYACXO3hhuwmrjcKZ8OJJ9lIEW2iVomTyHs
	 Dbkmpm9DPetPPo2MnQThAifjtX/ypBusPVT4rAJb9Kr7XK2sTit9jiVY6TQMXna8ajXQ0
	 mUmwG0F2ZQe/LHVsW07wuW78O3FWiAZRVOFHxya7hX4YDHxM7YYB/PwWqBslA4/U6THW3
	 MCWwSiSrA5jVItoOnmEK/z8mVfcIUBnyY8oV8BBRTaMB4ceS5E9iJP8yujn58Ybpqubfy
	 yOBdBxWsMGlkBztnvO/AeXvbKNsmdeP1mQGafZPYpkr2v/4T7BpKxbweIYs0Dx6TPBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3785606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3785606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowADH8PpcQuhqxn0oAA--.14870S3;
	Mon, 02 Nov 2026 15:57:19 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Joey Lu <a0987203069@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 1/4] drm/verisilicon: disable the output before enabling it
Date: Mon,  2 Nov 2026 15:57:07 +0800
Message-ID: <20261102075710.1286456-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
References: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADH8PpcQuhqxn0oAA--.14870S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xtr4rWF1xtF15Ar1DKFg_yoW8XF4fpr
	4v9w4I9F4DJ34a9rZrCr4jgFyYq3WvgF4fGw1kuwsY9F12qr1DuFWUJ340vFZ8tFnrXr1a
	yr4xJrWxAr4kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JU2dgAUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

When either of the RUNNING bits are set, change to some timing
parameters won't take effect.

This will lead to failure of the first modeset done by the kernel, if
the bootloader sets a different mode and keeps the display running
before it.

Flip these RUNNING bits off before setting it on to fix this problem.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe32..a095b20e81c00 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -162,6 +162,14 @@ static void vs_bridge_enable_common(struct vs_crtc *crtc,
 			VSDC_DISP_PANEL_CONFIG_DE_EN |
 			VSDC_DISP_PANEL_CONFIG_DAT_EN |
 			VSDC_DISP_PANEL_CONFIG_CLK_EN);
+
+	/* Disable it first to prevent stale hardware state */
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
+			  VSDC_DISP_PANEL_START_RUNNING(output));
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			  VSDC_DISP_PANEL_CONFIG_RUNNING);
+
 	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
 			VSDC_DISP_PANEL_CONFIG_RUNNING);
 	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
-- 
2.56.0

