Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E583D6690
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408462; cv=none; b=ZJKhPJxeF7eEEhvB92Is0dlYbjwRKUh5OXCALkNyEJod935zE3m4JQZGjXqU/Dk2l4g3WmoyzFcLVP9OBMpQdTAVoVxWuIGt6UYlHgM1J0w92GFhJ+kvmS3f6aw9ixnDjdWJKq2aHKqBCuaPiTavpTaACpxxnDl9W8aAyfRwmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408462; c=relaxed/simple;
	bh=a5rLoGhEHqlxmRZ/JOfMOOp0jB6HErznintsx8K7+PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOI/RTJvYHJ8sbUS9JJWnS2jal0ZhxeTkkYQFFZY7Pli+zkWNCoE+qyhVCD1q0XSE6v4e1/yc4Gw62zwri8BZjm85xr0sgorcboa3VZ2c7z6wx+aKGFF/4XpuWILPkuHY6pcHc6S7aDNW4FjbxOJTQQaO/YcXIIUMk4l0WHVr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmamRnqW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmamRnqW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so1692743f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408459; x=1792013259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co0U3IIGvGBciCjtD7Ot3o1hC8jdmJVyR340U2yvkE4=;
        b=hmamRnqWbH8+KVCerjdFjFuO6DXdncC0AfbGh5HemT+3VQzMC0ir9nwOpD/0X1SSqp
         y3kEXWZp54HZKNLlzEds/ayMEAResmmftTYAmMMsdYmHV1jJuQ1Z/bf+n1YnTnoPytOU
         85ou+9F4WbGOavKGqPzSX+4thJ77B+uC3gfQhBgjiMqs720r9/woU2+7YQbzyr8uZk/p
         RCBwtvvvnJRjDauEztXJVXzx1+YdDQhTxHVZ0/uqRh9YdZ69Oz8vaIgfrdJLif9u6qyw
         OFSWBLlO0QdLM3KE2gs6ZVRKixRGQXv0i0PvrBs4yD0OjCpZyvRM9aWpipH+EIUHvQ8U
         7+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408459; x=1792013259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co0U3IIGvGBciCjtD7Ot3o1hC8jdmJVyR340U2yvkE4=;
        b=sJW88Tj5Sv+Z9J6SjAnvWH86B4l9ntDgjrMCOrqMrb+ndh30pgYCebcKm9tqMe+e1+
         xtn9Uyw1flBJqgE37pYcZA6kzdN4FvkfNWxJIrSh17BXFITx9hItsiOE7KCIOE8YPZ6T
         3IotO1h5h8HJMRzAo5t6AQgD+k/6MzkceJynMFg85DifM2RNkBPAAb00yQYDfZzx4Wed
         IFJ5j8ctAddfBZPbQkB57MPqpquhszzzS11MkwrTUzhTvHny74YcBjLtKGYwBJbdyDD0
         Oa8POWSsX1D2babA20OOgSA5AyqyIDWDYeIeKnffBZcuoz+OhkQ5glZawkn02Dq6/V4v
         8svA==
X-Forwarded-Encrypted: i=1; AKwUvBxnUD+FFzrqwaqDGFKxmGfRad1V7VTD3IgqdrHhpHSPVoRcDo0ibAY3AQOAeuB6h4fUHXJIFraa+M7XQXE=@vger.kernel.org
X-Gm-Message-State: AFuF++m3sk1GhSPLEaRRuWpZiFOifMf82/UhRLmh9s5DI9vAUnv1jo1r
	ltchaU9oO62Efb8g6+K9sixN1gcbSt/vuZuqkrnvGZ/fCyx3g+vRnonucsrB
X-Gm-Gg: AYBFou29ah+JNs38sy1cbR5qpcTKvqKtpUbgTOK/4dCQymKGK/y4C+wJQrG1Z/6mLLn
	zvVk7dVJdpb3xBawp3Pabp25DCR204667bGoanzQhEQMtm+tRBLYYZDuF2C1kRKTnYO5OfuRHI4
	p4n8S3ibZsEUP1O3MljBJ1vJJDjOBYq0X9pzS4GWONaofY+HOqR7gj2+eBoZ5pyzqjZkHVh8+E2
	M4RBEkaU69AmL97m2M0GoO6+cjTISkCeC1Sra+N/vnTFdUCLs4MvP+UiTKwX7JhiMmRW984mtwl
	aq81aWOgKETz+xNTbXK5ZE9S8Y86aiRzCznWs2IziZhlceqKNGIPavEF8S5j43p0gkqrRfD7eR+
	H+XoyOqWtpBSRKjqfMGJlojkR+3pGomaarO+moNWe0zfAJ7z1f6Rp6Rvtsn5WfLyTDL+YYNxYiF
	Ycl6mXvpSEkPppYkVqRYSVPvahCMWzTWaGkW4PxXo=
X-Received: by 2002:a05:600c:540f:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a180648fe6mr64635805e9.32.1791408458681;
        Wed, 07 Oct 2026 14:27:38 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb261sm20466395e9.3.2026.10.07.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:27:38 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Moni Shoua <monis@mellanox.com>,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 0/2] RDMA/rxe: Fix TOCTOU races on mmap'd send queue
Date: Wed,  7 Oct 2026 21:27:35 +0000
Message-ID: <20261007212737.1989004-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The rxe driver maps the send queue into userspace via mmap. Both the
requester and completer process Work Queue Entries (WQEs) directly from
this shared buffer without first copying them to kernel memory. This
allows userspace to modify WQE fields concurrently, causing inconsistent
state in the kernel.

This series fixes both paths:
  - Patch 1/2: requester (rxe_req.c) - copy WQE before processing,
    with WRITE_ONCE per-field writeback
  - Patch 2/2: completer (rxe_comp.c) - same treatment, with reuse
    across multi-packet operations to preserve DMA progress

This is the send-path counterpart to the receive-path fixes:
  - commit 22b8fbded65b8 ("RDMA/rxe: Fix TOCTOU heap overflow in
    get_srq_wqe")
  - commit d6ab440240a04 ("RDMA/rxe: Copy WQE to local buffer in
    non-SRQ receive path")

Changes since v2:
  - Replaced bulk memcpy() writeback with targeted WRITE_ONCE() for
    individual fields and smp_store_release() for state transitions,
    avoiding the tearing risk of bulk memcpy on the shared queue
  - Added smp_load_acquire() in the completer to pair with the
    requester's smp_store_release() for state ordering

Changes since v1:
  - Same as v2 changes (v2 only covered patch 2/2)

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 58 +++++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_req.c   | 61 +++++++++++++++++++++++++----
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 ++++++
 3 files changed, 119 insertions(+), 12 deletions(-)

-- 
2.39.5
