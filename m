Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426455;
	b=pQ2U4TKIbUO+LKFUu9AfK8Om/WC1CrO8e04KHIZG2yqTW1CpSncoLkVCzE6TznZolUph
	 qtqBysbiL8V8UuYuvYHglSVKVKCa4MdWQ7/rz31wphZ2NROWKPUBqjxZcQrLfw/05mTn7
	 QXq45ZDE6gtfCXzlw+A+NSh2hNxCwAGDPq2X8gVGyN6ChuI8AL9iV3dL1DhvVg3g8oljp
	 q6AeBigICxE7+BWxg6kl4bZbm55suTiJR4wANVY1M69No0JOTMhYLumdOTTOzli1wuw6h
	 QwTMENUdPzdIjIVmrnknp8M4jt/iYFAB05WTvoOsH2UVllD25WN7QvnzFb74oP6o7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
	b=1RC/AlfNEQKlhqhWrmzbF9+PhYf7YTaLQ4FUjcMyGl4AWBnkL6yzBXc9vbkycVE9PevQ
	 qXYsddaW8Yvk25jY7ufF0N33qyOYSGCdhyArA8F9zwCZ/0oGiqVOR13OpDR7RpVmTGhiI
	 ig8iXGBvIWt+EQTdSVsfhgZcBQrq1Fyd4HR3ksT0C7z2P/whxj8qnpvVadea1Y5h2ZrzG
	 Mz/n3Z7rJd/YnBhzj67kJoQAcHof4oa7QuHqfcpyWTlv1dSf31HwWUeuaCFjVa5MnhwPY
	 hz0TXLVmLFrJYnxTQ0nzOhW5j5P8XAsQB1aVy+gzck9iGCxVuYzd3zGY5ghtfK65WdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TAq7zZJ9;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB5606AAFF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BB5606AAFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TAq7zZJ9
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso250501241.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426454; x=1793031254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=TAq7zZJ9gPJlhVCynuRETKr89Jk5qC7BTe9Oy7drLE18eRWb9LXMolkUeTOAdwmswc
         uErrwmqxxrLXUyAGuilAOmIkQYmmBh7B9YGo2k+8Zz8yzGBIgOPQmiLAwmoPKoaBIwEA
         RzXtDC2YAx1bKFQ3NTskNn1m03Z6p2so8srCyNUBkSFTl0CUGaxhuYLMLRZ3yReoVH+7
         FOHp53NR2WCeM1iOc/80H9KxWLu/bgY/k+XNRYzr/7xsOC6fgXxS+aQSaJiUq09SJoQo
         t5mbfC8zSnPBiaPbgniFi3zD5QSCRNUVtYFXfqA5pMe2pNUjlmrieKjEbPwoKH0bpFyj
         9GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426454; x=1793031254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeESGS5MMsFAlGW0P+2tNMhoNZouoPlkfPyiKA/uXkA=;
        b=UuCMDmjwrk5nRw3cxNUhlUbCdu9Mczigs6KrPRZi6pNYBfzlNuieypXvOMUqTQOhBD
         BWTLvH59XcqEiXb1iPPyOA89eKjtJHQa5imW4kf9nnjjvZMYUE27r+XFSyeVpl3TvqYP
         jkEe0bKdOcm8mn4rJAlnZSoDkMmhtVPrSNNJ/bzHOKPMtsJyqgBqB7GWbuauuajeo7oq
         wgYfS+vvv3lf0eVXQRwgoN4DXWy1AhxqWLV9zyJUEu4k5ufKDdOHKSXSi+4C8gHV735o
         CT1Utt6hnkmUQ41TkIRzhsjdg2iKbf9C+0GLSc89jbMsC/4tVv1zZCNpqS6pWM7jvK4k
         0gxg==
X-Forwarded-Encrypted: i=1; AKwUvBxrSGk1fXTYVOAtMdTvWzv1z4E4yBTL5PdIEVvIVxX7rYDSZhDnRsyKDllA1+93C+Nxfjz+EcKNBqgTp+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBXW9qK+OoV41SJIophJw+i1q6RFQAX4My1zhwkxw9TywAiZ7N
	B0YxAI55J8LtuvYifaDjIZhbzAGCzaWrn5LVyRXnsCZcFC0EFZqMxE4=
X-Gm-Gg: AYBFou2gpFwwAV2FaiV+9w3liiORZdak4stNoP4KfVJ6V9qjCAgjR1YgDUhkiq6UoyZ
	hEC3ongsRYwy+ZmeW1Whont+CaaUOHHxCk9dsibgMe2+2YI44dUdTjDeV/cdAj+6nMyY/JtXZRX
	YYt2qaA/458y+zxkWuhn98TF7bMYssqqrSGe4yrIY981rnZsfhM+niRLMwFxiO2LOPV9yeobrFh
	SvX4c8jy3Ove5eIA5N0LnU+3LTTMFXCoeYJc9ONtyagNGo8qfIou1LFonj+3eooI38FcVXHcFg9
	9hgCSgwmahcjnGr9gV7kqrlISfC1s6Q3Kq6VaEW/VUf8lyF/jaUUNYTUx1YaTe9lrhexBlYmjOY
	GwQVgP7qjS+cHXR7DDi6/yJK50PUwWcoHCzNJ9QERdp03ijveAHyQaWzbmf1fTknsBV6Ofd5FAq
	kFt4M3b84lMupq6PprrxuOrtbsKyXzmXDe9gsjrjcw01t1aqiiw5yaHOPMmGDdr1iUjG1WGIzsm
	t8uhCIyW5FcBlcK/on6OhdiWhl/CiT1AT7SPzRC9NaTSVJ5EQ==
X-Received: by 2002:a05:6102:f08:b0:7c3:8ae6:d7ae with SMTP id ada2fe7eead31-7cc367321e3mr1998561137.1.1792426453769;
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:13 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
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
Subject: [PATCH 2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
Date: Mon, 19 Oct 2026 13:13:38 -0300
Message-ID: <9a53f75cf2d607bbcbcf54777e75caf99dcf6318.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792417858.git.nico.antinori.7@gmail.com>
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
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
`&Device<Ctx>` since it has had no users since its introduction.

Fixes: a38dfd60fe53 ("rust: platform: impl TryFrom<&Device> for &platform::Device")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/platform.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..f49aedcc94b1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,7 +7,6 @@
 use crate::{
     acpi,
     bindings,
-    container_of,
     device::{
         self,
         Bound, //
@@ -557,26 +556,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_platform(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals
-        // `bindings::platform_bus_type`, hence `dev` must be embedded in a valid
-        // `struct platform_device` as guaranteed by the corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::platform_device, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct platform_device`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

