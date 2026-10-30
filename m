Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367174;
	b=F5KV7icYkj9QFzxPJXVwxJPWkUvmts/d8ZRS6UIHfNQu1Unm8NETHc0SXKgHnLaztyXr
	 wb2+0She+iyIQ4yzAGxUDVyUSqBGkDzJPbxLVu/lNMviVQsyOtnF5uOWOx7EadfKwfKp8
	 Ha5OyPmioKFGV2yq4+9Sv2pngynfbJBsjv+sUngGOzEHfDIX66RKMiuHBBQCm8zJAMRmj
	 lbTcqjd8cpJOvX/fgOj2OAP8IbqmC3c0VJE9uSUKhubiPXC0cN2BaYZ3LJMnd5kKakFwd
	 4qR/8XvhMppZ7KC1kfxDpdtNpZZYOQcoH5QQPzOSWTsOkTmAybngBk51LvEUeNM0Kqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367174;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=8/U8NgkgjiwIS1JwDLeRbyEH5Hqa66FffMFJyExcZ7I=;
	b=weKA900jyxoI9DJbv3SkJ2PulCz+2ND0NKG6KOntUpGfnksoyTHwxLpW4ve0lcCfB0DQ
	 s/kxJvYde/K/n3330YmMRruf0J3osDPo0fMEZN0y92bWsqECgHMxASpScKq5664w0kW0+
	 8sghuM3MF3nlSsxGK93cqJXKM2Aq7SeqzRiQNdPhfgp/gn3QPcR5mgDZSNYpmv8oQmnKx
	 7jXXkU/mztXEeT8yCRHhaXNdWsW11ahy28Zt9MCuHpfEHzZfQnFdtzaZWsg0kaRlYQlfg
	 HBDM08QwqOjO5jSKdwthRGgALBiJ+ps4gJGQTyjgnF369RIjEz5FJgCl8/oeUCQpJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE1606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BE1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzl1nORq+UwHDA--.23464S5;
	Fri, 30 Oct 2026 21:32:44 +0800 (CST)
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
Subject: [PATCH RESEND 3/3] drm/verisilicon: stop to reuse atomic_disable for invisible planes
Date: Fri, 30 Oct 2026 21:32:33 +0800
Message-ID: <20261030133233.197189-4-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAAXGzl1nORq+UwHDA--.23464S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGryxWFykAr18uF1UGFyfZwb_yoWrXr43pr
	4ayFy8Krs5XayvqF9rJr4DKFW3C3WxK34Igrs3G390vrn8twsrW3W8tF93uF4DJr97Ga1f
	tFsFkan8Ar40kFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
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
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

When a plane is configured to be invisible, the atomic_update
implementation currently just calls the atomic_disable function.

However these two functions behave differently when disabling planes:
atomic_update disables the plane specified in the NEW state, but
atomic_disable disables the plane specified in the OLD state, so this
shortcut may lead to NULL dereference if the old state doesn't have a
CRTC bound.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Fixes: 8c4ae2189125 ("drm: verisilicon: add support for cursor planes")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c  | 17 +++++++++++------
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 15 ++++++++++-----
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
index da456dced88aa..725921ac25d48 100644
--- a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
@@ -98,6 +98,15 @@ static void vs_cursor_plane_commit(struct vs_dc *dc, unsigned int output)
 			VSDC_CURSOR_CONFIG_IMG_UPDATE);
 }
 
+static void vs_cursor_plane_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
+			   VSDC_CURSOR_CONFIG_FMT_MASK,
+			   VSDC_CURSOR_CONFIG_FMT_OFF);
+
+	vs_cursor_plane_commit(dc, output);
+}
+
 static void vs_cursor_plane_atomic_enable(struct drm_plane *plane,
 					   struct drm_atomic_commit *atomic_state)
 {
@@ -125,11 +134,7 @@ static void vs_cursor_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
-			   VSDC_CURSOR_CONFIG_FMT_MASK,
-			   VSDC_CURSOR_CONFIG_FMT_OFF);
-
-	vs_cursor_plane_commit(dc, output);
+	vs_cursor_plane_disable(dc, output);
 }
 
 static void vs_cursor_plane_atomic_update(struct drm_plane *plane,
@@ -145,7 +150,7 @@ static void vs_cursor_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t dma_addr;
 
 	if (!state->visible) {
-		vs_cursor_plane_atomic_disable(plane, atomic_state);
+		vs_cursor_plane_disable(dc, output);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index d5563c3b825c3..594d56bf32410 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -59,6 +59,14 @@ static void vs_primary_plane_commit(struct vs_dc *dc, unsigned int output)
 			VSDC_FB_CONFIG_EX_COMMIT);
 }
 
+static void vs_primary_plane_disable(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
+
+	vs_primary_plane_commit(dc, output);
+}
+
 static void vs_primary_plane_atomic_enable(struct drm_plane *plane,
 					   struct drm_atomic_commit *atomic_state)
 {
@@ -88,10 +96,7 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			  VSDC_FB_CONFIG_EX_FB_EN);
-
-	vs_primary_plane_commit(dc, output);
+	vs_primary_plane_disable(dc, output);
 }
 
 static void vs_primary_plane_atomic_update(struct drm_plane *plane,
@@ -108,7 +113,7 @@ static void vs_primary_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t dma_addr;
 
 	if (!state->visible) {
-		vs_primary_plane_atomic_disable(plane, atomic_state);
+		vs_primary_plane_disable(dc, output);
 		return;
 	}
 
-- 
2.56.0

