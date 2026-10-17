Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C73391846
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235536; cv=none; b=QU7iNfc7uZ3P9BDGhA6c+NbahgeHad1XyaV9Lr+tGgh074RegP+XuoZ9uOrtBKvNYcuhwVKiSJGrscbcXwWNn+zWddA6tKTmEnaiNlnhPvLhSHDbKMe3pxJmLd5tLUH0aV94cz1pJq4l1jylnayNVjo7Xk9ZOmbm5k6M6UWoN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235536; c=relaxed/simple;
	bh=CZ/4mCz3AwkHw3AEhD8gzoJDXrd4OT1ZncF3K4pPwI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZLK+mebsWOiirCZcsflIIlHLLN6J7NMAYvVrBgA/Jv0lCXVPZtQqD1YFa5r33yAIukZjVZoHT/bBqjZlEyExhAEzBiDw+P96ah+Ibp/XTOaA9Oo+Ktd8FYxsUNPLozl8aNyWBiiIbLgVo7/eBfDhJYtv3UEypAzwi3eZc3N9jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNPOJf/f; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNPOJf/f"
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so4330395ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235534; x=1792840334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGWEiSNUlMpq8pZ7W1rHC0O/tLdV2czO1KQpY6zfWMQ=;
        b=WNPOJf/fQYJPWygUTGFYfIQiAsPyYjCJNOfIjszP4fAsvUf1cZSHFK1jhNv2usqZng
         LVKcz6HBGBxMQ5XZFuovjrjsqFob1iV17ZF4xvS/Q0H1IFdw92lG/sk7LsRVXk08aac5
         ffQWpAWoO1/2ZkEUiyaoByB0ZHLtqOi9UBdEqYqdTXV7Hy3FSngq7PkkPAWMSNnJbgZy
         WVb5YFrsodJFiJVSs8QIeBcadvfGVBPv0VX7g1moT100N8tYZBw9p7GTz89M6zUD89B1
         e/xHbM/ddUiZgQZD17umcB5r0LTquhNs0S0KdSWskTLsB41LA5/GfQ6K6cBELjLpFMyy
         CEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235534; x=1792840334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGWEiSNUlMpq8pZ7W1rHC0O/tLdV2czO1KQpY6zfWMQ=;
        b=0wlCu7c9EqfUzQxTmVsmDNFjSpjO7J0I6ulHvFuPfKZpfXdwuWhvrCIoD0wCnjJX5G
         PDx0HlZjEd6/Jbuc++hCV2Do20FKFungqpj4lobD647gQYdGO9ThgsyOzi5rp0csN9xV
         kJo/uHy5bAmABK+a/lN09zGQ42dBvimCzqZOWs029xLeixpqrFX48unC4fsZTz5dIOcH
         UJKqSWda8JQoQYpLVGVFBaujk+xTTv5br8KLAK0PHtAWt2lGV1bbrJeZIzefnMzHFrIQ
         XRNEcblhkXp3fCprdQun5zg0qTG9YZqunnK6IS/GVbQhVrQbT/uLjkGXFjBobttn2qpV
         eeNA==
X-Forwarded-Encrypted: i=1; AKwUvBx+cL5yon4n01IzCSqjoPxZ/PjgP78Mjz9eXGFtBSwNY1LCE0OYctJMmoGcsP/CYNjeXMYbMVUwQeMNK7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9JPWfQlDsgjO8DYYBt0V3a+v68ys++3YOqt+TlOkvVTfl8QBR
	qDGAD+NRATxdTRJaFPy0q/ynpnn7LfJpeykm1LMnp05BZ6GnsFzE4a8=
X-Gm-Gg: AYBFou3lOPunl6TDXRKW3IDPzsRFJeaKMGZdyJpQv5/7yO1zMQKJrH1Ym5D+N93ysBW
	MOC88wRAFmCnlYNSzrSnSCoITwbT47W50b4LITvIzQCSSmd6DNqTUpnBRuKNS7LmUE9R/NROjUk
	GZlxwBNwg9jArq9DgXfTOBYPUK/yxraz7DeOU+EAnvU99/zV4Ats2hck4bnqpqHCHt+10oGrR3O
	VKbvI5GPrMp0dDkL5WLRfomReioVYO3bKdDK/AAIX9PvhvDNfzH5uQe1KgJAG3CeNiryu7V1EQC
	IFndyLm2SDC1xQGDS+DAxsCcPTywAha4E2wXC37/ImVL8NuT6jQTNc1bgz2pbw+hbOx6HEtbARe
	D2P3v8DvZL6oSGDKmPgXUXD44L5QW3N8iD2VXiV8th3L1DUPZVHo64Sak2yK+OrGsuDZVyV/z5l
	9iltSj355GPaIyG+Sx2ti16zemzBD6054FmTejiJ521m+3+WzhWNJrFepBn9rUp1SPviBl3v4N2
	TTBlE3qof21/xl9H+7lLUhw8yAP
X-Received: by 2002:a17:90b:580f:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3acee27aa58mr2186380a91.3.1792235534164;
        Sat, 17 Oct 2026 04:12:14 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a0c:9a40:9205:1:be24:11ff:fe93:ff0e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm2974687a91.4.2026.10.17.04.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:12:13 -0700 (PDT)
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
Subject: [PATCH v3 2/3] rust: time: make Delta division and remainder fail consistently
Date: Sat, 17 Oct 2026 19:11:33 +0800
Message-Id: <20261017111134.22546-3-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017111134.22546-1-chenhan0017.work@gmail.com>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

