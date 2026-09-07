Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF551B3B19
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742674; cv=none; b=TZwyodxudkQ9IQ/mXWag1VquQs1uZTxMSXMlYsZXIFNyocTcEvXCNeNsOCFlpoLWOh1yhfNWssrcus0IKYnw5ePcKtt/g9R+leYeeOdALkoBGOxQAKYa05w46LLimRZgW01QUrcmpZV/NK5XsXeqD9Cvw3pLozEFNwFJ3HOxLF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742674; c=relaxed/simple;
	bh=AZjom2PB7UknyQo7QhwjHMw2wFDh4BjnRhyJ255BnGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLFnrD+V56M7lgwDuKEhRLIrWuSG6UWeWtgVtMtGkKSLBGD2RYBU+vUR0EYKPzdGCwxtWSrbrE1Ybkt/jwdm+YtfwF6nyzdtd5Cd1Dp1YX4E6Fg8beKPv9mkyFknlAqACKywEHY1VbSEqSCPRwnARJsSbnHEvj54ky9ZAfaizmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpaAu4Cd; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpaAu4Cd"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2337155a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742672; x=1789347472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KBRkywu7hyFM0XGKbQfON7bqnqwREZTWQJYpAcPCSE=;
        b=fpaAu4Cdv4RTm6b59pTmqomJgi50fltH3/2znfQKDt3Vf7LsegSdBqy7rpPlKvVDQ1
         13DyNStq81j0beBE3l+ErgNnrlBHMOZ9s8e+vrMktr966WfpcqLldVZEWKFw5KQ90Y/P
         OKI1cIvuDzgdL7E8f5ufCHVKHrEWFxDdN6pjZVe5e2eQAVMgurX0GGLGQtR31ydOOUPl
         szse+PDsbW7am+gtIAer8QfU1Jsze3smFqlEjxTRJ4k1YKXlI/ko0WoZIuIsMIvXmQ50
         QA5S6yQTfJ7rjtP+I6gXY2cy4eKmtVWn8GAYTvkX7dfBr6qxi8XKvtY9Ph61decIg+as
         DXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742672; x=1789347472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KBRkywu7hyFM0XGKbQfON7bqnqwREZTWQJYpAcPCSE=;
        b=Y64e4dms8XhJ6t+8aem3nf0jqfhvaT4ECE/wqdpLFNNDjri9vR/kkWc+tNgW6Q1sTa
         uyY4Bg5bhAn4jtSQx6LBy2TtkeSR1dNEcnx+5IjPcDsD4VrlDdh3iHf4m3dDURJ10MST
         fxcKIbrIoTE47S7pucaCDJwDsekh4de56n07Zmap1lPRAs6UbrqryVxossHSLhFzuaNo
         kTdfdiMDeKGRZ1Z1T3d2wK2WaKzlBYO03Ze3BXYyUys5GV+M0WUJDLRwm5/rQPNUjeJ1
         7XzzSP2QvGVZbNgadhEKD3Xperez7IVCsfI9BInJ8pwr0Rul1hj+sbic8WPwfGLUf0zx
         8pew==
X-Forwarded-Encrypted: i=1; AKwUvBy9Hpk5WYlNZrWr+5qwAuVuCL3z8VkIXz0t7nOISl31fBX5y2xmNiWHRq0mttSn6K7bWoGvo2Eh3df8keU=@vger.kernel.org
X-Gm-Message-State: AFuF++neh3g7kB2il9u4S26soI55nsCRt1W1Su81Fz46LwF3+Pm5npi/
	nKkU7ev9B4/mH9GYErmRjnU9Mvy3sg7d4LZXaT30cGDyzfwfl9ZHj1nV
X-Gm-Gg: AYBFou3eXuNKipVKfw3XGYRumzzOwmjelEGOZkSAuYM63HzTxOyqZpvYPrbDa6HxSlB
	ebQSjFS6H4m9N6/t0ucgj9afPVq2ZBfL8X2H6pzq/XGBa+TUnquTaFLMwb9PKOLKDCgZ9t1iKnc
	QVsMDOv1quGCTPbHZPYx0qHHLQfCsZP+1NvLAJ0ihHcEKB+eu7Vaj4lGmPF8sCOXK9q4rQ9DlGG
	Uf7om+pVTg6NFwxqgvVAmu50R27252JeOqIk0i6l51+HjtyDwHZItJXAHfRqiVyHituj7fwZmRI
	fV7AooSDOqsPaiG/exJPkgZk3+JehzAaveVxdGjtXdyfIGcEvEDP+DxNr6v/l8HNbMuepntfBmT
	BNO9yckWPiWHG7iEusEScUHF//Q3ijti7diHIsrGq/OT75RQLDVKWP+fb3Z/EDFB6Gu8wR7HUeP
	JbKEBlWmIZMIQPKbRS/SLAeX45D6jixUVxQyeEski8nt8elyzG8QQrD8dZB11I0n9DBDyfVXLdc
	ttR7zjaEoAcS2QLiH1ROqPZrg1Rv/pUda/rjiLOLfMo2yR9oH6hMEniLuGMu0PhkwiHJRCVOIUH
	DKxEcu23eJ5sd4fVmczxepFMLhW1AsFJNa3osw==
X-Received: by 2002:a17:90a:149:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39b2b115ba1mr20193005a91.5.1788742672057;
        Sun, 06 Sep 2026 17:57:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm16853496a91.14.2026.09.06.17.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:57:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] spi: orion: yield to scheduler in transfer wait loop
Date: Sun,  6 Sep 2026 17:57:50 -0700
Message-ID: <20260907005750.230103-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

orion_spi_wait_till_ready() busy-waits in a tight udelay(1) loop, up to
2000 iterations, and is called per byte from the polled, byte-at-a-time
transfer path. On SoCs such as the Armada 388 (e.g. SolidRun Helios4),
which also run SATA over the shared internal MBus fabric, this stalls
the CPU for the whole transfer and delays servicing of SATA interrupts.
Under sustained activity this can cause SATA timeouts and link resets
(sometimes renegotiating down to SATA II, 3 Gbps).

Add cond_resched() to the wait loop so the scheduler can run pending
IRQs between polls. This is a no-op at runtime unless the kernel is
built with CONFIG_PREEMPT enabled, where it lets other peripheral
interrupts be serviced during SPI transfers.

Built with LLVM=1 ARCH=powerpc; passes checkpatch --strict.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/spi/spi-orion.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 26a9f268b2d3..b8882229c054 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -370,7 +370,16 @@ static inline int orion_spi_wait_till_ready(struct orion_spi *orion_spi)
 		if (readl(spi_reg(orion_spi, ORION_SPI_INT_CAUSE_REG)))
 			return 1;
 
+		/*
+		 * This is a polled, byte-at-a-time transfer loop. Each
+		 * iteration busy-waits in a tight udelay() loop, which can
+		 * starve other time-sensitive peripherals (e.g. SATA) of CPU
+		 * time and interfere with them if they run on this SoC.
+		 * Yield to the scheduler between polls so pending IRQs can
+		 * be serviced.
+		 */
 		udelay(1);
+		cond_resched();
 	}
 
 	return -1;
-- 
2.55.0

