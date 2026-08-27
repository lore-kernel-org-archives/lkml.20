Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07D46D0A9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847890; cv=none; b=R+1mtAnIjPsrlus99kHWeqzUtfvZ8dW3/yBtsLXhh/u7sizlgmhc2A0ZfiriXfNhbuoj/6od3newfdB+BwNoC2/GNBQupxotfFz4eLqvu264PXVBSiP6tJMszplol2arTn8cZhQB1cckby3yEIetLc4iPHRVJFBGTTN9mLUpYbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847890; c=relaxed/simple;
	bh=dSS0bMSoY0Q3KIDio1ufZOuk+k4Y5Q20zxzxymAbtic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfAnO5XJrh3R9BD008upjXxL+ASpIlG310rQkojPyzFJaNPxvuOsJRgZJFoyNt9jG/EG4yfZDgU0PrKkqReuvbocwslkoLTyfRQVuNElr0IWp0VZPjuj3N2+0foIOHToiGstJanKWMxGDxZlYyuTp3XmTEGhoiBk6kgHr1yJopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=X57abhX2; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="X57abhX2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mZpijvlSw2xNIsfL6IQ6jLABbu5LnLQd4TTudOzRHd8=;
	b=X57abhX2xJestC1P2bJzdl/sfZqWq7S2z/DnrQR2S6d5a9iNjQpzAs2nrZVVgINhqAiK9mlEe
	8Un9AB4ywk8zAwPRdHmdZkkfEjyoRP/9lB50ajE6W2cmsfC1XR+YoRU9zHH+zlyOCfqwx3cge8Y
	0suoxFbuxnwTqeM9jTi9eDY=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KV1gnVzJ4673;
	Fri, 28 Aug 2026 00:24:14 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id C345340572;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 01/18] mm: arm64 add Kconfig option for kernel replication
Date: Fri, 28 Aug 2026 00:11:41 +0800
Message-ID: <20260827161158.3618409-2-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 mm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..1302268b72b6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1446,6 +1446,16 @@ config LOCK_MM_AND_FIND_VMA
 	bool
 	depends on !STACK_GROWSUP
 
+config KERNEL_REPLICATION
+	bool "Enable kernel text and ro-data replication across NUMA nodes"
+	default n
+	depends on ARM64 && MMU && NUMA && !MAXSMP
+
+	help
+	  Creates per-NUMA node replicas of kernel text and ro-data sections.
+	  Page tables are replicated partially, according to replicated kernel memory range.
+	  If unsure, say "n".
+
 config IOMMU_MM_DATA
 	bool
 
-- 
2.34.1

