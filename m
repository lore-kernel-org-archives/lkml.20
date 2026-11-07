Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036848;
	b=CunuORSKqiDblvXQHlpk/K6CVcoA/wNA06HK6j8Ivzx0g/hVpub/udv/3XSd+EmxZgkn
	 3XSGqUE9+9BYegQ+l78DX6eNe1oBeYe9qt+19BxbDX1rSX1SFoWj/I6yZlIL7F0fSHnUy
	 No3WKnMQWRlksEl71mfk9kDLc2S76V/Q+mFFITNI/C06H1k0i7n7BrdtYCSnUqScRfJof
	 fVix8Bj0JsOoaT9N1STICCXdNVzdLGiMAF6dDi01mG3Rz24h1UQQcQYMN6hhWB/u3O4l8
	 cn6BJ6NvwFTKXNbFI8BNNqpq3RmwgI1VaZQkMbTr0kjQdWsg50xWwquIjYunCL8BcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036848;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mb6zscB9xA65zKWgADOGhrqsQ/nGHmGTb9eOGjPV3Qo=;
	b=vJUo+WNXW7wd4quKQjHIxR6VKpKgkb8tfdFbkAy53ikT69sTx8+TVhVJ1uMxqvfhUt0f
	 vFGjHUHDt5+H8FJenm0v7/+8TmqM6IAy78Jy8TA1WO6fC1bZengJU8grR0s1ifgPsFuHh
	 aLXKK55exbVqSTK0qqH03mCahrleqe6urQqmzyGRYRW0q7OTt8rwd+I+DDQgEOA15IR65
	 oXW3T05cqhfhFN8cAIXWe6cjMQxUYgweTKl7yWTA/wTfCQW8uhNWrXB2lRXEuH08+5bFU
	 kpCJr07QXHn/sSKqimkurjAEJ0QyKEvqoyJ1K9ur68fxpO9X+ZpeqiVpMc6NYhHny+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7XZKBhe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5713606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7XZKBhe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6821F0089F;
	Sat,  7 Nov 2026 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036847;
	bh=mb6zscB9xA65zKWgADOGhrqsQ/nGHmGTb9eOGjPV3Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7XZKBheSrKbie5VnFexSeQbIOTBncXvr7lTKpAFdHOkLHTyzufBqIEvQc9/QUiZ8
	 bL0NQ6orZouqNfUCKfpZ93GbXCDENZP3lgZx7PEYSf5lLFHd5Bq9UYCUbBfFHXQg+x
	 OsAnvXdsQb7OPApbsT+etftmAEHezMs1DTCkZNlGpuF8bwSR7PFW/NFSpZ03yzXh6y
	 1KHmLi06/f4BWOxmc2z1ozGzpCSYF1c5a6f309R7NTf0wba/KhbLzfqP7cnjE828pi
	 RKrj7UhzORA2cvJwgMKPTkt0PKzzUB37T0ehen5rlXy5L2w/Gr8ikx2vFSsL8eQTMh
	 QyeG/kAuci3Ag==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH 4/4] arm64: alternatives: Make branch and ADRP offset helpers noinst
Date: Sat,  7 Nov 2026 15:13:39 +0800
Message-ID: <20261107071339.17467-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071339.17467-1-jszhang@kernel.org>
References: <20261107071339.17467-1-jszhang@kernel.org>
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

patch_alternative() must avoid instrumented code while alternatives
are being modified, before cache maintenance completes. However, its
branch and ADRP offset helpers are instrumentable. A GCC build with
function tracing enabled emitted ftrace patchable entries for these
helpers.

Mark the four offset helpers noinstr. Introduce private
__always_inline immediate encoding and decoding implementations for
their use, and force inline the immediate mask helper.

The offset helpers pass constant encoding types, allowing the compiler
to eliminate invalid-type diagnostic paths. Keep the public immediate
helpers as wrappers to preserve diagnostics for other callers.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/lib/insn.c | 57 ++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index e70ac0238515..b98610fcab32 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -21,7 +21,7 @@
 #define AARCH64_INSN_N_BIT	BIT(22)
 #define AARCH64_INSN_LSL_12	BIT(22)
 
-static int __kprobes aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
+static __always_inline int aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
 						u32 *maskp, int *shiftp)
 {
 	u32 mask;
@@ -86,7 +86,12 @@ static int __kprobes aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
 #define ADR_IMM_LOSHIFT		29
 #define ADR_IMM_HISHIFT		5
 
-u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
+/*
+ * Keep the immediate helpers inline so noinstr callers using constant encoding
+ * types do not call instrumentable code, including the invalid-type diagnostics.
+ */
+static __always_inline u64
+__aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 {
 	u32 immlo, immhi, mask;
 	int shift;
@@ -101,8 +106,8 @@ u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 		break;
 	default:
 		if (aarch64_get_imm_shift_mask(type, &mask, &shift) < 0) {
-			pr_err("%s: unknown immediate encoding %d\n", __func__,
-			       type);
+			pr_err("%s: unknown immediate encoding %d\n",
+			       "aarch64_insn_decode_immediate", type);
 			return 0;
 		}
 	}
@@ -110,8 +115,14 @@ u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 	return (insn >> shift) & mask;
 }
 
-u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
-				  u32 insn, u64 imm)
+u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
+{
+	return __aarch64_insn_decode_immediate(type, insn);
+}
+
+static __always_inline u32
+__aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
+			      u32 insn, u64 imm)
 {
 	u32 immlo, immhi, mask;
 	int shift;
@@ -131,8 +142,8 @@ u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 		break;
 	default:
 		if (aarch64_get_imm_shift_mask(type, &mask, &shift) < 0) {
-			pr_err("%s: unknown immediate encoding %d\n", __func__,
-			       type);
+			pr_err("%s: unknown immediate encoding %d\n",
+			       "aarch64_insn_encode_immediate", type);
 			return AARCH64_BREAK_FAULT;
 		}
 	}
@@ -144,6 +155,12 @@ u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 	return insn;
 }
 
+u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
+					  u32 insn, u64 imm)
+{
+	return __aarch64_insn_encode_immediate(type, insn, imm);
+}
+
 u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
 					u32 insn)
 {
@@ -1299,23 +1316,23 @@ u32 aarch64_insn_gen_adr(unsigned long pc, unsigned long addr,
  * signed value (so it can be used when computing a new branch
  * target).
  */
-s32 aarch64_get_branch_offset(u32 insn)
+s32 noinstr aarch64_get_branch_offset(u32 insn)
 {
 	s32 imm;
 
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
 		return (imm << 6) >> 4;
 	}
 
 	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
 	    aarch64_insn_is_bcond(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
 		return (imm << 13) >> 11;
 	}
 
 	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
 		return (imm << 18) >> 16;
 	}
 
@@ -1327,35 +1344,35 @@ s32 aarch64_get_branch_offset(u32 insn)
  * Encode the displacement of a branch in the imm field and return the
  * updated instruction.
  */
-u32 aarch64_set_branch_offset(u32 insn, s32 offset)
+u32 noinstr aarch64_set_branch_offset(u32 insn, s32 offset)
 {
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
 						     offset >> 2);
 
 	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
 	    aarch64_insn_is_bcond(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
 						     offset >> 2);
 
 	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
 						     offset >> 2);
 
 	/* Unhandled instruction */
 	BUG();
 }
 
-s32 aarch64_insn_adrp_get_offset(u32 insn)
+s32 noinstr aarch64_insn_adrp_get_offset(u32 insn)
 {
 	BUG_ON(!aarch64_insn_is_adrp(insn));
-	return aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
+	return __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
 }
 
-u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
+u32 noinstr aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
 {
 	BUG_ON(!aarch64_insn_is_adrp(insn));
-	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
+	return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
 						offset >> 12);
 }
 
-- 
2.55.0

