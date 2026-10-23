Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760671;
	b=oZ6b6FmLFdt5zLsaHHJaTOJ9Gb2ODKcQgo58qojiZTChdWwdS0z4e+bT8yQli8+hoiF5
	 y34BffPVbId9BxagWA2WQ4rrSE3gCrz1wK2xGGXD0/bNFLVbxIANP5nu/cMO56tMF+KsD
	 Gj8AgXugU+tfreAXGEfi5bPREdcMTTxcmaWDIOW7MQl91KD3AnFuH66Fil3Gp2LtwHa+F
	 QstpV0bVF3jATcIrL1V+CzqvMy/PPgNzakvSt1YebrpAgC/ZOHHd2m87ZbpJ35s1LNgCf
	 2LtZ2cflD1+TXWIgsM4h9GspnJSA14UDTshuqliNm8SAnDe4hCzvhDmp8Gt/T9y2Neg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
	b=DmSSMzavuaoF6QvDGvTCvj+XOwaiVif5sLj82ydE3Dy/9Ejv4prTPhYbtlsUkFDNWwWt
	 3o7zDdE50r+QEGyLS6t+g1f5KOzrJrC+qeybedV2Vq3QDYc+bhUW+MdHQSFA6U6QZLx2W
	 Bb9YuNoadxdCRIoniUSXBBE/ybnAg9/sV8niC3rvtYiBSDMopFp6sytAm/Nj6wzKmWQiU
	 6X+6HYwX475VmlotMoXxNFjNARAgN7Wj27yQQYzHkjgAp9EZbsm0bjVzXtTGOeGz2giq+
	 /HtH6U0I+Ak7m3IvBhqTa9iOD4hAcMWbLLQkmtrhAr6ao1cEt9AXQwGA278+yx6NU4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FPv55LBT;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B23606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FPv55LBT
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso226098a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760669; x=1793365469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
        b=FPv55LBT7TdUEzhW6iqyNuX4jiMfJSQfKoUaFpr6HLw+YQeNphapvIsI9h3sgnr4cI
         40HCsmUN0J56ypzHtJhAXR75U9PS/pwVQ1CqBnoFS/5WJaDc6srC2zCTLyz4PULsCdok
         Mt/jm9QD0jC7+qvCa9JcEbQnrSr2P+TIxzAvEjCBi95S/WFNzEfUgpmmipvbHZvTgv9K
         jT9jxVZe+mFv2vXij6IVf3dAGPahRV4LSlzL+mvUR7lMrdr7c4F5BxNM8kPmRiDNLN21
         Xibcg1JztY3tb0LS7MaQ3xc0p8SgE5laLVMYzhRiZuSZx9z5X21TMRjrUhOYGloZ57zW
         HoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760669; x=1793365469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFzTp4McY4TXdVXyz0+uKI0uNjSlG+US60cFiZ2tb2c=;
        b=D6QlkcSlZJ8taIq9ap89OOFHO6O/PHNRvJAUvu4ChGgZmLnYj4IK5SLwsQ1jeQZqOC
         W3EPPKi5DDgckeRWFBirHoNMFc6cWoiK6lSbqW2iu9BkESb3KWP0JaukjlCdvj7gdvwc
         CDB00tU7QTGhV11eZPUZU/mugBlMcK2lnsuX7tMepN+hxysec/dkMIjOTHqzwCOeu4hB
         oro8Rjc1/PKZsBhI/MhkRXDPngrwBU7RAhheSkr5I5i99XWGHm0AzsPN6/8vZub5R0g/
         AcrF/YK08cSMik0WhUsPGPxJbHZOgqsjGBAZ/xzxYsPGaQsz0gb3Aa+vLxqld07roKOm
         CCmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8OT/ndXef6G426Hr8xAGKJjc0vSocfW7PYnIvN3iNLtu1zkh5eKBGGGU1lNMQOTypulGdAyfWNd+VAFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzMwL3dx0IWlLJwoOWzw79X2roKUFuz7pSBrETgUsonr25Qc6b
	DiwtfRpAbWNjeVeH8jXsnefNyvrnrSSOgoIL+njSmJaHQXQ0ziuiADpwvqL+aGZdfg==
X-Gm-Gg: AYBFou16WeHsS6rqcbD0R4MyMUdDFCtvqjUtrSpwGgu0aJ4f33mS3123NnLjQ19lIcM
	IInz+/i8OaPJeEuJIeijEiLCY+rs/zhmMuxX6iyxbD/Lir6K+bDWd9GjyHtSHyDvMHxxnA5kFvv
	u62IbNQW7rBlu94FshOKjv+zv8meBebIvvM2ch7jtiK+ucgAGxc/Gb5ATlAhGpUFGZ4+N74gtkp
	yAheiJkqiStaeLKmqJT6ctCjmZQQMp7qdwF2scjygt8RufgnCW0K7wj3aeNXUnBmaHy7qTIjJwO
	U73+mo+WdEHrTgKgacuZzL1IX+2M03sNiKco0Y0IFF2Ks2Sf9PGWtzhciqIyNiw/RoXxt21pTOG
	A8sFJmsGo9plikGntoqXlwV7rRn2iJo2C5uFojwwxlkTWM83EpOQiV9eNodjX/0vEDCW0e8gO+T
	rW/hXouqWe+rdsWbjeX5rdC2k/A866x3zazcV7rBrBiVG0cMcAw5xJLsp5r3dT4XDdlOzjtkbCf
	LEZ/Ngk5DtgMtA+NG8IvrrXDfi329nQuNVcNudOhpyHJtFyTqRigiq97PSb/u3XYSoOLWG5j0L4
	icOOaRQhbg==
X-Received: by 2002:a17:90b:574e:b0:3ac:9c37:9429 with SMTP id 98e67ed59e1d1-3adce0dc067mr1891969a91.52.1792760667464;
        Fri, 23 Oct 2026 06:04:27 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:26 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] rust: time: fix Delta arithmetic and add math helpers
Date: Fri, 23 Oct 2026 21:04:10 +0800
Message-Id: <20261023130413.178487-1-chenhan0017.work@gmail.com>
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

This series fixes the architecture-dependent handling of invalid Delta
division and remainder inputs, then moves the integer operations into a
math module with Delta as its initial user.

V4 addresses Tomonori's follow-up review [1]:
- Add the math64.h link to the module documentation.
- Replace rem_s64() with div_s64_rem(i64, i32) -> (i64, i32), returning
  both quotient and remainder. Document the semantics and the i32 cast.
- Update Delta::rem_nanos() to use the remainder. Keep div64_s64() for
  full-width divisors and retain unconditional invalid-input checks.
- Extend local validation to call both public helpers directly and check
  both tuple elements, including i64::MIN / i32::MIN = (4294967296, 0).

Patches 1 and 2 have unchanged code. Patch 1 carries Tomonori's
Reviewed-by; patch 2 is otherwise unchanged from v3. Patch 3 does not
carry its v3 Reviewed-by because the public interface has changed.
A range-diff against v3 [2] follows below.

Patches 1 and 2 form the stable candidate pair: the parameter rename is
a prerequisite for the behavior fix. Patch 3 is separate and is not
intended for stable. The caller recheck found no additional production
users for the helpers; each still has one caller in Delta. No PWM or
unsigned arithmetic changes are included.

The base remains timekeeping-next at
2ea0119f72dba597aa8a98cbdb72c564bfc5cb38, unchanged on October 23.
On rust-next at 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614,
patches 1 and 2 apply unchanged. Patch 3 needs only the lib.rs module
registration placed between maple_tree and the newly added mem module;
the remaining changes apply unchanged. That integration was checked
for application only; the runtime tests use the declared base.

Validation on x86-64 and ARMv7 QEMU passed with Rust overflow checks
both enabled and disabled. A standalone built-in test module passes
operands through black_box, calls Delta and the public math helpers,
and compares results with literal expected values. Each configuration
runs 100 valid calls (124 scalar comparisons) and eight separate boots
for zero-divisor and MIN/-1 panics. All 36 boots passed, covering
400 valid calls, 496 scalar comparisons and 32 expected panics. The
test module is local validation scaffolding, outside this series.

Both architectures also passed rustdoc generation, including the C
header link. The fix-only validation from v3 remains applicable because
the base and both prefix trees are identical; it was not rerun for v4
and is not included in the counts above.

[1] https://lore.kernel.org/rust-for-linux/20261021.183700.735437784476089878.tomo@flapping.org/
[2] https://lore.kernel.org/rust-for-linux/20261017111134.22546-1-chenhan0017.work@gmail.com/

chenhan (3):
  rust: time: rename the rem_nanos() divisor
  rust: time: make Delta division and remainder fail consistently
  rust: math: add signed division and remainder helpers

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 47 ++++++++++--------------------
 3 files changed, 88 insertions(+), 31 deletions(-)
 create mode 100644 rust/kernel/math.rs

Range-diff against v3:
1:  67c2d61e47da ! 1:  ed93030078ac rust: time: rename the rem_nanos() divisor
    @@ Commit message
         for documenting and checking the invalid divisors in the next patch.
     
         Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
    +    Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
         Assisted-by: LLM
         Signed-off-by: chenhan <chenhan0017.work@gmail.com>
     
2:  25000522fc46 = 2:  ff344561eebb rust: time: make Delta division and remainder fail consistently
3:  69a07812a676 ! 3:  63d7f5dd76f7 rust: math: add signed division and remainder helpers
    @@ Commit message
         do not depend on time units. Move them into a math module to provide a
         common home for arithmetic helpers, with Delta as the initial user.
     
    -    Expose div64_s64() and rem_s64() so driver crates can use these operations
    -    without constructing time values. The division helper takes two i64
    -    operands; the remainder helper takes an i64 dividend and an i32 divisor
    -    and returns an i64. Both keep Rust's signed operator semantics, including
    -    the unconditional panic checks, and use the existing C helpers on 32-bit.
    +    Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
    +    for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
    +    and an i32 remainder, matching the results of the C helper without
    +    exposing its output pointer. Delta's rem_nanos() uses the remainder and
    +    converts it to i64. Both helpers retain Rust's signed operator semantics
    +    and unconditional panic checks, using the existing C helpers on 32-bit.
     
    -    Keep the Delta API and its panic documentation unchanged. This is separate
    -    from the preceding behavior fix so that introducing the math module is
    -    not required for a backport.
    +    Keep the Delta API and its panic conditions unchanged. Document the
    +    quotient and remainder semantics and link to the corresponding C header.
    +    This is separate from the preceding behavior fix so that introducing
    +    the math module is not required for a backport.
     
         Assisted-by: LLM
         Signed-off-by: chenhan <chenhan0017.work@gmail.com>
    @@ rust/kernel/math.rs (new)
     +// SPDX-License-Identifier: GPL-2.0
     +
     +//! Integer arithmetic helpers.
    ++//!
    ++//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).
     +
     +/// Divides an [`i64`] dividend by an [`i64`] divisor, rounding towards zero.
     +///
    @@ rust/kernel/math.rs (new)
     +    }
     +}
     +
    -+/// Returns the remainder of an [`i64`] dividend divided by an [`i32`] divisor.
    ++/// Divides an [`i64`] dividend by an [`i32`] divisor, returning `(quotient, remainder)`.
     +///
    -+/// A non-zero remainder has the sign of `dividend`.
    ++/// The quotient is rounded towards zero. A non-zero remainder has the sign of `dividend`.
     +///
     +/// # Panics
     +///
     +/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
     +#[inline]
    -+pub fn rem_s64(dividend: i64, divisor: i32) -> i64 {
    ++pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32) {
     +    if divisor == 0 {
    -+        panic!("attempt to calculate the remainder with a divisor of zero");
    ++        panic!("attempt to divide by zero");
     +    }
     +
     +    if dividend == i64::MIN && divisor == -1 {
    -+        panic!("attempt to calculate the remainder with overflow");
    ++        panic!("attempt to divide with overflow");
     +    }
     +
     +    #[cfg(CONFIG_64BIT)]
     +    {
    -+        dividend % i64::from(divisor)
    ++        let divisor = i64::from(divisor);
    ++        let quotient = dividend / divisor;
    ++        let remainder = dividend % divisor;
    ++
    ++        // CAST: |remainder| < |divisor| <= 2^31, so the remainder fits in i32.
    ++        (quotient, remainder as i32)
     +    }
     +
     +    #[cfg(not(CONFIG_64BIT))]
     +    {
    -+        let mut rem = 0;
    ++        let mut remainder = 0;
     +
     +        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    -+        // `&mut rem` provides a valid, aligned, writable pointer for this call.
    -+        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };
    ++        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
    ++        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
     +
    -+        i64::from(rem)
    ++        (quotient, remainder)
     +    }
     +}
     
    @@ rust/kernel/time.rs: pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     -            Self {
     -                value: i64::from(rem),
     -            }
    ++        let (_, remainder) = math::div_s64_rem(self.as_nanos(), divisor);
     +        Self {
    -+            value: math::rem_s64(self.as_nanos(), divisor),
    ++            value: i64::from(remainder),
              }
          }
      }

base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38
-- 
2.34.1

