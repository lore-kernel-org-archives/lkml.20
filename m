Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99B4DE703;
	Mon,  5 Oct 2026 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220571; cv=none; b=oP85LjD15GeXZ+BlU//o+etCCzeD81Zwcr3+cTmZlH12JPtjyEcECcr1KcDWjJ7WIBwN1pp8D9TR1Cc/EAFzRSYyyptnWsTP1J7S3WJZ4gA1c23CT4nnIJXdAabYcdTCTO4DGt4K4lA5aJm+JPVcfBHlWKuIBNBUH/zgKqczKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220571; c=relaxed/simple;
	bh=/bDROl31ZOu4ZAkNPr9X7hSSUjdT/lqHVbuXi1/dQRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUCkDHbohuj9XwXYgEVvNMj/morD3M9Qm3fiV3LfWaWaTnrROfRB7cUnBy6ESlmeljKDeZ8Q358qJtYS+hL4h12Mpz1Y6eGLzu4/GwFLYLe56XYj5C55jTzYtjPXdlilm+PHgbPJq38m97wOGMWxhDgZHH7N8qY+1Tvc1qDcJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuC3Rpj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuC3Rpj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388991F0089F;
	Mon,  5 Oct 2026 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220569;
	bh=1Iehp3badLZaogc97MFKOqOzR7CIbjRz4JqByesx0yI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kuC3Rpj2lwmdNf+yKGpMqCXagu6L1mRzQk4KCD9af9uL1FMB6ccYBD/NyYbNDGWBc
	 YpmvSBYwJAy9OWA7CsMQvZTD/5QDts5vMCYBYKrJWgy0b34lbV+8QO1aKXdb27eIEj
	 hukhCz0HQlsA4++GjijkU3Jfu3ViFoifVTROUmANRAYBSBVtzgdGMdr/c2HjKYCidt
	 k7zBLvPm8k0Og7axdVUlK1zv1q7IG9ZqZYQky4JGRRQiqAHS3Af38O9N8z7gjW9Ib4
	 FZEb5icu3Z+cvm7RFufH6TKR4d9bMM/uLg23ngb98LW7A4TuRgkgmYw38Qf7AuOwi8
	 SW8ZmlmTLIDbw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:38 +0200
Subject: [PATCH 08/74] media: v4l2-isp: Add helpers for stats buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-8-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6380; i=bod@kernel.org;
 h=from:subject:message-id; bh=jYs5ViBHdotKwohodaY9rP7HJb/Z9JWB6awc1s02coc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sGYXtVQryu/7QzNzgJryrCnztWgH6z+FTDb
 PVTpxmY3BuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbBgAKCRAicTuzoY3I
 OqT2D/oDLAuBau9hjY07ApTFZdOpQX6Ls81+Lkxmnz4RUmZderpH7lb1I6QaJZmP6lwcON8LyHj
 izP9KZzaC786ldFTw3V7uhUT6mfofZ5TkgerfHHDJEAsXxeuS5sESHMbhrSD9K/59iQdrREuAwL
 rHbCEYqY2RH8d2wT+7ZGPcLJvhsww9xd3ZfeVBaDjg+9edRTJ91gTq7wlXLHDMpzFMROf/GOcjU
 mLlAMJbGif7q1zvVJzzVmylvDU7Y1MvGnS670KvH3ao980/wFP4nDF7AdcyEvebLYOW9O4cCnKW
 EjayoBXYT8Kd5hd3/dBLnukbzV/PFlFmB5U6HOPmiuFcebYODD+gki2UaLXYL6C56prRbfTv4qF
 VY+PE/s3oLSfOjovLAGSpW5v67ioOfOAH/Xdm8YOsK2k0qjhn4xaEqCydbNeUrHeRp7C4eysmf7
 QJbKr8brKezuxHu+pXh9lVCEMqcLInqey3t+QpFkppdTuSGw3jHeR0yEgubun7I1RTM5qVM93k5
 8//z9mv1Tquh4gG3ptxfpNtjc7Fz+HitFvkLa8igNNG3s2oo8MuILGQKmT5OI34rMeelQU7xpPs
 ZyIQTxVaVJv5TttblUTuApsf2LvhKhsTg52HHg5UF1AIBVJco8tIRAWlNdTIDRvC5Isu2E3BGSS
 8ZHXFG/Y0+YEXgg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Add two helper functions to v4l2-isp to handle statistics:

- v4l2_isp_stats_init_buffer() to initialize a statistics buffer
- v4l2_isp_stats_init_block() to initialize a statistics block in the
  next available memory location of a buffer

The v4l2_isp_stats_init_buffer() resets the data size counter of the
buffer and initializes its 'version' field.

The v4l2_isp_stats_init_block() helper accepts the type of the stats
block about to be populated, an array of per-block-type information and
the maximum size of the v4l2-isp buffer. If enough space for the new
block is available, the function increments the
v4l2_isp_buffer.data_size counter, initializes the new stats block
header and returns a pointer to the block for the driver to populate it.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 52 +++++++++++++++++++++++++++++++++
 include/media/v4l2-isp.h           | 59 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index f497471e9f18f..1eb46e080afa1 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -130,6 +130,58 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 }
 EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
 
+void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
+				enum v4l2_isp_version version)
+{
+	if (WARN_ON(!buf))
+		return;
+
+	if (WARN_ON(version > V4L2_ISP_VERSION_V1))
+		return;
+
+	buf->version = version;
+	buf->data_size = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_buffer);
+
+struct v4l2_isp_block_header *
+v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
+			  const struct v4l2_isp_stats_block_type_info *type_info,
+			  size_t num_block_types, unsigned int block_type,
+			  size_t max_size)
+{
+	const struct v4l2_isp_stats_block_type_info *block_info;
+	struct v4l2_isp_block_header *header;
+	size_t used;
+
+	if (WARN_ON(!dev || !buf || !type_info))
+		return ERR_PTR(-EINVAL);
+
+	if (block_type >= num_block_types) {
+		dev_err(dev, "Invalid block type %u\n", block_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	block_info = &type_info[block_type];
+	used = buf->data_size;
+
+	if (used + block_info->size > max_size) {
+		dev_err(dev, "No space for stats block type %u of size %zu\n",
+			block_type, block_info->size);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	buf->data_size += block_info->size;
+
+	header = (struct v4l2_isp_block_header *)&buf->data[used];
+	header->type = block_type;
+	header->size = block_info->size;
+	header->flags = 0;
+
+	return header;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_block);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com");
 MODULE_DESCRIPTION("V4L2 generic ISP parameters and statistics helpers");
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 1f35a52f978a1..7a54cf98c79af 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -53,7 +53,7 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 					 size_t max_size);
 
 /**
- * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
+ * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
  * @size: the block type expected size
  * @block_validate: driver's callback to implement per-block validation
  *
@@ -97,4 +97,61 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 				    const struct v4l2_isp_params_block_type_info *type_info,
 				    size_t num_block_types);
 
+/**
+ * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info
+ * @size: the block type expected size
+ *
+ * The v4l2_isp_stats_block_type_info collects information of the ISP
+ * statistics block types for validation purposes. It currently only contains
+ * the expected block size.
+ *
+ * Drivers shall prepare a list of statistics block type info, indexed by block
+ * type, one for each supported ISP statistics block type and correctly populate
+ * them with the expected block size.
+ */
+struct v4l2_isp_stats_block_type_info {
+	size_t size;
+};
+
+/**
+ * v4l2_isp_stats_init_buffer - Initialize a statistics buffer
+ *
+ * Initialize a buffer of statistics. Only set the 'version' field and reset
+ * 'data_size' to 0.
+ *
+ * @buf: the v4l2_isp_buffer to initialize
+ * @version: the v4l2-isp serialization format version used by the driver
+ */
+void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
+				enum v4l2_isp_version version);
+
+/**
+ * v4l2_isp_stats_init_block - Create and initialize a new block in a statistics
+ *			       buffer
+ * @dev: the driver's device pointer
+ * @buf: the v4l2_isp_buffer where statistics are serialized
+ * @type_info: the array of per-block-type validation info
+ * @num_block_types: the number of block types in the type_info array
+ * @block_type: the type of the statistics block to initialize
+ * @max_size: the maximum size of the data[] member of @buf
+ *
+ * This function locates and initialize a new statistics block in @buf for the
+ * driver to populate its content. The function checks that enough space for the
+ * requested @block_type is available in @buf and increments the 'data_size'
+ * member of @buf. The newly created statistics block's header is initialized
+ * with the size and type information provided by the caller in @type_info.
+ *
+ * Drivers should call this function before populating a new statistics block
+ * content.
+ *
+ * Returns a pointer to the next available location in @buf, or an error pointer
+ * if the requested @block_size is not available in @buf or @block_type is not
+ * valid.
+ */
+struct v4l2_isp_block_header *
+v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
+			  const struct v4l2_isp_stats_block_type_info *type_info,
+			  size_t num_block_types, unsigned int block_type,
+			  size_t max_size);
+
 #endif /* _V4L2_ISP_H_ */

-- 
2.55.0

