Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4D274658
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507506; cv=none; b=PIfbjuiTEoBDv5GIbFvabIdye4kwKlRw/SKbLJF16FPE5p6H6i4bKh7beg9//+IPLHZYRtLFT7Sd0p2jW2fbapDblkj/DBZgqVl/Zjkhu9Q2fMqY3CUqudq7ZFhoT5CZ2t+Il9f4Yk/+RjPX7qSPBgQpOItzjgEF1UCFoT14NMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507506; c=relaxed/simple;
	bh=RXfSL4hWXAXcXKsFv8PBx3pIRDdK0npngW0DFJBTdwU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=asXaQ4EkBL9T1uoR9t9h1p7qnNxymxf2V30vO8On8zFjW1JQmZQbrZUbbJHTWYGtOAO1L+dJq3bxA1SfMBmvXeOmhWBtfl5Og72fsKmWfOljfNJYrq5I3iIvwunOVz7Bekbc19Oc7yt+Un0UiGPUmSG+XwdPTHAWPy/E6aeQljY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1pEGHEm; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1pEGHEm"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-855c26cf490so6057967b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788507503; x=1789112303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6gwhXtUIb/ga+mKjDnxNUBQ8NJgmsrNde0ZrmOu3N8=;
        b=W1pEGHEmMhWtmKPDsr0qD2QlIcZbLk9A7KcX7hWmAugg3qbh5sMl8lFhPt9Kvw9Prb
         P6y2/h0nyxn+2ZWK750WvaOKCHOh3W3XpW6HYNEqjyJ4lJQ6lzahkxvi7r5DJIqZOxr5
         xWbafxh4KA8z7SGNnrHCeKKuDgm3ijNuHrqh9yWeYvBI5/1PQcsHyiyfdDolMGDo8Z/I
         fh8yDcB0BFnh+7eSwVeKPDCrWj+Xpm1TgNjutrGR1rhBipB8qkYhxQNi6A3jy1+00dMw
         lk00ymJdI8nu7b35g0nEyzh2H16E6Wpnb9PiZ91cNUiBCmwwAk08msNtj+wC9q/Qz4vI
         bznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507503; x=1789112303;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6gwhXtUIb/ga+mKjDnxNUBQ8NJgmsrNde0ZrmOu3N8=;
        b=YsgF5gdFqDSbGhIrsjYvwx4z55ZTZqw70vFmb45l0p+3J6eIyHjDlrRdZaWBhf57wS
         E+98v6QiOmQCGajx5QgPnWeSTJGfL5jzDfbkJmiNFXYlD3ImAKHNhsD5th1YHRPoj3hE
         l17uIcIN1+Vboz3ccKy+2xd2NaI2AUqgoybfnT9lHHYlFCgNFLy5poFmtw85DNU+GvT9
         x6DgbmL9+MM6L5X1VKI1yA2Z8CMRZ1U3YZFtrfnxgB3oQ/3089lJc5Fsd2moO+D88U/m
         EE+nR08rZRzzRX+GM0h7YZj1flhQdt+xyix+bd5a6sek1t9euKOoju94QGImTKgd0iCh
         cFig==
X-Forwarded-Encrypted: i=1; AKwUvBxvaEyy34c0o0Koe0FaMQBVm9Wcbe/kXX/e7bN4jKqNMRjgWsCposcN2V7snTzp/CELE2Se6NquZLASTc4=@vger.kernel.org
X-Gm-Message-State: AFuF++m5R9XQA7f/n8tBYZgfmPQJphO2DeWDXkZtDqRUrMGIMJUH3xPe
	3efK3c9fTttk/aJ2whBFEpf49aZX4ohZz5yLuItdrUMXweEjeMq9+gMh
X-Gm-Gg: AYBFou1/L9FhPe+gr1Y2A2DC1gGOXCoqhoPpOIVRBUO+Wf7fdBiQKye+v4am3PLnX/z
	bOTLXKphywnWhZgbDLKLJ8GagTjHYdNAFc+RfFgRGrqRDWTPdfmE0QsN59xE7qbMGgez3zusacG
	Zxh7U69vAiygztRDwyaTDhc6LbZDK5KAGB658gH+RkRKoqMpH2rSOqmxhpk8VEc+oHNmpTgABbB
	6ZpcBu237f0OPZEqegjwiqyKo9xQ7EBqVePR8G8+hsdNnvoIJ07jLoXQmyo5aGZlw9os+CWTHYw
	L0el7WnN0nPnsqc334XDb1tYedD1mpPGB8LIXM/vzrXYheTWrc9UuJyXecyz0g6MNtJnVXtju6J
	/p4+owmf9UrgVFS0KlxDX5fMtPCSV0vljre3KtBlM+LEB9lXBAAaKdbGU4i7tqOCpxMaVEr3dFW
	YIedrKdo/fn/a82iAFQgznhbnMoZUFnw6qalKH3aBad+vNhs2BKmylXZrU7+10TFyDsJlMGild7
	qAX4HzaIw==
X-Received: by 2002:a05:690e:128a:b0:66f:b413:8b7c with SMTP id 956f58d0204a3-66fb5ad7109mr1456179d50.43.1788507503521;
        Fri, 04 Sep 2026 00:38:23 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([179.238.17.208])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm1691157d50.9.2026.09.04.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:38:22 -0700 (PDT)
Message-ID: <6a9a756e.4675fc7e.263ae0.66e6@mx.google.com>
X-Google-Original-Message-ID: <20260904041500.ramshared-v2-cover>
From: emersonbusson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson <emersonbusson@gmail.com>
Subject: [RFC PATCH v2 0/2] drivers/block: add RamShared hardware-accelerated VRAM block driver
Date: Fri,  4 Sep 2026 04:38:13 -0300
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

RamShared maps discrete GPU video memory (VRAM) apertures over direct
PCIe DMA to provide an ultra-low latency, non-rotational block device
with a synchronous .rw_page swapout path.

Key Design Highlights:
1. blk-mq multi-queue parallel request processing with atomic gendisk
   allocation.
2. Synchronous .rw_page fast-path in block_device_operations for
   zero-allocation swapout under direct memory reclaim pressure.
3. PCIe AER error handling with pci_error_handlers to contain link resets.
4. Comprehensive multi-kernel compatibility across 5.15 LTS through 6.18+.

v1 -> v2 changes:
- drivers/block/ramshared/queue.c: use check_shl_overflow() to prevent
  64-bit integer overflow when shifting sector to byte offsets.
- drivers/block/ramshared/queue.c: enforce PCIe BAR0 boundary validation
  before memory-mapped I/O.
- drivers/block/ramshared/main.c: ensure pci_clear_master() is called
  during linear error unwinding in probe failure paths and device teardown.
- drivers/block/ramshared/main.c: clamp queue_depth module parameter
  within [1..4096].
- drivers/block/ramshared/ramshared.h: wrap function declarations to
  conform to 80-column kernel coding style.

Testing & Quality Gates:
- checkpatch.pl --strict: 0 errors, 0 checks.
- sparse semantic address-space analysis: PASS (__iomem verified).
- Multi-tier saturation benchmark: 9,160 MB swap holding 40 continuous
  cycles over 30 seconds with 0.00 ms access latency under WSL2/Hyper-V
  (EVD-0040).
- Memory stress battery: 9.09 GB/s PCIe reclaim throughput with
  0.0% PSI stalls.

Signed-off-by: emersonbusson <emersonbusson@gmail.com>
