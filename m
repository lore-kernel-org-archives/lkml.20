Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556419;
	b=wLAuidBSWacOKDcUrU/uN+aOQkQtUWACzhGlexLZh0ifOm//ZRiYHnHaDRYAfj6YbOr5
	 xwB6hxrOgUr2NIrglKXIuMnUq77cBc+gIgDzdg1cEJkdrJWdzHt8f4lnbQOP0H4Zyl5Km
	 9fWuzNfG3PqTo2C9Fw2u0B9hXvCHkpZ81gfNFD9un/KHP3Zt+8HPmUxZ+t7oN7yv56fXd
	 zEW4R9K3Os4XVVrq6I++FJBAZ6qYtPWIK1JctgScPCqnQcbJdmVHbsjezULxn1UMpUvb/
	 dAaL7uPMdQzCnSCWFlfO4pC2KW95iouqMrIjwetOOOW37+uvzsn3Ria9PH8+llewzGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
	b=aLfMbuApf3Hml+Az5jJKPzQFRTrC9OUfl1EDi1C9DyUXyGzGiyvsRwiK//KA0J5u8qKC
	 5ellO86ySMGrCUAmFvrkPJJGGqRSI6ryOJ8dxkWitYZZr0+Nc73vb/KYsTvAF70282gw5
	 k33+A85VcC9PZxaPBL2wQOx3I8n7MI1lJLxyTU6UxIAbXzesIRz8GUxIZkTOoafjNfA86
	 o6qJ95edd2SmnO8Qbs+J0flrovWR21ss1rzSwb1xP+WUCKLaccwALIddi61S7jlOrNx7+
	 l11VY3DtcNa6J1FZMM75Hf2UdrUZ+yPHQtAkjFsIUaGBszoNOzAK1br7XMy4jTAtTWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwNtIWws;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADCE606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADCE606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwNtIWws
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1183748a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556419; x=1795161219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=gwNtIWws1fr2f8biaLCpjpOSK5SwqS9fE7H6wLAlljtjMGzHVJS0FtWqg4zoedkQFe
         2SE4xsjs/pElhKnORUj9FUjH+GZT0vhksN98zZ6YI+g4CZ93Ev0SCQ7jj9jEjEbUunAp
         89AumG+msO3A8wiSQb+iWS6i521RVcKbdfRrnfmCAJj81+iIfCf73O9Bv44kj8ezolLD
         GktfctL3fwPjuBY6vL1ZqrVyGakX+wNGcQdNTyiHL+4GcQnWNYqaJmNdvcNUXhcvpJur
         6t23dxoWSB5WvKoGzCMooHkFJMy3DcIsS8pH1LBXW0NAp4j429nfNSXb+Hz31rgQJuCZ
         f0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556419; x=1795161219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=ddVehrjMriq1h+ub6OX6kYDgX8ChaOnl8s8oiC4ALLUtfvQ/OO+yVn8vKSmYxJPxVn
         9TUockzpRA8D6AX3uuFSPOziYa8U+63k/TUy7nGh+DNTe6Wc5e1Hex5DFAlW1oTrXSfI
         FtVTPIysBHtTPyg54mw4xESAK/H/jM86ewlu93SApEPuxRhc59M2xgRJoeqVEBWTMO41
         vW4PuXeJOKIqQSdUCrynIx8S57ZpllXfcbT0moUJ6Oszm8wXHSxsKGqplbVcTg3/j+w2
         3MsJvj1rM3yagS7XcCeLo3Qb2N4C5U+FtWgl+K/Be8TzKU97b1r2cbU3VHazzGD1jpvO
         I2KA==
X-Forwarded-Encrypted: i=1; AL+hErG3b/KtslBsqXrSRWscbtHoMrV+fPXpRiKis7mwyzeBDi3EQsyVGzjfE3QErFWN+RFFcUu+qyKpLXagFP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1CnBKZjcbhY4VNs7/GMKkc3jkPBdGzgmefD9VbPlbJi1ikh9X
	n7u1Fkg0vrUIHEUoa4eUMWJ5HI2sqD7Uz/svsvckggb+Hzily8J+iwbx
X-Gm-Gg: AYBFou3Bxa8LUPcve1KB6A57Gi58d9t757XuUBaZTnMGDQHBaFUA4t2SitlqjR4hmMb
	ZtgRowuwzj6qP9dhzXahoj57Z8coVUZSvW9XRwwWaKEmrkA/lUKRBlV3xAKhqqx65p4o13TWwNS
	6DEvSnBCTLt31QqvnZSJON0cCkFss1Ld6JhSnEsqeAJafc4HoeK+kkvmWM1gRQWdorM/OnYi8kx
	93ZnnMDWY0ES5hUe8eZEHOxCCrozn70SOSt6/4e+EUkbX/lN46slRcnYfhnGc01mU99ByaoHWG3
	n93xMeJxMahQxJ0aDIwxXmZKO20yfKaV5GrBKO6SxZzhxkPWzgFsC2SLTmLI28WfJ8oBypPpE+8
	bXaTSamrUNeDbv34A/Rrsj/YZzDx26aJb/KnXJEvR5EYTTK4bSrLKcdDaYPU4ZiIHdJLSwzj6kF
	qNmJB9Px580p+v+jTZMHkMsj+exsEb9fglpoZLliOrVt1uiw5P/A+YHzJtVN42O1hUA+i1xsAEu
	Iex23FvSE77QIEP7fr6jlFvL9bwmAChgVDhc/5x7MOM9KQlCAjYCEMB+C/hDcNqxz58+z6cwytg
	8xsAcbUfuuCaG3BJx1R4nywFWaWdvZGHCahAbZKOt/Isw7o6qcWr2uZP
X-Received: by 2002:a17:90b:3808:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b1b0d08ec9mr1691398a91.55.1794556418764;
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v7 1/4] gpu: nova-core: move the debugfs root into the module data
Date: Fri, 13 Nov 2026 14:53:14 +0700
Message-ID: <20261113075317.934264-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

The debugfs root lives in a static that is cleared by a guard field of
the module data. The guard is built after the driver registration, so if
the registration fails, the root is never removed and the next module
load finds the name taken.

Move the root into a DebugfsData owned by the module data, and keep only
a pointer to it in the static, for devices that cannot reach the module
data yet. If the registration fails, the root is dropped with the rest
of the module data.

Fixes: 09691f5d8070 ("gpu: nova-core: create debugfs root in module init")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/debugfs.rs   | 29 ++++++++++++++
 drivers/gpu/nova-core/gsp.rs       | 11 +-----
 drivers/gpu/nova-core/nova_core.rs | 62 ++++++++++++++++++------------
 3 files changed, 69 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs

diff --git a/drivers/gpu/nova-core/debugfs.rs b/drivers/gpu/nova-core/debugfs.rs
new file mode 100644
index 000000000000..6c6ed129f0da
--- /dev/null
+++ b/drivers/gpu/nova-core/debugfs.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Debugfs data shared by all GPUs of the driver.
+
+use kernel::{
+    debugfs,
+    prelude::*, //
+};
+
+/// Debugfs data the module shares with every GPU it drives.
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the debugfs data of the module.
+    pub(crate) fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
+
+    /// Returns the root directory of the driver.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a4b832f6aec1..79ee74a0a16f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -200,15 +200,8 @@ pub(crate) fn new(
                         logrm,
                     };
 
-                    #[allow(static_mut_refs)]
-                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
-                    // after driver unregistration, so no probe() can race with its modification.
-                    //
-                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
-                    // registration and cleared after driver unregistration, so it is always
-                    // `Some` for the entire lifetime that probe() can be called.
-                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
-                        .expect("DEBUGFS_ROOT not initialized");
+                    let log_parent: &debugfs::Dir =
+                        crate::NovaCoreModule::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..f5d08de8a212 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,7 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
-    debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -11,6 +11,7 @@
 };
 
 pub mod api;
+mod debugfs;
 mod driver;
 mod falcon;
 mod fb;
@@ -30,42 +31,55 @@
 mod vbios;
 mod vgpu;
 
-pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+use debugfs::DebugfsData;
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
-    }
-}
+/// Pointer to the [`DebugfsData`] of the module.
+///
+/// A device currently has no way to reach the data of its module, so it goes through here.
+///
+/// # Invariants
+///
+/// - Only written once before the driver is registered.
+/// - Points to a valid [`DebugfsData`] for as long as the driver is registered.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order. `_driver` must be dropped before `_debugfs` to
+    // uphold the invariant of `DEBUGFS_DATA` that it remains valid for as long as the driver is
+    // registered.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
+}
+
+impl NovaCoreModule {
+    /// Returns the debugfs data of the module.
+    pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+        // SAFETY: `_dev` is bound, so the driver is registered. Per the invariants of
+        // `DEBUGFS_DATA`, the pointer is thus valid and not being written to. The `'a` lifetime
+        // ensures that the returned reference cannot outlive the bound device.
+        unsafe { &*DEBUGFS_DATA }
+    }
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
-        let dir = debugfs::Dir::new(c"nova-core");
-
-        // SAFETY: We are the only driver code running during init, so there
-        // cannot be any concurrent access to `DEBUGFS_ROOT`.
-        unsafe { DEBUGFS_ROOT = Some(dir) };
-
         try_pin_init!(Self {
+            _debugfs <- DebugfsData::new(),
+            _: {
+                // SAFETY: The driver is not registered yet, meaning that no device can be probed
+                // and thus nothing can access `DEBUGFS_DATA` concurrently.
+                //
+                // INVARIANT: `DEBUGFS_DATA` is written before the driver is registered below and
+                // points to `_debugfs`, which is pinned and dropped after `_driver`.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.56.0

