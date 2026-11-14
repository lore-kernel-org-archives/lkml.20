Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675396;
	b=NSW/7jeXsqpS+gjff2+J5q69pWY6+iFBZHDj9Yg9SYtA1QUtTujBik8LTlLXVPWGXYzU
	 qaRCPGRAFKQlouYzLfcb1UwatbBWwfXmkPlvAqshp08YeRa5YI0dKm0v41TWT+63DPmDJ
	 ZSU2cFgHEMFar+QLGSejbe18IUZyDy7KDk65GtAUSa9vS30uIEFu9IFtK0sLoSVQTJmEA
	 +ubjw5zh0s2Zl8JwVRPW16U/Vo61UIuFIroEr2mrK/MOU3Sz5gXAX14EBgJmtp8SmOxpW
	 LEWAQbnoU0JSd/E82kbouOooomeJreXDE73Hy8vve1mVnzyrKWXPzLTTqUOEG4c7y4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=97Dupab0wAFfQ+vf4Tt4W8G2ZvI6VlydimL9fChgukQ=;
	b=ziBy1LXTcdNY1jOQ7svxRD28V/4/DIQBil9ODe+a0qoquc6S0Ig/ID69lXV/6ccfbh2w
	 VM1MklZQgpYF4xdWQgVbo6Ld5TFwVxIkBg6O2CE9vbWCEFFKmoHPt4R+TDrbx0AVLMG8A
	 oOnaFkDJz9IV4oOIARvpWf+U1kw806FBEJsX5grCJSdfo/f9U+bC1BJCEESPHYKGdyXyw
	 mAmeyHGQKSHb/ddJFy+Fp3p0ESgGeQLr25Nhvfx6cniDjZEYRQPcTgga3j3gCMFunYbFe
	 px3d4dBKTwYXb51hBYHdZR0GqpvfWq6jF+wk+nu/62L2l4NiWfhNlJy+yDCa1MZRqHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FnSv0QoP;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F7606A896
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491F7606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FnSv0QoP
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccecba199so2440301e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675394; x=1795280194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97Dupab0wAFfQ+vf4Tt4W8G2ZvI6VlydimL9fChgukQ=;
        b=FnSv0QoP0eorn4un+GhNYdTU8/h3vkzZ6EtUPhAd29FYYD0+AisjmHFDFAwMd3y/Hd
         9c5kmyBrF2ODiRAyBb9HAQfrKt3Cs3cWDNGdhAimbAuUZs7k3aS/CNa4mZCrLoSOFDkU
         dkZtvw3egkhOi4iWOe1FpDZQXHMp5InvNn/MeWBypDyY8ptS8BAbO6qRcw8mFeq7rlL/
         lE8qvFIEvTpEiQ74eHYtix4nsyfAItwlL4WKOhNHIzx7SXUY/1ZmiTzX+HE+HwKBt2kV
         XDWY9xSnGRTj2NHUgxN9MIAVIOo4MU+1pKZnyPP5jbb70+gaP5eFUs5y8SSmA57l1GFw
         jKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675394; x=1795280194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=97Dupab0wAFfQ+vf4Tt4W8G2ZvI6VlydimL9fChgukQ=;
        b=jTMZm3ubIUHpBydiHfVcNQzk8amC7+L392WP42tiyFxt8OOvhoZhrXUMT7G6oOk0T1
         nJKtIPhte0i7iC+oVCG74ouqiyNnVEr2f4GosBX7/TPJ8BakXatHaRDHXr611izeUZDi
         xQR8/oyuE1cJph/jw3RYNQXscsFJWsX34s6ClwkUJqPku+iavHnBQXdfUGEafs8nXgJM
         zsJrSZpgRgTfgYdVe1sMLusi0bD5R1wv9gwh8EimA6JQoVvE0peNH+fIhjS+17BdQz59
         NAKk6oR60xCFpD21PfczrJ4oJfIMOepW1uP1yIilwWyv25vrXFzAS6lwF4SwAdWqZobN
         Jbmg==
X-Gm-Message-State: APuU4Z/q43pUQgWIRRqrPGZ0+vw00mD8G0SrWdCTyIWY8SB7TkxYbPGq
	OjcaQlT3Hkn/nEgZTpokefFbbhJCBlu4hdLvgF+Rp4t0FBGMOXjfiJxY6oK1kOTfbJBld8AC
X-Gm-Gg: AYBFou2SdKy4Ln2JiLVihLO8B8GtZHnjcE2c3tCUB3WOKH/qnK+qyoNSjPCFsEXeUNF
	zuXixoRJZ9yWK0QjofN2cenEDKrEQsLx70vSC4Nu60IwBpvgVpbAHePF+2Yg8nLpiM+ertQWwjp
	GYrp+AdxrWkmREy7eHiHz2Gf/p+47R4xlG2Yn/Cj043tgZyDHSWdTQBF7gzGTd1iGZmMHUODcHm
	DYA/5PSvhkM2VPkXnYwVKL5g79Womqov8NUwck/HVIU+Do1wQDNtro5lQNEVhCrXyGR2L1nuCa0
	X+Ix5QawKI/70lRTOnbfmQRlPRdXZesPUSEci0SO1EhbkW3Rr7gk/cCFCWe1OaleyOf5JTm7CDX
	aUlnO/o/AdZ8sy0fs8fc+ATFupqkyM4EfxYU/JyfFfRthq3m3klDqcBYLxHZcziXU07ivUrpDEJ
	KP9jfzUWyN/1I4aoAb+EqXX9EticKgKPysrD9mVuL7Ec7JgrnCsBNs3WPeVwb7hWE9G+1Kpa9gw
	Lmn3uVEYC+Q84InvogLjmOHrvpd8CJPHy+KReog0jOEhfV+fVJX6S5JlIq+1TMdZy1g4EsxRaHs
	kVZks/wdYIkBgTlKxFcjqO3R6h77DMgCh/SlPOJXhZgnFYIfvXPtYkpGCz6E2RJnpXeCC2FbvFR
	InQ7ZzJ6URw==
X-Received: by 2002:a05:6512:618a:b0:5be:414b:a848 with SMTP id 2adb3069b0e04-5c170a27851mr2450510e87.65.1794675394242;
        Sat, 14 Nov 2026 08:56:34 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:33 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/14] microblaze: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:43 +0400
Message-ID: <20261114165612.368785-4-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
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

