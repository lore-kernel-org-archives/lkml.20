Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152885;
	b=NkihF1QcY69MbBLaAkqsb/6rsaUtCWsMsZNsDyEyxEMUozda+ZovRAymiUV/GjJSKgLG
	 dCfboQhFghYK+0gtl+sUHPqdP1trUklwKVc3oeOMjvjt2DaLc0GtSauJfajrziqSkSLX8
	 JVU6qO3zkguE5PNc3Qkg/T8g9SCzKDRn+OwK5m714S3Gfo1DsUEvpCKnMRr8Bo2YkXZxn
	 peRtthltLK14tIJJonoHYMfMBvT4XPbWLioFAuqSb1sJ+bvkwnAi+2PH7iTC+PlE/NfXW
	 pmxxqr43IxvNIBXoC08P/zgnWLidafwztuPeBFOpZ1nTDknRQ3v07ypMEuoUaMXsIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
	b=DltHNHRdndmvqXG+ewYCd1BALDVZx5/ab9zj7PWQokfPUVSv99NgUoH3mLi6HTgKX6gx
	 nuEaFCRYJGRJpI4CoFIjthNv6Im1U3oSAb7FhrZTc2soCyMyZDHgbIN4pLvh2yeP/Mb4Z
	 BidcdlCpVCu0V9ynzL6RstET9QHM7YJJvnM1qCEsVBBnc6PmUSb/2Y2ASSvE1kbXTG4WM
	 K5A3Jdco9VwC0+bkMgQgSn0zMmL3nje25Wh0rAWkUU/T11I+dQrXuM+0pGgjCpnvUy4mE
	 oWll2UbVbzM2NyJ9nzUvewTNGVxUxf3W8d04cS+G23avvMvN3jcI1+4b7uBO/HsQ+sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCIFldmf;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B1C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCIFldmf
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so257162a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152884; x=1793757684; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=lCIFldmfP54RPVAjjtNc9qiWIwAu96Ler5NV3AdyWKulpIjTPxzytOZEb8rGpsMO/y
         ron+8M/MtQ1TRSJNpf9BC3HGCjebHu5rf/O6Q8pmDiZgJ71/Bryi9rW9gg14yYEXBzrQ
         Fsx7IXsJpIY1Fe2WxM+PCgfBR5ksQVVA2vz2TmGCb1hOrB6fPDJ9bEkdxW8RuUz7bhyF
         0fjymOQPJ72FD/EphsmdofcfiJlgiHbrxOBoeEqLYHinlzeiB8CkXWZ5NGvDz8DjliWm
         RV82mrK/0O3I1geD36XwqCdU0MWFH8YJKyiYT7qV87inCrZMbY5XttjnettMDtOEPaP2
         tsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152884; x=1793757684;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G75y1YLNoCtbZmx1sascr2IuvagtUn76+vozuZ2IkZQ=;
        b=gp2CyFNR+sM3E5Oe7Ir8t+YheUt960v10SBBUq8PBChu97uckTp9Cb6bW2g8tR053W
         Z3TV9VNpyDpgCF94svL/w+xVdEFgAZl56F8N3DFxOy/7V9LFuW2TCQcK1gpkMETucbOl
         KHqHPBYo5feHDvVB/ZoKmiVvNh/pFiQZjH7DJSxGxn08WcNHxc3WSyJJykGSxy7ktPve
         +xQVZf5H7RSmlu4764x42pgRt5TAspqPIUn4R1MfnuD6dXLW+GvJhkV1o7C3gVu4Niqb
         ig+umUM7uguDbvp059z4N/GKNOCpNbZdmJy6v6/+v7vqxMmikkPJr+VKaDtb1en9fgCO
         2PQw==
X-Forwarded-Encrypted: i=1; AKwUvBxZsYbhRacRsyi0k59YYigUWDMGg0kXc3auEmbGREZtHjMxOx6w/hJtNTx3wS9b22gtMKyC4BAx4zrT4IA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCGcC9M14MZy3K6R7i68dholIl7ws1r0mp2RUKjhID/rkVEdsc
	2ocObwE2nTfaNxBl1LCXMAv0P9dmczGbkX2oiMyxRNOOeR6pmub1ripp
X-Gm-Gg: AYBFou2pzfa1ZljXbkd9imJWIuo6vlx5UUAQBj/Q9/tKFxp5FhvrNHBe2xSTc2PDt6i
	rEdk0nJ8ABg6qT52jXbzsqGo5PMhyLR7Vl6QhaybilXXW6141VnNph6ZnVx26y9Iu4dSV/sOX5W
	rjsTWr6+8stmcAsOorQ4PXbZLbiU8IP6qin0YuZ5eCO4FVvtH+yExQ33taSO/3BzZV8iSaOMWu0
	ef0RAvM7QN74Eu5PZcr6XjE5Q7NjW9nyLR4otHZTQiXHUXeok3BC7diUugJULFeBHSV+LaYrSA9
	/JIq6Jegc1fJcL8rQ4qdUAzuPDqYX098GVuaQMHT8YDczXPH6vnuigO9b5cxPaULFBvH1PxvCEz
	2mpjOtPCb8dKf+e3DY4IbMsnT3er2Aj0uqUd+xkDPxWLDUqObtPf2fVQ7mA45Hi19X1RyjQ5HlH
	vrolcRg33zY7QfZS+Pl4bo9lf9XhxK4IdwYD63q+ii4tFbpMOQ+FwVNNhBkkOEgUgO5CR1gkAEr
	k7Sj8gX4fcfBGQK/Mc4AaHG1WmaCOb3SkeDA/8IpZg7oasfIN2Cf2I=
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr499438a91.63.1793152883883;
        Tue, 27 Oct 2026 19:01:23 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d5efe2sm659155a91.1.2026.10.27.19.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:01:22 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Tue, 27 Oct 2026 22:00:48 -0400
Subject: [PATCH] rust: io: mem: Fix exclusive MMIO region requests
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE9X4WoC/x2NuwrDMAwAfyVorsA2zoP8SungpLKjwXaR0hII+
 feYjnfD3QlKwqQwdycI/Vi5lgb20cG6hZII+d0YnHGDNW7ExaN8dUeumTJW4cQFc9CdBCMfOE1
 9tBSc93GBVvkINf0/PF/XdQNf69Q/cQAAAA==
X-Change-ID: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kwanghoon Son <asdfkwang@gmail.com>
X-Mailer: b4 0.14.2

C's request_mem_region() reserves MMIO in the global resource tree.
Rust's ExclusiveIoMem reserves it under the device's resource instead,
so the global tree may not see the reservation.

Request the region from iomem_resource, matching request_mem_region()
and the existing release_mem_region() call.

Fixes: 1d0d4b28513b ("rust: io: mem: add a generic iomem abstraction")

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
The bug can be reproduced with QEMU arm64 virt's existing DT node
(CONFIG_FW_CFG_SYSFS=n):

    fw-cfg@9020000 {
        compatible = "qemu,fw-cfg-mmio";
        reg = <0 0x09020000 0 0x18>;
    };

A small Rust platform driver matches this node. Its probe maps the
resource and returns the mapping as driver data (excerpt):

    let io = pdev.io_request_by_index(0).ok_or(ENODEV)?
        .iomap_exclusive()?
        .into_devres()?;

Unbind and bind that driver again:

    cd /sys/bus/platform/drivers/mmio_repro
    echo 9020000.fw-cfg > unbind
    echo 9020000.fw-cfg > bind

Before the fix, unbind prints "Trying to free nonexistent resource"
and bind fails with EBUSY. With the fix, 100 cycles pass. This was
repeated in three fresh guests for each kernel.
---
 rust/kernel/io/mem.rs      | 2 +-
 rust/kernel/io/resource.rs | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index 32a919099dcda79bc4b795a8a1c5f553c989b9b7..80da665821c036257900c6ea45b9419cb573c187 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -196,7 +196,7 @@ fn ioremap(dev: &'a Device<Bound>, resource: &Resource) -> Result<Self> {
         let size = resource.size();
         let name = resource.name().unwrap_or_default();
 
-        let region = resource
+        let region = Resource::iomem()
             .request_region(
                 start,
                 size,
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 758ce62b3cce33c14e1e4c56a793af0e00657aa6..c99a2530186fc56bdc3405adc15d0801b98eae08 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -79,6 +79,12 @@ unsafe impl Sync for Region {}
 pub struct Resource(Opaque<bindings::resource>);
 
 impl Resource {
+    /// Returns the global I/O memory resource root.
+    pub(crate) fn iomem() -> &'static Self {
+        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
+        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
+    }
+
     /// Creates a reference to a [`Resource`] from a valid pointer.
     ///
     /// # Safety

---
base-commit: 8a36f53fd5ec3eff01f1b637d42cbdc3821d0493
change-id: 20261027-b4-rust-iomem-origin-master-fix-885f1ea244fb

Best regards,
-- 
Kwanghoon Son <asdfkwang@gmail.com>

