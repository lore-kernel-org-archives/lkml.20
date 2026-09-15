Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3E361943
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460315; cv=none; b=YF68Gi+SQFsI1FXULQA98x2KW61zvdsm+qrs+zUkM5YeUEyN14Ibx1VSPTNEmEUF70xLUJMvp7R0bpWWX6+njKP/40mzHc7dn4ec8FdUG+akMFvXGsFe2azWhE7Z7Wdv30Q9zcvRm+juye7z9kh0puwPpSxfY9u0LUifl/kcMXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460315; c=relaxed/simple;
	bh=lOQbPcQynRlGZ/Q50Tqj4rGQvSO+qbh5AVXbmj13gLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpyFNFsch+r/OG6Sq82cWMPOpwygh7Z561cOrxT/gfNLcDmNBz9RD3ZJ7ff4Ghm6KP9eNG1SphNJweaCe6OdF21Hc5ZJgNmiWRKKk5fRR66zEr7QvRY1wP5iVVg3MDO8qq9EoKCePxj+QObY7ADPwTF2LO1Pl1+UyXam7bGHJFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skGaUNWT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skGaUNWT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1398252f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460311; x=1790065111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFhutd9pqTGsF04ISvLBlwYD4248S5jglxybwKHrW2o=;
        b=skGaUNWTuobbCP3QnOI3cBGSw/YY5EpSkDvxnA+EHjdsprm25qDEVKJRVJSH8zNQ5x
         fXJvydBTQx0lsgemO0KJPOBhYufqCqtnzobbdowQgGLmfFDzrazZCp65rRx8EhgapCHS
         yOpFSpTiu9vVcDOV0GHfzbumAgTrhdJ87P2DA9XP6j6/WVo6nP9eU7FN7cHmx6G5MYew
         ZI+P1IUEf7viypoWUAQvBUvjKBj+inOJ/2aHRZzHq825rK2twQ1uxdZEVMmQ+SznXuMw
         MIQypgB1NPvvSH5Cs24WbCT3RyYzmPRimhLh6MuqwqfgBfoc7iS6FChLkAHWGevJ93VT
         KFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460311; x=1790065111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFhutd9pqTGsF04ISvLBlwYD4248S5jglxybwKHrW2o=;
        b=22uNnv37eQZA5/p4Ju5NzNIkMFa+F1bsnXygAZtgzl2W8cJ8/AYjttBIz604zoueK4
         AKLDbszCBSTYIc9fkl9fr/OtqocYqMUr3aD9Q5vWKxfeqiHN0X8y1cOCPsY0ISDNvMH+
         /0wIRGBXcqNWDAYIY2ko7j1m9o0PEt+LsXZ1v8NgXIUPSmKstRiDYOgPNhYImYpJW5Hf
         erSKCUOKZ5uX0Gol1B7g9dW8or2JiZsANWhWoKhFggF4SH4ylNbbhzC96Kx9EEOAYOa4
         uJNXV956yH18oTx5icW/e2lOvMll7iv/fPVVEkuqsVgtnFgdZtWsCTagS43CFio+VTuJ
         zKtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVGiYu320V9bzze8v0xDet5i985KQhqafj8vkGJuzv7UCmesNAlpbyevX34Pswx/yCenlQFbBG7d+tSyI=@vger.kernel.org
X-Gm-Message-State: AFuF++lGZC6kjS+iEJgzeXZv9hIm2kZqm7NGJPvZrDF+Brwdb6ITL7AC
	Old34AvK2v4R2DLTe4VRVlEGF7Alz9ZxptG3EcLRNhqjJHMZZ+R1Q9q182yndzfsF1o=
X-Gm-Gg: AYBFou0i+sQZg0vwSfzp+H4SqoFn/R2LIfAYXNw4ZgAMNAmuObrNzerehDvL3rvFBaS
	0S6kYvCJEUErQE1uwdMR25ZOlbLcTVljEE/PVdEjNbY6p/1tOUfJRTPG5oIjgQXNerQ42leKqmZ
	LMbfUO6EJf9CYKft996EIM2Uxcgqc4s4c4kkknQ1nE+jMk84JOkSY/SekdGq/tgIPcDNe/HY7uB
	DZzQADnCNnU3yYxDGMPOlKy+mlqwASD2ykvKhG6Z3DUkaY+0pXP8Z/4Q2psdCHS9d1pBE5KGD8A
	6YDOw7LsnaO32VZYN9cuYBj7ekrZ/a9b8ulxflnqGtwVHMcQG85MkPS6dR4kq0O5jLkG1QqmOk7
	f3mUCxN7MVXhbQwavVUeEucGHIi3zmcmHM3JICP5Wi8d2tbxmNwyR0l1dJ3thnGikDyTsk7TB8e
	1h+sEClIztpu5Fh+8hVzcHIIlHnnPjh3Hdh5AhwAY++EEFtqdgQ3E6I8haoc6IYGMg2yCkquz26
	4u++FNoCV6RROvOu9PnpSWhX/9c4Jaqv4ELP3cb2jd4IKtLjRDuWwDfRBlUXfcE3F9mftY7MRqg
	2lXU2/0o2QTgu8BQng1vycxNCUI=
X-Received: by 2002:a05:6000:2c05:b0:487:7fe:e96e with SMTP id ffacd0b85a97d-48707ff1dbdmr1656878f8f.21.1789460311322;
        Tue, 15 Sep 2026 01:18:31 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm31341974f8f.4.2026.09.15.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:18:30 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Octeon: size the swiotlb for a modular OHCI platform driver
Date: Tue, 15 Sep 2026 08:18:24 +0000
Message-ID: <20260915081828.25800-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

plat_swiotlb_setup() raises the swiotlb to 64 MB on OCTEON II with
memory above 4 GB, because that OHCI can only DMA to 32 bits. The test
is "#ifdef CONFIG_USB_OHCI_HCD_PLATFORM", which is false when the driver
is a module - the usual way to build it - so the bump is silently
skipped.

What is left depends on the rest of the function: with PCI enabled the
"memory past the BAR1 hole" branch happens to ask for the same 64 MB,
but with CONFIG_PCI off - which is normal on these SoCs when no PCI
devices are wired - swiotlbsize stays at the PAGE_SIZE it was
initialised to. A full- or low-speed device on an OCTEON II board with
more than 4 GB of RAM then has no bounce buffer to speak of.

Use IS_ENABLED() so a modular OHCI gets the same sizing as a built-in
one. Seen on a CN6635 board with 8 GB of RAM and
CONFIG_USB_OHCI_HCD_PLATFORM=m.

Fixes: a8667d706dfa ("MIPS: OCTEON: dma-octeon: fix OHCI USB config check")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -228,7 +228,7 @@ void __init plat_swiotlb_setup(void)
 		swiotlbsize = 64 * (1<<20);
 	}
 #endif
-#ifdef CONFIG_USB_OHCI_HCD_PLATFORM
+#if IS_ENABLED(CONFIG_USB_OHCI_HCD_PLATFORM)
 	/* OCTEON II ohci is only 32-bit. */
 	if (OCTEON_IS_OCTEON2() && max_addr >= 0x100000000ul)
 		swiotlbsize = 64 * (1<<20);
-- 
2.47.0
