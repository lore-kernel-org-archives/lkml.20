Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F643375D5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569041; cv=none; b=uBfMstWly+5O4MRKJljC8v1IJGNS76i1vkhGRXY3MKNL2U71uxkMJ0ugrwJNceU8bJ36XTX0bW5BgC/Vzb2w7c6nUHCySsjwLzhX+LBC8He2V/z9ylrhib5SRPP+gH54DaYWfagSsVAM+2ZuYVYczE6X+qR7IYBeULHE+Aohi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569041; c=relaxed/simple;
	bh=4FD78D0s5EkxjQSGpgWww5IPR/qwgwDPGSb3au56H5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDLavXPxWSMUotAW5pHMBOyO6ryEBSzWHcpprELOHWq7SlDCac//NxMxFcjy0GGb6Evo7pUZh5QrE0yIKWlnEsl8h+fh1JEOpze6+2k0sqgtq6Fc4WfgfIYOGAuD8VDr042MFLIp9PpyZA4ij6l5xYIEAkaQfyhwQoQndweX2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzjkDY7X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzjkDY7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2B61F00A3D;
	Sat,  5 Sep 2026 00:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569039;
	bh=L3p3dOtxKM3kZeWqbQEMIGtwYcwhJiwLZnqu4yNzFOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nzjkDY7XpAz95vaKdaaYASYI0ImOjJcjHXqtY/yWTwXeuto0+KcB49BSbvQP9JXRQ
	 Is9/+Vpzh0X0lPfDhCbOzKJFbcjXpiBMudrDayH+2OBAag+yZpUfY43Vptoh/rm8uS
	 E7BVRFXksA7CcuVlqeqH6vFkPCRSwX6/ld09+bDoRrsalfLXEXynQqkAlCar+vzoXb
	 8jTPxgiNi7m+AjhJlYtsjE5Xy3FuYh0cCSjyXQUc0uWARtrPf0i0xSRWGioPEIOK0m
	 LEejnnKtvh5/iAjTexx6ITF2Z08ja/dwcWhvULvVnLR0E9gQhNDQzFVOgwJFYGj1qU
	 A+/LkHzH5fGdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:32 -0500
Subject: [PATCH v2 13/19] accel: ethosu: Account for kernel dilation in IFM
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-13-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
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
index d60a2a453302..63dd07791f31 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -536,10 +536,16 @@ static int calc_sizes(struct drm_device *ddev,
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

