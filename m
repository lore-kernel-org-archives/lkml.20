Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905441;
	b=PpQrwxq3dPzQeNPVAC/uT+hZHuTL5WaC06CsLM5iY7eyMJTXevwjsxfZ1OC9fC8w9ijR
	 r9uztZ3FHiLHXDNw8O5oQmmXCd/3gMR2EMdCd+dRXR67JkEwxhFqLFdrAJsvlOFoyRx+q
	 LUWBffuPyyoPV8fSBlJPYVGTscf40ux3Q/MdAiHOnUo7d+vkYyOJJoXvp2DjpH/02Nhna
	 JHdMbH8sShMXP6j+NEj6e9XYXTGm1lDUUPSCLaT2VQJ56HSpkp8FzUdczFkFM9/CHW+Jj
	 bx1S3UPcLttBh6sq9tIn57VihKUPMKuxQJhf8WEmh2Mrd5vW9SKOhBouDcXoWKg6f9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XWoaUYsNjyOS2UxKd5e2J/3hK5k97ye+XeBBqzpaDGY=;
	b=kQbeX+qyJpLhRRpt5kyosrPqjaHDe9FGpU6tmWBzTEXpHvY4cl70WufkbE0MkJSl1Nyi
	 h/AXY4FBPL7xv47YsmECpAOFQnUjLHj0PEC92qFxeJ+YRpNyNfnPJkD0VBHw1rEuafB+j
	 KZDgJP7hhrDsfcC1Kg6KKVjhdAxAr20QuBUOzYVMbNsi7qUtZE5aueMABIz2EOOJVWI6F
	 xEVnWpfwIFxBZyH2BwJK0xA7VGqk/Xh9DCw2PY7Dsjwj2S1Cp0oeEfP5UwhPaBdROf5oE
	 xK68iomRfpwauCo3MIJb0EewAnZeMy0sdgNBFUDsuCGukSDDffp7zv6eGtIbja5NlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkMxZPXo;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EEC606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EEC606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkMxZPXo
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so2023083a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905438; x=1795510238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWoaUYsNjyOS2UxKd5e2J/3hK5k97ye+XeBBqzpaDGY=;
        b=HkMxZPXocPS555PvR2apkhKqMCS+LMyEL93nxs7b3QXf7ijJ8QdhLwm8gElEuw/Ysf
         qRAwArEcSKGLsqlX1ulDzkl3KpRpCVHtwh/sKxs1EBszfgA5cMn3F7sQWEt1dQxr8/1u
         uIYTBD+GBgY94osa9y+YWNLQNFh+EKTp1szg2d8Za3ffvkBvhlpXRIreCsWHPdEn4viX
         4F4Bq7w1BMwwwkKOYOSQyviuqaFEGWtcBizsfXtQzgAeP9R6jSMj29blEiHaDWnxjI2f
         dnIILYkH0HHio13NIn5RAoddTQVFAam8PL7+xdALjv5lvSMTuAqGoA/JGVTcL+9GxsE5
         ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905438; x=1795510238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWoaUYsNjyOS2UxKd5e2J/3hK5k97ye+XeBBqzpaDGY=;
        b=cLJotKXg1leCP7TUDL1vOtfd/bUYEGfmGI63sk8Io7xLjq+qZDcswuvNFf6ZMav9z0
         L+76yxC/iU/tGewSBGcHh6afD4lzbvxxpGC8Jnym6zUJt3GNNbw1dQHvju/eEvJ87231
         7XE931lgQsITHU9VtvUDd3amjusYT7ZIc+GrBwZA0INgOqdPQ5kBhGxz20gnfxgy1xea
         a4B3Vo5Wp7M7rpWSOhU3MAjuWEsPWzA2YYrwl+IIVWEssIvc3yOZnDLbqTfD0cmVKa0z
         lhGyFkEiMWYAr1nMgtdM2ou+RtD0PWUuGM3mSmvmk2Xy48RSziDhZrK0BkO0wxT2aL4G
         dhrQ==
X-Forwarded-Encrypted: i=1; AL+hErGAyMmoLIkW2SlKeW+ISVJVnv2NviW+Pgcn/BSQFsKHkHSJIjAOcxoqSFblwhoKSrlI95u+D81puiYGZ3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QsjMRBb+4MIulXs8RKFIWinR1ODi5ImsHyF8BQgkXhpN9vo35
	uLBm2pN97CMileRtsN/ORzHblH3RdiyaMr+d7G6l2+6nKI8jkMAfBfFa
X-Gm-Gg: AZFdTZf8Dx3R3FcJouOyWe59yVE7wV3YaPMs0NBTjpxZH2YFn4eytM7cAfX1WHaUF1R
	48gEMTpXe+3kMNB9U/iJZAVPXdl5Ecq+OoyR3UdHBs9e8rcH8ylBEYYg8UqUcn+4YNkaQWSg1iA
	t4rBCOlSHIXrzd1vd/Ipw4vf0eMQjOEPMosYbOmPv/WZKACx3+dggP16Ik4BAAnKy15u1GaslDM
	yVhJwxfDd2WhKgSsngw04jqjDKq7u1hlNNVwKHiRQZPRvgSOjNDAw+c+CPH95V85DaggsPjPhSM
	IfnAH2YIeqidEo6B4XPM50jLG97vcpA6aGDbcswfHJniIaFJ6Xk4jzYSLfZO7QcSiyLg4jMDFHj
	tS+m2SRSY82bzNkHpDz6y6EOcykOaDZHdY+PoixJ9FznEsvaQWjvq6AWDJvbMuZgmMWdFSh1R72
	X0J3nOjur5CA1wOyp1ddDZKM4bbzmnIXeXgLrC9iJ2xtN3pBjzn/KLHxeeSExCFEPAoJCLSy8Re
	qgA6CCeAJrRpzE11QjfRVYQGBhcDrFyHHN/5x3TT6UT2WZG6VtIETiX+w+RDlJhDfVs8V+rw68O
	J++/GUTKI4VCR85d3R8XJMT3njIc8lPAx/iFXyc3f2t+8MFJTl8jQ+SoULnCOSRNa5d854Xl5B2
	0
X-Received: by 2002:a17:90b:498f:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b1b07e8596mr10276263a91.7.1794905438249;
        Tue, 17 Nov 2026 00:50:38 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm3006240a91.5.2026.11.17.00.50.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 00:50:37 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] io_uring: fix stuck IO_RING_F_DRAIN_ACTIVE and IO_RING_F_DRAIN_NEXT
Date: Tue, 17 Nov 2026 16:50:31 +0800
Message-ID: <20261117085033.98363-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This two-patch series fixes two state-lifecycle bugs in io_uring request
draining that can leave IO_RING_F_DRAIN_ACTIVE or IO_RING_F_DRAIN_NEXT
permanently set on a ring, causing subsequent unrelated non-drain
submissions to be redirected through io_drain_req() and deadlock behind
in-flight requests.

Patch 1/2 stops touching IO_RING_F_DRAIN_ACTIVE and IO_RING_F_DRAIN_NEXT
inside io_init_req() and defers drain activation until io_drain_req()
has validated the request/link and allocated its struct io_defer_entry.
This prevents failed SQEs (restriction, ioprio, IOPOLL, personality,
def->prep(), BPF filters), failed links, and -ENOMEM in io_drain_req()
from leaking active drain state.

Patch 2/2 ensures IO_RING_F_DRAIN_ACTIVE is cleared in io_queue_deferred()
when all outside requests have completed and been freed
(ctx->nr_req_allocated == ctx->nr_drained) and ->defer_list drains
without dispatching another REQ_F_IO_DRAIN request.  This fixes the
permanent drain stall after linked drain requests (where ctx->drain_req
stays NULL) or io-wq drain requests whose CQE flushed while a trailing
non-drain request remained deferred awaiting the worker's last reference
drop.

Base commit: 666539eecdf4 ("Merge tag 'assoc-array-fixes-v2'") (v7.4-rc3+).
Note that linux-next converts direct req->flags updates in
io_uring/io_uring.c to io_req_set_flags(), which touches overlapping
lines if forward-ported.

Testing:
- Built arm64 kernel with CONFIG_IO_URING=y, CONFIG_KASAN=y,
  CONFIG_PROVE_LOCKING=y, CONFIG_UBSAN=y, and CONFIG_DEBUG_ATOMIC_SLEEP=y,
  plus W=1 and alternate config (IO_URING_BPF=n, COMPAT=n, KASAN=n) with
  zero new warnings.
- Verified in QEMU with a standalone syscall test suite across default,
  IORING_SETUP_SUBMIT_ALL, IORING_SETUP_SINGLE_ISSUER |
  IORING_SETUP_DEFER_TASKRUN, and IORING_SETUP_SQPOLL rings:
  - Unpatched 666539eecdf4: 20/32 deadlock failures (all 5 deadlock
    reproducers across all 4 ring modes).
  - With 1/2 only: 16/16 init/link failure cases pass; linked-drain
    cleanup still fails (4/32 failures).
  - With 1/2 + 2/2: 0/44 failures across all cases, including
    restriction/personality/prep failures, post-midlink failed SQEs,
    consecutive drain ordering, and io-wq drains, with no KASAN/UBSAN/
    lockdep warnings.

AI assistance:
- I found the bugs, wrote the reproducer and test cases, reviewed the
  code changes, and tested them locally.
- An AI coding assistant wrote the fix changes in 1/2 and 2/2 and helped
  draft the commit messages and cover letter.

Zhiqi Zhang (2):
  io_uring: avoid activating drain for failed requests or links
  io_uring: clear IO_RING_F_DRAIN_ACTIVE when all drains have finished

 io_uring/io_uring.c | 107 +++++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 46 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.43.0
