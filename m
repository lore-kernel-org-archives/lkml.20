Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BF326945
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569039; cv=none; b=PnwitaDMVsrdQYd+ONuKs10txbfWYuwpKXWYrkrsywpi73pJi2Tnhx57hk89jFgxcKmI4fm0rNQnBBAc2O4xmUFVEZrvgCjXAOEmKpUdRvuTiUA0IJMk7HTmv9A7OvTttNtyrB6LxrVrKsauIZd79VU/FCxOaJGDTG/nEEI7vec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569039; c=relaxed/simple;
	bh=/RwCnv4v8jOVpi3A1II7WcwoWGlNyoxRSFgBzM0Q1VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7NX0oyivhm9a43j2HGNAqFqJCiVqv33VmTBQBKYqZ9yRUSnYpa5rlhm/CsgIclxql5lsdsCWxBySwvpJQ8UpboroqUkhWInixS04xbSvk8YMNO8lrMcsURDPkJGCSxDY6kG/n93y3ByD96r8bYvvxRe+B5bwZKI07Zcwj55fls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovefgT/z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovefgT/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2791D1F00A3F;
	Sat,  5 Sep 2026 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569038;
	bh=dPB9D6QSCZEEXMqkqQJch5Q/B371Mby843THkvip74w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ovefgT/zedTqlPPjCh7b8J38ufTfaRPw0KKjvqVjVfRZutxz+tkJ1CeULR1lPGtT2
	 VubL3wkqU38cS32rJFg14/tUHNQCxgKoWaqCDBxbB5R+DplE74fIitVAhIeKzFijHG
	 48niboopdNIUh8OVd6UynD0REMZvQrF77StRszeHSA0H4gf6UAO7rAk8GoO4Nnpjw+
	 MOFLgyxiAE4KhHV/EFtZWEzsdijovQe8RIiHBZg1m8gnGWDRAwaF06571ulDAmO7kO
	 lQ3QZ2eMt+RjW8FC+A4n7ckW+F9Dp1wPLC0Dg7lvbuFqXZYWcjcRZeKbc6kkofmEqW
	 lsfXcwD/mbXYA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:31 -0500
Subject: [PATCH v2 12/19] accel: ethosu: Validate convolution parameter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-12-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The U65 NPU_OP_CONV command has no parameter fields, but the
validator interpreted bit zero as the U85 weights_ifm2 field. A crafted
U65 stream could consequently make validation skip the weight buffer
that hardware accesses.

Require a zero parameter on U65 and reject the reserved U85 parameter
bits.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h | 1 +
 drivers/accel/ethosu/ethosu_gem.c    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index c330048dbcca..d7e1e3c8ca12 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -87,6 +87,7 @@ struct gen_pool;
 #define PMU_EV_TYPE_IDLE	0x20
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
+#define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
 
 enum ethosu_cmds {
 	NPU_OP_STOP = 0x0,
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index bca68fab0527..d60a2a453302 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -733,7 +733,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				st.dma.dst.region, st.dma.dst.offset, dstlen);
 			break;
 		case NPU_OP_CONV:
-			use_ifm2 = param & 0x1;  // weights_ifm2
+			if ((ethosu_is_u65(edev) && param) || (param & ~NPU_OP_CONV_WEIGHTS_IFM2))
+				return -EINVAL;
+
+			use_ifm2 = param & NPU_OP_CONV_WEIGHTS_IFM2;
 			if (!cmd_state_reg_is_set(&st, NPU_SET_OFM_PRECISION))
 				return -EINVAL;
 			use_scale = !(st.ofm.precision & 0x100);

-- 
2.53.0

