Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7B31280D;
	Thu,  1 Oct 2026 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815588; cv=none; b=KCvyMvtyB5k2OFwlmTtBxNN7TVy5NqZ3GaDNOYbY+3e+PUkw/0tAedB4eBWDrKKrdtiGlV4grwCTGaU7pZJ2IIOwYf0nuVSgw34Nhnsbq4NdMfgjyEIQoyLEMOsSiPISi9WSGtaM0HTPxSTz55oK3NtlQk1xGyL47wSxcqICTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815588; c=relaxed/simple;
	bh=UkmVbkQERU56oU3uOeniS6e1LqsnVJGtykuPyHWVboY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nr1AXwIUnMry/wJtol2YSdrn+Gvgu2wU+bf+mG5ZCXJEN8bFQGa1daJRzIKm4YJjTsD5N2eGARPfZNgKoP7onXWX7zrCrQqPggENMuRmiKvlH6mIF2xEIP25uBHTZeWxQqb8pnvIfsOedasVg82iPWBEVNM9q6az7DiFxBjayGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YroZubdL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YroZubdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A73A1F000FF;
	Thu,  1 Oct 2026 00:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790815586;
	bh=+R+5td0uBnZOXenj6T+11HpyCjqpHRZMaeS3A2qHMnU=;
	h=From:To:Cc:Subject:Date;
	b=YroZubdLhKwT6IPaRA3dd8oPGYJMhAsOL8Nw6uCnuvSdvhpgL+4EjRg6/k/7dV6+N
	 q6tLUrz3YhUPeK+Uu/MCggfWdY5a7OwrialumJzs2NX/uHI92J2jPJg4Dh6evy9+Hx
	 pCYjO/vF7MwuY6VBwxuQGCkLmCuj5RFVpxNQF/jBFZBlVkwWiUTg/9U1zElk0Os1PM
	 S/Y6K/JdtqPwaU1FroIMaP8UKpusz+ssfbyJgJwTbOOs3x51gG7V0sZGx3Vexjc2S9
	 kdP8tKAtWb+TdPm3hqpyUtTaY1qWaplYm4JYmEJoOz/uV8PvucYfJqUpUAQbxhp8Eg
	 DQpBPuLtnv82w==
From: Sasha Levin <sashal@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Sasha Levin <sashal@kernel.org>,
	"kernelci.org bot" <bot@kernelci.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: fix 64-bit division in iris_set_slice_count()
Date: Wed, 30 Sep 2026 20:46:17 -0400
Message-ID: <20261001004619.2230849-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

32-bit ARM builds fail at modpost:

  ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko:
  symbol '__aeabi_ldivmod' undefined!

The maximum average slice size in MAX_BYTES mode is derived from the
BITRATE capability, whose value is an s64, so both the division by
the frame rate and the DIV_ROUND_UP() by the number of slices are
64-bit divisions. 32-bit ARM has no instruction for these and the
compiler emits calls to __aeabi_ldivmod(), which the kernel does not
provide.

The bitrate is always positive, so use div_u64() for the division by
the frame rate and DIV_ROUND_UP_ULL() for the rounding. Include
<linux/math64.h> for div_u64() instead of relying on it being pulled
in indirectly.

Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://d.kernelci.org/i/maestro:4935f1aae20e7f957e60f8fde09c4e6d153c7909
Fixes: 5f21cd9a4ae4 ("media: iris: add support for multi_slice in iris encoder")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8c4c47944f22f..4f2633bbb49f8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/math64.h>
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -1588,8 +1589,9 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
 		if (rc_type != HFI_RC_OFF) {
-			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
-							 slice_caps->max_slices_per_frame);
+			max_avg_slicesize =
+				DIV_ROUND_UP_ULL(div_u64(inst->fw_caps[BITRATE].value, fps) / 8,
+						 slice_caps->max_slices_per_frame);
 		} else {
 			/*
 			 * No bitrate target exists under RC_OFF, so approximate a
-- 
2.53.0

