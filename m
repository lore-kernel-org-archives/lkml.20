Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528911;
	b=fAcRQbMKCWeAPHmF2ZlL7WwSPYFTMmYsuWqgI/H5KjSYQT+dpc4roQAmXLwmQcIS7hQk
	 L/JbYU2oMTYcvQwjNztRgLuYVKZRMMKyN4yO8OPuuXD9yotlmSPMC624jbgbMiq/PoQua
	 99JoKbPk97IITd1I8cg2E+CC7t7Y01gYGLGYL5Lyf2pvz7/4i/7qTJwEWCgiZKwwJkGMH
	 5YjxAtMGN/v6ietFHOXxd7Fetg8Ph8NDcIfEAXTxB4F81B7KgskYBtg4CISIQkr557vLd
	 FD3aT8r7RBHCQqAoHFuGKC3b0hJpFM58qcOgvxQNfv1CcMFWGpvY5rrReAmk2bMURIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=t0gIiY/WfdhupAHlml8jUVBlRYc+AWGhs65eDGGhQ0Y=;
	b=4oxcc1DiZGQI9HVZyWZms2igl/FR1UFA3jTKXAZE4wz+4gmviYIhKDL0Sy35qL5mk7ak
	 Bn1Khm3hCI7Az+uNgoBKTJ/83rPo41cZJqfDGJzqMjSvAhcE0Yj4SEqFB721GnTj571Q/
	 z8uGlbLVuu9Ck23Fc4cgOrP8zqR5CFyAxaLg2QFwR2HTb76+fBKdGPljlvTBMcgaoMhyu
	 6E+dTAP/FgEBMJQkvIJ4s/JWWhYM9yD3o4F9WmmCrv30E8iatBrgcznrJn07dbqwQoZyR
	 yDIgiwgE8r0ATs3eunA5v43qG5gdgAIGahXdp+T4zpd0rUxRxiRQq1h0j0HLXCCxGow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiDsaYX2;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0688606A89D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0688606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiDsaYX2
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso365983e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528909; x=1795133709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0gIiY/WfdhupAHlml8jUVBlRYc+AWGhs65eDGGhQ0Y=;
        b=LiDsaYX24xObCLaFpUBLQQcNWnEM7DhCcL+tmoIBeU9U5m+Af3RNrYmwotFo6dHqV/
         eVRs2DRbyC8RAwgS5tojwuoJtwvP7jis5ZWTH1XL1gUH06wWq78wpGnagBJlziF24Gc8
         qunX9Vr2+1n0i7pyO3V/W9Jn4AkX2lAAkkJMM9Zed77xLdofboonKslFttzGFsx7qtg2
         3FowPsKYcIjRAT/pLyuvz8TkF6h8neIH7QdsVba4LnXJ3vnL8DPpQLto8PFIs4FdXYfh
         2CtXXp4YhtV5G+Xols+ZHy7x20yQVhNa5L2ocASa405eXba46+ZoRbwzih8tZfi8EAvG
         T+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528909; x=1795133709;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0gIiY/WfdhupAHlml8jUVBlRYc+AWGhs65eDGGhQ0Y=;
        b=oTR3cG5uLZToXZhcuUwzC2mFjKlTsrla48078y6kb66bfic2GP7VEqw3SZuHhLhPtJ
         3B2WWAnt3u/88wlkuhkBZZQcfkbbwTffhvbsfJHjACB1wQjJbupvG9NdXKSQv/DWe7c3
         cilpo/J3KekFt/VxcucBJPLJ0M28aDi3bExobGBkmJhyTltR19C2FIfiqYdeef0ZqbUm
         uCpuxcnGBo3Aarn41yaYywab1b3acS/1LYtA6x9v57OQ5LgUpyzkYJdo3e4WdxfyTfpT
         31uBieQ5J4ptGJ7wZZHrTiQUK8XGV6nuNuy7rLQWnCRvDveV0kz2DfUPYi92UU7K4aYu
         9fWQ==
X-Gm-Message-State: APuU4Z+wc6rubsFE0nGq+HttY1kjTl7sp/wM5JqtvduN883e+NE072Fb
	NFIFN952GKwwMjON8enwvQRLqCEOyIfcgAfAhTEMnKh8/B5487Z+m+q+BFaUFby4Yv0=
X-Gm-Gg: AYBFou1u4/R12Uiaj6KBmnJmWQs6CzzAb1lQVBQ/BzVSXQqtHcI8aIpAmW+Rdttt9F1
	ks8LqpTaxq+RutYn1Lkdtn4p6i1u/H1myezf5TcSPldIRuyAQcuIeDwrVnUxiUvu/o8hsg7JOVW
	gvQCXFIXpHWjYGrWLr+Hzt7NdBelLjiH7xqwOu+zTBNZxxWGCNqEc4eITbslr69rYVApeLCamld
	itYy+N2KqIyC4wCDxDamsXIaEWk+qr8Q2eZXLm2x2Ci+IHEAfec7hGXbI7MDS3yxxwjjk0Wf60X
	1/alU1WmTbWMTXWPqiv2FZirWEvBbJTrvoxjLBOzWWUlc4rI+pMFNHzHW/NWavolvRLy1smRVua
	B4Kqb1ClPmWW4S+jTXlLKhlVgmSTBYWu289o2/y3dRj7MydPGzhM74hzKuSZxLJywxBqyUkF09N
	GO1EgGGSaxBq2atLcDumzvVCYiVJv95HM7E3A/UL6wOI703fY7S2zJidmYibqSPVFknnAOLLNtg
	9iE2o+g2W1U/5y1nfnW5W7RJI3eKJyj9QCeC9dRmMfjy2vTsKqJsFZIJRFW13O+eN3lOknqATYi
	YJGtcZji5Rt2UVCTkv0PYw8HI4b5mRzlOwEpxhihnYyj48XN/p3KamguxcqH4gLZgNZUNjsZod9
	cVRx38MIYTQ==
X-Received: by 2002:a05:6512:1325:b0:5c1:4c83:ae37 with SMTP id 2adb3069b0e04-5c1705faa61mr362886e87.2.1794528909056;
        Thu, 12 Nov 2026 16:15:09 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:08 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] microblaze: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:09 +0400
Message-ID: <20261113001432.128201-4-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/microblaze/include/asm/entry.h       | 2 +-
 arch/microblaze/kernel/microblaze_ksyms.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/include/asm/entry.h b/arch/microblaze/include/asm/entry.h
index 05acf4d7b..f3e4a6eaa 100644
--- a/arch/microblaze/include/asm/entry.h
+++ b/arch/microblaze/include/asm/entry.h
@@ -41,7 +41,7 @@ DECLARE_PER_CPU(unsigned int, ENTRY_SP); /* Saved SP on kernel entry */
 DECLARE_PER_CPU(unsigned int, R11_SAVE); /* Temp variable for entry */
 DECLARE_PER_CPU(unsigned int, CURRENT_SAVE); /* Saved current pointer */
 
-extern asmlinkage void do_notify_resume(struct pt_regs *regs, int in_syscall);
+asmlinkage void do_notify_resume(struct pt_regs *regs, int in_syscall);
 # endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_MICROBLAZE_ENTRY_H */
diff --git a/arch/microblaze/kernel/microblaze_ksyms.c b/arch/microblaze/kernel/microblaze_ksyms.c
index ad7596d7b..40915d400 100644
--- a/arch/microblaze/kernel/microblaze_ksyms.c
+++ b/arch/microblaze/kernel/microblaze_ksyms.c
@@ -51,6 +51,6 @@ extern void xmb_manager_register(uintptr_t phys_baseaddr, u32 cr_val,
 				 void (*callback)(void *data),
 				 void *priv, void (*reset_callback)(void *data));
 EXPORT_SYMBOL(xmb_manager_register);
-extern asmlinkage void xmb_inject_err(void);
+asmlinkage void xmb_inject_err(void);
 EXPORT_SYMBOL(xmb_inject_err);
 #endif
-- 
2.56.1

