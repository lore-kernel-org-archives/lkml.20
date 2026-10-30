Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384145;
	b=oougDHbiWQshcdleQ9SM0BAF0pwuoe4U+MnCbgVEXdUN/qFwiDQjC00+g/gcWHvY/NYy
	 vGRxrqLrw39TRzT0Oluoz6kg2Pw+jPix08x6bVqqxeby5EstMMe6t+5jVy4dMVUb90uk3
	 0/5auJDMOYeDVKiS9gFozxaOVEN4hykVhTZ1SeRXwZb8q7DZA4B3iU1wy/bP0EGck1pxw
	 TqK902itLYPqTUJ9R/0+LbZ0/c1fBWLQT2OL3KUNCVfhwDTnRSEM2/bJIyj+a8Des1Gwa
	 IpGeG2CEo/QOAXpmHifVU4uwPbDjnhLFA/309C1V4N5Ll+jK/09a5DOmVCjK3Qfv/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wCcV0rg12r0VQC1RmFLoD9rDhMDyyca61RfRGBocBOM=;
	b=qWZ6nvpwLBxyt2PGjZA4EQlJ2lWtl12WOiXVvn0ecJ/VpNnOc6AHaqdAhnKW6U0v4LpB
	 RvptK+By0Ixh3dqvrKk8SBR1rJRYwTQwSABvnzvb/CkhhkN/ysINYHa3K0rv0OmJOp8t5
	 ZQPQVQempRUPRPw9JjM3NLXhTHfkklJTd6nB4nCQNB+FEnMi/ta+vy2rGLUvThJyFJiA8
	 DY0YQsBUH20nfwtkM4vs+D0UIfpbMwPkwFYW8dfr8K8jh8Gyz4isvIhXuvCvRx7pCH8eZ
	 /IXHQnfBs5cggomzW2ur+iPOgnuTxYih2y52F2JNkbCYA9F/r0pYOQhcdfCdGFEqqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=iWXYbrXf;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBEF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=iWXYbrXf
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c19c6721a3so631542137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384144; x=1793988944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCcV0rg12r0VQC1RmFLoD9rDhMDyyca61RfRGBocBOM=;
        b=iWXYbrXfu5hW2s3o3NyEH3ysvIQRWa+eRuSLHPgi4zKa5vI/fbl9OkezffsokkFKLG
         mT0PXgz88oWvayTXyWq/EGZPauJyG5XsfYorOS2w2XnUGnJG69/I8cvGX73pYKMJA9Ah
         4NMyuzhDuN3R1gQQkQTWAp5HMHyzd6x+9qVNvdWiwNMaKqwTlebbSD9GxvG5d4N7ps38
         DbcmDdxPmwVhOYR34rSjZiwbO8rvOQeb8uWu6Tab0/f2T/nBMxeG6IhZGXqBpGewZgJ4
         nTASu0Tbxt/t2ldo2hlQ4BOLQxvagdABp4/2aVh+G76tSyA4djFn0HjLRVnu2i0bJRdF
         Ar9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384144; x=1793988944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCcV0rg12r0VQC1RmFLoD9rDhMDyyca61RfRGBocBOM=;
        b=ti+iV3dQ9CjQR32BqaW5RBc3F1WRQFMBui4qMsI5kzMPbd/egsqY64VMk4dHe7EJHP
         xklPibjWh6s7VCZBh70GowyKr54W0blmVuf31E2FZ/AHM6C49uVQzIOJZ100hDTFA56L
         9F14d9aEwVMBo8lZSGid1kWXirr5GtrdY1hMMyuzaXCXUC0m1nxhS55+qcV5WdNyj+px
         l0LvtTmBI2sVGMlU+WbcTbh4HZiK3HtO2iMpxmGjcZNcAn6ndpmwah1VimrMlhIUB2FT
         SzGmfBD074x97L/LGblDYfwgb4ru2y9wWMMBxqcBCUoptRx5Qn5O2zNp6W1rJdulzJof
         i4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzphiSVdOAVQQX95tjJEYkkTgjZN1PF8hdH+WvNoBQZ3DzWSNENzpQPo81RsYrqI7DkivKIBurLyCstWmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuHhofabp+sYtRum3TE0xe5xYq/qyIB1V8xPYZB/yEr1zLyXQJ
	wt+6+yTJId7fx/hjaJM57tePFG+tn0apfF7RaJk/mkjpK4FeX70tNuMfw9uauPrGl8m/
X-Gm-Gg: AYBFou1hUyuT/MUwIclOipPpJD2kVaum/NM3KJ5AwwUZr7kqlZK5qM+8fKSe/wAs2Ii
	RSugljgI49sYDrfN1cwqjCbTJJ5Jn8psCasD5u+WNuj/jmNhMdiZamyFcss3DwWNrrc8FBHUx2Z
	zfg/drRr+zgnonYg9UXN4XcYHzYikGXRSOMVlH3NIcRjjf4rrQUR5ZFiQHQATisN7gX8uVDk+b2
	pECq6vJ7lbokx8N0R5y7ElI4r41ngP3Atq2wMiRvBZQmE9VuwsEX7qpe1qxrktMqgYoXlkp0MC5
	m6M4ke1hm/ELATfHHcvQZaQ/moApaHppYbEbMqJ8m0J4LaVSNW0/GASwxCJi4CjhA1ZtT1CPNI3
	BZquHQ9VnOMdLoa+SBoVPjUwYfcjEkN6XTPzxcWZOa0RngQkRZOKoDmsTKmeHKzPm0ivtOOHXoa
	mg2mBlUAogruda5GurNEiw6Du8aOiEd4ESqM1CLF4XGKJp/FlM7hQ+eFITVvpwDBMCo5fZw0lAq
	ZjgnfblY3S+aHk17lMYGE96PkQbop6p4xCmHHEYnMLi6OU2P2diqi6LUE1kKuFhsJe/iKBb0B32
	XMoAKEeT7IbjMB8ZVNJFsI9lLlUGzgxFwoGFm/vU59FBFaMccdPD0nHBDJgvBKYJWkt1FmQb2Ny
	0bqw0BFlYM8/EIz4BC7unJkj7QdqGaf07P5O1cn1pPao=
X-Received: by 2002:a05:6102:442c:b0:7d0:6cf3:d8f3 with SMTP id ada2fe7eead31-7d0726cdc38mr1776278137.18.1793384143954;
        Fri, 30 Oct 2026 11:15:43 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:43 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Moroni <jmoroni@google.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v4 0/6] RDMA/irdma: Add support for ioctl
Date: Fri, 30 Oct 2026 18:15:06 +0000
Message-ID: <20261030181512.2056056-1-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
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

From: David Hu <xuehaohu@google.com>

Hello,

This patch series introduces support for uverbs ioctl queue creation
(QP, CQ, and SRQ) in the irdma driver. This series makes progress towards
modernizing irdma. This enables 1-step queue creation from pinned UMEMs
and shared dma-buf heaps (system_cc_shared), providing RDMA support for
Confidential Computing (CoCo) guest environments where memory encryption
otherwise prevents standard host-VA-based queues from operating.

Historically, irdma relied on legacy write() commands for queue setup.
This series modernizes irdma's queue creation path by adopting the ioctl
infrastructure:

1. Plumbs uverbs_attr_bundle into the irdma QP and SRQ creation routines.
2. Registers irdma's UVERBS ioctl namespace definition for QP, CQ, and SRQ.
3. Implements 1-step queue buffer creation for QP, CQ, and SRQ using
   UVERBS_ATTR_CREATE_*_BUF_UMEM attributes and ib_umem_get_attr(),
   configuring hardware Page Buffer Lists (PBLs) directly from pinned umems.
4. Split CQ creation setup logic by umode and kmode into separate
   routines to be consistent with other queue creation logic.
5. Adds support for driver-specific shadow area UMEM attributes during CQ
   creation with CQ resize capability.
6. Preserves backward compatibility with legacy 2-step write() path
   registrations when UMEM attributes are not provided.

User space rdma-core PR: https://github.com/linux-rdma/rdma-core/pull/1766

Testing:
Verified with rc_pingpong, srq_pingpong, and dmabuf_pingpong over irdma
devices in Confidential VM environments.

Changes in v4:
- Reject dma-buf queue creation in iWARP mode and enforce page-offset
  alignment unconditionally in irdma_setup_q_pbl_from_umem() (Jacob)
- Bound attr->cqe in irdma_create_user_cq() to prevent cq_pages overflow (Sashiko)
- Fix to irdma_cq_free_rsrc() was sent separately (Sashiko)
- Link to v3: https://lore.kernel.org/all/20261016202909.1289496-1-dhu@x6u.co/

Changes in v3:
- Improve patch 4/6 to split umode cq creation to a new callback
  .create_user_cq() (irdma_create_user_cq) (Leon)
- Clean up duplicate bounds and NULL checks in cq creation path (Leon)
- Link to v2: https://lore.kernel.org/all/20261015011940.4122452-1-dhu@x6u.co/

Changes in v2:
- Add patch 4/6 to split out setup logic from irdma_create_cq() into
  umode and kmode helpers (Leon).
- Rewrap commit messages to ~75 characters (Leon).
- Fix a pble/umem resource leak in irdma_resize_cq() (Sashiko).
- Link to v1: https://lore.kernel.org/all/20261011011022.1445352-1-dhu@x6u.co/

David Hu (6):
  RDMA/irdma: Plumb uverbs_attr_bundle for QP, SRQ
  RDMA/irdma: Register irdma UVERBS ioctl namespace
  RDMA/irdma: Support UMEM attribute for QP creation
  RDMA/irdma: Split CQ setup to umode and kmode
  RDMA/irdma: Support UMEM attribute for CQ creation
  RDMA/irdma: Support UMEM attribute for SRQ creation

 drivers/infiniband/hw/irdma/utils.c |  12 +-
 drivers/infiniband/hw/irdma/verbs.c | 759 ++++++++++++++++++++--------
 include/uapi/rdma/irdma-abi.h       |   5 +
 3 files changed, 573 insertions(+), 203 deletions(-)


base-commit: c3e8e9451e6f1b69f685b75e0fbf14f3d0fb2539
-- 
2.56.0.317.g454f8302e1-goog

