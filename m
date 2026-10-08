Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784403AFCE5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487036; cv=none; b=iq6b+sYvNjrFKoJA4z9f2LW7G0MvD7eSTX6wpoddBx/0rL8zDqXFbawc8wbjVzOtTd/BzbCpCmn7gjF6hh9IdeTHNTJyN8zhwyZMbpNHYXJ4W2YzMVoXgqKaDSHXtEtnNzgbCwnI5d+d/tvsL0RkdZ2FGe6Wh47Fa23VS4/Pyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487036; c=relaxed/simple;
	bh=41LTbWVjpTvo4M1E4NbCgmRFCizGUSRpVOrbjrIjkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ll969zEugCGkPioQ5iDckC/CbYkmXjPIRatHpbH3KdXzlp5BeO+zjGROpiFDPAlKRxbQ/m36EtPpXRqqt/gwK24mbt84iwxefe7QOjixIlMHhM7NXZypr2n7EQgWqraaCDnxt5zO+emeGvjjIZEvymmaOH2gbLqkNIDKSsCxKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W37UHwyy; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W37UHwyy"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91968804af0so33882206d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487034; x=1792091834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUu+rVVcA0+9TqEMKJogDIMf7RBcjtzwW2+KKNlVxXE=;
        b=W37UHwyyO9QRs5wjYNWroqMNExP8R9dbTpNj2zvJhaVCHnBxwoXQxxqufz1+9VeP3/
         HCnWy0V11RelkewyfIiOfV5HesTK26DNzqk/75tsWJKwKNeZTBMiIpnZw1l7farGtMJy
         PUWwtEk2sGJLsU9ONpgt8Gbt7ljtduVk/csdk5m+mlisFk6qIil6nZ8M8JGSkGJFdMFa
         4cZ++6mt3Qf/RE3z7Bx6/81VmorpHxh2Kkgo/5nB2atIQwONJY5wGdvi+hvtnZ9opiAb
         plSVuVVa6/7nj92eExc/LF/kDItko0sfq9tLHiSTZhfdpOIwnQ9FU58pfYEPbxYqNaal
         p+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487034; x=1792091834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUu+rVVcA0+9TqEMKJogDIMf7RBcjtzwW2+KKNlVxXE=;
        b=eynTJf4Bx4nrA86Fya8zwKTwnLS1pNQ0DXz8V1ZcgHhBLkXnad8aVmEcVu0jUJs+xO
         NpRlNJXW5lEgNLKNkfFb2pH/XbBZU8MipEH0Wa/Wy6FCyyT2DSdW0Rr3iDAvG5TgIhPl
         DjZ/7Ca2rOOYdv1SS2JUsmSIFVjRFe/94EtZFC4kqlDteVZodhPelNFLo2FyWQOLfqa1
         XeSD/Htd3vheQvSuGr1h851c5WtrW+GvbWw3VagPzYVj3YC0a51FbIp+h9FNYBEKFCV9
         Mn15ph1qpLJeQmvZsGyDFEtakni7BCPYrqu+UNmgy/T2iZcSvpHuiNnoNp6lEU5/tpYo
         uaPA==
X-Forwarded-Encrypted: i=1; AKwUvBwoEeg5n5Tz6ECs0QfzXjKFZn+FRVFKun+HS4er5xwvNIMY2sCbyIEEcGfbYt8U1Uq3YhMWOSNua8j9yW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtGH5oEPVz/ow8xnpL4b8Pzr8Rq13wzro6BK64oG8ZFkSxN/Vh
	ZZi6WhT7xvF65HzLoZAUsDDJrD+mqxRAewvhfn8PgeV/GudQJGBJsYRy
X-Gm-Gg: AYBFou3QvfZoUuOZSSdjCtxCeQ8WMMU/3R8HWuiLcPYzy7FumJCGyHc0HYF2ke//dOu
	IkrJOUuixYlPfF2yBLTzt3QyVho1Waj2lm049rEGKZBlU494zixsy1sS8+/FNuLC3uP0+/1vc3W
	o+4O2nHeeUvoP0cXPBsDNbI0SQVurT7VjPQTOamiSkqzN0GAPFRc189jzx0lhe9Opd/jIwYQ2DM
	hNt1InjWBfTbIQ5fwpwVBEFbCWULJWDP+9K4L/YCclZHI4YHVNFUUrmNj2xK0XnL31YHuIeCJlQ
	CQk5ua1ogcboTopRJx0L7i8xtQ44Ulm2UtXLQjl3+ta912uJUyONabTdVlFlruEaDvV+DguyYKd
	rkHuVfESLSoMi7773cCTkwu0YZDNQrkLewbbxkAv3GrblEZqUjPaKV0fspaqxlqk7321srlWYfb
	v6fcoqxjItpcMt68WbZjDjw5kiE161P1UcD5QAbceH6vOxIB+xJQYWOfoM/GlB/UqfP31lAqjyB
	7Uzn5B3yNkjglaor34l9DrHeiXGMH5slzLpSzEQdn5ZO3dNPxKcvpqu7+DhWOLk419xtLIVp+Xy
	Gk7YZBnUhNpoPJ5a8ryIfodPuuwbLLX07TiJTOfhVMIoD3yW
X-Received: by 2002:ad4:5c6f:0:b0:919:952d:f5b8 with SMTP id 6a1803df08f44-91b53c8beedmr229366d6.50.1791487034251;
        Thu, 08 Oct 2026 12:17:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5199b032sm4046936d6.4.2026.10.08.12.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:17:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v2] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Thu,  8 Oct 2026 12:17:11 -0700
Message-ID: <20261008191711.223236-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():

  mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
  has undefined behavior [-Werror,-Wnull-pointer-arithmetic]

sparc64 defines p4d_page() as NULL, on the assumption that it is only
used by stubbed out hugetlb gup code. Generic code now uses it in
vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
used in pointer arithmetic, which clang diagnoses even though the
branch is unreachable on sparc64.

Define p4d_page() as a NULL function to silence clang's warning on an
unreachable branch. sparc64 has no p4d leaf mappings, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use a NULL function instead.
 arch/sparc/include/asm/pgtable_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..54e563eb0efd 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -851,7 +851,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page(p4d)			static inline struct page *p4d_page(p4d_t p4d) { return NULL; }
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0

