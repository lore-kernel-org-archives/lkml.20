Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281009;
	b=42EH1RS2BJWfVgQpLS04PzgbYyR3EQGhSiT0A7A+VGdaKFBOLXG28KE6R5p48mEEDN1u
	 ydnijG418JIrSHLoT0h3RqGEuxgt1mCJZRJUUK97NyDGiOzPP/FJ0RwWkPIqW1imT0xsY
	 Y4P3yjq0IwwutZKPYa4uXPRLJT1iRpoti0GviN6IDl/YFdZqpE+83JlFXRyfd/7my7Jpw
	 7MMYjcFSozn3b7rGc3gN1dKyG2EDU1N1qBxpzMlK1Cv1o5qeCQ5Y4M7SpoLn81+jAVILc
	 syaZq3SeunuH6ov8MNxKCeljs1eqhhgDjXVHiDCcWYg5+5onhMsTFCp75LkM5krBi/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281009;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=b3OI7HIMTivy4Hm7qCSnXSUHSju2/Cp8Y4ZNFOoePyg=;
	b=mk33CsSDNbPN0nwzrC0zDpiDDL6tVGXWwCG3rkRGwNSymJlPSi5vg7//+LcPHKzlPKiN
	 twkg1DSirLj9NZvE1LPA7GgRlLvSYoq45lrPR1pmUXiMNpTjO1Vai5lyZyz4CYcy0SkJA
	 dypQQzlakklhF0ZpTQ/ibtyudhvSsXmh7noCg+2jUHPOq6aj30YVI5FJJI8KVED2kxto6
	 1fV5bZhoBzLOZiO+2NVks38P4IJkCTVqBXFe3lg9BjKgPsq7wyyDcrVK3ZnNfe1Dtb3ad
	 oE/umB5Bq6EFio9p82K1ilV2L973Jww2ittrq3MKqwHGq0WWTF2vi+YBN/Whud6xT2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpPOYmaR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E8F606B565
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpPOYmaR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22261F01825;
	Thu, 29 Oct 2026 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281009;
	bh=b3OI7HIMTivy4Hm7qCSnXSUHSju2/Cp8Y4ZNFOoePyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SpPOYmaRLfWyAuWl6w+dntYdw69RI1AtSYkhyMb9boGo9ncaOwKY00YNQEODKll5e
	 HSv0o8ZTeYd5mmm1FK2MUUmpQtvV64Aj7ql23qe6iXcWak7DrSQRclGSVUMnpzNlWX
	 YWVP7gJCG8CINiaz4rZs4k5uH9yLKMejs2aZRNyFcdjTl+g27AJ7DKRlOC6/lISBXN
	 gp5wehMjvS6y8cO6syVJ9Mc9vfoTPpA8nOkBFZldKClkS3z6iMdi2armxTmWh7gBom
	 jmwNq5sNO/J/ZuJ87dCaMZyAyVK7NWFm26961HvHo7jlRy7eY+gm4jrs017Z5J/tkK
	 ARgk4vdRQsovQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:10 -0500
Subject: [PATCH v4 23/31] accel: ethosu: Account for kernel dilation in IFM
 size
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
Message-Id: <20261029-ethosu-fixes-v4-23-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
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
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_device.h |  2 ++
 drivers/accel/ethosu/ethosu_gem.c    | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 61dec8ec23ea..80cba318f773 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -90,6 +90,8 @@ struct gen_pool;
 
 #define NPU_DMA_REGION_INDEX_MODE	BIT(11)
 #define NPU_OP_CONV_WEIGHTS_IFM2	BIT(0)
+#define NPU_KERNEL_DILATION_X		BIT(3)
+#define NPU_KERNEL_DILATION_Y		BIT(4)
 
 #define NPU_CMD_CTRL_CMD1		BIT(14)
 
diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 143021a3f9ed..15a4cab1b286 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -579,10 +579,16 @@ static int calc_sizes(struct drm_device *ddev,
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

