Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D395908CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905120; cv=none; b=pArjPYCvty+sZ6f1AFl4dx3f41zdeaOFaBB/+OfucID1gJey73VqAEEVDLe7obVXJSsk2d4GZzOHC4uDTXcH3Bw/JhiBrR84lWegxl4BQc0DHsQhm8RQOGlLUW4uAgjFb2UA/+q36+yGj+QN027eJ5+j8yFTxwtWK4V5uQPqUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905120; c=relaxed/simple;
	bh=fLQlyLC68D6I9KHylHvtWoUb4w7IJMLU3Nf6aXixN7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=al1DJbkS88uTLbeVrwuZVyTBjnzLDgSXGQ5qqA9WsjBBAh3gjx4yjPYL38E3t3AozF1wn4w5gXP6oHRYZcTmclr0ttrWhOxMNwTaFBYBUrMXF+kjpd1GORafPt6AZPJsM53WFK+6on2sWskMAE/fg+4p63TQ7PGWHVkXLhvFLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez9zBeDV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez9zBeDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1348F1F00A3A;
	Tue,  8 Sep 2026 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905119;
	bh=QEUV28WflTnYeXb75F34zYPsqWJDRc4cP7Dds+IHxSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ez9zBeDVnBoT/bUpJDTKW9sxtN4mRpoEfJkIiz8GOaokymAOBlbdijJqZLmMpI+XD
	 fLnkXWVRBvliHaSzFdIpkCpNagK+VsvLULyoQg0pEM7rAprwt4b7TsW6mNe835UFY7
	 tQG1F7sBUkYRTH8UIHffgQe4r9tofJ0UT1Ov0FVLAAJUJjFDaW6Z0608RDTnon7fVT
	 1LjKmzvQ/cuUecoIAzVOYndM16RnpbrO7xMi97y2WVRqvWKo2e6qqI7IolYsHbx88Z
	 bvMf7VF/XZzJxJFspwF3PuZMonQVDr4DeEd8CGNLfDK876z6qYo/B7ikoJMFSBsM+2
	 afWsmskwDKZzg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:58 -0500
Subject: [PATCH v3 21/22] accel: ethosu: Validate OFM transpose
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-21-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

U85 OFM dimensions are specified before transposition, while
tile bases and strides address the transposed feature map. Permute
the output endpoint before validating its tile and stride accesses.

Allow the defined U85 transpose encodings and reject the two
reserved encodings.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - no change
---
 drivers/accel/ethosu/ethosu_device.h |  1 +
 drivers/accel/ethosu/ethosu_gem.c    | 58 ++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 6b9d093d73e6..3f1fa0a36bd9 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -90,6 +90,7 @@ struct gen_pool;
 #define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
 #define NPU_KERNEL_DILATION_X		BIT(3)
 #define NPU_KERNEL_DILATION_Y		BIT(4)
+#define NPU_OFM_TRANSPOSE_MASK		GENMASK(13, 11)
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 #define NPU_CMD_RESERVED_MASK		(BIT(15) | GENMASK(13, 10))
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 82699050a670..1c64e27a0d99 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -407,6 +407,52 @@ static int feat_matrix_validate(struct ethosu_device *edev,
 
 	return 0;
 }
+
+static int feat_matrix_permute(struct ethosu_device *edev,
+			       struct feat_matrix *fm, u32 *x, u32 *y,
+			       u32 *c, bool ofm)
+{
+	u32 width = *x;
+	u32 height = *y;
+	u32 depth = *c;
+	u32 transpose;
+
+	if (ethosu_is_u65(edev) || !ofm)
+		return 0;
+
+	transpose = FIELD_GET(NPU_OFM_TRANSPOSE_MASK, fm->precision);
+
+	switch (transpose) {
+	case 0: /* HWC */
+		break;
+	case 1: /* WHC */
+		*x = height;
+		*y = width;
+		break;
+	case 2: /* HCW */
+		*x = depth;
+		*c = width;
+		break;
+	case 3: /* WCH */
+		*x = depth;
+		*y = width;
+		*c = height;
+		break;
+	case 6: /* CHW */
+		*x = height;
+		*y = depth;
+		*c = width;
+		break;
+	case 7: /* CWH */
+		*y = depth;
+		*c = height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
 static u64 feat_matrix_length(struct ethosu_device *edev,
 			      struct ethosu_validated_cmdstream_info *info,
 			      struct cmd_state *st, struct feat_matrix *fm,
@@ -513,6 +559,9 @@ static int feat_matrix_size(struct ethosu_device *edev,
 	int ret;
 
 	*max_len = 0;
+	ret = feat_matrix_permute(edev, fm, &x, &y, &c, ofm);
+	if (ret)
+		return ret;
 
 	if (storage == 0) {
 		ret = feat_matrix_check_location(edev, info, st, fm, type, 0, 0,
@@ -990,8 +1039,13 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_OFM_PRECISION:
 			if (((param >> 6) & 0x3) > 1)
 				return -EINVAL;
-			if (!ethosu_is_u65(edev) && (param & GENMASK(13, 11)))
-				return -EINVAL;
+			if (!ethosu_is_u65(edev)) {
+				switch (FIELD_GET(NPU_OFM_TRANSPOSE_MASK, param)) {
+				case 4:
+				case 5:
+					return -EINVAL;
+				}
+			}
 			st.ofm.precision = param;
 			break;
 		case NPU_SET_OFM_REGION:

-- 
2.53.0

