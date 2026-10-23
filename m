Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723728;
	b=NFUGIuLKqfPPMa44qFaaPZ6NVQMIAy/yRt4kVfROXhN6gi+m+QG0dnFT3aKxnmGrm9Hu
	 KyZqeQkpvZYeMgdtQE1ADuPYz7kvYwWEvClUNRJWO1Pc09Y39rbstx3bKn0VrR8EsrVgK
	 h94DTzgKY4jzrwFBkMpMz+14yktIqA565MqG+muO9a/c3aHfK8Nr5hKzqNX5mTU3okDD9
	 C1IpaF3FcrJUUZebfmCiMd+aDfSD5sLuEGwb7Jx5KaqYIjgFk82NSG87lwIF1zAZ67g1n
	 rO/y8N2b7nRWro++6gRfSXiTu3E+5WmQsVxy3rBv8yo5F33c+qAISCiOvPErY01YSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723728;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=m/IkO3f1LZN2+n6Xiaw/jAnFUfPFs7puhs4R49Ji5Go=;
	b=Sn0EAx+RqBGI1Sn9qa0NZu/KNpmZlHr3jDIG0+NJlSJpQwkcj6bf2EJ2yYDXLPJY/Z07
	 WUSvp9WHsJjeL2XiJpBo1l5yDp+vAr0guhFY2AHO0oppWOsurgq+k3FEfKERqTeCTo2r1
	 X9nK2REZKv8i9Izu0tsDq7C4WHfIAlWXM8ulBbUKrpY2DltSM9ZqxBYsr5zBCEU8nr/wA
	 5Zuep6CLyGk2x/U7UrbmxDWOd421mjzYeFys3q1+d0Dnb8rAqdRzF6pi3cZWvti5rX/im
	 tI3dlR9q9MMrG60k9E4RXhyvYOjj+tTAzQuGrvngZjUV+syMJ7wP9Y3n4EALCBQioHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tsqyZiq7;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86078606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86078606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tsqyZiq7
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m/IkO3f1LZN2+n6Xiaw/jAnFUfPFs7puhs4R49Ji5Go=;
	b=tsqyZiq7V9oAcpYSNj9IJ0am+GiXkzYb/LZPlwU9C3h/RBY8xfbwwX7fSE+dZLQcbT9tPDHxO
	5MuTjcUesLwT0GE+RzouWLSPnXA0kNyYMTid/mftVg3YnLFBS324Q8VPYn4Q+9a8r6Wq9/ztiz6
	j0ybQBWw+OdNRGkrww2zAAg=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXF2LSyznTXp;
	Fri, 23 Oct 2026 10:48:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A5C9940578;
	Fri, 23 Oct 2026 10:48:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 00/10] arm_mpam: Add extra MPAM controls in resctrl
Date: Fri, 23 Oct 2026 10:48:02 +0800
Message-ID: <20261023024812.232820-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi all,

Resctrl today only exposes CBM and the MBA bandwidth percentage.
But MPAM MSCs also have per-PARTID fields for internal priority, capacity
limits, a bandwidth minimum and the MBW_MAX hard-limit bit. The driver
already writes these fields, but resctrl has no schemata line for them,
so userspace can't choose the values.

So this series adds those schemata lines:

- Patch 1 fixes maybe_update_config(): a feature set with value zero
  counts as no change, so the register is not written again.
  The controls below can be zero, so this comes first.

- Patches 2-4 add mbw_min/max_limit, cmax/cmin and intpri to
  mpam_config and write them from mpam_reprogram_ris_partid().

- Patch 5 adds the resource levels, selects the range path by schema_fmt
  instead of the MBA/SMBA rid, skips the new resources in info/, and sets
  their default value when a group is created.

- Patches 6-7 adjust the fixed-point helpers and clamp cmax_wd.

- Patches 8-10 add the schemata lines:

  L2MAX/L3MAX       CMAX, percent
  L2MIN/L3MIN       CMIN, percent
  MBMIN             MBW_MIN, percent
  L2PRI/L3PRI/MBPRI INTPRI, raw value
  MBHDL             HARDLIM, 0 or 1
  MBOPT             MBW_MAX, raw fraction

The new resources reuse the class, domains and components of L2/L3/MB; only
the mpam_config field written differs. MBOPT and MBA both write MBW_MAX.

So before this series userspace can only set CBM and the MBA percentage.
After it, you can do:

  # echo "L3MAX:33751040=50" > schemata
  # echo "MBHDL:33751040=1" > schemata

A new group starts from each resource's default value, so the new controls
stay out of the way until schemata is written.

Tested this with a QEMU that has one L2 MSC, one L3 MSC and one
memory-controller MSC (CMAX_WD 4, INTPRI_WD 2, BWA_WD 16). The guest writes
every new line and reads it back, for example:

  WRITE-OK   [L3MAX:33751040=50]
  SCHEMATA: L3MAX:33751040=50

Then reads the MSC registers:

  L3 MSC  partid0: PRI(IN)=2  CMIN=0x3000  CMAX=0x7000
  mem MSC partid0: PRI(IN)=1  MBW_MIN=0x3fff  MBW_MAX=0x1fff  HARDLIM=Y

CMIN/CMAX are 4-bit fractions (3/16 for 25%, 7/16 for 50%); MBW_MIN is a
16-bit fraction (0x3fff for 25%); MBOPT writes the raw fraction (8191).

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

This series is also available at:
	https://github.com/ruanjinjie-eng/linux/tree/mpam-extra-controls

Jinjie Ruan (10):
  arm_mpam: Treat adopting a config feature as a change
  arm_mpam: Carry mbw_min and the hard limit in mpam_config
  arm_mpam: Carry cmax and cmin in mpam_config
  arm_mpam: Carry intpri in mpam_config
  fs/resctrl: Prepare for range-format pseudo resources
  arm_mpam: Clamp cmax_wd to 16
  arm_mpam: Generalize the fixed-point conversion helpers
  arm_mpam: resctrl: Expose the capacity controls as pseudo resources
  arm_mpam: resctrl: Expose the priority controls as pseudo resources
  arm_mpam: resctrl: Expose the bandwidth minimum and limit as pseudo
    resources

 drivers/resctrl/mpam_devices.c  |  59 +++++++--
 drivers/resctrl/mpam_internal.h |   8 ++
 drivers/resctrl/mpam_resctrl.c  | 215 +++++++++++++++++++++++++++++++-
 fs/resctrl/rdtgroup.c           |  15 ++-
 include/linux/resctrl.h         |  33 ++++-
 5 files changed, 307 insertions(+), 23 deletions(-)

-- 
2.34.1

