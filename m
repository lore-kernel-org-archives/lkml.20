Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970E3515E9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557960; cv=none; b=fRZQEktTyisfDUg62JTTDLApfK/gL3Un+gapwOkFoxwojKMNOM3GFCuknxSW7QSxlb++Luz/m9wz8/YPY6tFYLS+Ox941VJZ8lmJY1S7cNWYbK0pa+P5MDO/FveOhm9Fo9ZhkyY69/IBOMPVj4pY/MiuOZYQYLODWmxEftUINP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557960; c=relaxed/simple;
	bh=S/AOyWuaiA3NHvzmTE2CNReBuvvkbVK6T+Yewj+2g5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee4JcraIq/Dk5AxWh6obYDMnO1hIihrW0sUKzDe6jWWbCVDMpM4RtWfZiHTwSa9uSo54KVzwNV8d8bH3UJAFDgGqe4N+hYaEkzE8leNBPPCGQf8F39Qc/UGYcYWKeZC8hrii++KVwSe7gs9vH+eReo/X4GrdZUgq/ViZtB0uTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTtjlsxG; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTtjlsxG"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso13308675ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557958; x=1791162758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxuwZq03lYI2TGgQtjkc9QJfZ6xOq7ziiudQrg9Xx9o=;
        b=BTtjlsxGCmPw7zXiXE99Xv1DkCd4W4Xe+g7EByvdOLq2knzbW46bA29Yj8D2yZJZ5/
         G4GkqWB/JZNUn8h8W+66w3UxjsWvyWbBC5wPdCOQkLomqg4h9EfiUqY4IZHhw6auoWPx
         KokTNSxF2HEKQvjFUwg5BYVnkl4GK6bp3m3S8AIuAbV5BlUB0TFIHme8Szcu2I5uNL1x
         WZ+1xn34oZtzRQOGrJAKGrdr9oTQJxDJh7RayDFgdXwF3sWc5qAByp2clsWRMDjctH5K
         XJVgWBKRg8cGpYrOizEGELVvXz7U7Blswse6N11c0SQCwPjkPLFgnunb3jkBzw6a2I6F
         jpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557958; x=1791162758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxuwZq03lYI2TGgQtjkc9QJfZ6xOq7ziiudQrg9Xx9o=;
        b=o4ouxydTT3baACG7laCQfSiEAV0c1AeFxxCOBQVvEQRzrJ9Fs58G993fWFNTIRLi+j
         0ifRXjTvflwfim8mADqzdtrI4yNX/yYklbTk+E0mafSb3cf1MDtzm9+3hOi7+AZTK00j
         DVjPzY9W/Iy0Ke/kFtmOp5qV4XuIxPTbvPEURtp/fObdo1FZhGYYPhx5z6igLp8LTolF
         DSAJXgsS5HQPcAkcLkewsRceA+qiySAPQBLV7z7ZL+be7CbCYr02sSBZWkAaddwtt0C4
         US9Jjo/LnNjHaqIiWJld7xMknV/k6efrPP22aGNbEaspXHAAnhYmTdtu84h9m353b3mw
         kN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzniwM7tIbd2y3aURoZnEeIV/oz0UUHv8uu7NmS3rZRnbzZxNWfCdVIH5UIC1MddZetzejHoVNbNl0GylQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsrQYAgeCs6L1g0Yh+4QAlFof8j9DSaAytg7L02DBnW0Fk0xnp
	CniNRO6f8KM5eFGAHmCjULabV2ytNmQVPedmwH1iQIzrSNVsNs3xItKM
X-Gm-Gg: AYBFou1vLwcd+Y4ISaai4JFqxFvHwNGA353busmOy9VLjJTAo8DvgXMA7oF33D4f64J
	aTAKFPPmT4GlT96ThxVMpGDfvWPIWnVLc09tGNCAtvUYMVadQ3H+9naIDrM3ah/TsTdFZ5BbKyX
	9DYTLPCKXtZiN1vIGXNGgon4UmfanuaXWi6hHlR4IlZ2CH1Y/wo9XeN6e6xyQJtYgiEB8quV2v0
	hqMJYdbfUH8tzISICt+0QBWvoUIIFahLKIwq3o425/uLQfUz76Bo8G6NSAA8Pi6mu16MdzM3MI8
	AA/vPeR7Hx6h80TG2DYV/yIBJaJhlCWCdYHwHUDOyY3ycBxXYJxf22jeO6X80lCyu1GEa75ILWu
	jr4U6UFBd9ebaHec0m0SWDb60GN5hQYnOzBPHXpmEAt+dUen/c81g6oVM3BE/6TdGB1uPWUpayx
	uO23bLzcuVKcqK3qMXlQxLPntRdU6jOOG104Bg7oDJeGTP1uj6HVKgFxgVJVt3EHqp4mJDwUrBV
	HGMHZbTnfJnnir2OlUPXTFUjVw=
X-Received: by 2002:a17:90b:5404:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3a09875d75emr8943874a91.16.1790557958542;
        Sun, 27 Sep 2026 18:12:38 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:38 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 09/22] rust: error: impl From<FromBytesWithNulError> for Kernel Error
Date: Mon, 28 Sep 2026 11:11:10 +1000
Message-ID: <20260928011123.450800-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Implement From<FromBytesWithNulError> for the Kernel Error type as we
will use it in a future patch.

As this is now generally available we can remove it from the test case
as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/error.rs | 18 +++++++++++++++---
 rust/kernel/str.rs   |  7 -------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index e52793f77196..84e6466f54c2 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -12,9 +12,14 @@
     str::CStr,
 };
 
-use core::num::NonZeroI32;
-use core::num::TryFromIntError;
-use core::str::Utf8Error;
+use core::{
+    ffi::FromBytesWithNulError,
+    num::{
+        NonZeroI32,
+        TryFromIntError, //
+    },
+    str::Utf8Error, //
+};
 
 /// Contains the C-compatible error codes.
 #[rustfmt::skip]
@@ -358,6 +363,13 @@ fn from(e: core::convert::Infallible) -> Error {
     }
 }
 
+impl From<FromBytesWithNulError> for Error {
+    #[inline]
+    fn from(_: FromBytesWithNulError) -> Error {
+        code::EINVAL
+    }
+}
+
 /// A [`Result`] with an [`Error`] error type.
 ///
 /// To be used as the return type for functions that may fail.
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b3caa9a1c898..a556788bcc5e 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -433,13 +433,6 @@ macro_rules! c_str {
 mod tests {
     use super::*;
 
-    impl From<core::ffi::FromBytesWithNulError> for Error {
-        #[inline]
-        fn from(_: core::ffi::FromBytesWithNulError) -> Error {
-            EINVAL
-        }
-    }
-
     macro_rules! format {
         ($($f:tt)*) => ({
             CString::try_from_fmt(fmt!($($f)*))?.to_str()?
-- 
2.55.0

