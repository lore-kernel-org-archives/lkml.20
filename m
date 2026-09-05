Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFED31355B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569032; cv=none; b=Tz17OL9oFA7gjlSemsMltHf3AiWoA7kGPGDCKWJCtz0WTuv9jp56q0fSI2eBGYP8UT2KVRiX+g5MARDru9eGDR8Yy5iZWGzdHR8BNjrPGvYf8oZMgdKnVZwPmsqLFab2EkEw0+naMZsKOffMnFx4nUd6LjEBqAJjNhqGZuEOKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569032; c=relaxed/simple;
	bh=RWZ+owyApEzt7vJY7ohQi7nsnGYhTgDktSF+4xrHn5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtR3SHAXyeWr36VkHAkuv5+uXNC3pvc4MttlRs98BGKu9d+HnN/HUYnfZd874yXeaM50RHvJrOeRIYxXeWWDovaKqUNROQDcDXrz41T7QD0AL+asYK7MtQOpxnISfdLTAIfLnOzhFxo7PGfWfMu/5nRs+xBN3LFL6SzSPGEqlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtoiMqat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtoiMqat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391441F00A3E;
	Sat,  5 Sep 2026 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569031;
	bh=HV+rmbMI0lHJ4R40iFUVjvOrvTR2qsfW7BSm738+Y1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JtoiMqatW+HYv1FkEvbA/mdafRmPT70WDLRTfD7mTE1O7Q6BDTHUmH4CykEPsvHx6
	 dcazBOTdkiTvp9S0FMndGS8979+qLxXFBkbD4Ksk3UJLDFIcP4kxlniSjohanNmy6n
	 OCQjsMICGk2+QPvNNGthRHFyTdyvzKIMDD7UBeYKgFxK1tTXbWfVAN7c12MfijGwXE
	 1ELKoXzvCJ6GFFsRgLwAUo6SxOoTs+ySUOtEBWbQJULXUxRgOlpqBoEaORfQIp5uz5
	 K3c0vHgBXZVAwuleyLZKexNG7Q0N/MsmbuAvgLXiHOxPD/SePr35PmzbZzfHax1Xq+
	 pX34nyu1LIyrQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:26 -0500
Subject: [PATCH v2 07/19] accel: ethosu: Factor buffer bounds checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-7-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Move the repeated command-stream buffer range validation into a
helper in preparation for validating all weight and scale streams.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust due to previous patch
---
 drivers/accel/ethosu/ethosu_gem.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 8a44a5d89bce..0b1edf02d48e 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -423,6 +423,25 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int buffer_size(struct ethosu_validated_cmdstream_info *info,
+		       struct cmd_state *st, struct buffer *buf, s8 region,
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd)
+{
+	u64 end;
+
+	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
+	    !cmd_state_reg_is_set(st, base_cmd) ||
+	    !cmd_state_reg_is_set(st, length_cmd))
+		return -EINVAL;
+
+	if (check_add_overflow(buf->base, (u64)buf->length, &end))
+		return -EINVAL;
+
+	info->region_size[region] = max(info->region_size[region], end);
+
+	return 0;
+}
+
 static int calc_sizes(struct drm_device *ddev,
 		      struct ethosu_validated_cmdstream_info *info,
 		      u16 op, struct cmd_state *st,
@@ -475,26 +494,20 @@ static int calc_sizes(struct drm_device *ddev,
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_WEIGHT_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_LENGTH))
+		if (buffer_size(info, st, &st->weight[0], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT_BASE,
+				NPU_SET_WEIGHT_LENGTH))
 			return -EINVAL;
-		info->region_size[st->weight[0].region] =
-			max(info->region_size[st->weight[0].region],
-			    st->weight[0].base + st->weight[0].length);
 	}
 
 	if (scale) {
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_SCALE_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_LENGTH))
+		if (buffer_size(info, st, &st->scale[0], st->scale[0].region,
+				NPU_SET_SCALE_REGION, NPU_SET_SCALE_BASE,
+				NPU_SET_SCALE_LENGTH))
 			return -EINVAL;
-		info->region_size[st->scale[0].region] =
-			max(info->region_size[st->scale[0].region],
-			    st->scale[0].base + st->scale[0].length);
 	}
 
 	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,

-- 
2.53.0

