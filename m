Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367171;
	b=4d0jbMql5yBZ9teRQfvoC/sMvWGQbfqe2DwB2HfgC8Am06BdvOZRS7ZUYiz9V/a6PU1N
	 VCFqYoGAzK5q7tNVehFQ2BiHB0mIdDjQtwhd9vxZV2Rli08nyb3zp9KWESsfxvACFXd/W
	 AYKN6MvFWw2PDGI4XgIYJ5lKKC9kIOe+NDZ2TbsnNhXWSVhr6jE2rKbFGhY7O2aTCMIGO
	 SLJ3x4mKnt11PfeNlbSQC4gj30AN6sK+KINZBHy1c9fXrswvC3hrd0c0wT+OkXJz7vPUR
	 zSwb0d8WJgTLk8ZDCLeLeeeq4LG0o2vw7L/iJfVhY9akn/Kyne+8Cax/u8hpPAh48qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367171;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=blWJSzBMB8WKTWG2ZpYiDybe0NzG9j0jMGq3xbbxywI=;
	b=Nn09JzbzZD3CRgxBqMJ6tgwKGjggED5IP2Xa3/dKJBaYcRECM2aCLukoutuy8U2WFv2o
	 VwlFUljcQX/5KLuI/QSEp+okh7kDVu/ZlRL8bIXmdUD6VIF6xHf1oLsCmGr5LlR2eovQP
	 5HXvLkfmQKIJRBMf0az9XC1QWc+bJj+LNmpnEkNcRJ2c5RxLaSwVMn3Colbh0lKvD/1V6
	 1KebLgk4WL5Nrls2JrLpa9pm7vSCQxmrlkXsgFgCtUFF1Sa5TWDXVxm5tRxg+jeCTd2Ft
	 fDxyff4CIXH5e+QFuHisdDll+MBE8f9uv5SZD6Q5x1RQBPozzBZ++2viFWXJ7vj0oCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E1B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzl1nORq+UwHDA--.23464S3;
	Fri, 30 Oct 2026 21:32:40 +0800 (CST)
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
Subject: [PATCH RESEND 1/3] drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
Date: Fri, 30 Oct 2026 21:32:31 +0800
Message-ID: <20261030133233.197189-2-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAAXGzl1nORq+UwHDA--.23464S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw15uFWfGryxXrykZFW5KFg_yoW8GFy7pF
	42yFWUKr4rJ3yUtFyUtryvqFW3K3WxJ34Igr47Gws0vrnrtw1UuaykKF9xWFWDXrZ7G3yf
	KFsIkF4ayr1xA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjnXo7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

From: Joey Lu <a0987203069@gmail.com>

vs_primary_plane_atomic_disable() calls regmap_set_bits() on
VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
the primary plane on DC8200-family hardware actually leaves the
framebuffer enable bit instead of clearing it.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
[Icenowy: rebased on top of torvalds/master and reworked the commit
 message]
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 8e94491693019..d5563c3b825c3 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -88,8 +88,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_primary_plane_commit(dc, output);
 }
-- 
2.56.0

