Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647A2D73B8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969620; cv=none; b=uhNB3aN+kH/+slUQQ7r9Cx+iDcoKlu830PsHgKzq/bb1FewXp08di1wmPsGsnuvFtpTIoRU77UmjsXfvq+zwYPbHFs4ixHpXsOVQI3BQVUzLYa5+UAA6KHy+6xHeB+cEhaq63SV0+7sVnzYcyCV3L2sgm3Ux2oRM/Bk29d3jZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969620; c=relaxed/simple;
	bh=5rv0FfyiYEvyvVwzL3LiWBygbPcujcnx1umZvHO9vBQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=nH6liclJAmCxLbLqSVgRRVe5FdwcGtErSgqjECVAXjK0Hv1ODjaWu1NUBvo/hBYhzNS2vx2jevqgIZ0Angm/bLbd4PA0WXwIOMb4mvyoCRtbq/EGUNmx3svRs4eohIMteW3vckUqBB9T6JmCbui/JgkFFyQw0KzJ1dbLRhkXZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjK7yde0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjK7yde0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71e253c90so15370155ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787969618; x=1788574418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovGmNS04B5xvYEr6LE0aaw0+pimuQ4fxyRqoFUQTeKs=;
        b=rjK7yde0uBQrqGrYhS/8b4unVQRZEEyR9LCvOd8R2CUB35GH+z9m5MYrgJ59di1K+L
         oFogsD3Ill6upGMJKJGcRjvh4fn2o3ec92DeqWjqRPuunJCBIvyyUU9RfeVx/Vh9Hwb0
         N+0AlrJqTzlNbdlwcrB3CIvTxn+gnItYb5PuVDlp0K/t3jKMfnqda0jGTZsakQo8zWgz
         EGTlgunXuESMD8rwf0CBiMr90MqXpg4uDufIGh2Ti5QEhroJ7EBdwKl/eTfARekSA9aX
         mtwkmzw0P1lJM9wz4oW7dfE9ezFYSKdoKvxwEPwyzscelY2sonU84hZmkVj9lKFD9Yn7
         Porw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787969618; x=1788574418;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovGmNS04B5xvYEr6LE0aaw0+pimuQ4fxyRqoFUQTeKs=;
        b=RXQWQCxSB6/SuKenAPmmTJUurWB4zfpEFosda9Dk9+Qx+vzV6FpfkHlZXdyMKKqtcp
         SDB/vWIdeffO6lIm5PASfDjAp4Bm13nv+p10s3xOMcSQ5Y5kCqm9EGyxqW3opfP6Y6Pi
         eDCkU0ROhh8c3XYTxSQFxep8clYsQpHIYAfndk6L44z7M7cCz07iN82Poti6GMUnqVsQ
         g/HnSfJklXuJ3HoZc6eefN+jNNk5L3UljtSFNMpTVQISQtKVHMMZMLoYSAyBLhTYMIIG
         aMitUA26IWvDKwu1tu1vNOIl/Y/L2grvVPNvAahTbt1pe+50o/BaVRuEivM/JjEFUk+a
         SCSw==
X-Forwarded-Encrypted: i=1; AHgh+RrahZw2b3aKrrkF/WZ3CpYjYD5SyrWXPKwY9xeCsXJtqjgB/pWWYoJoq5W81e2MKze7fNNbRNgSw9zyKIM=@vger.kernel.org
X-Gm-Message-State: AFuF++k/14WIRzkXPVi96/6TBZmbkqPlZ6k9H+ep+VC+81dJQOEyCMHa
	cpAEc17HDahwpG4D5vDkn1PQ5mC9tHv294lTi03896z+lCr3lGwFWg6r
X-Gm-Gg: AYBFou2LMYnFCwI/UUiz3T8/Z2BrW0UEBIsN+33VIvgoXUeRF9zFodz1KMC8+fHohew
	bHV4t8E/T8WrC4hd22iLa3/bWRTAS+13hQqYtM9O9H4jO8KCU6cTp7ZCnbEqQsxnYPZeHP1pY5Z
	NybXfOVMNe66D9vp/hzz7MD9Xfm9yVlcTUWTkXv1rsukE2hApGeaficHrLKKOgR9Vg/Eb1shd/B
	KyZXzntg6SC9XxcJ7gvgrF2eZTxlFmF1+u5MUgHAaMbY6r7ih27/VVAvSRZ+30MIS1ZuCx0PDjV
	/XlaLXbBNo4h71Q4ShY3mtBweRJAY26s/Yf9KI/4vak3Z1JKJ9mMg1lq+6S5MIPFKumV1T1+JKO
	HziZ92bLG+2XV8+ef4Ix1R6HPgsGsA+scmlmdNVytA5sC3PaLGv8yvaJ1Uz+uQl7zWlr0CyS9YI
	c0AApG0FXjiVb7Y90OmCgyfQZMnPnbQzczRLSpyaFsG/u8Uk9wOxLIsIGutzzaLkqg/8HjOtaun
	aZgAOKnu+M=
X-Received: by 2002:a17:902:d483:b0:2d7:4b42:9352 with SMTP id d9443c01a7336-2d74dca231amr184313925ad.3.1787969618107;
        Fri, 28 Aug 2026 19:13:38 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm10164143eec.22.2026.08.28.19.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:13:37 -0700 (PDT)
Message-ID: <6a924051.e22746c9.8f0fc.bdc2@mx.google.com>
X-Google-Original-Message-ID: <20260828223000.ramshared-v1-cover>
From: emersonbusson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson <emersonbusson@gmail.com>
Subject: [RFC PATCH v1 0/2] drivers/block: add RamShared hardware-accelerated VRAM block driver
Date: Fri, 28 Aug 2026 23:13:30 -0300
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the RamShared hardware-accelerated block driver
(drivers/block/ramshared).

RamShared maps discrete GPU video memory (VRAM) apertures over direct PCIe
DMA to provide an ultra-low latency, non-rotational block device with a
synchronous .rw_page swapout path.

Key Design Highlights:
1. blk-mq multi-queue parallel request processing with atomic gendisk allocation.
2. Synchronous .rw_page fast-path in block_device_operations for zero-allocation
   swapout under direct memory reclaim pressure.
3. PCIe AER error handling with pci_error_handlers to contain link resets.
4. Comprehensive multi-kernel compatibility across 5.15 LTS through 6.18+.

Testing & Quality Gates:
- checkpatch.pl --strict: 0 errors, 0 warnings, 0 checks.
- sparse semantic address-space analysis: PASS (__iomem annotations verified).
- Multi-tier saturation benchmark: 9,160 MB swap holding 40 continuous cycles
  over 30 seconds with 0.00 ms access latency under WSL2/Hyper-V.

Signed-off-by: emersonbusson <emersonbusson@gmail.com>
