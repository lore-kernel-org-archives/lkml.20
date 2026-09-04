Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88C4766A9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524409; cv=none; b=prdyG+MOP06De9DhO50s52IF7M13qDlCsWSK9QnqxddaYm5SxvMwFdpPznVXsOySMCr/BVcOhE8SCfpDTsYrXrC1xylz5Vx3O33A0lFMHNPG9/Xt6KcCHKynQqSu0HYb5ybVEip7LQ3hhNpLVNl8mhPJtuT/PgLaLlLNm4eloZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524409; c=relaxed/simple;
	bh=6WG/j/42usMvEDWPvfaoAPfW5qGOhIQ7+bs5jOjNyDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6fzHr3OjWai+QrRTqDCDHk3pQMBqLBAcfokz7XdbhOcgKDHi7M4XlVbWeQEQDGUHRc8Tu5QzK1HC0pTQRb2Kaqi3xim0Ye3zN1be+aLxK5yTsAJqU3RhoYrrMsUMrRc49OrmIlb/3POh/QL0M1AYQeDL2vhwiZ6kLdBtcps8Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQO8kBdm; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQO8kBdm"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b21f09ea42so812808b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524407; x=1789129207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7YwV2cu1u3dK6SjJICTavcZa0kMWgQZV7MXvNHx3Sk=;
        b=iQO8kBdmN7p3zIhWcrKpJ5D3e5zGAwCLPXBIHWKqpYWakNYXGic84Nr24KeWHk9u/M
         jdrtofiZIq3gZZFVNLKI0H4D1fZ0VSg0wbrsgA9tOx9woWBDMUoake5wOlNWUK8O0QVf
         c/uwtC/NtAqG3TBHyj4vOoB1xG2wdGr0ljnnWzYK47nici/gcFX1dsmqSW/Pz6KrR9+z
         x52Vhaa4hFFpNnVZ9mZBxJuIA5Jrrr9zzdkx7WiZztnpc/vZI524gU7RFvELygA2odQp
         FFGYeFLmzRgpJkjv11mN2dTJEuesxmj4BQJu9arWKQFWsP/0PVmr62iEf86KYTHuPXKW
         j+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524407; x=1789129207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7YwV2cu1u3dK6SjJICTavcZa0kMWgQZV7MXvNHx3Sk=;
        b=EvNucHAwXglakHlXmGhCsZfQA4+HTf/JScASLzXKjlTyv+cU6rXNyQcEck/YWkDqp1
         zehh/v5Eem+EOfqVMK6cIm+JRRaBghvjthveM5KLWZm6LQw0RJtwv6FHQTabdRHbfb3n
         MhJp5MEQmQ8IfJwZDfVv/wDJZyRxnwdw4MEIKsFsqeJjSMhdxN/Z6f0LDXgqHafsC4Zw
         yiAo4eXRul0i0DsnzsKhagZZe5YkQMtFMNnZrR/E47HYu5hqeQpfaJdfUHTyItG7MSvn
         nV1/Oak3R/ak6PMNZmZ7NTgWx11/6hjdGOgeRHckHV1TOA+PvNI8RoKjCx1A5NOO2+1y
         9S+g==
X-Gm-Message-State: AFuF++kZskiWFHqez1kOSvoGJlR4O9Z90V8NTNS8fo5QCBoprEx6SQCh
	XCbfZ8+rCz/OVhmoGguBQN1qzQYAAciYP2xq/aeRQE4/AwJ8vEWdKCIl
X-Gm-Gg: AYBFou1gfMJl6Zur5QgSFagA2a9SkLPs1np4fnaRyTMs54pgHh3ORcbIzU6PLMtxFLw
	0dwjhwBBm7qzDMkg5iTFxVVyPZpIcu7ZT+doCnvDM9bttzLLniIUreUMU3r6n0i74FdQNkPXJDd
	O6xoUuwWw2kUHiADydc0Jm3mfp04Hopd3DOsRvOhh/0iQTO3MHFgn97wa3OKAOeITa5vHOGRSOH
	bK3kqy2BTOXDzGYVmQY0t/gIApYusG85CoYqx1BELj8wRJPhYEqCiymI6Rhc8ykcq9TXKVLSdgc
	rXJlrZs5YwyAK1eI6tYIMh9YMcLjndCEj38VRebhi38vdk8FnKPR3Xj6rDEgOUgzMc5XeHPYciW
	tFUTEJQUBS6I8261H59jpwn1nffqkHJUhnO15GgxJ9QsdkcJV7pzCZSOibrlk8X1ULfOWzjaUTE
	MDplbPRh826tA3akbFnrA8ZmjuaXguj0bSdNOei9zPF9O+H/PC0PgijpjYdVFkolWIbiHhqYTdc
	IljF9iJ6ToCXJM=
X-Received: by 2002:a05:6820:2017:b0:6b7:46fc:1d7 with SMTP id 006d021491bc7-6b746fc0274mr2277743eaf.54.1788524406645;
        Fri, 04 Sep 2026 05:20:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm5634125c88.6.2026.09.04.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:20:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: fix typo "funtions" in comment
Date: Fri,  4 Sep 2026 17:50:01 +0530
Message-ID: <20260904122002.27960-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "funtions" to "functions", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4ad67b737af7..698ad1748de0 100644
--- a/Makefile
+++ b/Makefile
@@ -1144,7 +1144,7 @@ export CC_FLAGS_NO_FPU
 
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 # Set the minimal function alignment. Use the newer GCC option
-# -fmin-function-alignment if it is available, or fall back to -falign-funtions.
+# -fmin-function-alignment if it is available, or fall back to -falign-functions.
 # See also CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT.
 ifdef CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT
 KBUILD_CFLAGS += -fmin-function-alignment=$(CONFIG_FUNCTION_ALIGNMENT)
-- 
2.48.1

