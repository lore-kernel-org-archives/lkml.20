Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281002;
	b=fpWq2Kx49MGBhgUK1AU7UvsIC83KaxmlMSDmcrdEiJ/gCRGw6cPyHwq4Plm0O4awfyF2
	 YV56Ny5HE0H/q66dVPjPAhho73poeYgME17x8VRxr/eU5MMasfkKuziTlgZHIqClQoS9k
	 AEtle7Pxe+FLm183pwAD1uVjsd60czgGj9HAjXdE+c1sJtGxVlJrjyLu3SPHbe9FHLmOm
	 p5ZyXxmDwuQmZXTQCIEe/p6qUDowkaqmzMMMnaPaXAsnJHw+KZH2yzQAo6zxaubHE5eW4
	 Uz77T4QI17odHjSIUWZbWsHzSTjJAEsW0pp4qPRhrezCe625ZeJdy+5rzRw0nqGj9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281002;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=U6eS14BX5+3MydfDxoVozlPdQr/30wymbrvMFm+XtDk=;
	b=X+8hMLyQLJdsBiI1qAUfZgrhYm3gJ0uG+nyFCNHRN73qFMsHdiIKou6uGLcQud6CIAft
	 /7sgiISKdBYEMm3b2rVgdWPUcx5kwOjvKv9DJXwRkMTipebu3aos9gdTclNKK4D/wa1Cj
	 yTgjRPQ/Q4AoR7J0yuFex/QiikiegP2Rtpm5u6+i0RtRAgngfDtipX0dYUyZyZSZ5Xmwc
	 o0wllceSLuKT5KMAsg+GmO6gHs4gcij+t3wDGV5Cm5IWDMPgj8bfJE58Rsv6oxZGR605N
	 g9Zp6dRSKUU+xHptOMhcT2OS0RqvvgwKWYfinP8L3cmroz1IY3wN50YB2ZKfIeeFcog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyuMjLlW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D57260A6F71
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyuMjLlW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F2E1F01829;
	Thu, 29 Oct 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793281002;
	bh=U6eS14BX5+3MydfDxoVozlPdQr/30wymbrvMFm+XtDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RyuMjLlWjAGrUqoa2BSPFKg6yHEz/8jhy63Y3AW+1Tx2CO0Zi1LqfFlyi+DG7eSmx
	 MGRgWf2twa2AD3jciHXAe1PjJgxhbY2sZ8jXRuVEOVesjQRSFAG8lt0319XX/dgcNN
	 WWWQi4GCTmMPb4fNobW5s4Fj/uf3p+cNrme4Xu9IQlL9cBaGZSoIfGFp8O3pUofS2m
	 heWaDXIrrRuEdfnjEOO6eQUo2X6/X7SLDBC0pC6fTM6xiuwJtyjIOyYDZBuN7PzUOw
	 aOhMn6VycAqGB92/pp9fL9v/ceGBkOE0VzgfqbZiTGTLuH8eeBgNIsGdZaBNV/6vvO
	 I9kgkACykPzng==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:05 -0500
Subject: [PATCH v4 18/31] accel: ethosu: Validate secondary streams
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
Message-Id: <20261029-ethosu-fixes-v4-18-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
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
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust for register state tracking
---
 drivers/accel/ethosu/ethosu_gem.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 67c7cbbd39b8..af8a0c45039b 100644
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

