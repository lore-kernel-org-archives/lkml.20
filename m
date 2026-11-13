Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571198;
	b=a709A1YCHFE+tLfhX2OmF3tBcu6MXIpRV9M/X3nPUGZ963X0yQePkyTeYNNXFJztT7q8
	 BPJOlZ4yfGr1+7YAQ1rMdhaiLw66ZFoEYGQolsBL5OX/14OUm7WVloNhJRYvEgJciSjTo
	 3HgNh9h37QO5dYuLQQFWuQuCPxL/1QIb36A7I2dNxomOVGyHjWG7WFC4EkN8w2BzrKNCu
	 oVE1cYwqJB7NBtjVx/pY6U9m123IvZCqfugGkZsV+V+/UTv+c2eJR6EoXVCfTqnefFUP5
	 7sVe4Pz8Bx//IDJfw2VXi41q+VYDRwDislRf4MS8k0N+ahPhxplFbobazsT9Awm10FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571198;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=sRKb+x85n6075Hr+bUZdXEvrTYF8ST1m8Wua+UUf/KE=;
	b=41Y47S3C9kxj5FbfJ+9EYiXHv+KwCU3VU4vt3ubUJE5ZcEMzKGSTzSVKd4pgfyP1s+39
	 UsEZHxfDvVL3VgpYWA4AA63RrXp7osbb1vUmOYpStEfqDY4svIAsj9OgIL1MBm+tjGnvr
	 dLzQ59KPbB6ndnrZCanCu8NA+J9dinZqOmVMV4e7jJv+t8dQpUyTbMpw4SS50Hbk6JEHQ
	 Ye26Ydk/YJo/CE/EDs139y9F8zuHW77SwQmscMzbMkHhTUFZuwk100U0cBkY4OT1Yaye7
	 Uq/HxZysYhRc8Zmhp6SHxhPgtvqH68MfoV0PgTcLwLyenWbiHHUyWh4TUGI9yrZIHCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=ay2urVxM;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=ay2urVxM
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B71224C2F40105;
	Fri, 13 Nov 2026 12:59:47 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Lasse Collin <lasse.collin@tukaani.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/xz: Decode LZMA with local range decoder and dictionary state
Date: Fri, 13 Nov 2026 12:59:33 +0100
Message-ID: <20261113115937.188894-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1794571187; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=sRKb+x85n6075Hr+bUZdXEvrTYF8ST1m8Wua+UUf/KE=; 
	b=ay2urVxMu3oqxgjuCCc/rsmvSOn2Y45pFTq+KTvy8PifLrJj36N+YFn74q4OgzA4ml84Gk5q9C0F
	Bmai9ZPWmtebfiQ1a1xfylrD0nyMQRqEeymblGB0AauAN2tC3Vba0wYzHcmiGbvmjLhRwxPqcjPoQC
	hTKaVlEWQ0fLIQ7OMfxPTZ2lUVnBTHsM5QQOBXyiusjnKQzRUZRIhuAxmAPrUyoVKXduDIW6+/jQ+P
	rZbPTlfxjt14ymsjz2d8opwjQ9/PEYPhaeEgKA5lqlsaWl9EgR8hJUl8voZdaZYfsm/GyTYrLigmgB
	sKpeUUgqrzesdlD62hgiOrQI+QskaCzw==

Loading an xz-compressed module spends most of its time in lib/xz. On a
Dell XPS 13 9310 (Core i7-1165G7) with Debian sid/unstable,
finit_module() of i915.ko.xz takes about 110 ms, while liblzma 5.8.4
decodes the same file single-threaded in 61 ms.

lzma_main() and the functions it calls access the range decoder and the
dictionary through s->rc and s->dict. Every decoded bit stores to a
uint16_t probability, and every decoded byte stores to dict.buf, and
the kernel builds with -fno-strict-aliasing. So the compiler has to
assume that these stores modify *s, and reloads and stores rc.range,
rc.code, rc.in_pos, dict.pos, dict.full, … around each of them.

Copy both structures to local variables at the start of lzma_main()
and write them back at the end, and force inlining of the helpers that
take their address, so that the compiler can keep them in registers.

liblzma’s LZMA decoder does the same [1]: lzma_decode() works on a local
copy of the dictionary, and rc_to_local() makes a local copy of the
range decoder. liblzma has copied the range decoder since the first
commit of the xz repository in 2007 [2], and the dictionary since a
restructuring in 2008 [3], first released in xz 4.999.5alpha.

kernel/module/decompress.c uses this decoder in multi-call mode with
4 KiB output chunks.

Time to decode modules of a v7.4-rc1-132-g05441d697f7f9 build with
out-of-tree patches outside lib/xz (Debian’s 7.3.3+deb14-amd64
configuration updated with olddefconfig, GCC 16.2, modules compressed by
modules_install with xz --check=crc32 --lzma2=dict=1MiB) with a copy of
lib/xz in a test module, driven like module_xz_decompress()
(XZ_DYNALLOC, 4 KiB output pages), median:

                                  before      after                liblzma
    Core i7-1165G7  i915.ko.xz    97.9 ms    92.0 ms   (-6.0 %)     60.7 ms
    (Tiger Lake)    btrfs.ko.xz   49.3 ms    45.4 ms   (-7.9 %)     29.0 ms
    EPYC 7763       i915.ko.xz   134.3 ms   101.8 ms   (-24.2 %)    70.5 ms
    (Zen 3, KVM)    amdgpu.ko.xz 501.2 ms   378.5 ms   (-24.5 %)   266.2 ms
                    btrfs.ko.xz   64.8 ms    49.4 ms   (-23.8 %)    33.8 ms

liblzma 5.8.4 (with x86-64 inline assembly in its range decoder) for
comparison: userspace, single-threaded, from and to memory; on the EPYC
in the same KVM guest.

Link: https://github.com/tukaani-project/xz/blob/v5.8.4/src/liblzma/lzma/lzma_decoder.c#L256-L264 [1]
Link: https://github.com/tukaani-project/xz/commit/5d018dc03549c1ee4958364712fb0c94e1bf2741 [2]
Link: https://github.com/tukaani-project/xz/commit/3b34851de1eaf358cf9268922fa0eeed8278d680 [3]
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    Testing: 143 .xz files (the 72 files of the xz test suite, 11 generated
    streams with 4 KiB and 1 MiB dictionaries, lp=2 and the x86 BCJ filter,
    and 60 bit-flipped copies) decoded in single-call and multi-call mode
    with input and output chunks of 1, 7, 4096 bytes and whole buffers,
    under ASan+UBSan and under valgrind+UBSan: return codes, positions and
    output identical to the unpatched decoder; all bit-flipped files still
    return XZ_DATA_ERROR. Build-tested for x86_64 and i386 with W=1,
    including an XZ-compressed bzImage (pre-boot decoder) and
    CONFIG_XZ_DEC_TEST.
    
    Assisted by Claude Opus 5.5 (Claude Code): analysis, benchmark and test
    harness, code, and commit message.

 lib/xz/xz_dec_lzma2.c | 108 +++++++++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 43 deletions(-)

diff --git a/lib/xz/xz_dec_lzma2.c b/lib/xz/xz_dec_lzma2.c
index 46c2df6ad6f5e..056b1ed126f2d 100644
--- a/lib/xz/xz_dec_lzma2.c
+++ b/lib/xz/xz_dec_lzma2.c
@@ -322,7 +322,7 @@ static inline bool dict_has_space(const struct dictionary *dict)
  * still empty. This special case is needed for single-call decoding to
  * avoid writing a '\0' to the end of the destination buffer.
  */
-static inline uint32_t dict_get(const struct dictionary *dict, size_t dist)
+static __always_inline uint32_t dict_get(const struct dictionary *dict, size_t dist)
 {
 	size_t offset = dict->pos - dist - 1;
 
@@ -335,7 +335,7 @@ static inline uint32_t dict_get(const struct dictionary *dict, size_t dist)
 /*
  * Put one byte into the dictionary. It is assumed that there is space for it.
  */
-static inline void dict_put(struct dictionary *dict, uint8_t byte)
+static __always_inline void dict_put(struct dictionary *dict, uint8_t byte)
 {
 	dict->buf[dict->pos++] = byte;
 
@@ -348,7 +348,7 @@ static inline void dict_put(struct dictionary *dict, uint8_t byte)
  * invalid, false is returned. On success, true is returned and *len is
  * updated to indicate how many bytes were left to be repeated.
  */
-static bool dict_repeat(struct dictionary *dict, size_t *len, size_t dist)
+static __always_inline bool dict_repeat(struct dictionary *dict, size_t *len, size_t dist)
 {
 	size_t back;
 	size_t left;
@@ -583,7 +583,7 @@ static __always_inline void rc_bittree_reverse(struct rc_dec *rc,
 }
 
 /* Decode direct bits (fixed fifty-fifty probability) */
-static inline void rc_direct(struct rc_dec *rc, uint32_t *dest, uint32_t limit)
+static __always_inline void rc_direct(struct rc_dec *rc, uint32_t *dest, uint32_t limit)
 {
 	uint32_t mask;
 
@@ -602,16 +602,19 @@ static inline void rc_direct(struct rc_dec *rc, uint32_t *dest, uint32_t limit)
  ********/
 
 /* Get pointer to literal coder probability array. */
-static uint16_t *lzma_literal_probs(struct xz_dec_lzma2 *s)
+static __always_inline uint16_t *lzma_literal_probs(struct xz_dec_lzma2 *s,
+						    struct dictionary *dict)
 {
-	uint32_t prev_byte = dict_get(&s->dict, 0);
+	uint32_t prev_byte = dict_get(dict, 0);
 	uint32_t low = prev_byte >> (8 - s->lzma.lc);
-	uint32_t high = (s->dict.pos & s->lzma.literal_pos_mask) << s->lzma.lc;
+	uint32_t high = (dict->pos & s->lzma.literal_pos_mask) << s->lzma.lc;
 	return s->lzma.literal[low + high];
 }
 
 /* Decode a literal (one 8-bit byte) */
-static void lzma_literal(struct xz_dec_lzma2 *s)
+static __always_inline void lzma_literal(struct xz_dec_lzma2 *s,
+					 struct rc_dec *rc,
+					 struct dictionary *dict)
 {
 	uint16_t *probs;
 	uint32_t symbol;
@@ -620,13 +623,13 @@ static void lzma_literal(struct xz_dec_lzma2 *s)
 	uint32_t offset;
 	uint32_t i;
 
-	probs = lzma_literal_probs(s);
+	probs = lzma_literal_probs(s, dict);
 
 	if (lzma_state_is_literal(s->lzma.state)) {
-		symbol = rc_bittree(&s->rc, probs, 0x100);
+		symbol = rc_bittree(rc, probs, 0x100);
 	} else {
 		symbol = 1;
-		match_byte = dict_get(&s->dict, s->lzma.rep0) << 1;
+		match_byte = dict_get(dict, s->lzma.rep0) << 1;
 		offset = 0x100;
 
 		do {
@@ -634,7 +637,7 @@ static void lzma_literal(struct xz_dec_lzma2 *s)
 			match_byte <<= 1;
 			i = offset + match_bit + symbol;
 
-			if (rc_bit(&s->rc, &probs[i])) {
+			if (rc_bit(rc, &probs[i])) {
 				symbol = (symbol << 1) + 1;
 				offset &= match_bit;
 			} else {
@@ -644,23 +647,25 @@ static void lzma_literal(struct xz_dec_lzma2 *s)
 		} while (symbol < 0x100);
 	}
 
-	dict_put(&s->dict, (uint8_t)symbol);
+	dict_put(dict, (uint8_t)symbol);
 	lzma_state_literal(&s->lzma.state);
 }
 
 /* Decode the length of the match into s->lzma.len. */
-static void lzma_len(struct xz_dec_lzma2 *s, struct lzma_len_dec *l,
-		     uint32_t pos_state)
+static __always_inline void lzma_len(struct xz_dec_lzma2 *s,
+				     struct rc_dec *rc,
+				     struct lzma_len_dec *l,
+				     uint32_t pos_state)
 {
 	uint16_t *probs;
 	uint32_t limit;
 
-	if (!rc_bit(&s->rc, &l->choice)) {
+	if (!rc_bit(rc, &l->choice)) {
 		probs = l->low[pos_state];
 		limit = LEN_LOW_SYMBOLS;
 		s->lzma.len = MATCH_LEN_MIN;
 	} else {
-		if (!rc_bit(&s->rc, &l->choice2)) {
+		if (!rc_bit(rc, &l->choice2)) {
 			probs = l->mid[pos_state];
 			limit = LEN_MID_SYMBOLS;
 			s->lzma.len = MATCH_LEN_MIN + LEN_LOW_SYMBOLS;
@@ -672,11 +677,12 @@ static void lzma_len(struct xz_dec_lzma2 *s, struct lzma_len_dec *l,
 		}
 	}
 
-	s->lzma.len += rc_bittree(&s->rc, probs, limit) - limit;
+	s->lzma.len += rc_bittree(rc, probs, limit) - limit;
 }
 
 /* Decode a match. The distance will be stored in s->lzma.rep0. */
-static void lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
+static __always_inline void lzma_match(struct xz_dec_lzma2 *s,
+				       struct rc_dec *rc, uint32_t pos_state)
 {
 	uint16_t *probs;
 	uint32_t dist_slot;
@@ -688,10 +694,10 @@ static void lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 	s->lzma.rep2 = s->lzma.rep1;
 	s->lzma.rep1 = s->lzma.rep0;
 
-	lzma_len(s, &s->lzma.match_len_dec, pos_state);
+	lzma_len(s, rc, &s->lzma.match_len_dec, pos_state);
 
 	probs = s->lzma.dist_slot[lzma_get_dist_state(s->lzma.len)];
-	dist_slot = rc_bittree(&s->rc, probs, DIST_SLOTS) - DIST_SLOTS;
+	dist_slot = rc_bittree(rc, probs, DIST_SLOTS) - DIST_SLOTS;
 
 	if (dist_slot < DIST_MODEL_START) {
 		s->lzma.rep0 = dist_slot;
@@ -703,12 +709,12 @@ static void lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 			s->lzma.rep0 <<= limit;
 			probs = s->lzma.dist_special + s->lzma.rep0
 					- dist_slot - 1;
-			rc_bittree_reverse(&s->rc, probs,
+			rc_bittree_reverse(rc, probs,
 					&s->lzma.rep0, limit);
 		} else {
-			rc_direct(&s->rc, &s->lzma.rep0, limit - ALIGN_BITS);
+			rc_direct(rc, &s->lzma.rep0, limit - ALIGN_BITS);
 			s->lzma.rep0 <<= ALIGN_BITS;
-			rc_bittree_reverse(&s->rc, s->lzma.dist_align,
+			rc_bittree_reverse(rc, s->lzma.dist_align,
 					&s->lzma.rep0, ALIGN_BITS);
 		}
 	}
@@ -718,22 +724,24 @@ static void lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
  * Decode a repeated match. The distance is one of the four most recently
  * seen matches. The distance will be stored in s->lzma.rep0.
  */
-static void lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
+static __always_inline void lzma_rep_match(struct xz_dec_lzma2 *s,
+					   struct rc_dec *rc,
+					   uint32_t pos_state)
 {
 	uint32_t tmp;
 
-	if (!rc_bit(&s->rc, &s->lzma.is_rep0[s->lzma.state])) {
-		if (!rc_bit(&s->rc, &s->lzma.is_rep0_long[
+	if (!rc_bit(rc, &s->lzma.is_rep0[s->lzma.state])) {
+		if (!rc_bit(rc, &s->lzma.is_rep0_long[
 				s->lzma.state][pos_state])) {
 			lzma_state_short_rep(&s->lzma.state);
 			s->lzma.len = 1;
 			return;
 		}
 	} else {
-		if (!rc_bit(&s->rc, &s->lzma.is_rep1[s->lzma.state])) {
+		if (!rc_bit(rc, &s->lzma.is_rep1[s->lzma.state])) {
 			tmp = s->lzma.rep1;
 		} else {
-			if (!rc_bit(&s->rc, &s->lzma.is_rep2[s->lzma.state])) {
+			if (!rc_bit(rc, &s->lzma.is_rep2[s->lzma.state])) {
 				tmp = s->lzma.rep2;
 			} else {
 				tmp = s->lzma.rep3;
@@ -748,39 +756,50 @@ static void lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 	}
 
 	lzma_state_long_rep(&s->lzma.state);
-	lzma_len(s, &s->lzma.rep_len_dec, pos_state);
+	lzma_len(s, rc, &s->lzma.rep_len_dec, pos_state);
 }
 
 /* LZMA decoder core */
 static bool lzma_main(struct xz_dec_lzma2 *s)
 {
+	/*
+	 * Work on local copies of the range decoder and dictionary state.
+	 * Stores to the probability arrays and to dict.buf may alias *s, so
+	 * with s->rc and s->dict the compiler would have to reload and store
+	 * these variables around every decoded bit and byte.
+	 */
+	struct rc_dec rc = s->rc;
+	struct dictionary dict = s->dict;
+	bool ret = true;
 	uint32_t pos_state;
 
 	/*
 	 * If the dictionary write limit was reached during the previous call,
 	 * try to finish the possibly pending repeat in the dictionary.
 	 */
-	if (dict_has_space(&s->dict) && s->lzma.len > 0)
-		dict_repeat(&s->dict, &s->lzma.len, s->lzma.rep0);
+	if (dict_has_space(&dict) && s->lzma.len > 0)
+		dict_repeat(&dict, &s->lzma.len, s->lzma.rep0);
 
 	/*
 	 * Decode more LZMA symbols. One iteration may consume up to
 	 * LZMA_IN_REQUIRED - 1 bytes.
 	 */
-	while (dict_has_space(&s->dict) && !rc_limit_exceeded(&s->rc)) {
-		pos_state = s->dict.pos & s->lzma.pos_mask;
+	while (dict_has_space(&dict) && !rc_limit_exceeded(&rc)) {
+		pos_state = dict.pos & s->lzma.pos_mask;
 
-		if (!rc_bit(&s->rc, &s->lzma.is_match[
+		if (!rc_bit(&rc, &s->lzma.is_match[
 				s->lzma.state][pos_state])) {
-			lzma_literal(s);
+			lzma_literal(s, &rc, &dict);
 		} else {
-			if (rc_bit(&s->rc, &s->lzma.is_rep[s->lzma.state]))
-				lzma_rep_match(s, pos_state);
+			if (rc_bit(&rc, &s->lzma.is_rep[s->lzma.state]))
+				lzma_rep_match(s, &rc, pos_state);
 			else
-				lzma_match(s, pos_state);
+				lzma_match(s, &rc, pos_state);
 
-			if (!dict_repeat(&s->dict, &s->lzma.len, s->lzma.rep0))
-				return false;
+			if (!dict_repeat(&dict, &s->lzma.len, s->lzma.rep0)) {
+				ret = false;
+				goto out;
+			}
 		}
 	}
 
@@ -788,9 +807,12 @@ static bool lzma_main(struct xz_dec_lzma2 *s)
 	 * Having the range decoder always normalized when we are outside
 	 * this function makes it easier to correctly handle end of the chunk.
 	 */
-	rc_normalize(&s->rc);
+	rc_normalize(&rc);
 
-	return true;
+out:
+	s->rc = rc;
+	s->dict = dict;
+	return ret;
 }
 
 /*

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.54.0

