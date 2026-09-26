Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43D36B915
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453019; cv=none; b=AajIFtrygYwxlXQfM3N2D7BZ2qC49y3Wlu8oJs078MqstC9oyD9Fqs0Q801xr41VqFaWZDbQsoVfE88P9VbnL4GetKn7McoBO+PHM9BlrAt1vdIyc0zLT9WBEVuqozRJn5/CkxWkjaqzjUA+qa7xjoPN1XdRBiwXFCiKQrKWz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453019; c=relaxed/simple;
	bh=4+NlSkSruuUz35LpkuHxEXXEYR14qEgi2CPQADHxUp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cm+6aNSEdIRMStXDKHXPT+vCxK+/1h4o9TvuUfJv+FrVTpq6kU4Csl+WSTHwZ6K/+MFgkiTvqItsuvoQhM9jql+mE9Fm//RH5UrurHIXmaDKyGd6b58KoOXE966DET8TXtj9GjU+ytHhAnbC6mD8cyXLYbVyQiQ4jPP0PoQq31g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMMYnFY1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMMYnFY1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso10962385e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790453016; x=1791057816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JV0R4A2CtNGyNXfBKQ8L8aUKnPrT308gGRncCBqw10w=;
        b=IMMYnFY1ZG8AsO1FSJPYdrMXgIIfe6oxjSrqWPr45GDXNCLUEuzmGdAq+ittLUtBmb
         xXyQbrqtv0HpOQwvjGETEKW0HIvBL0v24GytER//QRD6CNkauho6WxJh4OVm426PvWOZ
         46mV3T4tUZplIQ8f3yK6bRe2lsMmlUz5eILMclXTcsuVXc7t2VVTl4hMLfZh0UjlvXd9
         MrYtX9nKoiK6wtzs2NgHmv+OcDbmCsxJqDQCjXW3ziMOgDbgvNRlirwUF6g2RxipS5zq
         bTArTFBaowrTQUqHLpQfYZd3jopSP72EmMOqKEBVWuLIUB8EQz/OdBpeMWYZgTXYTvrC
         8ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790453016; x=1791057816;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JV0R4A2CtNGyNXfBKQ8L8aUKnPrT308gGRncCBqw10w=;
        b=I03Gtm7WbjiYRMQ1A5obvvHqgZY96mqQNOWDWRc1PJlndd7ApQzFRqZ43mUjBqrxXp
         WB3n5wg3lQWf0udtFognogATiMUCa24cWtzJ9pBs+zBFyIL6WrinSAV4Alw9sibZJWoM
         T/BZ0d5rtArwMclXTYvYj5eDiuWI0o4QP56bmQVQ9lCAnAD/DKZi7tmj7UP+PCt3Qly9
         SdG+JO0ZIFJHRI7KDvjMNb/mycMAaX6eEV+2Dr9kCh+a0qYVuwQnuXtIcdUh9VoiEkcO
         J8z2SL20vsKBihY9gJalsmJmBVbafalYwZNCfRNVvixvRRGEiDHCV7t3NQLn41qL8A8Z
         sqBg==
X-Forwarded-Encrypted: i=1; AKwUvBwKTAxukbZ4HHcqhV4JIv4P5q4xWKfKtdP6WgN49NZncYQ2W2YP48P4GJrScPrAYRB9wNoQ5GhgWDGWkKo=@vger.kernel.org
X-Gm-Message-State: AFuF++mEKdsvryx1NjzcJwSuzHqSUJgqnWOGzT1dikKd/1HhQccD8SFJ
	vdTOs1biQ5KvU1q2BrLdVwq2bj+ZhkRqZn2t/RxfDQ2AuaiUUrb4/FAe
X-Gm-Gg: AYBFou32Nul+6IkTEEWPAp/YqMz5pLeGNffZLi8IYVWb2/GfirF2N0igjbyLGrb1CPj
	OqmIJ4A/OPZVKh6xQRwdGARCsu6n4Ai2JDZe+H6VpyB7oUW91NwTbCy/l32ayswfkcCZR2QxJs6
	GBkTu0SsTOD0JDCa4nXZEQsUDFXtb7iqOiIFv+bOWK+6lnOQBXMkNDm3aKClzi8yTsbacklGUKC
	erEegBBeVY2I9H10wmFyHYvFYwGh0p29E0K3UBwOD/5YTIa9R0Z29jUcjch0I12F1AbnWNsLm7E
	+E8MVEe3NydUlbWauTIEjzIgF8bDRF+x3r+70I3KyCNevJGpr8JS7ujYBZVTs2N+H6NQ8kGJAaG
	rcsVJ670T+Mr5uVJ65m6Nk7/9Yk77PB6He1K90D7zP9HMkeop2uTM49YFY22+sFXALS+hfFZioo
	HUv7yYB3H41uCmr72bYljfR5aQWC+LpyN8iAaoBrjxzNLVGwGt7jnU3bKxf8Ct5HwJBni7Ex0OF
	05s3yI=
X-Received: by 2002:a05:600c:3515:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-49fe66d089dmr162800615e9.11.1790453015630;
        Sat, 26 Sep 2026 13:03:35 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm196648925e9.13.2026.09.26.13.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:03:35 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [RFC PATCH bpf-next 0/1] bpf: Remove redundant __reg_deduce_bounds() call in reg_bounds_sync()
Date: Sat, 26 Sep 2026 23:02:31 +0300
Message-ID: <20260926200313.281893-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reg_bounds_sync() calls __reg_deduce_bounds() twice back-to-back. This
series removes the second call, which is a no-op with the current
cnum-based bounds representation.

Background & Motivation:

The double call predates the cnum representation. With the old tnum +
min/max logic, deduction between 32-bit and 64-bit views was not
idempotent: narrowing one view could allow further tightening of the
other, so two passes were needed to reach a fixpoint. With cnum, both
views are represented using the same circular-number model, so the first
pass already reaches the fixpoint.

I am sending this as RFC to confirm whether the second call was intentionally
kept as a defensive measure, or if it is simply a leftover. If there is a reason
to keep it, I would appreciate the context.

Correctness:

The idempotence of __reg_deduce_bounds() (call it D) was checked from
several approaches:

1. Algebraic argument:
   cnum64_cnum32_intersect() guarantees that for every value v in the
   result r64, (u32)v is in r32. This means r32 is already a subset of
   cnum32_from_cnum64(r64), so the first step of a second D application
   is intersecting a set with a superset, a no-op. With r32 unchanged,
   the second step is also a no-op by the idempotence of
   cnum64_cnum32_intersect() with a fixed second argument.

2. Z3 verification at full 32/64-bit width (bit-blast tactic):

   The Z3 encoding was first validated against the real kernel cnum
   object code (cnum_kern.o) on 20,000 inputs with zero mismatches.
   Four lemmas were verified at full 32/64-bit width:

     L1: cnum32_intersect(cnum32_intersect(a,b), b) == cnum32_intersect(a,b)
         UNSAT in 17s
     L2: after one D, cnum32_intersect(r32, from64(r64)) == r32
         UNSAT in 536s
     L3: cnum64_cnum32_intersect(cnum64_cnum32_intersect(a,b), b)
             == cnum64_cnum32_intersect(a,b)
         UNSAT in 26s
     L4: D(D(x)) == D(x)  [direct query, bit-blast]
         UNSAT in 8932s

     so:
        L1: cnum32_intersect() is idempotent with a fixed second operand.
        L2: after one D, the 32-bit intersection does not change r32.
        L3: cnum64_cnum32_intersect() is idempotent with a fixed r32.
        L4: D itself is idempotent.

   L2 and L3 together imply L4 algebraically; L4 was also verified
   directly as a cross-check. No counterexample exists in the full
   32/64-bit input space.

3. Exhaustive test at reduced bit widths:
   Widths from 2/4 up to 5/10 bits (preserving the algebraic structure
   of the full-width code) were tested exhaustively. Over 1 billion
   inputs, zero mismatches.

4. Random test at full 32/64-bit width:
   1.5 billion boundary-biased random inputs tested against the real
   kernel cnum object code. Zero divergences.

Performance:

reg_bounds_sync() is called from 14 sites in verifier.c, covering ALU
operations, comparisons, and helper/kfunc returns.
Removing the second __reg_deduce_bounds() call saves approximately
16-21 cycles per reg_bounds_sync() call (measured with
boundary-biased precomputed inputs on x86-64).

On a synthetic ALU-heavy BPF program (754 insns, 150 ALU chains),
verification time decreased by ~16%:

  before (2x __reg_deduce_bounds): 1464 us average over 2000 runs
  after  (1x __reg_deduce_bounds): 1221 us average over 2000 runs

Measured in a KASAN-free KVM guest on bpf-next at 4f3a5eae8, using
BPF_PROG_LOAD syscall timing with log_level=0.

Ömer Mete Kaya (1):
  bpf: Remove redundant second __reg_deduce_bounds() call in
    reg_bounds_sync()

 kernel/bpf/verifier.c | 1 -
 1 file changed, 1 deletion(-)

--
2.55.0
