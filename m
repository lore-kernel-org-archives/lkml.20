Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833993;
	b=Q9ixvaseLW72egnBiuyJAYh7AQCM/xsE3jWqtGW1/8XdadvJL6Hn7EyGWxuZVGIAsBkz
	 uToDSYMwFjW8+YAha45pUnUzSiJV0i5K61ZhCV4PxntzGQwSJeIbAo1APZTIyQhOVsjuX
	 eq5U7qnHJfGJa3cdiARue16pc+Bcq1/2L6WdCFvbw+de4KwLyARFxH6P6yLqO7ea0crg2
	 yKlmMewue+WntGQOhvgG6yLv7ZrDhuyOVGoBTah6c+zg1xH45v1kpLlf8RZlALJLBUkSt
	 9FbYDzRgAepfXa8plobD1/Q6fi2Vh29uwn6pAK0U7vipVY1oq8OwLXd9gvn+fkLwbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833993;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=b+WRm1pLfUXQV9ESYSvE5bx1cY6BNCF73uIKV2V7MMs=;
	b=MPcQG6JWzoJotrPg7XLz1E4XRXkrQFlYOwyMNjaTOWto/Vc6+A3XMxJki7n0dlbR4ute
	 3IggC9rMmgWa54SxYLLEeqA4rlD6fyPU8JT0eraIC0f0nUbnL6ZgsADYUEJfOTsF3GPKM
	 Siks8YFt0XXJfNk1pqHdgT1e4zU4brLfNYiEoXPAy7KGSXJqTyWjv5RNJXIcH0lBvzWbu
	 GRAZkSQNV94+GayjQV0Sf/Mx/EU9itZZMEyDf/6XsFy74tB5qo5UQVx0iikJEc5bnMAlO
	 p5Dd/mcQ29igNvsz+jlImYGRKZjys3EhmJ/yDVyinEb5XEYnC5snklL4JDq7fW/TJIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=D17F8R+0;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150360A5BCA;
	Mon, 16 Nov 2026 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3150360A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=D17F8R+0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b+WRm1pLfUXQV9ESYSvE5bx1cY6BNCF73uIKV2V7MMs=;
	b=D17F8R+0bWPLe+7mYnMb4V3J7iw/lJ+0oC+fjzZO/i7WXSJxs7GZze1wS2dqz0dnFQFxaijyK
	fqIDGmNdCkemdPlpn+BTPI19U+0AIo5zXLbTiheO2lTyRMVAsiU8ct33QU3UTKDfHYad/3ovY4D
	pNSNbDv2XDiLr7lENpLTLpo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jSnx95bQ3zcZyT;
	Mon, 16 Nov 2026 20:58:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E973940679;
	Mon, 16 Nov 2026 20:59:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:42 +0800
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
Subject: [RFC PATCH v3 19/19] Documentation: arm64: mpam: Describe the L2 monitor events
Date: Mon, 16 Nov 2026 20:59:14 +0800
Message-ID: <20261116125914.498841-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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

Resctrl can now monitor at the L2 scope, so MPAM exposes the CSU and
MBWU counters of an L2 group as l2c_occupancy and mbm_core_bytes.

Also update the resctrl documentation.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/mpam.rst     | 25 ++++++++++++++++---------
 Documentation/filesystems/resctrl.rst | 11 +++++++++++
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index e445f4078ee1..f0d24fdc7677 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -32,8 +32,9 @@ Because the user interface to MPAM is via resctrl, only MPAM features that are
 compatible with resctrl can be exposed to user-space.
 
 MSC are considered as a group based on the topology. MSC that correspond with
-the L3 cache are considered together, it is not possible to mix MSC between L2
-and L3 to 'cover' a resctrl schema.
+the L3 cache are considered together, as are MSC that correspond with the L2
+cache; it is not possible to mix MSC between L2 and L3 to 'cover' a resctrl
+schema.
 
 The supported features are:
 
@@ -61,9 +62,11 @@ The supported features are:
   When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
   schema, it prefers the group closest to the L3 cache.
 
-* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
-  there is at least one CSU monitor on each MSC that makes up the L3 group.
-  Exposing CSU counters from other caches or devices is not supported.
+* Cache Storage Usage (CSU) counters expose the occupancy of the cache they
+  monitor: 'llc_occupancy' for the L3 group and 'l2c_occupancy' for the L2
+  group, provided there is at least one CSU monitor on each MSC that makes up
+  the group. Exposing CSU counters from other caches or devices is not
+  supported.
 
 * Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
   L3 cache-id to identify where the memory bandwidth is measured. For this
@@ -82,10 +85,14 @@ The supported features are:
   have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
   cannot distinguish local traffic from global traffic.
 
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+* Memory Bandwidth Usage (MBWU) on the L2 cache. An MBWU monitor in an L2 MSC
+  counts the bytes the cache sees, which resctrl exposes as the
+  'mbm_core_bytes' event on the L2 resource. The MSC is used for the L2 group
+  in the same way as for the L3 group above.
+
+These restrictions are due to resctrl only supporting monitoring at the L2
+and L3 cache scopes. MBWU monitors on caches at other levels, or on devices,
+are not exposed.
 
 Command line parameters
 =======================
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 2750f2eabf70..506ba55793b4 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -510,6 +510,17 @@ with the following files:
 		bytes) at which a previously used LLC_occupancy
 		counter can be considered for reuse.
 
+If monitoring is available at other cache levels there will be a
+"<LEVEL>_MON" directory for each of them. For example an L2 cache exposes
+"l2c_occupancy" and "mbm_core_bytes" in "L2_MON". These directories have the
+same "num_rmids", "mon_features", "mbm_assign_mode" and
+"max_threshold_occupancy" files as "L3_MON", and when the resource supports
+assignable counters, also "num_mbm_cntrs", "available_mbm_cntrs",
+"mbm_assign_on_mkdir" and "event_configs".
+
+The "mbm_L3_assignments" file in the resource group directories is specific
+to the L3 scope.
+
 If telemetry monitoring is available there will be a "PERF_PKG_MON" directory
 with the following files:
 
-- 
2.34.1

