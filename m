Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281022;
	b=I1MjlS1hio5QbzZroPOVN5mAIxQ1CI3vU7SwqYxzGF0NkmpF/x0a8Hc4SLRPoX57zGqS
	 TVcskBpv/3UyBCkIudYxs2h6FR/zY83wf/JmpMVzurgKvBSJtMXnbnFr1mwBIbgMa1/9y
	 fHQBKGPu0nY31zk51vWwe/PVJvkUZQdCOFkmyzd921B6F74of/4NZLSHYQcNWW4IFf6TR
	 f2SNA3snxmDqn7Il7G0M4UBChszfoRz/V06U+6PkXzLrzxR7kuX0usm4RuUfx/+Q2odnU
	 LNNKP1o0FjiYMbGlzmiOHiSw8FAN0LLwxIIgD66E4cy5UPF8oMr7Cl1/cv21hEoKs/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281022;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ox1jOypihe9xctLjUQLpj4l9cFz4hiC46HWxvLiwZd8=;
	b=Nl1ZJZD4rZjG/iQkBNhl9VM7RSY/hKeOyrgL6QwZG9c5R36Jkfc2F29yh/IvN6B+zRvj
	 vohl1HZjUpFu0xpNq+LgzwHshMEKKEJjXTj6zxjxfp5How3laddP+W7lQWw9PgGrhx4r9
	 Z8WJLHHfMjorAhfq5r9fKKj8DbDJ+wz6TnMtWh/ZRACz3ZT7cUm+HMI1QBHpzpEvTwzdy
	 Wu7+CR3cxXN4z8QcE+zaNd+3JyV0pBZ1OT7nzP5FRKS/C/l8zOqfiFcOC4MjVx6PC9Ip8
	 QNmmMkiBVk4opNXTygNI2Mx0il5KRHCODF5Ay41PtkuD/tT3wHR6oHwrfhaW+Eibrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+9UROV9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F29606C31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+9UROV9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2301F031E1;
	Thu, 29 Oct 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281021;
	bh=ox1jOypihe9xctLjUQLpj4l9cFz4hiC46HWxvLiwZd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i+9UROV9OlbHI6hK/cmOf7AvB1Od2cIntPEOTCIBgJAbDK6Pkk2xsoHr+ikKPLeGb
	 8o3bdh+Z+t0Tx+1q61XQEk8f6MAu6S9R17SQsvuc89Xgy+rxB9tsd1dD1Kax5oyB+5
	 E+mnaXJOK0lwHmAT37cZlCHxKKnNtD/UJjt7ZyRZMg8ctuRVq+6LJCETM0+AMZaubc
	 KUbgS9SeBipUmjx78HLzXnW/6rpJnNRL+U0WrRHqpWNKDMiYFsS2HVeso2QjiKmbkP
	 MVved8EMF3wPlkE2HNy34vjoAGYmFz2lhQ5dTjTHM0J6kk90PdfTXfqRWc0vQn8P44
	 6Bn7mNgQ0SwOw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:17 -0500
Subject: [PATCH v4 30/31] accel: ethosu: Require active weight streams
 setup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-30-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

A secondary weight or scale stream must be explicitly disabled or
configured when the hardware uses it. Otherwise, stale stream state from
a previous command stream can bypass buffer bounds validation.

Derive the active stream count from the NPU configuration on U85 and
from PARALLEL_MODE on U65. Require every active stream's length command,
while allowing a zero length to disable it.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_device.h |  4 +++
 drivers/accel/ethosu/ethosu_gem.c    | 60 +++++++++++++++++++++++++++++++-----
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 135c33f57045..f41a8e0e1e1b 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -63,6 +63,7 @@ struct gen_pool;
 
 #define CONFIG_MACS_PER_CC_MASK	GENMASK(3, 0)
 #define CONFIG_CMD_STREAM_VER_MASK	GENMASK(7, 4)
+#define CONFIG_NUM_WD_MASK		GENMASK(13, 12)
 
 #define STATUS_STATE_RUNNING	BIT(0)
 #define STATUS_IRQ_RAISED	BIT(1)
@@ -130,6 +131,7 @@ enum ethosu_cmds {
 	NPU_SET_KERNEL_WIDTH_M1 = 0x120,
 	NPU_SET_KERNEL_HEIGHT_M1 = 0x121,
 	NPU_SET_KERNEL_STRIDE = 0x122,
+	NPU_SET_PARALLEL_MODE = 0x123,	// U65 only
 	NPU_SET_ACC_FORMAT = 0x124,
 	NPU_SET_WEIGHT_REGION = 0x128,
 	NPU_SET_SCALE_REGION = 0x129,
@@ -193,6 +195,8 @@ enum ethosu_cmds {
 
 #define NPU_ACC_FORMAT_INPUT_MASK	GENMASK(5, 4)
 #define NPU_ACC_INPUT_IFM2		2
+#define NPU_MACS_PER_CC_256		8
+#define NPU_PARALLEL_MODE_DUAL_CORE_DEPTH	1
 
 #define ETHOSU_SRAM_REGION	2	/* Matching Vela compiler */
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 1935440fb815..21458aacfcad 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -165,6 +165,7 @@ struct cmd_state {
 	DECLARE_BITMAP(cmd0, NPU_CMD0_REGS);
 	DECLARE_BITMAP(cmd1, NPU_CMD1_REGS);
 	bool acc_input_ifm2;
+	u8 parallel_mode;
 	struct dma_state dma;
 	struct buffer scale[2];
 	struct buffer weight[4];
@@ -767,19 +768,45 @@ static int calc_sizes_resize(struct drm_device *ddev,
 	return 0;
 }
 
+static int weight_streams(struct ethosu_device *edev, struct cmd_state *st,
+			  u8 *streams)
+{
+	if (ethosu_is_u65(edev)) {
+		if (FIELD_GET(CONFIG_MACS_PER_CC_MASK, edev->npu_info.config) ==
+		    NPU_MACS_PER_CC_256) {
+			*streams = 1;
+			return 0;
+		}
+
+		if (!cmd_state_reg_is_set(st, NPU_SET_PARALLEL_MODE))
+			return -EINVAL;
+
+		*streams = st->parallel_mode + 1;
+	} else {
+		*streams = 1 << FIELD_GET(CONFIG_NUM_WD_MASK,
+					   edev->npu_info.config);
+	}
+
+	return 0;
+}
+
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
-		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool can_omit)
 {
 	u64 end;
 	bool base_set = cmd_state_reg_is_set(st, base_cmd);
 	bool length_set = cmd_state_reg_is_set(st, length_cmd);
 
-	if (optional && !base_set && !length_set)
+	if (can_omit && !length_set)
 		return 0;
 
 	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
-	    !base_set || !length_set)
+	    !length_set)
+		return -EINVAL;
+	if (!buf->length)
+		return 0;
+	if (!base_set)
 		return -EINVAL;
 
 	if (check_add_overflow(buf->base, (u64)buf->length, &end))
@@ -797,6 +824,7 @@ static int calc_sizes(struct drm_device *ddev,
 {
 	struct ethosu_device *edev = to_ethosu_device(ddev);
 	u64 len;
+	u8 streams;
 	int ret;
 
 	if (ifm) {
@@ -848,6 +876,10 @@ static int calc_sizes(struct drm_device *ddev,
 	}
 
 	if (weight) {
+		ret = weight_streams(edev, st, &streams);
+		if (ret)
+			return ret;
+
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
@@ -858,19 +890,23 @@ static int calc_sizes(struct drm_device *ddev,
 
 		if (buffer_size(info, st, &st->weight[1], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT1_BASE,
-				NPU_SET_WEIGHT1_LENGTH, true) ||
+				NPU_SET_WEIGHT1_LENGTH, streams < 2) ||
 		    buffer_size(info, st, &st->weight[3], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT3_BASE,
-				NPU_SET_WEIGHT3_LENGTH, true))
+				NPU_SET_WEIGHT3_LENGTH, streams < 4))
 			return -EINVAL;
 		if (!ethosu_is_u65(edev) &&
 		    buffer_size(info, st, &st->weight[2], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT2_BASE,
-				NPU_SET_WEIGHT2_LENGTH, true))
+				NPU_SET_WEIGHT2_LENGTH, streams < 3))
 			return -EINVAL;
 	}
 
 	if (scale) {
+		ret = weight_streams(edev, st, &streams);
+		if (ret)
+			return ret;
+
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
@@ -882,7 +918,7 @@ static int calc_sizes(struct drm_device *ddev,
 		if (ethosu_is_u65(edev) &&
 		    buffer_size(info, st, &st->scale[1], st->scale[0].region,
 				NPU_SET_SCALE_REGION, NPU_SET_SCALE1_BASE,
-				NPU_SET_SCALE1_LENGTH, true))
+				NPU_SET_SCALE1_LENGTH, streams < 2))
 			return -EINVAL;
 	}
 
@@ -1093,6 +1129,16 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		case NPU_SET_KERNEL_STRIDE:
 			st.ifm.stride_kernel = param;
 			break;
+		case NPU_SET_PARALLEL_MODE:
+			if (!ethosu_is_u65(edev) ||
+			    param > NPU_PARALLEL_MODE_DUAL_CORE_DEPTH)
+				return -EINVAL;
+			if (FIELD_GET(CONFIG_MACS_PER_CC_MASK, edev->npu_info.config) ==
+			    NPU_MACS_PER_CC_256 &&
+			    param)
+				return -EINVAL;
+			st.parallel_mode = param;
+			break;
 		case NPU_SET_ACC_FORMAT:
 			if (!ethosu_is_u65(edev)) {
 				u32 acc_input = FIELD_GET(NPU_ACC_FORMAT_INPUT_MASK, param);

-- 
2.53.0

