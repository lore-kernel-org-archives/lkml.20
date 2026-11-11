Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383307;
	b=mJU+d0vo+UKRNAqnf+oVDWS3XKkBFHTPlm9QzqumjAehn2Ikz0E+w41xyIi8dlIklNwM
	 3ojymrg7JVF5tULE2owvwNqyKGqVI/F+sXgqg3phqscrSVG2EIjqRR/NHmF+KxMHavfoN
	 dq6oEsF9CbQAxRXvVD2pwH9oGIj4hh4b3BnH0qKGegZ4rxJSvOFaOJHLcu6lRCpQoK+4J
	 g0vTXpj8VkFwz9Jp5kmQ8Scn03Qf/g1+xKl/kAnC1NglKsqAXBQx7NpKvXec8DOJ3yBfX
	 dGEl8VhOkzAHSXWjLNkAEJhqEJi5ygKtU9i5VkkxvCIAQlO9AqD1bcVYz1C1MfWQEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
	b=vUK0C2S31gsQudDZMfHtdunAzn736qswm5MSnUffxj0apVkun1XfjsylNpQQ8QlzmEvm
	 PasKO9SfINaKTTIq8YSfHu9KSqypTlrUgJDhEN8fK9lZH+Kq8nGr0FbIjh4J3vq02+DyL
	 thWXq/dkG5pjLVbP/qQvBt3VYYZiMNReIGEfYvWfFCoSUcLndcska+ou71mbd+o4+nT6p
	 W12+MNdD60IEX4T47Dnv4ZljVUsTwuWXIFXyH6NFBSafw94PUEVMqfFZEmf2HTcF/iA+8
	 r2dT0qCTu+wXoMtrLJ+jRBw2I1AWKroXaPOHOKtbkxu9oABDtORuSkg8NutoaX6gC8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGGSrrcM;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4711606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4711606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGGSrrcM
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so23921101fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383305; x=1794988105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
        b=EGGSrrcMeLfDFxWOomLxeywx6A7alK3eBmumFzjnjbe8ScErqCbOYF84z69Ni5lgQx
         D1VnUEjEyRebOBInG+8oLHXQhnz12mo9q/HHa2SaDg5e5G8X0zlg0ool7/x4dApfch46
         FIJx/LoGMSLZC2PHyd9MBvyg36gvlObXLUiK/tPbvdtMj5CxbWIG92mGb9G/gNUr3knS
         9CKyNQdmeS//rWhL2Wb9hRaFxYJM7FowzVCKKeQMpeC289F/evX9ZXlRwizKXb8P8JUy
         AqTR+erKuXblTMd9MjhHVQ36QYBl5ZFFJSCfiClmRUMJcIGdBADa9iLPXCKFzSZDY/1o
         CwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383305; x=1794988105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
        b=zx3xEGpE+h/HpphEbZemqKO4Q6OUj03M4Ohn/ziw9jZ8JkMA5tu+lGLGViUufqAM5e
         KwUi/iV/Lt5ywfLKnxWHHUoTZUMAiOoPiH7qrgFcgkM+1oWwI+datzEl8w7aMCgvUlYH
         UhDX7gDdwb1uo3bsg0Ov3Dk15XQ1TpuzKwn4K71aoBbtZN56B0+Kt8LFpay6v+0TvZBb
         s6ND7kLsOarON/P1Z8DhJkh1wXIIvPnr4R2S2mvCsCW0/7FFyrTlqSCgIUlRgasM+cEv
         kcipkuGW2j/ZMxLKv9Tm1Yzn0JtDQG+MeGREQYHgr+Tvh/oQZ5e/Gb9U5V4pqiI1aQgi
         vIUA==
X-Forwarded-Encrypted: i=1; AL+hErHs1EpOCD65zSYlzZ5mbXUnc/8UiKCcrVBkn+AIUI4erxwiH6gSOOoGvYXoYYR5AuIhYbw0f4vudonazts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e2NCmHg935brslVdzULGj4iDOhbljwIz/jFbntNDoG8h3NYnu
	DV1/NGnKb/qp4ow/gmkqixD03bIp45nSzHELR+JJ/D/5zVDMDyX1dinz
X-Gm-Gg: AYBFou2SumMATa7jgekCkesdJ0oOKuChLf/LyRKrVgpyB3Kd6vGXNH0cNLNpP6n7ids
	wuXVU9VtRqalsnrqZ7pRsFw/63bW2uaDVYxZV3LoxQsQK3RrFXUEzWZTYxQqRSVjqXax6iBdkZN
	IMieVW9NVSRjNNe/Du6vAZY1P+8FRs4HGEmvWCC6IZLnLkj2o126lJJJFTfe5A2n25xcz0IZ/Up
	hhcUHR+7sFUli/nuUofci/ujO9va1+hAYF29cue6a7Ghg92TqMsaYxj/Vtg5CI+vLGD/S3Fpdl6
	f8asNeYAkleqAxJW/87hywypVWGHDTuf8ExA5HgIJ4bnPmquucjq591ZyWPOLFJ9u2ThQxBOaDG
	mm7ZO33PODV6Om1LS/QFQfjtp4XDY15B5nxkq2eMI6CCRjHRarcMERjXPyuHtjYvl7f+qg4APYj
	HCqkwkXHsl5tsOM/2Hqo8TbM2eINYoj8o4SuVeIaUZM2R1RtR4ca6ur8GGp7YXM6CgJs3nbewzk
	zGs3Tt75uOTv6xLKcqrY2r6RbCXriw2RfUqhyxMFZijI0OnIR0l/eOB1gCt7M1z9pzG6/PuHR9O
	h7iCjP+v/Zh1rRR7L0U8Q341zIfIqyhFx36ixV0hX7VF8enT4a52VmC0OjHaPBiC0cdpMhPTPyQ
	H5YyljNsfYg==
X-Received: by 2002:a05:651c:1592:b0:3aa:ef31:e51e with SMTP id 38308e7fff4ca-3ae1268e13amr2497851fa.19.1794383304669;
        Tue, 10 Nov 2026 23:48:24 -0800 (PST)
Received: from sakairlinux ([5.165.109.20])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0920535dsm9513081fa.6.2026.11.10.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:48:22 -0800 (PST)
From: Svyatoslav Mikhailov <sakairlinux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Mikhailov <sakairlinux@gmail.com>
Subject: [PATCH] staging: sm750fb: rename p_PLL to pll in sm750_format_pll_reg()
Date: Wed, 11 Nov 2026 10:48:16 +0300
Message-ID: <20261111074816.27647-1-sakairlinux@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter p_PLL uses Hungarian notation and uppercase letters,
which does not follow the kernel coding style. Rename it to pll,
matching the naming used in sm750_calc_pll_value().

No functional change intended. Compile-tested on x86_64 with no warnings.

Signed-off-by: Svyatoslav Mikhailov <sakairlinux@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 10 +++++-----
 drivers/staging/sm750fb/ddk750_chip.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1d87..6ffd6a2a1b06 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -358,14 +358,14 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 	return ret;
 }
 
-unsigned int sm750_format_pll_reg(struct pll_value *p_PLL)
+unsigned int sm750_format_pll_reg(struct pll_value *pll)
 {
 #ifndef VALIDATION_CHIP
-	unsigned int POD = p_PLL->POD;
+	unsigned int POD = pll->POD;
 #endif
-	unsigned int OD = p_PLL->OD;
-	unsigned int M = p_PLL->M;
-	unsigned int N = p_PLL->N;
+	unsigned int OD = pll->OD;
+	unsigned int M = pll->M;
+	unsigned int N = pll->N;
 
 	/*
 	 * Note that all PLL's have the same format. Here, we just use
diff --git a/drivers/staging/sm750fb/ddk750_chip.h b/drivers/staging/sm750fb/ddk750_chip.h
index 2a13debc179f..685fde67c2b5 100644
--- a/drivers/staging/sm750fb/ddk750_chip.h
+++ b/drivers/staging/sm750fb/ddk750_chip.h
@@ -88,7 +88,7 @@ struct initchip_param {
 enum logical_chip_type sm750_get_chip_type(void);
 void sm750_set_chip_type(unsigned short dev_id, u8 rev_id);
 unsigned int sm750_calc_pll_value(unsigned int request, struct  pll_value *pll);
-unsigned int sm750_format_pll_reg(struct pll_value *p_PLL);
+unsigned int sm750_format_pll_reg(struct pll_value *pll);
 unsigned int ddk750_get_vm_size(void);
 int ddk750_init_hw(struct initchip_param *pinit_param);
 
-- 
2.55.0

