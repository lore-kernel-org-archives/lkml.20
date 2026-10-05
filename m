Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7834EB86E;
	Mon,  5 Oct 2026 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220749; cv=none; b=W+Jg1X4/nv+6xuo4mF4eJpwL8qSwAVns+yFwr1ncXaUiRtMCK3vye+SSXj6Hje0EYSiAbf/Uvhc+XwXSW7qjg75HAx93Hns++xkVemns1pEu4vvnOTtsoWxBD9SddHDkua+yeNRy17mt29enEhlmaA8QyGccpMc0KHIRzUkwMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220749; c=relaxed/simple;
	bh=nbRktufOsR+eKbY7uYFKC8wsds6ZXohE4F76x91W4O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glRhB5pEmeU5RqnKH06Ui45xTGXv9Nyja9LomwcFYTBHHftOyhUNzQertZp+AeV+A2iffdHJRGDDnIfkcaTBC6DVagZ7nPpuq+Q1mRtwmfxfbp0/IVaqu3QE8rGQuWNYpl0NKd5BfAzbJR67lHq3rWybG8mvcxZYIfQ5gIzTJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJSxgspX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJSxgspX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE851F00893;
	Mon,  5 Oct 2026 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220747;
	bh=81gzir0vQEFs23wPmtjikfemxOCUMD8cVIqr7STcXxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RJSxgspXjFhWwKrILFNa2tRW0KZJSsiSMM29lxQG6ZQDoUIvPGX0ifm/9TZUyNmQw
	 h6FUD1ZKv8H/U6cuLydM9hZ9O6jB26UZ/IldhE7Sr3IDdSpXBPIKcMbzJOT947hNQJ
	 4JVCiFjokZNxvQx+itVveuPcWZWeybZrTr8SVxJ74fzXElprwo9hHhRTp9d5M2sKrE
	 ZvE7Fnh7aNDclm0lQsgENOF92TBJ8kVXK3NltNMzKyOzX3fI5tOXEdl1ARBMSZNBpW
	 VfmRfbDvvcTAww3kaxd35MxuqglBIVTpAAYM2TBOFSnufzRNeUYQrrgpX3/Ts3iwDP
	 2MdBAAIQOOoKA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:28 +0200
Subject: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887; i=bod@kernel.org;
 h=from:subject:message-id; bh=5GckFXGYaAvb8ttjZysPgjaMDVpUSauarpotKjKBV+E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sqQKX7nEmjuAg9AdvoqrlgozVVgPqrAPewN
 Ug2VaKwFPqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKgAKCRAicTuzoY3I
 On5wD/4ozT0VLiAuOTlG7TNP/ANdHDlziB6iytEQxXtvHOVbOwccJJBezM1vd7HZMLlQJ5ztwPH
 RK4TsLN6zWlE++RbarsAjPLDeg6EnMclkmicTPyky29uGC5EKddeLGJVROfED059DLkUTCUuIuE
 q6L4PLVRsKs4W6ba0tiqCSQ7uIONOIC0U8qMCjJW0Lk0H0awQUTu4lVt792zZo5dtcGamqrtpRi
 5rOEOgTImNn3s9dFkht4EG6L/2FqELj9mp/+VbSvsIrpZBzZJvSZE/xleWp1UDelSbhyzZxluyO
 O47dPNijLKTajBMDEhtcxm1q1ZG1tc4iBqzAC+oygtK2COnzk/yy22hP7kmJJ0rsN6AX8lG8ZAI
 pueCY0xjUl31dpuc4hETp8b6cLz/WFiV6tLEnFTKj5+ya6BVUzPUc2QfThu230fGt07z/QlSCKg
 6b2W9yufLVJgFi+DFC4SQ5oZPkbzum3xuf5z5mdDDAeRLnAA/enV/WR9JzNAqeWlxM8Zf4b1K+4
 ZrmvBAqyr0nm7X+LtDFWWCP/QOoPkqnsFczziQcrbMyNK1wTLOfNPwTBvgSvJ0gtyiPl4d0/BnP
 0NTmYjGPNuN/5ZuPnuZYJ2r6DOUF1C4sYCgUJLAHl9kkdf2N8efQLifl1FQRnot5ac1UTHWDJcp
 bHrgP9ygN4cNPyA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add V4L2_META_FMT_QCOM_ISP_STATS, the statistics counterpart of the CAMSS
ISP parameters. Statistics use the v4l2-isp extensible format: the driver
serialises one block per statistics engine into a struct v4l2_isp_buffer,
each block embedding a struct v4l2_isp_block_header with a type from
enum camss_stats_block_type.

The first block is the AEC Bayer histogram, CAMSS_STATS_AEC_BHIST:
1024 bins counting the luma of each 2x2 Bayer quad in the histogram's
region.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c   |  1 +
 include/uapi/linux/qcom-camss-config.h | 33 +++++++++++++++++++++++++++++++++
 include/uapi/linux/videodev2.h         |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c3..e5eccb62e76b2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_STATS:	descr = "Qualcomm CAMSS ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
index aa3d97cfcc78e..23c12b8955ef6 100644
--- a/include/uapi/linux/qcom-camss-config.h
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -209,4 +209,37 @@ struct camss_params_gamma {
 	 sizeof(struct camss_params_color_correct)	+\
 	 sizeof(struct camss_params_gamma))
 
+/**
+ * enum camss_stats_block_type - CAMSS ISP statistics block identifiers
+ *
+ * Each value identifies one statistics block in a
+ * V4L2_META_FMT_QCOM_ISP_STATS buffer. The value is placed in the @type field
+ * of &struct v4l2_isp_block_header.
+ *
+ * @CAMSS_STATS_AEC_BHIST: AEC Bayer histogram, &struct camss_stats_bhist
+ */
+enum camss_stats_block_type {
+	CAMSS_STATS_AEC_BHIST = 1,
+};
+
+/* Number of bins in a Bayer histogram. */
+#define CAMSS_STATS_BHIST_BINS	1024
+
+/**
+ * struct camss_stats_bhist - Bayer histogram
+ *
+ * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
+ * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
+ * whose luma falls outside the input range are not counted.
+ *
+ * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
+ * @bins:   number of quads per bin
+ */
+struct camss_stats_bhist {
+	struct v4l2_isp_block_header header;
+	__u32 bins[CAMSS_STATS_BHIST_BINS];
+} __attribute__((aligned(8)));
+
+#define CAMSS_STATS_MAX_PAYLOAD		sizeof(struct camss_stats_bhist)
+
 #endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc1..700ea9b646979 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_STATS	v4l2_fourcc('Q', 'C', 'I', 'S') /* Qualcomm CAMSS ISP Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.55.0

