Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C43E63AE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139398; cv=none; b=RM7sdymndf2Pt1mmlICSbVVkeYiGbhr/xO1BNiYzeKMh5Q2C0TXxvnX3b9LVSfXn79EtVLNxzRnKm/su1Q55Bgb+l2QHSFh7uZ088yldb+xHk8vV/yMaI7rfsufMBSG2Y2YZZ601mRHI65IMOdWgTqs/yKjpS3nOfMKpeF8S9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139398; c=relaxed/simple;
	bh=YjdBU19SgV1Y9vfg0l5EHp63mWHtXanPinn5rOw6LQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJiowIsdj8vcmlH1VjtF3kcvXUFBqJmgAUCTvtuJiuKHV+uqSdLZszsJm0heSCdbB7cq/Pvfdy4ofDK6GkMNijUhFWqSGERrpipar6c17iWgELA/KkvAoqsb4q/vGs7tcVCNDWP65T67bSYjnYKtScYTbVYLF8tC43/kbhEHSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne+PCsh0; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne+PCsh0"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so319403b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139380; x=1790744180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwJzYusT65HvhnYbkq7feitpnxm95NlY/pIrZm1wqZA=;
        b=ne+PCsh04H4gIu1hkq1CFVW5TR8nXavw8mVGqkpnpNHd7I/27R0cczFPvph4l3tDT5
         Yp01edI4sLbio+wJaSGO49iL72jFmvCKgpqrlvN8MwIvCmHa9kP7huDH+Q6vwFvOeBVA
         dhDc7/sAeNvg9thK6F9A2o1zSWEE0cinUXBPLH5lEIIJX31WOrjRe1orclNDHEQElkAC
         tw9CHLxrMXVs/H05J8Yfp/2EQ8/yXwmJwmLYbtduuqWPi/LBSk4v1QLYxU8hEgEymn0Y
         gSvyVPK2QUYPUz0m3L9gGmd+Y5qP7sOmRJ/WyEq0mJESQC5VZ8nVhILLAyEvyPHeUg1L
         26dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139380; x=1790744180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwJzYusT65HvhnYbkq7feitpnxm95NlY/pIrZm1wqZA=;
        b=uw2bPAruX6N19ecv2+fuWYwEpsweXeoT4CjkXg+E83cPxmw2kE0p46+CTg8pWU61NV
         0bJwTbT6OKsooeifuHXEf/346C0gJQPlde2E1n3y+jXzADnqhzFetxaerXHhL4m0eEEr
         TlPLBwu8bQ4ZMx8IJuCorD+lcrtHnRc9fWEzsMXiiWtyX5AW1evRUV8L6MPACnlWu3Hg
         oaiGglTEPm1lHhx3Gw7dk4ZKayrsXweL47yTkXZSRIPtJPbofErU4rGA+4UXhmojpG/J
         2Nfo+Qaq5PcZB8KkKb9BcEw/cL6tAtm0DbY3mr4oupLVVzCsrrzvdj+Q8i/KdsdftAbx
         3eog==
X-Forwarded-Encrypted: i=1; AKwUvBw1IkkdAFe/J4gWysRC876ruA39YJ02QH4HaeXJ1PhfaNo/KA72pnx2i9J7Xwo7VA/Z8q2+S1EP1FOz2MY=@vger.kernel.org
X-Gm-Message-State: AFuF++nibvjpNRJq9AdpxL0cftWC3KcPg6SVuuqC094yFPt2kiwxVlhR
	heT2/4a33vDmHt7+vrH0i2hGHhfQurmu0uul7qmwiUdYb5mauejdbNHfEwQxBZAgK/yYIA==
X-Gm-Gg: AYBFou37vhG06rKyMdIR0xpx5qRmreIpILD2yUKITSEqDyrO+kb/D44riRwbBnSD5Xw
	N4nReyy4dgtEJ4clHmpmsen+cchZ8hEAo/y8Ycgk1QxyEliyQSJstUpXvqh2jhv86Q1AtLU29IN
	83Je5nC6a1ya0SWadyEQbMrFWFONcEI2aKgoOruLCYHBXa89T0/FG5TEtSj+UoU+NM1qWyyI1uq
	8inoDXV2em5N8HdCxwymNH2v57M4q9eRPyxFF5DGbK6zXmHRXUFcLmKTj3ZzgpuUkT6TWw8Z1pr
	xS0dAdzBbjWgUcDZ/gzY3HugJ0Ux8kLNZGd9wPdhjvE17cDfTdxR/q8LcQ2A/PRB2xekwjBryeP
	s0iPvSJP8Y5sp4uhseMyQAjC/8gZGfAMuq8KhX/Cp85q9aYTA+xntU+QoyqqF/KBE1eHRdMvJ+c
	CU1euedE1I7hXk8YVRwslYcVqFB3vZu38uonl77YHOgkAGWl4sKtx8LdlChLwQ+biokAA5JgGdZ
	UW/xQ==
X-Received: by 2002:a05:6a00:928c:b0:87b:3bcc:bce2 with SMTP id d2e1a72fcca58-87d1c9b8d83mr1483524b3a.33.1790139378874;
        Tue, 22 Sep 2026 21:56:18 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:18 -0700 (PDT)
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
Subject: [PATCH v5 2/3] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Wed, 23 Sep 2026 11:55:50 +0700
Message-ID: <20260923045551.229259-3-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed through debugfs, but the Scope that
owns them lives in Gsp, inside GspResources, inside the Gpu built by
probe(). They are DMA allocations of the device and cannot outlive it,
so the entries go away as soon as the GPU is unbound - and, more to the
point, as soon as probe() fails, which is exactly when the log of a GSP
that did not come up is the thing one wants to read.

Add a gsp_keep_logs module parameter. When it is set, dropping the log
buffers copies whatever the GSP wrote into memory owned by the module
and exposes the copies until the module is unloaded. A buffer whose
"put" pointer is still zero was never written to and is skipped.

The GSP has normally been stopped by the time the buffers are dropped,
but a boot that timed out can leave it still appending, so a DMA read
barrier orders the read of the "put" pointer before the copy.

The copies belong to the module data next to the debugfs root, and live
in a "retained" directory created during module init rather than on
first use, which keeps the teardown path of a device from having to
create anything. Keeping them out of the directory used by bound GPUs
also means a device coming back does not find its debugfs name taken by
its own history; nouveau, which recreates the entries under the name of
the GPU that just went away, has that problem.

While at it, move the log buffer code out of gsp.rs into gsp/logbuffer.rs.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs           |  92 ++-------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 247 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  29 ++-
 3 files changed, 294 insertions(+), 74 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 01ed4adffe93..72752c6bd6c0 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,11 +12,7 @@
         CoherentView,
         DmaAddress, //
     },
-    io::{
-        io_project,
-        io_write,
-        Io, //
-    },
+    io::io_write,
     pci,
     prelude::*, //
 };
@@ -24,9 +20,13 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod logbuffer;
 mod regs;
 mod sequencer;
 
+use logbuffer::LogBuffers;
+pub(crate) use logbuffer::RetainedLogs;
+
 pub(crate) use fw::{
     GspFmcBootParams,
     GspFwWprMeta,
@@ -77,10 +77,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
     }
 }
 
-/// Number of GSP pages to use in a RM log buffer.
-const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
-
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
 #[derive(FromBytes, IntoBytes)]
@@ -101,49 +97,6 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
-/// The logging buffers are byte queues that contain encoded printf-like
-/// messages from GSP-RM.  They need to be decoded by a special application
-/// that can parse the buffers.
-///
-/// The 'loginit' buffer contains logs from early GSP-RM init and
-/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
-/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
-///
-/// The physical address map for the log buffer is stored in the buffer
-/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
-/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
-/// then pp points to index into the buffer where the next logging entry will
-/// be written. Therefore, the logging data is valid if:
-///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a>(Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
-
-impl<'a> LogBuffer<'a> {
-    /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
-
-        let pte_view = io_project!(
-            obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
-        )
-        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
-        PteArray::init(pte_view, start_addr)?;
-
-        Ok(obj)
-    }
-}
-
-struct LogBuffers<'a> {
-    /// Init log buffer.
-    loginit: LogBuffer<'a>,
-    /// Interrupts log buffer.
-    logintr: LogBuffer<'a>,
-    /// RM log buffer.
-    logrm: LogBuffer<'a>,
-}
-
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp<'gsp> {
@@ -168,9 +121,7 @@ pub(crate) fn new(
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
+            let log_buffers = LogBuffers::new(dev)?;
 
             // Initialise the logging structures. The OpenRM equivalents are in:
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
@@ -185,28 +136,23 @@ pub(crate) fn new(
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    libos.init_at(
+                        0,
+                        LibosMemoryRegionInitArgument::new("LOGINIT", &log_buffers.loginit.0),
+                    )?;
+                    libos.init_at(
+                        1,
+                        LibosMemoryRegionInitArgument::new("LOGINTR", &log_buffers.logintr.0),
+                    )?;
+                    libos.init_at(
+                        2,
+                        LibosMemoryRegionInitArgument::new("LOGRM", &log_buffers.logrm.0),
+                    )?;
                     libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
                 },
-                logs <- {
-                    let log_buffers = LogBuffers {
-                        loginit,
-                        logintr,
-                        logrm,
-                    };
-
-                    let log_parent: &debugfs::Dir = crate::debugfs_data(dev).root();
-
-                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
-                    })
-                },
+                logs <- log_buffers.scope(),
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/logbuffer.rs b/drivers/gpu/nova-core/gsp/logbuffer.rs
new file mode 100644
index 000000000000..b1f912fb3fae
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP-RM log buffers, and the debugfs entries exposing them.
+
+use core::convert::Infallible;
+
+use kernel::{
+    debugfs,
+    device,
+    dma::Coherent,
+    io::{
+        io_project,
+        Io, //
+    },
+    prelude::*,
+    str::CString,
+    sync::barrier::{
+        dma_mb,
+        Read, //
+    }, //
+};
+
+use crate::gsp::{
+    PteArray,
+    GSP_PAGE_SIZE, //
+};
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
+const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+pub(super) struct LogBuffer<'a>(pub(super) Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
+
+impl<'a> LogBuffer<'a> {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
+
+        let start_addr = obj.0.dma_address();
+
+        let pte_view = io_project!(
+            obj.0,
+            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+        )
+        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
+        PteArray::init(pte_view, start_addr)?;
+
+        Ok(obj)
+    }
+
+    /// Copies the contents of this buffer into memory that does not belong to the device.
+    ///
+    /// A buffer the GSP never wrote to yields an empty vector, as it holds nothing worth keeping.
+    fn snapshot(&self) -> Result<VVec<u8>> {
+        // Offset 0 holds the "put" pointer, which the GSP advances as it appends entries. It is
+        // still zero if nothing was ever logged, which is all that is tested here: a buffer that
+        // was written to is copied whole, and making sense of "put" is left to the decoder.
+        let put = io_project!(self.0, [build: ..size_of::<u64>()]).try_cast::<u64>()?;
+        if put.read_val() == 0 {
+            return Ok(VVec::new());
+        }
+
+        // ORDERING: LOAD->LOAD ordering needed to order the "put" read before the data read. The
+        // GSP has normally been stopped by the time this runs, but a boot that timed out can leave
+        // it still appending.
+        dma_mb(Read);
+
+        let mut snapshot = VVec::zeroed(LOG_BUFFER_SIZE, GFP_KERNEL)?;
+        io_project!(self.0, [build: ..]).copy_to_slice(&mut snapshot);
+
+        Ok(snapshot)
+    }
+}
+
+/// The log buffers of a GPU, for as long as it is bound to the driver.
+pub(super) struct LogBuffers<'a> {
+    /// Device the buffers belong to. Also names their debugfs directory.
+    dev: &'a device::Device<device::Bound>,
+    /// Init log buffer.
+    pub(super) loginit: LogBuffer<'a>,
+    /// Interrupts log buffer.
+    pub(super) logintr: LogBuffer<'a>,
+    /// RM log buffer.
+    pub(super) logrm: LogBuffer<'a>,
+}
+
+impl<'a> LogBuffers<'a> {
+    /// Allocates the three log buffers of `dev`.
+    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        Ok(Self {
+            dev,
+            loginit: LogBuffer::new(dev)?,
+            logintr: LogBuffer::new(dev)?,
+            logrm: LogBuffer::new(dev)?,
+        })
+    }
+
+    /// Creates an initializer exposing these buffers under a directory named after their device.
+    pub(super) fn scope(self) -> impl PinInit<debugfs::Scope<Self>, Infallible> + 'a {
+        let dev = self.dev;
+
+        let log_parent: &debugfs::Dir = crate::debugfs_data(dev).root();
+
+        log_parent.scope(self, dev.name(), |logs, dir| {
+            dir.read_binary_file(c"loginit", &logs.loginit.0);
+            dir.read_binary_file(c"logintr", &logs.logintr.0);
+            dir.read_binary_file(c"logrm", &logs.logrm.0);
+        })
+    }
+
+    /// Preserves whatever the GSP logged, so it can still be read once the GPU is gone.
+    ///
+    /// The buffers are DMA allocations of the device and cannot outlive it, so their contents are
+    /// copied into memory owned by the module and exposed through fresh debugfs entries. Those
+    /// live until the module is unloaded.
+    ///
+    /// Does nothing if `gsp_keep_logs` was not set when the module was loaded, as there is then
+    /// no directory to put the copies in.
+    fn retain(&self) -> Result {
+        let data = crate::debugfs_data(self.dev);
+
+        // The directory is taken here and the lock dropped again right away: what follows
+        // allocates 64 KiB three times, and no other device should have to wait for that.
+        let Some(dir) = data.retained_logs().lock().dir.clone() else {
+            return Ok(());
+        };
+
+        let logs = RetainedLogBuffers {
+            name: CString::try_from_fmt(fmt!("{}", self.dev.name()))?,
+            loginit: self.loginit.snapshot()?,
+            logintr: self.logintr.snapshot()?,
+            logrm: self.logrm.snapshot()?,
+        };
+
+        // Nothing was ever logged, so there is nothing to keep. A copy from an earlier run of
+        // this device is deliberately left alone: logs from a run that failed are worth more
+        // than the silence of one that did not. A run that did log something does replace it,
+        // even where what it replaces came from a run that failed: nothing here can tell the two
+        // apart, and keeping the older copy would mean never seeing anything newer.
+        if logs.loginit.is_empty() && logs.logintr.is_empty() && logs.logrm.is_empty() {
+            return Ok(());
+        }
+
+        // Make every allocation of our own that can fail before the previous copy of this device
+        // is dropped, so that none of them failing can leave it with no logs at all.
+        let scope = KBox::<debugfs::Scope<RetainedLogBuffers>>::new_uninit(GFP_KERNEL)?;
+
+        let mut retained = data.retained_logs().lock();
+
+        retained.gpus.reserve(1, GFP_KERNEL)?;
+
+        // An earlier run of the same device may have left a copy behind, and its directory
+        // carries the name about to be used again, so it has to go first. Nothing below can
+        // fail, so the replacement is guaranteed to take its place.
+        retained.gpus.retain(|gpu| *gpu.name != *logs.name);
+
+        let scope = scope.write_pin_init(dir.scope(logs, self.dev.name(), |logs, dir| {
+            if !logs.loginit.is_empty() {
+                dir.read_binary_file(c"loginit", &logs.loginit);
+            }
+            if !logs.logintr.is_empty() {
+                dir.read_binary_file(c"logintr", &logs.logintr);
+            }
+            if !logs.logrm.is_empty() {
+                dir.read_binary_file(c"logrm", &logs.logrm);
+            }
+        }))?;
+
+        retained.gpus.push(scope, GFP_KERNEL)?;
+
+        dev_dbg!(self.dev, "GSP-RM log buffers retained\n");
+
+        Ok(())
+    }
+}
+
+impl Drop for LogBuffers<'_> {
+    fn drop(&mut self) {
+        if let Err(e) = self.retain() {
+            dev_warn!(self.dev, "failed to retain GSP-RM log buffers: {:?}\n", e);
+        }
+    }
+}
+
+/// Copies of the log buffers of a GPU that is no longer around.
+struct RetainedLogBuffers {
+    /// Name of the device the buffers came from, which also names their directory.
+    ///
+    /// A copy rather than a reference to the device, so that a GPU that is gone does not stay
+    /// allocated for as long as its logs are kept.
+    name: CString,
+    /// Contents of the init log buffer, empty if it was never written to.
+    loginit: VVec<u8>,
+    /// Contents of the interrupts log buffer, empty if it was never written to.
+    logintr: VVec<u8>,
+    /// Contents of the RM log buffer, empty if it was never written to.
+    logrm: VVec<u8>,
+}
+
+/// Log buffers of GPUs that are gone, and the debugfs entries exposing them.
+///
+/// The copies live under a `retained` directory of their own instead of next to the entries of
+/// the GPUs that are actually bound, so that a device coming back does not find its name taken.
+pub(crate) struct RetainedLogs {
+    /// One entry per GPU.
+    ///
+    /// Declared before `dir`, as the copies live below it.
+    gpus: KVec<Pin<KBox<debugfs::Scope<RetainedLogBuffers>>>>,
+    /// Parent directory of all copies. `None` unless retaining was asked for.
+    dir: Option<debugfs::Dir>,
+}
+
+impl RetainedLogs {
+    /// Creates an empty set of retained log buffers, retaining disabled.
+    pub(crate) const fn new() -> Self {
+        Self {
+            gpus: KVec::new(),
+            dir: None,
+        }
+    }
+
+    /// Creates the directory the copies will live in, enabling retaining.
+    ///
+    /// Does nothing without `CONFIG_DEBUG_FS`, where a [`debugfs::Dir`] is a zero-sized type and
+    /// the copies could never be read back.
+    pub(crate) fn enable(&mut self, parent: &debugfs::Dir) {
+        if !cfg!(CONFIG_DEBUG_FS) {
+            return;
+        }
+
+        self.dir = Some(parent.subdir(c"retained"));
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 08509f64770e..14509d764d0b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,6 +8,7 @@
     driver::Registration,
     pci,
     prelude::*,
+    sync::Mutex,
     InPlaceModule, //
 };
 
@@ -46,6 +47,11 @@
 /// Reached from a device through [`debugfs_data()`].
 #[pin_data]
 pub(crate) struct DebugfsData {
+    /// Copies of the log buffers of GPUs that are gone.
+    ///
+    /// Declared before `root`, as the copies live below it.
+    #[pin]
+    retained_logs: Mutex<gsp::RetainedLogs>,
     /// Root directory of the driver in debugfs.
     root: debugfs::Dir,
 }
@@ -53,8 +59,18 @@ pub(crate) struct DebugfsData {
 impl DebugfsData {
     /// Creates the shared data.
     fn new() -> impl PinInit<Self> {
+        let root = debugfs::Dir::new(c"nova-core");
+
+        // Deciding here, rather than when the first GPU goes away, keeps the teardown path of a
+        // device from having to create anything.
+        let mut retained_logs = gsp::RetainedLogs::new();
+        if module_parameters::gsp_keep_logs.value() {
+            retained_logs.enable(&root);
+        }
+
         pin_init!(Self {
-            root: debugfs::Dir::new(c"nova-core"),
+            retained_logs <- kernel::new_mutex!(retained_logs),
+            root,
         })
     }
 
@@ -62,6 +78,11 @@ fn new() -> impl PinInit<Self> {
     pub(crate) fn root(&self) -> &debugfs::Dir {
         &self.root
     }
+
+    /// Returns the copies of the log buffers of GPUs that are gone.
+    pub(crate) fn retained_logs(&self) -> &Mutex<gsp::RetainedLogs> {
+        &self.retained_logs
+    }
 }
 
 /// Returns the data the module shares with its devices.
@@ -110,6 +131,12 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    params: {
+        gsp_keep_logs: bool {
+            default: false,
+            description: "Keep the GSP-RM log buffers in debugfs after their GPU is gone",
+        },
+    },
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.55.0

