Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C13C0619
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636618; cv=none; b=sba08+WP9+7L0eHgOwJnGvtdGn0e/LiRIQTbnWR2xpXqDbBaBlHNZ8zPY6x3zSjSSXylpsQWWwgQIcwYXcMQCOEt0r5m+7ckUEmZOyUKBk9rbdp8cL056Vv8B2l0WH6AJYIFGDd+hFnncLhGuHFSr4vmDjbj2BweZKHGYP3NYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636618; c=relaxed/simple;
	bh=9kl8Y4vXW7mpcYtSnyY94BwJEUxoog49+h/hz2eg8PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKf0EK18XYgBB3nP6vYOdWz9oXANO4+YJG6opaDT/RRupUa2tQntz1SqSNOxRTq+oyhfLcVSXuNMgJjZJgc0u5tjkMV9IjrLRgDphUw3a+ULcETT/6G4BvpFxfxsDztYfSLKde1Lon2r2IxiGJB855CWn687O9o9/j3V/VtH+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVbmw/zN; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVbmw/zN"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1801769d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636616; x=1789241416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/GbBOFsbRaUEtva+q/Brm1zRmQM42j0+LGr/vouMN8=;
        b=kVbmw/zNA55pCQkMY5CKimyQLwiVpEmquXuGvVBuWsEwm/QBdVzq7yphIXBACucWoD
         z1XqqADYPIYEt8wo9FIyFJGaM5bGsGwfTFPSwhOfVjv/PgKc6juOHGDfi2E12ajhxlCU
         /IlETlz2G6CCu3Y6NkXypIkOimZiJiea6nUTw4ShqyC9SELum00hcvIsd9I8dCQ2tRmN
         OmGMBB/uNJuGPE38puLnLL15WFLREnyBho0lUUMalQePdaiPI0nnK+pVNLbttOFboCXT
         Lu1U0I8VGJPQRx9AhWE7XDbIP3K2MRemkIEqXV05cuq4UTCh7zWBGpiEhmHejkRXF1B5
         CGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636616; x=1789241416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/GbBOFsbRaUEtva+q/Brm1zRmQM42j0+LGr/vouMN8=;
        b=UVvRactiCmFAwLG/3mAER/BpbHmM+aBV6SgCsFgYCxsJWiZ5LH7MAEmjVwi0CY7187
         EGmUfe81mJXeI3czRUS7bjwpQ9dugo7XCUJ+9StGkBWFNJrirNp8vOVYld2C7U/4icdB
         SelBVKxlIINLCqYyGELrp1blBpF8XW4TWiuOKvGni9PVKhK+kyAl1Lf9mmCabn8TDLP2
         IM6lgyXiJrFU5peB+2dnkMbW0cr6TKYXqbDaFwK4LNLt7TqasSPugYvyVmqUKJQ0zCai
         J0/vq2YmYsPV8sfpS/r+JIzZQMWcMAueAdPaeqGPWvBUajgFw6L2itxSa0Updx4dsFni
         U48g==
X-Forwarded-Encrypted: i=1; AKwUvBy3TxvfN6bxwnXP/Wb5anSMqV9ZKwThjdHFnVO4aCasIr7ATo008aasfrdntklIMq/TDf41BGunVGaP2IU=@vger.kernel.org
X-Gm-Message-State: AFuF++lLxWGTVA+g9jIlzQhEBJj5oVyL3TfuImR1Gs6KKG4HwFxVqur1
	4C55vsWqnPlrDyOtSI2Auua/4sJrgGbbykEyz00HcIpD9Gd32QDftuOC
X-Gm-Gg: AYBFou2loZ/N4mJw4rNiw7sJV59F9nOgeuNbC3OTFOZhZRPmlpqvVW5IP/wumhfLyAu
	xYa7Gdx7+Jy8Lc2fxiR6DNDEmvCYkDlTtAhjPGKxZlTO7qshaVeD/vhFqhpBBznFazrQ1ddkfpy
	6ZXOOQR+0AORYxrjvpBbgHdDDQAhG2BpKp/tDIypePu+NuiOhRIPanVHUTR0evdhDU99vdELILA
	ZoNdo7Gs5iT5SXbIw2boohrU8//8TeKV3nykLDeS3Z48snxLRgj9ROQQFm1dr41P6ANoi6nXjqu
	MaVCvVJN3LQhJFE0rUpCeq3AuhJ9HVrnAplQEmR9qVzC/aO2cUjIV444uQt03DPOOFg3xbElkok
	uhkMwkapRK+dmX68CoOzbCDnzurliQRNF3G3awOwFiSfdSW+mY/XDoNCckQ+RXhQBHtcxEeS3p/
	r+cMrpMpyjFn7rWZ8uQKLLfYH9zq8wz4rSJf4Qr/NdmQUhSC7qhlM9mqOWvy6rAWBP8z7MV0o=
X-Received: by 2002:a05:690e:4401:b0:66e:5123:8e91 with SMTP id 956f58d0204a3-66fc1be2bbemr1785122d50.40.1788636615624;
        Sat, 05 Sep 2026 12:30:15 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48b374bsm5071393d50.3.2026.09.05.12.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:13 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:43 -0400
Subject: [PATCH v2 22/22] alpha: select SPARSE_IRQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-22-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=9kl8Y4vXW7mpcYtSnyY94BwJEUxoog49+h/hz2eg8PE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7Z/VGjNvWDkNLMcMfspqrPuR3JkysU9s1eEnrO0
 4lRm5G94yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5ZGszwz/5u4I1MDY
 OzIWs3n9wufsWl7rL8oT+Fcg3fO7KneU47XcHwv2quW4PA6a8r310vfNKWvkeB4+RuLtfeo8lva
 6bs2V+YwAcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

NR_IRQS on Alpha is sized for the largest configuration each platform
supports, and for Marvel that is 32 PIDs, or 32784 interrupts.  Without
SPARSE_IRQ that becomes a static irq_desc[] array of 12.6 MB in .data,
carried by every Marvel and every generic kernel regardless of how many
interrupts the machine actually has.  A real ES47 uses 87 of them.

That is not just wasted memory, it constrains where the kernel can be
loaded.  The image links at a fixed 0xfffffc0001010000, just above the
console's low memory reservation, and with memory striping enabled the
console leaves only about 16 MB of usable low memory before the rest is
relocated to an interleaved aperture.  A 12.6 MB array of mostly unused
interrupt descriptors is the difference between fitting and not.

Alpha already goes through irq_to_desc() rather than indexing irq_desc[]
directly, so nothing stands in the way.  The platforms do wire up their
interrupts by number, though, which needs the descriptors to exist by
then, so provide arch_probe_nr_irqs() returning the machine vector's
count instead of taking the NR_IRQS_LEGACY default.  Without it every
interrupt above 15 would have no descriptor and the handler setup would
be silently dropped.

Tested on an ES47 (Marvel, 2 EV7z): boots with all device interrupts
working, and .data drops by 12.6 MB, from 15.7 MB to 3.1 MB.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig            |  1 +
 arch/alpha/kernel/irq_alpha.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 96b38d320eb8..8efb2da3246f 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -64,6 +64,7 @@ config ALPHA
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select SPARSE_IRQ
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select SYSCTL_EXCEPTION_TRACE
 	select ZONE_DMA
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index f90ff898a71a..8366d6de439d 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -152,6 +152,19 @@ common_init_isa_dma(void)
 	outb(0, DMA2_CLR_MASK_REG);
 }
 
+/*
+ * The platforms wire up their interrupts by calling into the generic irq
+ * code with fixed interrupt numbers, so the descriptors have to exist by
+ * then.  Preallocate the machine's full complement rather than take the
+ * NR_IRQS_LEGACY default, which would leave everything above IRQ 15
+ * without a descriptor and silently drop the handler setup.
+ */
+int __init
+arch_probe_nr_irqs(void)
+{
+	return alpha_mv.nr_irqs;
+}
+
 void __init
 init_IRQ(void)
 {

-- 
2.54.0

