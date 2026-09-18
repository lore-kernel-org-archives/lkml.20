Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2474FD278
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743164; cv=none; b=bDqfiIqVbMGWCfjZ4NiTP4lkSi2XHzUWIo5BJmPOQRI1IZIWlNfiPbn4ZNHya1M22bDxh5fpBUrkvXCWuvVSehiyFKIyv84CX+UaY1iMmzYUIkcQuita6lBQo2LE+oph0NK/wqbfJOSkhgolj5HfxGvl3sBh0KkIkJgRYejwvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743164; c=relaxed/simple;
	bh=Icvo8LqCX1TwGZb3WChAPmpFjwxICzTT73jPAx8p/H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQURInCz/TJAwr32saFuwJBBKh3o29vAEkuMWQAgMuRkXX0kTLX5p1doEqqXKXsfQhToOPU26HiADmxmhQ0FPT5NTBOkFex5Ncu7ud+ddZGDFK8Awzh0YGqF2JLBIgeG9amZ8ZB1qEKqY9citV407NMZphwuAvGJlF4+koVHMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+52cop3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+52cop3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587BE1F008A0;
	Fri, 18 Sep 2026 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743156;
	bh=XblQenTKByh/WGlZH2USqfcjNnapXaWnf6Z4EXI3wtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+52cop3YZH5UiioN4mykAtd7GAYdP1gg7A1+I1DkCOR6Wzfp6pVg/9DnVfK5BWkd
	 MIxGD2s62ynD6/dfDS6TBK0qyfI6R+m53keA6qwCnN9gQC83C8iIXO4NyZhpjbHI7j
	 8bBXDuKd8dkfYo9g8qiPX5CCURrzTybQNKO73aemVKFOjn55ffYgScPQufL6exCy91
	 FX7xaTgp/1/7ObEN15pa22al/WZigADNVVPQwoxpk0xIlX6Wy+bMb+571Rab9uPBpz
	 06N4Ti0SRJF7elpp5JrRd16UZvhWy7Gy41ma1XRFVX0K1aHZ17fnbFERUW99vxKqEf
	 9uVXoSO89MCqw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 04/13] arm64: lib: Assume a little-endian kernel in custom library routines
Date: Fri, 18 Sep 2026 15:52:06 +0100
Message-ID: <20260918145217.1669-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5276ea17a23c ("lib/crc: arm64: Assume a little-endian kernel")
removed all usage of the CPU_LE()/CPU_BE() macros from the arm64 CRC
assembly now that big-endian support depends on BROKEN.

Do the same for the rest of the custom arm64 library code, as well as
removing all usage of the '__LITTLE_ENDIAN' macro.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/lib/csum.c   | 17 -----------------
 arch/arm64/lib/memchr.S |  2 +-
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
index 2432683e48a6..75db718e5b6a 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -47,11 +47,7 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	 */
 	shift = offset * 8;
 	data = *ptr++;
-#ifdef __LITTLE_ENDIAN
 	data = (data >> shift) << shift;
-#else
-	data = (data << shift) >> shift;
-#endif
 
 	/*
 	 * Body: straightforward aligned loads from here on (the paired loads
@@ -94,13 +90,8 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 		len -= 16;
 		ptr += 2;
 
-#ifdef __LITTLE_ENDIAN
 		data = tmp >> 64;
 		sum64 = accumulate(sum64, tmp);
-#else
-		data = tmp;
-		sum64 = accumulate(sum64, tmp >> 64);
-#endif
 	}
 	if (len > 0) {
 		sum64 = accumulate(sum64, data);
@@ -112,11 +103,7 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	 * preserving odd/even alignment.
 	 */
 	shift = len * -8;
-#ifdef __LITTLE_ENDIAN
 	data = (data << shift) >> shift;
-#else
-	data = (data >> shift) << shift;
-#endif
 	sum64 = accumulate(sum64, data);
 
 	/* Finally, folding */
@@ -140,11 +127,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	dst = *(const __uint128_t *)daddr->s6_addr;
 
 	sum += (__force u32)htonl(len);
-#ifdef __LITTLE_ENDIAN
 	sum += (u32)proto << 24;
-#else
-	sum += proto;
-#endif
 	src += (src >> 64) | (src << 64);
 	dst += (dst >> 64) | (dst << 64);
 
diff --git a/arch/arm64/lib/memchr.S b/arch/arm64/lib/memchr.S
index 37a9f2a4f7f4..b14b27cb8419 100644
--- a/arch/arm64/lib/memchr.S
+++ b/arch/arm64/lib/memchr.S
@@ -63,7 +63,7 @@ L(byte_loop):
 	sub	srcin, srcin, #1
 	ret
 L(found_word):
-CPU_LE(	rev	tmp, tmp)
+	rev	tmp, tmp
 	clz	tmp, tmp
 	sub	tmp, tmp, #64
 	add	result, srcin, tmp, asr #3
-- 
2.55.0.1082.g2b9226bbc0-goog

