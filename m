Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF355328A6;
	Mon,  5 Oct 2026 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220780; cv=none; b=K7L/TS5mv8eFINok4lTn1rk35j6g166aLueoUXKOezKCyvwZIYTbWpUm19f+nvgZ4m2MkPKieYV9r9ZI/GumieSbwIkNsrSfw8IyAKtncMYI0R+I/3mBgXcaMKz4ZRJGuzTdst6FGOixTb0VyBWQlaLam4CvYV+rIDvzPaRC1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220780; c=relaxed/simple;
	bh=0OuZd4A3zKBQZzTr5ODnnDBzCLQDAS3YOZMu1s/QqqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QueAUQKvvYeh2oTdS+K2mRpn+hI1asPzgYRDL/WFHe6WsNUvbmyFGu9+uO8Tl/SVxu4XicrtvmjF/dGGgZBD1hQjw8oMKtKJSw8UnKLeLRP61Gaz/qICPCDL77iGt+i6Vs1QxAWQjsXnQUenZGYQfdPkxGNBvDCtUxELD8nlr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxD6hCG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxD6hCG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199211F00898;
	Mon,  5 Oct 2026 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220779;
	bh=mDbH6eGUCwa1mw8yviLJJtin1dZCnZoaHNJK1kLO4/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XxD6hCG81ooQUOdZ0A5H2ksdRAmVFxwMMZ+WtwXtIRLqb2PcakM9+u8wPXhLxhV4k
	 pTf4Bb0xlyUEiPc3cxKyMVsEG1SoLYO6WeJ3ScqfxfVklte/5qrMjwQP5qjdaAdQcm
	 5yCpttiIQvP2oVOMgrXasFKxueUeseZOHkpS6lHai+pQsJFzvncAhwOq/CBtWqzptA
	 Z5m/BiOv48Kxme3zvIcXZQm5NA60EdaDcRXvHj3Xrckxlf/I4v+F5cxDIo8/jvNQON
	 tNdOHDbBXgceRrzevyKnaznvNT2JBi5CcozL31+PAF7sePifYh+YNnyQPwwHz8oUJD
	 90S7uyvPcy9KQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:37 +0200
Subject: [PATCH 67/74] media: uapi: Add the CAMSS AEC Bayer histogram
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-67-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460; i=bod@kernel.org;
 h=from:subject:message-id; bh=ICKYJcViaWHZNH72Dhlk3sgLpPxcT8kb6/67sYWbqKM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9swYijzgkwBO1NmNJPWBtqM/pc8JRAJPTcBq
 m+AaTvrSDOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbMAAKCRAicTuzoY3I
 OnB9D/0XFKa0PDQgQ/PyEmQbd1ll+21bTI33nzB5Ox1GGD2cePgYrGfFPNFjIdGN8tUStEj3aC/
 ZD5Cs97105aitddXwdioPN5gmRTXWR3Dl8gFxqeEO118al2vq0NcgzcGnJb9jFQFDDweQRu2bMG
 vw0IHXfubdFlMNtCY5WKstkKkUiUAM82k0GaUjJ1BDKcDvmbhUQanFP05YbbYqeFEfMFYxk7cNA
 5DJpoODavrb8X5KNLUxPFy6nAHsaCb1zUUe0DAtN63A+e3lca7xRMeuY76TTFyF7LSRtxIVMQN0
 yOw3zJmOA7qyQUCXIGzRSb5zpeqFSyj70DoE4QShdFzbIxcujRlOuJH/7saAqLnqehNv7gVoPms
 vnaqwkqv+lxOyY+aTvtTzC0uJo41uVsnDR8pMjtsuZS569Gps09H4blCnC5sD+MvuGp2tjSYbrt
 IdSAJEplLalzuqz0s844KeLuvaaQbCN7PRmcHiWmHNKEKNddjP61ARxYt17jadmD7VDbO+nGRWD
 9TuzB+E1w3VfHbQHz5SzCW3B6Nyw+5DR7aPAeGt15FUcgMSGsarWFCRHBKiInG2ueC2egcGhpMG
 Iq9bGgZk6FPs49Zsk6rgQpRbkEp7LQSsT5toZsu3xRnhF0b3biIf7+d+FtFNFVh/Skw9igO+Paa
 RzBSXLte4RehGPA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add CAMSS_PARAMS_AEC_BHIST, a V4L2_META_FMT_QCOM_ISP_PARAMS block which
selects the region of the frame the AEC Bayer histogram statistics,
CAMSS_STATS_AEC_BHIST, count. The region is given in pixels of the Bayer
frame entering the ISP, in even values, and is clipped to the frame.

CAMSS_PARAMS_IFE_MAX_PAYLOAD sizes the parameters buffer of the IFE
pixel path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 include/uapi/linux/qcom-camss-config.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
index 23c12b8955ef6..8abd7d262b73c 100644
--- a/include/uapi/linux/qcom-camss-config.h
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -25,12 +25,15 @@
  *	&struct camss_params_color_correct
  * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
  *	&struct camss_params_gamma
+ * @CAMSS_PARAMS_AEC_BHIST: region of the AEC Bayer histogram statistics,
+ *	&struct camss_params_aec_bhist
  */
 enum camss_params_block_type {
 	CAMSS_PARAMS_WB_GAIN = 1,
 	CAMSS_PARAMS_CHROMA_ENHAN = 2,
 	CAMSS_PARAMS_COLOR_CORRECT = 3,
 	CAMSS_PARAMS_GAMMA = 4,
+	CAMSS_PARAMS_AEC_BHIST = 5,
 };
 
 /* Number of entries in each gamma channel LUT. */
@@ -209,6 +212,31 @@ struct camss_params_gamma {
 	 sizeof(struct camss_params_color_correct)	+\
 	 sizeof(struct camss_params_gamma))
 
+/**
+ * struct camss_params_aec_bhist - AEC Bayer histogram configuration
+ *
+ * Selects the region of the frame the AEC Bayer histogram,
+ * &struct camss_stats_bhist, counts. The region is given in pixels of the
+ * Bayer frame entering the ISP; every value must be even, as the histogram
+ * counts 2x2 Bayer quads. A region reaching past the frame is clipped to it.
+ *
+ * @header: block header; @header.type = CAMSS_PARAMS_AEC_BHIST
+ * @left:   horizontal offset of the region
+ * @top:    vertical offset of the region
+ * @width:  width of the region, at least 2
+ * @height: height of the region, at least 2
+ */
+struct camss_params_aec_bhist {
+	struct v4l2_isp_params_block_header header;
+	__u16 left;
+	__u16 top;
+	__u16 width;
+	__u16 height;
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_IFE_MAX_PAYLOAD		\
+	sizeof(struct camss_params_aec_bhist)
+
 /**
  * enum camss_stats_block_type - CAMSS ISP statistics block identifiers
  *

-- 
2.55.0

