Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6683DBD43
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931969; cv=none; b=KuF7cZ3g/ET95NTKE6FMKgwr0DN48f5vXaz90HytFF7rJYvRjmHPYTABNYMhuvJLehpsROUXTkWDoPmD8gGuwQs7gC+qb/VLSD6QrBwEDJFmn+AU+NBGwN5kXmhI5YmpLS8pMckfIFO47fNxV0je2vlvnyumBCo23YSRnY89Cqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931969; c=relaxed/simple;
	bh=BM/v+17s5g23etAnLGYdKvKI+1ajgwLeZn7HVvkFme4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RIWjMOO8md88sWoZoukZt6GrkIFsRfrIU7IVN4zKJMx4AiJQidAq0SperlDHaPzXZIDzlp66Z8tKWs2HFUEEYXBeVmJ2MANmASA6Kinz6Sl0qXgv96umuLkndp03quaj/6iRffykVCGz8YYKmYgyVAQ1eGPFoZ9Ppj7Z0HKIeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoniwytG; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoniwytG"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so27929245ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789931966; x=1790536766; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bKLYZ5zYTzX26ZlJ/Ce6O9aFub3iX+B/pKfI968fj2Y=;
        b=WoniwytGsIkMTVE6vUlhCuz2L8pjkOiaS8XNaP6aGrPjMDlEXcIYWFY6MvAzHVN7he
         SIV5s3A2opXdmswwLvPMq/SgUbUaQNHz7Qya7aOj4d424QEZmqLHSyGRYUzp8q5fHHdj
         Zf9JRXyAqxo26qwt+K66oNeOloMZn2Xczreh78ktGI+a2sVrluUbaoAM4W8SxtgYYVHN
         gZRKp5q5Tu1VTn56yyxDza1k/F9s/QH6+TUEaYUD+ZGWHRimRksc48pXLcUT5O6kk048
         wp3WgpPNf2Jm0QQNsKUAw4srODKGorwR0a4YOOJvnjYjhPPrczb50uhk8dB5roN9ZR4R
         ldDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789931966; x=1790536766;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bKLYZ5zYTzX26ZlJ/Ce6O9aFub3iX+B/pKfI968fj2Y=;
        b=XgFxHgItDM+LwaFtQ4I863lR4edu+OKw7k4X0/djYyKrifnQwushg23Ysz9GpGriLL
         Z+v/4MIyUOfFzsi/65LUXQfSwUnt/TyOfAO/pi0xLO5GRVoABWFMuZpa4ck8ACZMYl9I
         dEKgiCnvZsxaYXpo6zErbUaLDFi4JVgHY2LjoB6jOmB7ZTlHrgM3NGwJ1k0cVvb9BkE/
         9HslDV36b+CDbJflSRAOdwO/frfZ1eoSL8nRpFAAcZnV1kCQKWJ16vWfwJpKT3XTyo0f
         3m3n9t8xBGWAf0iaESqlKzFKGZyQ8b7aGMgPOmcWizL+XKQ96UxD+cC1puzRjHLspL7n
         6Sig==
X-Forwarded-Encrypted: i=1; AKwUvBxB+wSTJALtu4kAwvzaonD5OkksUbhzxjvRMTkpgFUg6l53blZ/+670J5jbOi/tX0o3KGCDyrbm5NW4qng=@vger.kernel.org
X-Gm-Message-State: AFuF++lygMZIQdObN8hFJZ67MHHP48NO9fHxg+NqZ/XWcEkNkmW4UGS0
	UD2LfYNYhoJ8uM5D8SA1ZoU9KqMZwBEnDKUqU5svNW+1+QRjmZIG/XTa
X-Gm-Gg: AYBFou229mJfBOehElM2aYvdr2ndKFdsgpd1nPGXqAk/sIWn4zf2Iu1ewQPHK05kyUQ
	AE3MhdfQwqvTsMJYffEOMY+sfLvWnMRVEYQ5GJemMidqtBmAijqt6OLdWKlSXPtH85eLoutYwpU
	tBKjUC3s+THTfybG6pGB8JDsVznTQ05hZLuGiRN3pZJiQ1QbHfCO/UZyO0DAC7potc7Sbq1jcrd
	OdWHgx0zZFFNVS5NG6Txk0/SV1PGoAwdMu6ig8fsPdmhllSeZiw1iOm5mou9hetvw1dTJzoqDxB
	MoTEdxc8jyx4khvVGyStIN6Yei3e4KMoo64r4ZY4m+MCkH+/LY4RRhhONwBNyONNFZWEdHS8Xj9
	e1KgMKb1yNKWYnAz7jdG2TNGeoS8QvxqgX1NWIBhlBh5KQdE8JWcpdGfvjUP21+FMSEwJ9GulBK
	YDfcHct7ejsYo4ss9fp8sSl4ybmOH7FTjh9lG4OtTGo3iroAzrp/2BfJsp9h8zkCWueMSYicJve
	lOs
X-Received: by 2002:a17:902:ce07:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2ddb1ab3254mr141078815ad.3.1789931965693;
        Sun, 20 Sep 2026 12:19:25 -0700 (PDT)
Received: from fedora.local ([2804:d57:4e62:f400:ee3b:9f08:f174:9cdc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm14445322eec.1.2026.09.20.12.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:19:25 -0700 (PDT)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sun, 20 Sep 2026 16:18:53 -0300
Subject: [PATCH v2] rust: impl_flags: add conversions for raw flag
 representations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-add-from-raw-conversions-v2-1-cef8e6e23ae2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJwxsGoC/42NTQ7CIBBGr9LM2jGApD+uvIfpgsK0JbHFDAY1D
 XeX9gQu35e8920QiT1FuFYbMCUffVgLqFMFdjbrROhdYVBC1aKTCo1zOHJYkM0bbVgT8e5E1LV
 uXNuJYWgaKPqTafSfI33vC88+vgJ/j6ck9/WPaJIoUViii65b7ZS+TYvxj7MNC/Q55x+XryiRw
 AAAAA==
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Filipe Xavier <felipeaggger@gmail.com>
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
Changes in v2:
- New Error InvalidFlagValue for TryFrom implementations, mapping invalid flag values to EINVAL.
- Replace Tyr's local TryFrom implementation to use from the macro.
- Add raw BitOr<$flags> and BitOrAssign<$flags> support to complete operations.
- Link to v1: https://lore.kernel.org/r/20260912-add-from-raw-conversions-v1-1-0cee34684d24@gmail.com
---
 drivers/gpu/drm/tyr/vm.rs |  13 -----
 rust/kernel/error.rs      |  11 +++++
 rust/kernel/impl_flags.rs | 122 +++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 121 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index c5e307b1e2416837c85f890c074f62bc74289178..446672b4bc6bfedab789e20c97c4b754d5c019c0 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -141,19 +141,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-impl TryFrom<u32> for VmMapFlags {
-    type Error = Error;
-
-    fn try_from(value: u32) -> Result<Self, Self::Error> {
-        let valid = VmFlag::Readonly as u32 | VmFlag::Noexec as u32 | VmFlag::Uncached as u32;
-
-        if value & !valid != 0 {
-            return Err(EINVAL);
-        }
-        Ok(Self(value))
-    }
-}
-
 /// Arguments for a virtual memory map operation.
 struct VmMapArgs<'drm> {
     /// Access permissions and caching behavior for the mapping.
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index e52793f771966f20258c7d021826f7b63f8cf35e..8d2c4300262743b504d82bcc041076e78636cda5 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -201,6 +201,10 @@ macro_rules! declare_err {
 #[derive(Clone, Copy, PartialEq, Eq)]
 pub struct Error(NonZeroI32);
 
+/// Represents an invalid value for a flag type.
+#[derive(Clone, Copy, PartialEq, Eq, Debug)]
+pub struct InvalidFlagValue;
+
 impl Error {
     /// Creates an [`Error`] from a kernel error code.
     ///
@@ -323,6 +327,13 @@ fn from(_: AllocError) -> Error {
     }
 }
 
+impl From<InvalidFlagValue> for Error {
+    #[inline]
+    fn from(_: InvalidFlagValue) -> Error {
+        code::EINVAL
+    }
+}
+
 impl From<TryFromIntError> for Error {
     #[inline]
     fn from(_: TryFromIntError) -> Error {
diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index fdf44d5eea9cb907f6d8d209792a1d9b74b55be6..493cd7f51dcc5f4926e39c4e79c7d4ed7157233d 100644
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
@@ -68,6 +70,25 @@
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
+/// let read_write = Permission::Read | Permission::Write;
+/// raw |= read_write;
+/// assert_eq!(raw | read_write, 3);
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
@@ -103,6 +124,13 @@ fn from(value: $flag) -> Self {
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
@@ -110,32 +138,45 @@ fn from(value: $flags) -> Self {
             }
         }
 
-        impl ::core::ops::BitOr for $flags {
-            type Output = Self;
+        impl ::core::convert::TryFrom<$ty> for $flag {
+            type Error = ::kernel::error::InvalidFlagValue;
+
             #[inline]
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                match value {
+                    $(
+                        v if v == ($value as $ty) => Ok($flag::$name),
+                    )+
+                    _ => Err(::kernel::error::InvalidFlagValue),
+                }
             }
         }
 
-        impl ::core::ops::BitOrAssign for $flags {
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::InvalidFlagValue;
+
             #[inline]
-            fn bitor_assign(&mut self, rhs: Self) {
-                *self = *self | rhs;
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                if value & !Self::all_bits() != 0 {
+                    return Err(::kernel::error::InvalidFlagValue);
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
@@ -155,6 +196,21 @@ fn bitand_assign(&mut self, rhs: Self) {
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
@@ -240,6 +296,38 @@ fn not(self) -> Self::Output {
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
+        impl ::core::ops::BitOr<$flags> for $ty {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flags) -> Self::Output {
+                self | rhs.0
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flags> for $ty {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flags) {
+                *self |= rhs.0;
+            }
+        }
+
         impl $flags {
             /// Returns an empty instance where no flags are set.
             #[inline]
@@ -253,6 +341,16 @@ pub const fn all_bits() -> $ty {
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

