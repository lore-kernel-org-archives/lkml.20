Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668C4CCDF3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742154; cv=none; b=C4F+0SHZxvo6md4ld+Ae6YDf2VRAEGazbNd2/AZ12dG1iktlO7OZUlM6nc4E0ZylIiYDNRVWhqwNaAITOSHXjfdfEfG5ntxWGdf0vTIg4LXwitcCnFM7vFCL27XRw+G73fGLZaoqbArwGi3NRRRlnznzqzWSLMX8mJ7iNlqYLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742154; c=relaxed/simple;
	bh=hlcsJhUrLyBo5++wlhrrLrw8VUbuI1LW8vlmxLrWUg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3jCCeOB8FlMf6jSzTzQqOvu7kcgMFJUDEDMmU3O4QQqPhDCRci09K1eNBQbXkbRFfs0n2Soi3yZyKnb0TInpHnv4hV6mXZvDjhlNrVs9STtrhbLgRU74JWUvWpG4Iwm1dZnyNyPp36KTVMqWcoWE3zUz6Nsr7sy/l1vJ0gC9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US6UZtWz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US6UZtWz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso3002619b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742152; x=1789346952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=US6UZtWzj5kefUTVHtiH7tMrKjkrvmfAwATwoQrg9LQgd6GrCB5SoVAnVhwXZTfcGG
         QOIGI9OCUku3yBve1JVZFT1SWyoS4eU9SYvarLyru8QHb95yLSlaWmRCaDrrtTCIZvAm
         ni7BWqOyzqF+uNhtRZHHaHXGKyDa11N9AjEalU129riSGVyBl+7W+yOpwU0se7ifd55Q
         aqvyhW3m3X4BGmrwURHozivaUErCmJTN/J3DxD8e2owgtnshPoqaSrG2kMfytZxVRBj6
         prFtNNhevN8p7d4BP33BdLGZVn1I9oJetuaEmWVodS4tcoYSniP8rDPrM8Oq0swH652v
         MW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742152; x=1789346952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=GJCg0qm1wmOcqDdpf2Kdb3mNwsFC/0pG6i64Ac8CbjFINkRWHxDRF1jDerqB1tbeQ9
         KKzJloU+5X6HeJl6lpCV1o70ijIcCugtW4gLz2lDiZRmBx9grVB88y7cIT+YXDvc4tgb
         3FZGJipm8aatx0buj1iEY3KrdQOHpo+mzbo3TTlWkmlPrBO89V+F9xmNBvpU0U0pk2dm
         Vxl0JXJhCWtjhaDDtDziqbhi6RbpWIvDikhtvQ8ArfA4TLareHeIXvp3LrDrpY2//tMC
         +a82NoixmClX3XucpaokHnQF7PSvhbEhQ+HVEwrPjCEAzC/EieXH/ZptHZQdVSqT9iJY
         9YTw==
X-Forwarded-Encrypted: i=1; AKwUvBxbwANQH4cJ+Jq0SdhZf1YLHDKzHU96WhEGIsp3HI3qb+uDLZSXwajBedOb/KyYAoXHXIbFnm08+GNaVxk=@vger.kernel.org
X-Gm-Message-State: AFuF++l7gE+wflCfvgOV6SQHUoi41XOEk0lzcq9vdPffSbLHBJG5S3mk
	EvXArAvhBJyH81eWKpMNZt4JQp27/m/pnuvGolYdo+N7L2EYjvYJNFUy
X-Gm-Gg: AYBFou0S8gED/OuyZouCqs6Bo5kK3Y8H8cES50V9hlQyh7IC3asXFk3zZVERKwp8siN
	bguwOxi1/dTXFXFaIrrZv1ns8fezdbFWoezN0LHOjGHgWQnXDB45dQ+rwRsmQG0k3XiJdRQZ/g7
	w4/VhWdSxO/7NXefrLUwSWkqGT1oYQVNJ4EyY/aX5a8ZlvjY97mJwh9fHv3JZEYvmpZpTLLn8Ym
	zt+ooYbdiGrH+iDCqnC3+GYoA0ncm8oZnKf3YwCgMbZ3EWucLGHp64eA4KpnYdUGK5Oh71B7lWn
	jrfxncuX03EYOX8B1Yp++jYycI3/IN8u0rQF7lgikupFnrd3X87+w79udCKWI3meWaBFB63ISi9
	qQqFWY1f/8IvkKQRGG7Ftr+ml78eYtFvWymIjbIAusAgOZiJTl0do1n/kOVSuAC0IDhZWrQkquI
	Z6jeA63fo+N6k0kkF7YKWl1sCA2EDxyeKvohJFLffxPDKrJQjPNwPpczS77m+/dQsMsDBDlDFjC
	QOs4m9XvL9thFjNL0dc3UxG3REUoSWZ3/bgisQgGT2puS0Ytyz0d5WiaE5MduAulJvsNFOUI5rO
	P2r1e47FitqIqxynRcktgCeHx1m2ZqExlfxUBCg=
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr31242218637.27.1788742152360;
        Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm22771048eec.9.2026.09.06.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:49:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mtd: docg3: use devm_platform_ioremap_resource()
Date: Sun,  6 Sep 2026 17:49:10 -0700
Message-ID: <20260907004910.226013-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource(IORESOURCE_MEM, 0) plus
devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and
returns an ERR_PTR checked with IS_ERR()/PTR_ERR().

The canonical docg3 register window is DOC_IOSPACE_SIZE (0x2000), which is
the size any platform provides for this device, so mapping the full
resource is equivalent to the previous fixed-size devm_ioremap().

Built for ARM (multi_v7_defconfig + CONFIG_MTD_DOCG3) with LLVM=1;
drivers/mtd/devices/docg3.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/devices/docg3.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..bbdf3bfb0e70 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1971,25 +1971,15 @@ static int __init docg3_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtd_info *mtd;
-	struct resource *ress;
 	void __iomem *base;
 	int ret, floor;
 	struct docg3_cascade *cascade;
 
-	ret = -ENXIO;
-	ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!ress) {
-		dev_err(dev, "No I/O memory resource defined\n");
-		return ret;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	ret = -ENOMEM;
-	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
-	if (!base) {
-		dev_err(dev, "devm_ioremap dev failed\n");
-		return ret;
-	}
-
 	cascade = devm_kcalloc(dev, DOC_MAX_NBFLOORS, sizeof(*cascade),
 			       GFP_KERNEL);
 	if (!cascade)
-- 
2.55.0

