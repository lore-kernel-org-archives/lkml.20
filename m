Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8C57ED8E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905108; cv=none; b=o/hWqU/WLNV70h+mSJZjO+Cs6ryki/+ki5iwqYU+4nsx4tk3QdgfaJi+kr/784EKuaseJCKXpMcFGS4nXOnIbXA0KAUePbTTzQxZKG73T5hWydBBgQApQ0UyN6dy3/CAADztofeYADoyGnM0TGCoB8GHID8mNkTJcKdvIoJPHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905108; c=relaxed/simple;
	bh=XbH+ElM+P2sPvM43Dt4k7TCdw/5sneGfblJvjtRdQww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JewglaAcl4621bfNThcFboRMVUkckkJEgV+0TvYMS+XzOcj5ET3o/AiKBWb5zpYDM2MzCnaG5kFoHifgiETf56bBqFvZ6JD8i435JwLcsGnzJDCgcm/hMwge6v0AJDfg2Zcq3AqrlGwgQP8HqsukiJcbxFKDj1sy42NxQI7MMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJDWz+zH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJDWz+zH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FEE1F00A3D;
	Tue,  8 Sep 2026 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905106;
	bh=x1CU1YU3r6fb1ZoOvXn8W7FcD1J/3so288U26VwNAxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GJDWz+zHAlm5DrOo/25nw6MPCjwXxJglSzCNHkRoRPgJNM0nMlEtewGPpm8ebFyRv
	 21u9+xQf/SM/ayQAtywjTfr9G1G8ng4+Qi1UwBO040nk9Kg6qJcjOXOfvn+sGEGd6o
	 8DfFb0tFQ19XYDxxIsv+p6IoeMOxfVsTmke55a4eVQGRTiAzyalFfru8mky23B1Qp5
	 mgEAh46DRBh13bx1kE3ZEmAgUySCanOHLWFPgW5JhYZKOabEP0l7V32DmPDacGcuqZ
	 hMw6VDSQJHoZC/AdxTXxsfOu/NjWqV58/9YU84sxKB3uZbf7JJDwdm3nb7uw4dT2YG
	 c7JxMNYgtCdhQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:48 -0500
Subject: [PATCH v3 11/22] accel: ethosu: Validate secondary streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-11-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
index 6f6712f4efd1..abfb173e1008 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -436,13 +436,17 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 
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
@@ -507,7 +511,20 @@ static int calc_sizes(struct drm_device *ddev,
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
 
@@ -517,7 +534,13 @@ static int calc_sizes(struct drm_device *ddev,
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

