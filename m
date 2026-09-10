Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E010382F26
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022194; cv=none; b=cAItzdkuEa0QIt+TJnvvvPf7qkVaF8YXrohkgSqDXYfrauFDRLkcHCVgQgaMpzFEGDsxNk26w8Kd54yj51jIoYVCanpSV8kzupbEp0bqzpvdIZu6a0Qbse3xY9Rx+ZyfoUFn6WpDDIwszcnfxlyTAmGOYrZpEKzdFhkMdudkAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022194; c=relaxed/simple;
	bh=BQVfQsaO8zDdrs4v9NiSLEpzSOAblHZoKnLFrlYE6kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SofIGs8v53RPEFJN9dMa+AVIacI33xKe9yTPy1DJbt0o046h+ER0B4Za0rfgRe5asLOa/qQnsNph7jncbUSdwuihQ/s6+UXUhW93Z+IzJlXCvxMGl2PHsCoBDu9WFzms/H4jHh1XEaEHi3rNPdyTJycEe3utIvP3JFPB/pWnsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahTKB04O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahTKB04O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so91507455e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022191; x=1789626991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QS/rswidDYc7zKh1QoD1+mqk8IZbOAibmQnAiC6jcYg=;
        b=ahTKB04OBrgLQCPG26e7q7KKxV7PoEDVN0bd4Ri7w3Fr8SVYZha+gcog+FUldPkv2R
         b7n3/pq0NgW1nkgPT78URPw2XgUWQJpiAZ0LDzF1B8kXq/jcVR76srqYlJXhjrMem2XN
         tbnFs4ZXvOvfPtTdEvT/R2EydNNGN1sHFuv4QyJiDKFNkxnv5bjthJOFzyewkeE2S4WI
         1T7Un0mz+YwBfV+BBzvT9ukwJx+s8qQ1V5+UnurQ2GpA6PZzkx043j1URGkEQIPsJVRJ
         Jvoh+dOd+2uOjYXE35ZKCr5m+AxKB1Pjo/2JQSULtDHZY8t/VgL12Fk8PnEFluxUGMzd
         s+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022191; x=1789626991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS/rswidDYc7zKh1QoD1+mqk8IZbOAibmQnAiC6jcYg=;
        b=Ar0hH/ma2BUNTy9hnC/wRyCDvlXM4gWlvtknEV+Q1ujKlk87BkYBjcmrEizyt3VYav
         0n9KTWwN/98KaCi2cTGhHbK9PNUTMRTQS9o4C1TOjoUbKN4gxPWHgvQewOG6Aj2hk4vO
         1/Gh0Rb6+4h/IqUHo3AJYPXDqvFZT584fzGSUBuWwypsFoEUNaJP9VYG/8WMbM9eRv+u
         i/pCqj3Xkr1kbeHHU/015t8plD+YfR6Az3zRi+F9Uxn7yMUPpJfJN8fVaeUzpee+k+Ki
         xt7M4QW9CC4guR27PSmmSJ2V15l6G8dwjVMEVU2zv9Cv1CeuSJzgjd7mcXbbSqq4frk+
         DVEA==
X-Forwarded-Encrypted: i=1; AKwUvBzpVdmuYKm3YSerDaTU9CpR4+niquRxWMo76ZXH3Sb9/Iu/vA7Rp+jTY3Yvi5/gRSwLBZ4+gseG1e4Sn8o=@vger.kernel.org
X-Gm-Message-State: AFuF++ku+3R6+1p38BQigqpxj6STiYTijoQX8xRBu7iJXoTIj1ykVJEN
	77Sg94GC8hP4BEVrHCOg0xWVrNsf9CFjra9x69dw29Q074RG53TPPYgW
X-Gm-Gg: AYBFou1BLAv5EWB1ApJuoUl28Cx3QhbCzf1wRlAPEoFENktJwpebLlx/h0YmDZlU9Tj
	/Xr7hK+VX0z5h1cJ1upvOHKx4aTgv6JSJSuQELaCj+4GtihxRHEnU6HfZtGSn3HfvtEQxSWAwbK
	PXFu1MmjHKI3NCDqq2ouIagA7RfOMzKl21F5NU79epaXLOd/N3YsjiepEG7JEvMOZvOCJqW+qxl
	U9Se09R0WOJoE5ljWaNThkkXt9BpC65iehDpvTK/OBYfyd35tS+lb2aXnOd4t7VrCE+RloOjM1M
	AmlbPAssxz74Ig438okBFDvWB1dHI46zXx5D0Uyxit1wU0OXfhzGmLa7GqyFLhQX4JUiBxUYjx8
	rjxaS1Eq3KGIdh+edqkdE3RhhaoRakRULDQ5+qB2QhqSSCp8fOB909R27I2DaE+NWNjn/wF0KtE
	cDHNxKmyitQ6p1HuinhCRL0f9ZdJNVGudXqHQb96MpI5JlOAEXeocBwIWV+GlX3/3TGcWJgas8s
	T1zMyhEby9DExxU6RQAjTYqnGLpVB5z4PsPDx3SUzlZ6z+b46fy+ELqJbcydNQhcmlM7rcyJl7l
	uf+O0KBEIAVSjTeNQCRPcHVfXgc5VDhr7jDEyYvV9iq7eUKL1Foi6DsDBtkaqHdIv3XEzUmWDok
	NY78O
X-Received: by 2002:a05:600c:19d0:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49d18405074mr152224855e9.23.1789022191188;
        Wed, 09 Sep 2026 23:36:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47766655e9.11.2026.09.09.23.36.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:36:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Date: Thu, 10 Sep 2026 08:36:18 +0200
Message-Id: <20260910063620.17768-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series prevents a DMA_FROM_DEVICE map from discarding CPU-written
buffer contents on non-coherent 32-bit ARM. It is based on
v7.3-rc1-324-g986c24e0fe44.

ARM currently invalidates these buffers before the device writes them.
If the device writes only part of a buffer, discarded dirty cache lines
can expose older memory contents in the untouched bytes. A stock USB
webcam demonstrated this through usbfs. Short isochronous packets left
gaps, and usbfs returned non-zero data to userspace from bytes it had
cleared.

arm64 changed this handoff from invalidate to clean in 2022 with commit
c50f11c6196f ("arm64: mm: Don't invalidate FROM_DEVICE buffers at start
of DMA transfer"). Arnd Bergmann's 2023 ARM32 cache-maintenance series
left DMA_FROM_DEVICE preservation unresolved [1]. This series keeps the
existing ownership hooks.

Patch 1 covers v6, v7, v7-M and the common outer-cache path. These paths
already invalidate when ownership returns to the CPU. Patch 2 makes the
legacy write-back backends use their existing clean-and-invalidate
operation at device handoff. Their no-op ownership-return hooks remain
unchanged, avoiding the additional completion traversal raised during
review [2].

[1] https://lore.kernel.org/r/20230327121317.4081816-1-arnd@kernel.org
[2] https://lists.infradead.org/pipermail/linux-riscv/2023-March/029740.html

Testing:

  - An ARM11 MPCore (ARMv6) in a New Nintendo 2DS XL lost 402,080 of
    409,600 CPU-written bytes in a mapping-only test. With patch 1, none
    were lost. The UP kernel used out-of-tree platform support and the
    same map-time invalidate as mainline.

  - On an ARM926EJ-S (ARMv5TEJ) SAM9X75, eleven mapping-only runs lost
    339,936 to 351,744 of 409,600 bytes with the existing code. Five
    usbfs runs checked 245,708 unwritten gap bytes and exposed 29,403 of
    them as non-zero. With this series, five fresh 100-iteration
    mapping-only runs on the same board each lost 0 of 409,600 bytes.

  - A Cortex-A72 running AArch32/LPAE did not reproduce the loss in 22
    existing-kernel runs. This does not establish whether other v7 cores
    are affected.

The one-pass series passed focused W=1 object builds for ARM926,
Feroceon, XScale, ARM940 and v7. The remaining legacy backends have
source review and compile coverage from the previous two-pass revision.

Neither patch adds a cache traversal. Patch 2 changes the legacy
DMA_FROM_DEVICE operation from invalidate to clean-and-invalidate. This
can add per-line work and memory writes on dirty buffers. Throughput and
CPU cost have not been measured.

Karl Mehltretter (2):
  ARM: dma-mapping: preserve DMA_FROM_DEVICE buffer contents
  ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends

 arch/arm/mm/cache-fa.S          | 1 -
 arch/arm/mm/cache-v4wb.S        | 1 -
 arch/arm/mm/cache-v6.S          | 2 --
 arch/arm/mm/cache-v7.S          | 2 --
 arch/arm/mm/cache-v7m.S         | 2 --
 arch/arm/mm/dma-mapping-nommu.c | 5 +----
 arch/arm/mm/dma-mapping.c       | 8 +-------
 arch/arm/mm/proc-arm1020.S      | 1 -
 arch/arm/mm/proc-arm1020e.S     | 1 -
 arch/arm/mm/proc-arm1022.S      | 1 -
 arch/arm/mm/proc-arm1026.S      | 1 -
 arch/arm/mm/proc-arm920.S       | 1 -
 arch/arm/mm/proc-arm922.S       | 1 -
 arch/arm/mm/proc-arm925.S       | 1 -
 arch/arm/mm/proc-arm926.S       | 1 -
 arch/arm/mm/proc-arm940.S       | 1 -
 arch/arm/mm/proc-arm946.S       | 1 -
 arch/arm/mm/proc-feroceon.S     | 2 --
 arch/arm/mm/proc-mohawk.S       | 1 -
 arch/arm/mm/proc-xsc3.S         | 1 -
 arch/arm/mm/proc-xscale.S       | 1 -
 21 files changed, 2 insertions(+), 34 deletions(-)

-- 
2.53.0
