Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442770;
	b=ZZDRZWzREKcM2CWmNBsksWmbWzFscz2s6jm5jxLbGj5ZSihBTZwQHbaP1eELHJJIaimg
	 UckReInJ1WoHIc/FFW9moEL33WfRpaj1TQOsl8A5p4Ouo+vdqLqxAsYUhQwoLq8HPBei6
	 omFfMgy729YvLgs7tdK79KMxLFe/tJroCZxCmCPRGB4Jk7TWb3lyPyz81TR8y8wMegYFr
	 HwaSCxG3EqcuFTANKuVrOX0PzNCDQ+cQWiyb+eCRMOyKEbPKPd52fSfzhsTII9mQjyyll
	 4KWPCq3BTbLnqhjanhGSE0Nppwe/u++xYQfXQ54tTFMwqCTckn/GtmFMS2VO+xhPE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SUuvul+SEemQ79xrz7tisvNK9CayGcgBDTH8UommGa4=;
	b=Sg3iwtSbkCJpt0ZqtZWe0XIapmhkM0Gcy9+moYTu4ptU/GW4trL+DncU6Ymb87m2X4cg
	 xIjmsUbN/VrRYlC0gXOeJYDB5F5zqjrIzqW06+vDCS4O1PY+o/rHCOh4OinDsJ9wmGZBV
	 ANuzzaCqrMromZgCbfxrxG+U+xEgFDcO0W4kEQfIIV5BVBBi141lK+cbcHQaKNnhyLOVJ
	 EJm61ffmM3pGNWzt7F9/CiXNdg5IoQlQW77s4fnvD1MFeJieTSsvmMbmoxLtFnCCimvdd
	 gZ5xg4KRvIwuBuD0TAYkfiHybNzazjLmVbbVpP3vmHvGExvzHpt4Vx6y4QQVqza5Ocw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTesODHF;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB605606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB605606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTesODHF
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e96be2196bso5128935ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442769; x=1794047569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUuvul+SEemQ79xrz7tisvNK9CayGcgBDTH8UommGa4=;
        b=uTesODHFHAFZYflePfTY5g8to5ZWchzv35QN/8YJAkzxPDXV3H8LVBY9vBxTFbYDtu
         bKcwH10A6xZREWuvZh9zHfQeRGVKgFCugxLV9y9bAc/O8HOhEUd6DBaU6wMQCia/efo/
         LPAjfGAHAtzdHnz46yufiR7vbpPBOX6XKc0AXcSqFFkT94BZI2a7BZkEQilwijQOjN+u
         QRAP66OHTxYRJomeBHj3I/ZxRxUlcPGtG3oWmvMJm9t0gtdVkuKoRQIivVq1tOQwLKI/
         0WjR4dRBKJ9yOT7xSYOHDi8y4ovWw73gHUKGNflnaah1URonwnme2PrE3cWVDZoBRnf9
         +PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442769; x=1794047569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SUuvul+SEemQ79xrz7tisvNK9CayGcgBDTH8UommGa4=;
        b=MschAbenY4SgJj5MHxBxtvxX/Pd9X8QY4lu5pBHvFMVB+xJwpUfoYtkqt5Dvl4uS7d
         3pxeGTxNakBRGW+i+ip2aT9ggUzy2+nypfoF/OU6ZZwMfylj4rgH2NGfhehDrC5g4ZAK
         cll54Jw1kaWBycEk2Tp97Ybu1z3eHYtR80nvATJWmAm9JtRBx6bNaCZSbbbXtIqFow0Q
         afeuB29pJtbj5Og3bQ+HMZRIGg2fl6iTeRzpSY0uwB7l4uD73cU6Fm1IZN9+vDm1givz
         kG42IRZptkEwHIdoBXZA12b+eIHUJZ12qL1GLTF3keSlHE161e8tg5ULtcnmCY87ognN
         77Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxyeDtr6dX3M9SerwLhansKJgim7VUqmrjwJVvp0CHmRH7iA4evK5VqomojxYhrZEBZ6Dj1Uf0/5sDFSts=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8XyXT2AgANQdXDKa8b1wCkH9svCy6a6ZxJFmwgXm8Ssc2e2xA
	awGzJcL13pSkr/Pt1eLRfUqZT7eGTu31MBnpNzW/McaJgPlUFQhyzk4=
X-Gm-Gg: AYBFou1h5SuN9L0kVskQv70P/8I3sqR8eW3ipnHTz+s0uICOUV7Nn7e6KKPW0+bFX0j
	8U+PWTPRGj7iPZ2Ingfzel1xRfngFpoYUpLpkCZ3uthqvPJLMhyPyCREf+/f2jUnkrHUN0qwAtN
	uO+OZHwh63/I1kDe5c7FpRp2HgnBUv9hXuiwJxbLLC8uT5p49NRvuOCnrC7GZM9ZJhwc/e9s2BS
	1KypWUPiSs/r2AwoUO09Vzh4OI7sp3FFnrypGryxrIGGgX8B3GiyxCCNPW/xo3cYHTwWEsMI/lW
	l6U/5R6WorFgMGmbvrlUFh9PzB86wz3q/t2u/kR47RNZWpXYqZ+nSkWbywNVR3JLxmXQHNgwgp5
	zAxAN2GbpzExCHiy4YUVipvUdE4zAQaZhbOq61HY1RI+KEbPZpLKFqkopg4JuFgjWXWhGK8+SHu
	fF4uPw3s9jSfWutocHyUlkBEn7QXF55pzp2tmK4i2ox04e/7/On6Rm+9Uy9G0q3FcKr3Bcsb2pt
	pX+6qqF+pEHcFmdYmk6fzCXymBvUgegRow3doU+zCrDsbZ5I5MwNDbdoXM9cXJqj55dArEvHeZK
	Vm6yBvBpa1IAVfpLZOMA5h301b/73zIGM0/VilSJc8rHQv12amXxHSlsNFg1zg==
X-Received: by 2002:a17:902:ebd1:b0:2e2:d834:a40f with SMTP id d9443c01a7336-2eb363965d7mr46196985ad.9.1793442768660;
        Sat, 31 Oct 2026 03:32:48 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm14817275ad.53.2026.10.31.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:32:47 -0700 (PDT)
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
Subject: [PATCH v5 3/3] rust: math: add signed division and remainder helpers
Date: Sat, 31 Oct 2026 18:32:06 +0800
Message-Id: <20261031103206.24051-4-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031103206.24051-1-chenhan0017.work@gmail.com>
References: <20261031103206.24051-1-chenhan0017.work@gmail.com>
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

Delta's division and remainder implementations operate on integers and
do not depend on time units. Move them into a math module to provide a
common home for arithmetic helpers, with Delta as the initial user.

Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
and an i32 remainder, matching the results of the C helper without
exposing its output pointer. Delta's rem_nanos() uses the remainder and
converts it to i64. Both helpers retain Rust's signed operator semantics
and unconditional panic checks, using the existing C helpers on 32-bit.

Keep the Delta API and its panic conditions unchanged. Document the
quotient and remainder semantics and link to the corresponding C header.
This is separate from the preceding behavior fix so that introducing
the math module is not required for a backport.

Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v4:
- Explain that the preceding zero-divisor check establishes the C call
  precondition; keep MIN/-1 checks for Rust panic semantics.
- Retain the output-pointer validity explanation for the remainder call.

 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time.rs | 50 ++++---------------------------
 3 files changed, 78 insertions(+), 44 deletions(-)
 create mode 100644 rust/kernel/math.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..60c2af705b47 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,7 @@
 pub mod kunit;
 pub mod list;
 pub mod maple_tree;
+pub mod math;
 pub mod miscdevice;
 pub mod mm;
 pub mod module;
diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
new file mode 100644
index 000000000000..0b4738ba97c1
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Integer arithmetic helpers.
+//!
+//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).
+
+/// Divides an [`i64`] dividend by an [`i64`] divisor, rounding towards zero.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
+#[inline]
+pub fn div64_s64(dividend: i64, divisor: i64) -> i64 {
+    if divisor == 0 {
+        panic!("attempt to divide by zero");
+    }
+
+    if dividend == i64::MIN && divisor == -1 {
+        panic!("attempt to divide with overflow");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        dividend / divisor
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        // SAFETY: `divisor` is non-zero due to the check above.
+        unsafe { bindings::div64_s64(dividend, divisor) }
+    }
+}
+
+/// Divides an [`i64`] dividend by an [`i32`] divisor, returning `(quotient, remainder)`.
+///
+/// The quotient is rounded towards zero. A non-zero remainder has the sign of `dividend`.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
+#[inline]
+pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32) {
+    if divisor == 0 {
+        panic!("attempt to divide by zero");
+    }
+
+    if dividend == i64::MIN && divisor == -1 {
+        panic!("attempt to divide with overflow");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        let divisor = i64::from(divisor);
+        let quotient = dividend / divisor;
+        let remainder = dividend % divisor;
+
+        // CAST: |remainder| < |divisor| <= 2^31, so the remainder fits in i32.
+        (quotient, remainder as i32)
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        let mut remainder = 0;
+
+        // SAFETY: `divisor` is non-zero due to the check above.
+        // `&mut remainder` provides a valid, aligned, writable pointer for this call.
+        let quotient = unsafe { bindings::div_s64_rem(dividend, divisor, &mut remainder) };
+
+        (quotient, remainder)
+    }
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index c9a2dc50ff4c..f38e2fbd2670 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -27,6 +27,8 @@
 use core::marker::PhantomData;
 use core::ops;
 
+use crate::math;
+
 pub mod delay;
 pub mod hrtimer;
 
@@ -418,24 +420,7 @@ impl ops::Div for Delta {
     /// and `rhs` represents `-1` nanosecond.
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
-        if rhs.value == 0 {
-            panic!("attempt to divide by zero");
-        }
-
-        if self.value == i64::MIN && rhs.value == -1 {
-            panic!("attempt to divide with overflow");
-        }
-
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.value / rhs.value
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            // SAFETY: `rhs.value` is non-zero due to the check above.
-            unsafe { bindings::div64_s64(self.value, rhs.value) }
-        }
+        math::div64_s64(self.value, rhs.value)
     }
 }
 
@@ -634,32 +619,9 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     /// nanoseconds and `divisor` is `-1`.
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
-        if divisor == 0 {
-            panic!("attempt to calculate the remainder with a divisor of zero");
-        }
-
-        if self.value == i64::MIN && divisor == -1 {
-            panic!("attempt to calculate the remainder with overflow");
-        }
-
-        #[cfg(CONFIG_64BIT)]
-        {
-            Self {
-                value: self.as_nanos() % i64::from(divisor),
-            }
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            let mut rem = 0;
-
-            // SAFETY: `divisor` is non-zero due to the check above.
-            // `&mut rem` provides a valid, aligned, writable pointer for this call.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
-
-            Self {
-                value: i64::from(rem),
-            }
+        let (_, remainder) = math::div_s64_rem(self.as_nanos(), divisor);
+        Self {
+            value: i64::from(remainder),
         }
     }
 }
-- 
2.34.1

