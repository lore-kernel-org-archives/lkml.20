Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9B2D781B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789935392; cv=none; b=MiznHT97Z+q2T8yEvVizw0n7dHCVpkiXv48sTZyfBtUj657nkhUvbPRWffj6TTdrK6LJZ7+tRpwGDGngGlGYwS7gwBQtYo70z3sjT9gc+q11JrSZJIesSH+heSVNOTj8GAD6B5Cbpx89TLyL0EW0AYXtxElnONNPRH8nkdNzyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789935392; c=relaxed/simple;
	bh=XBWrswrYkH+DRJJUnrZRTbom+YHkNeu3gnPUJsFDs9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ib06QcjAs2wceG93vH1lFMa0WrE+nGfJEJPQcr2M/dHtJOQEAZprMyWh+JJRgTzFp1YWH696GM8qS6XlEUmHuE6F2ochHuE4zL4pYB1fw4rdj17mepHSSdgDUaCYnSTLx7RVUU7mvbEjpMeBlgyg6Jxa+83Qya+B+zj3+iJ+m4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5Mwi3Du; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5Mwi3Du"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso16680065e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789935389; x=1790540189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUvRx48jmV6bVP6KiA3+WP6/NpkH0FRdNbK2IoWyhcI=;
        b=R5Mwi3DuAxQN4URBDvGsP6E/Gbg9FVxfyAsro4yZElVUz9sHFEE0C2FJdhL6qFuw+/
         qSoZs091k1OsMimQw1uDau0ODH39aq5+XbJXzWt2OyPRK2ULXCLGVB+Riyz3BVKnTpCk
         uzbi/HgjHZpVNN7xjnUwCcIKNeTxl1v4GlTN1YJ4piWyzahJBlNAsuqFFJqNJk/t2JbE
         FRe/eKvQsTVec37UXS0oQOs0VO5WdHhwFGP9xcm3mGccTI+eZjQQoCfX8F311OimYObB
         sXIY/fW3XRn9+HXXRiax2IgS1EMNry6CtcoPmOJeNFegkVXrNPzgNSAFa4iFleFhQYSV
         3q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789935389; x=1790540189;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uUvRx48jmV6bVP6KiA3+WP6/NpkH0FRdNbK2IoWyhcI=;
        b=YP0SG6o3B/G7K4g7wiVWn/II+IddE+vbYD3VRfkwYETEz7On6qKc1tqE1FXqdAq8XN
         yjOQBWgCriLB0H7sLz9xZ9dkZZkpf/USWcL/4tBJxkG1inC4ITA0l/ZlRi6oicMo+kI0
         w091YYJHM0Lb+FkwgeHB44xlroajbq1KJcAJPi6SrjJBEvwNZW5KkBxgckiBHQIFcA6h
         B51X6T9mYm0bku1qIvgkfd6Wj+xA0gEKgc9GQG8OemQOm9LmwBMxnkDOV9skXS4zl8Ku
         9x9sRm59qoN7JYwRveu/mjzNonvqC81A2ZsNWdJUZ7INJ+K0vAMfCi7NGKW/PoNtjI+a
         UItw==
X-Forwarded-Encrypted: i=1; AKwUvBy6d42UI83MBX2OhIjQwa9yWCuH91jQ+DJQsLWeI0alf9t7Po3LopC8Ld1HBfJxY6rUgDMREeOVtDI4dt0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDH0X9eu8ld9QxsuRjWYyaIvXuKqBL+IHHYPbqFal4X9eV7UIg
	4AvkAotfyKq8H/dxlv/CUCqr2OsLALu6upkxAv3YLbWK5wPzA/agQY2z
X-Gm-Gg: AYBFou3uk5GeXZkxtDhsMe5kZ9B6rbGInoooTvQDtYqBnIrAFgCQhxKipKLbf88kz4d
	a39oEWFXcP8U0GcLEFk55LqUZLWJYHgBlYGAyHntk19HhPPN0W5gbBTrwdcOQw2HiVMgrHk9bPd
	Ww8IgwLwjHQQ8pdyRcQ3g7pkC/lrCwTtCs2E0eG2CRYhI2tL1bHSfonHpgrc7fweEjIPx//rVXW
	jJRufJjmHl+Nuro7ww/PsEFNoK3URb4Tf2xxN923jrz5mWraEBKE9PQ0GQ3n6MutEPex3ZMxwkh
	N3VGhfmU8NvfRT+W+7KqsKlln6Nyq4dm5QocUKQ6xV7C0lauRgaHDlVAuxI/A1Y1feqLGAwf8vk
	YTq2P220ezNvP/HDlUXUox4RcmJUEJWwexxGA1LzOo3exBklolbOmN1I8H7MU5b+7eRdD0+zyoh
	M6AL97QaTO2PBhyEa+IsvRhTVIlF+6HV7UI0KFAfCTyyiDBRHK3xduqVTwUmQH5rOqLOh00hTv4
	ybA4vFITp+wRFw+BhB4CXPbKhXm
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr132160355e9.25.1789935389229;
        Sun, 20 Sep 2026 13:16:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm16480146f8f.8.2026.09.20.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 13:16:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 20 Sep 2026 22:16:18 +0200
Subject: [PATCH] mtd: nand: qpic_common: drop stray empty line from struct
 'bam_transaction'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqDMBAA0KvIrB0YAzXEq0iRmkzrgPk0kVIR7
 25w+TbvgMJZuMDQHJD5J0ViqOjaBuzyCh9GcdWgSPVkFOE3iZ1s9D4GdDkmZJ+2HVcJjDORnh3
 rh+kU1CFlfsv/3sfneV7mFigfbQAAAA==
X-Change-ID: 20260920-qpic_common-drop-empty-line-b007bde75912
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Drop a superfluous empty line from the end of the 'bam_positions'
structure group within the 'bam_transaction' structure.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 include/linux/mtd/nand-qpic-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 437448995187..0f40964eefe7 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -262,7 +262,6 @@ struct bam_transaction {
 		u32 tx_sgl_start;
 		u32 rx_sgl_pos;
 		u32 rx_sgl_start;
-
 	);
 };
 

---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260920-qpic_common-drop-empty-line-b007bde75912

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

