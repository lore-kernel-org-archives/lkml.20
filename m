Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89739EF3F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636594; cv=none; b=jkxT2m1c3YqbzEuRtbeqcXI0JAkzS2RY5TfMbcYl44zrnjXqz/gS+e/U+v1z2jvobhpxdmP6HkYfwY2WJiAVSBqL4flsDCVoci7vW1QZzO4n5if3q+h+a0N1eiKrOJwObZqdGe6QBqqN4CXr32aTqCdNcOZ/xOJFmiPs7oHfVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636594; c=relaxed/simple;
	bh=CxsncyAy/tDPq6kjsUgXXkzMFX+fCNq5D9C9gc0wrmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAV7Hem2Ok5xa1AnsWKDw0sgOQtjdnJFfmw2ZFHPJC1VEC6Tuoykx48ilYOi4taMbtKcYUZ7cV3nqwXCDHZdJbI4qtw+CSoUiF6RqxUy8AiPBkr6WwJNFAgP2HOFpnz1PzWRBo17SQ27A/qquVXlSoTkspYqBkrdcVTFZq6vrfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXyPJ10G; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXyPJ10G"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-855c26cf490so16641677b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636590; x=1789241390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehyTAAfhkzMCjjTA6sC72BjJDyGKRNvU9QfKc+XQjIY=;
        b=FXyPJ10GlIyE0TKu9e8SCb2+0OJe5doAUo+Ret1uwshbcspQtdqsc4mXMyqI2Mn5CA
         9ALwVWojaG+pVEBsQBqGvWIUaAsQL3qQDhTMFhdhsg106RBjYJhUOWdLoeG9q0/3pYex
         RfLhbupcXM9OJZoEffHqoK4eEfZSnn4NdcYq88DiIlCX1WVn7GuzG77VDTnV41vlBmwX
         vO3TJXZwuj/RGIm2a8TsBJy4Yw3nV3RcrZuqM7AAhjongaPagY8xKmdvp1EK5mH0xcXx
         D0MyDRlXBq6YE279Rwl0VA3a0OAW36rPMJGOlkFkeqFQiN6XPBlgZuvWG+jvTwUJKesW
         NwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636590; x=1789241390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehyTAAfhkzMCjjTA6sC72BjJDyGKRNvU9QfKc+XQjIY=;
        b=tV8AH7hBqB0oehnuefppulRFxS2WWmHRKcVsDOKgB2akeIMKPrD4QBuHAdWzryVR4o
         wzJGP4mkrFzhkV93SrqRMxerGJbbEym14tF3qvd0o/9Ow2ww7NFr+H3IKlXbYYMRi+b+
         oYwKsTIXlEJ+862tjYjoSPx9TKoYhilv7lNaAfPX+wAwdejKnAfdgF8t+p2SZ4XwXIzv
         GO1uUjVhIQbcqfJ1w+BCJ204hRLwkrmR+8qjR/+jOGZ4MePyyyYtFgFRxXz0W9qhJq4O
         KGNk62GKAkrKHqhXm+aCqd4WFAt1wUY6yTL1/I3ug+xOxmyJh1+H+HxWw6Yl8ACBkJBp
         pJOA==
X-Forwarded-Encrypted: i=1; AKwUvBzef39PG3iQLBrtEWeihAPYfQ2QkfjFDC8JgjvaHYSh5kXKdQkBA4xTij8wHw9ptPzFtnVUEoemrsXK0U4=@vger.kernel.org
X-Gm-Message-State: AFuF++k4wFZc5azTmXGEY2DEZo4jmmo2yn+eBEBlh9qJcoUNb24kGxw0
	xgL2cT7NjWkzTfTpa/m4LrE4M9no5bkt+sW12Ke5FdMEXJutPtOlZ+Q2
X-Gm-Gg: AYBFou0c2T6pSO4vNvy74hrh6J7KRz5q22JkmpParHi4dz/ZX19D9mIG+MMy2AAoOw4
	M4IpAuhKfJt12+fPYeB0W7mR8xRMFg4LEIQ9tTCD9AvFgt+B9UBSGsUxRLedFimhItPJiIZlDuW
	T9IyiYfts2RJD2jen/1nlMiR1AwYUAChVoyyJUJeWhe9gr2EhIMyYSA717sQbet6DKR0IrCQinW
	MRT5OB1k2hrVL+ROBXSwzgwNdriVsC45CsVml5jun7xiDDsK1J/qbiipuxyylL8e30LZVbSgNJa
	X0BiQezn+Rkq7LgYMTdtbTuo/X5CprY20QpzlVJ4ce0MK+9EGbPn8JLN7kdamK2AP6fHDVe+Elq
	Nza6wWX1aUVDnVdIUr82SAd4i9O61GMWQz+y7i0gHyFLelIAbO8V2Xr+ciNzrebP1ybcHdHlSRi
	XGXUVfjygfGycZuCUqsnyO1+ErQVt/7jfkWmlsbUmD1Rn6CjyV07qnIV0VURX7tQ==
X-Received: by 2002:a05:690c:e3c4:b0:873:5ddf:d863 with SMTP id 00721157ae682-8735ddfd9ddmr28099977b3.46.1788636590256;
        Sat, 05 Sep 2026 12:29:50 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm43034207b3.45.2026.09.05.12.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:49 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:32 -0400
Subject: [PATCH v2 11/22] alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-11-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=CxsncyAy/tDPq6kjsUgXXkzMFX+fCNq5D9C9gc0wrmU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7xnBDyff5cdusPor+VVb9Jxn2c+6aj0E+pvI495
 71/2X+Hjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLmG7wkjw2nGx44zOV
 MfnMvZMOmsqMAUxfxrvvfni9pPLDUu/rh+fSbDT8a1LW7uYRP+vWrc9/yJb+63R6Jla3IuvNqwm
 63EtOHtAR4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha's thread_struct is empty (all per-thread state lives in
thread_info), so the whitelist is trivially empty. This is more
explicit than the generic fallback, which computes the full
thread_struct size as copyable.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig                 | 1 +
 arch/alpha/include/asm/processor.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 8f97d6e22b28..cc69f94a1c5b 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -44,6 +44,7 @@ config ALPHA
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_MOD_ARCH_SPECIFIC
 	select LOCK_MM_AND_FIND_VMA
diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index 5dce5518a211..c461a26d47b3 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -26,6 +26,13 @@
 struct thread_struct { };
 #define INIT_THREAD  { }
 
+static inline void arch_thread_struct_whitelist(unsigned long *offset,
+						unsigned long *size)
+{
+	*offset = 0;
+	*size = 0;
+}
+
 /* Do necessary setup to start up a newly executed thread.  */
 struct pt_regs;
 extern void start_thread(struct pt_regs *, unsigned long, unsigned long);

-- 
2.54.0

