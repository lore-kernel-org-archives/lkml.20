Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF859B67F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905113; cv=none; b=PBz1B/SLdg/FDImn9zfZBpWh4f3crrdOSMoWSDXpGk50WdDMjddlwEBFyj8XFi9Al9S/at+w2Ay1eeYzeWWyqiRfoiqVQZPcHfIiQBKuhaIZNKDbRECOLSdLcVg/4LymZ8vWglRUdUR6Tv/ByUsqQIUIf483K5IqUt1UB4sAmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905113; c=relaxed/simple;
	bh=ViYnDclAaYkDXinYD9Si1bmAVW5kTf756dmZcXP29gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnILaDkeqHoYFQ2vELNMwaaR8CjJW4ZzV7Ms9f6TTiYy1Np8RhPQ/enqQ+bELMeddxx8DyHUzysplVkz3xnFJTfHe5zbDTRSyt8AQBB2VsAFI60PK2Bf5C2LNj9ztr9/rXwNfXyQaAs1hr81tYZ8yZxi1Rlp2UmtbCTUsY9angQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGqTIJBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGqTIJBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B01F00A3A;
	Tue,  8 Sep 2026 22:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905112;
	bh=ixbXO59RWk0QWsLMam6PsqGUwplyTBwXbjm2NXGcMBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iGqTIJBTOoO4iFzQOL7qU2RABOnuX3VbAyTBRcQYDac8juIWtJ833Mmvl7Tb8q3M6
	 rvqk8IN3Zcy71mSb0yCKyPKfz/iART9Un0OmASwxppFVvB8dWltOPKMa9reGiZUNtk
	 s2GWXLMOA1EwX7k8E5cQ7x2fP/uNgScHiLgbRtipbJNnnuZrud0sn5ARR6OLgvJNW4
	 o0TuKiCBbnQjQabHdvRojQmEEYhGyaCh75g7Gm1t2XYNw/xsKbNguZzeCgIH/2kn2E
	 6MNBR3/B09i3hZd54kK7KCth9fOXIaZc5IQtnwNDJBWvIBjf/zVOVZQamJJ6YHhAbM
	 H/SZaXPTEAItQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:53 -0500
Subject: [PATCH v3 16/22] accel: ethosu: Account for kernel dilation in IFM
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-16-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Kernel dilation increases the input feature-map area accessed by a
kernel operation. Include the x and y dilation settings when
calculating the required IFM bounds.

Without this, a command stream using x2 dilation can access IFM
memory past the range validated by the driver.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |  2 ++
 drivers/accel/ethosu/ethosu_gem.c    | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index d7e1e3c8ca12..8e23fdbf7f8a 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -88,6 +88,8 @@ struct gen_pool;
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
 #define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
+#define NPU_KERNEL_DILATION_X		BIT(3)
+#define NPU_KERNEL_DILATION_Y		BIT(4)
 
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9c86f9062f55..578d1b5b955c 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -567,10 +567,16 @@ static int calc_sizes(struct drm_device *ddev,
 			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
 		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +
 			(st->ifm.stride_kernel & 0x1) + 1;
+		u32 dilation_y = 1 + !!(st->ifm.stride_kernel &
+					 NPU_KERNEL_DILATION_Y);
+		u32 dilation_x = 1 + !!(st->ifm.stride_kernel &
+					 NPU_KERNEL_DILATION_X);
 		s32 ifm_height = st->ofm.height[2] * stride_y +
-			st->ifm.height[2] - (st->ifm.pad_top + st->ifm.pad_bottom);
+			st->ifm.height[2] * dilation_y -
+			(st->ifm.pad_top + st->ifm.pad_bottom);
 		s32 ifm_width = st->ofm.width * stride_x +
-			st->ifm.width - (st->ifm.pad_left + st->ifm.pad_right);
+			st->ifm.width * dilation_x -
+			(st->ifm.pad_left + st->ifm.pad_right);
 
 		if (ifm_height < 0 || ifm_width < 0)
 			return -EINVAL;

-- 
2.53.0

