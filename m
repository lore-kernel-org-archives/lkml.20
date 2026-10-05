Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833864D4869;
	Mon,  5 Oct 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220552; cv=none; b=Z8nJ9rT0VIGuHLc8brewE7mBlbHPZpJL2F/fnv4zN/F2wz4kX/eNFahOyUjCGsmrMU1cSsSMzz/TVBbOzV/cW5SFOQ2SIdXObO0+h/bkwQc/INcX+u+Wt2XWWEwOXzXd3CxSKjkAfHkWCiSDx1kac5x4hZeI1p4efwl0j0gU6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220552; c=relaxed/simple;
	bh=gQlF5UTGmwmyfjuBZ/8d2dO31cTMLlAyXIh7EyYstJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNVwJ9HB40fVNlww43nIq7COGFgdGzfIr2CtZLOJ5VKICbOx+oomCaOo7qH78KZXkmvzmCwF0zOQxxGLw6JNVWKwF/762g67Ib/npJibWTctDo7z8d3KtkdsXdj4qIfWfAA+8WQRTjmgOsH2Q5dd/I3BeEaJWoWxYL7iWhxIS0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEiYOMNO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEiYOMNO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853EC1F00898;
	Mon,  5 Oct 2026 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220550;
	bh=CcoQHFm6kAxKnphQaH3IG5sbJZmOitJCh28rGpjCVbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DEiYOMNO9SezwTNmLBn91fmM6USKA+4tYBjvIa7hz6JMKejjB3b5yh+jmkPkdREpx
	 c5hXGfP69nHhtFwCuDhAGyXqlXRmcNZsO1FzcjkVvR2dcxQWOqYkAPAqfnxklOcuHd
	 sbAJD6miC/siLFz398nPxNNSOb2xbgght5eA1oYv4peu4bc2sT0NNU4yi9M4SIaw89
	 07cFyOMK1o/f+lpqsBz+sr7Emia6JEcfG/XcTgBK3H6ReWFjfbSZEQ6U6EtRzAtI0T
	 SDxiHupYSKrdQ7RrWf3vpmih8dzQc0M6gGIEAkgB47nXejAzIAwjjt3Xe8EiWDSDW2
	 iuIDMi0Sfs1xw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:33 +0200
Subject: [PATCH 03/74] media: uapi: v4l2-isp: Add extensible statistics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-3-ed985aefd611@kernel.org>
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
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9295; i=bod@kernel.org;
 h=from:subject:message-id; bh=L/cnRmJ0LnlxAtopn89GtIed460oO4nvBOV0eydhcrQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sCXOPxf/tJC/p3DaHRjbpuxXKDJ1oWMC4a1
 GwFRudB0B2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbAgAKCRAicTuzoY3I
 Ou9NEADAbn0qq/9OrQRdKxx43n3Um6aSAsMAJSslEW6YXW45v2VYycLk52AGX3jmHgV0FwEFAcY
 R/90nAlruXAlv64SxdQ3r12kqPnSJu668xAKD47/6i9cVf7mVJr/mtCfbw94N8lP5tvSgmXGSbW
 YCUkVqY/KVrJUPKfdzSp0Crjcz6qALt8C78FONonJn5e4oQCY1n2dMqU192PL+hihg31uAS0M/c
 oJfSI3OXjYCBj0PLtiBttkvP8sXEB9j1FNdrgXN3k72XIOYrA0DAdUTosSFL3DJgrh9F4BOZ7XG
 QPSEM4C1e8mjS6p9JWncTnlaS852ZnoWXinzhXypwISv5eS4qPFJQsyBlyrLLbF1JcnXXpv7q6N
 C8NB/FB3o3jngyiVXBir4RF2qntZb7jT5OY931EONw0522E4SeZXsOTUaUMwB90S5Df/4yz5QXY
 WtWyVrsgOUIm7f7dcMrKUWwCcuNY1NyyzXpXxTx9A46TlUnMDqtkfZKOdTrr9L8cGRhjPsoktb+
 tOHW/71P9dE85ambeoAn6AoLosU+SYjTbI0U0SVu/RyeAoSXEQzvPoBopDlnyFnlXenBjZyPXTc
 lUkxpqaPg5IL6uZ3abcMcYTREvWWzaCaRFBLAGxyeNtYL3XwqBhja3mhkpNsfD5rA0fuKITMJYo
 tv7CcdULM50MLhQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Antoine Bouyer <antoine.bouyer@nxp.com>

Extend the v4l2-isp extensible format introduced for isp parameters buffers
to the support buffers of ISP statistic.

Like for ISP configuration purpose, that will help supporting various ISP
hardware versions reporting different statistics data with less impact on
userspace.

Rename all 'v4l2_isp_params' types to generic 'v4l2_isp' types to
prepare to use them for statistics as well and maintain the existing
types for compatibility with existing userspace only.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Rework to remove 'v4l2_isp_stats' and unify types]
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/media/v4l2-isp.h | 125 +++++++++++++++++++++++-------------
 1 file changed, 79 insertions(+), 46 deletions(-)

diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
index 779168f9058e3..e4607e1217e1a 100644
--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -13,25 +13,33 @@
 #include <linux/types.h>
 
 /**
- * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ * enum v4l2_isp_version - V4L2 ISP serialization format versioning
  *
- * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
- *				(for compatibility)
- * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
+ *                       (for compatibility)
+ * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
  *
  * V0 and V1 are identical in order to support drivers compatible with the V4L2
- * ISP parameters format already upstreamed which use either 0 or 1 as their
- * versioning identifier. Both V0 and V1 refers to the first version of the
- * V4L2 ISP parameters format.
+ * ISP format already upstreamed which use either 0 or 1 as their versioning
+ * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
+ * serialization format.
  *
- * Future revisions of the V4L2 ISP parameters format should start from the
+ * Future revisions of the V4L2 ISP serialization format should start from the
  * value of 2.
  */
-enum v4l2_isp_params_version {
-	V4L2_ISP_PARAMS_VERSION_V0 = 0,
-	V4L2_ISP_PARAMS_VERSION_V1
+enum v4l2_isp_version {
+	V4L2_ISP_VERSION_V0 = 0,
+	V4L2_ISP_VERSION_V1
 };
 
+/*
+ * Compatibility with existing users of v4l2_isp_params which pre-date the
+ * introduction of v4l2_isp_stats.
+ */
+#define v4l2_isp_params_version			v4l2_isp_version
+#define V4L2_ISP_PARAMS_VERSION_V0		V4L2_ISP_VERSION_V0
+#define V4L2_ISP_PARAMS_VERSION_V1		V4L2_ISP_VERSION_V1
+
 #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
 #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
 
@@ -39,64 +47,89 @@ enum v4l2_isp_params_version {
  * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
  *
  * Driver-specific flags should be defined as:
- * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
- * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
  */
-#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)
 
 /**
- * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
- * @type: The parameters block type (driver-specific)
+ * struct v4l2_isp_block_header - V4L2 extensible block header
+ * @type: The parameters or statistics block type (driver-specific)
  * @flags: A bitmask of block flags (driver-specific)
- * @size: Size (in bytes) of the parameters block, including this header
+ * @size: Size (in bytes) of the block, including this header
  *
- * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data.
+ * This structure represents the common part of all the ISP configuration or
+ * statistic blocks. Each block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration or
+ * statistic data.
  *
  * The @type field is an ISP driver-specific value that identifies the block
- * type. The @size field specifies the size of the parameters block.
+ * type. The @size field specifies the size of the block, including this
+ * header.
  *
- * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
- * driver-specific flags specified by the driver header.
+ * The @flags field is a bitmask of per-block flags. If a block is used for
+ * configuration parameters this field can be a combination of
+ * V4L2_ISP_PARAMS_FL_* and driver-specific flags. If a block is used
+ * for statistics this fields is used to report optional
+ * driver-specific flags, if any.
  */
-struct v4l2_isp_params_block_header {
+struct v4l2_isp_block_header {
 	__u16 type;
 	__u16 flags;
 	__u32 size;
 } __attribute__((aligned(8)));
 
 /**
- * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
- * @version: The parameters buffer version (driver-specific)
- * @data_size: The configuration data effective size, excluding this header
- * @data: The configuration data
+ * v4l2_isp_params_block_header - V4L2 extensible parameters block header
+ *
+ * Compatibility with existing users of v4l2_isp_params_block_header
+ * which pre-date the introduction of v4l2_isp_block_header.
+ */
+#define v4l2_isp_params_block_header v4l2_isp_block_header
+
+/**
+ * struct v4l2_isp_buffer - V4L2 extensible buffer
+ * @version: The extensible buffer version (driver-specific)
+ * @data_size: The data effective size, excluding this header
+ * @data: The configuration or statistics data
  *
- * This structure contains the configuration parameters of the ISP algorithms,
- * serialized by userspace into a data buffer. Each configuration parameter
- * block is represented by a block-specific structure which contains a
- * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
- * populates the @data buffer with configuration parameters for the blocks that
- * it intends to configure. As a consequence, the data buffer effective size
- * changes according to the number of ISP blocks that userspace intends to
- * configure and is set by userspace in the @data_size field.
+ * This structure contains ISP configuration parameters or ISP hardware
+ * statistics serialized into a data buffer. Each block is represented by a
+ * block-specific structure which contains a :c:type:`v4l2_isp_block_header`
+ * entry as first member.
  *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace shall populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated version and return an error if the desired version is not
+ * When used for ISP parameters, userspace populates the @data buffer with
+ * configuration parameters for the blocks that it intends to configure. As a
+ * consequence, the data buffer effective size changes according to the number
+ * of ISP blocks that userspace intends to configure.
+ *
+ * When used to report ISP statistics, the driver populates the @data buffer
+ * with statistics for each supported measurement block.
+ *
+ * The buffer is versioned by the @version field to allow modifying
+ * and extending its definition. The writer shall populate the @version field
+ * to inform the reader about the version it intends to use. The reader will
+ * parse and handle the @data buffer according to the data layout specific to
+ * the indicated version and return an error if the desired version is not
  * supported.
  *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between. Userspace shall populate the @data_size field with the effective
- * size, in bytes, of the @data buffer.
+ * For each ISP block, a block-specific structure is appended to the @data
+ * buffer, one after the other without gaps in between. The writer shall
+ * populate the @data_size field with the effective size, in bytes, of the
+ * @data buffer.
  */
-struct v4l2_isp_params_buffer {
+struct v4l2_isp_buffer {
 	__u32 version;
 	__u32 data_size;
 	__u8 data[] __counted_by(data_size);
 };
 
+/**
+ * v4l2_isp_params_buffer - V4L2 extensible parameters compatibility
+ *
+ * Compatibility with existing users of v4l2_isp_params_buffer which
+ * pre-date the introduction of v4l2_isp_buffer.
+ */
+#define v4l2_isp_params_buffer v4l2_isp_buffer
+
 #endif /* _UAPI_V4L2_ISP_H_ */

-- 
2.55.0

