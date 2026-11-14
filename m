Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631404;
	b=IuHt7GhBBv0UEEwhRXFDgyM3VvQf8t5eNTSLampKAWdxqQXgMl7Ja6QCvu5G3FC9AIHJ
	 QSCHlIt+QXkHMPsxmDQUgg4WQBygYw1CtbXg3fjFa/oEnovUGL9yehWLIsn7OT6XCcgia
	 EgKr/hV8D6zCClDAdkfb9lSaHepMEzvO24qGD4I+X/75giSUmY1WMs/EkUgOAhjNozNes
	 dAG8InLXLngzCMCE3ZBnFD3Z4zzk8Mb5t6tGfMJACJtPoneBga/KA+tt+nmv536lBixW9
	 Xac/yDs8X1ijTNLHGC9fYF+Wm3df8EnlPeT7u3r5ftKDfK5pgzoSfvn7ngQVtusk9nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
	b=tLReDQHwq+IwbbbmNH+N1rNt2gulYMPFxawJv2TvtR1VNLyEI0dKdSL2zxeq+fxDwqGR
	 ZMN+3mVBJExfpvdOyXwbwtaux5xjW3JkD2WhvfQPJXClOWuWk0sGI0klFb/3O+7eDACeq
	 oj5qlJAf+B1RmGriskDtdiDEHymzuBwZTmGZBPAknv6BscGkmVMce9x7eLpzSDPsLw/Om
	 A6mez9VpOM0c0ya7LX3E+C+WTMfNFb5MdUl5iiknK5wK8ZEreyS6BN9bj92U+jrmEAUmO
	 2RJ3IFyfPIVWJvyMx3t6nnKyATiBzxB20v+u6HJtVUSizCOeWVwr2lkf1hg/rPyjm4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hDzKw08j;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD5606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BD5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hDzKw08j
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so904978a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631403; x=1795236203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
        b=hDzKw08jaVyEvLrpjr78Mt6JcuE8qy75outsfCJNNxMuSrp9kevQrFmtIUexhEi5XO
         yOsO5cb5dHhMNn9/ZYvuOP9Oe2wIHWfHRE5BRR6clH34kTU3DMSZ0ZjLd3kshDu6XAVc
         JyZUTWhQY3fSOthxbSlbGSWKBrwRfzi0PJDYLDf1FEtjpRPDGYdRN5bP0nTfYHFgUYNG
         o6z7x276+jf87CcWpwI8ojWY+9Kc0ZGtKuaKTbnYJKt3HsFkBVM4Tsaf7bL3sGFjDzQ1
         Xbm08RJI5yHxM4foBQV/LZaHOl56gcw8LIWdwdFIuqigQBy4q6uLlbRM9IwvrLyL0261
         LVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631403; x=1795236203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
        b=HUkLVK2K4KyZUYGSyQXV9lLxvOdSGKvoN0QAnSplHQMkbzkOzHruCMr+V8Ixdi7vRs
         lOanrkH63OAjl7WM8H6vfCKcHN2wtrmwt3CVbvet41ggJ7Dgspwza2jJvyHhPiUGWwoi
         XGWn1PaNy1AsxXnAsxqByg00nGWpVvbB+p8n9G8yhHL6k/YtllasQyQYBY9ZQ/UUNpKj
         exsbPhueIDemB0/0xhQJ2kS3AYpbOoGS1cpxYAwxulKGXteUCFfF1qVmxm0I4SV7y6a3
         5BzVadlzo8IYKGjQrn4kcHKy3Ly5sbYd6vJJvkCg/baoP94+3/8pg6LhorC7MqrJjrXC
         j4FQ==
X-Forwarded-Encrypted: i=1; AL+hErHv+lSf3FJNYRPtgzO8oeJQEf/hPycB5oTur78GbTz9r8Z9KEc/aJ7OBk0MtWEHSKvwwOYxG4aYTzPQF8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x2qTYj6TyAZyHqtN1mTNxhpRxT51Ftai0ErnHqC1/ZfS7RMZH
	EXvDo9NzkP2f8OQw5iBNKuYZz0f4y9VONr6wHNZhkI97GLZBhr+TZhHD
X-Gm-Gg: AYBFou0R+/5EGGOTY5m1svWX/fTItXA44NHvHhusZg/D0G9UQ5DyFA2f9JnX0xb2XeD
	JGKO7GDhG9GAle3ok5mTd62jcDt3BmqjofLGHK3HpoN8zQJ676/7D3O0EvxNgruIhg4ArLZcC/S
	HohDehi8kxuWneF+9CttCBO/0yELLzsqpEEyekxon5Oed6DubCxNckFTH5cKbf50FADEZLvmft0
	UG9ms+bzA4Si8y3+NL46aA6HTDUj7ixLSWY1qg8zQBG6pZa39MS/loOqTYFtz2qu+AHKxIuNY+v
	tS8LeBQzus5L0suORVZSxevhuFkxjMtAN3W9rhPD++/5YWi0B7cW6FaZFkBSVJlnIK51FSP/wFG
	WXfISA1/cgGaxKjL9tLQ0zD5cVl1lstbp6I+xSpXlmzsXFEqNg+LFtW9SpNHiYKqDo4m3gulsli
	6lA4LAMjXrUGuFsXQs3VVY9JAz9d67jdsN5TeRjOYOa1FlDWfTS9bOb7keWDzQzIfYfFfVzXudL
	M96nDrMQiHKkMlauamZs95NfTAM3Prw6wRDfPnHwQTOsWsp4/5JLpCvuNe9WpZ9JuvnlswrlgRB
	As9P6gr7RZAaUTJU6iCNwzzBedFDoNIjKU8=
X-Received: by 2002:a17:90b:5703:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b1b0b659b2mr4801830a91.56.1794631403381;
        Fri, 13 Nov 2026 20:43:23 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:22 -0800 (PST)
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
Subject: [PATCH v8 1/4] gpu: nova-core: move the debugfs root into the module data
Date: Sat, 14 Nov 2026 11:43:01 +0700
Message-ID: <20261114044304.245684-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
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

