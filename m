Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773084;
	b=dnQHd0V4pL+tfeoxK7N8ELqUTSUmWBYDmL+YRH4kLmgaQjdQ1sPXzgNEVDCWFhrEFUOy
	 rnuTfzD4Ei8Ju1WrLr7MJC/AxJLh50qtkyscNbW+vtjlH/n1lgl0iGXtrIPMR1nYXizXC
	 kC0Nb3ThdkgJuIwBovVE0tZLdYiUKE72A5Qkcpe5MwMGJ5EfO5tVu1GukiSvIul1nz+ol
	 kj94GXhS9RMr+VYrNywoyJj4gKOyWj7XcEzWm8JORCSzFAG3P95Wp7RSsxVCyDdOtDbzm
	 nhzMQl9Ecz6tuNyaLayo0SnNi1yq5+Oe/o5uuHCKeLi4RoJEC8qTJ53SKZ2anknCq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=krFMw3G0hUmor35P+4tTWwgVRfPtWgiE1U5BWiSvs54=;
	b=s3MrZcklq75wD+Zf8tvqY3aUYI//0StXnf0R6uc6wbGA35FeskJcWf753eUdInBdAmbQ
	 d5m6EsGHF2T/ZAreliVcGLibv6+h8QhHIdusl4k85s7vba3uHuuUGrqEK+Y0BGFQN1yFs
	 B+apxmKVy+STFB5BSHdzof/KzUB4vCYshZQnsOuRFWfhsZ5EmX77lGKC7yo5bR2fzM41T
	 e8NftQJAhDbQQgtYCIvHM8miy3/JwHoDEvIb3GVjq572D8m3Pq7SHU19ETQDKGBsehA1m
	 F+NnIw6B39WtvLwjhQh5ZotVb7HethBThOlKZ/gcYyBKgtIB1PxWWQJYJeNTFu8RDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7oLobNz;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE6606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEE6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7oLobNz
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-886e61fa30fso537627b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792773083; x=1793377883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=krFMw3G0hUmor35P+4tTWwgVRfPtWgiE1U5BWiSvs54=;
        b=J7oLobNzDuZSNEjg+qrW4sHff2OJgP5X7rfXUmFue0nYD0MFFPxu3lRVdiqveC4tLe
         CoYEloSOd5eTG9Dj8CaiZfKoaZEdH15C7+ir1h4BlitjDyZXgp2MLKvEHMiduUgInp46
         4rQKq32Z4CuuIxoH4k39MQZ9L4Rc5AqspKQVHIP2GVLyMuzM2BSZdIu/lJ8kc+3EJu3W
         Ays0JDhmEQKWCM9fmlcy1F80au3fGxTNXkXxEXNXHE9yE2yLUMFEHSWrFPf8j5iLFE+o
         NylTlqwluZz/bPcQp0AfcdLoFJJoQYkocVCR86vqXkZVM/hXctkfBvlPz6M8wxwDPnxd
         +Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773083; x=1793377883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krFMw3G0hUmor35P+4tTWwgVRfPtWgiE1U5BWiSvs54=;
        b=lhCib1W3l0QMKUsXsJr4vOjIt3eszC4vydo649U6/fNuodfnnBFZTsXMzTa9vGdwbA
         rkwU2GrcmyNhlD1901hb97wybOzLjBJVuon8zOWy2EOvPRPw3/fWeFhh/2ijsD/kHMdA
         QvFNfSZS36s24cBWnFMwIM4E91HHNmuXLVLruvJySjF869e0HAKokqtmo/8jdgj+A6lb
         SQXrCGgIlZQQK1x+k7LwGLWhkd7SJk5SCLrhSuoDAc+9/Pse9vJAV+C4ICx+rOZceeHU
         3T+2c25OTOJ0M6Gny5CyjVQ58MhuUISVJrovxeWmH+RA29ZdaMRW9mtNBFfJL7bDS3xc
         Wh1w==
X-Forwarded-Encrypted: i=1; AKwUvBzenAqr+SQhmhnojccPVo3dgk+Uf++Yg143vMiMbY4oTdGiz6by4Y6kyihFQD2xjJAAiMZ5DfaJtzAdtWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb9pCGJsV2K1BvUukAh/Pd/nQ3Ieoa/aK4fN4o3lIGwf+I/WDt
	pzsMc8Mg6qzRWmx1jZZ6yq0QLqWcrKHx57Xt4KnGeGOShcJbi+MwE8q2
X-Gm-Gg: AYBFou2Of2IUWT1JilHI1fP+mzVswOEsUZ7VvCFSLTFk3+6wxo7dDych5XRioLf+How
	YVfaEptW062fdEcyP5F+hAXDlnnYaCySyBOlbZ1YuZ/lGXONWgJJriyzc354DGOGSpXbtLyrisZ
	ZIpnAtz313v+NE9xDe0O/TlTDsvYOcBoywCP5SZA/G2WolN75dW7szohlvMFsan5GjJCA+6ERcU
	LPqcLn+xGepdZjexSEXuBPMKJUn7Rzk1zxsB3jCDe1vlDnX0HtXKBHRMP4YfpTbJNsB8prGDYSG
	qdF8XH19crE25RVJIx7YU+89rYx0o45ayZf0kVxK0OctXtlwM9J+G6Gf6bBS5rNCAuBEC+EJwsO
	dWzi4Zh0cNhpYCUoz6Tq5oXSiPpGp9w+5jHFzwScUgzzUZ1RlV+3susJ65hRfz3bYf20mVJptPO
	OYhrR5s3y78NQMxiQST2o4ZoY2HoxL6ii4uhXnB7QjkC94E5zLUnirAoi9Z+X18OQVf6Sb7RvL0
	cC/mSHdauKiwUBAc5ASzOH98+8+TybZKjuHrjIdGZDDDliOkYsLgWOzU+eq
X-Received: by 2002:a05:6a00:3d53:b0:87c:f67f:f7d3 with SMTP id d2e1a72fcca58-8a2c4719894mr2194557b3a.0.1792773083390;
        Fri, 23 Oct 2026 09:31:23 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a3395c6de4sm190736b3a.35.2026.10.23.09.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:31:22 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"Jose E. Marchesi" <jose.marchesi@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] unroll: Drop the unused unrolled and unrolled_none macros
Date: Sat, 24 Oct 2026 00:31:08 +0800
Message-Id: <20261023163108.2042675-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

unrolled and unrolled_none are object-like macros with lower-case
names, and neither has had a user since commit c6594d642717 ("unroll:
add generic loop unroll helpers") added them in February 2025.

The name unrolled also breaks code that uses it for something else. On
GCC the macro expands to an empty _Pragma(), so a function parameter
named unrolled compiles with only -Wunknown-pragmas warnings (errors
only with CONFIG_WERROR) and silently loses its name:

	int add(int unrolled, int x) { return unrolled + x; }

builds as "return x;" with GCC 11 to 16 (GCC 8 to 10 and Clang reject
it).

Drop both macros, and retitle the kernel-doc comment from unrolled to
unrolled_count(), the macro its usage example shows. unrolled_full and
unrolled_count() stay; any clash with their names fails to build
instead of compiling silently.

Suggested-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Link: https://lore.kernel.org/all/3c25921c-7bdf-4edd-ba06-838dd1765db6@intel.com/
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
v2: drop the two unused macros instead of making all three
function-like (Alexander Lobakin).
v1: https://lore.kernel.org/all/20261016025613.2690485-1-shingekinocore@gmail.com/

Eric, this version no longer touches lib/crypto/. Would you still
take it through libcrypto-next, or should it go through Andrew's -mm
tree (unroll.h has no MAINTAINERS entry)?

Testing: an x86_64 defconfig build with the includers of
<linux/unroll.h> enabled (BLAKE2b/s, LSMs, IMA/EVM, BPF LSM, vhost,
i40e/ice/idpf; no debug info) gives byte-identical objects, modules and
vmlinux before and after, with GCC 11.5, GCC 16.2 and Clang 23. In a
file that includes only <linux/unroll.h>, a variable, member or
parameter named unrolled or unrolled_none now builds without warnings
with GCC 8.1 to 16.2 and Clang 17 to 23.

Based on libcrypto-next (20ec6916d871); applies as is to
next-20261022, which has no users of the two macros either.

 include/linux/unroll.h | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/include/linux/unroll.h b/include/linux/unroll.h
index 186b71de7..d027b37f6 100644
--- a/include/linux/unroll.h
+++ b/include/linux/unroll.h
@@ -16,7 +16,8 @@
 #endif
 
 /**
- * unrolled - loop attributes to ask the compiler to unroll it
+ * unrolled_count() - loop attribute to ask the compiler to unroll it
+ * @n: unroll each @n iterations of the loop
  *
  * Usage:
  *
@@ -34,12 +35,6 @@
  * provides best performance and object code size.
  * Available only on Clang and GCC 8.x onwards.
  */
-
-/* Ask the compiler to pick an optimal unroll count, Clang only */
-#define unrolled							\
-	__pick_unrolled(clang loop unroll(enable), /* nothing */)
-
-/* Unroll each @n iterations of the loop */
 #define unrolled_count(n)						\
 	__pick_unrolled(clang loop unroll_count(n), GCC unroll n)
 
@@ -47,10 +42,6 @@
 #define unrolled_full							\
 	__pick_unrolled(clang loop unroll(full), GCC unroll 65534)
 
-/* Never unroll the loop */
-#define unrolled_none							\
-	__pick_unrolled(clang loop unroll(disable), GCC unroll 1)
-
 #define UNROLL(N, MACRO, args...) CONCATENATE(__UNROLL_, N)(MACRO, args)
 
 #define __UNROLL_0(MACRO, args...)

base-commit: 20ec6916d8712e84d58e8c688a25cd368ddeb82b
-- 
2.34.1

