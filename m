Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327C21C173
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894553; cv=pass; b=A8XgqFdVnOb7UP5f3XdZ69CfVZvekzHVrl4/A1f3vtso4XRyuLDad5KO6UKhzJJKEwMyOcZUwsp/YZdMZA6mwzaGd7SpB3Id7WGy7c6aIiZbbwCUh1oebi3nC18nic1lFnJ/6/5MJWlJohLz3SbcSWrmlFtyVrtlH+bUi6ansCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894553; c=relaxed/simple;
	bh=sl95zODBaQusIgO7TPjUM+NpjV35Jo+DCZNIFfUI5I8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=RfKwlYJIwdLX/8Eu4wbQvwxPN+GD/AyGRlyhHLKdEvpQL1lxXLi/k6o1sQknJtHQ3CEY8P0I+dvQ+WJSBvzYxGScbNP6jd70atnv9TuFCm2VC+USlPhQm6eBfhxgjtiozQvqq6AszL0scURb8nVuaU0763YYW07SG+QwnMIiOhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=k6h8HRW9; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="k6h8HRW9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so658739a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894551; cv=none;
        d=google.com; s=arc-20260327;
        b=W7DxQZcWReQDuG+EozLFOC8ExPV8sm9QqyrPAGBMCeGmi00VH98XsYiXJkmvgiVjnt
         nPE0VLCb8OD+bWAfWUbamEQtRZKNR37v8I+p/NNMh5t/dFR24Bewopnxusns+w56OOZx
         vOpjh1FTikY5v070wUM6K/P3iKIJg52SNOG5V+wJoUjzMgiZuTSiNWOdtjDcblP/LY5g
         kP58dhIH8/Q9B5Q0rvsfypwGND0ArUZJdcIeZdEzt1vtmxgblOzMgjA5WIicNVkClu7s
         1Od5xI0Ok47cwkfiMw6vMotXqH8TCDCLpim3PDhyba8+a4vIh3xteYTW/kS7Hd4j7XKn
         4kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=vWQMCUDzhGyDLGQzfH414eGNJ+nqxboyUpIlYz2mzMw=;
        fh=2quMl/aF+DXTGlS00OnMcwmZYuxiTRRVBDnkg+9GyHc=;
        b=ZoaSDuQ8nLrRAEj4y6lUU4RJhJ3ii6PQxWxFEngwTyXIsXXcBaInJlDNZoj+gKOv1p
         ZrDTF00yEl323Jwj0yfz8HpFdSpvUwSZtw+YETWeNgePbS3vcZMrOxtlnW6pFbStM8r0
         oEycaO9YMhJYNeCxobvjePfzz0M/cEU7UZDYPuHDKD3vLf7SV26evU4XQMsKf3ipaOvr
         7Ax8clY8Uu4vNpc8gm575zaKDypvhJLm/s4ZJrHQ9jQuXrw7RgxtNfBl/IuLXmzDYKMS
         1wtm8RR/52+qRHm/Du0ZsTZRIgk8MvcB7ewQqAiKyF3AgCdKf4CjW+FNO5wSllzXN6jW
         bLxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894551; x=1788499351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWQMCUDzhGyDLGQzfH414eGNJ+nqxboyUpIlYz2mzMw=;
        b=k6h8HRW9AFQaKGQS2lE5j9u+/+UsOlRVOjjZsmvvwBIey/9/s8Ll/gb62p5TxYMfIO
         hD8fot/Pmk4o/7UMosSJ0PMYi9Yxlsbjh4nag9HnNFcE1u81EJ3eHmzxsabqLTZbzXFZ
         QBIJLReVejIrkrTJx7rRuR2OwT1wSkSWDDWQ12M0/3yLmwwlAxrHEqZXqzYgW/KhCFm9
         OXoXPF00xN6U089AffG/sTGVnLh69C7VwFk3MWS+JQYlTdC8BNVJAMhFPtOMv+jG/cof
         gHOhongw0wQJA7el/Mr/QqmkYKWUem5kPgSgHQFlvGzxzTBFbgvddaoIpvnx9Hsz38nW
         JP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894551; x=1788499351;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vWQMCUDzhGyDLGQzfH414eGNJ+nqxboyUpIlYz2mzMw=;
        b=ZIHSnyB9azJPOsV7qek/ttInwetWMkcBWqaArQthDc4L8dPezUBjM7eOowVoNQdZ90
         t/QTQs6gC+H5/G5FTdibdIviWqECkhdLNTLkgsvHZ4g+dE25J5TmcakT1N48jl/gm/Nr
         D64UTWWifStfI/IhLZadvkV1UpaupEXrVarrZh7fmDcsCFo3t0FOHdZ2JZqUVaxRGvZi
         ZeSiwNn+iIYugCjj4Ha78E1R5OHvCUkH4ksf8T/6bHyg7LtNOt42zpswXVk6wfwtYnUW
         LHFQLA8Jc/l31+5UDuR64DyBn/izqEKpmAR1PcxQDerf2tBRwCTCEMQo8qnsmNDWpaIe
         OkTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBnGCKPwKRht/odmUCpDkGMn9Ub3qrn2GroJwj0Vi3lWNL0xw3/PPsvpetjHiMuOrMCj9SGudflzefgUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnQ0O+0NyfPGgxFT3spL6ntR7TIVPyl74K6Re0nag3HChTNClf
	xf7U9Iqu7tDyPnoWYdLLPjPlEkql48j7fJehnFrZl8LjsDX2r6LsYKQIWEvr0TP7l4moKlfhFmD
	bnD0vS8MOJDFaF4dXNif0xcawdOBuKSbE7YxA0xOc
X-Gm-Gg: AR+sD13TNMQnNrXazcrgMJ8CTBOiRXqXTXOL0Td+vxv8Y2FIQ7+LoaJ6zOE8kLkhLoh
	52n+Hzv0plMu6cDYC2UK+qPzNcArO8FPXy6XIy89JQG6oYuszj5pWQx4UE4RClwxuC+p9TVcSwH
	bRIUHBRe1T9anzuaDAnYmHqAr20QLkZxgaHtXjPy/og7Gg7nmnS06MqJ3j5Lm4egljb//5r+ADk
	WItYIhx9VpMU8JI/iaNnjdl5L656mtBrMwHSWVfSe1fXE85IBLBkG2TjSrgrSdcBjjPVQ1VKWHF
	pyb5pAhT5Yec5bBm/I09K8OPDnQ1dLAp7bMoGJo3E4YA+q2G1N4541hfCP2//VZUk4Mux2jwzJR
	LwRg1EXHiHXLR3AoFNTnnJSPJVK1bmVtl
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id
 98e67ed59e1d1-396d10076e9mr8898313a91.13.1787894549907; Thu, 27 Aug 2026
 22:22:29 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:22:28 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:22:28 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:22:28 +0000
X-Gm-Features: AcwNN1Umw9_qaqakQNyMoWQELEHjqho4Hul3bBnDmiYLfIj_vD1zvtPjrMp8Shg
Message-ID: <CA+0ovCiJZz6O8LzsS9Dq1-JE1OE1L_OTA6Mr-WratpUE6jczHw@mail.gmail.com>
Subject: [BUG] rtrs-clt: general protection fault in process_io_rsp() / rtrs_clt_rdma_done()
To: "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: falemi@asu.edu, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/135-rtrs-warn-on-peer-supplied-completion/

  Oops: general protection fault, probably for non-canonical address
0xdffffc000000000b: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
  Workqueue: rxe_wq do_work
  RIP: 0010:process_io_rsp drivers/infiniband/ulp/rtrs/rtrs-clt.c:502 [inline]
  RIP: 0010:rtrs_clt_rdma_done+0x732/0x1450
drivers/infiniband/ulp/rtrs/rtrs-clt.c:637
  RBX: 0000000000000058
  Call Trace:
   <IRQ>
   rtrs_clt_rdma_done+0x732/0x1450 drivers/infiniband/ulp/rtrs/rtrs-clt.c:637
   __ib_process_cq+0x149/0x440 drivers/infiniband/core/cq.c:110
   ib_poll_handler+0x78/0x280 drivers/infiniband/core/cq.c:157
   irq_poll_softirq+0x1ea/0x500 lib/irq_poll.c:110
   handle_softirqs+0x191/0x5a0 kernel/softirq.c:622
   </IRQ>
   rxe_receiver+0x1224/0xc940 drivers/infiniband/sw/rxe/rxe_resp.c:1567
   do_task drivers/infiniband/sw/rxe/rxe_task.c:127 [inline]
   do_work+0x1aa/0x720 drivers/infiniband/sw/rxe/rxe_task.c:191
  Kernel panic - not syncing: Fatal exception in interrupt

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
