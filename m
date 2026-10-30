Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367171;
	b=I8OFXCKgbLc6N/rBXMLfhIjTvPZRQKFIZO18IzjpudAtSAw09ERTl/euc+h6hPAEzwkT
	 4jUgDmuQBdO9o5imNLVp4kRLJXWd9gS+D6XKLECxJSQbOjSFsuzBwOtGqaaMGvB0r0njT
	 1PfxPLrbPREHFFDYBuZkEyITGnI65E8sHytyH0P1G96YBlNViiGU0kisQJlSaUXHzS00T
	 VG8WTkSBitGZ5bVBmp4eOT33aeghrcaFMzNiWZOCCjLfb3VQ37HL1ObKl3SH+46k7hH9H
	 vHft9h+JiauJLIkpfNFAXCLtZDdlj5FqzrbiaXJX3vS/1QNyEUm/aO0oTLgO1lgmuTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367171;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mo6zQ+d5gi81t+VsvqFGKcoAp05AmiPPeEZktM7erws=;
	b=LCL+4N2yF0CmvVE2KHWl32FF7PTQ1xkw0Wq31DHfYKtv2WZSAEKGrnMqvZLIUyQ3Gq0o
	 iDG6HCuE+lCPksI0FljwOvo2gZn4RvQEVo4jqSGD78x1XuhBw2oHaJY84Ejm854yE759/
	 9FrlJiIlxle+AOhBapnyq5cQyz03VL7YymJdFiw4GipYerzX8gpx5YlglT7AkdpnLf/Fo
	 F0Fcs9tiy5VhdImDh2lkf9UOhgaAZ/iM2VmFClDy5OlWniqfzWn7CDFSzfcFMLMOH3IDy
	 mvbZU5qzusW91CKDCus11YQSUCNFb0p4v/b7P2hhOMgkISDeSiV5rl9t9EZyA9WzgmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E6C606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzl1nORq+UwHDA--.23464S4;
	Fri, 30 Oct 2026 21:32:41 +0800 (CST)
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
Subject: [PATCH RESEND 2/3] drm/verisilicon: disable the output before enabling it
Date: Fri, 30 Oct 2026 21:32:32 +0800
Message-ID: <20261030133233.197189-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030133233.197189-1-zhengxingda@iscas.ac.cn>
References: <20261030133233.197189-1-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAAXGzl1nORq+UwHDA--.23464S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xtr4rWF1xtF15Ar1DKFg_yoW8XF4fpr
	4v9w4I9F4DJ34a9rZrCr4jgFyYq3WvgF4fGw1kuwsY9F12qr1DuFWUJ340vFZ8tFnrXr1a
	yr4xJrWxAr4kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUQXo7UUUUU=
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

