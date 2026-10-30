Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373362;
	b=kyIWwNxkItOnjjXZZyoki/rjd5cbJDithQk/qoJpGp1ibzhnRBXjZfkt+HfTHH1rihyD
	 93T9uZ7nnTmEvyAXf/MtwvnmwG+lQrwerJ3n57ekSySByr4wg/Tsb+K5KHZYBK3Kv2R0N
	 SDKldMHDr7tBw62259OwMZt4nf5osDKB2w/RElN6I/563si1qshAr53ZBN4sygXE9IvRX
	 bu+b5JqsniOulGPVQa2VCtmG0KWDBhqZ1EoZPFCxR6PlFM1xd48+WnXZhNJEcOfr34n3z
	 0oaUYhm0wlvU8nvEDz1UoAw+G5+6YO2qxiF+CspA6B3bQmbJO0Hgs8OtPwb8gFNwRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2/e4wODw173tyqkrdAOHBh5VI6/G81+0Qf78PMO8VY=;
	b=poJu9CXeEhlyr/K3gPDEsTETqUW3jI92YNOc/KMSG8QhxTi4HlwGpX6V72NVQSR2MDPd
	 BX2ZutG2VqSnqvAPdpsykQ6jD7PeU1e56QHidj3y/A4zYDaoHHsgrIaVVhpQyWx1ntpyZ
	 qc3ooHTqmg1pZ0pCvo4FzYlwnOw8r3uBwGgUpGFlDXluL/AV8W1tp1oxcir8ZJOt8DhJE
	 Bl1FSRcwmqlD/Bj3QkJ7uSpaLdN6XcD8trBhP/lL12qIzfeDEoN4xXhNaOjN8/XiSm6TY
	 lvnc2aYQToq17UPdoM5Fo/1S52hS6UZ231bI3EhinCOXYNMs9x8MNnP+PwiLCSm2P2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayGxPgig;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayGxPgig
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so4263175e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373360; x=1793978160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2/e4wODw173tyqkrdAOHBh5VI6/G81+0Qf78PMO8VY=;
        b=ayGxPgigL5J/cpcMGBIcHx/evVBem8vl5U+JZErgRMB4V+ZS5qpxtPsOv42n62rOr3
         n8MYb24p/cZ19oHFJ0n2N+gxtlGu0PZBoWf5KnDdns4dwRwj4q0KNZNaRy3HW99AdARj
         rdSI59D60oOzFOrpFnpAC3qeqnymed6B2gqHoUL5sHluvdiTeHzrKqz+Q9H5/yHSu2XD
         S0fA/Ycukg4IVIpJbkZLJxG91/EY+IwyKLmx/j9LZ72IFuT+pOmJEC3ZtDLeRoPOTuU0
         4gvrmOskGU5ZvtIPbAmtyEqeJ16ZaZQfxpGvx+PTiOElV6KNvWEiqW8NslHgrA1y5HD9
         XO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373360; x=1793978160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2/e4wODw173tyqkrdAOHBh5VI6/G81+0Qf78PMO8VY=;
        b=DOOmlX+v0rYYUDiz67zO3NjYeZmsjsduPqRDr96rgfik1dz+Rfow0ETxUf8TN/+vnz
         yMrHUDykvpAfV9R34uSt3GQNsGVDHEvRpilzzJ+TmxBN27w3pfuf80d6z2eV9Mrg/UJn
         bVD/HWY8xuy7CRWQijRKSrWte474xpAeX92sPdcRYaASTef7HiIlRlUsjR2mresaOemD
         m86r8wpIEHiS8t77ld+xAhvjmJcsWw35hsCPG+clcNSEQN97NHy3uUvKjQKe60CKYXia
         ose9CamSnwAh+IctVTtOjZkMafrHmtLoY+yJpdMIk+ArhhC5e/Z2EWCsofaNNszkLbn0
         OYAA==
X-Forwarded-Encrypted: i=1; AKwUvByaCxaSBgMHNYc/0Pkxn0O2KM+NAuIoZM4JxPH+eudZkzkttFxFdRoyiMLCJI4IU3oQowtXj5oDcnpeY8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgMxOCmFEgVaqkz1TxbVtLKduOelQ87iowp6RWmGIoEjmjHF0K
	ztbIICfrRut+xfOJT+FnkBKnExFm3WOe/8Y18ky82NwinRvf7CfS574=
X-Gm-Gg: AYBFou3/RRWm1iFY8YTcT4cfF1tlZwcBqo1Ukfz/BNNxd4wRq4Q/wPleNaSUNLlX4QG
	98p+wIfP4qrDCcS/FrztK9WuRFqL05/MqrrH20Zso2cLresEf8aYv6EqxZn/1M/n2X4Ce1h+SJM
	5itmGNKHu2E7eT+YZACZWGP05Noy/mVxyo6luW8xn2GnsMbJ/hu24sEeP9V02+rXTDL+1Gy6Pyn
	NnODhtsyg1Iuw/S+f5KYjNtNckWcLOicl31d3QxKJAod5F0W510MygCLNKh7Fnm+8OehWK+Xs7Z
	m9+pONkgfpu0Av1foNTYvbV6U+cPi7RXHx5Ct7shQ7K/CSFaHjQ/ACLAG7nHmD2UK45vSLxUADe
	skzWWEoxAmsVYnOPiwx0q+RFc1WupunnKKDxms5//QYXCyrDXxmggtDSJUisT+dp+1ei2n2GtZf
	W3P7+y62rHMVm4Lce61vahRtXW7kdbukCKuGfPVy+07gPPkOj2gB0CPNVCMBRjKqeYu/1zxOPG7
	ToP0hBpEEiY8G0Ph1YLBuF65vulO/BfWJCqGADsfcoi7EXohxHGIcuDV+NiBXp9wxxvpZnTryhR
	bqUvKydHt9Y=
X-Received: by 2002:a05:600c:5397:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ac18b7e65bmr58193635e9.24.1793373359758;
        Fri, 30 Oct 2026 08:15:59 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm3268511f8f.58.2026.10.30.08.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:15:59 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Bob Pearson <rpearsonhpe@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v7 0/2] RDMA/rxe: fix TOCTOU races in send WQE processing
Date: Fri, 30 Oct 2026 15:15:55 +0000
Message-ID: <20261030151558.1458444-1-tristan@talencesecurity.com>
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

The SoftRoCE driver maps its send work queue into userspace for direct
posting. The kernel reads WQE fields directly from this shared mapping,
which allows a concurrent userspace thread to modify fields between
kernel reads -- classic TOCTOU.

This series copies each send WQE to a kernel-private buffer before
processing, in both the requester (patch 1) and completer (patch 2)
paths.

v7 addresses all findings from the v6 sashiko AI review and Zhu Yanjun
review:

  - FORTIFY_SOURCE: memcpy destination is now the enclosing struct
    (send_wqe/comp_wqe) rather than the inner wqe member, so
    __member_size() sees the full buffer including the trailing SGE
    array.

  - Copy size: uses max(max_sge * sizeof(ib_sge), max_inline) to
    match the actual queue element data area, ensuring all SGE entries
    are captured even when max_sge * sizeof(ib_sge) exceeds max_inline.

  - IB_WR_REG_MR: opcode bound raised from IB_WR_ATOMIC_WRITE to
    IB_WR_REG_MR so kernel ULP fast registration is not rejected.
    Invalid opcodes get mask=0 in the requester (normal error path)
    or COMPST_ERROR in the completer.

  - num_sge: the requester no longer silently clamps num_sge, letting
    the existing rxe_requester() validation detect and error the QP.
    The completer validates num_sge and cur_sge bounds, returning
    COMPST_ERROR on violation to prevent OOB SGE walks.

  - DMA progress writeback: both paths now write back dma.resid,
    dma.cur_sge, and dma.sge_offset so retries resume from the correct
    offset (fixing IB_WR_FLUSH and partial READ retry regressions).

  - State TOCTOU in completer: the smp_load_acquire()d state is
    restored after memcpy to prevent a concurrent write from overwriting
    it.

  - Posted WQE: get_wqe() sets *wqe_p = NULL for posted state,
    preventing the timeout_retry path from operating on an uncopied
    shared WQE.

  - Retry: comp_wqe_valid is invalidated when a retry is initiated,
    ensuring retried responses get a fresh copy with updated PSNs.

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 72 ++++++++++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  2 ++
 drivers/infiniband/sw/rxe/rxe_req.c   | 64 +++++++++++++++++++++++++++++---
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 ++++++
 4 files changed, 143 insertions(+), 7 deletions(-)

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 72 ++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  2 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 64 ++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 +++++
 4 files changed, 143 insertions(+), 7 deletions(-)

-- 
2.47.3

