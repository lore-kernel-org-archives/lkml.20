Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3003F43B6ED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823940; cv=none; b=kZkC+BCre+gjuQyyzM2n712xv2PY25WfKY408QsIsyHPc208Bx6La4ZNCjqqZH8V3/UWogNatVadAK/RS6L8pNLcakf8+QsO5BEAPb3wwkHdrT01ghgJHd/bfcrRR9J7jMopsgajCgTnhd6qIMjQa7JMCsubDK3U+jJqhexrZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823940; c=relaxed/simple;
	bh=I/BFNB+ifWAIbaadguJ3IudKOSUEap7yrw5rXb1mnN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=jbsP99al+s+YIW22cyZuC9AV2gBT2WsQ04ZbjOUtai4X8BriisUddqU8CNOYBw37OIvCYC0vg3vMBvlp8Do8CMOtKqhveO/PGvXO3W/U47bttrwd2iz5W7TkgFpkOijRdsMHRszci2v04erIFVQOQ8ps6aAtsOQ3LTH0/0QZeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 54ef9dade49ec2a8;
	Thu, 27 Aug 2026 09:45:30 +0000
X-Mizu-Trace-ID: 54ef9dade49ec2a8
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 03/16] mm, swap: add CONFIG_XSWAP and xswap fields to swap_info_struct
Date: Thu, 27 Aug 2026 17:44:53 +0800
Message-ID: <20260827094509.1016740-4-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Add CONFIG_XSWAP Kconfig option (depends on SWAP && 64BIT) for
extendable (virtual) swap device support.

Add three fields to struct swap_info_struct under CONFIG_XSWAP:
- cluster_vm: the VM_SPARSE vm_struct backing the cluster_info array
- nr_clusters: total number of clusters in the xswap address space
- nr_clusters_mapped: number of clusters currently mapped (lazy grow)

These fields enable lazy vmalloc-based dynamic cluster management.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h | 5 +++++
 mm/Kconfig           | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 787fe463dcbb..35d357a393c6 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -248,6 +248,11 @@ struct swap_info_struct {
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
+#ifdef CONFIG_XSWAP
+	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for xswap dynamic cluster_info */
+	unsigned long		nr_clusters;	/* total cluster count for xswap */
+	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
+#endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
 	struct list_head nonfull_clusters[SWAP_NR_ORDERS];
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..26cf26a2c59f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -122,6 +122,15 @@ config ZSWAP_COMPRESSOR_DEFAULT
        default "zstd" if ZSWAP_COMPRESSOR_DEFAULT_ZSTD
        default ""
 
+config XSWAP
+	bool "Extendable (virtual) swap device"
+	depends on SWAP && 64BIT
+	help
+	  Adds support for extendable swap devices (xswap) that decouple
+	  PTE swap entries from physical backing storage. The cluster_info
+	  array is backed by a sparse vmalloc area that grows and shrinks
+	  on demand, avoiding static pre-allocation overhead.
+
 config ZSMALLOC
 	tristate
 
-- 
2.54.0

