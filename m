Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE015349CFD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235524; cv=none; b=lWQz2WA9ih4en04tUP0YIL6PriGOiRHklscaznflAlVTibvihlfS9E31ePVrgDPp7i256rgQuKxb6vGkUWulBCW0yoiKUSi6mbcPCJpfNSm/eCVA+FqU3CxBOERbatGvfuajAdV8BVwF2Quh+iGyJ7R1psNNWLoGc2Mzmmz28d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235524; c=relaxed/simple;
	bh=uh9SS2WMqmUt4cpgp+wv9TrfsT1TAr44dlN+wtjyrDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1xkk9fPjmbbnUVv1ymTU25VNZEZMCyUFE0qaLq5rEqE1DnC/dOD/GcFqdJk5//PnHS5t/1nHDrxr9MWCmgfmFRKYDezIlBwXMVNfkD2mE8RiangLQHeUPJhY/U7Jsft8T1UAtEOs526+uRzDOdO0hypVbaJ7j52or/qwWijq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqKXqkfM; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqKXqkfM"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so507112a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235523; x=1792840323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkH44/WMax9Nf0vxizpHzIgEQxchbF7m2t+NOJIeX+U=;
        b=RqKXqkfMYuK9PqL/ckYuiIt9u/yhe2Ba/XfDmm6534ciUbcVjOsBjdOFDl7zV1Um+b
         rU4TpVAetDUl+IMJksQleLN008FVLZZ/GwRpAWaTitFfRPrkuZtoVZ0fObEECmbSgRGh
         VZvNEAOVzNYzN7qrIl19F2AJgyS+ihWX7cvwgk/Iwwp61ADyZDBEswwfDDvVoBXJiHLK
         +GRVI+GJ277QxRcNe36y9qK7drJF8O2NvkHplFwQ5+gRL3CaPa/G+mGTq4BwEvqtOBPN
         Ol3eGNUO/KSNnVzsIG4QHXODKxCzFfaYM4s61vcvjvHI7xSdIkcNhKVd3+9OObjhEpjr
         YiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235523; x=1792840323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkH44/WMax9Nf0vxizpHzIgEQxchbF7m2t+NOJIeX+U=;
        b=md+DDOGBQlXShoURDPI+Ou2vw2JqRE+sQ2BD9ZOkPAbojoQLKpRXPn59txtyCeDnEY
         hHs7SH1t4S7hTy8Wzrb/PR0OEHV0gcBmgG6LXPgKt13k2Fvdh4/kQkmiD0cG8IA3s7Aw
         O+jaITlCMJBQbTuFiplPv7HtgiV8RsDR6bqd331fXYjCvJp0kBEBu1vpmBZmzDoLLrjN
         JKcMdqAf3DTqDPUZs+vJ6JbEOpBb8ldLslwATLe3h1kAq+hgKC0B5hVdSRxjk4i69Fea
         ilkvNPmb+Thej+T84TwrAuzA+EFbcwh07HLt5j/4/TkbsQxJAVFdVDlzX1u6Nd9Q16n8
         R2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKT90oUC6jxz26dW4EoH+mDOA/u7yr8w3pXdLckp5ShhmucYylJRV0b/9xCrKr0R6wBbrTg3B2OD/n0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTS+FwqO/JOKTlE3RYqBJRWn/sK30JAaatY5t5wb/3J7icQ3dT
	jcDdbKvF3WB54BfdG1olc8w9EZubgK+0Uzx/xIh+dIwmuJfjsS8gNZU=
X-Gm-Gg: AYBFou2TWA9OfCO8a5SkWiWM/RQXOw0jgYnZT9H4J7k17dwlbBc58nN5geRw7z7Z2fM
	P2jI/jiKIeUNUa7jONmiUK5mzVO5MbcQP1NJ+0+mDI97p/3iKBzu4DIZlieu2MMraEHH88ZI57n
	eyuOhS1+2PfEULg+Ux+FwqI1Lsaa3m178wVfxjbgYcxOc8NWhZ+VP93lfswrJE/PbTKZ51sRy9o
	SE/38T0wYXLFENJRu5Q/EhCYE7wnRFzz0261M+h3bbsXjoVedsi9EuYQDfKc1RxiOG5/pw6WqfD
	beLLvey5X6qgaPQJV5rsWAju7yuLXSc5ILGFFX+1mRsuNXDR879pyRaaXpEt8s74Y/zX8KiR12h
	mkMXKsigaIOUivtp8Fpd+uxrR29/gUUM4bvtujgRRlcjbApX3xOwEWgLPbAwMwRbYnRye2Fsc2K
	m0YkE041tSU4ZQor6VU3iHQdnszA+cMtYNS/ElTPJVEuLVw0sS3Uwk4pWfaefV80u78gJC48E7X
	o0qz6Oj5dEEPIfnb/I0O1hqTFs+
X-Received: by 2002:a17:90b:1f91:b0:3ac:38dc:6b9e with SMTP id 98e67ed59e1d1-3acef13e57fmr1849616a91.25.1792235523056;
        Sat, 17 Oct 2026 04:12:03 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a0c:9a40:9205:1:be24:11ff:fe93:ff0e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm2974687a91.4.2026.10.17.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:12:01 -0700 (PDT)
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
Subject: [PATCH v3 1/3] rust: time: rename the rem_nanos() divisor
Date: Sat, 17 Oct 2026 19:11:32 +0800
Message-Id: <20261017111134.22546-2-chenhan0017.work@gmail.com>
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

The argument to rem_nanos() is the divisor, while self holds the
dividend. Rename the argument and correct the documentation. Drop the
architecture-specific implementation explanation from the public API
documentation; the argument type already states the divisor's width.

This does not change the function's type or behavior. It is a preparation
for documenting and checking the invalid divisors in the next patch.

Cc: stable@vger.kernel.org # prerequisite for the Delta division/remainder fix
Assisted-by: LLM
Signed-off-by: chenhan <chenhan0017.work@gmail.com>
---
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

