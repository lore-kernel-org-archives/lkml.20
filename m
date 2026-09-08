Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6E5A984C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905112; cv=none; b=IIxth+mf5N8PzTPRUIBIiTrs1jT0Y0bZOIdpX2B+FG/iBllS0vGcZFfEZcLQvMzNw2CE4B3jYJTNnkwC6pWtq/IQQIHORfYL0Wl9RCrQ4Kgj2z7cnN+hqHV+SMllASBEqJeYznnObAb0ZYWnD5j4j3SMmcpxMmx41/Rdxp70jtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905112; c=relaxed/simple;
	bh=0jmRBkJRVQ+tKVOMAA9UYqvR+5po1RMjjJH4m5UVaAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSexLJvXH1M2aJrxw4VvviQ2Fk4EuTPVzzDDT5+icbr3TsiOcmezNlYAR4Ld+q+SVaCkV6je4yG0eR9TnNc7NmJpG/SWexlGVuRZs4hC5y5nnY3rLpAPADiUgqzX9XSf85gSw5n6tA+kNIO9yabXPQNUuNR8WqvPPlgWFAiKocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io/FoVmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io/FoVmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196911F00A3D;
	Tue,  8 Sep 2026 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905111;
	bh=uyB42ZmQyZPlt1IJ4g+w6zDkaYw4xb65yD2EjFjyBOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Io/FoVmVXznOZYV0Ts5fPiDSlsENBvaOgtw0hiMurzAkUT2uoiL9+OppOcJy1H95L
	 Qy0VBvNcFNXbS5LTKmLUAU8fwCFL18pnlcarY67SIaw763fSFh35iHAxj7cleIpL+T
	 H8Tr/TnN7tKy14fHYG3Sr8Q4lw6C8v19CxxG+gRdnyct2QsgiOpSWASP9OWSiGsN16
	 ZIOXBCLck59wxa+1bwlx2X7nuB7kW/VGIRH0WhVSpv7HNtdXiXDh1cQujJ/65Vut4w
	 gAAabslNO9K1f1pg/h6Kvkv+tV5TM5vczpsAOcFpbkMtufDsoxB+I4DoKC6gkA0NSU
	 7jnZJxRlgHK0A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:52 -0500
Subject: [PATCH v3 15/22] accel: ethosu: Validate convolution parameter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-15-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
index 974cf562ef49..9c86f9062f55 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -764,7 +764,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
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

