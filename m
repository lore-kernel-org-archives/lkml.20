Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA553630AC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931766; cv=none; b=qVOzDakFr3gIyfUnN8/Hr6+8YvwEzrdsPzTzv0R/z7L0/yIhAIciH8eS689o/sjpxRb2mMty4aYa/r+nId79eSH8kxNotT3SE8yU1Mx5y3VAMSOkRpIZpdWzJwJ74QN78+ePfhngqyXeq4/HffZkV93K5ukocjS0sjEjtjnv328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931766; c=relaxed/simple;
	bh=CBOYWU5KwtzTq95ftVPMi+1AX/qvyPysCgyFMT0deyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZrLtvgxXD4aS6Ha6alfgTsTZ+saPagdkeWTNWuOyfjNCO72Zg6MR2kXit/WeKoPEOkIAwuQIMikDjjl0cLNnO9Xzgl7abxjVWN5hCGLDUsxDY43+y/nAljlpGn0dTQLhhAsUgipT6rK/5ls6ATWXOC+G7nlmdRlPqb3KdCYuiII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKVwE47+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKVwE47+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so659080f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931763; x=1788536563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Il1nKTj4PJSO6PrUY+686DiZ64VrBPAafI4EqiNmen4=;
        b=cKVwE47+UjYZ4DWk/hThBCkFvuINKuFNPNcbNS6W5WcIRMjPPW1UkTDGoO/BD1q2CG
         hcyybFx3AFdObMCf/m1rqbm0o2QyK9ELsh8nZcLGz4WFw3VMYuFUXV5fLQUjW910bLXE
         DFX+RjPvhIdG8IbVFrnbtNwf6pqZ332nBFGS9W9lQZ0rNuEcVBAQtYfRAujj1Gar7woE
         8qjj3itTC0JRVUw+WRmUCxeC1/BqVkkZiYaGc/ICLonvnUs8QF4dRRndbvfeKq+4/ZTi
         hlv0ySPMBHFSS6fxivxkBy0Vz9FaQAGljbMuctuyiEhualILDTpdISWGG98ho6nAYtdZ
         Ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931763; x=1788536563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Il1nKTj4PJSO6PrUY+686DiZ64VrBPAafI4EqiNmen4=;
        b=In2QyjEnjxbnkrbHvnhvW26C96HUYrywIfDDt7qamgQEljihwXfWjE6m6cQ2Beygd9
         XrX/gze9JqVLT1YL8x8072F4GhnhT7/7LHb6Y+2NO1iImNsKF3cvI2iHsCz4HVSUcRCJ
         adt8Aus2uL+q9eqO4wVuoJK5Rx9gmr7HpleSG3gyZYLZdhZGLKZfv5zegouYNlKLQV2+
         bdTXlrxfHB2nDBXBsnVrH518OOMo6q+SW1b5vTKr+Un0A6xYYPQRwKqrdOMwQ9r0iG7O
         +lYK6OKZIjGewCPCvk7EK4V+Gc1EFM/PlNaeAr1FvqHP7GZsSV3znJHoJA51rtOLsjN9
         5YkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrp42Wh71u8SLYJGYJTorLQKQ/UeTYxqe/0n1mmFwtMpUZB7Fh+C87Y0WVvtNqkfrIPoEjqp/VKQZoV0C0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/3Q2CvSbRW4uR6E5yoD5kIhmtzjV5polQQT1v3qNgk67YdX1B
	UzwRH1CdoNDHgW5OFPJTP78QrL1t15tIVgFaLIdv5QTLLQ0RFl4sljf2
X-Gm-Gg: AR+sD12ML4cl/uPbcIo50kEJ4OryKf1eotJ8/lfrwsTwNP9jvfSS4w+GGLe3sUTDWk9
	koQkRXz6CeH02vmr2O7Zk/JxKmFhorvWPzUlWi5/BMYo+U7Iv2t8PX2fuaEsJEIS88PcknnEwsL
	8hLJjWZ/6NoHvziIzOhfDpDs0STHcibWhB8qZ/etBr4FCPCGvW4zG2sUcqW9AKjD94X8Z0uQZ8O
	W4UD/QdGkICHPuxq6tJzMeuF0b5gtH+GUFU67Ma5PyQJCPpoZOpAHK600jwFVNHy7H0rDszUAWN
	fyZxKt9i5sO1qOqmVjGW/lDtOa8nKxfr57WW1WiPclXeKlQhf58vhIHiCj3CKCwj3n1ZyX3vg0V
	VN5xXWic79sPNumUBJmfOz9ZKpXhSpmh12MnWd8yoVLs7fjWbvTJLYuKomx8Te/8jZmm/chK8N2
	0q3vBOr7mPG64k5OclDYJnef6wwqOS1r+NKwrZ6n92KWCp3hdvTGDQPIKBoSiyPQ==
X-Received: by 2002:a05:6000:25e5:b0:482:fe64:1717 with SMTP id ffacd0b85a97d-482fe641751mr5140630f8f.7.1787931762527;
        Fri, 28 Aug 2026 08:42:42 -0700 (PDT)
Received: from main ([176.237.234.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm5610793f8f.26.2026.08.28.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:42:41 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Date: Fri, 28 Aug 2026 18:41:32 +0300
Message-ID: <20260828154235.17315-1-mehmet.mkoseoglu@gmail.com>
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
available on request. Validated on a VM as well.

Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
Assisted-by: LLM
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 rust/kernel/cpufreq.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index affa2b9490ef..1c0b6d6a9773 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -14,7 +14,7 @@
     cpumask,
     device::{Bound, Device},
     devres,
-    error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
+    error::{code::*, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_char, c_ulong},
     prelude::*,
     types::ForeignOwnable,
@@ -29,7 +29,7 @@
     marker::PhantomData,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr,
+    ptr::{self, NonNull},
 };
 
 use macros::vtable;
@@ -687,12 +687,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
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

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.55.0

