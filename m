Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650547;
	b=5iY1FGviDJF4AalfFlQGON+uAU+hF6D6E1RPAmthK/LfM3RMOsaiNAZeGe9pApToC6AG
	 lkHoB2JAlpVw6nsYci4Uv7JTz2zWbBHLeG7wOtSKWX4cJxiJ0Jnm0r3BWAYKpZsu+RQQI
	 RJpd/DvtCbS6rrDlebc5bV9EFQa8Qevl568jG+pGg9kxYJEE9vM1hs4dnw6GoPNowAbht
	 wXDmZo1r6AIeLNY0JRDGdrIytWjTh/jxe2ba9zcjuA48VW8QKaSNQAGYHedBv+63LDyx1
	 WHu+bVoPApeY1HELsCYTmhAmn+spsmLuZkAXUHChfDq1Qutz+jAmtpeRiJDXBrBtrEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
	b=RBGJegYvwHC+ggELlOyk/WJ7c3q2ptQI3gltgV24J8lIBZn9AScikrMK1uCXNgTyZYWk
	 whS7p5UDEqes3gaH9nTCl/Si/0WIOKRJFb0srCzbtLQyWUtL/hrMjtCbNmIW5/p/0VvUU
	 y//4uw1MFnHCIHVM0jCiZr6pY3b3pRg9rpNrb9f7qgGD4KU6s8oqSJIA6NmBMVZNVrljt
	 LNBmtvsIdo80UH0iBMIfpS4+2cMg7Na+R+zIfHj1GRW2GOxYxFgSYO1zZANraDHQ8Zqnn
	 XZNPPA375qiyUAI/SKMt/u5Q9RP8JzkwEPek9buMzI1x/1faGSNEITKou9YzYFtN76Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwLk3DV;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A5606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5A5606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwLk3DV
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso3527025e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650545; x=1795255345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
        b=MxwLk3DVfCLIFb1ydz/S3v35TM+sQoaNv9J6rVkZlvovrxMD0J4GOrpLGFGX0k+TZE
         vAnEA2AGZSYERfvJ75He5kwyoEC6orUcXcHVy2b+ac4w3PPtGpjmsjEONWR2eORbGsJc
         pZCYGDGDbRaSz/AHMbRiGVGYuK/CMaBasaVZg/gfWNe2yDGZ6Q9IDPvKFTAu0w84tejA
         nVndqfqYsm6n1BDJS+BbC2UZbL401ghzlNl/pLTGZRHNCXta+Kzb9o+1vBXqIXeMAsk0
         bZMwqVcf2AIc52RKPJE5ypXW25p/eapqQVvsRMt8c5elf93XDI5EHF5f6tSZobnlJfuX
         Pp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650545; x=1795255345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5u5RK69/mPjrOb3K0zsus8OBr6kPMDbdsuU8MpIs+4=;
        b=Ug1Wbw8lP065oSELOwvec/4emT/G5OYsVDcJKgUmuMvGH25VKlEBTw5XkGJTP+qBYJ
         3aolylK5DSI7N95/ekC303+w13TSSzBEaAlCeC6EIu7XOXbF+NXMNpm/pXk+43Jp+Nrt
         Csmbk2RWVUO6HIgZ1DaZ5j02vY9jPkmlDE+JfbbnLaU+RiARJ9gxTOeefMjvrIxZsUcQ
         nxBn0IHlpa+hkUiRV8YchcXEj2TcQcQzVpmNST4bM5YfyDSOCjBULUVGXeWyEE+tCaej
         Yvt9zD7ji5HiNXwvuTS5urrxqukKma7T1upz998K7GW03hnRPse6TmvY9KZP5gq11NI9
         QpZg==
X-Forwarded-Encrypted: i=1; AL+hErHFPwtdSOGfnXwiR4geTc2xfWVXJ7ehgFZmxNACA4PIqBPxWDnLphrRykEm9SchF5yiOUINeANdxF0xMb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z90AlIXL4vNzgRmRzWJwHjdjMwV5DWrXpgYkbpEQczwgJCkbL9h
	HFltnz9BkY/q6bjgGEEfFF2qtZm7J82tWs4+hGDM8j6GS5IvC5lEEhhf
X-Gm-Gg: AYBFou3PUXfjeLKUrkwm/PdhpMXPIqgFJ5oBKpnCYLToGlrQrD4Cde9WHfSOxyJPdfN
	tsVul1c1idjg6iqmTHVBpuay2U2RaTq2krX39S7EjTTTDw6CxBEsodqtgv7S0Smqa5bes7ZTbAZ
	koTm6jAzUeE4c/RF5v0+8JW+lslbnKMnOP+HZD6ufOAt4fjBr5NjX4n8cvYnjejdJUEXDKY2PFi
	cWMgsqq/gVa0MUVC/X8AlZBMK00CSXIyXVyxuW4d5CwZR4mRdaJo1TyGjTHE+Pr6j9OCEhi+V37
	FsZ8TWrfXyfVIj2kIw3i38DiumYz77ZOhHoiY5HtdtHCbS6wSWoSVX80WuW2T3fOAksBSqq0u5N
	SlvbwGPd3atukWnLB+HAEGnWnA0F4oBfF8KtiZX52J3OMfNM27zBNtgU4fDwrrtNhrnyZoAukU5
	lhvF8dL4weL2Css8BaYLL0b6AKBiqueX8/Gp3CAO4EWNocGNE4nB06P9NTzBqQChtcgPkGp9+rs
	yTLyu7Lt1bhXs5/nxCo5EtdfH7Rw5c8uRyEVdg6E3OillEsj+Zfdx4/mLkoGTJKEDHfY5xievf0
	NSGhKnBHldkQVlfL27fgE+yvX0WWm3ioNw==
X-Received: by 2002:a05:6000:430a:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-49c6fd93307mr12159903f8f.20.1794650544657;
        Sat, 14 Nov 2026 02:02:24 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:23 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: sm750fb: Fix DAC power-off bit handling
Date: Sat, 14 Nov 2026 13:02:06 +0300
Message-ID: <20261114100207.9124-3-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DAC state extracted by ddk750_set_logical_disp_out() is either
0 or 1, but MISC_CTRL_DAC_POWER_OFF occupies bit 20. OR-ing the
extracted value directly into MISC_CTRL therefore clears the DAC
power-off bit and, when off is requested, sets bit 0 instead.

Translate the state into MISC_CTRL_DAC_POWER_OFF before updating
the register, preserving unrelated bits.

Fixes: 5372350be30a ("staging: sm750fb: use BIT macro for MISC_CTRL single-bit fields")
Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_display.c b/drivers/staging/sm750fb/ddk750_display.c
index d619e00fd88e..dbbdbe08ad38 100644
--- a/drivers/staging/sm750fb/ddk750_display.c
+++ b/drivers/staging/sm750fb/ddk750_display.c
@@ -7,7 +7,8 @@
 static void set_dac(unsigned int off)
 {
 	poke32(MISC_CTRL,
-	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | off);
+	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) |
+	       (off ? MISC_CTRL_DAC_POWER_OFF : 0));
 }
 
 static void set_display_control(int ctrl, int disp_state)
-- 
2.53.0

