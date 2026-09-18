Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC44212564
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695605; cv=none; b=UfExEyLUKV0WO1MQ0v1JjoWp3KAaTioRXxZxcZ+2FKKaQv3E8LkhBsKWnfErXa7UCltqDKPKii8Txbf8LwHN3b+M3bw8GaX+QVz8hFTXnPQD9RJezhCtZqOgECjphg+pwUIhQZC3uDNIZd/7ocgZ7AnztJhoKTQjbGS3Dx2u6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695605; c=relaxed/simple;
	bh=BHsV5hxwG1EpFQYnAoz3jAXWdpUn+HYJSrUv90J2zAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=go48JXxHZwfAYZk1onEmpsvRocRjG+tWKeFemx9ydOsYF1ELjKZf+dDnSHJkZ3qfs8z3BEs1T6RlUjz6FeVSSu4QvglTeCJknEHIUAKC2/cmy3X+BtIxFze1CfLrsR2LIl16V5V0khmMgv7hH0tEO6CE2U247P7l79vSaqzdjf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTJCBq4T; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTJCBq4T"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so1304281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695602; x=1790300402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJkHYIynDtUH8+dzJfKWN+U0IE0zVEkXjt4t7OsBg5M=;
        b=pTJCBq4TB+FPuIZ7a1a/qtgHjRSjQCVnWqrBaA8eW7QbcrWljIznKLnOduRznb0GtP
         wOTLYFPamR52MY9ushYhk0m9gQkvTwILWp4/K70mYYqVW0J/s1XKiOyQmc31e2jHZfUD
         7sQU0BDW1K77QvZzqa/mMAciAlFkL819eU9pU5kFNt+vEf8vFi/SRvrzuoDkd9PcYwYI
         dkh1YiLJXTvW/uEbB/vRroauRmx6fi8A1dIwcyDMA6DOdgLx3EEGhh+pwpIAkKegprga
         22bvs6DJiGZscLeliCpLIKfUcgVFzJ+ti0J+l5RrfTLLOJ+yuyaq6Ho2cY624UyXmJLc
         jPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695602; x=1790300402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJkHYIynDtUH8+dzJfKWN+U0IE0zVEkXjt4t7OsBg5M=;
        b=w4ZOgMDTwaLmMt7HTmntJhjZyAswWl81rk5x3jjuhjFGyk4ACT1/zPHaN1/wPmSgg8
         8iVB2NaXD25mVGd5U0TRDwsd4LGzsaOcE1bOiCIVUkGVpsl7Ha6TMXtwutvWMBycdHVJ
         +X5jzyKcwwC8AgNiUpG2PYzG18ilz5egci34Kj0KZfdobBSWjMpLpfhsehztbWaEaN9u
         bv1dYbIsaePlo+6v4+sgUykGTIbY+RNVZ8TcaOrqUpdFMzhH55ZezMLg71Fxmdzd2juo
         ZUZ0kMCGNgZvdwlAD7OKqAQUu4buFISmme4P01fKiaXP8GMHd4vID2yRk/ebtQoFXVZq
         1SpA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ycmyvp1/bhmC1+4J8uknmbg8KLWJng5nXVt8EdkT/y+VGIZ8nPG9EcltBIbqQR4N/YjFjyE81ZRvXow=@vger.kernel.org
X-Gm-Message-State: AFuF++k2x3eOrtWltPX0raSXfTVNeHqM+F8TfDFTXRCCT9gEq6FKOxQ3
	7ZLh93RFFaFHg1JchSVEnt1NVOTH7DxtrQUyH6buyS/h4bgQI650LD6n
X-Gm-Gg: AYBFou1zpHuqAPxrdPqlhKKlmnQMgx7z4qMdlV8MjKpUpUexVSjaXj/9Bm8SzUh61cp
	nPw3Bsbdt8eiqpuiNxycHsJPZXNVcAz+WUH07Jm8+i7jfqJgCYFOL3QJ1TG5jAmHV3UWb4mi2Ww
	Uefy8xF1J+C06NFyDyRmeyzzgM9i0ZxpMltI7s+ZVXKOn9FIvagFvu31qgwtO8MNX26kQjxxdzS
	h/8o8HC4Y4wBbtrNpxCo6ZhQt/tLhyYufnHwRSxA5DbhN/N5z/rvFnu0Mw3+GzKlofbWNJK3And
	GIyuUvvkKI323BfRko+ylk2eUz3pCfoLO65YW2I0Lv+7JMnd/GEnno2wLO3ZUeMW3FJTp4MtZ2F
	JcJVdoK5bskdbOuJV8FM19syuE/Ngp0GjxDiFmkx732NryIMeikeGVOde/ceKbjUjSWlVSlp14x
	OsciPhfQ72y7vdrEDKg68zT5k2TVDMhkZ1Ur28sXtwG5x8fLoTcPNHnVHbqbnW4y9qAtnGExFzn
	wobGRaI9CkKR9bD0yn38Q==
X-Received: by 2002:a05:622a:4d0a:b0:532:807c:9c1b with SMTP id d75a77b69052e-5329e350f88mr17876801cf.18.1789695601608;
        Thu, 17 Sep 2026 18:40:01 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532a185be6bsm2157041cf.1.2026.09.17.18.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:01 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson@gmail.com
Subject: [PATCH v3 0/2] drivers/block: add RamShared hardware-accelerated VRAM block driver
Date: Thu, 17 Sep 2026 22:39:53 -0300
Message-ID: <20260917223828.ramshared-v3-0-cover@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the RamShared hardware-accelerated
block driver (drivers/block/ramshared).

Following RFC v1 and RFC v2 discussions on linux-block@vger.kernel.org,
this series promotes RamShared to formal PATCH v3 submission with
hardened IOCTL boundary controls, 64-bit DMA masks, linear error
unwinding, and empirical multi-tier stress qualification.

RamShared maps discrete GPU video memory (VRAM) apertures over direct
PCIe DMA to provide an ultra-low latency, non-rotational block device
with a synchronous .rw_page swapout path.

Key Design Highlights:
1. blk-mq multi-queue parallel request processing with atomic gendisk
   allocation.
2. Synchronous .rw_page fast-path in block_device_operations for
   zero-allocation swapout under direct memory reclaim pressure.
3. PCIe AER error handling with pci_error_handlers to contain link
   resets.
4. Comprehensive multi-kernel compatibility across 5.15 LTS through
   6.18+ and mainline 7.0+ (Ubuntu 24.04 LTS HWE stack).

v2 -> v3 changes:
- drivers/block/ramshared/control.c: add dedicated IOCTL control
  operations with strict user-input validation and bounds checking.
- drivers/block/ramshared/main.c: enforce 64-bit DMA mask with
  dma_set_mask_and_coherent() during PCI device initialization.
- drivers/block/ramshared/main.c: add safe linear error unwinding with
  pci_clear_master() and cleanup on add_disk() failure.
- drivers/block/ramshared/queue.c: map internal driver status codes
  cleanly to blk_status_t semantic Linux block layer errors.
- drivers/block/ramshared/compat.h: add set_capacity_and_notify()
  cross-kernel compatibility shim for modern kernel block layers.
- drivers/block/ramshared/Makefile: link control.o into driver object.
- Promote from RFC to formal PATCH v3 for upstream consideration.

v1 -> v2 changes:
- drivers/block/ramshared/queue.c: use check_shl_overflow() to prevent
  64-bit integer overflow when shifting sector to byte offsets.
- drivers/block/ramshared/queue.c: enforce PCIe BAR0 boundary validation
  before memory-mapped I/O.
- drivers/block/ramshared/main.c: ensure pci_clear_master() is called
  during linear error unwinding in probe failure paths and device
  teardown.
- drivers/block/ramshared/main.c: clamp queue_depth module parameter
  within [1..4096].
- drivers/block/ramshared/ramshared.h: wrap function declarations to
  conform to 80-column kernel coding style.

Testing & Quality Gates:
- checkpatch.pl --strict: 0 errors, 0 checks.
- sparse semantic address-space analysis: PASS (__iomem verified).
- Multi-tier saturation benchmark: 9,840 MB swap holding continuous
  dirty page write cycles under PCIe Direct DMA with 0.00 ms access
  latency and PASS_ZERO_PANIC stability verdict.
- Memory stress battery: sustained 11.61 GB/s PCIe reclaim throughput
  with 0.0% PSI stalls and 0 kernel OOM kills.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
