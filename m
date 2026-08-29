Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCD3CB2D7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019833; cv=none; b=ZZF0GM2LSVdfI2SaE8pVewSBCSGsjnpw+LzTmTFSJAJKy2bzI7KORSyGVwCup+tpgo1DAUrWSULJL2rrTbrzH2UQENUYGfCM9jjVfqRaIXUp4phQcnTttK0zbEht46m/+m8Z6FvfjHcI0URpBDIiMqCxuYNdOtQy39q7kus2Ldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019833; c=relaxed/simple;
	bh=tz0jWWQTpodY19HeFvg6WNoeFkXiXO6opCc4a24Hdz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGWU1spI5q2wDS2+xRyAliNQntthO5EgXNta68pdxjzJH2bu76WW3GEqo8E4J9g2wKblxsI1ouWYDnBEJDbV+qRojIM72eVWiuI5I6gDynU75ss2uJD8yad3Y/lioRrGhCcZmCvslAFK2dqeJvAnVoIJZs+8Z78oPHV9UcV4JyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFBvJ++J; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFBvJ++J"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48436668d20so37928f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788019830; x=1788624630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgJ9jtAoeYlks4PDRyS9bvaYSTRudzDH89X7ZOwziXY=;
        b=mFBvJ++JJwu1tx/dcGd2i8HJ9jTIGzCwcd+Si2UTfe7azta4QhcqV6wO4CjdV/XjH4
         TcznmIdYWhuv7jYd+uc7jEgQO6Y68SxkN84DCatWS+T77zfHkx4k5MBY+yRP1rWY+roF
         u+OqkgJYnyXXrcwvpcfHClKxZa2DZvtYzSqptLs3lmipsbKop4ngmt2H8SvoajO9BR7X
         McH7gB6HcUdjXrMtCa/Vdn4kZhA91gRHVRoUZyJOt/9CraacYR03k6lu7NPYwi3mdCzZ
         JIgWP+54PCli/5ER6gmzLqk7PU9rPqkeM0Fqqhn77i77CklOe8bpngfwEiCKxyO+rfIR
         YeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019830; x=1788624630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgJ9jtAoeYlks4PDRyS9bvaYSTRudzDH89X7ZOwziXY=;
        b=bqkZxkNAcP/3lEFNUpgBSwy6wU7MKgLHBfV9YfFzN2DOCRCNQ1NI0CSP7kkG/jNAzi
         uuNCIdjH8uThwsfzDMP5D05E6iSAKUglGfWUMZwgtreii4Ho3T5lpo0HAb9s2quTGbei
         I9rV8Ax4XbMlEsQwRRgoqSNeVrNMLR8m+3cu310UgIV+UNQDyVDvLs3Fh2pKJ5t8gPQ3
         0ciX2rg13sH0GkwJEeAnkXX3eHwOc+zwXGDG38999OYZIG3QiqyfgpPYlApukYJXGqFF
         WpEThyaCjr4kgbijqWoZXAN5UH8JAy76bi5YAhxGT24yqe0T2ax52b7mn19UHCMjsgMq
         T1+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9St8A4rpgt/BSlLKxt+ihcJJ7fU52bHAocoarxMWCvlWnj5C6UXA3jfDkpaPwaAx5HiPJM07HGBccz2I=@vger.kernel.org
X-Gm-Message-State: AFuF++nCCOopPjZnIEyVJGhwONAcUouwK0ELdzpRnyiKLHjSV3CK5Anr
	6BMQ0EUngCAXWMnkQ8KXtAF3PObsimI9LMKgF7j+CbvwdHI0aZtnkOco
X-Gm-Gg: AYBFou1vkS/cea0NI/h5a3laXOBeak7Q6GM/TlVmK3q++5rURsg064b+gz/nlDdJ5JB
	RxeQI5rP/xnkEazCOKM1hPWOV55hHMUACMqFg0T7yLS9HxyY4YKNuajRqMsysduaCRKqzmsjctT
	NFCT6ucss/0TuGBVD0uVW7mkbuMeTlxnQwIrjTlKWQqh4qNe+2zN4XuRJKeFpr+ftI2Dr62YcG/
	i5T0cdM02xYmo9y4UGYv3ewvEzg0hhGxs40u3KQ5x/Y50kGB6D3AtF3PxJWqZcDCyh0AE/OF391
	9AMKR8bLb25hFohIWQUQT7rLNQZbZmadhLv+dpCv9sLc6/ZGKglfvG+A//q/RzPkqgBjWp3j02+
	o90+t0BLlbAbq8RkHHt7I609c49pP1RAdxlNP30jvf1+bFQgavEB4kSlrwIAydRxn+XS6kHcflX
	xrP2CMXfL3r59E1J7Vc/KR9FPjcUNUYvf097p3bMeX+UnR5kMiw8qH73d61THxyQ==
X-Received: by 2002:a05:6000:38f:b0:484:3317:a1a with SMTP id ffacd0b85a97d-48433170bb5mr5978519f8f.27.1788019829637;
        Sat, 29 Aug 2026 09:10:29 -0700 (PDT)
Received: from main ([176.237.234.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab41sm3581883f8f.7.2026.08.29.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:10:28 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org
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
	linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Sat, 29 Aug 2026 19:10:13 +0300
Message-ID: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpufreq_cpu_get() returns either a referenced policy or NULL.
PolicyCpu::from_cpu() passed its return value to from_err_ptr(), which
rejects ERR_PTR values but accepts NULL.

If the lookup fails, Policy::from_raw_mut() therefore constructs a mutable
reference from NULL. Dropping the resulting PolicyCpu then passes the
invalid pointer to cpufreq_cpu_put(), causing an oops in kobject_put().

Reject NULL with NonNull before constructing the Policy reference. Return
ENODEV instead.

A KUnit negative-control run reproduced the oops with the original
conversion. The same test passed with this change. The reproducer is
available on request.

Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
Changes in v3:
- Add Cc: stable@vger.kernel.org.

Changes in v2:
- Format modified imports using the kernel's vertical import style.

v2: https://lore.kernel.org/r/20260828161834.29539-1-mehmet.mkoseoglu@gmail.com

 rust/kernel/cpufreq.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..4b992ea9a0f0 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,13 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{
+        code::*,
+        from_result,
+        to_result,
+        Result,
+        VTABLE_DEFAULT_ERROR, //
+    },
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -29,7 +35,10 @@
     marker::PhantomData,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 
 use macros::vtable;
@@ -687,12 +696,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
 impl<'a> PolicyCpu<'a> {
     fn from_cpu(cpu: CpuId) -> Result<Self> {
         // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
-        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) })?;
+        let ptr =
+            NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) }).ok_or(ENODEV)?;
 
         Ok(Self(
             // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
             // the returned reference.
-            unsafe { Policy::from_raw_mut(ptr) },
+            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
         ))
     }
 }
-- 
2.55.0
