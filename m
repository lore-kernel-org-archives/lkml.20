Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1246A5E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519120; cv=none; b=Cfyt08aQ5CmVpkHpSOPuzVE/Lbz5+VeM+ROX2oJb1j8hBermB6Dkj96mdFFd77R1CuF4RSbA+xz5zEUFGrF7g9FNRkQOpr7bODVtWubmDcsOFCXzlaYrGq/N+qqG/7ijakgpsh4G/UIagcJ2jk9DX2Mg3X/giM35Zq58jx9+RCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519120; c=relaxed/simple;
	bh=CRZ5621kJBUf0kFBzIs/p6RrIVmIC+L8HojR3yFkYa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+wp9PNUmIrlgH8/MezzwdkY76KuLb9KZBAt/4XkSnS1KGt9sIsaRUtFHhRLsB17s4kD1b96uCqqSLjyc72PV1qkO8BuhNW4ha33Gm0aQ82TVmQEGYav0lmFuNWgT2nPmKjUUL3S0rD6ZgMttBWhL5QuKYF6YFZT8d+SG5bPKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T3E1j5o/; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T3E1j5o/"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c7c25d9f6fso828394e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519116; x=1789123916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EeZIpn+895MAZ1fW9hfBwDfRAEOEt4BIsCHza52OGII=;
        b=PBqfnGXajv28TBDgWKsPbbswW+hAz15LRR9vQ30gaH6MfYT5IFgs/E0ST+bYYRrtp6
         u50uh8cCoQWUvIG6ZAf+vDIz6EiHvsxWROv4sfOLBcuiGUyE4dmtVD7fvHysESM6KvZY
         byhJrh1mr8n8nu1zC3UFBIs0s7R3TcIH+Yx6zGeMta9rwcvzNxymr9dVqMFqIzqhzrb6
         fcYKwlO7N1VGBgfmmTB/YSod2PmnJoj+0xLscuao3LRYMk5KMVsKj9LgJg0H9y778kLI
         JVSZQ6crhu7FP/ySgwUy1ttmiyT/I727eZSHxqyU5kX8khS3UVgkTYE03XITpAQzmlXH
         c+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwVUFr7IrOiIf/VJLlB9ShZCIiLBCUOJ+Im0r8CjVy4MvuP7B2zbbWCK7mgd5pExrPMMm4V/sNfbh6aec=@vger.kernel.org
X-Gm-Message-State: AFuF++nVnE+COkmGBmupSxZ3BSVEmSmYocLjn+mpdomaWYGCCD8D5HeJ
	lX5c/u40P+iDSxpQt5V8l5n8Da/DNDbcY2ONJpnGxQu3NTADycJBVYVaAdexZ4mi5MyHXeeCbGL
	ui6oTEs/2B/VieJqjiXBvjjrdW/bCtlLXIZf9CBMY9NlwN3JMR0ahzWQaXTArl/vSugEdLUl3ud
	TW/JodKQ/BxhzpMTzZ7Nf5vUWQ+YyGFMBasfsaht4LJU4wfHNM2wNFkzQqbe2FsNHRf5UVlYmDM
	DPnyt+OmZVusyMzhGJC
X-Gm-Gg: AYBFou2FcCXLEk1jhu5hhyZW8nATEVntdZ4GUaQsb9XVbsRYTtMHqySZ6+p5j6gD/dN
	q55pYHh2GjQzncGpvqjc1QHOWS6l43dbSUpfZjimE379MEDzuKSJQNYgpAI/LX7IV0y/odWaJGC
	6yz3JrBpRcew2CmE3/Jj+rbsu5h0I9Lk8hauoZZfQK8lH/PTFTDrYG10SSJVMOCU3mKLqjJgI8m
	46TKwBWiroBQpe9ZP73DTmq1OpztZu/lM6zTyT7/bOWId/r8IeXx0flMoEvNZ+mN+locsD4CDv1
	BRq0Jn2FV1BOH3I8X0xh/Enuht0ADRLNh4SOzGgaJR2kfgnLXmukGiJ3luUjH74zMb4jVj4mqkL
	/yeJ3ukKxiEsvrabKDdMygSowbb/H3xY2DKHNxvo66OLivXGZJfGEQPO9zstCWaQ5DQeX+f+7ax
	Qh9/TCiseKP/rtiDLHALOH3tjPYNw+iJklHA==
X-Received: by 2002:a05:6122:c11c:b0:5c6:64ac:d6f3 with SMTP id 71dfb90a1353d-5c7ed612e57mr2110276e0c.3.1788519116501;
        Fri, 04 Sep 2026 03:51:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec232ce8sm1060315e0c.5.2026.09.04.03.51.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:51:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1155142a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519115; x=1789123915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeZIpn+895MAZ1fW9hfBwDfRAEOEt4BIsCHza52OGII=;
        b=T3E1j5o/D3XZILv1ITS/3xwiAvhtY0AjR34wo/uHW5V07eV97wq6535rbs2OjKMcXb
         f4n+HaR9SxYb/hZDsDat+23kBY8XnJec8a8FB1z9wo4PiHvTOKB7AUgO3S2cyAUtjQux
         cvSYkXyZaWHc/IovhaDc2jP0WW4bqEwHjDo0A=
X-Forwarded-Encrypted: i=1; AKwUvBwLn4caSl/ym0z0rfyrqremrGQdPtOy2rp/Ry7f+XIfqruWQVlYVFH4Zej6SgFu/f9FYrrQSlWEey+W5vI=@vger.kernel.org
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr7938673a91.25.1788519114896;
        Fri, 04 Sep 2026 03:51:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr7938612a91.25.1788519114416;
        Fri, 04 Sep 2026 03:51:54 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:53 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 00/15] Add BNG_RE control path verbs
Date: Fri,  4 Sep 2026 03:43:08 -0700
Message-ID: <20260904104328.763768-1-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This patch series adds control path verbs support for the bng_re
driver, along with the corresponding bnge driver changes it depends
on.

Fast path verbs depend on a specific HW resource configuration in the
bnge driver, and work on that is in progress. We plan to submit fast path
verbs support in a follow-up series once the dependent changes in bnge
are pushed and available in the rdma repo.

The corresponding rdma-core user space library patches will also be
published shortly.

1) bnge: MPC infrastructure change
2) bnge: Update New HSI
3) bnge: MPC ring reservation change
4) bng_re: Add RoCE MPC infrastructure and xid manager 
5) bng_re: Add support verbs
6) bng_re: Add ucontext/mmap verbs
7) bng_re: Add GID verbs
8) bng_re: Add PD verbs
9) bng_re: Add MR verbs
10) bng_re: Add CQ control path verbs
11) bng_re: Add SRQ control path verbs
12) bng_re: Add statistics verbs
13) bng_re: Add AH verbs
14) bng_re: Add QP control path verbs
15) bng_re: Register device operations with ib-core

Thanks,
Siva

Mohammed Faraaz (1):
  RDMA/bng_re: Add AH verbs

Raqib Jones (1):
  RDMA/bng_re: Add MPC, XID management, doorbell infrastructure

Sachin Holla (2):
  bnge: reserve TX/completion rings for the RoCE MPC channel
  RDMA/bng_re: Add GID verbs

Saswati Das (2):
  bnge: Add infrastructure support for RoCE MPC channels
  bnge: Add HSI definitions for 64-bit doorbell and MPC channels

Siva Reddy Kallam (3):
  RDMA/bng_re: Add ucontext/mmap verbs
  RDMA/bng_re: Add CQ verbs
  RDMA/bng_re: Register with ib-core

Suresh Rupanagudi (3):
  RDMA/bng_re: Add PD verbs
  RDMA/bng_re: Add MR verbs
  RDMA/bng_re: Add SRQ verbs

Usman Ansari (2):
  RDMA/bng_re: Add support verbs
  RDMA/bng_re: Add Stats verbs

Usman S. Ansari (1):
  RDMA/bng_re: Add QP verbs

 drivers/infiniband/hw/bng_re/Makefile         |   16 +-
 drivers/infiniband/hw/bng_re/bng_debugfs.c    |  308 ++
 drivers/infiniband/hw/bng_re/bng_dev.c        |  269 +-
 drivers/infiniband/hw/bng_re/bng_fp.c         |   38 +
 drivers/infiniband/hw/bng_re/bng_fp.h         |    8 +
 drivers/infiniband/hw/bng_re/bng_fw.c         |    6 +-
 drivers/infiniband/hw/bng_re/bng_fw.h         |   27 +-
 .../infiniband/hw/bng_re/bng_hw_counters.c    |  304 ++
 .../infiniband/hw/bng_re/bng_hw_counters.h    |  118 +
 drivers/infiniband/hw/bng_re/bng_mpc.c        |  574 +++
 drivers/infiniband/hw/bng_re/bng_re.h         |  275 ++
 .../infiniband/hw/bng_re/bng_re_mpc_roce.c    | 1861 ++++++++++
 .../infiniband/hw/bng_re/bng_re_mpc_roce.h    |  218 ++
 drivers/infiniband/hw/bng_re/bng_res.c        |  299 +-
 drivers/infiniband/hw/bng_re/bng_res.h        |  321 +-
 drivers/infiniband/hw/bng_re/bng_roce_hsi.h   |  317 ++
 drivers/infiniband/hw/bng_re/bng_sp.c         | 1965 ++++++++++
 drivers/infiniband/hw/bng_re/bng_sp.h         |  458 +++
 drivers/infiniband/hw/bng_re/bng_verbs.c      | 3211 +++++++++++++++++
 drivers/infiniband/hw/bng_re/bng_verbs.h      |  379 ++
 drivers/infiniband/hw/bng_re/bng_xid.c        |  110 +
 drivers/infiniband/hw/bng_re/bng_xid.h        |   26 +
 .../infiniband/hw/bng_re/bng_xid_allocator.c  |  870 +++++
 drivers/infiniband/hw/bng_re/xid_allocator.h  |  114 +
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_auxr.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |   32 +-
 include/linux/bnge/hsi.h                      |  161 +
 include/uapi/rdma/bng_re-abi.h                |  118 +
 include/uapi/rdma/ib_user_ioctl_verbs.h       |    1 +
 30 files changed, 12356 insertions(+), 50 deletions(-)
 create mode 100644 drivers/infiniband/hw/bng_re/bng_fp.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_fp.h
 create mode 100644 drivers/infiniband/hw/bng_re/bng_hw_counters.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_hw_counters.h
 create mode 100644 drivers/infiniband/hw/bng_re/bng_mpc.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_re_mpc_roce.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_re_mpc_roce.h
 create mode 100644 drivers/infiniband/hw/bng_re/bng_verbs.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_verbs.h
 create mode 100644 drivers/infiniband/hw/bng_re/bng_xid.c
 create mode 100644 drivers/infiniband/hw/bng_re/bng_xid.h
 create mode 100644 drivers/infiniband/hw/bng_re/bng_xid_allocator.c
 create mode 100644 drivers/infiniband/hw/bng_re/xid_allocator.h
 create mode 100644 include/uapi/rdma/bng_re-abi.h

-- 
2.43.5

