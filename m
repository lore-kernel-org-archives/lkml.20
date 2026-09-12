Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712B4BEE3C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789232106; cv=none; b=F7kaP2l5lxYaY/ArpmndIfhHd6XdRcWfWI1QoaPJXELzuV6rbpMYk5d+dQrBb3ZDByty1rz7k3klVXR8FyyHYAbTwMmtazsNsPkKDaiM+fRgnTSEC7NHwoEeJIiAOodhgozwar4XBzan3dx9YKhGPlgml2tF19a09DMA6AbmX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789232106; c=relaxed/simple;
	bh=kuFy371tS7bpMyHX0iSmX2LW6tEai/ZZ+g4sKugCucw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K6LK526TWs1wZi1M7ojgdk+3NZmqGhUEH9gDw4Yu4S31mkE2LLV+Nw7mXETVH2h3HxM1iCp4CEFo5jSR62fVBIoA5R7e+IMtPrk+DC21zzQmq2ApICh9sxvfImVSru3mJSMu33jqk7aNbPXomgS7Nm33yVuAtSj2m7P4Yq8+msI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4gVt/H1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4gVt/H1"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so522188a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789232103; x=1789836903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F2pfQqg4+b47iIVA7k9vTE5+FW8q6fKkHLnv54N0ZBM=;
        b=M4gVt/H1/WBx20cHafzweHR9/UUEytiV27NemzC0GiBOBphMu8QKJIbUDvshKcMrrl
         H8N4/YJwKHMjY9oL1AtbkjhuSTxubFfNPypfy5pMxOiSNj3SVE1acBhYO19HhIhna1PG
         tr6EH1E6h056JDF96/oPkAURX5H1vM+fo0cKlWbajx82NIJL/5Uq1S1sIlW5ZM2fBcUb
         QHlQ1XYxCNCc861o8ajZSysHmJ2v2BjYzdNq6nSjxqTuaOWrLjK9zo7uISyj8egzht+d
         jfqybt3/bSLrY/w5tQ+uCAMw5bdg8kStGxk0ooimE7CKx6T0XXHuhN4amS/SYcHRZaFV
         PDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789232103; x=1789836903;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F2pfQqg4+b47iIVA7k9vTE5+FW8q6fKkHLnv54N0ZBM=;
        b=THYj/3swc45dhACk/ZZNV6JpnpTssUTHxUL8+a4aAHP+PO1AGK+N4wR4gLTYsFoMkX
         IKj1HW/P6eOmGNjQxkNu6KKF2rUMLWG7R+6sLAs2vKOPVet8MiDuK09gTDhf5rwyJv35
         O9ILykP7ZVujxoFyhsx6DCHP8DUKep63YUZ3odmNxQ4CgLCmvaXuMX+049m8nQw/WCZl
         0qOt1XFKg4XDnvlWEuPANOFnQyMHCXTAqI3g7Af3473QrwpXNQ6D+jtHvnVdYJPRmcMB
         JLwIVdPsUI0klF4t6vtoBIDofps0ibgnJJIPt9vQS9VxY+inWVQFhgarntFN6uRIc87r
         g45A==
X-Forwarded-Encrypted: i=1; AKwUvBxtWlPWceT3PA0jan8vL1AXRwpUNUDPjqK89hjW3OiONO4LvvfWggIUwYlEUA9JZUGpJJYn1IkussH34HE=@vger.kernel.org
X-Gm-Message-State: AFuF++liV57gD/Qj39+wYtUmsAYKDyWGi8rks/E0opHjDnWZD2BMdD8v
	1YIcbv9t47d4kFrgv/ARcrNUtYMh0aWgE/+jdwkhMcIbkGo1M9RYABFs
X-Gm-Gg: AYBFou2D/6FYnpqRqYeud/9OVjYQGa2PlE5wW+v+N6M9PhFMEqC/ukxCKfQWYApSKlh
	ka8Yyft6qSxfMmk9zYK1pJcxfXO+4RcHCx/MD7rVx4+QOlAEyKhytDqiYpIA6WSZ+T8O6cgm2GK
	3JVYg8DF0UNwr1sdjPpZJXsY9BPmP1vYCxlFcocIFRRwKc3dVre3hqJzkF/Q+TStISDpVcfiXmY
	doZtSyitjtL8rCCmfjkSKZZrbUMO2Bh59fmZ9I3+lB9sIBn48K9O57Vz/rwM7UnAQxMIKrPSdx6
	1ZCZQEhkUe5Ms9Y3EIyKXX6Kaq91lOddB2n9vDdd8/CucI8F0oV71JJ7PkR7oGCNWDZNncATwFn
	Y9Mm0UAZNChkkN13f+HWg8Xf87NR2aJlQ4GCDAYaB4QyKKAK+f+PPvjxEGbVpFUfawVeACEfVBh
	RIHwjP3FnRN0ZgfBrD+ZaY20/792kccqBQY12JQqI5tuwUinJmK8lo0G99WMuhFbEPLUcQunHwx
	5f46A==
X-Received: by 2002:a17:90a:e7c5:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39dbc71af8fmr6220182a91.25.1789232103417;
        Sat, 12 Sep 2026 09:55:03 -0700 (PDT)
Received: from fedora.local ([2804:d57:4e62:f400:ee3b:9f08:f174:9cdc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bac1c716csm14276844eec.2.2026.09.12.09.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:55:02 -0700 (PDT)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sat, 12 Sep 2026 13:54:34 -0300
Subject: [PATCH] rust: impl_flags: add conversions for raw flag
 representations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMmDpWoC/x3MQQ5AMBBA0avIrE1STaO4iliUDmahlWmCRNxdW
 f7F+zckEqYEXXGD0MGJY8hRlQVMqwsLIfvcoJWuVVtpdN7jLHFDcSdOMRwkn0loamN906pxtBY
 y34Vmvv51PzzPC6OHsYdqAAAA
X-Change-ID: 20260912-add-from-raw-conversions-4647d890bb77
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: b4 0.14.2

Extend the impl_flags! macro to support conversions between generated flag
types and raw C/UAPI integers. Implement TryFrom<Repr> for individual flags
(exact variant match) and flag sets (rejecting unknown bits), along with an
unsafe from_raw() constructor for flag sets. Additionally, add BitOr and
BitOrAssign implementations between the raw representation and flag types.

Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
 rust/kernel/impl_flags.rs | 103 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index fdf44d5eea9cb907f6d8d209792a1d9b74b55be6..b6cce7318766419efbe18d2915bd8f949c1c7c19 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -14,6 +14,8 @@
 /// - The struct and enum types with appropriate `#[repr]` attributes.
 /// - Implementations of common bitflag operators
 ///   ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
+/// - Conversions between the Rust-native types and their raw representation.
+/// - Validation when converting raw values back into Rust-native types.
 /// - Utility methods such as `.contains()` to check flags.
 ///
 /// # Examples
@@ -68,6 +70,22 @@
 /// let negated = !read_only;
 /// assert!(negated.contains(Permission::Write));
 /// assert!(!negated.contains(Permission::Read));
+///
+/// // Convert individual flags and flag sets to their raw representation.
+/// let raw: u32 = Permission::Read.into();
+/// assert_eq!(raw, 1);
+/// let raw: u32 = read_write.into();
+///
+/// // Raw values can be validated before entering the Rust-native API.
+/// assert_eq!(Permission::try_from(1), Ok(Permission::Read));
+/// assert!(Permission::try_from(3).is_err());
+/// assert!(Permissions::try_from(3).is_ok());
+///
+/// // Raw C/UAPI fields can be updated without an intermediate conversion.
+/// let mut raw = 0u32;
+/// raw |= Permission::Read;
+/// raw |= Permission::Write;
+/// assert_eq!(raw, 3);
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
@@ -103,6 +121,13 @@ fn from(value: $flag) -> Self {
             }
         }
 
+        impl ::core::convert::From<$flag> for $ty {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                value as $ty
+            }
+        }
+
         impl ::core::convert::From<$flags> for $ty {
             #[inline]
             fn from(value: $flags) -> Self {
@@ -110,32 +135,45 @@ fn from(value: $flags) -> Self {
             }
         }
 
-        impl ::core::ops::BitOr for $flags {
-            type Output = Self;
+        impl ::core::convert::TryFrom<$ty> for $flag {
+            type Error = ::kernel::error::Error;
+
             #[inline]
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                match value {
+                    $(
+                        v if v == ($value as $ty) => Ok($flag::$name),
+                    )+
+                    _ => Err(::kernel::error::code::EINVAL),
+                }
             }
         }
 
-        impl ::core::ops::BitOrAssign for $flags {
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::Error;
+
             #[inline]
-            fn bitor_assign(&mut self, rhs: Self) {
-                *self = *self | rhs;
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                if value & !Self::all_bits() != 0 {
+                    return Err(::kernel::error::code::EINVAL);
+                }
+
+                // SAFETY: All bits set in `value` are valid flag bits.
+                Ok(unsafe { Self::from_raw(value) })
             }
         }
 
-        impl ::core::ops::BitOr<$flag> for $flags {
+        impl ::core::ops::BitOr for $flags {
             type Output = Self;
             #[inline]
-            fn bitor(self, rhs: $flag) -> Self::Output {
-                self | Self::from(rhs)
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
             }
         }
 
-        impl ::core::ops::BitOrAssign<$flag> for $flags {
+        impl ::core::ops::BitOrAssign for $flags {
             #[inline]
-            fn bitor_assign(&mut self, rhs: $flag) {
+            fn bitor_assign(&mut self, rhs: Self) {
                 *self = *self | rhs;
             }
         }
@@ -155,6 +193,21 @@ fn bitand_assign(&mut self, rhs: Self) {
             }
         }
 
+        impl ::core::ops::BitOr<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | Self::from(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | rhs;
+            }
+        }
+
         impl ::core::ops::BitAnd<$flag> for $flags {
             type Output = Self;
             #[inline]
@@ -240,6 +293,22 @@ fn not(self) -> Self::Output {
             }
         }
 
+        impl ::core::ops::BitOr<$flag> for $ty {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | (rhs as $ty)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $ty {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self |= rhs as $ty;
+            }
+        }
+
         impl $flags {
             /// Returns an empty instance where no flags are set.
             #[inline]
@@ -253,6 +322,16 @@ pub const fn all_bits() -> $ty {
                 0 $( | $value )+
             }
 
+            /// Creates a flag set from its raw representation without validation.
+            ///
+            /// # Safety
+            ///
+            /// All bits set in `value` must correspond to valid flags.
+            #[inline]
+            pub const unsafe fn from_raw(value: $ty) -> Self {
+                Self(value)
+            }
+
             /// Checks if a specific flag is set.
             #[inline]
             pub fn contains(self, flag: $flag) -> bool {

---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260912-add-from-raw-conversions-4647d890bb77

Best regards,
-- 
Filipe Xavier <felipeaggger@gmail.com>

