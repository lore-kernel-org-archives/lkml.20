Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E35AA695
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905117; cv=none; b=SJG5XVtxl5qBrUX3tK0c1AWK/XN790eK9iEpLA2zeYq7xD4O61vEVpS6QXrJzUvGwuUJ9eq5MUfWG4cxa6zTopXtyjt6AceZL8pXYpD7MC8n/ClFabOSiuEXj+LH/43Vog3iY/QKWTaNCIlRTO4Xt8hq6hzVWIpSj/aDpDXw3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905117; c=relaxed/simple;
	bh=TEGCY1oSZn0wBN6NqrVGkn6X0iPUooWENZh6XAJ4RNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciDaJUE2b3arNWXug5jwb5Sx8uOUQQM7jWjhH261KOj9NZhfuYhGsD6ZTb6nfBRHVjQ8hvlJyTrpLEnuLWVnGOTxuiZLp10j38P9PJFVoYmkYmpiSU76XoMbdy7PAprbElTWNI+C8tS4WjRHgO/HUeMbFxqRqHZYDwMyYGBCkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wr/jO7OO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wr/jO7OO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4AF1F00A3A;
	Tue,  8 Sep 2026 22:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905115;
	bh=PdV0AOoH1dpzqPdrrBZkkma6g3SaDeLzWLyMXKL4BJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wr/jO7OOuNWyZiWRnnb7E0eWmFIRBu/sU/4l7uqgsGY3+RfIb7gXXu4+OUT1Z9UGn
	 d7Ds4QEDklaq0hmIFpt+nr4ECVM0LsNPdofoH1CaIOVTq3g3xS2VmEAujs2ToRYbDb
	 d+OYYkb8gq14aSopL5ZAO+aYOSY0b+oVWLV9V9laOjwcoMklZ53H6xwBAtWeqvOMgw
	 rgp4i2FWyh+JtK9Md+sB/dQrCTLTauDagaDbKxOG5BDYT5NiplAAnlVFs/h9Z4nHGX
	 TcZHenRiNMMDeiYfOGd8HEY/CSSd641yON8FA9YS4WS+NVWh8SDrA2pf/1Jad7ZO7+
	 Hd13DZgQ3/6jQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:55 -0500
Subject: [PATCH v3 18/22] accel: ethosu: Validate accumulator input
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-18-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The U85 ACC_FORMAT command can select IFM2 as the accumulator
input. This is used by null-pool operations and can also be used
by convolution. Track this selection and validate the IFM2 feature
map against the OFM extent before submitting the operation.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |  4 ++++
 drivers/accel/ethosu/ethosu_gem.c    | 42 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 68e2969b6f79..6b9d093d73e6 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -126,6 +126,7 @@ enum ethosu_cmds {
 	NPU_SET_KERNEL_WIDTH_M1 = 0x120,
 	NPU_SET_KERNEL_HEIGHT_M1 = 0x121,
 	NPU_SET_KERNEL_STRIDE = 0x122,
+	NPU_SET_ACC_FORMAT = 0x124,
 	NPU_SET_WEIGHT_REGION = 0x128,
 	NPU_SET_SCALE_REGION = 0x129,
 	NPU_SET_DMA0_SRC_REGION = 0x130,
@@ -180,6 +181,9 @@ enum ethosu_cmds {
 	NPU_SET_WEIGHT3_LENGTH = 0x4095,
 };
 
+#define NPU_ACC_FORMAT_INPUT_MASK	GENMASK(5, 4)
+#define NPU_ACC_INPUT_IFM2		2
+
 #define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
 
 struct ethosu_perfmon;
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index f4bd31018e56..632a2352491a 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -155,6 +155,7 @@ struct feat_matrix {
 struct cmd_state {
 	DECLARE_BITMAP(cmd0, NPU_CMD0_REGS);
 	DECLARE_BITMAP(cmd1, NPU_CMD1_REGS);
+	bool acc_input_ifm2;
 	struct dma_state dma;
 	struct buffer scale[2];
 	struct buffer weight[4];
@@ -522,6 +523,32 @@ static int feat_matrix_size(struct ethosu_device *edev,
 					  max_len);
 }
 
+static int
+calc_acc_input_size(struct drm_device *ddev,
+		    struct ethosu_validated_cmdstream_info *info,
+		    struct cmd_state *st)
+{
+	struct ethosu_device *edev = to_ethosu_device(ddev);
+	u64 len;
+	int ret;
+
+	if (!ethosu_is_u65(edev) &&
+	    !cmd_state_reg_is_set(st, NPU_SET_ACC_FORMAT))
+		return -EINVAL;
+
+	if (!st->acc_input_ifm2)
+		return 0;
+
+	/* The accumulator has one input value for each OFM element. */
+	ret = feat_matrix_size(edev, info, st, &st->ifm2,
+			       FEAT_MATRIX_IFM2, st->ofm.width,
+			       st->ofm.height[2], st->ofm.depth, false, &len);
+	dev_dbg(ddev->dev, "ACC IFM2:%d:0x%llx-0x%llx\n",
+		st->ifm2.region, st->ifm2.base[0], len);
+
+	return ret;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
 		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
@@ -643,6 +670,9 @@ static int calc_sizes(struct drm_device *ddev,
 			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
+	if (ret)
+		return ret;
+	ret = calc_acc_input_size(ddev, info, st);
 	if (ret)
 		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
@@ -692,6 +722,9 @@ static int calc_sizes_elemwise(struct drm_device *ddev,
 			       true, &len);
 	dev_dbg(ddev->dev, "op %d: OFM:%d:0x%llx-0x%llx\n",
 		op, st->ofm.region, st->ofm.base[0], len);
+	if (ret)
+		return ret;
+	ret = calc_acc_input_size(ddev, info, st);
 	if (ret)
 		return ret;
 	if (!feat_matrix_chained(edev, &st->ofm))
@@ -830,6 +863,15 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_KERNEL_STRIDE:
 			st.ifm.stride_kernel = param;
 			break;
+		case NPU_SET_ACC_FORMAT:
+			if (!ethosu_is_u65(edev)) {
+				u32 acc_input = FIELD_GET(NPU_ACC_FORMAT_INPUT_MASK, param);
+
+				if (acc_input > NPU_ACC_INPUT_IFM2)
+					return -EINVAL;
+				st.acc_input_ifm2 = acc_input == NPU_ACC_INPUT_IFM2;
+			}
+			break;
 		case NPU_SET_IFM_PAD_TOP:
 			st.ifm.pad_top = param & 0x7f;
 			break;

-- 
2.53.0

