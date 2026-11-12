Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489202;
	b=eT7l4iGMv5jRbisNoJAVr+3103ZFfenPRlQESHcAkWsi8r6/QuNQ9YqHX/8sGnieOnPr
	 106Ah4f1NCEJ3AoFgrOGqmMPMIl94Nyvwy3i4VO/LQXGcZJMEy237YUNh49m9hx5v+PQJ
	 Iq1meVazFaflRmU0eu996NS7jUXU1gWIF+goYmldd/3bS9ndSa4qKvevjhECwhhszaoxh
	 sulQ6POerbbOIB9Gk5jtST9UkcALyvS9fkTp6lz3DDt0inUdDjK7Y8laSxzHaCxOjiB1c
	 yZb5voLmTnUVNehjpXw5fkD9vXbVKapdjMDFn46VxOPgMtJhSHRBwVPbv06/GrFmyhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489202;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=uAjtZOgqP1xFIodDG4lxbEDIZIdahu3nqR7pJwwfQ0I=;
	b=w6wLtAjHdMav3QAal0zYEDSU4KvfCXxeM9qWhElF+bXjO81Nv2QFfqtozCtRy3YSqqmD
	 5yOaIrIQpJ4nuX+UqbbKPc0yGmYi/JWHbR73DUG0aMlBM3Pucg67uF9QKh2R5izVNSBVc
	 8SDCqc5FEHLFkoaumC0awy0b0kn9yyZ7FE/7tJkzilhX5KpGKrEqXyyGNbZye53CCthbr
	 xMjD4QWuBcYxZ3380H97sKT6Dt3m6dGFqDilTwZK0MEtQGt2v7t7BN31tRRH6aTdnH4gj
	 fOoXJy3f27VosOgDPZ21LgK2CeqXMA7WCXzpW/5im5elW3sPM3V2Lu5+3fM3R8Moihw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MfQ0njGU;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6C606A332;
	Thu, 12 Nov 2026 13:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC6C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MfQ0njGU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uAjtZOgqP1xFIodDG4lxbEDIZIdahu3nqR7pJwwfQ0I=;
	b=MfQ0njGUgySFiCDcmSDn4lF6Shc6Hpyq2Ho6GpDY5+0t5ZpYu96000K5qo1JR8wM+o6XWX72b
	M9DgOJBL2rHkMSYVUqePW7G2fyTLaJuUxsILVxXqROwgNcDlNXigB15N+c1LL2p1Lg222VXtJAs
	0DnqT+mQNTrd6+LA6qY7kz4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jQLQj6jVRzcbPN;
	Thu, 12 Nov 2026 21:12:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B256D40579;
	Thu, 12 Nov 2026 21:13:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 0/9] fs/resctrl: Support mba_MBps on MPAM
Date: Thu, 12 Nov 2026 21:12:45 +0800
Message-ID: <20261112131255.4043381-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Resctrl offers two ways to describe an MBA policy:

- The percentage interface writes a fraction of the maximum bandwidth
  into the hardware control register

- The MBA software controller (mounted with -o mba_MBps) takes
  an absolute target in MiB/s and adjusts that percentage based on
  the MBM counters sampled once per second.

The problem is that a percentage alone isn't enough. How much bandwidth
a percentage actually corresponds to depends on the memory frequency,
the channel count, how many threads are generating traffic, the access
pattern, and the traffic of other groups. And neither MPAM nor x86
resctrl reports the maximum bandwidth in MiB/s. So an administrator who
wants to enforce an absolute budget (a tenant SLA, a noisy-neighbour
limit) has to measure and re-tune the percentage on every machine. x86
resctrl has had this software controller since 2018; MPAM has never been
able to use it.

This series makes mba_MBps work on MPAM.

What this series does
=====================

MPAM refuses mba_MBps in two places:

- Its MBM counters are assignable, and supports_mba_mbps() refuses
  the option when they are.

- Its maximum bandwidth control is a soft limit by default, which
  can't hold a single requester down to the target.
  MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.

MPAM's monitor groups also each take a bandwidth counter from a shared
pool, while nothing relates the number of groups to the number of
counters: a group created once the pool is empty is invisible to the
controller.

MPAM also makes two generic defects reachable:

- Writing the control register sleeps (smp_call_on_cpu()), while
  the worker runs under the RCU read lock

- A 16-bit fraction lets the minimum control value reach zero, which
  divides by zero in the estimator

The patches:

- Patches 1 to 3 fix the two generic defects

- Patches 4 and 5 make the loop runnable on MPAM: the worker takes the
  CPU hotplug lock around the sleeping control update, and assignable
  counters are accepted with a fixed assignment mode

- Patches 6 and 7 handle the maximum: mba_MBps is refused where only
  the soft limit exists, and the driver sets HARDLIM.

- Patches 8 and 9 cap the CLOSID/RMID space resctrl may use to the
  number of counters while the controller is enabled, so that every
  group it measures has a counter.

x86 has no assignable counters in the mode where the controller is
allowed, and does not set the soft-limit flag, so its behaviour is
unchanged.

Changes in RFC v2
=============

- Extract the step decision into a helper, with no behaviour change
- Use bw_gran instead of min_bw in the estimate
- Drop the warning when a monitor group gets no counter, as
  the new cap makes it unreachable (Ben)
- While the controller is enabled, cap the CLOSID/RMID space to the
  number of bandwidth counters (Ben)
- Link to RFC v1:
 - https://lore.kernel.org/all/20261109132621.3862497-1-ruanjinjie01@gmail.com/
 - https://lore.kernel.org/all/dc1398f4-b81c-4ad8-b706-df89a1622e6c@arm.com/

Testing
=======

With the MPAM MSC model in QEMU:

- From a 9595 MiB/s baseline, a 7000 MiB/s target converges to
  6978 MiB/s and a 9000 MiB/s target to 8732 MiB/s.

- The memory-side MSC register shows MBW_MAX.HARDLIM set.

- A modelled MSC that implements only the soft limit refuses the
  mba_MBps mount, while a plain mount succeeds.

- With 8 counters and 32 PARTIDs, an mba_MBps mount reports 8 CLOSIDs
  and 8 RMIDs, and the 8th mkdir fails with ENOSPC instead of
  creating a group the controller cannot see

- With 4 PMGs and 64 counters, a plain mount reports 32 CLOSIDs and
  128 RMIDs while an mba_MBps mount reports 32 and 64: only the RMIDs
  per CLOSID shrink

- With mbm_assign_on_mkdir forced on while the controller is in use,
  a write of 0 is refused, and the user's value is restored after
  unmount

- The KUnit tests for the MPAM driver pass.

Jinjie Ruan (9):
  fs/resctrl: Extract the software controller's step decision
  fs/resctrl: Avoid division by zero in the MBA software controller
  fs/resctrl: Do not update bandwidth from a failed counter read
  fs/resctrl: Take the CPU hotplug lock for software controller updates
  fs/resctrl: Allow mba_MBps with assignable MBM counters
  fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
  arm_mpam: Program the hard limit for the software controller
  x86,fs/resctrl: Let the architecture cap the RMIDs for the software
    controller
  arm_mpam: Cap the CLOSID/RMID space by the bandwidth counters for
    mba_MBps

 Documentation/filesystems/resctrl.rst |   7 +-
 arch/x86/include/asm/resctrl.h        |   6 ++
 drivers/resctrl/mpam_devices.c        |  55 +++++++++---
 drivers/resctrl/mpam_internal.h       |   4 +
 drivers/resctrl/mpam_resctrl.c        |  56 +++++++++++-
 fs/resctrl/monitor.c                  | 123 +++++++++++++++++++-------
 fs/resctrl/rdtgroup.c                 |  66 +++++++++++---
 include/linux/arm_mpam.h              |   2 +
 include/linux/resctrl.h               |   2 +
 9 files changed, 259 insertions(+), 62 deletions(-)

-- 
2.34.1

