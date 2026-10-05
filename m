Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3E51617A;
	Mon,  5 Oct 2026 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220693; cv=none; b=RoXaD6phI3EIxooELWiyKJVh5eA6N705iohIyVa7aoFZe1P9C0DMoFvkn67Z9rAJsw3a1Ku2EEU2KQPKRbT8Lokvjw2uxYD48RivKtXR9Uo70ABOMI1pxl0cClQfgebhAkMopZ6wUE0qK+YHYAZa+TyOdKGItXsMWHnQnxjTcsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220693; c=relaxed/simple;
	bh=/48pz9ifYpS7sUpf81y2dJfKblbGvFmMWsk13Sptd4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knWwl9KbmGZPjRZBVv42bU8HCmz5sXJi46AaseYrfN93Vp2UgoB/XjjLl7lKz11KqbYSxDb4Hguz5Zx+RaQomLMdoNx9kxP3XTSwdk0eQ0jTcj+MqMjg9B3w5nz9YuL3jsmm1fPLcldUMCh+l6cfG34GBfzwbqy0vuaLW4yh+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR8D0cvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR8D0cvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9278A1F00893;
	Mon,  5 Oct 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220691;
	bh=WjDHlDZYRsBhLVl6vDQWpOMlMz8DqKvI2isZ4O9TvU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aR8D0cvLB/XF8ZxwIJESp2oeVUWNBn++fXvc9UD2j6JqlSry1XYmYkHkHJxeZi/V1
	 vtjGl8bDqQ/W90A9vkwcvn/2vLGcXMbUrzEB/veXyJi650klJn6dR/LDZHMwu4aQd0
	 Lxt4LELtSRpEeex9l3xN18IggPK+L1pseIq8uB2Wf7bPIHX4BM5GesaSwrKOWnV1hI
	 kxt89eUE8gC7iMhLegFRm8gnVNUoL0v7k+jGGjeZ8vVfvXDBHqqQEAYUcHphhqiRqQ
	 TKkSt/NzESU2XHfn01N1CldKoceSPkyZVdRX0YPYXye9n6qzo0cC1EhymNQXNiF2d5
	 DjtdZisaNNxPg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:12 +0200
Subject: [PATCH 42/74] media: qcom: camss: vfe: Pass struct line to wm_stop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-42-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6087; i=bod@kernel.org;
 h=from:subject:message-id; bh=/48pz9ifYpS7sUpf81y2dJfKblbGvFmMWsk13Sptd4Y=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9segKOVVrW1XVd7mTlGYgRuLSP1gCa03LD/w
 D99MuxXcMyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbHgAKCRAicTuzoY3I
 OsCLD/40F5Mp+IFo3nMbXYDpD6L/Ae/6CWvUnk/Sn8bll0nM0yOD1BKqUnT/sXGBRTd49na3yDT
 69KbHQH8JjX92KCmoTMh2gVHijnLQjAS2e8hVsx+KZra2ZGNJpHRfEr1jTEQ0KJ4KkXwpfFNrXl
 7E6EddtdG2ms5+jL9RW7kXitevw2SNdiHgOABC2YoCCuDjXaoSLDLCuBqvSGieyyoLMk0c5waJl
 G+hqquvJ/cKWGl5DsTl8yEv7Ybd/hP+YL1m+SN3RX7lKvf4OvS3YXhCvlHBnNvimgf5ZhJ8Bbl1
 5CvVHQyIhIYo2Kd3w6vEceav9UZD/PnGc5p5FFUJc7zuLG+TPRkj3JCB4P/mZLu516YLZG0+uVM
 OpaFKObXjpfWTvajCL8kFTD3hcHt6yNuhUAVYjb+2++pFfDFpF+9sE6wy8g8WhYnahsgKwdGMKQ
 MMvUd2zpFL8eYoOqj5SMYG6XylzwaHSJwmrvL78lSxRDDeAo+oYnBAaRtOm4Niaq+MBXs2Mjhs0
 614ydNGYtr/6ZBbjkYO79HpuT8n4pawiwSlLp/qip8sdS5EbXkR3vdIB5U06kFHFeuWkBGPHxsx
 6JO0QbWmu2293qN5BP446MvOqMlXOuWv6zS+SckLZFVMNoAjPJU+nLiYxq8iRX1WEbEhwQHOpVm
 SiEAhj9sxOpqN0A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Passing the write-master is a function of being tied to RDI ports - almost
everywhere we pass wm we mean to pass line. Amend wm_stop to take the
struct line it needs to take. Once we get done converting all of the VFEs
to the new interface we can dispense with passing WM.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-680.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-690.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c     | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h     | 3 ++-
 8 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 8cb0c028a3bce..52812d34530d6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -247,7 +247,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(val, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	/* Disable WM */
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 6edbfcf766dad..87f3e8f2ff539 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -335,7 +335,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 		vfe->id, client, pix->width, pix->height, stride);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	u8 client = tfe_wm_client_map[wm];
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 73bfb53266c3e..6edbd8119aa7d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -127,7 +127,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 		       vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index c002ff126135a..d9a6402e8d928 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -193,7 +193,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
 		rdi, wm, pix->width, pix->height, stride);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
 {
 	u8 wm = RDI_WM(rdi);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
index 88dc902dd30dd..fb40560d4ab41 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-690.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
@@ -90,7 +90,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	wm = RDI_WM(wm);
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 32b6565aa91df..93f7c7a8e33f7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -122,7 +122,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	wm = RDI_WM(wm);
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 926cb7559f78e..e57590b417f3d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1012,7 +1012,7 @@ static int vfe_disable_output(struct vfe_line *line)
 		ops->vfe_output_stop(vfe, output);
 	else
 		for (i = 0; i < output->wm_num; i++)
-			ops->vfe_wm_stop(vfe, output->wm[i].bus_client);
+			ops->vfe_wm_stop(vfe, output->wm[i].bus_client, line);
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 8fee26a0dc2e6..b84b324940b64 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -175,7 +175,8 @@ struct vfe_hw_ops {
 	/* RDI based API - deprecated */
 	void (*vfe_wm_start)(struct vfe_device *vfe, u8 wm,
 			     struct vfe_line *line);
-	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
+	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm,
+			    struct vfe_line *line);
 	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
 	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
 			      struct vfe_line *line);

-- 
2.55.0

