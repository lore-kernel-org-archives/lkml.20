Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676517;
	b=LvX3YLUxAPGAuzqcZM6xcUJmJRwHItctllPJ3Nwl0YZZ9g+ih0CDy2/k1b/T8INs5dMc
	 6fC1uB2i7491PVcDgSQ96IGDkamtuG8+9UUzg6In1+0hpVOjvunn+td4/O3dPPoVvNE18
	 NN5MdlMczy8NUC1weC0paHCujaGJWDF4ay3VSMLyBPYTXnjwgXY0i22rFIg+t+4zxGy+8
	 u3VSWcX1pRBo8aag6X4LjYuBW0yIThSG2O8DIhs3Roi0pcZG5+4EICM+CyDDdvcaTr1GC
	 e89YT/vYDSw3237D/YqvnfjEYSH11M2HGeuWgb0iiRGqn96dU2bnN5JQJLs93NcKR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676517;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GlSWt07OIdnQXxoA5IhjFfiS9MX/gQnSKd/QeyO7XXU=;
	b=zflEgaIHUBt2D8nfZHtKx9VkXj4MuuLZodLTqLF29eIcOqeYXMgDnohEGrcKhO7LuBeC
	 5ozolYdm6Z25hzGG39pgpCQGktSJLCiwwAjAOrBlc1Wc5UrQhCLU5LT+3te59/vCo1F7O
	 SJmbCfkAO9S6UPpCfYJ/99Q3jOnGR0QdP7swBKTejH/WTCTnkJi6Tc4aqXU25t1rNazlJ
	 +c9Ah9uHPdAqNNTM7BACJXC1M6ymMYD8548PScKjaZ8v6EGNJENWqF0pe63jj0TkVw9YT
	 EI74NVRRmIzfsJm/VUGKe7hzD3kSsOu+4o4PPBaErecCKPrp5SAWd9TyBrbJ8YNb8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC332606A886
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC332606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id 0D99B1720567; Sat, 14 Nov 2026 17:15:09 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	hsiangkao@linux.alibaba.com,
	terrelln@fb.com,
	yann.collet.73@gmail.com,
	guoxuenan@huawei.com,
	Biplab.Raut@amd.com
Subject: [PATCH v2] lib/lz4: backport upstream fast decode loop
Date: Sat, 14 Nov 2026 17:14:52 +0000
Message-ID: <20261114171452.1484344-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
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

The kernel's LZ4 decoder predates upstream's fast decode loop.  Backport
the v1.9.2 implementation into LZ4_decompress_generic().  It uses
fixed-width copies while at least 64 bytes of output headroom remain,
then hands boundary, partial-decode and dictionary cases to the safe
loop.  This also imports upstream's shared variable-length reader and
safe-loop control flow.  Accumulate variable lengths in size_t and
reject arithmetic overflow so malformed extension chains cannot wrap a
32-bit counter, and validate the output pointer against the full match
length (after the MINMATCH minimum) in both loops.

Enable the loop on x86 and non-clang arm64, following upstream.  Other
targets use the safe loop.  Keep the existing wrappers, exported API,
NULL-input and empty-output behavior, and in-place copies unchanged.

The loop increases .text by 9,736 bytes on the tested x86-64 build
(11,891 to 21,627 bytes, +81.9%, GCC 13.3) because FORCE_INLINE emits a
specialized decoder for each wrapper.  On a 2-socket AMD EPYC Zen 5
server running kernel 6.8, 25 paired Silesia rounds show a 5.13% median
zswap swap-in scan improvement; an isolated cold-decode test improves
by 12.88%.

Build-tested the built-in decoder, initramfs wrapper and preboot code
with x86-64 GCC; the decoder and initramfs wrapper with x86-64 Clang 18;
the same objects with i386 Clang 18; and normal and forced-fast-loop
builds with arm64 Clang 18.  Userspace round-trip and differential
tests completed 6,899,933 checks across safe, fast, partial, dictionary,
streaming, malformed-input and corpus cases with no failures or guard
overruns, including the variable-length overflow regression.

This follows the released v1.9.2 layout from upstream's fast-loop
series, with the size_t accumulator, the overflow rejection, and the
post-MINMATCH match-length check added as kernel-side hardening.

Link: https://github.com/lz4/lz4/commit/28356e02ad6f6dac529302cedf707712c5b628fe
Link: https://github.com/lz4/lz4/pull/645
Signed-off-by: S. Biplab Raut <Biplab.Raut@amd.com>
---
Changes in v2:
- Accumulate variable-length fields in size_t and reject overflow before
  addition.
- Validate the output pointer against the full match length, after the
  MINMATCH minimum is added, in both the fast and safe loops.
- Test the hardening with a >16 MB malformed-input regression and an i386
  build.
- Rebase onto current mainline.

v1: https://lore.kernel.org/r/20261023195617.3468543-1-Biplab.Raut@amd.com

 lib/lz4/lz4_decompress.c | 544 ++++++++++++++++++++++++++++++++-------
 1 file changed, 447 insertions(+), 97 deletions(-)

diff --git a/lib/lz4/lz4_decompress.c b/lib/lz4/lz4_decompress.c
index 3a2cd9acada4..1155d5a369f4 100644
--- a/lib/lz4/lz4_decompress.c
+++ b/lib/lz4/lz4_decompress.c
@@ -49,12 +49,176 @@
 #define assert(condition) ((void)0)
 #endif
 
+/* Output headroom required before the fast loop hands off to the safe loop. */
+#define FASTLOOP_SAFE_DISTANCE 64
+
+/* Shared by the offset<8 match copy in both the fast loop and the safe loop. */
+static const unsigned int inc32table[8] = {0, 1, 2, 1, 0, 4, 4, 4};
+static const int dec64table[8] = {0, 0, 0, -1, -4, 1, 2, 3};
+
+/*
+ * The fast loop is intended for out-of-order CPUs, where copying a fixed
+ * 32-byte chunk is preferable to an unpredictable branch.  The safe loop
+ * handles all cases when the fast loop is disabled.
+ */
+#ifndef LZ4_FAST_DEC_LOOP
+#if defined(__i386__) || defined(__x86_64__)
+#define LZ4_FAST_DEC_LOOP 1
+#elif defined(__aarch64__) && !defined(__clang__)
+/*
+ * On arm64, disable the fast loop for clang because it reduces performance on
+ * some Qualcomm chipsets.  See https://github.com/lz4/lz4/pull/707.
+ */
+#define LZ4_FAST_DEC_LOOP 1
+#else
+#define LZ4_FAST_DEC_LOOP 0
+#endif
+#endif
+
+#if LZ4_FAST_DEC_LOOP
+
+static FORCE_INLINE void
+LZ4_memcpy_using_offset_base(BYTE *dstPtr, const BYTE *srcPtr, BYTE *dstEnd,
+			     const size_t offset)
+{
+	if (offset < 8) {
+		dstPtr[0] = srcPtr[0];
+		dstPtr[1] = srcPtr[1];
+		dstPtr[2] = srcPtr[2];
+		dstPtr[3] = srcPtr[3];
+		srcPtr += inc32table[offset];
+		LZ4_memcpy(dstPtr + 4, srcPtr, 4);
+		srcPtr -= dec64table[offset];
+		dstPtr += 8;
+	} else {
+		LZ4_memcpy(dstPtr, srcPtr, 8);
+		dstPtr += 8;
+		srcPtr += 8;
+	}
+
+	LZ4_wildCopy(dstPtr, srcPtr, dstEnd);
+}
+
+/*
+ * Customized variant of memcpy, which can overwrite up to 32 bytes beyond
+ * dstEnd.  This version copies 2 * 16 bytes (instead of one 32-byte chunk)
+ * because it must be compatible with offsets >= 16.
+ */
+static FORCE_INLINE void
+LZ4_wildCopy32(void *dstPtr, const void *srcPtr, void *dstEnd)
+{
+	BYTE *d = (BYTE *)dstPtr;
+	const BYTE *s = (const BYTE *)srcPtr;
+	BYTE *const e = (BYTE *)dstEnd;
+
+	do {
+		LZ4_memcpy(d, s, 16);
+		LZ4_memcpy(d + 16, s + 16, 16);
+		d += 32;
+		s += 32;
+	} while (d < e);
+}
+
+/*
+ * LZ4_memcpy_using_offset() presumes :
+ * - dstEnd >= dstPtr + MINMATCH
+ * - there is at least 8 bytes available to write after dstEnd
+ */
+static FORCE_INLINE void
+LZ4_memcpy_using_offset(BYTE *dstPtr, const BYTE *srcPtr, BYTE *dstEnd,
+			const size_t offset)
+{
+	BYTE v[8];
+
+	assert(dstEnd >= dstPtr + MINMATCH);
+	LZ4_write32(dstPtr, 0);   /* silence an msan warning when offset == 0 */
+
+	switch (offset) {
+	case 1:
+		memset(v, *srcPtr, 8);
+		break;
+	case 2:
+		LZ4_memcpy(v, srcPtr, 2);
+		LZ4_memcpy(&v[2], srcPtr, 2);
+		LZ4_memcpy(&v[4], v, 4);
+		break;
+	case 4:
+		LZ4_memcpy(v, srcPtr, 4);
+		LZ4_memcpy(&v[4], srcPtr, 4);
+		break;
+	default:
+		LZ4_memcpy_using_offset_base(dstPtr, srcPtr, dstEnd, offset);
+		return;
+	}
+
+	LZ4_memcpy(dstPtr, v, 8);
+	dstPtr += 8;
+	while (dstPtr < dstEnd) {
+		LZ4_memcpy(dstPtr, v, 8);
+		dstPtr += 8;
+	}
+}
+#endif /* LZ4_FAST_DEC_LOOP */
+
+/*
+ * Read the variable-length literal or match length (LZ4 "LSIC" code).
+ *
+ * loop_check    - check ip >= lencheck in the body of the loop.
+ * initial_check - check ip >= lencheck before the loop starts.
+ * error (output) - set to overflow_error on an accumulator overflow, or
+ *                  loop_error / initial_error on a bounds violation; must be
+ *                  ok (0) on entry.
+ *
+ * This is the shared length reader introduced upstream together with the fast
+ * loop; it is used by both the fast loop and the safe loop below.
+ */
+/* Error codes for read_variable_length() (kernel uses a named enum, not a typedef) */
+enum variable_length_error {
+	overflow_error = -3,
+	loop_error = -2,
+	initial_error = -1,
+	ok = 0
+};
+
+static FORCE_INLINE size_t
+read_variable_length(const BYTE **ip, const BYTE *lencheck,
+		     int loop_check, int initial_check,
+		     enum variable_length_error *error)
+{
+	size_t length = 0;
+	size_t s;
+
+	if (initial_check && unlikely((*ip) >= lencheck)) {
+		/* overflow detection */
+		*error = initial_error;
+		return length;
+	}
+
+	do {
+		s = **ip;
+		(*ip)++;
+		if (unlikely(length > SIZE_MAX - s)) {
+			*error = overflow_error;
+			return length;
+		}
+		length += s;
+		if (loop_check && unlikely((*ip) >= lencheck)) {
+			/* overflow detection */
+			*error = loop_error;
+			return length;
+		}
+	} while (s == 255);
+
+	return length;
+}
+
 /*
  * LZ4_decompress_generic() :
- * This generic decompression function covers all use cases.
- * It shall be instantiated several times, using different sets of directives.
- * Note that it is important for performance that this function really get inlined,
- * in order to remove useless branches during compilation optimization.
+ * Covers all use cases.  The wrappers below call it with fixed flag values, so
+ * keeping it FORCE_INLINE lets the compiler fold them into constants and drop
+ * the dead branches, giving each wrapper its own trimmed-down copy.  A
+ * branch-light fast loop copies 32-byte chunks until the output nears the end,
+ * where the safe loop takes over; endOnInput selects safe vs legacy fast.
  */
 static FORCE_INLINE int LZ4_decompress_generic(
 	 const char * const src,
@@ -87,8 +251,6 @@ static FORCE_INLINE int LZ4_decompress_generic(
 	BYTE *cpy;
 
 	const BYTE * const dictEnd = (const BYTE *)dictStart + dictSize;
-	static const unsigned int inc32table[8] = {0, 1, 2, 1, 0, 4, 4, 4};
-	static const int dec64table[8] = {0, 0, 0, -1, -4, 1, 2, 3};
 
 	const int safeDecode = (endOnInput == endOnInputSize);
 	const int checkOffset = ((safeDecode) && (dictSize < (int)(64 * KB)));
@@ -99,6 +261,11 @@ static FORCE_INLINE int LZ4_decompress_generic(
 	const BYTE *const shortoend = oend -
 		(endOnInput ? 14 : 8) /*maxLL*/ - 18 /*maxML*/;
 
+	const BYTE *match;
+	size_t offset;
+	unsigned int token;
+	size_t length;
+
 	DEBUGLOG(5, "%s (srcSize:%i, dstSize:%i)", __func__,
 		 srcSize, outputSize);
 
@@ -116,15 +283,200 @@ static FORCE_INLINE int LZ4_decompress_generic(
 	if ((endOnInput) && unlikely(srcSize == 0))
 		return -1;
 
-	/* Main Loop : decode sequences */
+#if LZ4_FAST_DEC_LOOP
+	if ((oend - op) < FASTLOOP_SAFE_DISTANCE)
+		goto safe_decode;
+
+	/* Fast loop : decode sequences as long as output < oend-FASTLOOP_SAFE_DISTANCE */
 	while (1) {
-		size_t length;
-		const BYTE *match;
-		size_t offset;
+		/* Main fastloop assertion: We can always wildcopy FASTLOOP_SAFE_DISTANCE */
+		assert(oend - op >= FASTLOOP_SAFE_DISTANCE);
+		if (endOnInput)
+			assert(ip < iend);
+
+		token = *ip++;
+		length = token >> ML_BITS;	/* literal length */
+
+		/* decode literal length */
+		if (length == RUN_MASK) {
+			enum variable_length_error error = ok;
+
+			length += read_variable_length(&ip, iend - RUN_MASK,
+					(int)endOnInput, (int)endOnInput, &error);
+			if (error == initial_error || error == overflow_error)
+				goto _output_error;
+			if ((safeDecode) && unlikely((uptrval)(op) +
+						length < (uptrval)(op))) {
+				/* overflow detection */
+				goto _output_error;
+			}
+			if ((safeDecode) && unlikely((uptrval)(ip) +
+						length < (uptrval)(ip))) {
+				/* overflow detection */
+				goto _output_error;
+			}
+
+			/* copy literals */
+			cpy = op + length;
+			LZ4_STATIC_ASSERT(MFLIMIT >= WILDCOPYLENGTH);
+			if (endOnInput) {	/* LZ4_decompress_safe() */
+				if ((cpy > oend - 32) ||
+				    (ip + length > iend - 32))
+					goto safe_literal_copy;
+				LZ4_wildCopy32(op, ip, cpy);
+			} else {	/* LZ4_decompress_fast() */
+				/*
+				 * LZ4_decompress_fast() cannot copy more than 8
+				 * bytes at a time : it doesn't know the input
+				 * length, and relies on end-of-block properties.
+				 */
+				if (cpy > oend - 8)
+					goto safe_literal_copy;
+				LZ4_wildCopy(op, ip, cpy);
+			}
+			ip += length;
+			op = cpy;
+		} else {
+			cpy = op + length;
+			if (endOnInput) {	/* LZ4_decompress_safe() */
+				/*
+				 * We don't need to check oend, since we check it
+				 * once for each loop below.
+				 */
+				if (ip > iend - (16 + 1/*max lit + offset + nextToken*/))
+					goto safe_literal_copy;
+				/*
+				 * Literals can only be <= 14, but hope compilers
+				 * optimize better when copying by a register size.
+				 */
+				LZ4_memcpy(op, ip, 16);
+			} else {	/* LZ4_decompress_fast() */
+				LZ4_memcpy(op, ip, 8);
+				if (length > 8)
+					LZ4_memcpy(op + 8, ip + 8, 8);
+			}
+			ip += length;
+			op = cpy;
+		}
+
+		/* get offset */
+		offset = LZ4_readLE16(ip);
+		ip += 2;
+		match = op - offset;
+		assert(match <= op);
+
+		/* get matchlength */
+		length = token & ML_MASK;
+
+		if (length == ML_MASK) {
+			enum variable_length_error error = ok;
+
+			if ((checkOffset) &&
+			    (unlikely(match + dictSize < lowPrefix))) {
+				/* Error : offset outside buffers */
+				goto _output_error;
+			}
+			length += read_variable_length(&ip,
+					iend - LASTLITERALS + 1,
+					(int)endOnInput, 0, &error);
+			if (error != ok)
+				goto _output_error;
+			length += MINMATCH;
+			if ((safeDecode) && unlikely((uptrval)(op) +
+						length < (uptrval)op)) {
+				/* overflow detection */
+				goto _output_error;
+			}
+			if (op + length >= oend - FASTLOOP_SAFE_DISTANCE)
+				goto safe_match_copy;
+		} else {
+			length += MINMATCH;
+			if (op + length >= oend - FASTLOOP_SAFE_DISTANCE)
+				goto safe_match_copy;
+
+			/* Fastpath check: skip LZ4_wildCopy32 when true */
+			if ((dict == withPrefix64k) || (match >= lowPrefix)) {
+				if (offset >= 8) {
+					assert(match >= lowPrefix);
+					assert(match <= op);
+					assert(op + 18 <= oend);
+
+					LZ4_memcpy(op, match, 8);
+					LZ4_memcpy(op + 8, match + 8, 8);
+					LZ4_memcpy(op + 16, match + 16, 2);
+					op += length;
+					continue;
+				}
+			}
+		}
+
+		if ((checkOffset) && (unlikely(match + dictSize < lowPrefix))) {
+			/* Error : offset outside buffers */
+			goto _output_error;
+		}
+		/* match starting within external dictionary */
+		if ((dict == usingExtDict) && (match < lowPrefix)) {
+			if (unlikely(op + length > oend - LASTLITERALS)) {
+				if (partialDecoding) {
+					/* reach end of buffer */
+					length = min(length, (size_t)(oend - op));
+				} else {
+					/* end-of-block condition violated */
+					goto _output_error;
+				}
+			}
+
+			if (length <= (size_t)(lowPrefix - match)) {
+				/*
+				 * match fits entirely within external
+				 * dictionary : just copy
+				 */
+				memmove(op, dictEnd - (lowPrefix - match),
+					length);
+				op += length;
+			} else {
+				/*
+				 * match stretches into both external
+				 * dictionary and current block
+				 */
+				size_t const copySize = (size_t)(lowPrefix - match);
+				size_t const restSize = length - copySize;
+
+				LZ4_memcpy(op, dictEnd - copySize, copySize);
+				op += copySize;
+				if (restSize > (size_t)(op - lowPrefix)) {
+					/* overlap copy */
+					BYTE * const endOfMatch = op + restSize;
+					const BYTE *copyFrom = lowPrefix;
+
+					while (op < endOfMatch)
+						*op++ = *copyFrom++;
+				} else {
+					LZ4_memcpy(op, lowPrefix, restSize);
+					op += restSize;
+				}
+			}
+			continue;
+		}
+
+		/* copy match within block */
+		cpy = op + length;
+
+		assert((op <= oend) && (oend - op >= 32));
+		if (unlikely(offset < 16))
+			LZ4_memcpy_using_offset(op, match, cpy, offset);
+		else
+			LZ4_wildCopy32(op, match, cpy);
+
+		op = cpy;	/* wildcopy correction */
+	}
+safe_decode:
+#endif
 
-		/* get literal length */
-		unsigned int const token = *ip++;
-		length = token>>ML_BITS;
+	/* Safe loop: decode the remaining sequences near the end of the output. */
+	while (1) {
+		token = *ip++;
+		length = token >> ML_BITS;	/* literal length */
 
 		/* ip < iend before the increment */
 		assert(!endOnInput || ip <= iend);
@@ -189,28 +541,19 @@ static FORCE_INLINE int LZ4_decompress_generic(
 
 		/* decode literal length */
 		if (length == RUN_MASK) {
-			unsigned int s;
+			enum variable_length_error error = ok;
 
-			if (unlikely(endOnInput ? ip >= iend - RUN_MASK : 0)) {
-				/* overflow detection */
+			length += read_variable_length(&ip, iend - RUN_MASK,
+					(int)endOnInput, (int)endOnInput, &error);
+			if (error == initial_error || error == overflow_error)
 				goto _output_error;
-			}
-			do {
-				s = *ip++;
-				length += s;
-			} while (likely(endOnInput
-				? ip < iend - RUN_MASK
-				: 1) & (s == 255));
-
-			if ((safeDecode)
-			    && unlikely((uptrval)(op) +
-					length < (uptrval)(op))) {
+			if ((safeDecode) && unlikely((uptrval)(op) +
+						length < (uptrval)(op))) {
 				/* overflow detection */
 				goto _output_error;
 			}
-			if ((safeDecode)
-			    && unlikely((uptrval)(ip) +
-					length < (uptrval)(ip))) {
+			if ((safeDecode) && unlikely((uptrval)(ip) +
+						length < (uptrval)(ip))) {
 				/* overflow detection */
 				goto _output_error;
 			}
@@ -218,48 +561,66 @@ static FORCE_INLINE int LZ4_decompress_generic(
 
 		/* copy literals */
 		cpy = op + length;
+#if LZ4_FAST_DEC_LOOP
+safe_literal_copy:
+#endif
 		LZ4_STATIC_ASSERT(MFLIMIT >= WILDCOPYLENGTH);
 
 		if (((endOnInput) && ((cpy > oend - MFLIMIT)
 			|| (ip + length > iend - (2 + 1 + LASTLITERALS))))
 			|| ((!endOnInput) && (cpy > oend - WILDCOPYLENGTH))) {
+			/*
+			 * We've either hit the input parsing restriction or the
+			 * output parsing restriction.  In either case the next
+			 * (and last) sequence must be a run of literals.
+			 */
 			if (partialDecoding) {
+				/*
+				 * Since we are partial decoding we may be in this
+				 * block because of the output parsing
+				 * restriction, which is not valid since the
+				 * output buffer is allowed to be undersized.
+				 */
+				assert(endOnInput);
+				/*
+				 * If we're in this block because of the input
+				 * parsing condition, then we must be on the last
+				 * sequence (or invalid), so we must check that we
+				 * exactly consume the input.
+				 */
+				if ((ip + length > iend - (2 + 1 + LASTLITERALS)) &&
+				    (ip + length != iend)) {
+					goto _output_error;
+				}
+				assert(ip + length <= iend);
+				/*
+				 * We are finishing in the middle of a literals
+				 * segment.  Break after the copy.
+				 */
 				if (cpy > oend) {
-					/*
-					 * Partial decoding :
-					 * stop in the middle of literal segment
-					 */
 					cpy = oend;
-					length = oend - op;
-				}
-				if ((endOnInput)
-					&& (ip + length > iend)) {
-					/*
-					 * Error :
-					 * read attempt beyond
-					 * end of input buffer
-					 */
-					goto _output_error;
+					assert(op <= oend);
+					length = (size_t)(oend - op);
 				}
+				assert(ip + length <= iend);
 			} else {
-				if ((!endOnInput)
-					&& (cpy != oend)) {
-					/*
-					 * Error :
-					 * block decoding must
-					 * stop exactly there
-					 */
+				/*
+				 * We must be on the last sequence (or invalid)
+				 * because of the parsing limitations so check
+				 * that we exactly regenerate the original size
+				 * (must be exact when !endOnInput).
+				 */
+				if ((!endOnInput) && (cpy != oend))
 					goto _output_error;
-				}
-				if ((endOnInput)
-					&& ((ip + length != iend)
-					|| (cpy > oend))) {
-					/*
-					 * Error :
-					 * input must be consumed
-					 */
+				/*
+				 * We must be on the last sequence (or invalid)
+				 * because of the parsing limitations so check
+				 * that we exactly consume the input and don't
+				 * overrun the output buffer.
+				 */
+				if ((endOnInput) &&
+				    ((ip + length != iend) || (cpy > oend)))
 					goto _output_error;
-				}
 			}
 
 			/*
@@ -270,12 +631,13 @@ static FORCE_INLINE int LZ4_decompress_generic(
 			ip += length;
 			op += length;
 
-			/* Necessarily EOF when !partialDecoding.
+			/*
+			 * Necessarily EOF when !partialDecoding.
 			 * When partialDecoding, it is EOF if we've either
-			 * filled the output buffer or
-			 * can't proceed with reading an offset for following match.
+			 * filled the output buffer or hit the input parsing
+			 * restriction.
 			 */
-			if (!partialDecoding || (cpy == oend) || (ip >= (iend - 2)))
+			if (!partialDecoding || (cpy == oend) || (ip == iend))
 				break;
 		} else {
 			/* may overwrite up to WILDCOPYLENGTH beyond cpy */
@@ -293,44 +655,30 @@ static FORCE_INLINE int LZ4_decompress_generic(
 		length = token & ML_MASK;
 
 _copy_match:
-		if ((checkOffset) && (unlikely(match + dictSize < lowPrefix))) {
-			/* Error : offset outside buffers */
-			goto _output_error;
-		}
-
-		/* costs ~1%; silence an msan warning when offset == 0 */
-		/*
-		 * note : when partialDecoding, there is no guarantee that
-		 * at least 4 bytes remain available in output buffer
-		 */
-		if (!partialDecoding) {
-			assert(oend > op);
-			assert(oend - op >= 4);
-
-			LZ4_write32(op, (U32)offset);
-		}
-
 		if (length == ML_MASK) {
-			unsigned int s;
-
-			do {
-				s = *ip++;
-
-				if ((endOnInput) && (ip > iend - LASTLITERALS))
-					goto _output_error;
-
-				length += s;
-			} while (s == 255);
+			enum variable_length_error error = ok;
 
-			if ((safeDecode)
-				&& unlikely(
-					(uptrval)(op) + length < (uptrval)op)) {
-				/* overflow detection */
+			length += read_variable_length(&ip,
+					iend - LASTLITERALS + 1,
+					(int)endOnInput, 0, &error);
+			if (error != ok)
 				goto _output_error;
-			}
 		}
 
 		length += MINMATCH;
+		if ((safeDecode) && unlikely((uptrval)(op) +
+					length < (uptrval)op)) {
+			/* overflow detection */
+			goto _output_error;
+		}
+
+#if LZ4_FAST_DEC_LOOP
+safe_match_copy:
+#endif
+		if ((checkOffset) && (unlikely(match + dictSize < lowPrefix))) {
+			/* Error : offset outside buffers */
+			goto _output_error;
+		}
 
 		/* match starting within external dictionary */
 		if ((dict == usingExtDict) && (match < lowPrefix)) {
@@ -373,13 +721,14 @@ static FORCE_INLINE int LZ4_decompress_generic(
 			}
 			continue;
 		}
+		assert(match >= lowPrefix);
 
 		/* copy match within block */
 		cpy = op + length;
 
 		/*
 		 * partialDecoding :
-		 * may not respect endBlock parsing restrictions
+		 * may end anywhere within the block
 		 */
 		assert(op <= oend);
 		if (partialDecoding &&
@@ -402,6 +751,7 @@ static FORCE_INLINE int LZ4_decompress_generic(
 		}
 
 		if (unlikely(offset < 8)) {
+			LZ4_write32(op, 0); /* silence msan warning when offset == 0 */
 			op[0] = match[0];
 			op[1] = match[1];
 			op[2] = match[2];

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

