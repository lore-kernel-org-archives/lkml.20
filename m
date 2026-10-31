Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442743;
	b=e+JcDmv63Azfz4DDWUZ94S/PrXcfbOq8PTXA5rOk+d78tTYFycrW5ybolIGAfxNJecGd
	 OBEl7sZC0l4uZLbp56jjMQCl8pQpsH5/ntrbyE92vTekp3Y+KkvnoIeSD314YyDaXf9K9
	 OmLIaTKwqhM7Ok0JTolqYOzjPQkdQVYjJX2zoMiDIHGhkTAWU2x0N9BTXEnijdCu1R/7h
	 k0sPfN0RCc09AiOvkn5KSxBm5VNU1/FtmEDFZ2cDkhE8O6cf+rhiSYVRAZxGlRLodOf+n
	 1iDZuqsBWtUctD6631OtBqUZlojCwngyTlggGEobh2xMCHIfugoCuTTX2HVg9/0nAgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
	b=xdGF2naSaKE/W/siM9W8vv8sfDYAGluVgJp0YMOHXpf2uOPvZ5JfAW4CRVPlRnc69oId
	 c+hzPBUPIzidVPPg9W0isqU2XVQ120EgR/Q+gMCa1LRHTbIAF5rH0q3+xLXldS6f2XevU
	 xnU4xypGlnXA8/ELRcd+/usM63fpizyNV7CKHX8c8m7bHpMUM5oKzrftvvzIx3nI5m47o
	 IlGZoP/87ltfJ9Z05TOJcdU1TO8izfyH7be044+FjkKUhOJiST0kkxbvDFnzZ+YpxEtgX
	 XEC/kSdKAG/UnomtmmSjC9XrYBKVOnkQ3yefvM0ZM1/9YV0qlTdHjlMa11TSVZb4DDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ5urIJb;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3739606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3739606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQ5urIJb
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2e876f468e5so6078445ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442741; x=1794047541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
        b=BQ5urIJbmF4FhhMyMWEx8LDpUokm/W4rpv3QWdy89r7+5hFnMvPM0rt7549uqlFWJF
         QEM1z4k7pFVM/QbSbCS+u8EUkLWMNUvkmikYCdVU7+Xv/7U9dX3CthWWSefKO0vk2o1W
         pwbHgDRQfDoVya/C01jzD/kX6sZ6LoaTuzk2C3N65WJJB5zdL2GjNsdLINnrmPnXyrIB
         mRSZuQaL8fCvU982VWcRb4e+y4Gg9ZSqit/ipgoHzGUjGJ1LBT1zT7dp79ZpYprFhnh2
         nsA5NO70ogwsuQX3C0wH7+3y74ng+tAIZwaO8Ydu9wmARrMyKnILFmZ0ydaZW6JR862h
         M0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442741; x=1794047541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPY5lhcw++gPf54FwE96VpaykMluB7++7cp+zVzrA0A=;
        b=dLgcT6xG2AAwfRvNrjAO9RkJ4n9FHJIDzg0nIhhCd/KEQmYCi9if/N0HHtS+l9hpji
         fx5oeHPrWx+6I4MfSRebtLXRRbJYu+UmUF+cxcTO6CV4XxTeIBO+PtNh77LETa6f8t1C
         ddLy9wLjMhwA9VC3RoRcrbameSs5JCYgzYag7FSOxo+Z758Y6nuFN+zpib1nNCDtV7vd
         rAtBiVMSudcHxxxb3WTU8/nu79mQ4dVBifXXUtr9fVlo/P3F4rKXD2dKJYh3K7Iz74mo
         59gHNg2hkuvJg6FsQ6TM/WbSqTNffijw7dU+zSBy3hbZ1iqGXk7ZhxTam85CMukbTpVe
         uW/w==
X-Forwarded-Encrypted: i=1; AKwUvBx2Be+2OpiYx//h+THtS7Xr4ISNIVLqzNrjkFTn0IeKK7XeuVpbuG+o5WVy71OmB5v+CGjWgxDkAK64698=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8YC9KOsUsFx7HFIqLDPlMrh4Xy0tavrmqJ3awveNZxQlVPffL
	mzgEAsFll8rU0NgrwH277V/Gi+2RDpwdbIYGO8waBGtB/r6xrdFAAwI=
X-Gm-Gg: AYBFou1EgjY/RbDYk5vhKnMFB8YZlU2Oz8Rm0aJvT9pYTDuwTjqErCgpt9iz8WU7/RJ
	kkzliCJOz08SSuD2xTvl7fNQanB9X73ocfUmiCCaRhHXZlPY7mxgjRFlqpKHaSnzx3yHKwCFEcY
	wMmnZrLX5OWZBZX53QLHfkCovo+xh/Y5tmLe4+ltXBFo8/VD6sunrm+3Hm0JnwjSXWdcm67MA2t
	Igv1yQNjmsF+TfzcsyuEEjvW8Od3K4cBEhMD6XDXiJFAhqm8kG+2pk5Ck4QtwKvU2qwHyTAI8kh
	w90IiGa/2Jyzl33iKDHC6fiXTMYhZ9qJoiLRvfcPweswRhGm7VDU3KPnmbwcZW6Oi2hlkzS0sJj
	LSZxpNe3pinFT3N6tUMyBodTL7WpYBiYfWSE5Z1qvTq4A5yzo8VDsnWCXhlzR51p00m69uxN/rB
	0PmDKD7PoTPs+GgJFxOf8YpcQzfVQR0VrJFQup+pkNykhqTvukCpAqnvRr8hzNtK5DF9ShK7syE
	4PSMw/T0bGNAaVE/aFOUSPMcfQ7nrQRukW6Q2L6DyroqcEYvOsLr33HaIv09bRNqTgLWrU7Rf21
	RBGwftB1rTgBtuRHdD7MEdYWvs50+IoXI5CYFaCGhJUoP0Y+hgPtT70CWFG+Aw==
X-Received: by 2002:a17:903:384d:b0:2e9:9bac:2e90 with SMTP id d9443c01a7336-2eb3650d23fmr42816325ad.65.1793442741065;
        Sat, 31 Oct 2026 03:32:21 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm14817275ad.53.2026.10.31.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:32:19 -0700 (PDT)
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
Subject: [PATCH v5 0/3] rust: time: fix Delta arithmetic and add math helpers
Date: Sat, 31 Oct 2026 18:32:03 +0800
Message-Id: <20261031103206.24051-1-chenhan0017.work@gmail.com>
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

V5 addresses Andreas's review [2] of v4 [1]:
- In patch 2, make the SAFETY comments cite the preceding zero-divisor
  check as establishing the non-zero divisor required by the C call.
- Keep the remainder output-pointer explanation and carry the same
  comments into the math helpers in patch 3.

The MIN/-1 checks remain for Rust's panic semantics. There are no changes
to executable code, public APIs or panic conditions relative to v4.
Patch 1 is unchanged and retains Tomonori's Reviewed-by. Patch 3 still
awaits review of the tuple-returning interface introduced in v4.
A range-diff against v4 follows below.

Patches 1 and 2 form the stable candidate pair: the parameter rename is
a prerequisite for the behavior fix. Patch 3 introduces the math module
separately and is not intended for stable.

The base remains timekeeping-next at
2ea0119f72dba597aa8a98cbdb72c564bfc5cb38, unchanged on October 31.
On rust-next at d89e1d186ec9271bf78e62771779e9fc03bf0fc3,
patches 1 and 2 apply unchanged; patch 3 needs its lib.rs registration
placed between maple_tree and mem. This was checked for application
only; the runtime validation below used the declared base.

Tomonori's PWM series [3] also introduces rust/kernel/math.rs, with
unsigned helpers. The module header is shared, and the signed and
unsigned helpers are complementary. Whichever series is applied later
will need a small rebase to keep one module declaration and header.
Neither series is present in the above branch tips as of this posting.

V5 passes rustfmt and whitespace checks. Applying the exported patches
reproduces each commit tree; the affected source at each series prefix
is identical to v4 after excluding comments. QEMU was not rerun for
this comment-only revision. V4 validation on x86-64 and ARMv7, with
Rust overflow checks enabled and disabled, passed all 36 boots,
400 valid calls, 496 scalar comparisons and 32 expected panics. V4 also
passed rustdoc generation on both architectures. Those results are
unchanged evidence from v4, not new v5 runs; details are in [1].

[1] https://lore.kernel.org/rust-for-linux/20261023130413.178487-1-chenhan0017.work@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/87bj8goc6x.fsf@t14s.mail-host-address-is-not-set/
[3] https://lore.kernel.org/rust-for-linux/20261030020209.3833766-1-tomo@flapping.org/

chenhan (3):
  rust: time: rename the rem_nanos() divisor
  rust: time: make Delta division and remainder fail consistently
  rust: math: add signed division and remainder helpers

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 47 ++++++++++--------------------
 3 files changed, 88 insertions(+), 31 deletions(-)
 create mode 100644 rust/kernel/math.rs


base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38

Range-diff against v4:
1:  ed93030078ac = 1:  ed93030078ac rust: time: rename the rem_nanos() divisor
2:  ff344561eebb ! 2:  fdbb042d5743 rust: time: make Delta division and remainder fail consistently
    @@ rust/kernel/time.rs: fn div(self, rhs: Self) -> Self::Output {
              #[cfg(not(CONFIG_64BIT))]
              {
     -            // SAFETY: This function is always safe to call regardless of the input values
    -+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++            // SAFETY: `rhs.value` is non-zero due to the check above.
                  unsafe { bindings::div64_s64(self.value, rhs.value) }
              }
          }
    @@ rust/kernel/time.rs: pub fn rem_nanos(self, divisor: i32) -> Self {
                  let mut rem = 0;
      
     -            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
    -+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++            // SAFETY: `divisor` is non-zero due to the check above.
     +            // `&mut rem` provides a valid, aligned, writable pointer for this call.
                  unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
      
3:  63d7f5dd76f7 ! 3:  79891109d486 rust: math: add signed division and remainder helpers
    @@ rust/kernel/math.rs (new)
     +
     +    #[cfg(not(CONFIG_64BIT))]
     +    {
    -+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++        // SAFETY: `divisor` is non-zero due to the check above.
     +        unsafe { bindings::div64_s64(dividend, divisor) }
     +    }
     +}
    @@ rust/kernel/math.rs (new)
     +    {
     +        let mut remainder = 0;
     +
    -+        // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    ++        // SAFETY: `divisor` is non-zero due to the check above.
     +        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
     +        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
     +
    @@ rust/kernel/time.rs: impl ops::Div for Delta {
     -
     -        #[cfg(not(CONFIG_64BIT))]
     -        {
    --            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    +-            // SAFETY: `rhs.value` is non-zero due to the check above.
     -            unsafe { bindings::div64_s64(self.value, rhs.value) }
     -        }
     +        math::div64_s64(self.value, rhs.value)
    @@ rust/kernel/time.rs: pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     -        {
     -            let mut rem = 0;
     -
    --            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
    +-            // SAFETY: `divisor` is non-zero due to the check above.
     -            // `&mut rem` provides a valid, aligned, writable pointer for this call.
     -            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
     -
-- 
2.34.1

