Received: from mail-vs2-f0.google.com (mail-vs2-f0.google.com [74.125.227.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BE3E00A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041819; cv=pass; b=HgmxzUYsDVVA+Hfba1g8HTagNo0wmAF0eUPiZZyg+Fk2/3Sjh+IeqXKR0wJK8/dthQ4KbYbstuqZ7AjWMoRXpJ9GNbvw2zUmi6+b5gkxYU9YV/DSueLnIrY33mvgrmuluqO8re++ckqEQKaPWDKmfmBpLts1XtB2wmXZNb78FCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041819; c=relaxed/simple;
	bh=wT0s5EB9ctm1xuUw4zYNpW2sr7V/a+FHygJ9Zzmu2oA=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Rzwll8CcYtFkYN9tiv8bp1Dyv7FfstMbbtWEkiubYSnj9rKTL4iy0nZsnwbax/XMZI9xZnj86mjtk78KMnPjj5ecCVamXPvnbeIlH6w4E0H9mrFndrwi4Gq9rYIW/OeTHOs9TWP5c32yQrxj5wdCfXHofIQQT9WLQFu3XXX6FHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=TTzVEVVz reason="key not found in DNS"; arc=pass smtp.client-ip=74.125.227.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="TTzVEVVz"
Received: by mail-vs2-f0.google.com with SMTP id ada2fe7eead31-7565f2f85c5so1179740137.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792041816; cv=none;
        d=google.com; s=arc-20260327;
        b=EIDjg9vw6zUi3D4J90Mc1XeiMDTSORTSAbvQM1yutJnu3oYqACbS8Mfb7SiBbHPwCC
         EjRSnHgyVn8dyeCsikpW5LpEBVXENEAw5ytEbLpy2H2mAzgv0IwyvTjirYPQ8oDrBf2v
         8ZCCY4jw+TQq1tlCEx0OHKehT0hr7xwJHvI7oVaSODdH/AaBPQsgYdCmAaP1MFFVRGkg
         7xVVw4vyXegqACkNT+kPqCWb6HI71PwOGa9Qp114JcxNUqNtXmVzwzKMZpcR/18glnvU
         TY20OQMS6JffbEpB9/WhtZ6ybrx47tbFY28jAs5blY9AXCSn7pFmorG8tU/5mkkwA41t
         5zSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        fh=omvkeFBEv02VqzJoqon4rJpsvM2MMntyuPd4qK8TNYM=;
        b=aeBnBqhvrr2oYFuBWHSeteLdah4/iynn6igMjSDNcEqS4Mk4oZHLu6f4BhuAfIxglr
         +c5YIWuoekLFomwKEPy4Ond/Ox4Gazoa8TaVAjLiJnNbXfDC55E0gczudvAOyxGLN4nJ
         /7xXqjrZao22lIjMStoG7+IkUaqRz25gUjShi0NdkKRMWJw93IuujU7VvmA2sz6z0Xh6
         HcMGoGb3dJXLVZzARXXKP7ZDR2bJfXBs0O0JU7aLPWnJxuN02gA6DG+G5GzTzj+74G+v
         W8KZFyXuLQF7pSM5otcxO1xA7ojTUwZuegSwWlWYa1Qj2sCdPywmzg+efedsL8pu6+I5
         oxTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792041816; x=1792646616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        b=TTzVEVVz7CCwHCsnQnrJb/QG0wXgiVTR+P/R5OATRyo0kS91ljPygoINKfSTP3Di18
         jHIDsl1gOhJ4HVVnEWdMjQxcVzolsL2tl/4wooxz8hMmDDZT5JcgB8msjQ5J5IZTMssc
         rIPcMDSFpssT/HI0/ShHvUyG86ki/n0+ywji22uqWgC87vWuY5Ji0PmAVn0e1Y2kdzwA
         scjtKG0t4tYQN1d4JLZi2utnG+6x5lNG6TMDwKNngjjlbjqBVIIUp/XqsJh/mO06ZUx8
         4lFsk2BWriwsTfkGykJSLrZHKRFAKU5M1ygo7+QoBYbcbdBSogyDfYs203x8zDEHP21T
         80ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041816; x=1792646616;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SrK6FyhBTZnEQlLogJ3NQ2zWDChbZG9raJxAdO0+bRA=;
        b=sX+ShDxMjO4ei9olZSzeH3e3mFCjNvwLRHqKtwXc4pvvoSxaFYN7JKWJa0aJAp84QA
         6JPb10NU2pd2x7XoLsAwZjTHni/3EaT/x+nJSXhn3gKXtp4mHJugb+beq9BWYG1QljdO
         6TAx3ph6STwSqM90K/zscBk4fAo9J/i96Em4glev+Dv2A7Wk+HW7K/vubwr+Giz1tVDD
         8SHtA7ux4sDdAhry/UfyC92ClB7xX1IKhENcETDj3HE288XBr09Ga7wJ+Xyz/b5Fr0I3
         B8CnfyuUy8Y//B7uMiochpq481XpWXXLq52QTmnN5527I4QBXLy7C2hPiMtX5bhpV2da
         uw0w==
X-Forwarded-Encrypted: i=1; AKwUvBymK6EafsSg45nsUWlvFldy3fSl1YpDyOdday7XBn8bSd1Hxpz/Mqft7gwyYw11N0yLkdY9pUxs+N8fJww=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ZYcQXrNV2YN25rsSNV8IZrnTNgu0AzGFILQ7zjgZUb/poaPK
	scdcbU/AI00osVgKhf5MCME3+JnaZaU2z0Z5rXaIJBmoiseyLF5s73xyavwHyWnRe3jonbLZg9v
	LOwM7RjKea7iUH3SVPHI2x6MjRQKXbXbkyTSl9LY3Sg==
X-Gm-Gg: AYBFou2MzMLycKtN1wVfPV9ppdbU7CZkHayo3UVAFg5C4fDzq6tqaR3hN+PwLj8a3z0
	O2h2t5QbsNTbbh6X13SboeovW/91MVJz7ZvbmyqnXBK3SW3LrIvR/U8HK8W1HLxQi7MF6yVMiEp
	t8QwAz0eiIjkeQyJHNDHgBRg3CgxqPIzo5HDW8brKlDzPPMYcIBF79MARDn0VYj9N9+V27zf/ND
	iueu2QNnVGQabVTaymYchmouTUqXBGFtufqj00UuGWPkpjQhw60o6Q1+ZN1Yl2yUdabXEPZNW9z
	9lqE7Lk1TAgGX6/gqq70EpygPdiSLu/xmV7l44yOHAlsJKbznZdpWzTsfuPq3inrd0Rq54wNqEb
	6Ellyk9WL6YeRED7Q3UzSV42bsh/5tiRKDQ==
X-Received: by 2002:a05:6102:370d:b0:7c3:9464:efaa with SMTP id
 ada2fe7eead31-7cb36590225mr4707868137.2.1792041816136; Wed, 14 Oct 2026
 22:23:36 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:23:35 -0700
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:23:35 -0700
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 22:23:35 -0700
X-Gm-Features: AclHuK_YYfxnldX7Bh0B9i3Tow6J5A6qSw_Ioe7q5Yt1rETlptfRJUA_JUSnfjQ
Message-ID: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
Subject: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"

Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
when 39-bit VA was the 4K default.

Set the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA to 28 (4K
pages), 26 (16K pages), and 24 (64K pages), matching x86_64's 1 TiB
randomization range (5 bits below ARCH_MMAP_RND_BITS_MAX) while keeping
ARCH_MMAP_RND_BITS_MIN unchanged for smaller VA configurations.

Closes: https://github.com/KSPP/linux/issues/371
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
Changes in v2:
- Add a comment above ARCH_MMAP_RND_BITS explaining the 1 TiB default
  for 48/52-bit VA and the fallback to ARCH_MMAP_RND_BITS_MIN in
  arch/Kconfig for smaller VA sizes (Anshuman Khandual).
- Collect Reviewed-by from Kees Cook.
- Link to v1: https://lore.kernel.org/r/CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com
 arch/arm64/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..7bca47269dd5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -313,6 +313,14 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 16 if ARM64_16K_PAGES
 	default 18

+# default to 1 TiB (5 bits below ARCH_MMAP_RND_BITS_MAX) on 48-bit and
+# 52-bit VA; smaller VA sizes fall back to ARCH_MMAP_RND_BITS_MIN in
+# arch/Kconfig
+config ARCH_MMAP_RND_BITS
+	default 24 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
+	default 26 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
+	default 28 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
+
 config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 7 if ARM64_64K_PAGES
 	default 9 if ARM64_16K_PAGES
-- 
2.56.0
