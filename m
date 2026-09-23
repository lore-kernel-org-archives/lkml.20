Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61B3D7D77
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139393; cv=none; b=Mf0sOzqa771Pqu+2yxgbtNTqr/6mXl6FBxSqdeprG5r3qe3VJusej11+VGXrwMdyM2So3dB5kGGaT7EJrHa2AIqUZOPFwFwm2Q32oqpxqb0O5PcZrPnd+IFBOuWkgaeyBSM+8wurB64a66H6vfmW/haaFRtNSXepxiMcgkvZi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139393; c=relaxed/simple;
	bh=V86MNPLWnsX5Ccyw79DrEJWhumxSriG1Mfudp02+rr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htpmDrGvmmRdpxqKrLwT3+8X9BwiKVhucmZddyzHGH5hLkiz0JAnELwv1MRqorlnsWPBvgUuq0qLyrwBj25Ct9afwCLDi3XQrcl0RIrWE4SPGY/8Xu9m54lE2eVTGVueAAMbQqrwQ4hSIs97qt9qvMJklZC3cqtmjH0wxu6Xv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsJaBu1c; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsJaBu1c"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so579950b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139373; x=1790744173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sjzjwfKOPK+68pn0ND2VFCH5pb05Tmcgf4f+gG+DjE=;
        b=PsJaBu1cnccvgbxgC1tjOV4G11ajr5oyWDYyZ4TK6jFbWA8qVQyOsK/EGi3nl5hgo3
         H3WDPzy/mhaf4xrw8vBk4v0bJj82eK8LNKwV3L2EkHsv3PFhzeo8sIDytf51rARxj6So
         enS68IbVSDNGiOo1fYrFM2NkKlVVrkcBRkrjrpBBrF5oKICJUo8V2oaLnwmdY11mR0sd
         55x4bpZlVFigjF+lGGmpaoDN4aR+JPJPPVSTn7are9muryXHm6V2+zm1uqmEHuvmkMBB
         hfIwICaTI6jS51ocbhy5ZvXziFb0r3jhGc00QhWIQQsgqULTrNxz9ykavhHMGSu3yFXN
         b8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139373; x=1790744173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sjzjwfKOPK+68pn0ND2VFCH5pb05Tmcgf4f+gG+DjE=;
        b=QHf7MR+1H0Zae5C3oB7D2FYw9bt20DExhB+qcmztnT1Qs4rJX/YQuv5/j2RG5EEnjJ
         Ivx0Vr01kLfXtzjXnh9v4MA2YiW184o39w/vTjHF9nIPv0hZ5iOuwoT1PnDAbc0oaaOq
         8TSCXUg0LnimBZN/vyoGlvIQb6mttUQJKcJbb4bnNBa5WUAZNhvurMcxbWqVl7fTuGo7
         SGvvRwhIhkpUYGzThtVBvP+vibXWCL0YnZAMTLHvXP/Do6/LuQ1YWiMiWgpVW4hRUZKN
         KIgFGboJ/g8x/PMaCYjD7TNubz9aw010ZfW4d6bC+SkoMr81Yk1KoC/LdxfZ1H3bHUh3
         4TUw==
X-Forwarded-Encrypted: i=1; AKwUvBzdn2j/wk0bdvAGB9/NKUFM7LRcjLxcF7flkfhaJABH0AeAV01pgmz+db+SxRVnJXfUvwhOkmm/s/yF79Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nNHuWHrxXtGQbAzHeLUkzqZzSPRzSCnXdYc2wCcPndQhCDX/9p
	AM7SpfAMqCQypgqt72ULDZWoHSi64evWelVAUUbYe59kRQVATjAY0YVH
X-Gm-Gg: AYBFou3u6oay7lWcL1+zbjwhlE693gAaEf5Oph4dnYZbTic42qIwn78z+LyFZtdHcAI
	0f7SzZ2tBWW5TAVhVbWuF09rFAQAHN4KH7bCvrYwJaiCv+udkxjYWketXCvwnaCIJ7r5FYvjL3n
	XFRDUoayhVDvcHGGQavDmjCfpAYjAStAP5tjArmKOGAxzeVJBj5rgZcnsVkWWrZkZlDgqQ/0bqw
	tD4qDxKqozxRkFe0ajxk7LwTQcDkpSZHwGHhA5EUXlIEfUtRD7zId6/fqsupUMBTJctPdNr+TOu
	Q1E2etV9GSj+CitV6oLxL4Jcj0OpFik7BPNblRkvmaQyefUjC9EKrIbL40XB0E3SSfXVCKq+IrM
	bcI3nGQwyb6l2Qk9BqA0JNj5VZWHxWeSr6sr2k4dLDbk+BiBUh6dUq77ICMHwfgOFhlP5kMGHf9
	QfuP/vxPRkRDjpVJNjUk4YXdFd4GhJpxXn5UKWNKgbwzM+g4ZHc3XKfQjtG4OEp4x+r542mX1r7
	vfw84qmNZdDMDw=
X-Received: by 2002:a05:6a00:1586:b0:87d:3894:1986 with SMTP id d2e1a72fcca58-87d389421e7mr1072428b3a.31.1790139371407;
        Tue, 22 Sep 2026 21:56:11 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:10 -0700 (PDT)
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
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v5 1/3] gpu: nova-core: move the debugfs root into the module data
Date: Wed, 23 Sep 2026 11:55:49 +0700
Message-ID: <20260923045551.229259-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923045551.229259-1-vladazaharova2018@gmail.com>
References: <20260923045551.229259-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs root lives in a static that init() fills in and a guard
field of the module data clears again. That costs a `static mut`, an
unsafe write on each side and a guard type whose only job is to undo
the write.

It also leaks. try_pin_init! drops only the fields it has already
built, and the guard is written after the Registration, so a
registration that fails leaves the guard unbuilt and the static set.
Statics are never dropped, and the module is unloaded right away, so
the directory outlives everything that could remove it. The next load
then finds the name taken: debugfs_create_dir() returns -EEXIST, which
Entry keeps as it would any other pointer, and the driver comes up with
no debugfs at all until the machine is rebooted.

Have the module data own a DebugfsData instead, built before the
registration and dropped after it, and keep only a pointer to it in the
static, for devices that have no other way to reach the data of their
module. What is left is one unsafe read for the users and a single write
when the data is built, with no guard type. A registration that fails
now drops the data that was built before it, and the directory goes with
it.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs       | 10 +---
 drivers/gpu/nova-core/nova_core.rs | 73 ++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index dda58095f40b..01ed4adffe93 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -199,15 +199,7 @@ pub(crate) fn new(
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
+                    let log_parent: &debugfs::Dir = crate::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1133c6ce5c55..08509f64770e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -30,40 +31,74 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+/// Pointer to the [`DebugfsData`] the module owns.
+///
+/// A device has no way to reach the data of its module, so code running on behalf of a bound
+/// device goes through here instead.
+/// Written once, while the module data is built, and never again: what it points at is dropped
+/// only after the driver is unregistered, so it is good for as long as any device is bound, and
+/// is not read outside of that.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+/// Data the module shares with every GPU it drives.
+///
+/// Reached from a device through [`debugfs_data()`].
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the shared data.
+    fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
+    /// Returns the root directory of the driver in debugfs.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
     }
 }
 
+/// Returns the data the module shares with its devices.
+///
+/// The bound device is what makes this sound: the data is built before the driver is registered
+/// and dropped after it is unregistered, so it outlives every device that is bound, and the
+/// returned reference cannot be held past the one it is taken for.
+pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+    // SAFETY: A device can only be bound once the driver is registered, which happens after
+    // `DEBUGFS_DATA` is written, so it points at the data of this module, which lives at least
+    // as long as the caller's device is bound.
+    unsafe { &*DEBUGFS_DATA }
+}
+
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order, so the registration goes first and no probe() can
+    // still be running once the shared data is torn down. `init()` builds them the other way
+    // round, as the data has to be there before the first probe() reaches for it.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
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
+                // SAFETY: Nothing reads `DEBUGFS_DATA` before a device is bound, which cannot
+                // happen until the driver is registered below. What it points at is dropped only
+                // once the driver is unregistered, so it is valid for as long as any device is
+                // bound, and nothing reads it outside of that.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.55.0

