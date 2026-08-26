Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D21353A96
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762379; cv=none; b=gV/i7adfareNCPVAQB5Bn4F+PzH8alZNYRLsRxnuvaaOAbKOdvz+8RhtQNmqKzFBD1RczVnfjzAvmBrERNupqOaj/MDYuPGYGvRiiSmfctoOyJEsM89yW9kWDvNhEE9VaLLRobnKb4N8ltrrLxKaQNbSrUX+D4ef1ngRvW5Q3Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762379; c=relaxed/simple;
	bh=tR8esIP1LNDqU/4n/eI3JSgsSgcrNVfWqvsyadGtjCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJa7nCFzmCPyw/ljR6fwYUDGp2IUDxd0cU7tjk1A0pFxHLNB/IG4TbnsuCLFBdU3W2k1cntk1bW3oTUJ2V9dZrGvte1ADWb8Xr+f0AnwliM7nNV5ukmFLwzLZDtSkJTyV95fLemtoZ3B0DLJfiWDOs1iKtYPoT/C9K74pxCMf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Tn/4Zar3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Tn/4Zar3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso741155e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762367; x=1788367167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHwEIe3ApZAukwk8cJYOHMlUqzV23ND3olo6PKKeC74=;
        b=Tn/4Zar3rOGbGVGOZ0aFv6jTwvAFrn7Tl+9S9oOvLHj+TBn6KfsD1vC+EDKNhzhi2r
         SJnpZpoo7+o7XO6ZjxkiS7J0AN44O8pUXJaeV/FxVFIPxaRXy7gdfP5i8EV9j3lFIKjZ
         uhaJyi35zcmufxvZOMBamlp56mCVwOXsl8/zGV1GUyxu4BHban7qC7g2O0T53ukWSUmT
         8ODYMHG1Sm07RndilPMi25/9ETpBd9Ge+VMh/tbDHRrZi4SMycYpVsI3JliqkDcQ3nhN
         qgYe74aun7vx/JsJY9Iv/KxdgB0UoA/CIqIBYha2BN+0eUVtgxqHJPzmQu7ZW/FwZ3f/
         xvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762367; x=1788367167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHwEIe3ApZAukwk8cJYOHMlUqzV23ND3olo6PKKeC74=;
        b=e99Qj0JwrfdeB8D4Ae50MyamURmJ6YE5xwL0IdKNcTTrDjIUeHX2St1DrN98GYLmCa
         RsS9LLp/FhU+v7ySkyRlH8O51Gipx1ophOwNVf/V+y4IhrTxaILD/6xDszPjH+gZbDRR
         X3K2Dcg5poDgLzcYkGFeZq8I1uNz/bQDBHDkOye59gE8CZAuGYpft4JHjYuYDDhdEppF
         yP6IXb6JCW9HcKC9oSg1Cv9d0nasH3fOzowPbrpJKZt+Av7z4Y9LD531q2TpcuXQdG0K
         rdTWntpXcyml6ltS48aBx1WOs5J7S01uuR7Wq8rHAEscX7rfgjIcDY8svv+pQwgp6v1F
         4n+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoE9BdRaGH8jYgIN3ctlj6cdFz78K/Fh44aQPEThQUAjD0h5BuYv5IkXSj+s29yfWUqeSSqwHb1p3M2pmY=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Oes3MA2Fxd+ZDXU2MpWY9nA9zz6FiwCFXoDGTFxxKKE6vzOQ
	+CyPA7zUNtOhKE3E6NNjnjAgDh3FZwvqMpdmRkAOqahuOVT0fL0jYZB8km8wfp0ITQ==
X-Gm-Gg: AR+sD11HkQYuXEWTbvzN8z3yI3Vi9e7STZGFDWfP+gyvb0WR//JSH4ilBys9fEh1CL/
	0G+pfxODVSaTRwC/plqbIoorlWv1Eo0dozg6b9iMhr/Djcpfid1Ea5pyxw6N0Hi8e/C0yw2R5ra
	NLFJmRragv21xp+sSvhZw6sVReSum5PBT+KfXCt0eoLc1skk7FnikZsi6nfaq4sGGwZrxurrFZ8
	xDmTp6Fi1d+/pJq+nis1KY0koXbB0ceuz9DLi2V9SbpuLP0DFjS4/Zk+Jb/3ula0INGRxCcnlh0
	HwkMTrZ5TSBS1BwVMP6QI557YAxw+9PhI4Qj5q08bK0V0LPS7iA90nKDc1t+mywJM43B6ApgCql
	uj/y1EtqmyVNeUigahkuLEgaO6hoIT775y1qRrMDv3VDuAhD9OW2iDNHj48suKREQdnDGYuTFqC
	Os7R5XwaisED/ZHGWqsGgkOy+etoa/+LgOIP97BUgFdKFnm3jOzYKGXy6QKuDOV0yJaZ4dOW3Y8
	lZ+xDvdy1gtR6JbHyQPKjsIIp5scGTReg6J
X-Received: by 2002:a05:600c:4505:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499dc6e9935mr70406525e9.1.1787762367315;
        Wed, 26 Aug 2026 09:39:27 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm21769715e9.4.2026.08.26.09.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:39:25 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/13] drm/vino: add the USB transport
Date: Wed, 26 Aug 2026 17:37:27 +0100
Message-ID: <20260826163913.7052-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163913.7052-1-mike@fireburn.co.uk>
References: <20260826163913.7052-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dock exposes control on a bulk pipe pair, video on one or two further
bulk endpoints, and an interrupt endpoint the dock pushes on. A dock
generation differs in how many of those it has and in whether video shares
the control pipe, so the transport takes the endpoint numbers as data
rather than deciding them.

Add the link: a bound-interface wrapper that opens those pipes, submits
video as a queue of pipelined URBs, and reports a stall as a stall rather
than retrying into a wedged dock.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/vino/usb_link.rs | 250 +++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 drivers/gpu/drm/vino/usb_link.rs

diff --git a/drivers/gpu/drm/vino/usb_link.rs b/drivers/gpu/drm/vino/usb_link.rs
new file mode 100644
index 000000000000..04b9131d05ed
--- /dev/null
+++ b/drivers/gpu/drm/vino/usb_link.rs
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! The dock's USB endpoints, and the I/O handle every transfer goes through.
+//!
+//! [`Endpoints`] is resolved once against interface 0's descriptor and direction/type-checked, so
+//! the rest of the driver names an endpoint by what it is rather than by a bare address. A
+//! [`UsbLink`] can only exist while the device's [`usb::IoWindow`] is open, so a transfer cannot
+//! outlive the binding.
+
+use super::*;
+
+/// The dock's endpoints, resolved once against interface 0's descriptor and validated for
+/// direction and transfer type by [`usb::Interface::endpoint`].
+///
+/// Resolving up front means the rest of the driver names an endpoint by what it *is* rather than
+/// by a bare address, so a bulk-OUT transfer cannot be aimed at the interrupt-IN status endpoint.
+/// The whole set is [`Copy`] (each entry is an address plus a max-packet size), so it can be
+/// carried by value in a [`UsbLink`] rather than borrowed.
+#[derive(Clone, Copy)]
+pub(crate) struct Endpoints {
+    /// EP02: host->dock control-plane bulk writes.
+    pub(crate) ctrl_out: usb::Endpoint<usb::BulkOut>,
+    /// EP84: dock->host control-plane bulk replies.
+    pub(crate) ctrl_in: usb::Endpoint<usb::BulkIn>,
+    /// Per-connector video bulk-OUT endpoints, from [`DockProfile::video_endpoints`].
+    pub(crate) video: [usb::Endpoint<usb::BulkOut>; drm_sink::MAX_CONNECTORS],
+}
+
+impl Endpoints {
+    /// Resolves every endpoint the driver uses against `intf`'s active alternate setting, and
+    /// returns how many connectors the device actually backs.
+    ///
+    /// The control endpoints and the first video endpoint are required. The rest are not: a dock
+    /// in a known family with fewer outputs simply does not expose the later ones, and the count
+    /// that does resolve is the connector count. Taking it from the device is the difference
+    /// between supporting such a dock and refusing to bind to it, because a profile can only
+    /// describe the variants someone has tested. Navarro repeats addresses across connectors
+    /// (0/2 share `0x08`, 1/3 share `0x0a`), so this counts entries rather than distinct
+    /// endpoints, and the profile's own count remains the upper bound -- four resolvable entries
+    /// on a two-connector Ridge dock still means two connectors.
+    pub(crate) fn resolve<Ctx: device::DeviceContext>(
+        intf: &usb::Interface<Ctx>,
+        profile: &DockProfile,
+    ) -> Result<(Self, u8)> {
+        let mut video = [intf.endpoint::<usb::BulkOut>(profile.topology.video_endpoints[0])?;
+            drm_sink::MAX_CONNECTORS];
+        let mut connectors = 1u8;
+        for (slot, addr) in video
+            .iter_mut()
+            .zip(profile.topology.video_endpoints)
+            .skip(1)
+        {
+            let Ok(ep) = intf.endpoint::<usb::BulkOut>(addr) else {
+                break;
+            };
+            *slot = ep;
+            connectors += 1;
+        }
+
+        Ok((
+            Self {
+                ctrl_out: intf.endpoint::<usb::BulkOut>(EP_CTRL_OUT)?,
+                ctrl_in: intf.endpoint::<usb::BulkIn>(EP_CTRL_IN)?,
+                video,
+            },
+            connectors.min(profile.topology.connectors),
+        ))
+    }
+}
+
+/// A live USB transfer handle: an [`usb::Io`] token proving I/O is currently permitted, plus the
+/// resolved [`Endpoints`].
+///
+/// Obtaining one requires the device's [`usb::IoWindow`] to still be open, so a transfer cannot be
+/// issued after `disconnect()` has closed it. Carrying the endpoints in the handle also keeps raw
+/// endpoint addresses out of transfer call sites.
+pub(crate) struct UsbLink<'a> {
+    window: &'a Arc<usb::IoWindow>,
+    io: usb::Io<'a>,
+    pub(crate) endpoints: Endpoints,
+}
+
+impl<'a> UsbLink<'a> {
+    /// Opens a link on `window`, failing with `ENODEV` once the window has been closed.
+    pub(crate) fn open(window: &'a Arc<usb::IoWindow>, endpoints: Endpoints) -> Result<Self> {
+        Ok(Self {
+            io: window.enter()?,
+            window,
+            endpoints,
+        })
+    }
+
+    /// Opens the persistent EP84 control-plane reader.
+    pub(crate) fn ctrl_in_queue(&self, depth: usize, buf_len: usize) -> Result<usb::BulkInQueue> {
+        usb::BulkInQueue::new(
+            self.window,
+            &self.io,
+            &self.endpoints.ctrl_in,
+            depth,
+            buf_len,
+        )
+    }
+
+    /// Opens the pipelined EP02 control-plane writer.
+    pub(crate) fn ctrl_out_queue(&self, depth: usize, buf_len: usize) -> Result<usb::BulkOutQueue> {
+        usb::BulkOutQueue::new(
+            self.window,
+            &self.io,
+            &self.endpoints.ctrl_out,
+            depth,
+            buf_len,
+        )
+    }
+
+    /// Returns the canonical queue slot for `connector`'s physical video endpoint.
+    ///
+    /// A dock profile may repeat an endpoint address for multiple physical connectors (Navarro
+    /// uses EP08 for connectors 0/2 and EP0a for 1/3).  Those connectors must share one
+    /// persistent queue: separate queues could submit interleaved URBs to the same pipe.
+    pub(crate) fn video_pipe_index(&self, connector: usize) -> Result<usize> {
+        let endpoint = self.endpoints.video.get(connector).ok_or(EINVAL)?;
+        self.endpoints
+            .video
+            .iter()
+            .position(|candidate| candidate.address() == endpoint.address())
+            .ok_or(EINVAL)
+    }
+
+    /// Opens the pipelined video writer for `connector`'s physical video endpoint.
+    pub(crate) fn video_queue(
+        &self,
+        connector: usize,
+        depth: usize,
+        buf_len: usize,
+    ) -> Result<usb::BulkOutQueue> {
+        let ep = self.endpoints.video.get(connector).ok_or(EINVAL)?;
+        usb::BulkOutQueue::new(self.window, &self.io, ep, depth, buf_len)
+    }
+
+    /// The underlying I/O token, for the paths that open a persistent queue.
+    pub(crate) fn io(&self) -> &usb::Io<'a> {
+        &self.io
+    }
+
+    /// Writes a control-plane message to EP02.
+    pub(crate) fn ctrl_send(&self, data: &[u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.io
+            .bulk_send(&self.endpoints.ctrl_out, data, timeout, gfp)
+    }
+
+    /// Reads a control-plane reply from EP84.
+    pub(crate) fn ctrl_recv(&self, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.io
+            .bulk_recv(&self.endpoints.ctrl_in, data, timeout, gfp)
+    }
+
+    /// Reads the standard two-byte status word for a video endpoint.
+    ///
+    /// Bit zero is `ENDPOINT_HALT`.  This is deliberately read-only: it distinguishes a dock
+    /// which has stalled the pipe from one which is merely returning NRDY without perturbing the
+    /// endpoint's host or device sequence state.
+    pub(crate) fn video_endpoint_status(&self, connector: usize) -> Result<u16> {
+        let address = self.endpoints.video.get(connector).ok_or(EINVAL)?.address();
+        let mut status = [0u8; 2];
+        self.control_recv(
+            0x00, // USB_REQ_GET_STATUS
+            0x82, // device-to-host, standard, endpoint
+            0,
+            u16::from(address),
+            &mut status,
+            timeout(),
+            GFP_KERNEL,
+        )?;
+        Ok(u16::from_le_bytes(status))
+    }
+
+    /// Sends the standard endpoint-halt clear without running Linux's host endpoint reset helper.
+    ///
+    /// Navarro uses this only during cold setup, before any video URB has touched the endpoint, so
+    /// the host sequence state is already its enumeration value. The working DLM wire transaction
+    /// is two raw `CLEAR_FEATURE(ENDPOINT_HALT)` requests 12.647 ms apart followed by its vendor
+    /// commit 143 us later. `usb_clear_halt()` adds an xHCI endpoint reset after the request; that
+    /// made each Vino operation return about 18 ms late and changed this transaction's ordering.
+    pub(crate) fn clear_video_halt_wire(&self, connector: usize) -> Result {
+        let address = self.endpoints.video.get(connector).ok_or(EINVAL)?.address();
+        self.control_send(
+            0x01, // USB_REQ_CLEAR_FEATURE
+            0x02, // host-to-device, standard, endpoint
+            0,    // USB_ENDPOINT_HALT
+            u16::from(address),
+            &[],
+            timeout(),
+            GFP_KERNEL,
+        )
+    }
+
+    /// Recover a video endpoint the dock has stalled.
+    ///
+    /// Unlike [`Self::clear_video_halt_wire`], this runs the full `usb_clear_halt()`, which resets
+    /// the host side's data toggle as well as sending `CLEAR_FEATURE`. That reset is exactly what
+    /// a real stall needs and what the cold-setup path deliberately avoids: after a stall the host
+    /// and device sequence state have diverged, and sending the bare request leaves every later
+    /// transfer failing.
+    ///
+    /// Nothing else clears a stalled pipe, so without this one stall is permanent -- and on a dock
+    /// whose video shares the control endpoint it takes the control plane down with it.
+    pub(crate) fn clear_video_halt(&self, connector: usize) -> Result {
+        let ep = self.endpoints.video.get(connector).ok_or(EINVAL)?;
+        self.io.clear_halt(ep)
+    }
+
+    /// Issues a control OUT transfer on EP0.
+    pub(crate) fn control_send(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &[u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result {
+        self.io
+            .control_send(request, request_type, value, index, data, timeout, gfp)
+    }
+
+    /// Issues a control IN transfer on EP0.
+    pub(crate) fn control_recv(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &mut [u8],
+        timeout: Delta,
+        gfp: Flags,
+    ) -> Result {
+        self.io
+            .control_recv(request, request_type, value, index, data, timeout, gfp)
+    }
+
+    /// Selects an alternate setting on the driver's own interface.
+    pub(crate) fn set_alternate_setting(&self, alternate: u8) -> Result {
+        self.io.set_alternate_setting(alternate)
+    }
+}
+/// EP84 (dock-to-host) transfer size.
+///
+/// Replies larger than one transfer are delivered as consecutive fragments.
+pub(crate) const EP84_BUF: usize = 4096;
