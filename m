Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05786314B72
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569034; cv=none; b=TaqVgMFNWyB45FM16kQNUUIavRcM3/SQMEOVUXTgLsD4y8vfwpvEtmdxXY7XHALmHhaGJYrxgBQAoxr1LwkmBN9Z+6bw6AVp48VpZy5baV1pIZznpvWape9c/7jrKylw+bvo0cDGsBAmvdLoWhEixckmQHsXGNNT6g3B4/B/vvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569034; c=relaxed/simple;
	bh=/cG4ztpof+Db4sqDKVyLUFC4tL0GFZ7ZX5VzNUQ76E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTIVm/8fUoNIhwRNYXe3WeTLkvUXhJMN+FA52bW0DxiJew7WdcpKr4LOe/5r5WbWgaVtRTa42pAGAntFF4g3QgBn/MMqJ/0xfbpcbdnoPr6jdsaKzeGIpL4koPpehU5VR8S9moziwTBMwgF4clbhD0VoE5j0BArMUH4u2bdRclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MskpUoIT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MskpUoIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FB91F00A3D;
	Sat,  5 Sep 2026 00:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569032;
	bh=CsWRvrZh1xggSySSlMAO6TDWRn7gIb/4nUy0Vmm7IDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MskpUoIT5p8L16jErGkXU5tvirhkOXPwpgM4uCo3MT0xG/VCwvrfMWRFpJSY9HpgM
	 qr2znskx778OA5YJ4lXNX6Q3wDoGn7NAsJdpb5hTThb0BXzERgQe7g/nPwT9V62E5p
	 yKqim4NMtfeLop/ken5evcVgTps0G0igIjyV6tHcRoD8huJrocw5E3VTVavpcDnyEG
	 Dgiqk7lVVnQpFkJ8h2tcekyGtFiMj31yKyn1o6VJ4vBJp4eELauXR2qKM/x+UCI5D+
	 QGQpNvYOBYaD0kYcmV3SEQdo4uSro+DA8SkFK3Kjwx1WM22lS6d9yMvVmcsEFcULPi
	 gH7ShQbnAEmmg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:27 -0500
Subject: [PATCH v2 08/19] accel: ethosu: Validate secondary streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-8-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator records the additional U65 scale and
weight stream addresses and the U85 weight decoder addresses, but only
checked stream 0 against its region buffer.

Check every configured secondary stream against the matching weight or
scale region before accepting a kernel operation.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust for register state tracking
---
 drivers/accel/ethosu/ethosu_gem.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 0b1edf02d48e..ec2832eb9a07 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -425,13 +425,17 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 
 static int buffer_size(struct ethosu_validated_cmdstream_info *info,
 		       struct cmd_state *st, struct buffer *buf, s8 region,
-		       u16 region_cmd, u16 base_cmd, u16 length_cmd)
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd, bool optional)
 {
 	u64 end;
+	bool base_set = cmd_state_reg_is_set(st, base_cmd);
+	bool length_set = cmd_state_reg_is_set(st, length_cmd);
+
+	if (optional && !base_set && !length_set)
+		return 0;
 
 	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
-	    !cmd_state_reg_is_set(st, base_cmd) ||
-	    !cmd_state_reg_is_set(st, length_cmd))
+	    !base_set || !length_set)
 		return -EINVAL;
 
 	if (check_add_overflow(buf->base, (u64)buf->length, &end))
@@ -496,7 +500,20 @@ static int calc_sizes(struct drm_device *ddev,
 			st->weight[0].base + st->weight[0].length - 1);
 		if (buffer_size(info, st, &st->weight[0], st->weight[0].region,
 				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT_BASE,
-				NPU_SET_WEIGHT_LENGTH))
+				NPU_SET_WEIGHT_LENGTH, false))
+			return -EINVAL;
+
+		if (buffer_size(info, st, &st->weight[1], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT1_BASE,
+				NPU_SET_WEIGHT1_LENGTH, true) ||
+		    buffer_size(info, st, &st->weight[3], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT3_BASE,
+				NPU_SET_WEIGHT3_LENGTH, true))
+			return -EINVAL;
+		if (!ethosu_is_u65(edev) &&
+		    buffer_size(info, st, &st->weight[2], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT2_BASE,
+				NPU_SET_WEIGHT2_LENGTH, true))
 			return -EINVAL;
 	}
 
@@ -506,7 +523,13 @@ static int calc_sizes(struct drm_device *ddev,
 			st->scale[0].base + st->scale[0].length - 1);
 		if (buffer_size(info, st, &st->scale[0], st->scale[0].region,
 				NPU_SET_SCALE_REGION, NPU_SET_SCALE_BASE,
-				NPU_SET_SCALE_LENGTH))
+				NPU_SET_SCALE_LENGTH, false))
+			return -EINVAL;
+
+		if (ethosu_is_u65(edev) &&
+		    buffer_size(info, st, &st->scale[1], st->scale[0].region,
+				NPU_SET_SCALE_REGION, NPU_SET_SCALE1_BASE,
+				NPU_SET_SCALE1_LENGTH, true))
 			return -EINVAL;
 	}
 

-- 
2.53.0

