Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540637B036
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966273; cv=none; b=jDlaI5SExGhayahIDp6dfPGkxXAlff+1eAOR/ftHRjETernljEzVFjToMRR3eIzxI4q8t4ZDMEvNukwgb3BOm+Kkcub5xr63y5aD79LkKEjUEjLeYVVeR4jmBK029oHF4Cjj6+rdaZu315R/SgWvPxCtTB0YEIWgOpxNSVNvQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966273; c=relaxed/simple;
	bh=IX2Oh5Sm80D+rPdXivsQbbkANvbCHoPuZCRqCerYekc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISEq4NL3HXCzckZPxnabQ3kVa+1nZKg6Bavbh6qu/mLHKviCWrW+lMuNpgaAaDHjne3QpWjWRd8iwvmbcg7aBOyE/lQL8HHqLhBi66pr3ANPdaRAEcKKe6a2JvLxslLsE6vIY6Rps+GcJPsZZ7+D0tZlsukqcx3QVnNYmt+q5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li8drIdS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li8drIdS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcb1e5f9so490915f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966270; x=1792571070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxdLcEY1thrJSIMPR8PdLXkd8KPKdgpsnyiFi+51MGw=;
        b=Li8drIdSQi/skecfmOTcIhSMFkrBjG6LSb21BrzPm2A/KUhrZJCj4O2gE6XFgrWdGB
         T+PjHx3z/h/bXnWZBWsm9k1lAnMvTiq974ahQqgl2wTwTfj2k3DYgyTCw1P0nk0T0vnE
         m6zub94D1dY8TlFibRCokp4/b4LmRqtX4IghMExMaEE2pCvxqnzs2E1oUycGZBp+0ckT
         3sOVK5IMO4jBRAS219TKmRaQklRyAXpXa2Bx7RmfkQXPCNfL3rCo8eVNTI2BBEWbFh3D
         Ye42wl6vAtvYhhgR4d8Kk7ZfugLojrr0Lb1drwLWGSvZnATYuU3xmH8EYGe5mvHyMWeT
         dwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966270; x=1792571070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxdLcEY1thrJSIMPR8PdLXkd8KPKdgpsnyiFi+51MGw=;
        b=h2QqT4f3+9Ahlz+YuiYytD/X/CE/cK58tt4SRBWS4AafNu+jFkmPjJK/1rJyLQJsg/
         GZoFgO70W2Bn/HdBjQEXyMKftRQLYlQYvRDPRdQHpKYRlcjjwN2f8N0kZsDOCuav0ZA4
         JBXQ2GW0wrvSvPZZubgpylxFhSgX+JiKdrg5+lfIKYTiVxDot3VKhCY+MI8PgH0a0N2I
         oogJ2wO6HilGZyizKzlwus4PxcwijQXpTE6HRu+uz77pQ0PO/rkkBW2g1DJITre7bH5W
         YdlknUNAFLk0Y3vzju+RpaEbowFylz/J5Hy6t+y7n1Ntr5PBN1zMphsnr6O0qnSr/MIV
         Or3w==
X-Forwarded-Encrypted: i=1; AKwUvBxEsDVY23izxOwyjZuqtAWW+krlMw8PwJbOK0wVfbjqaF6tEbqCGNCfC/XhILPg208iCamGWXUjwyxLrbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXfIGlVE4AHClsZ6muat+mwcGwYEF9iaTXeP8w5EW2VDLMLP/I
	wh+CmQJUN5yyH51W9yV3pS12eRbe5Tum8hkqu8IfRExZlxfWAjygdOyl
X-Gm-Gg: AYBFou0OOx2hRDmZI6CodmXzHZsLAEXLGshe8VbzARzM0N6O0iTRvVQUWTkvpLpgjGh
	+sbP4qU3ByCCz8u64tzDjlVBpPCY13HKAa7tn9/NYXOQXSu9eqU0MLEbhYxPHOOIh8FOaALW5GP
	E1dXWN54blgv5aS6Ka8FiYPmGrMKzizpQTvAni13RCrPpBXafOSG5hI/dyS9c7ZZhW9cjL4TeCh
	/QR+ODXG6fJl+lBfdo4VKsmWJ+2d47ZMH7aqNIplgN/2UEiY1BDzbIPtpKu5S6rQsFpTqOwCuZA
	12dpodQ+B5k5KOnQXE1B+ebHAthfvRY1LwQONj4G3RsIEsMbXU1b231maL0ta6yNvq25/Pp+9bH
	M2OK95ivZph3d24F21tRpi6xUKI6l36eVI0dHiJndvzDdeiKkA/jo199BPQstTo01/Fc6yyiG7E
	Un/irYYebxgCWsl1PAQCRdjF0TCB9jP60gjtFPoPw0KeA/GfLSso6djdRQswq2h2j9ahQ9I//XN
	PiBqEBFVZq3upDFgH5WMgC47tbtcer7YtDRREz9k/27sFPFjapIni8U/v6F+CQc8e0=
X-Received: by 2002:a05:6000:4312:b0:48c:45c1:5592 with SMTP id ffacd0b85a97d-48dba6f57ddmr28209823f8f.0.1791966270291;
        Wed, 14 Oct 2026 01:24:30 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm4122409f8f.53.2026.10.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:24:29 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	Manuel Lauss <manuel.lauss@googlemail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MTD: nand: Fix release_mem_region() size
Date: Wed, 14 Oct 2026 10:22:51 +0200
Message-ID: <20261014082258.33315-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In au1550nd_probe(), request_mem_region() is called with size
resource_size(r), and release_mem_region() is called in the error path
with the same size. Howeve, in the cleanup function au1550nd_remove()
calls release_mem_region() with size 0x1000.

Change release size to match request.

Fixes: b67a1a02d463 ("MTD: nand: make au1550nd.c a platform_driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..623a10dbce55 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -348,7 +348,7 @@ static void au1550nd_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	iounmap(ctx->base);
-	release_mem_region(r->start, 0x1000);
+	release_mem_region(r->start, resource_size(r));
 	kfree(ctx);
 }
 
-- 
2.53.0

