Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3383502A8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791730343; cv=none; b=YPDYZBJ1VUdxV67ASJ5eZ8I3XjmtLIfzx0kcWGuGC4qxHwul3HMRU0oKkUhy9q1vHsvtQ7stGAzr3ufMgBUW/sVPclVLrEmGEBtXJ3f4E4FatULG+I0K7V1SDxr8UAOBlGOOWwgIy1wcJjascqsFmATnTGN33B+ehR1Ja181k2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791730343; c=relaxed/simple;
	bh=5r3ItvyHlwh/KzTXl9HROI9n6bjZXGgUeuDTT6KQxCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nG/9VrbRfulOfxcU4IYrMpA1w4pOyujAKGCrrbqBXVibcmd1tXmBiSlc6/kz+s1XhVyzxaR19x4AZJX7tQqFf4yRybQ7Alb/V38W5+1iM2VpX6MftVuNqCXneUyThygYXZDNGVHpJ5J9CaqW2EAZ2q0q22zAbxpjXzbmUNfPmVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyEpcIIm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyEpcIIm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso603518f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791730340; x=1792335140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGMnoCiemVyU9rnhF6mteHDX55+EsD5DfdAIomQxYP4=;
        b=RyEpcIImmClOQziRRFXz3SzU7X9A2HJZKseAh+LjXZG4j3z2y8PoiBfjlkcUGNNzH2
         6yBs7gRmHz7G2BEyUbIHxF7AM2t5UWYZ5yO4lMQ2HvgarXyXS3fc2p+T8dMHxfr2HpMe
         A8kIThemqfJ0CpZAY4sA/SijkXRw+HRie06Kur94kZ6K9z7G+PQgnaMza73VaF05JW8t
         /F3ujDS+TQvoMGiJ/HMDJQdQGh8nTaH0+rEG8EQ5JBpwHnbi3PBUXxljsRT7UifxyMv2
         IkjbsfLHFItNF4sYKGvJMtOiJqSwzcT4lZGjvMaooUzCFxrvCcQcxLGoBlAYKBzs8Ws5
         FTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791730340; x=1792335140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGMnoCiemVyU9rnhF6mteHDX55+EsD5DfdAIomQxYP4=;
        b=FFhL2w5wlMMjCFC9RH9ETLv700sx1Yj5/GYdVCePjBvh+eA1fqM/ohxGejh/wAS6Qf
         hT89UZtUb2BmxXVVOU+9I6K/e/89rn88sFkTobkL4BWR8mmzbHwGtVtLXE7V0VMUR1P4
         BmoejX4XXzRnqneMOvDwIHLUEU/3FB/f3lrNk8GgjqSEjG35f83/J84imR998IjdZoNP
         0XX4vwZt+9kExLrhL1XVUgvMkPrb6M5ttO+pvnhaj9HsRetOwcQ3jQrnEO6RR+62nlXR
         g1RHPlJiZ/C681JZ8PMqyWgXrE9EPLmTS1k4M3Lx08hLnKvWfzNS/vOYxyTuOXu//S3F
         GI9g==
X-Forwarded-Encrypted: i=1; AKwUvBwzigzlNUT40aBjbItVJ2dnUmRlh6O4J1G++IwlDJZALMmN13k3OtJ3n6VpBMbszdzBURbhONjjYhrHfwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6sjCjVrRLoKnA0klPVlo4cym+8PkrDQ7b6zcv+l/5SOGY0pE0
	olwnvbXicqkaYGMnb5nmgMePThvWiRRVewmv6uPBunZC0QIFCPj31C5s
X-Gm-Gg: AYBFou3tIQDsH/R25I1UCdo76etSRMjjgO0ooUB2D7ZBMzklAeYRcnsj5aXG5lcMHwG
	p6pKCogyfF7zluQJ0YuvnZhkuuBDG9oMgR4wgNpkQMD02+Fp7Dr0Fw5CmntLuLUj9l2IlIBas53
	dN2Kj0XRb9PcWjn9mSEuK6ZHqQzfXlwTwKfD3hpnoFokhxyjOnkeXMNmkvdjsBKRORzUhaElYh0
	nIli0IrMW0icBxICJ4t3vvaeA9mQhk+BGm7YH7UHob0XBLkCe/snKOkNp8PyqFB1twM5wMeQDNu
	3imp9qsqAOqgnODMzGrBXXnJy2Z9yH7GFvgDRKQUtN6ZLaUPDeuywfinNQ8zVtwm4GhAhIovbsz
	pqVrVi1sKyjCj9RQI5/TTxex6xKQVTS0IYXRDzGJziY+M3GxPJPECtov7gPECobDFXfsPrxVczP
	QN2hkdTaNJIYxv1Ji9vjaZOHWmTmQGHcwsUk8vtboFhX4iBhOrcSc3oQYv5dPGM+Y0+B0=
X-Received: by 2002:a05:6000:4915:b0:48d:b8a1:53c5 with SMTP id ffacd0b85a97d-48dbacf8813mr11389015f8f.56.1791730339937;
        Sun, 11 Oct 2026 07:52:19 -0700 (PDT)
Received: from haider ([37.237.230.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf232sm15265743f8f.47.2026.10.11.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 07:52:19 -0700 (PDT)
From: haider <soka11223344k@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: apopple@nvidia.com,
	ecourtney@nvidia.com,
	jhubbard@nvidia.com,
	aliceryhl@google.com,
	gary@garyguo.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	haider <soka11223344k@gmail.com>
Subject: [PATCH] gpu: nova-core: gsp: zero-pad command queue elements
Date: Sun, 11 Oct 2026 17:51:05 +0300
Message-ID: <20261011145105.20829-1-soka11223344k@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GSP-RM checksums a command queue element by XORing it in 64-bit words,
so for an element whose size is not a multiple of 8 it also reads up to
7 bytes past its end, and expects them to be zero: its _checkSum32()
"assumes that the data is padded out with zeros to the next 8-byte
alignment". NVIDIA's kernel driver zeroes these bytes before computing
the checksum, and nouveau builds each element in a zeroed buffer.

allocate_command() hands out the queue slots as they are, so these bytes
still hold whatever an earlier, longer element left there. Once the
queue has wrapped, a command of such a size can then fail GSP-RM's
checksum: GSP-RM never answers it, and soon stops answering at all.

Nova does not send enough commands for the queue to wrap yet, as it is
zeroed at probe, but this will break as soon as it does.

Clear each element and its padding before writing it.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Assisted-by: LLM
Signed-off-by: haider <soka11223344k@gmail.com>
---

Notes:
    Found and tested on an out-of-tree nova branch that sends RM object
    allocations and controls through the command queue, so the queue wraps
    there. Once it had wrapped, the allocation of a subdevice failed the
    checksum, and GSP-RM stopped answering, logging Display NOCAT 0x28,
    assertions and Xid 45, within the first 5-10 cycles of creating and
    freeing a client, device and subdevice. With this patch, 288 such cycles
    ran clean (RTX 3070 / GA104, GSP firmware 570.144).
    
    On drm-rust-next as is the queue never wraps, so there it is only
    build-tested (W=1, CLIPPY=1), along with checkpatch and rustfmt.
    
    An LLM found the cause by comparing the command queue code with NVIDIA's
    open kernel modules and nouveau, and wrote the fix. I reviewed and
    tested it.

 drivers/gpu/nova-core/gsp/cmdq.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 1b2f346a23..ff323bb37c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -384,6 +384,15 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
+        // GSP-RM checksums an element in 64-bit words, reading up to 7 bytes past its end, and
+        // expects them to be zero (`_checkSum32` in NVIDIA's `message_queue_priv.h`). The ring
+        // still holds what earlier elements left there, so clear the element and its padding.
+        // Elements take whole pages, so the padding fits in the space that was waited for.
+        let padded = (size_of::<GspMsgElement>() + size).next_multiple_of(size_of::<u64>());
+        let first = padded.min(slice_1.len());
+        slice_1[..first].fill(0);
+        slice_2.get_mut(..padded - first).ok_or(EIO)?.fill(0);
+
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 

base-commit: 5a1b7121a6c4db6c0239d3ac3fd1c2bb33a40025
-- 
2.55.0

