Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F06A3955C1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621095; cv=none; b=hZd8Jm1ZteWpG/lSJC0aMohD7YN0YLK6usRczUFQR4acizkFrzMMtqRdOvTASzhffUnr/mt0XaFbRZPGKZ9MnTeyLlufPix82c+Z0hoRSrZyrBjleapJsN8CNVrBJpTq7He8B/so+puyeNEx9Ja4KdzH8B7KkdoWdZS9uoekUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621095; c=relaxed/simple;
	bh=ph4DYjt8z0RgBgbR3n3pcVwDFpVZWmC4rPE5rthejoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXmyF4SBbkKzdGNIIXyMNytM3RG1Z4TSW3qq1zTdjQrxBU+B1qrJY4KnsusewFRoPmA2lNl5hODR01IJKgSaPfoeRenqIRRWwi+q3WM16fSkP1mdaDz51awK+fVMVp+fu24Tiv5oF5KiyWSFVbq7/p02jIy7AdUnjdEVe197SJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SYNFg5IT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SYNFg5IT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ff680331aso3867625e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791621086; x=1792225886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27dNsyUa7fhD1O/J2+BjSAdyJgmahNgxjJzz5yMN3P4=;
        b=SYNFg5ITdwsge9BEhRR79uVX81maqZKPibWDbgBmMza2QTH2dvoMHF3BiTF2UDnRCP
         4IpgaSiims865Jn3RlLEBxquCCm30PFxeetxFC4kAOBCnkaqJu9T1b/Lru6/Xaooldu/
         jE3gGNNW5EYPxuwVdQqFMLcGwBCoOkGA0EcEn1iqc1pbmNJlV+V2h0T+IEex9lJwJriK
         /J35gCy4xSOR7y856F0Ex4YXRolIULgCor8ygEAZ+ZO9viieUVqz+cwKa6dQ7xrS83Rj
         Ds1z2GzsuOk35URimH+KQZBbkNKHUyq1prthhpXSnlLgJi2bcHhYUPkAyF4tLqejpcm2
         dJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621086; x=1792225886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27dNsyUa7fhD1O/J2+BjSAdyJgmahNgxjJzz5yMN3P4=;
        b=KxTxYzGzrg84caprdW6PsxwvD5RiIJ5PGQPBXpyvSmOCbncmhnQf4SzlRFVY00Q9yL
         zr/3uaUapoMrllWacobyh121tjQmTEAsllaMcWj3v9gQF9HMohlR+PgZ9TMIIF8wspDZ
         hG/QPiR+i02XeVtlcGXGf15rWipizwCp/rFhFiU6mVzHUjG+6HfudtRBnjFvMqG7+FAc
         yUrbm0IqyOQA2yIZUOqCiaiKsaAyuzeBDy+wrkS/4GlZ/bMTkHCESvz+wyTDTo4sb1zM
         rRqc4xFo4D4/bx2k/6wbHVzw1Gwpl6aobPakO2LLQ2BMxgEkPGfyExjj221as7kenla/
         r2Ew==
X-Forwarded-Encrypted: i=1; AKwUvByNIY2yaz750Rgi/RjSdZ0MhRHX5HBCCyfXCPs3Jj02flA6tHdRkC3ZIZdFR6PpnEDzgHoIN/P8EyTiK0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgtBJBbEgSDeXVhlLvCFQhnM9SEao1xNJXrpmnWDiZZYiWazO1
	h/f8PQWTGlzw3EFOz6+4zxkzWZBzTeXz3DEzhMzY2ajDMnGvqMtMy3rjzdEs6FAOfrU=
X-Gm-Gg: AYBFou0HCF7Nrk1aEnnZJnTV1Iqn3jRE5G5HYGiXY0r0EVmskIsOwNnrbwdsmd2vqp7
	rGyI3BcvhIajXeUllVXgfu54IwAAnS7iNwEVXgdgWPzNDRzXVrEIagmJ6qtIj4smPaiEDpCLpv8
	JKfKPAVljN7vn3wuwvieExTXzhKkBH94JbnumWke8oXAi8RPKMkWVqzdB32+9+ENokpIjFRByvn
	kN17aFoWdBA9EAKmnN+GdVxC1vcVPCBVS+ELxcMIxuljD27mbL5mYMde6O/iPpyirIyM3FAfsks
	oJKogXKpqz1SPCzIoOchemGqpCZZvnbMNDrh44LQWWtHeCWYm9evgzmi3d1fZToLzUOdkZhg5CC
	ibAX4W/kduqERFB/aMHm4btcQgvHDN/nU4IyP+E0tYBNBROfoj/pii4y2The6Ayx08T04qxhrfM
	LbqtgtNhiBK8Mp1g2rcW8j5NnSSrsxS3PovG0JAFE3nsK9DrT8EegKO9Ao15Foy4ijfTGd3raG9
	/sZmMjaIYZBaoNNlFK30u0O0Ks=
X-Received: by 2002:a05:600c:3d96:b0:4a1:746e:5898 with SMTP id 5b1f17b1804b1-4a18e4835e7mr80062645e9.13.1791621085688;
        Sat, 10 Oct 2026 01:31:25 -0700 (PDT)
Received: from localhost (137.36.26.109.rev.sfr.net. [109.26.36.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4a3b4asm198380275e9.5.2026.10.10.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:31:25 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: add the Allwinner T527 VIP9000 hardware database entry
Date: Sat, 10 Oct 2026 10:30:36 +0200
Message-ID: <20261010083036.765881-1-ple@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an identity entry for the VIP9000 NPU found in the Allwinner T527,
as used on the Orange Pi 4A. Match model 0x9000, revision 0x9003,
product 0x05090009, customer 0x10000016 and ECO 0x06000000.

Provide the core counts, limits and feature masks for this variant
instead of relying on the register-based fallback. It has six NN cores
and one shader core.

Include SECURITY_AHB in minor_features10. The corresponding
vip9000nano-si+ entry in the Orange Pi BSP feature database advertises
both SECURITY and SECURITY_AHB. This lets the existing capability check
select ETNA_SEC_KERNEL without a model-specific security override.

Validated on an Orange Pi 4A with a 6.18.38-based kernel and patched
Mesa/Teflon. Full quantized MobileNet inference completes with identical
NN intermediate and final outputs to the vendor BSP. Two additional
runs without per-operation instrumentation complete without a hang.
The Mesa fixes are separate from this hardware database addition.

Signed-off-by: Phong LE <ple@baylibre.com>
---
This entry combines the locally tested T527 HWDB addition and the
SECURITY_AHB correction.

Prepared against torvalds/linux 6812ce4e4379ffc99c52401ec28f0d7ffbc36206 (etnaviv_hwdb.c).
Hardware testing used the local 6.18.38-based tree, not this upstream
revision.

Vendor reference: Orange Pi T527 BSP,
bsp/drivers/npu/aw_nna_galcore/hal/inc/gc_feature_database.h,
entry vip9000nano-si+, customer 0x10000016. The SECURITY and SECURITY_AHB
fields are both set to 1.

Test details: 5,043,689 NN output elements and all 1,001 final output
values match the captured BSP reference. This tests one model/input;
it does not validate every reported capability or the graphics paths.

 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 32d710baf17f..4df463ef6e60 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -292,6 +292,38 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x108048c0,
 		.minor_features11 = 0x00000010,
 	},
+	{
+		.model = 0x9000,
+		.revision = 0x9003,
+		.product_id = 0x5090009,
+		.customer_id = 0x10000016,
+		.eco_id = 0x6000000,
+		.stream_count = 8,
+		.register_max = 64,
+		.thread_count = 256,
+		.shader_core_count = 1,
+		.nn_core_count = 6,
+		.vertex_cache_size = 16,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 512,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 16,
+		.features = 0xe0287cac,
+		.minor_features0 = 0xc1799eff,
+		.minor_features1 = 0xfefbfadb,
+		.minor_features2 = 0xeb9d6fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xd30dafc7,
+		.minor_features5 = 0x7b5ac333,
+		.minor_features6 = 0xf239c400,
+		.minor_features7 = 0xffffe9bf,
+		.minor_features8 = 0x2003dfce,
+		.minor_features9 = 0x01081841,
+		.minor_features10 = 0x01004048,
+		.minor_features11 = 0x00010000,
+	},
 };
 
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)

base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.43.0

