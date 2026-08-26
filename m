Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4874052BC
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762095; cv=none; b=U6IwTjZmvdUADlxrZGSEzfTbP81rhOz0yDjggQiJ5/S6CkuoY4WEmFSDJ3XYsZkGRteXFttfIqNqL0Iqyg8x3Adnsk1mS4wApw89FXQYJxtNI8Nv99fH9xdoW17Z6vJSWevMmrRY8iHn9x4CA6Rb5ErjAJjL3OZRjTUgetn51yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762095; c=relaxed/simple;
	bh=dlpnjenRKlTOh12uFfi0ftSMSH2CF9Uel0+u8iAGFXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VW07a9uScvbiqpzE45jJOEs3597XM5rYw+qMDuqA/kjMvoK/HU9s6DKwt1FsHi72ReKJKl8VeD12eOmLYXPkkL02LIhW6PgXAiOzfejR89z/0auwJe+G33XnvXVHjViW+atvTPjVdVyzv7r/o83KxCCvevmMmeLmjw3rGP4vMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=lLpVXOPp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="lLpVXOPp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so7289015e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762087; x=1788366887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA2lE/gtA/CbYkkrJu7IaBkzRDM8/vT0VxRhU8+R4ns=;
        b=lLpVXOPpcn2rTxbl27mzf5JK1IzH4FuOUaX7gbVQ4UaR6chRvx9bBxxpqQt3bTOV/j
         uesNB863nSYzmDzMmjzEhcqQRBaglmIr6j0O6wYhHKcUuwyjX0EE+pqJALs8mV2FYWb9
         5FosvxfOevoFnhgwOMuilbBHMB/a3GAp0bo6sAIyKjvTcfZ/vbMFI5f6Naw0qAnkW5zj
         7u1qvSjf0HZBxlf+isfid2ujkAodIrk8RiBOYbA03Uavn8arHkkHoLrQkfbMsFDhg3uS
         QKhLyy6n6urlKUZLtPAZrx/FYMDl6Dskqh5RpvCFuwoUP4r6v7iWpFg4A2F/0K3JTQac
         QAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762087; x=1788366887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA2lE/gtA/CbYkkrJu7IaBkzRDM8/vT0VxRhU8+R4ns=;
        b=n3XIqSeMhUGl8XatRYNflpIKFtH+je4xRRcvbQGsMFI9qBjWoAWSH26mjZccFpz5M1
         Mu8YS7XDSXrT5vCP/Sdi+EwFj86TsTPYAl306mu8T+ngZMoTWl7/L0MF6E/c43aR6bHL
         AvPTuKcSlu/sivV/IjGYCHk0kBuYqvEe2egFXRvAzPBnqjpGeLtnOAvTAQ+EAZDfq2KG
         7WoDL2WQDJUMTj1WxH2BKAPRL8vzRWKYY38Tnn6YamjIvzjqArQj2ZfGcAVI1tZGFzX/
         sUFgSXDGwbOBTd2sC8shOcV5M3qF5Vspx/BrtQRAYTHqoO11y0XLCjO9CWyahjYwbp/x
         rzgg==
X-Forwarded-Encrypted: i=1; AHgh+RrJS8CVJo5ID1GVx9GBwYWOSKmP2HhKfnQ4LBM0UPEYC9QxgVyc+oBfXfb642WxL/uegrbyo8f+HBbJaUY=@vger.kernel.org
X-Gm-Message-State: AFuF++kPXTra7Co9Elfwnt0iPPE3zUzlI08vgzByzW3Z48ZtR5DPIx48
	bJ+49qLgrgRfwxqF0I5iKkhdjHsZfwdmk0Mhii/lxsP4BIAovzwfC9+pMYDd3J6LFg==
X-Gm-Gg: AR+sD13IOEhALZoUUGXYE3FxBpsg4d2dplnkwuVNi/BSCpmMUw4DMIKYhGDVxeVKmOc
	3UVA7rLtMEDJwwF6R1HHzh7vICg5pgDC29zVnHpU0pbBVENZrGfohfJpDGVdeV1PsmrQ6BEmkPP
	bJYorQrmvAyhDFoaq/y082K7k+aJpTj3sOsFjqEjcnL+BrbJ6J6kkWdYHXmsR/Ql9mKSmYo3UAQ
	isGL6HVuAcGgG1FWqxNai//mL1cfUKbjSSe0BPHQW+OaCtBKjZdgdP5yDCwzZgmA5NhzmIETuIu
	4Y7pr9fQj4f09eih4dFBT+aDK9J+OW+C0uVWR43Zs4BD+Hxufsjf+bd8+hInj15UeWoMJvRgGIZ
	ZEL7CSiaXC5fX5+ZUFsiTyFACn4j980IGfwwGHukMbOMfc6miKV649qmc2YSI1mdhnvMoDy225x
	YPPpDZDzHImZkjIf+2v0strnE1302giA3bUlvAlym5RJfuDg7+PLOE7wWOiKjhJilutCnCTn5HT
	hfrX1nYtDsq11MlxBS72R0jzHnEGtelETRF
X-Received: by 2002:a05:600c:190e:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499dc725b50mr73945485e9.13.1787762086859;
        Wed, 26 Aug 2026 09:34:46 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:34:45 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	Janne Grunau <j@jananu.net>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/23] rust: drm: reject cross-device GEM handle creation
Date: Wed, 26 Aug 2026 17:31:35 +0100
Message-ID: <20260826163359.4998-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust type bounds prove that a GEM object and file use the same
driver implementation, but one driver can own multiple DRM device
instances. drm_gem_handle_create() also requires the object and file
to belong to the same instance.

Expose the owning device pointer within the DRM crate and return
EINVAL for a mismatched instance.

Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/file.rs    | 7 +++++++
 rust/kernel/drm/gem/mod.rs | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 10160601ce5a..0abb7813f011 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -45,6 +45,13 @@ pub(super) fn as_raw(&self) -> *mut bindings::drm_file {
         self.0.get()
     }
 
+    /// Return the DRM device that owns this open file.
+    pub(crate) fn device_raw(&self) -> *mut bindings::drm_device {
+        // SAFETY: An open `drm_file` has a valid `minor`, whose `dev` pointer remains valid for
+        // the lifetime of the file.
+        unsafe { (*(*self.as_raw()).minor).dev }
+    }
+
     fn driver_priv(&self) -> *mut T {
         // SAFETY: By the type invariants of `Self`, `self.as_raw()` is always valid.
         unsafe { (*self.as_raw()).driver_priv }.cast()
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 60491e5521e4..334e946833fb 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -186,6 +186,13 @@ fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
         D: drm::Driver<Object = Self, File = F>,
         F: drm::file::DriverFile<Driver = D>,
     {
+        // The associated-type bounds prove a common driver type; separately reject another
+        // instance of that driver before passing the pair to the C API.
+        // SAFETY: `self.as_raw()` is a valid GEM object by the trait invariant.
+        if unsafe { (*self.as_raw()).dev } != file.device_raw() {
+            return Err(EINVAL);
+        }
+
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
