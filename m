Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833979;
	b=v/3xIGYitTesTNJNZS8yWpxApXQm0OtkSZeNxC9vONAC+yBpYmx7dQddQ0OjEEFBg2Y0
	 r6S/xMEpKC1/4djyABLEcPCpVktqY9KHPk0sf5yG9byqF0wvGIEJ3vKl/ZYlYpSL9NzGj
	 CW9i/uaqgDpd04LU6eyxTAijo23iHiPtpI2hYPf+EiiVWKfmTA9yT0YXTMafXB7XLeJZ3
	 dvOnHyy3lTgDURbH2pEyhOTi7PXKIWxxzThvsWWDbLcWIZTAKkcWyAagDEUxkdPigyPfK
	 3gHRyP9HzgIpMGRmm1kx/hIPztE9F9AiTtXYF4Y/w43g0A5H0oCDafhAP9jIXNKv2Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833979;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5z4xnPV4/wkksCnrUoubh2iQH2xhzqS99QSqjxr3ccw=;
	b=nxXLA5D7btlYnH+zoWXjsgaV3rHiXF0b497xWCMnuw/2/fVOJb3oAyoiSloSSKWYPlkY
	 tQy8JLAjH0TOsGzxRuSETRyn44lh1RI+0+1JcVLdMiGl4p16iqkQFX+jnMNFmIrdw+ce5
	 KbxFMetivcSgazf2F1704i8vNtzU3YEyHx+GOG5BUfmiaQmoQ+FBPgdTjLyyjb2e3tCpG
	 L8UF8b1HcsJ3QFfJimk8BRU1i5m1ofJOBP8Csa0jEh0JZXVIEJ6g95RVs8pRGYd6z0vIh
	 iFNS+2xnmwHntzjOMiUfQm5FRgNPft25F7MLGNK0f3PZKTDycTh46+IJJVXlOK3on7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GGhaI4VR;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7E606A33B;
	Mon, 16 Nov 2026 12:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA7E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GGhaI4VR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5z4xnPV4/wkksCnrUoubh2iQH2xhzqS99QSqjxr3ccw=;
	b=GGhaI4VRy4IePAFtjN3m7Cbp20cvwRUu0Ne2ojWBgcVDYjzlc7O5DZDMtbgpDNxnkJTnGTzam
	BsxUAaKVjfJfH86VWlj/w5OKCdWNNI1drxYGlLqZtifEsM6vvplCincLxA8aO9n3SghFrNVU4/M
	pvRdMgaI1kHZyxnsODV5GpI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxC0rQyz1T4dt;
	Mon, 16 Nov 2026 20:58:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 30C152011D;
	Mon, 16 Nov 2026 20:59:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 00/19] arm_mpam: Add L2 cache monitors
Date: Mon, 16 Nov 2026 20:58:55 +0800
Message-ID: <20261116125914.498841-1-ruanjinjie@huawei.com>
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

Resctrl exposes cache occupancy and bandwidth monitoring only at the L3
scope. MPAM can count the same things on an L2 cache: firmware points
an MSC at the cache it belongs to, and its CSU and MBWU counters can
report the occupancy of that L2 slice and the traffic the cache sees.

This series first reworks resctrl's monitor bookkeeping to track events
by scope instead of by resource, and then exposes those counters as
"l2c_occupancy" and "mbm_core_bytes"

The patch set is organized as follows:

- Patches 1-4:   Rename to drop the L3 prefix
- Patches 5-7:   Rework the bookkeeping, index monitor state by resource
                 and event, index the event table by scope and eventid
- Patches 8-13:  Make the core per-resource and add the L2 events
- Patches 14-18: Let the driver pick L2 classes for the L2 resource,
		 and expose the L2 events
- Patch 19:	 Update the documentation

Notes on the user interface
===========================

The L3 event names and semantics, the L3_MON and mon_L3_xx names and
the x86 PERF_PKG files are unchanged.

The L2 bandwidth event is called mbm_core_bytes because it counts the
bytes the L2 cache sees, which is not memory bandwidth.

And mbm_L3_assignments remains L3-only.

Testing
=======

QEMU, topology with L2, L3 and memory-controller MSCs:

- info/L2_MON lists l2c_occupancy and mbm_core_bytes, and per-core
  mon_L2_xx directories are created.

- Reads: l2c_occupancy 262144 bytes (50% of a 512KiB L2),
  llc_occupancy unchanged, mbm_core_bytes advances about 20GB per 2s
  sample.

- CDP halves num_closids and the monitor counts of every monitor
  resource.

- RMID limbo: a freed RMID is marked busy in every L2 and L3 monitor
  domain, and becomes allocatable again once those domains are
  offlined and the busy count reaches zero.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

This series is rebased on v7.4 rc3 and also available at:
	https://github.com/ruanjinjie-eng/linux/commits/mpam-l2mon-scope

Changes in RFC v3
- The event table is indexed by scope instead of by resource (Reinette)
- Patch 6 is split out so no helper takes an unused argument.
- The RMID limbo threshold is kept per resource, so an L3 domain no
  longer compares its occupancy with an L2-sized value
- Bugfixes are split out  as their own series.
- RFC v2: https://lore.kernel.org/all/20261029123611.1108424-1-ruanjinjie@huawei.com/

Changes in RFC v2:
- As Ben suggested, the existing event types now apply to any resource,
  instead of adding L2-only event IDs.
- As Ben suggested, L2 bandwidth uses an assignable counter that stays
  with the monitoring group, not a monitor borrowed for each read.
- The CDP change also halves the assignable counter count, for every
  monitor resource.
- Split by subsystem so resctrl, x86 and MPAM can be reviewed separately.
- Fix a CDP bug: a failed enable left the driver believing CDP was on.
- RFC v1: https://lore.kernel.org/all/20261022084821.4014873-1-ruanjinjie@huawei.com/

Jinjie Ruan (19):
  fs/resctrl: Rename monitor events to drop the L3 prefix
  x86/resctrl: Use the resource-agnostic monitor event names
  arm_mpam: resctrl: Use the resource-agnostic monitor event names
  resctrl: Remove the L3 monitor event names
  arm_mpam: resctrl: Index monitor state by resource and event
  x86,fs/resctrl: Record the resource that enables a monitor event
  x86,fs/resctrl: Track monitor events by scope
  fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
  fs/resctrl: Add the L2 monitor events
  fs/resctrl: Set up MBM state and workers for every monitor resource
  resctrl: Keep the RMID limbo threshold per resource
  fs/resctrl: Check RMID limbo on every resource with occupancy
  fs/resctrl: Manage assignable counters for every monitor resource
  arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
  arm_mpam: resctrl: Look up the monitor domain id from the components
  arm_mpam: resctrl: Report counter assignment per resource
  arm_mpam: resctrl: Allow monitoring on resources other than the L3
  arm_mpam: resctrl: Expose the L2 monitor events
  Documentation: arm64: mpam: Describe the L2 monitor events

 Documentation/arch/arm64/mpam.rst       |  25 +-
 Documentation/filesystems/resctrl.rst   |  11 +
 arch/x86/kernel/cpu/resctrl/core.c      |  13 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c |   2 +-
 arch/x86/kernel/cpu/resctrl/internal.h  |   2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c   |  10 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c  |   8 +-
 drivers/resctrl/mpam_resctrl.c          | 357 ++++++++++++++----------
 fs/resctrl/ctrlmondata.c                |  13 +-
 fs/resctrl/internal.h                   |  55 +++-
 fs/resctrl/monitor.c                    | 328 +++++++++++++---------
 fs/resctrl/rdtgroup.c                   | 158 ++++++-----
 include/linux/resctrl.h                 |  36 ++-
 include/linux/resctrl_types.h           |  16 +-
 14 files changed, 619 insertions(+), 415 deletions(-)

-- 
2.34.1

