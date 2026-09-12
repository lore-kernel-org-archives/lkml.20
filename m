Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE6539022B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242633; cv=none; b=UmmmiqLfM7Q67GjDj57pEZuS2cY28pJC7KtqxORrVjywZrhJI7REt8RAFx8/avIH0JXgnfn9oM9BsTcLotbgnKKafurPPpoD5uCWACihRDEhScfOY2yEWiekCPU3MmnFtOqIiGgkF8GuMxPU8Zm6Jq7u8u9IHy4n3Pg70dQasLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242633; c=relaxed/simple;
	bh=brsh5b/KdMNuvnx+9fqsxBmZ2yLtLLwkoZhQRJDHq64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY2WLAmiCNJ/rCflRq9jEXIzVWkMD44VEVBxDmNWCxIntyqdb9/xF3quGdlRlg2H5T2PwaOzUPC5+YT/9CpUkcUydRdLkL73/4mL1kO2DA/vnG2/yjyxvAfyBsZrx6bK9Sg8PQ5rqDy6VcP7Svwn5tk1JaKEyqDtv6mdskM93ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QpZfBJAE; arc=none smtp.client-ip=91.218.175.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QpZfBJAE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=brsh5b/KdMNuvnx+9fqsxBmZ2yLtLLwkoZhQRJDHq64=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789242626; v=1; x=1789847426;
 b=QpZfBJAE//lAjKLaME4jfm+6uKFx+MLqPu3UOV/yX10W4gAWZ85MeRGoWTBuPxs2VQ7txOXw
 QNiW9mxNGf8DzqKZKLgc8aba/uWVTlP1PxW7wtKRrqTkPATBAZZ0mUdYYMo1JxhdLLFivSwVUUl
 YkNlwS4zDxoGlTmnrttcyXmw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0fc06f63615bcd41;
	Sat, 12 Sep 2026 19:50:26 +0000
X-Mizu-Trace-ID: 0fc06f63615bcd41
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: ilya.gladyshev@linux.dev
Cc: akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	apopple@nvidia.com,
	artem.kuzin@huawei.com,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	Liam.Howlett@oracle.com,
	edumazet@google.com,
	harry.yoo@oracle.com,
	hramamurthy@google.com,
	ivgorbunov@me.com,
	joshwash@google.com,
	kirill@shutemov.name,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	torvalds@linuxfoundation.org,
	vbabka@suse.cz,
	willy@infradead.org,
	yuzhao@google.com,
	ziy@nvidia.com
Subject: [PATCH v6 1/3] gve: reduce pagecnt_bias to USHRT_MAX
Date: Sat, 12 Sep 2026 22:50:08 +0300
Message-ID: <7d7dc5d62597f2f76ed890a3056e9754ede1c54d.1789239015.git.ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789239015.git.ilya.gladyshev@linux.dev>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Google GVE driver bumps page refcount with INT_MAX ghost users instead
of the usual USHRT_MAX like other drivers. This INT_MAX bump brings
refcount dangerously close to an overflow.

This works fine for now, as refcount is treated as unsigned. However,
following patches will reduce the usable range of refcount values,
making signed int overflow critical.

Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
---
 drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c | 4 ++--
 drivers/net/ethernet/google/gve/gve_rx.c              | 8 ++++----
 drivers/net/ethernet/google/gve/gve_utils.c           | 6 +++---
 drivers/net/ethernet/google/gve/gve_utils.h           | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
index 6880d1531ba5..52223baf0303 100644
--- a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
@@ -149,8 +149,8 @@ int gve_alloc_qpl_page_dqo(struct gve_rx_ring *rx,
 	buf_state->last_single_ref_offset = 0;
 
 	/* The page already has 1 ref. */
-	page_ref_add(buf_state->page_info.page, INT_MAX - 1);
-	buf_state->page_info.pagecnt_bias = INT_MAX;
+	page_ref_add(buf_state->page_info.page, USHRT_MAX - 1);
+	buf_state->page_info.pagecnt_bias = USHRT_MAX;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/ethernet/google/gve/gve_rx.c
index 81ea800e66e9..3bed19866376 100644
--- a/drivers/net/ethernet/google/gve/gve_rx.c
+++ b/drivers/net/ethernet/google/gve/gve_rx.c
@@ -152,8 +152,8 @@ static void gve_setup_rx_buffer(struct gve_rx_ring *rx,
 	page_info->buf_size = rx->packet_buffer_size;
 	*slot_addr = cpu_to_be64(addr);
 	/* The page already has 1 ref */
-	page_ref_add(page, INT_MAX - 1);
-	page_info->pagecnt_bias = INT_MAX;
+	page_ref_add(page, USHRT_MAX - 1);
+	page_info->pagecnt_bias = USHRT_MAX;
 }
 
 static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *dev,
@@ -230,8 +230,8 @@ static int gve_rx_prefill_pages(struct gve_rx_ring *rx,
 			rx->qpl_copy_pool[j].buf_size = rx->packet_buffer_size;
 
 			/* The page already has 1 ref. */
-			page_ref_add(page, INT_MAX - 1);
-			rx->qpl_copy_pool[j].pagecnt_bias = INT_MAX;
+			page_ref_add(page, USHRT_MAX - 1);
+			rx->qpl_copy_pool[j].pagecnt_bias = USHRT_MAX;
 		}
 	}
 
diff --git a/drivers/net/ethernet/google/gve/gve_utils.c b/drivers/net/ethernet/google/gve/gve_utils.c
index b53b7fcdcdaf..267fe3c88553 100644
--- a/drivers/net/ethernet/google/gve/gve_utils.c
+++ b/drivers/net/ethernet/google/gve/gve_utils.c
@@ -95,13 +95,13 @@ void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info)
 	if (page_info->pagecnt_bias == 0) {
 		int pagecount = page_count(page_info->page);
 
-		/* If we have run out of bias - set it back up to INT_MAX
+		/* If we have run out of bias - set it back up to USHRT_MAX
 		 * minus the existing refs.
 		 */
-		page_info->pagecnt_bias = INT_MAX - pagecount;
+		page_info->pagecnt_bias = USHRT_MAX - pagecount;
 
 		/* Set pagecount back up to max. */
-		page_ref_add(page_info->page, INT_MAX - pagecount);
+		page_ref_add(page_info->page, USHRT_MAX - pagecount);
 	}
 }
 
diff --git a/drivers/net/ethernet/google/gve/gve_utils.h b/drivers/net/ethernet/google/gve/gve_utils.h
index bf2e9a0adb36..2933453d1a33 100644
--- a/drivers/net/ethernet/google/gve/gve_utils.h
+++ b/drivers/net/ethernet/google/gve/gve_utils.h
@@ -25,7 +25,7 @@ struct sk_buff *gve_rx_copy_data(struct net_device *dev, struct napi_struct *nap
 struct sk_buff *gve_rx_copy(struct net_device *dev, struct napi_struct *napi,
 			    struct gve_rx_slot_page_info *page_info, u16 len);
 
-/* Decrement pagecnt_bias. Set it back to INT_MAX if it reached zero. */
+/* Decrement pagecnt_bias. Set it back to USHRT_MAX if it reached zero. */
 void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info);
 
 void gve_add_napi(struct gve_priv *priv, int ntfy_idx,
-- 
2.55.0

