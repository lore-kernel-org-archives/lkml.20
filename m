Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658935;
	b=eP1K0Ky6Q2TzFj1EepLpyUWZJBnQ8Sxvh8hVh7WBfOTyV0IUjvGlTkh46fdiGfBEigEr
	 UwEB94TWQOMhQcUrtURZPs5Zbj4r1Ce0wDCMv1+1tQuZdjaGqD6zck9N7eDQ833Wztv8H
	 KepUwU2YqFHSK32ZaeG6p2e09my/4s4oB1wutN8L9nVEYcrlL8gDg5NIR3gStkIeOscKK
	 B+i0BJxECrb6b/eZ1C9Lft7WmhrLObI2xFleeGMvif7tMGYOjRZy7OHTTU8tVezq4QmGF
	 9s8mrnsgWNlqeVEpn6Adl6u7SdguB+7RKbUfwZqrggUkYyPaNYW6XUAVM+G1wDJRM7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658935;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BIsES8uU/Ieyil6nBD7YIf94eD4lVAgV2gQFwTcF/10=;
	b=mZ93BwVl3t7QaSwemlYD1Km5sbT2NTBN5eNrRrHYgSoMTnLvM5KqZcQMHsreosJgbpg4
	 L9Jonl/EY8GbKJfhUbfYCwGeFxLIjyX3EA2EdkVkq9kq/zI2QGnugHTVd6SvgJhC8Arq0
	 5D6vUahoQy5jQAY9EZFqDp9TcLhM/56q8Y1qnaDydgdq3UdYmU/BSgiECq31rYRuQSnqD
	 kmObvOfLk3Tp8sNyfVYTFZ2JCqlfmIU0VDGjcUSUkEO/D058G5TSEbkGypuTGdQgR7NWV
	 RMZzdNQkQxwy+W17yDaWhoPrp+VMI/bUVR8alu4rAI3PvSpqi6sWh2r/FhYz4B/0DbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OqLfJfmb;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE56606A32A;
	Thu, 22 Oct 2026 08:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OqLfJfmb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BIsES8uU/Ieyil6nBD7YIf94eD4lVAgV2gQFwTcF/10=;
	b=OqLfJfmbhdtpNaCfmSwYlNi3PDI6oQtswU6A5/mlNmSrtM9iBpfpcppKWxExJ/sn14Bn/FxgO
	1jhY3D5gOkugFebMkXXRzFCbL8QpcsDLLEkaMHYujp/MQMNlA3/quqE29nW32FWetFaS9c6jHvF
	NYQQIa8qGqOIJWOvAFgEC0I=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ43zcMz1K9D1;
	Thu, 22 Oct 2026 16:48:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A4D040596;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 0/7] arm_mpam: Add L2 cache monitors
Date: Thu, 22 Oct 2026 16:48:14 +0800
Message-ID: <20261022084821.4014873-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

MPAM resource monitors hang off a partitionable resource in an MSC, not
off a particular cache level. resctrl only knows about the L3 scope, so
the L2 cache monitors that MPAM platforms implement are discovered by
the driver but never show up in resctrl.

An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
level comes from the ACPI MPAM table's cache locator. So this is mostly
a resctrl scope problem, not a hardware one.

Extend resctrl's monitor scope to L2: register the L2 occupancy and
bandwidth events against the L2 resource, pick the L2 classes for them,
and borrow a CSU/MBWU monitor for the duration of a read. With CDP the
two PARTIDs need separate accumulating monitors, so the borrowed-monitor
context becomes one monitor per PARTID.

Patches:

  1-2  Generalise the per-domain read path, add l2c_occupancy and
       mbm_core_bytes, update the documentation.

  3    Split the borrowed-monitor context into data and code entries.

  4    Do the CDP num_rmid halving for every mon_capable resource.

  5-7  Pick the L2 classes, describe the events with the L2 resource,
       add the read paths.

Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
files show up and are readable; l2c_occupancy reports the modelled
occupancy, and mbm_core_bytes reports the modelled bandwidth.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

Jinjie Ruan (7):
  fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
  fs/resctrl: Add the L2 monitor events
  arm_mpam: resctrl: Split monitor context for code/data
  arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
    CDP
  arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
  arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
  arm_mpam: resctrl: Add the L2 monitor read paths

 Documentation/arch/arm64/mpam.rst |  23 +--
 drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
 fs/resctrl/monitor.c              |  15 +-
 include/linux/resctrl_types.h     |  13 +-
 4 files changed, 222 insertions(+), 65 deletions(-)

-- 
2.43.0

