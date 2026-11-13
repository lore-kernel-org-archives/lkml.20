Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563443;
	b=gCTw0JhQXPFZTZ4Grp6rFzeCl5cSjqRICnK7gWYJHMiwCiurJUS0azx97ox+ndPWEVVX
	 mFVdScaYf4M4qpWpFATLB4oQD6YNdl0owgpy5XhRgHsx1wkQwPmmUl/943yFudTYXnzki
	 rghaU+tMqSs8dQWcVpJ/4fvtSFboKQ2NR14I/2r9NzRk46fpVIvgjpVkSRFPT14g5AXQx
	 ulA6lkEkrZzyl3MUuRAfAUjhIfrx6hMByXRipOQohuOUknXNt/wREXSAaMfBrhg7M/D9f
	 82ASKqriEz6oCXO0w4WWMahvZTs475hg8IVNVg55KwLDx7GX5kgtx24029jdgGtm65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563443;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/uuguW+JBNigKMxSte3np2mR1jp2+LdB7eMlJ3/WLCo=;
	b=zVn5+clszKrLUjGts+Vf1+IqaYJhsvG6MUY1dDVNSW0RSWqjZrlkRA+NfeczB1GSXX2s
	 VI4ETNexgnIKjoYxqveTPXrWxkq1irmLERy45x/ouDqHH23+GgK1Y1YhYCyG8gaV6JASS
	 7XcsLvCMp5TdQVyEsRkl2cyQqD7dfOEvw6OEApU2YCNeD+gPWxxzX/N8TEOqQ6lOrvNrj
	 nq5r5iU3tiogp44ZvqQ/XzquMvFaQlOOMLPvTBt7nUQLBlODBszJWiSd6jTzOMqZGYJF4
	 hX50NUWs5MGQJftm02ye+HlblyVGVmCwTHlJavp2yIIayvEVwnorGfXMpLF/ur/lLWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=id54eamQ;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209E6606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209E6606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=id54eamQ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794563434; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/uuguW+JBNigKMxSte3np2mR1jp2+LdB7eMlJ3/WLCo=;
	b=id54eamQ8SLmPt8eP2QBxbnCzT6siz96BzS9UnKVCT3yDQ17edTKxYdpMxobOmVu+4JiwLZoWn8TMyi6R5HMZ4WDboF0VoRB6VyP/E3EKPLR9EBkPGr+LakuTk8OizGOe+H1Duh6Cld4ghsxv5oUl/A0T2h4mJzH6oWIliIFloc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEefzuD_1794563433;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0XEefzuD_1794563433 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 17:50:34 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: joro@8bytes.org,
	vasant.hegde@amd.com,
	suravee.suthikulpanit@amd.com,
	will@kernel.org,
	robin.murphy@arm.com
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iommu/amd: Skip device lookup when IRT caching is disabled
Date: Fri, 13 Nov 2026 17:50:16 +0800
Message-ID: <20261113095017.1835921-2-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261113095017.1835921-1-guanghuifeng@linux.alibaba.com>
References: <20261113095017.1835921-1-guanghuifeng@linux.alibaba.com>
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

The DMA alias invalidation path looks up the device before checking
irtcachedis_enabled. The lookup walks the PCI segment's device list,
but its result is unused when IRT caching is disabled.

Nested VM entry and exit can switch multiple interrupt routes between
guest and remapping modes, repeating this lookup for each IRTE update.
A reported nested virtualization workload scans 4334 device entries per
lookup, with median lookup latencies of 22-33 us despite IRT caching
being disabled.

Move the lookup after the early return. This removes the unnecessary
list walk without changing alias invalidation or completion handling
when IRT caching is enabled.

Fixes: 5aac28784dca ("iommu/amd: Invalidate IRT cache for DMA aliases")
Reported-by: Yifei Ge <geyifei@linux.alibaba.com>
Co-developed-by: hr567 <hr567@linux.alibaba.com>
Signed-off-by: hr567 <hr567@linux.alibaba.com>
Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/amd/iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 0413dfc5cae5..8f5a38ae2e29 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3298,11 +3298,12 @@ static void iommu_flush_irt_and_complete(struct amd_iommu *iommu, u16 devid)
 	unsigned long flags;
 	struct iommu_cmd cmd;
 	struct pci_dev *pdev = NULL;
-	struct iommu_dev_data *dev_data = search_dev_data(iommu, devid);
+	struct iommu_dev_data *dev_data;
 
 	if (iommu->irtcachedis_enabled)
 		return;
 
+	dev_data = search_dev_data(iommu, devid);
 	if (dev_data && dev_data->dev && dev_is_pci(dev_data->dev))
 		pdev = to_pci_dev(dev_data->dev);
 
-- 
2.43.7

