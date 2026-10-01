Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C596A468C30
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850149; cv=none; b=fes6fW2A8CbV5A9Z1vm2tHJZnl2qQKkz+qn9Bq9z3gmvWKE3IXgkP/krraR5PyF8oUpMVsXX0WCWWqMoXJGFdCB0ZQM3ciaAfv26NmCjIn6TEIn26qXIMTAOAXFR7wYvvENEb8x5fbtmbzUxY8HDcCTSWoAbA2RVwv8XnqZmfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850149; c=relaxed/simple;
	bh=VnVU8bPLJLWfbtAdNiLdfbQJCPObLTqpHbQuXDlr2xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWpWMFq1WSdDbPtAGMmnrIuQWVGbqJJ9lqzcsFSvRvvX/OgtPj17eW6zCOLo9Fu8dZfgBEZ55BCt0gSkvwNs9doCIc4ccHaQ6pFgAVHiWEs4hrym6SLUqMFHjrsP1cca4/TbdUorfSdeFOy9v+efMJFaFyufdr96ZeiI/br+6WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcoasWwK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcoasWwK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so35389525e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790850146; x=1791454946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFzLuRrxO1MNqfhxtzwDFW5LDm+149ISNFd1xuYHuCg=;
        b=YcoasWwKANqhJAT6ITRJApGZlPhldlCa3xeDRxEfwNSU7DdcpSvcZbECqojDb+i15L
         iTz2NxaLca/myE23nQbmPyIMSRIthvctpPeXyyxfi8r1qmMc4zC/alrLzYLdN3ouN5D2
         U4iTFWDDoj7ixO4ig1FDmEZ9qfc5myNxyc8kq9DjFl8/BqobYHyE2x/01WxvzLUZjZ3O
         Jzl48w2XjO4J4HAerMfCJ1+OKjrbJulAhazaEQuzk4XQiwDdO2SKTC5azlLMoQnNlSJh
         K8IgfpJ8xoftjXCuBTDZ5P83xNg9cMCi+bbTQriNhuGkHGaEWUXaFY4F/qUBDs/MX2Yr
         Ihzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850146; x=1791454946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFzLuRrxO1MNqfhxtzwDFW5LDm+149ISNFd1xuYHuCg=;
        b=dMe28MOV9TQHqJgDg6qTqq+UGZ/hYyt92dkPrexKfQOGNjpSnN+D1UjrC/NXpffba+
         nUha9HZF7KBycrocL3kMDY/Cxhlni1PVSy5EccKMJhwsWpuUNdl9LDRZ48IdFD5zMRWA
         7xzEIccQtDNbMSQ5kFTcdN2Q4QMSXMkB3F5cffdwCjNmPK3KuUE6SaeGBSDzVSWC+lyP
         rPdyfAwuT11eNlr9oMgaLaMhyE7DADZJXT/c4+pZlh5x9FdU8UCO4AhNlNnrIJ/oBr0Z
         mDEEB3mAmop98rsz4tobhXdpYbURGY/yQINr3U6+hIkExVWIwz1tVJgu3BaGtYSXZAO1
         KnsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQyvjPETXNN1cGBMQxNvJtDIZ1ywkfMUO5fHHqNBjIym2ru/opGxkPINUmnvNQ4O3TfEb9A9tG3hZIBp0=@vger.kernel.org
X-Gm-Message-State: AFuF++nw9owCcrjU4Kkb8O6/ewS3pd0acwYmT19gCLmA5s6GEHyN+Lax
	g8pk+7uvSVRVLDhabRP7TokF5MSNptGHlo8g0QbLUDNFPQ1wQxoqF6gv
X-Gm-Gg: AYBFou2ecSrduiylbohU+a32i6DFAMhBw6lFDDpYq25nbf/j5DYpTupDiDP3EJA3aBH
	lnUH1DmevNy2qrAfL/oXbXPZugNzMrG9Ueqzt1ipTHPfAhdc3fOKzHpQDE+Dkujn/u8Lb+kst2z
	sL3jUWEDqsCMDZ7hWgOfG2yaHQM1p8/4+T0V98tFu9ARhP3hxjx9jmMnai1Iexar1Vah8QWo843
	C7U3yQcNLbdoUtgUonHt1+VpVwRc6CMKTwTmNBi3U7FIMjXL7giRR3HT7S79kly+St0sgUsS2ts
	9o+EqFCbjQJBJrsubKtMh0vtlFKNHPOyXdNPJHxH8c3rS+NI9LACjtLI5sVYwFofHTauUEg/hCI
	8IDPa704EINbqmO/sDbBMcYv8HoFTN8XUxqLkf/f4eVg9iruYvAKWbv3m1slKHoTa9Fibr8fTke
	+mvFBu33bBihvoUo4goSZ1IHUENy682Fbm/Z2tpXoB+4Y18vXXA9qXPYM4NqxoDOGjxYU=
X-Received: by 2002:a05:600c:6815:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a01b0031a5mr65592665e9.16.1790850145677;
        Thu, 01 Oct 2026 03:22:25 -0700 (PDT)
Received: from main ([5.27.43.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01fa15e51sm58094425e9.2.2026.10.01.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:22:25 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org
Cc: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>,
	boqun@kernel.org,
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
	linux-kernel@vger.kernel.org,
	xuyiwen14@gmail.com,
	miguel.ojeda.sandonis@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Thu,  1 Oct 2026 13:19:15 +0300
Message-ID: <20261001102213.45437-1-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: spidermana <xuyiwen14@gmail.com>
---
No worries at all, here is a v4 update with the comment update and
review tags.

Changes in v4:
- Clarify that the policy pointer is non-NULL and cpufreq_cpu_get() holds
  a reference for the lifetime of the returned reference.
- Add Reviewed-by tags from Onur Özkan and spidermana (using the corrected
  tag from spidermana's follow-up).
- Resend at Viresh's request to replace the previously applied v3.

Changes in v3:
- Add Cc: stable@vger.kernel.org.

Changes in v2:
- Format modified imports using the kernel's vertical import style.

v3: https://lore.kernel.org/r/20260829161013.102967-1-mehmet.mkoseoglu@gmail.com
v2: https://lore.kernel.org/r/20260828161834.29539-1-mehmet.mkoseoglu@gmail.com

 rust/kernel/cpufreq.rs | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..b75d692846a2 100644
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
-            // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
-            // the returned reference.
+            // SAFETY: `ptr` is non-NULL and `cpufreq_cpu_get()` took a reference on it, so it is
+            // valid for writing and remains valid for the lifetime of the returned reference.
-            unsafe { Policy::from_raw_mut(ptr) },
+            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
         ))
     }
 }
-- 
2.55.0
