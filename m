Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737580;
	b=Kkz7Hc1ytTAxNy8L773x/5mGzsmucEoOjHRrxodwFfTwQwL7NP4cUQW4+a4dM/kr6l6a
	 xFFzVzRfITReXxV2Y0iOHTSr+DLdRlrODvDx3GNPhHy3WuN22Ol/5BF/47D8J+SEaIu2P
	 RksNvHJO/BzdYfwWMxEPTk7WvdhH/oS6Qwqfmzb5V/4ETSWvSlHdG1KhyGFk70X2qCxox
	 9iBMWkcGDQL3OcyTZ7CaEVnFMmffaA0VOanQEAZCjUswxWk0soGWJ8m7aihvJ32zlH/7A
	 VlBFt8v8oKoqI3sFIk6l/7XwYSP7EUuYZYbNgI0B94HvZHiNN1VYEt0KCkI2CIMQIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
	b=NsGnHSmr7l+HXNg9ASHuxAaLQ8k28Y5nBgUJIllWISed5kEX1YdRBegGavIocmOCHO/f
	 YC8QpsIq/+yQiSoStGhK9wqP/mdRMV5GCH7Tlot3rgeFR6xmGOewt8QspXOwl6ntz3lcQ
	 mlkG5rgzopT/5fpoOEvUUBNecgzXYYd7SGt7GD5MMJmyC81/dU4x6q+0SfbKRInKako/D
	 HGxBeJpj7X1ekLBvEepagp7k/9l/VBYJ7C5YkNp3OutnsaW19XaD1BDG7nf9VhQ99O6EG
	 eh9vgmFwZXH/+LswNQTEO4sC2Wkd9ObRgNRCft/G5Ln1vzzqkLeWzv587VBChQPWbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fE4ppVfH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC60606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC60606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fE4ppVfH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4be28b82so395659f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737578; x=1793342378; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=fE4ppVfHoNB+tK/mqGsUIPIh5aoPUqkEgxSn5Cj0FGM6quF2/uIzJwCvKtU8WG0mA0
         L136++YEFUA20TrKOmLvLaZaj0ijNsm/68oJFMCLZ2CHmV3e6eEeowGJ92nFJ8PaIkEj
         XWpX535koWVdyGgFkzx4GOWmijDVt6xKotlPNi5EM2IUJcAuelwuZkclNyNBfh3hsICi
         +gY9vo0jJLA0wLRR1PxXK6+TYqbqBtBlVDIw2r+i5h1CRSatAwgzJFEacYctpAKlKZQk
         ctMuNg1Y/wJvHQRMdpMmJusE1FAITXAGuf1TFMpQk33y34iWeuc9P7zaKuKz6SDDn8tr
         223A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737578; x=1793342378;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=MGsuM97PiKn73m+gSetdzgQuZHa2mqv/JCyKKqwrExyZcOUIgwTrFNsHljd8OlkR56
         muPCj7pjp89b3DaOIsrZ7He3dIZebZ3a5Dxo5jMSLDgagHHNyqyibXLDWSQoqmXh/5qQ
         yiW8ygAD/SF0wbJ0OLpUjovzaHgUx2L74dcP5fUDajRkBuc9/x3Eq7m0DYQ4sbBfifce
         ZyhHY1t16BvQgCHc8AXAfzIr+wLQp+AwBtnyuYFhbihQNqrxwaZ1xKDzhNERr64sQIHv
         eia0HKTvOFNETCsg2blQ/AtsiGLN0dcShSfYxbEIiDY2DvExROAeYn7U8xoA3n+zG6Yr
         o7lw==
X-Forwarded-Encrypted: i=1; AKwUvByxSjI1Aynm6bxjpKLwJTb2a+h8zVcI0LZevJ+R4aUwDIqFJ/G+jeAsCFkSQ9uejkCIbnnuBTV6WwKTHkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK5cFUgW7DYGkTizNvIyRzkUw6nhfOGcCf9vVCTnuIRAlVbP0R
	GXqOXnGr2+LPd1w+Oiv2xcbBSjXK3vnzhZoTGTRS1KyOrD/XgnQJt/37
X-Gm-Gg: AYBFou2IUCMHHbTgE16YW88cX9OqTutB9+lt0vLBT6haRRohhLBZd2Yy56nuDnoBeq2
	1ovfKBF4VAGYmHKp+u+LRxxbXy/b2nDf++GX2n2Mt5Ee5NcWAFByJS9hDHbpo6jHB3DBPAGRRfZ
	jBoNWGZ8ust9NlIcAGZQNmluGLgxb38rM5paANjxI2uq1LyTK1H2XK6LBQaAE4Mwp12dPxSoY+X
	gvrhFo/15HibS5/GdgoSfzjIEQbV/IwSj/7mAiIvCUDM7rFOq8J06juQ8vq9LaOh0gPGjs0gs5/
	gRhakaMPN1YsT3pQuY12tbfOvrV2w+JXZ5mghQWnGRvh5yCHcd3XMkJy2r7kIcmQIqVBM60qwuu
	fpYKc7BAElWKhPmnueZFFm+flnTSGgYnJu2h+ekldV1m3/OJEezTq4V1YC6nVZlM+rSV9zIZ2jV
	lHPWgQtNMHcufb/cl9VNzjUXBNsKQvjzQJ3unzWfmbq/4xel2QqlPflEmqd6bdil61djiRtMdJN
	qbH9L62SPuc1tpaU3YNeaGCtw0d6sE3/Glwu/o/Q5fCmboY9CJyEtp8v9dxc/yv4XPWyLE+wdIx
	JKNY3vWJ8OaSp9qg0eQx2alKD9cgZUbSSBOdh88pCpq9qtc6KlLsG2n4JgDGZWxVdj7P68uS1gW
	YriA=
X-Received: by 2002:a5d:5f41:0:b0:48e:c84:5be6 with SMTP id ffacd0b85a97d-48e3859498fmr1687114f8f.14.1792737577617;
        Thu, 22 Oct 2026 23:39:37 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:34 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/16] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Fri, 23 Oct 2026 08:39:25 +0200
Message-Id: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB0B22oC/2WMQQ6CMBBFr0JmbU3bwZK64h7GRQOjzAJq2tqoh
 LtbWBgTlm/mvzdDpMAU4VzNEChzZD8VwEMF3eCmOwnuC4OW2kilUKTBjRQFYq1043RvVQ9l/Ah
 049cWulwLDxyTD++tm9V63SWyElJYi1aWh8Wma5Mf6Zn546M/TpRgDWX9L9c/WReZbO2MQUPyJ
 Pfysixfz8MqRN8AAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

This series adds a new DRM accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S (the only SoC
currently supported). These can be used as accelerators for various
workloads, including machine learning inference.

This driver attaches to the DSPs through remoteproc and talks to the
firmware running on them through shared memory and a mailbox. The
firmware is the accelerator's command processor: the driver pushes Jobs
onto a per-core Ring in shared memory and rings a mailbox doorbell; the
firmware runs each Job's Kernel in the DSP's user mode on the client's
own page table, moves a Fence when the Job is done and rings back.

The kernel driver itself allocates buffers, manages contexts and submits
jobs to the DSP firmware. It also populates the per-client page tables
with io-pgtable-arm.

No carveout holds buffers any more: every buffer is the kernel driver's,
page-backed and mapped through the DSP's MMU in the client's own page
table, which answers Andrew F. Davis's question on v2. The one reserved
region the driver uses is the first 256 KiB of the IPC pool, where the
handshake, the Ring and the Context table live. A buffer that a DMA
transfer names must be physically contiguous, since the DRU does not
go through the MMU; the client asks for that at creation.

If there is more than one C7x DSP core, the driver will load balance
jobs between them with drm-gpu-scheduler.

The firmware isolates clients by using its MMU to protect their memory
and by running their kernels at a lower privilege level.

Besides executing user-generated DSP kernels, the firmware can also
execute DMA transfers at the request of userspace. These don't go via
the MMU, so are validated by the kernel driver.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames-firmware/ mostly under the MIT
license. The ABI with the firmware is defined in a shared header with
versioning.

Known limitations of this version:

- Runtime power management is not implemented (system suspend and
  resume are).
- The J722S EVM does not resume from s2idle with TI's shipped
  system-controller firmware, so the resume path ran only in the
  driver's own tests; the suspend path ran on the board.
- The submit IOCTL waits on no sync object, which a Vulkan driver will
  need.
- The 4D block move is the only DMA transfer type accepted.
- One firmware image serves both cores; a core found running another
  firmware is left out after the handshake's five seconds.
- The DRU channel stride is stated for the J722S instead of queried.
- The J722S is the only SoC this version runs on.

Three additions were needed in the device tree bindings:

- power domain references for the two SoC timers the DSP firmware
  drives, which the remoteproc driver does not hold;
- a second mailbox doorbell, since remoteproc's own serves rpmsg and
  this firmware rings the Ring's; and
- reg entries for the AUX SRAM and the DMA engine's registers, which
  the driver maps into every client's page table.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v3:
- Shared-memory ring and mailbox doorbell replace rpmsg
- The kernel driver writes the client page tables
- Buffers are bound at userspace-chosen DSP addresses
- Kernels run in the DSP's user mode; faults reported per job
- DRU transfers submitted by userspace, checked and translated by the kernel driver
- System suspend and resume
- Versioned firmware ABI; hardware ID reported and checked against the SoC
- Firmware rewritten bare-metal, MIT
- Link to v2: https://lore.kernel.org/r/20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net

Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Suman Anna <s-anna@ti.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Tomeu Vizoso (16):
      dt-bindings: remoteproc: k3-dsp: Add the L2 auxiliary and DRU regions
      dt-bindings: remoteproc: k3-dsp: Allow a second sub-mailbox
      dt-bindings: remoteproc: k3-dsp: Allow referencing the timers' power domains
      accel/thames: Add header with IPC definitions
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Create a context per client on device open
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add support for submitting DMA operations
      accel/thames: Add IOCTLs for job creation and submission
      accel/thames: Recover from faults and timeouts
      accel/thames: Add IOCTL for memory synchronization
      accel/thames: Install memory mappings populated and dirty
      Documentation: accel/thames: Add initial docs
      arm64: dts: ti: k3-j722s: Add the AUX L2 SRAM and DRU regions
      arm64: dts: ti: k3-j722s: Add second submailbox to the C7x cores
      arm64: dts: ti: k3-j722s: Reference the power domains of the C7x timers

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/thames/index.rst               |   47 +
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |   33 +-
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   16 +-
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |   27 +-
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    4 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    3 +-
 drivers/accel/thames/Kconfig                       |   27 +
 drivers/accel/thames/Makefile                      |   12 +
 drivers/accel/thames/thames_abi.h                  |  238 ++++
 drivers/accel/thames/thames_core.c                 |  867 +++++++++++++
 drivers/accel/thames/thames_core.h                 |  120 ++
 drivers/accel/thames/thames_device.h               |   97 ++
 drivers/accel/thames/thames_drv.c                  |  554 ++++++++
 drivers/accel/thames/thames_drv.h                  |   67 +
 drivers/accel/thames/thames_gem.c                  | 1077 ++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |   77 ++
 drivers/accel/thames/thames_job.c                  | 1319 ++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |   81 ++
 drivers/accel/thames/thames_trace.h                |   77 ++
 drivers/accel/thames/thames_transfers.c            |  405 ++++++
 drivers/accel/thames/thames_transfers.h            |   52 +
 include/uapi/drm/thames_accel.h                    |  843 +++++++++++++
 25 files changed, 6043 insertions(+), 11 deletions(-)
---
base-commit: 1ecab8b0bad393750c60cc3819ce9c256595463c
change-id: 20260113-thames-334127a2d91d

Best regards,
--  
Tomeu Vizoso <tomeu@tomeuvizoso.net>

