Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069B381B07
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444017; cv=none; b=Hd1VLlXw6QTN5/6fpLJ9QhWegHhflHqZsQ0rDsfbL2NNwFfK8tsq6gMHJgBAh19eb2iJRY3xUhElOLPNZPJPvAkPY6Qtrbf8AqMKyZJpE1IPSmnmKAVAifkS116UdTmGLarSjdOJzDslEHZCGXPAO2uJZnVlYvEyUeLqnjCo5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444017; c=relaxed/simple;
	bh=bG4MyftsdfdbaBykmDiiNfkzsWo9nnA1ngVnb4LMZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5tG48smf8hjmxoXQFu1fpQAQfPjRWswfIGnv+KnmVvYBrUpRM78mIHRjuF29YoxrcGKGhy+FleQlbU2WOGzQuyo4BnRkc6s1M0GnEaQkwSG1L5Bzc7jH+Ye4+WgqpzYjM8oNvyo3BukjpkSn/6Ne+Lra386+cUQNlduxk29vWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivEIc817; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivEIc817"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso1004030f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444007; x=1791048807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=ivEIc817Nrhsx8H6zckRL3AMyp6wCnxfhrQkSLJcJgRgU6q/awHL2kbs/H9giNSkOn
         aqGAH4w/Kx67BixNnZU4ahXzYlJMZqYoZPxeg+H8oUvBlqR7TUVXI0s1UDp2u5lPSTuO
         3nAEvmF4uS9+QBd8RikJZylI5a1BnuBDLbeQDIXQb/UECTjKXl0DQGRb4IUbcADjNoA1
         Rtyz3FSA19TWzoRT23diGMqKBZqsbbHStqhvA1YLvUC5oiAIucjsqh9OAelSVsRYRqhH
         XaaI2x+fRMZOUGqpbqLZLfqqB7VJzyqN8fRFqtCcLJJcvkgRmEzh9IKo12LA+D1jxk8f
         ikxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444007; x=1791048807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=M5lwNgx/BfmPYeRe2GrTlkuEulZNU/K5vl3TGTCPF84t0hVX1lG104k3SiQjmMb3nZ
         EX7Qn9WKfPp5lopb/ZXta4SbM4sRksXoj5KJ2KIBjRiKmzkKm5jAFyLSTCVgpySQ6/DD
         rL3jyyZh0Aldlv5Az2CH3d6YBVO3K70HSeD3Sg4UcsqFco8KEV6mAHDQ/yVuHKGq4AuK
         TVhIkG3wYxc2j+LEXUivvex844hfxH1kIsD4iR7TMs67ot25CuaBg15NqmWkB8QCYONu
         1nZz4vkP8VsR5ar9ys0zyPRfmVUu1ANeA8xf6qVP4DqEBEn+Fut5SNQkFSNrQzTvUdpe
         S+Dg==
X-Forwarded-Encrypted: i=1; AKwUvBy6/nTN+F3jpqIvK8FC0YPEo1GapNlzC7CJZc5edsE0ooS1jdT9EM5CxHfBSfK4PJNAK5xc/Nh27C6oL1U=@vger.kernel.org
X-Gm-Message-State: AFuF++mILv7l2bZ5J6b98Xmi/iJ1fiZyfrJN0ezRWdGoJ36ukwoJTPlD
	3s1TQONNtnnPHevxRJcw5vAsVTz8T95ABmPWNIlR7OEEb2/i0X/b/+GT
X-Gm-Gg: AYBFou0tQKlDcEoNnDE+4IMM+kOYuX1OlG2byqYgKJQ0WJMFf59H+Q7Sdln1LZ6BqSC
	E8y15y+fjSuaDjywrmZYVVWaLMoxQxZEykOMrMyJAAiLJbKNyFUGQ0U+69FMTR3S5HotwF2vA/h
	aAMJ4WLFUgaVFzlnJow8PNLUbVL6+WdL/KbND+YqI5nNsfgKhJ+hkcJfXTAPaAjlh3oS6YkYWQ6
	ZCzny5tgqZ1/2nljvZNB5HrI6S1zJ+2ogMjGDEKc4j4rd3qKQp+6i4w14DnbThl/GX9F4SZvWcO
	LaYsCiieRt6TEFsuUI4j4sIVd6sA2YmI7/OPlMKfhueNb2RGqEuI4HEv5gtJB9HRifJ8V2SUEWM
	Y6VhYuGvRL60cYB17TFpEI8dUE2ZvofCAoeFZH1gTGg8U0+tyKPoUJKESGsRmvRc6rB6f4kk2JF
	PtE1mn1alI6NOr31rnE91kZSxf7S1vvdDODOtoPeexl/lMZhyKLCLHyCEs4qQZYs7QrDnEfxs3v
	dEA7rEsrdcePpEjC1nSK0mTDxrUOYv/i0e+dm2b/Jnzn4zKq5frFz/XboyxZ1T1hBo=
X-Received: by 2002:a05:600c:1c1b:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fe66d6c9bmr166175805e9.14.1790444006652;
        Sat, 26 Sep 2026 10:33:26 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:26 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] rust: sync: lock: use DropGuard
Date: Sat, 26 Sep 2026 20:33:15 +0300
Message-ID: <20260926173315.56772-6-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
References: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the Rust locking implementation with
DropGuard.

The guard preserves the existing scope-exit cleanup behavior while using
the DropGuard API from the Rust kernel memory module.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/sync/lock.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..15f9cbe76c8d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,8 +7,9 @@
 
 use super::LockClassKey;
 use crate::{
+    mem::DropGuard,
     str::{CStr, CStrExt as _},
-    types::{NotThreadSafe, Opaque, ScopeGuard},
+    types::{NotThreadSafe, Opaque},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit, Wrapper};
@@ -242,7 +243,7 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 
-        let _relock = ScopeGuard::new(||
+        let _relock = DropGuard::new((), |_|
                 // SAFETY: The lock was just unlocked above and is being relocked now.
                 unsafe { B::relock(self.lock.state.get(), &mut self.state) });
 
-- 
2.43.0

