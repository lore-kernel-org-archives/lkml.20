Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283526;
	b=Zk93uvKA0Kay4rSLwsyN8w2s8WulNYrs51qU3cIM1VIEOejpvc3OKo6mIn2GMAJ2rYgA
	 GlvSqje1yOd+0ZkQIJ4qy/71uOnL54AMF9tFqc1mI9E2ZbrSM6nb9zN9BRhJX0xU7Pl7s
	 UlKUEtJhiPSss+yPSstM/ut9SawFGZOHpnudZoRra+1oJnOIrlhlLoCddZWIbZwDY8je1
	 95MdkYVkarrl8q6GtvrtXcn77oYHsXyOZLUA6Zp9otOariiZAgtcU3U0VPq4upP1nShSX
	 zh1eFTPYKZMsd4k6lStbERMvi99nlh+3TrsDamdaKnW9bZUOQIygbQMpbFHJbpxJJrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=lGxzqO9u780FoPqAxiGhnUYqvh96Zf8JUT4to2pye771f7gEUj1Tzn8BiSk/igM58aYl
	 2tlpyXgEsfy/DPzPP1PCNy67mhPMYBggHEjaXEytFCU71o5fExbN2iOil7IXatynG38NN
	 Fh1K09BliXvDhyGystSOWvsgK+7xBPNImNr+/I6p4jhu/RIQeLrUX8Rym4l5PJS/Lc135
	 b7TfEsEm2YkKSBnFMe1ELp/rAInO3CntI6y4maLjqvVGdr80rGa3nXPWXUEvf0FqggAq6
	 xeLRGFFT4nZKVGI2kIPBvtK8ZE87MZue3nCvRYYY5LwT3+iqyM4e1pl1nObsIfiSWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455D60A2637
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3455D60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=D9bqhAwT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18342725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283523; x=1793888323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=D9bqhAwTjUreboS+Y2SDyLVCsHDfEKR4fwP8eUIlHEaeJbUvJNQd2JxuFsITZLMPRH
         fchxd5hpKCJ+n75TIaWFPzc0xISn1LGkaFC++PLBiX1PogG3ncv9SbIjPDjaJ5IXTkXr
         wLV4ocPUmGnSURInwpLuXkyvlPRUrm4A8CBti4RCyyjqVun+xx9qngRG1B1QjNEEpUK7
         vIikImjy7teud8Qhs7l1PeaOA0DiMRkIB457AM/k1yGUXGSpwZ8ja23QIrrXDqyEYiP5
         ElVVIfyv9A08p5Ov6SpxO2zusLcp0Tv2wBPq/pcKmP4MGDS/vurYAMnr7RHJvhXo2c9g
         KsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283523; x=1793888323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=iPW/cLAJNWu5aWNev/EYeXCpu7hgzRuiqF1LdOouop4X9cmQahtYnIJogurrJL/2uN
         nIuWPK+ZmRlUXnMA0eKYj/aZV9t21vPexvF7fMlJT9ALtFWPQw3EDD5m//RXyiQcDuxI
         a1SO1Zke5aELKCkHo4bRZFxexDcDoou9tI4c0p8ORobUx22t3CzfzGxkXYfkD+R/P8pe
         Y8SwCBodqBoIWbd0vAcMx9aDpfTfFARo6HljQfz6ztzDtJ20pbl81pCzDzoHz8/qf17U
         JBxoLredKb7vhs9uj8M41ukQ3mQlwbARilP9jcpcjclHdBYejRkGw8+SRrpL3mJPx6ju
         jKuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtLhv9QjPXKvS/rqWpCvt3ViykOw5nZCZbVpKjNiF000Ih50x+LB32Yzj264t+85msy9MVzfprfSsqxz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3X+ks6NrtGB8wnPqVmmujeoQ4R1ifBKq+7XVicsZyiMWn52Xc
	Ro0jAlvMvrNaRTy3rzZGX+7ZR2nlPExREP9JjweoetyCBCADTNvErFLPBUvhWXwW9cI=
X-Gm-Gg: AYBFou1LNakzPCVhfWEjf9+TLexDbBbJTrkN4sCF05mt5xOUS9MPJc8TP47ofsfJjo7
	UXzhPcJRKTI1s5Afls5UlIvSweOfsGzxLVOeNfp9BGHogjjf6PIVkxbkrhGEzhzJ6LYRrlQCN/v
	K7yJRu1ZukrrKwJJ+S1u5YboVUVDyPI4YOMVrVu5GSq3aKVjFEhv/fqKUu5i6dMTKHwhV/2qJKE
	mCtaEw7301LmN9n7xrXRd/mYqoOxTb0i9eu9IcRMEhGkJ/vOKDOhBy8cr3fWYV4+LA6s9pKD8zA
	MgWXcTzx5gk3AqduNyPmEB/mtYolBCtp6Wp/wKsOkHvAmAUBa7TfaiFo9lLXDDfOllTaILzs5AQ
	Cw3xAojR7mr3/Dqt99li/URKdkLQXH1P2OTnRtItZpuTihlN+KQt9nKt9MMYEZl195Topxp8A6l
	hJDYcHS/pqBeGFf1qQJOZxp1ncqd15a2CWwr/8jl+Z4+REjObh5ORbZbrhrPFIFmJZAncU8s2vR
	DiJ+Y6+xxDIhMQkeKZQbLcowWKRHwW+lt5S42cRR9oVOgjsLcIw5GuE0B7otHZzkRDm5ctllZGE
	/rpuokiUYr6rPQvqA1SJbJc+fRgguBCyVm3kG4xswqWJABbrU7HChzIo0RJHtjQzS910xLvFFK9
	pPunDGaFHd8nQTJxK8HlDST38Qg==
X-Received: by 2002:a05:600c:b99:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a9676d42d9mr119898525e9.32.1793283523465;
        Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:26 +0000
Subject: [PATCH v7 05/18] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
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
Message-Id: <20261029-media-starvis2-v7-5-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b54e1c68afa0..5dcd760c1a27 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -632,7 +632,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -658,7 +659,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1207,11 +1209,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1228,7 +1227,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

