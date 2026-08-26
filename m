Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B7440A09
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761752; cv=none; b=jkRJujqsrLnm+4zmKx3JK6xd681LkLDMjaIYygZsqwtVh/oey7CeAloUE2TCNSdOzvBqpl96B8L4EWwf120sVaiqkSFwqLfW1eVVbdMNQaZTq6jBcXMpyFF1Kg7sI1G9evSdZ9IdY3ZYUUZyJEsbubIffsjKTqgUVsYCilsTLuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761752; c=relaxed/simple;
	bh=gAXcjVW7NrAqYcpxRGJoD+JQMGHOCFdxAf/E7+s5skE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvCj4DI18gQ9gfNE1w1lCoXHo7wg7ffktILAKMrPz/ueVZF0Sdsbz16twsd+T8KQpHkarMtaHnp1fDbuL37vAytZw44I2/vVhruSZT9gmlP821I2s/ISRHDN+bv6WH4eJ2QrhxsniOGdE8MqAsqeWfdgNz2C5APGv0EWWYNg8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ozyt+/cG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ozyt+/cG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so906908f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761748; x=1788366548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MveUnfVN08Qze7xHpn7EUTFT1HRfb1h/riwWy8sicu0=;
        b=ozyt+/cG81l5KdUVt8f10fdAMSrBSpQ3c0rXZ05fHMLGabU8tSQTFE6VKj5QlC+DEk
         hg4B3a8412qKOP5VHLHhF30cvXJmzQD7Ac6oKDWlqI0fb1FJsZLvMB6TfLdlLPJ7a5LI
         vsvhCkFthln56zCYl4xVn222+2n/7V1MA7gFql0/FYpwqZNOcdKxqjg9q1G8apHTsJxm
         HKHdiN48kTa2YTdwkotgjUHfmokhzj22wnoBEx2+JWlQiFeNayj9duNHXI1H7EXTYryL
         U9NyesOYSFgYu6A3lLSHEnF9Y1+P7CoJvBzWKOJLIDM+tzx+WtffQOe8KkDN1XL5fH/O
         TB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761748; x=1788366548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MveUnfVN08Qze7xHpn7EUTFT1HRfb1h/riwWy8sicu0=;
        b=XviWNTAmpr5BCZRaJRRYGYi+dFUnFEgD0dhPLUUO1gU88Nn7SH9qOsKLMGMQOKaNHy
         GbPjh+8hoYOHC1KlGzJZbHPTKNuTRDu1nLQI7JsjdO1XICM96jIW91ymwgpCtn47HQxL
         rOWf+VHo9NqLfYWF08sjj8B6MQhzhC1rNFcft67gRdr/2qu7YgINcdbwI4HleAu3uIld
         E3R4geihMWJRtWwBySM1RjwsQKdhiX3PIQBKCwpEBmW7p8lqtelZg8+qwRadWH9PKp+N
         5jXXvFnSHawD96EVtColK24vtin334EsFHCyBBsArVQHYFhwPoisemE9NEdH6hJWGlFR
         v3Ag==
X-Forwarded-Encrypted: i=1; AHgh+RpWK7F/o7UJv/8W0R9rKU0QDgJFwjoJg6MDLEZXsizwRTXLZ6XVBchoB583MpxhwJqhyo1eXPw+//boFkE=@vger.kernel.org
X-Gm-Message-State: AFuF++msfKx1njuq8O21V0daCdW+7SbT2zk++k7suyfMT1rRl7YEWOhl
	kR7sG8tjy74sMbQo9DxuHlRCMk4MtUMj2jzAQz6FpMhmigk34luJfc/6ahkKJCBXIw==
X-Gm-Gg: AR+sD13DbB3voLEM1dxMpIpiVkk1AD7IopVn0D+MaQyB+yKcPEFpRCuuZGGffArMadD
	lu50xL7yvt2711K3Kuf3YSAvrONqYQMuq02HbkGgrnLzxiky098dTJr7B84JLkT7oRiR4iEXgBp
	QI/Z670BaerTpUXpDaBY7VESoHExu9NRDr+MsmMChT5Nn0SN0/GXCKXCgST3+hJgNNm7rJeIG+j
	0VAMoqoUsq24JVPYQVsAZOAI1pfOELTgs9erodiUIya4ycoT8ZQeQg79hpaitx84hhuhQzwt9CG
	9cDcuatHQhsEFSh02OhO9c1ESif+6XT6K4/jGxHnbvkWkhRf7BQBLfZo4ibwfbbK1jPAfBIf32h
	Xa2XvD90XRtHVk4NTPoeWIbdtj1qG/mZNN+yNwkfPMErRTqkZbmdzYH437WB7lcrt3g1UmKvjp+
	afPHLBO5q2rnhzp0tu7GyKh9eh1ScgmeakY73/SxSlYQGbpRzXBvknOgWQGkHJqhbcf/6p0SHV9
	USBwaS6onQf2KoTPXBKyrR0OaHjVnF7x5N2
X-Received: by 2002:a05:6000:4541:b0:47f:e770:13e0 with SMTP id ffacd0b85a97d-482e26a6a63mr6662154f8f.7.1787761747741;
        Wed, 26 Aug 2026 09:29:07 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] rust: random: add a safe get_random_bytes wrapper
Date: Wed, 26 Aug 2026 17:28:37 +0100
Message-ID: <20260826162851.2497-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose a slice-based wrapper around get_random_bytes() so Rust callers
can fill key, nonce, and other random buffers without touching raw
pointers.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/lib.rs    |  1 +
 rust/kernel/random.rs | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 rust/kernel/random.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 08e5730753eb..f39648246271 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -116,6 +116,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod random;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/random.rs b/rust/kernel/random.rs
new file mode 100644
index 000000000000..5f2288969dbf
--- /dev/null
+++ b/rust/kernel/random.rs
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Random number generation.
+//!
+//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
+
+use crate::bindings;
+
+/// Fills `buf` with cryptographically secure random bytes from the kernel's CSPRNG.
+///
+/// This is the in-kernel equivalent of reading from `/dev/urandom`, and is suitable for generating
+/// keys, nonces and other secrets. It never blocks: once the CSPRNG has been seeded during boot it
+/// stays seeded, and callers running that early should use
+/// [`wait_for_random_bytes()`] instead of assuming otherwise.
+///
+/// [`wait_for_random_bytes()`]: srctree/include/linux/random.h
+///
+/// # Examples
+///
+/// ```
+/// use kernel::random;
+///
+/// let mut key = [0u8; 16];
+/// random::fill_bytes(&mut key);
+///
+/// // A zero-length request is valid and does nothing.
+/// random::fill_bytes(&mut []);
+/// ```
+#[inline]
+pub fn fill_bytes(buf: &mut [u8]) {
+    // SAFETY: `buf` is a valid slice, so its pointer is valid for writes of `buf.len()` bytes, and
+    // `get_random_bytes()` writes exactly that many.
+    unsafe { bindings::get_random_bytes(buf.as_mut_ptr().cast(), buf.len()) };
+}
