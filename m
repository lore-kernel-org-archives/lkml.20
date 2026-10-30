Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379049;
	b=ZHiAKtz0WCE7HWbl9xybdm/I72Fed6KuVoOXPMsiAURB34BBwfcLK9tS+l5mfjypZHlZ
	 4TGoiZDDyOng5BADegUVPWjWkxrY6BfVpzfT4/7oysahICi5ZjQMSfSKtYk+IFo51l/kQ
	 MiwZuFSNYvIHV/AfBLkobJBUn1GE32pYbMUiIpyAN5R1YNbeFbPyHhRHDoEPGe5Gss5m/
	 XNlsBzoeJJl+CK5wr8DHxWUmZAygv5Sw8qm3D4qF+LTz8LcX/zIXX6gcsQEvtYJwWIx2G
	 aEsk7EMl3hkx1dQc3YJ9RvsxJNhnCDUo7rtFR1JjFcV/dAfJtnElO09UX1SQL0c/SbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzV6WXzPcFzRX8VB8o7goTo1RH2RiPQDDsNBXgNksVA=;
	b=1LXxS6vLUiANHM6wzgeOQPn+rV2BhPbyMjbtSahwQKJqt2kCF5wl7K2y0i4TVTh8lkcu
	 zxsCjQKHTnR61lYGuULQlE7tYDDay033golx/n+pk3tbD5sZBagMpO+FTqTha+6k1SrvQ
	 pTnazP8hWR91rYngsAk0vTG+soXmVgpkbLaSohhBDtDbfyQ5DDE419g8M955VokMZeipG
	 hTKA9pxNnRaFrxRMcXQkY8Zh/uTou3ER2LDXzRMOD+g1wp5v1gTfgzkzx9l5mn6vh8A8e
	 ou9X1ohTY7Cb3V5cqyo7QbaqcXVBe10iJHcI393j3yTDpblGcmQ1dJ/f9aX36fLwQIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqGTI6OU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48296606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48296606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqGTI6OU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10609195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379048; x=1793983848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzV6WXzPcFzRX8VB8o7goTo1RH2RiPQDDsNBXgNksVA=;
        b=XqGTI6OUecTTaaf49qWDvR+vr2Vei3Sw0oVZPnz9BfHkMLJdwcL/zzGA0EGQY0grky
         uy/08+N7oVRIw9WHLIlXQ5rZ/2pyH9p1T45RNy7ldqs+VJunQVqrInsEzSLJKFzdC+P2
         04DbvXLUlhwy9vGSU469Oq5zkSdUQbkhC6owWbXuahelT2nxiAjyF1GcyLvhLNZeqlAl
         b6E2LKhFnWZlJcHLgDulwwaIiFHl4AIPHsJvP3F7sy1RB/nevpfkP7iqFIOaKcI6JGaz
         5X5GP4W5T3FLl5I21Ac85lgHGmwGpP25CYGRXkiBmKpG5iePIJiBmwk6kvldz7cJNCC1
         wCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379048; x=1793983848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzV6WXzPcFzRX8VB8o7goTo1RH2RiPQDDsNBXgNksVA=;
        b=g4sSQXrmSq9dL0fV69Oy6S1Jc7T2Y85ay0lfO/McYLf9oOCGaqXGLzMF7/RFPYjqar
         NjFwjX+Cov/7rd3awVn2ZglyqLHTIvO62P11lGJ6MI9cW3q8NdxCJhhLP6QdS/sPABZt
         RvRMLVBlRDXPwkx0509g9anHol35R3t3H+KbkTQ7s3PnC2E9pxG0cdWjAeb/cw9piVfJ
         ej+eeNrbRhOX4s0/nMKNObBv2kebfpgM8vlQ2TLPTUDCLNqvnTJr/M2BagdAsDKo9EB5
         j3eY+hgW3kugnE2FB+vGuFjbbqzlF1tih5MKTntoQ7OGE7PmS7JcPL/gEppJZ3OGZ0SV
         ZXjg==
X-Forwarded-Encrypted: i=1; AKwUvBzzPR8Ij59L4g2aX3PykM5q0YvKlwrUfFVyEIh5pggOmdq/rTSJE6SXjm9TIeHvfygoB7b+BEYDtxw58+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB8pSP9POQHod+uNTltj3swDs6Dlr2UeoSVGUrIisIRJF0nP4z
	Dr85CVWuIqA3/t/dt38qYn4Hz7ANSAsEjYL2pjg7kXL1DC24VeQy/1M=
X-Gm-Gg: AYBFou13XudbBzLJ82QmVraMh6rLfel4zwCv97aJ8ezWeC6JkAGRGBl5weFRwGVFs/c
	ia3brdf32T/C9XszvC0Xz2V4BIheFuBhWBW1FF+XMl5/Uo5qgRgmg8GIEcCLvE4VXcWPuA4T8/F
	7P/2/dlmq8I6MyMpRQ1MnVpKMOGDoh+wG8Hdogf2dlL7DKh6qy+mdGN0Le1wWw4HST0MjFORx/G
	I05Jo3a58onHZffiY8yCexb4WZfm9mWUhWgFXYpFPG2dccQwUVOJFF5CgUrHOlznV+MANB3Rl6v
	5K3kaFNI/rPEWWTKlncFkp3hob/hJlID98/2LRyD1Ws8KP8XAWAflK/3yC3cHUM3STyyKrYe5oH
	7E6jCvziu0iCRkYtHr9tcxuuPMralmUiSd0QPr3SI5+PDTmMVCZlbiJOcMhZ8lpB70H2xW+sRin
	rudxyNQkItPBcHJh2csVAsfdnEosR7apIn+gKRBlqJa7q5a6oUvu5woy17ke67fOutSztsTCQXX
	6TFPZcnI9WRiY4BRMa5rs5heTiDni2LkgyDYpg+nHGBThahrBemvIkM9cMFlVY55v+WcnnSj6cz
	dt8x3jmPHmSS
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr69703855e9.17.1793379047454;
        Fri, 30 Oct 2026 09:50:47 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm94366765e9.12.2026.10.30.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:50:45 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v8 0/2] RDMA/rxe: copy send WQE to kernel buffer before processing
Date: Fri, 30 Oct 2026 16:50:42 +0000
Message-ID: <20261030165044.2799619-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoftRoCE send queue is mmapped into userspace. Both the requester and
completer read WQE fields directly from shared memory, so userspace can
modify them between kernel reads.

This series copies each send WQE to a kernel-private buffer before
processing in both the requester and completer paths, with field-level
writeback to the shared queue and cache invalidation on completion,
retry, and QP reset.

Patch 1 covers the requester path (req_next_wqe).
Patch 2 covers the completer path (get_wqe).

Changes since v7:
  - Patch 1/2: reject atomic write WQEs with oversized resid to
    prevent OOB read in finish_packet() (sashiko finding).
  - Patch 2/2: write back DMA progress before invalidating completer
    cache on error retry, so req_retry() resumes multi-packet reads
    from the correct offset (sashiko finding).
  - Patch 2/2: invalidate completer cache in COMPST_RNR_RETRY to
    prevent stale state after RNR timer fires (sashiko finding).

Changes since v6:
  - Fixed all sashiko review findings (2 Critical + 9 High).
  - FORTIFY_SOURCE: memcpy into enclosing struct, not inner member.
  - Copy size: max(max_sge * sizeof(ib_sge), max_inline).
  - Opcode bound: IB_WR_REG_MR (was IB_WR_ATOMIC_WRITE).
  - Requester: removed silent num_sge clamp, use mask=0 for invalid opcodes.
  - Completer: validate num_sge + cur_sge, preserve smp_load_acquire state.
  - Both paths: DMA progress writeback (resid, cur_sge, sge_offset).
  - Completer: *wqe_p = NULL for posted state, invalidate on retry.
  - Addressed Zhu Yanjun review feedback.

Changes since v5:
  - Added opcode bounds check and num_sge clamp after copy.

Changes since v4:
  - Resent from the correct sender address.

Changes since v3:
  - Copy full queue element (max_sge SGEs) instead of per-WQE size.
  - Invalidate on QP reset, ERR flush, RESET state check.

Changes since v2:
  - WRITE_ONCE/smp_store_release for field writeback.

Changes since v1:
  - Split into per-path patches. Cache across multi-packet ops.

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 75 +++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  2 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 71 ++++++++++++++++++++++---
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 +++++
 4 files changed, 151 insertions(+), 9 deletions(-)

-- 
2.47.3
