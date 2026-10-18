Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5707944471C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315631; cv=none; b=PshuN/pVBHKCUwA92Yas1F4uudiSf7e5944LhbWIdeKOYSwhTDDDuWFalzbxlgmP1ta9qUkE7VNp7duDk52FBnQOgh4jnFTAHrI5y3OmI1QAw2RGSxFHakHc/qVa8m9VLlHUwlocaXs9JeV00IuNuw2dhOyLe9bc+bAK13xv9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315631; c=relaxed/simple;
	bh=Wsa1/xhWCYq2/IBwiWNMt2tj93MBzhsZUygXRpg69xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkXaio/afCO0crU4nl2aaHZXBcX4ojQvWWo74F0gKUgQm/kxzx1QGC2gz65lXwJQw+0/TaJuE2xExgLr2x7if03OXWY8cednoOdH5tDGVzmZ9cfajk0ecK212JenTThkt9H2YrVWmc20LaGwbQgsoWanM79ksP10+edwa3MI/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OswCbOGe; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OswCbOGe"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2720398eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792315629; x=1792920429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6jUk0an0lKrrWdJXHLKdAJiipusBLjsQVAGLXI1SyU=;
        b=OswCbOGebAXOE0BXT6s3sSs9jG5CeVPtdhDl+In4WVjxQnSB2x/WbZAhAErapj/Iv1
         zKOaxXnKtzRiT8fApkRmVTy3usTJSemlGQw/vmrgbxI5IEkoMOEX0WPI84XU8BCe/rpl
         C1oqQc4dbpT+f3qR6O8CX9vDaMQenmy3JJRYu8YC5NAjZehdGwhyfBqHs3kaT4yXSeLo
         Lzz0tGbSbxjvWvjZHN//inaVp9xXhWSrsSGEjdiIeMDuSWyfenXEh2pwjT9NRR02/54Y
         4yvTo90G0osjYnDc3JiUpgUDyLQRT+lapu1+CKD1RUaXJeyBHLNQ6LYXG2Vtj9TBMBsG
         jqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792315629; x=1792920429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6jUk0an0lKrrWdJXHLKdAJiipusBLjsQVAGLXI1SyU=;
        b=ZG2cw3lIhYPga+S0CkC72vb2VvqimGWrbtYIhzxrPzZv/VtRMD1KtbKCdxRLuxoeNn
         5vtxde7L+Zj1aly0VyYHUmOops/3Vz8+Dl3CJ04y9tpP94acIjhiHRe9ZaEb0OBR588F
         c2m7Jxqp1UqCtf56/u8qs4jE6+mxEd5j8QtguG5oAxi2uf2dp56S36stzsfkBDgJuWag
         czQyoa5J94ZFEiaJCoc57KrEei+M2rhUtPo3YVshNGL3iNSCI0EZ+mw7pg+RZTreV8qt
         MmE+/DtH5N5LIv/mKmGLwLCWHR5fAW6gEun4t8ql9dBSGcJLsTZMoWO8u0SQfbGfTRkL
         l2CA==
X-Forwarded-Encrypted: i=1; AKwUvBxt7dZkr8DEZhaSESTBqlMwZaOcvMknsSBn72KygM70B+SbMoN/ZAuD7XrrF6ioJjPkPY6TPEPYbJ42qKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbNJkkAgjO8E/km0daj6pWrYRMHUHCWKaCshfooZ57mAlXJzEd
	BF6aUGEGtSiYb+O7VthuhLjitQnweWaiCq1/fd13vWM62jjpPXZo2bThzRZJUzyD
X-Gm-Gg: AYBFou2m4FlX+erlkqBc9iW2BxcSAQs3yDI9I4Mskfhz6YFcZGccWAzM5aL/2sib4bi
	3e3k/PlVOFNb+B/WZe2TgzVtsvPzbmSz9QNZdE6SkGeQitGSypFXXBgi+BfxvWeOCoELSB16VMx
	aN43HKhx24hI/87GSrcUszg9kFKvSp5wwEdShNo6gDCk2Ki9LZwMyJK/i2AxySiykk2Vid8S/rn
	0l4qi7UYEEUmJPyubzQWoKe9BW3RKfqD6PSbgii8IuVRHU2JLgT4Eul+xZD7Z72j9cXWdxTBaK5
	rG/rEjurhC55tXHMkyubqPo9RR5lQCSUfiW0AFtFuvKmDLZXjKJhWjZFPVtDUmgdKeEwYzbstmu
	JcqPdvyzJByijnu3OBsuJ8KefSxoai6FASnuCxE1YTtvHXpwx21qcgWg8lffjsw0jl84gXXV96J
	ZP5k/cjKWKtpwbnOSUQJ2qjJbRCs+TyNERQrKiWm2Wdnwg/Q/4fMkf+8uix8Y/vRBe+L+115S5Y
	cM6W6kapmera2xV1Q==
X-Received: by 2002:a05:7301:b13:b0:360:dfac:6817 with SMTP id 5a478bee46e88-361a18632fdmr6512862eec.18.1792315629172;
        Sun, 18 Oct 2026 02:27:09 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c2c:5bac:6f4f:b477:6604:1f68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm23637101eec.21.2026.10.18.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 02:27:07 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	himanshu bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: sm750fb: Simplify M2XCLK divisor encoding
Date: Sun, 18 Oct 2026 14:56:51 +0530
Message-ID: <20261018092651.49924-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the switch statement with a macro to encode the M2XCLK
divisor in the corresponding register bits.

This is my first Linux kernel patch.

Signed-off-by: himanshu bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 18 +++---------------
 drivers/staging/sm750fb/ddk750_reg.h  |  5 +----
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1..2cb849dea 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -109,21 +109,9 @@ static void set_memory_clock(unsigned int frequency)
 
 	/* Set the corresponding divisor in the register. */
 	reg = peek32(CURRENT_GATE) & ~CURRENT_GATE_M2XCLK_MASK;
-	switch (divisor) {
-	default:
-	case 1:
-		reg |= CURRENT_GATE_M2XCLK_DIV_1;
-		break;
-	case 2:
-		reg |= CURRENT_GATE_M2XCLK_DIV_2;
-		break;
-	case 3:
-		reg |= CURRENT_GATE_M2XCLK_DIV_3;
-		break;
-	case 4:
-		reg |= CURRENT_GATE_M2XCLK_DIV_4;
-		break;
-	}
+	if (divisor == 0 || divisor > 4)
+		divisor = 1;
+	reg |= CURRENT_GATE_M2XCLK_DIV(divisor);
 
 	sm750_set_current_gate(reg);
 }
diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index fe412ead7..b796e32ab 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -312,10 +312,7 @@
     #define CURRENT_GATE_M2XCLK_112MHZ                (0x2 << 12)
     #define CURRENT_GATE_M2XCLK_84MHZ                 (0x3 << 12)
 #else
-    #define CURRENT_GATE_M2XCLK_DIV_1                 (0x0 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_2                 (0x1 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_3                 (0x2 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_4                 (0x3 << 12)
+    #define CURRENT_GATE_M2XCLK_DIV(divisor)          (((divisor) - 1) << 12)
 #endif
 #define CURRENT_GATE_VGA                              BIT(10)
 #define CURRENT_GATE_PWM                              BIT(9)
-- 
2.56.0

