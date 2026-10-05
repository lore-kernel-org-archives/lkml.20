Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003944DA9CC;
	Mon,  5 Oct 2026 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220559; cv=none; b=AtP9RB9iFcXt9s5ANog6bbpGBvu+rydrixvs9MeC/v6kaJ6hWcT0Yd5HHfAS3l6UTFiFUWXoe1128KF3XLKZa2wJFfv2vJZBbM2xG79myA1vwvRT6LCzaQIb4+CWhkgeYacpvXFGBgWuxJnFxu4WO8qg3HGsTGmG/C6rcTveMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220559; c=relaxed/simple;
	bh=DR7ry/tmwcWmeeL+6RzyQQKsH0RqHhbZpC/HVPmj8M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQTK3gpH388Vl/sZpXFj+2p94Kd4+MyAg3cdvRL0Hgj9ZO7CSjFSGfrI5T3UxZ/0aiflbPtjFc9A1Y2mtbwYP+uOMFHQG69VK2UaTFJv0IfSjzKWgUpcDGruLhpOAh8fm421jdrxkON4fQivmDNdVbJOhk19vTHsr1G3vryzvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1chpFkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1chpFkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A01F00898;
	Mon,  5 Oct 2026 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220557;
	bh=ZMipKiabzUyjd0MIKe/T1CcLBZHpDXw9Z4aFxTFsCt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a1chpFkALvqfAclXPntBJ2p+Nc7lAQHdHgCaLylW/iIAzHK5BL3SvwNsOHtPRprXi
	 flGmMqyDhoXgP8Dm1za49enuIOhZBrAbAr4REVEOLSJq+2JLZ/j4asnnHhTx6om/SN
	 NkdvdQPJ7FPuRTXfv5DaKFUd2NQ8cAp4ReLqwYnTL1z21/JCVgd6mBw/+QYYVXu0kL
	 oOB8Ddd5vysvfbZquMOiABpdtPbg7ZPmkXl4taTirXTaR2ditcWgSqief7Q43rxBQV
	 GH920ecB8cUOEJhGc345pwF+eHhyhJCSVFdpW3k17YFFBUWuXe97JnFs5CIfq39koN
	 oIdN++7VrBaHA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:35 +0200
Subject: [PATCH 05/74] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-5-ed985aefd611@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4598; i=bod@kernel.org;
 h=from:subject:message-id; bh=lOP+I2985gaN142cTv2lJEjRtnQf+QdDtNU2uC+Jx74=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sELJSgHH4jzP7pU8R8SRywOQ169kMtSnykb
 EURlgoxmsuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbBAAKCRAicTuzoY3I
 Oj37EACaFxaWExwgDpVOl4qVEeQfFXuCZyzP4GAuF1cw3gBbmJiyE5TbEjb9fsZgX93e3NO+qdX
 tLcriRf+rffzqI2FajWig/KIpxy33zVKZylV/zl3GJF0l4d8xMzXyCXg/OjP1OCB5t5vlSCvLL0
 cnu9H1UiMXmBv1U0pZR0thBEgWapNjaPPBKo9kn3ESs+Em0voXsiuZWjjcbW9vhZ7zb7qH36urm
 WuMI7chThOhoX3ORygSlNa+20zIfYnROzdpk2VPkCkLbDuc/hgNCoscxV3G2HDB9a0gJQeAOBmL
 rQ5GslV8tHluITvBjaXMuhqxVaPa8CFHdpGwoJAjEHWzONCebSH90zAXbjTvbTLGYKECQo3Y1MW
 8rEITk+MqmsMTnnbmwh0JhGQ10D2DseHnIwJsycMzCmxJ7ydaN8MAQ9V8W0cCtqztYsTMQqgVO2
 TCGQzeKNkluG4JCNi/Z0biYhWkY40LID7FyvVbz+Iyhsdi7+me91dEaymAyamL2Oivp04p60CpV
 nrouJzBE0ZVCH9jGsSIEeO5aXEjJGfpMrFKYrF195YCMmw0RHrcFbbK1Yr8nABP+/SYGL2cKdgb
 431XJjJYdK3B/2Q4E91WLP+3PBcgwZo6+UnA6qW3T+qFGeG8JKMM1jPeLEl7mfHO/rJo2yWY6S0
 mZB8/2m/pHC0g3Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
support statistics.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------
 include/media/v4l2-isp.h                           | 22 +++++++++++++---------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index de0e9d898db7b..dc483f0322d6e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
 {
 	static const struct v4l2_meta_format mfmt = {
 		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
-		.buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
+		.buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
 	};
 
 	f->fmt.meta = mfmt;
@@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	if (*num_planes && *num_planes > 1)
 		return -EINVAL;
 
-	if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
+	if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
 		return -EINVAL;
 
 	*num_planes = 1;
 
 	if (!sizes[0])
-		sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
+		sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
 
 	return 0;
 }
@@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
 
-	buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
+	buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
 			       GFP_KERNEL);
 	if (!buf->config)
 		return -ENOMEM;
@@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	int ret;
 
 	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
-			v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 	if (ret)
 		return ret;
 
@@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	 * changed to the buffer content whilst the driver processes it.
 	 */
 
-	memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+	memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 
 	return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
 					       mali_c55_params_block_types_info,
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index f3a6d0edcb24c..d70ed6b431e7b 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -15,17 +15,21 @@ struct device;
 struct vb2_buffer;
 
 /**
- * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
- * @max_params_size: The total size of the ISP configuration blocks
+ * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
+ * @max_size: The total size of the ISP configuration or statistics blocks
+ *
+ * Users of v4l2-isp will have differing sized data arrays for parameters and
+ * statistics, depending on their specific blocks. Drivers need to be able to
+ * calculate the appropriate size of the buffer to accommodate all ISP blocks
+ * supported by the platform. This macro provides a convenient tool for the
+ * calculation.
+ *
+ * The intended users of this function are drivers initializing the size
+ * of their metadata (parameters and statistics) buffers.
  *
- * Users of the v4l2 extensible parameters will have differing sized data arrays
- * depending on their specific parameter buffers. Drivers and userspace will
- * need to be able to calculate the appropriate size of the struct to
- * accommodate all ISP configuration blocks provided by the platform.
- * This macro provides a convenient tool for the calculation.
  */
-#define v4l2_isp_params_buffer_size(max_params_size) \
-	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
+#define v4l2_isp_buffer_size(max_size)			\
+	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
 
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes

-- 
2.55.0

