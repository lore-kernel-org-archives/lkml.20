Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760691;
	b=NPH48SrKs7MIIbeQqFmD6BRD6x6VuJN7H0iTn2Az5gnc01fE7yeemwNT7Ms3+mF2vUpE
	 YNh4q6I5yAhBeJBy7SwCHZB92CEg87HeGact3D/PnoSf6RCUgloV8c8TLtVChlYNqrLgI
	 HPEgo/YLrQMYO0ZSrFo9CwOwuZbGY6dsMSmqlM+hkEhjxu74aXSzRj+w1ed/KjeVJowjj
	 IOxpVvnHSfV85cC0dc9eXQtS+SE9SeeV5x7OM1Hk6NBWNi9cmYDpNkj0OdvT9OggwmV/8
	 RtBXvwRoBYU0bBRb2fe8Rifuw1Ga1guYyBuObJA/Ij7cTrBRcPNTHIGBYp9gvuMy/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
	b=1E0KNJNcb7UQVPNx2E0/RPWAxh5TILZZeLeLIM7BgftnQ0OsIuf4EAsVNeVgUoOKBpdC
	 OLOHkuNXTFVeg9ByFHHDs19h/fuvHuHfgPGexBhJSMJ1yFcC3weiDjtHC7zbV8+r6F2i5
	 GtmIpQhEDqw9awfeTLkL1lTQktDVOtCIdtt5nc/k7McuS69tSIDxc3NPNhOUSgqG1hvGO
	 FfrDIp9NZFNppseyEv8SxJXITHSUsCX8V03UXU/YuzmNW/+uFm9E3IXQjlQSBliaLhDqt
	 TeVkq9R6hxdlOuwwqNdwp0XMS9KjwiU8ap4yohviNNrfqkRHQ8WHsJqPRNFGtTqkqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EXIEDt/g";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E7606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EXIEDt/g
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so525056a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760690; x=1793365490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
        b=EXIEDt/g77XCyjvCOrXALm3ZjHJcurzVbgOuPo4yHc8b9BSFah8t+KxTVfVdO5QG9V
         0NqJXHIxid2iTef539sMqBLQYJxS/4iudVK6vuejtUfgqVySseLWHX5eE1iQOu81gAqD
         MpsqSTgdIxnQyB8lkVxQJuMSL/PFLJIxgVdgMsEEolkqIQ/jOhqd1FXzG2LYLTo8mvyq
         REBZ6f1G0tkhszg83Eo7BPUKLk+tRFdu2ZfhneMHQ2I2QroxV1mxQ+1EZ4Av0U+wtswl
         cmsRBa8cCbx+OuY/8T2FQTy034Rotx+u+UwHD5V7ThgYg+58uHbB1iUuOy+AvWeVZWM1
         oVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760690; x=1793365490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/9Qj668b8yCGUf9keY9GwKS6HdGazYw0/H94SqUfB4=;
        b=GQDn56np4Os6JJbtExV4n1lnFda/5cw00EL8SqagQQfzzAMn9PJ9mUV7PBhnhP4Ifv
         9ZYtRnO4ZIsFw8FoJ4N69ovktiK2VFgi+poGy7qzmfr1KffyjZ9ZIeTDm2pvjvLYx54e
         lQDyYcytUE4jWa9hhQRGpTe/i/if3gdEjHI0kSeEqotsUIV6Bc3cKa7rU138dvxM7aju
         Fv8YC5bcl340XJsnrc03BGVOibsdVWzehkrDCiAbxkMmFWPS1V8JAKfi6Cp0SPjRkvK/
         KZwOwh92cnJvXz5VTL67O1PZKOz62bmsiN9p+TCyL53fB3PC9LfwHPeRbLgumSlRSmTO
         a1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHJEETaEirtSYK+RJkLM8rpwhFpS/w0iqOxcHReV9a3y+44HHTMvFOyqonSmofz+K1W2L/6XomCZllOYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq1pmyO34udLNKSSLhTVukJd9mLxgMUu0/zB1TWN2cKgsw68li
	tCdAS+ci0M8rDBYB1XPxjybzt1b9X9MxA2Dw2XvkX6JJTsKcBbbdMzQ=
X-Gm-Gg: AYBFou2E9tZRJ9O+5NUsjqa2/oMZ+AJTEFVyDdRS6eJJoauYcEc+IXQ2zz0ixuoZ62m
	FW/DzYpwf9smBDuKmuRiU4gmwaddahtWOsZRUqlf0MLb3Eu1/RVIjwE1XewyKoiCJWMyCoFhKWL
	dgie4jut3D8o/XOYItoMzwhHxZkMSzOxeVXxGIiRKcBIWFM38gQzd6QMRpMZ0y9VGlmEDCQTngI
	DWkucNWurkKD3INiWvEQIkeRL43S7fwTmMDOSDOdI5gsAm0jIyCB3hoHT/wyV5s5YdtuBAaUn6h
	hGY9MvsTPuzpLTPhqa3eBMA8oO5PVv/x7/kuj9rwY+/lanEtKxKFjuIlqbQLCr/DYhCKv3q4aWO
	i6BNfAaJoZ2Wud/BxB0aT528WWQb5zRjk2UWZMo+0FyWwj0POP5xHRglef7E3NErMce/qwrqyIQ
	zdB3xf09BSU2K+hoQT0IZAdDTx22AGB5qxxEFZVSk4OSuzsWbxLciQLlNQLW6VDOx9bAA1ppj4B
	MwLIdRoWgIjq+KTYeq5NpWOcIjtgHrlq/aI0L2dC+3QPwUcTkwtMWe2mvcA+kwWkWdiQUzIVWIH
	AY0vwymljg==
X-Received: by 2002:a17:90a:e7c1:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3adce02ec99mr1936652a91.14.1792760689865;
        Fri, 23 Oct 2026 06:04:49 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([109.105.193.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add282a8bcsm1349017a91.2.2026.10.23.06.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:04:48 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] rust: time: make Delta division and remainder fail consistently
Date: Fri, 23 Oct 2026 21:04:12 +0800
Message-Id: <20261023130413.178487-3-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023130413.178487-1-chenhan0017.work@gmail.com>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com>
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

Delta's division and rem_nanos() use Rust operators on 64-bit and C
helpers on 32-bit. The report shows that rem_nanos(0) can return 10 for
a 10 ns dividend on ARMv7, while the same call panics on x86-64. The
i64::MIN / -1 case also differs, and neither API documents these inputs.

Check for zero divisors and i64::MIN with -1 before the architecture-
specific code, and document the panic conditions on each method. This
matches Rust's signed division and remainder operators, including when
overflow checks are disabled. Valid-input results and API signatures
are unchanged; invalid inputs now panic on 32-bit too.

No in-tree calls to either API were found at the base commit. The checks
stay in the existing methods so the fix does not depend on introducing
a math module.

Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations for Delta")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1254
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v3: none.

 rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 16b44e82d2ac..4415e91a5227 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -412,8 +412,20 @@ fn mul_assign(&mut self, rhs: i64) {
 impl ops::Div for Delta {
     type Output = i64;
 
+    /// # Panics
+    ///
+    /// Panics if `rhs` is zero, or if `self` represents [`i64::MIN`] nanoseconds
+    /// and `rhs` represents `-1` nanosecond.
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
+        if rhs.value == 0 {
+            panic!("attempt to divide by zero");
+        }
+
+        if self.value == i64::MIN && rhs.value == -1 {
+            panic!("attempt to divide with overflow");
+        }
+
         #[cfg(CONFIG_64BIT)]
         {
             self.value / rhs.value
@@ -421,7 +433,7 @@ fn div(self, rhs: Self) -> Self::Output {
 
         #[cfg(not(CONFIG_64BIT))]
         {
-            // SAFETY: This function is always safe to call regardless of the input values
+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
             unsafe { bindings::div64_s64(self.value, rhs.value) }
         }
     }
@@ -615,8 +627,21 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     }
 
     /// Return `self % divisor` where `divisor` is in nanoseconds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`]
+    /// nanoseconds and `divisor` is `-1`.
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
+        if divisor == 0 {
+            panic!("attempt to calculate the remainder with a divisor of zero");
+        }
+
+        if self.value == i64::MIN && divisor == -1 {
+            panic!("attempt to calculate the remainder with overflow");
+        }
+
         #[cfg(CONFIG_64BIT)]
         {
             Self {
@@ -628,7 +653,8 @@ pub fn rem_nanos(self, divisor: i32) -> Self {
         {
             let mut rem = 0;
 
-            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
+            // SAFETY: The checks above exclude a zero divisor and `i64::MIN / -1`.
+            // `&mut rem` provides a valid, aligned, writable pointer for this call.
             unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
-- 
2.34.1

