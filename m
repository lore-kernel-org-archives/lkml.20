Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624323;
	b=z2+rjT6XgmUg8p8PaxulZ/PKnsXbuhhmztGZk/JhuBenGSyny0HMRCyujjxehAI/PbgK
	 D5iIsvfnUCZLx2I99MbnbNn5OyTLT4+YkD2pbDxNYNgweQI4ix/Gzm2bPYYKFUJ+HTQX1
	 1/bmHbqILuGg1hlCD2zfpY5V0p4z78Nd06xNJzBm0OwjpGlVqrtmjm5qLVyjl3hIi0CY6
	 GwR819ihq8oV0Xrz2ExldMXfKCt5Bl4g9tlRhGtUhCNTYqKWtBnDHZB9OrqaI4GUW7kal
	 tPxIn94r7kdJG7ybX75u4XdrHb293rHLCud6V5PTE7VHN4XgG5aeb2JG78Y/ZO+VcBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
	b=N4TMt/BLxHYLtzWjCam/9N/Ejj+oW+TSEm1kug1x1N1kZyWC6mz6wsH8Tc+engqz6Fu8
	 qfWjZzVueOQgXDbLQH8jDaFG6FoSjZUETfqW9ZwE83KE09Xzf3i13GXFK6/UeAAE3kbUx
	 S0J1Q8Iyh+VA6xTuYeUKLEbnsNlM2vZAob/n97d8E8WkaBjsxv8GtBvSeWe7kVZdyLCDw
	 S5JsM2YdrpWvBrSDUWevZsd2ZaaCcMjg/ja0+0fs4ty/TpFgxPP+vUjyy6FAfhtrftDBS
	 1ZxlEaxzlAQy2E8bFu2I/J+qnhIY+o6hZULt8EnhbtDgr9yUFsK4LvFo6lWexxbR+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPwQl0P4;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C971E606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C971E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPwQl0P4
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso12123835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794624321; x=1795229121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
        b=gPwQl0P4iPKFNkXXe9HUrsnBEx7x40xFM51ar4QB4iFjpTfG5DVZDXByaVcWSCxZUr
         YaxWnMjxP1mOdIZ1vYrZ6QZQmXOQtGljigPQTM5d1Yl2k7T2Ytu3spr7tCb9Gl8FO3UC
         wJnjq3WCBSjIu3OxUsUs0+gzOuys91c7nV6+vyM2ygwWKeX0CCLepCUyD7NsG8e/c2HM
         U/W7yIqmIav/+HpO9cFl5/79NqJ6P32a/vGekM9M2UGaYZS17AnJtr7hmmqi9NHl+wg4
         85S4yVZ+3EGMAy+/5R8jvYMap3YAyK135atQRnyXfsK2H9WhLJAXdLB6XE3/PmpBaAVb
         lqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624321; x=1795229121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
        b=OPRWeryB/URdWuFQLp+4eAK/vxDmaQLjepuXc9Wfek7ci0wcNzksP42MALaz5eUwW2
         yVdA0RFbU3KC2AJQTNFIewxNED5TDimVGy5oKVauxTuYFL0Ta50WUXWCp7QZGNNJfCmS
         1t0ULrbpF3MXdmrwArbwzQSa0cMj+uCeHXzO6pim9j1IsuCAPqU3j3e1C3nsQrSnb/r2
         NZUpVBviwMyXdTG0hG4QX3qMJPmwqKgPcOaGObetKYi+AVe4RZ/RZHwDyzgXnwSvUnuZ
         dB90oVU5rcH7U9xKTI3YixKhkm+ucbqjhHM9GwzyxcQUalm3oTS5i7C0sN/YzzY3+8qQ
         XvQQ==
X-Forwarded-Encrypted: i=1; AL+hErEWgovh1nrNRzLe2/B4Zy3vrCwe3SUmmTqwKXxifesC/PO3HUBSBhAIO93Cm5SVv8qAAQ1Y5wUn+iOTIRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YkUlnhg/IYyS67GIddCPa5NhgK+2um9/tLsF+kDR1xUxmIQmF
	2Wxeu6fOsitLadEisPI6XVOjudAaoAgHkdiox5rNi+MNV4k3Ap8xDHuF
X-Gm-Gg: AYBFou2mUOznux9c9hlPSLpHNWFXjf4b7hyBXABBNzsQ3fbySTHwAtMoEaVu7B+/p7G
	kdBQZpOK7J/DF2UQEziB3BJ+ZePOudyj+wHTIP+V2a7+06wonAKeQvoeVaUVzEDbFQTOqp+4AmA
	PrmhUnX6VpFrHbul2hKFTghsitmQ2jnbHMjudPMHSFIyBHLi+Ci3JIlTIxFFNaPflHjwwUID1mV
	DtTYIthdu6HqW0gV0JzABlSmG2tkhcJE/RBX7g0I1pQvnu5gFbUF5fnVAj/S3gL6YmreonPgKwQ
	U1owMhR0AoyvTmO06Ay1KpsH+1Kmc+Lvk2m/4iXICcoO2KzXqZSNM0BuMQhinFM4rmo9fir2uXR
	N8b/ulu8Qqmt5lWi390nPF3hyegh+/Z2SvjgWju+9qjjQLTF+ucF/OIRb2dBrz3b+wx7u24wgEw
	+dZe4+4AqkyLiir+onFU+qEf6Dp+29gWk8ZnrZJjjdBnODpRcllLQvW1h5Wv4GGYLBHkMvRsZpJ
	UINfrlp0UVoLr2y3a+hkg+4Yc8KEEjjcXW7uGV0C/vEkUTdxttb3K3FpPjgfjNcheyOAGq2D4lF
	ZUnjJCydL+LWi26ZfCIpxF4h6TOjZozViCEceI2NBRJrnjPQYpyh002QDUzc0bfC6yYJDJC8FsO
	fn2z4k1iGGy8LhotPiBCGz4dnZpK7JPojWdqnC73NRR7kPvs5bD3BhNzFe7wOnwiC0PcFfiKvKL
	EqXHXS0r+CBFGUY9DbO8ibsZL97agUOhPQTic0Ewpssym/T1FG/vLyWfPgVMBU1CFB0n8Ktr61J
	OAs
X-Received: by 2002:a05:600c:512:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb55a5d7bamr69903025e9.6.1794624320958;
        Fri, 13 Nov 2026 18:45:20 -0800 (PST)
Received: from martell.martell0x1 ([41.239.125.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm8198455f8f.12.2026.11.13.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:45:20 -0800 (PST)
From: Marwan Mohamed Zein <marawanzein222@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamir@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	martell0x1 <marawanzein222@gmail.com>,
	spidermana <xuyiwen14@gmail.com>
Subject: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
Date: Sat, 14 Nov 2026 04:45:15 +0200
Message-ID: <20261114024515.1000882-1-marawanzein222@gmail.com>
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
Content-Transfer-Encoding: 8bit

From: martell0x1 <marawanzein222@gmail.com>

The returned slice is derived from `out`, but lifetime elision
ties it to `self` because this is a method. Explicitly bind the
return lifetime to `out` so the returned slice cannot outlive
its backing buffer.

Reported-by: spidermana <xuyiwen14@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1265
Signed-off-by: martell0x1 <marawanzein222@gmail.com>
---
 rust/kernel/iov.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index 43bae8923..8caf04518 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -161,7 +161,7 @@ pub fn copy_from_iter_vec<A: Allocator>(
     ///
     /// This will never write uninitialized bytes to the provided buffer.
     #[inline]
-    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
+    pub fn copy_from_iter_raw<'a>(&mut self, out: &'a mut [MaybeUninit<u8>]) -> &'a mut [u8] {
         let capacity = out.len();
         let out = out.as_mut_ptr().cast::<u8>();
 

base-commit: ee83899302a0457a3ba47464a13e8682bd7ba27d
-- 
2.47.3

