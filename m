Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49612522698;
	Mon,  5 Oct 2026 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220735; cv=none; b=dCSHYIqSvklHMu/AVrh/3pPXFa7d/1kiHJ2pw08ZrAzVV21eWbms2/cqDCL8rjPCvJK3/AKDdHPRYzntl1Vfk6QACky4I+s0xnsXCpult88lMiwxBj3jCcFbyZMp5zkMbq4u8uWc1YEuk93+cGi/z7LGoOUmlV8R96voNpaiYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220735; c=relaxed/simple;
	bh=fCvjxCJcdveIl0NVXqCQT2quwuk/jIufo+x10nHbZNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZY/mch6qR/6Cnh6CLXRRqZTfhYvkyYuFxtursSEeNfPdhk46sXY31xJKcLx9ic4E6QRDAdqmVT6pPTqZqPp5puSk6pibvP2k9HevMAmexDPcsn47ITEB1UZRdmrZLCB/77hJdPHT7E/DMV1bFH/cl80GefPkvMGkC952KKXE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsygoQM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsygoQM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EAC1F00893;
	Mon,  5 Oct 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220734;
	bh=+V5BwiU8e3bYrhDhdZYtzfmlO7XXqxlSOsRknVCR/M8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lsygoQM9l4Nm/0wpxwFKLPd38sF2VWMGBjMGtAd5NhnvMXD487OjG6zGLYXX30rQP
	 atwNWkejV5xRk2Vnp//mLSjR+MRjjvZ6GF9Mimbkmkykig1RuwPWh3pfLqey1Z/b+t
	 Od3nEt2NGqxHrlbA7E37yp7K9JP4QHei39kT0e8U6onlanFX7JtL//JiBn/GXGIuUf
	 wBOm5tVevUTs+qiKx8MQVSxlqC64PFA0qobqM5+7MeLIQHS5j1fVR7X8LiDclB71+A
	 3dWXkbfl1QlxyqF+c+zGLxobwDgIjSqar5YQNrmWOZYBckPHHFx+DRn4STpHwOlDJ0
	 spXrxWb5MBfJQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:24 +0200
Subject: [PATCH 54/74] media: qcom: camss: vfe-880: Program the pixel pipe
 outside output_lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-54-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3283; i=bod@kernel.org;
 h=from:subject:message-id; bh=fCvjxCJcdveIl0NVXqCQT2quwuk/jIufo+x10nHbZNg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9snMd8TDtsAIpsrSp95Pa/ZcZ6ZGU1NRjapQ
 uEe/ONptoKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbJwAKCRAicTuzoY3I
 Og+2D/4xbNJWrEj445CCGa8y/l++uvR9HzildDGg5OyKzHYs2TFl/JBOmDwsQAYTQC1y5rAjZnJ
 gO5TVcO7AK7kGXIcAnrwJQOl952ggOLZX7TMTuH0US2Gf8+hZKY0KviCVMtkO3g5jY3GJqdxc2w
 mBu7isYu2bfExJzTj/v6pzfr03FScPbgdMXnIetIULPsKsHAUycvnP1kVZsfWu/6Zlzcs37GgXt
 kVAp1GTNmZ2TCAyHDBzh2ALCK2wugexvxPHzCpccMlyXgdDiX3/aD5VRZV57c5Bz2tSzFjXAyuF
 jxAcN8U9XbFG8Is/jZnmqKMonNYCKc/Bodd7f4y1/TVZaDhKOF3Je6kG6nv/AyBl2yWeF8feOE7
 zEVbDXy0wQ24vrb0qlOoA2Xv0GdEdcUamAxLkxWg6JEEDkpCmLuqqogtiYL8CEczH/YE710UY8J
 CA0kNYEoOOQkyfC6F3vpDqpV1Xzq3rH5J94vKRBJeIuX/wMjyRpLCAMPXWbxkaE+Pa1IorVEsP1
 gsCSF2R6zwB8U+w/J92guDUHRHZ1+f8rwZBN1GbkONt7tcEmUFlsDo9bnmvsfi9TkGQN8F9XN8p
 5L3QiGj+wW0HoZibnN1N/KxFMEXDVTwQo6zNvg1KIVSCd7wNRyM6yl393/eyY4SRzrYoH0cz4Rh
 ZweyGEq3hJ/IHuQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

vfe_wm_start() runs from vfe_enable_output_v2() with output_lock held
and interrupts disabled. Calling vfe_880_setup_pixel_pipe() from there
put about 3.3k register writes in that window on every STREAMON, most
of them gamma, BHIST and downscaler table uploads.

Add an optional vfe_line_prepare() hw op. vfe_enable_v2() calls it once
vfe_get_output_v2() has reserved the line's outputs and before
vfe_enable_output_v2() takes the lock. vfe-880 uses it to program the
NV12 pixel pipe.

The ordering is unchanged: the pipe is still written before the write
masters and before the IPP reg update that latches both, and the CSID
still resumes the IPP afterwards. Doing it after the reservation means
a line whose outputs are busy fails without touching a pipe that might
be in use.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.c        | 3 +++
 drivers/media/platform/qcom/camss/camss-vfe.h        | 7 +++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index 8f56e584b180b..a4bccedb4a2f1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -593,7 +593,7 @@ static void vfe_setup_ds16(struct vfe_device *vfe, u32 w, u32 h)
 	writel_relaxed(0x000003ff, vfe->base + IFE_CROP_RND_CLAMP_POST_DOWNSCALE_4TO1_C_VID_DS16_OUT_CH2_CLAMP_MAX);
 }
 
-/* Called from vfe_wm_start() for NV12, ahead of the write masters and the IPP reg update */
+/* Called from vfe_line_prepare() for NV12, ahead of the write masters and the IPP reg update */
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, u32 w, u32 h)
 {
 	vfe_setup_core_config(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fbc2068b301bc..82a23be7cae9c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -821,6 +821,9 @@ int vfe_enable_v2(struct vfe_line *line)
 	if (ret < 0)
 		goto error_get_output;
 
+	if (ops->vfe_line_prepare)
+		ops->vfe_line_prepare(line);
+
 	ret = vfe_enable_output_v2(line);
 	if (ret < 0)
 		goto error_enable_output;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 0b632479cefc6..318b025702007 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -188,6 +188,13 @@ struct vfe_hw_ops {
 	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			      struct vfe_line *line);
 
+	/*
+	 * Optional: program line-level hardware once the line's outputs are
+	 * reserved, outside output_lock. Runs before vfe_wm_start() and the
+	 * reg update that latches it.
+	 */
+	void (*vfe_line_prepare)(struct vfe_line *line);
+
 	/* Output based API - new and shiny */
 	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
 	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);

-- 
2.55.0

