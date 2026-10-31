Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442752;
	b=WNeeNw/t3fvS5pPtA4XDSnX9Epmt+mzgPfSiHJ6I8ajdMPfqqCncMOIwA909eQBTksVZ
	 dt/EfzvQ+cgQfcYHuu53v/xS5XrE+QG7gvTyFMI/uF0M81VtAEAN6A7TDYCT0HtYqmINF
	 ZGaxX5oUc9h2HQtnJIEb8ChHD1IeYKKJzwrnG3od0h8TugFVHTJ57Aca0AlP03IbM4t+O
	 a4gGUkZSgMUY2yW+yDGZfzKg/cI3387Z52+jQt0LpSSuKAabDwpyOXcyLsFkfXUPzAe07
	 R63FHmeLJ1IJVd19YbE4KgfV/9tMJaA2x2zvk4um+cWhTDRJNAzze0GPRhNbqf2RN8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
	b=Bv6vHoJLBjhIfwRTufjNfa7QqOJsPXQQKmfodZN502M8hzRg2+ehFgcLKDYStONvtwEb
	 14ltvqpyYItqFlay1cs2KNgC2/w4OgPDFK6dfdWxIVh60fMRZyyXm604ws9cEwDTho2vk
	 QNgSZrJxuQZD2pHSOjwnjcmIoakd0eqV0NYDqt+WG7N3xLZoSWvyW02ziL0sZ6mWp89Rt
	 6uLul38+BeASE2rG+0mAX2w+2Hgleb2yZ4pnGJoF/HkqEd9LbgyX/5h8TZObXfsemzMTi
	 o6uA/DqQTxLZu/yuaCZ+7Gqly3hjmVLgfaxflUAhGM6sBHccvtsfGnjYj3bSoDWSFnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG2dBK1D;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCDD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IG2dBK1D
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so5960065ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442751; x=1794047551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
        b=IG2dBK1D/gON6XrQZb6YL4yw44KeH4c93SSt801VAPx7/9qdsTBfQkL1IrxWBKO69t
         Nyf7j8xBomGvQ0LAiZ5F7hJNix1WkxBFT4xlj1cU9d/t4CJe43YrMqqpEwMFvGqWPAho
         CUWhmY3Y4zsVyG2pWNKK2FcJ5m2zN+eWMS5bAUmkFZIhm8QIFOBdfnVy4hm9meIYx0C6
         3PXF3JCnsrM24zVv9wrdrILEBBPjtNhs7raZw7HWa53ANAFLvn61w2aTwdFYqX1+BWG6
         POMgq+7RdxCTPjYp4SwAwZ/CCJcPd2vz812Kl3xcZ0pr9CkNJ6aolObgJFTcvE9WywN2
         y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442751; x=1794047551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJN7YW5/O/ypFLA5SZlEpqsSiwnIwF3r1Sqf8UEUf7U=;
        b=GfTeTDsN346utuiGCkvOI5+mc/dFVr6mQ9iR5T2xXCjbA21IXnH8HFaNjAadxkoHCq
         jOFgOnxIIT5zbJUgfcUueCrWkW5FA0wtqTz4PwPjhMCIE0AECX0Br114MpVUgw8NtLkN
         geYMAc3PJme4GVhnMs7+clC+RPVfdBmKiwA4ktSK8upntLg+WeVLr1Dm8OZwgvTj5UYG
         tUVy/24uRTtNDJKQZ1N7IYTEErq1vnCrdh/+gPFGkBusyCwi0fOkauuM8i78JTOV+ljx
         EUK4maCABTyEAmawpJkdQouFk8pbO4lDL4WGw3lp8hCA65Fsj/iVCdssIr9jCRLgI1DQ
         vXIg==
X-Forwarded-Encrypted: i=1; AKwUvBxzuDxd9hcMPQU2U7ZsHPSLAo1DKOydGx7BZLsUJ5F1vkT6ySP3haakiSJhDJHeIWjlaMjn/GnpHu22UMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1b18SNqO2/JN5+TLOOVDibyDK7liX9UFlhQ28v+kR4ZyqYmk6
	rOUVjBq3oSEyFQwcl5PSkFkIN/fybXB6K821qoFg3HtXH0T84O7yxOc=
X-Gm-Gg: AYBFou0BPNY8ybJSCZ3rVg0VMNK2PzqgUc//EqDqv3OYbYRtjYkT879vIO5k4XwG6Po
	kaJxz/HiGdZ42c40FsriCTC1HzAo+v/8p7eRZ0RoJcleLbtmUCBcC4q9XWGb4oEbxUtgzSxWBNl
	a9gLXDb6mz9uKMfZsnDxP+4L4r7XVXW7oPj7C4twOwQhPYMXRSjXEEoJhWYoRJslISjwJk+Pw8z
	nsdD6II9s62yOBbXmeO0LHRnHy5iXtIamsf3NWXsRF4LRAhy1RrCzHvCYtCT2hudw4vLqWMo5rV
	8bS9pSHKYHYKKuRd/mt3lkQpd4aD0IjbCuLxUzB3fSYUzkJHCQS3zlige5nf1aXbhs75uI/cRSy
	YNckT8hfrTMz2VUaSJqtmi0tEX1OftjxmLK9Kwf4Lws73+354HSkrP09CIGiI193aP+4pIvRgFf
	8tnP99MNxM3JyFo57g33OcFLemqscaWcJUyhO3+sQkdIDWBnFhA5TbsuavvVl6wxW9dtfYnNULl
	0DwekCAI8ffOMYpdbMPNu1RvKSLQhwLS3aBCpJjHhbjwayw5baBV74ZRqGBuDGqlA26EqKxsr+s
	7qKopW70vZODXr0xCKSue7S0GMMvSTbRBxZHDmWpqCl6G2WhWIquhXaLtaJ/ng==
X-Received: by 2002:a17:902:f686:b0:2e9:87e8:71c8 with SMTP id d9443c01a7336-2eb36395e36mr51829245ad.4.1793442751062;
        Sat, 31 Oct 2026 03:32:31 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a13:a5c6:1ff1:280f:be24:11ff:feb0:8690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm14817275ad.53.2026.10.31.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:32:29 -0700 (PDT)
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
Subject: [PATCH v5 1/3] rust: time: rename the rem_nanos() divisor
Date: Sat, 31 Oct 2026 18:32:04 +0800
Message-Id: <20261031103206.24051-2-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031103206.24051-1-chenhan0017.work@gmail.com>
References: <20261031103206.24051-1-chenhan0017.work@gmail.com>
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

The argument to rem_nanos() is the divisor, while self holds the
dividend. Rename the argument and correct the documentation. Drop the
architecture-specific implementation explanation from the public API
documentation; the argument type already states the divisor's width.

This does not change the function's type or behavior. It is a preparation
for documenting and checking the invalid divisors in the next patch.

Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
Changes since v4: none.

 rust/kernel/time.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 5ae377e70dd8..16b44e82d2ac 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -614,16 +614,13 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
         Delta::<Jiffy>::from_jiffies(jiffies)
     }
 
-    /// Return `self % dividend` where `dividend` is in nanoseconds.
-    ///
-    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-    /// limited to 32 bit dividends.
+    /// Return `self % divisor` where `divisor` is in nanoseconds.
     #[inline]
-    pub fn rem_nanos(self, dividend: i32) -> Self {
+    pub fn rem_nanos(self, divisor: i32) -> Self {
         #[cfg(CONFIG_64BIT)]
         {
             Self {
-                value: self.as_nanos() % i64::from(dividend),
+                value: self.as_nanos() % i64::from(divisor),
             }
         }
 
@@ -632,7 +629,7 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
             let mut rem = 0;
 
             // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
+            unsafe { bindings::div_s64_rem(self.as_nanos(), divisor, &mut rem) };
 
             Self {
                 value: i64::from(rem),
-- 
2.34.1

