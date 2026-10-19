Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423421;
	b=dC6Yj7KOKyqaAMZJW2SPj9RxjPFZbp3Y5NNa6fdgWZxjmu3f/l0B1sQm87eyIIJU/jA0
	 o3dhXcHcqO7MxpiYsT6A1vOj/9kWV0WC8lfln8gu3MIx2n5WP5IDDup/iSaJ00cV3ZlHf
	 eZZlxCT+F1fSpwAl2cfqzHETBzdcZo9+QvttUesUCzfpxibiYXv8xz/ios1V12tSDVGuH
	 PlYQn6UlMeo4/IamzyhsdDqBC63bMJvDovKRauADCB7iMGosVnomU5+LOS/Yz3dfrqghX
	 E5NhRb50zUN9zcKzuqjEQm6FN/edK6WTBcIIgxqxk/rWwXJOm+A9llcq39tMtRq03tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
	b=NDCTG8/joWeLbpfjLBhgEmRcTHz/qnoSEAtXE111NRT4xjPtzNG91U6Eco14XOMnnJbf
	 ot3ZBMBorssUtmBllyhB3aMLUw4RS+iHAKxtHruU5hh2ewApcJWa6zmfxOFhfFTNwCSD5
	 MZQQJlziVjAbbP5kkM0BAokc4m1l/j146XH3dCvckDKTlLeLggi1g+UgXNOHMmy6LjkBR
	 Wh5pJz4wiwCf7ARVwRwK+dm/W3J9gvp59c4ZWCK2n2/850A1PIw2UP599vufW/gXvygNz
	 /hiFsROOOYYRQ8PrqMWI3dCi3SyhOOdJj0I1kuytAFloSlvsGjDEPfe3fqiQF3uBtsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amID5UL4;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE060ACCEB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECE060ACCEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=amID5UL4
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so440320241.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423420; x=1793028220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=amID5UL4oXgN2w3QpNshWz8S3hujZxJ9MR4VBu06GHjgko5FygdPkAxZwfXKgMCwry
         YuVILTkEunVHZWkCmzaRtv3M5bxJOVERp674cByKUZUjQev9Esvej04i0K1nE1BugUPr
         6qsfWeztU62IUCEUcL03iAJdtK7I33wfsCljb/0uP4CmorynANmX4lapU3I5ta2vUPjU
         G9DVnlIyhbMjhqo9kiIzUr34HINGxpkKHa5Sat/rlADIkx9bWeDlzft+MrnKNEZaitVK
         Sg5x916X45FNuCxnpG7KBxtwzWrT5bN9NWpXH+tVT8pMgVz0n+BZ9Vj3C3H8FXUuQzDj
         s5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423420; x=1793028220;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TB5WC1uvayakjtGRBbN56iOi71cVu/uajHIAhyzork8=;
        b=ihuRi0S40Fhsq4n3FN0DfboTcilKjlJgOwJgAe3NK9efw16T7Wr1HSwCRwjHduhYzH
         3LigOw49zR8ShohgtST6nFYHgcXmqzaQv3s2atNGGuqpb+Rv9BYQRgV0QgU5YqI5B4ZV
         NgpCs/y61q1rE8+4pSgVk7xLAXO/Hhr0aAMXDA999p8xD9uSbT/ybe9iGhDaRWrmJiE9
         M3NBhq4/a9nOWXbnNq5uNqVc/PpwOLqXahof1I+7DGQqNJ5jp5xqCnYoQUwdXuyFRcJQ
         wFf2YD2fjvPJFejeEPI+P3i5V1UPRipereC9LHJ73QOXLzU37mziPp/uOvm0jBBh/ycl
         ZBiw==
X-Forwarded-Encrypted: i=1; AKwUvBye9y0eArWaGOYR3xdtVzTJdTxHkXGRhYA1v9cE9+0QjnYy+dGF529LwJY0JFUGuokUa56VPnPW1FuxXWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIb9T7oKEWnuDb+pVPngtvr6Zhh1Pw6HTtksMf5YLSP+jhjT2Q
	sqXD5uz8id9EsN7WPqvqJPkgWjPPwfdVoxlVU+T3Gn4rQa4SmBA9kyY=
X-Gm-Gg: AYBFou3Egah140s3C3j5/6HHEnccCV7PQXgQMR2QVswtK7xrkE5PPx80Sd6hDdVnBog
	XV/pL7B4IHdkqdPglpH5CpjbdoKBq6FDml/jgWIDr3vTDg4iHvtT8tK4nrmlANLNslpHK4XNdg0
	+W8p2eGBGA/JlvxafAeBJUBMlR8bsDlS/Hmq+bkjKIrdaWsMQXp96+n+F8E2i0hYJK+FCCS+vXR
	+p4m5Ye+fdQpAN2dwkZ8/QfSC01fh+4OHWaAvj9n/2uRJVPgcfasazRXeI3Y25OCJQrnVh/d2EB
	T0gsWhY35kI0dRg1nrtDkWao5HrmqLwezQYdo7RfmJmBmgpjhPaILxx3AYQ1F6LFzveGPvD+EqQ
	UTrqsJ7ZiE+wEQnRHFXcEKmgZPbxZE7NKyHFXU5snmqxikTPlv0fVfFwOi13QwaAerhebpDzdCr
	xfmKRA27evOiFVEWqw27pbwLxy6CJIDNGyviFu3nqKUaCJt5wVyICVYY07pMpiqKnFrw5u/8q+j
	Vdn7OAckd7PnO+tmWCahN7mP9vKkGJhfSNV2CpZlqPh890jJg==
X-Received: by 2002:a05:6102:5127:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7cc36aed490mr1758525137.31.1792423419903;
        Mon, 19 Oct 2026 08:23:39 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc77198ec5sm453357137.4.2026.10.19.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:23:38 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Mon, 19 Oct 2026 12:23:15 -0300
Message-ID: <20261019152329.620610-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&I2cClient<Ctx>` since it has had no users since its introduction.

Fixes: 57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the `I2cClient` struct using rust analyzer,
activated the modules that were using `I2cClient`, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` automatic implementation).

I also checked for usages in all major versions in most recent versions
until the introduction of the trait implementation (from 7.3-rc7 to
6.19), rust-next and linux-next to find the last usage and mark the
commit in the `Fixes:` tag.

 rust/kernel/i2c.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..b4ff25c830fc 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -5,7 +5,6 @@
 // I2C Driver abstractions.
 use crate::{
     acpi,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -517,26 +516,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cClient<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the type of `dev` equals to
-        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
-        // `struct i2c_client` as guaranteed by the corresponding C code.
-        let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
-
-        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
-        Ok(unsafe { &*idev.cast() })
-    }
-}
-
 // SAFETY: A `I2cClient` is always reference-counted and can be released from any thread.
 unsafe impl Send for I2cClient {}

--
2.47.3

