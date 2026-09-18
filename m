Received: from mail-qv2-f18.google.com (mail-qv2-f18.google.com [74.125.230.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D629D29F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695633; cv=none; b=vB2gdDsk6mULipm69XBpCOgj3ZDM3pvcCQR2guM/F9CrynEzVOo9/TFjCmm/jUqMQITEsylUwAxcUQiX20YkUXegoPs9yE7/oVxtyOiThso3wv4l7L25ylJBOshRKZ9fJPYPC5CZNuNqy0bKtSe30fJtzBReSkXIwgy6DYX7yeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695633; c=relaxed/simple;
	bh=MjA16pExLkaZIqlRpPXEjMeSmR5rlH/+8EC5lPDOKJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si7d12XU+N20xaWkDYFfoRANvjbs1ar0M3SFuFrKyoIkPwZCSVsC4JaIN9ML2N8JAytIlIj9GNvByBpYyaFAKi8yBN5d6cFYfv5wWufTx701cNCqJyY3I2F9z+hMMBnCpYlu7LCeD9il5ghLGx6134hnCO5sQKACusRSeDeuU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB9sg9YM; arc=none smtp.client-ip=74.125.230.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB9sg9YM"
Received: by mail-qv2-f18.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso2448306d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695628; x=1790300428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRAjD5Twbhw4VbK5DrLWKjqqcqzlujpu2AVb3G2zojo=;
        b=HB9sg9YMxiPeQiuT9r7zNza//AmM2kh7Zjtd4c4dz7V/mdISvY+0FiKuhIDhVxJeGl
         nUH7PRKL5EN506Nb2PAKQr0su73lPoY4o1b7EhUwe3bCrUhSrcqRpamsncvyRydD9uR7
         bh97wXviwn1mIoOsxE9BjDSbfJJuy5bgKuAFYaj+iehxueYsSKja15/V/DDByTtZK8K0
         HyoFMgCWZJRcyQSIdz1xuKaHa4uNysMeijmCxHBrhfOKORzZZMmV0J0bXJRfa8dvsGA9
         RJnyS6vAb1KfxCYYvPifXH6O6zXP4+SO9GzWB1qQW+6YcKoDUMoLHFV+ZiAeDgL1AXos
         7Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695628; x=1790300428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRAjD5Twbhw4VbK5DrLWKjqqcqzlujpu2AVb3G2zojo=;
        b=K+rURBI7tLfQ+BwEWecxGovwGS0YZaaO2YjiUQ4IG2+DG/01qiVE5oW06N8B4OHII+
         ZkVa0HZbIVodssUzgQ7879ljCyet6hKmYM9/rbzBV2aJbBz4mpl7qA17wsfq0ryGdR1d
         fNt2F7fj4DiZojjH7+dulObbwb6IgXsckUgVp2LcZiMzctdBDBAdn4LpyJehWfbhoUdH
         9qTYF8g2A++IKae1QKbcI0GS9H3VbzD4PIHamK3f20l2nOCyXhElTv/1F0Gjzb9zxfOV
         I2ra/C3N0KVTrlOk7qjeDIUzh/EWZsljolEepnqnyZxpN3E7MF3Cvvu4HllgC6MzeHn0
         bjuA==
X-Forwarded-Encrypted: i=1; AKwUvBye6igdY03blg9pmDCJoxz97fJqOwz5biGF99gX3vQ8XlH0qK86zSH/0meSdQQeD+QkBnA/fJljk3EbjPA=@vger.kernel.org
X-Gm-Message-State: AFuF++m1nYLbKrVBkoqqSx8NUXjD1g8Fw2+uwh5zzfumvRBkqJZBAwYw
	zfCSRyO6zglDrLv86+H+s8v3GAYsPKv5Rd3lZVIh8BIWMewkHkbyRipZ
X-Gm-Gg: AYBFou1NgDsJawmcrcmUXI/3z+7c8feuO/RZQo3SYek9+/ETcsp/UCw3EzFLkm5+OOj
	5XE1L+2QNkEUfhNFGMHfAHJC8ChTyowwTzrRw5w393mkrLSkdxPucnGNC58NmWqFuo29A2OVPG7
	Gb/h7S9STqQ46gGFSWHNxxC/F0kG8VD5pAIa5XuhSaX8R9EZCB31BhxNDty40c6hiE45MTjH6wn
	4QkSoBACq+tYtKKjaJfjCma+X4u6Rc81aU6ZiZJxoGJDX7eWIXaa7nxiRYDWgSCBFLBUsI6IiwZ
	sfqDtxK1V6ev/1vkGvvTZbowxL1Fu6UTu3yMRZLqAJ9wIrKHjmXPkH7arfjBoQc2nokc/04r5nF
	r/bF4J9s71UnTmV8uTY38lZ588O5MVj3I9aomPl7cd/C/LC0u4zhYo48rel6qtxO3W1D3zy96pB
	T7nq9Qs0t/V3tdcJ9OMjBxgA0KGO0Xrj6j/fkyoHHW7/UZZyQWS0NkWHA33XmwOxNLsYUXzELmm
	Fr+szuKhpmTIvLWZwB5j2zW8o8DYeNz
X-Received: by 2002:a05:620a:1a17:b0:93b:d79b:9a64 with SMTP id af79cd13be357-93bdca9c9eemr126662685a.69.1789695627605;
        Thu, 17 Sep 2026 18:40:27 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e4f987sm13002285a.14.2026.09.17.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:27 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: linux-hyperv@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	linux-kernel@vger.kernel.org,
	emersonbusson@gmail.com
Subject: [PATCH 2/2] hv: vmbus: add virtual memory fallback for ring buffer allocations under memory pressure
Date: Thu, 17 Sep 2026 22:40:17 -0300
Message-ID: <20260918014017.2536753-3-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918014017.2536753-1-emersonbusson@gmail.com>
References: <20260918014017.2536753-1-emersonbusson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When VMBus sub-channels (such as synthetic SCSI, network, or vsock
channels) are dynamically opened during periods of sustained memory
load or memory tier eviction, `vmbus_alloc_ring()` attempts to
allocate physically contiguous memory using
`alloc_pages(GFP_KERNEL | __GFP_ZERO, order)`.

For standard rings (order-7, 512 KiB contiguous memory), high buddy
allocator fragmentation under memory pressure frequently causes
`alloc_pages()` to fail with -ENOMEM even when ample total virtual
memory is available. This manifests in userspace as connection
timeouts (e.g. `accept4 failed 110: Connection timed out` on WSL2 vsock
control planes).

This patch introduces a resilient fallback mechanism:
1. When `alloc_pages()` fails due to external fragmentation,
   `vmbus_alloc_ring()` falls back to `vzalloc_node()` (or `vzalloc()`)
   to satisfy the buffer allocation from virtually contiguous pages.
2. In `hv_ringbuffer_init()`, detects `is_vmalloc_addr(virt_addr)` and
   populates the `pages_wraparound` mapping array using
   `vmalloc_to_page()`.
3. In `vmbus_free_ring()`, tracks `ringbuffer_is_vmalloc` and calls
   `vfree()` safely, preserving Confidential VM (CoCo) memory
   re-encryption isolation checks prior to release.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/hv/channel.c      | 46 ++++++++++++++++++++++++++++++++++-----
 drivers/hv/hyperv_vmbus.h |  2 +-
 drivers/hv/ring_buffer.c  | 19 +++++++++++-----
 include/linux/hyperv.h    |  2 ++
 4 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 162d6aeec..f0fb3dd8f 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -12,6 +12,7 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
+#include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/hyperv.h>
@@ -153,13 +154,20 @@ void vmbus_free_ring(struct vmbus_channel *channel)
 	hv_ringbuffer_cleanup(&channel->outbound);
 	hv_ringbuffer_cleanup(&channel->inbound);
 
-	if (channel->ringbuffer_page) {
+	if (channel->ringbuffer_is_vmalloc && channel->ringbuffer_page_virt) {
+		/* In a CoCo VM leak the memory if it didn't get re-encrypted */
+		if (!channel->ringbuffer_gpadlhandle.decrypted)
+			vfree(channel->ringbuffer_page_virt);
+		channel->ringbuffer_page_virt = NULL;
+		channel->ringbuffer_is_vmalloc = false;
+	} else if (channel->ringbuffer_page) {
 		/* In a CoCo VM leak the memory if it didn't get re-encrypted */
 		if (!channel->ringbuffer_gpadlhandle.decrypted)
 			__free_pages(channel->ringbuffer_page,
 			     get_order(channel->ringbuffer_pagecount
 				       << PAGE_SHIFT));
 		channel->ringbuffer_page = NULL;
+		channel->ringbuffer_page_virt = NULL;
 	}
 }
 EXPORT_SYMBOL_GPL(vmbus_free_ring);
@@ -182,10 +190,26 @@ int vmbus_alloc_ring(struct vmbus_channel *newchannel,
 	if (!page)
 		page = alloc_pages(GFP_KERNEL|__GFP_ZERO, order);
 
-	if (!page)
-		return -ENOMEM;
+	if (!page) {
+		/* Fallback to virtual memory allocation under buddy fragmentation */
+		void *virt_addr = vzalloc_node(send_size + recv_size,
+					       cpu_to_node(newchannel->target_cpu));
+
+		if (!virt_addr)
+			virt_addr = vzalloc(send_size + recv_size);
+
+		if (!virt_addr)
+			return -ENOMEM;
+
+		newchannel->ringbuffer_page = NULL;
+		newchannel->ringbuffer_page_virt = virt_addr;
+		newchannel->ringbuffer_is_vmalloc = true;
+	} else {
+		newchannel->ringbuffer_page = page;
+		newchannel->ringbuffer_page_virt = page_address(page);
+		newchannel->ringbuffer_is_vmalloc = false;
+	}
 
-	newchannel->ringbuffer_page = page;
 	newchannel->ringbuffer_pagecount = (send_size + recv_size) >> PAGE_SHIFT;
 	newchannel->ringbuffer_send_offset = send_size >> PAGE_SHIFT;
 
@@ -639,6 +663,7 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	struct vmbus_channel_open_channel *open_msg;
 	struct vmbus_channel_msginfo *open_info = NULL;
 	struct page *page = newchannel->ringbuffer_page;
+	void *inbound_virt = NULL;
 	u32 send_pages, recv_pages;
 	unsigned long flags;
 	int err;
@@ -669,6 +694,8 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	newchannel->ringbuffer_gpadlhandle.gpadl_handle = 0;
 
 	err = __vmbus_establish_gpadl(newchannel, HV_GPADL_RING,
+				      newchannel->ringbuffer_page_virt ?
+				      newchannel->ringbuffer_page_virt :
 				      page_address(newchannel->ringbuffer_page),
 				      (send_pages + recv_pages) << PAGE_SHIFT,
 				      newchannel->ringbuffer_send_offset << PAGE_SHIFT,
@@ -677,11 +704,18 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 		goto error_clean_ring;
 
 	err = hv_ringbuffer_init(&newchannel->outbound,
-				 page, send_pages, 0);
+				 page, newchannel->ringbuffer_page_virt,
+				 send_pages, 0);
 	if (err)
 		goto error_free_gpadl;
 
-	err = hv_ringbuffer_init(&newchannel->inbound, &page[send_pages],
+	if (newchannel->ringbuffer_page_virt)
+		inbound_virt = newchannel->ringbuffer_page_virt +
+			       (send_pages << PAGE_SHIFT);
+
+	err = hv_ringbuffer_init(&newchannel->inbound,
+				 page ? &page[send_pages] : NULL,
+				 inbound_virt,
 				 recv_pages, newchannel->max_pkt_size);
 	if (err)
 		goto error_free_gpadl;
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 34943de7d..ec06c30d2 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -182,7 +182,7 @@ extern int hv_synic_cleanup(unsigned int cpu);
 void hv_ringbuffer_pre_init(struct vmbus_channel *channel);
 
 int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
-		       struct page *pages, u32 pagecnt, u32 max_pkt_size);
+		       struct page *pages, void *virt_addr, u32 pagecnt, u32 max_pkt_size);
 
 void hv_ringbuffer_cleanup(struct hv_ring_buffer_info *ring_info);
 
diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 23ce1fb70..e6d4cf185 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -184,7 +184,7 @@ void hv_ringbuffer_pre_init(struct vmbus_channel *channel)
 
 /* Initialize the ring buffer. */
 int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
-		       struct page *pages, u32 page_cnt, u32 max_pkt_size)
+		       struct page *pages, void *virt_addr, u32 page_cnt, u32 max_pkt_size)
 {
 	struct page **pages_wraparound;
 	int i;
@@ -201,10 +201,19 @@ int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
 	if (!pages_wraparound)
 		return -ENOMEM;
 
-	pages_wraparound[0] = pages;
-	for (i = 0; i < 2 * (page_cnt - 1); i++)
-		pages_wraparound[i + 1] =
-			&pages[i % (page_cnt - 1) + 1];
+	if (virt_addr && is_vmalloc_addr(virt_addr)) {
+		pages_wraparound[0] = vmalloc_to_page(virt_addr);
+		for (i = 0; i < 2 * (page_cnt - 1); i++) {
+			void *curr_virt = virt_addr + ((i % (page_cnt - 1) + 1) << PAGE_SHIFT);
+
+			pages_wraparound[i + 1] = vmalloc_to_page(curr_virt);
+		}
+	} else {
+		pages_wraparound[0] = pages;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pages_wraparound[i + 1] =
+				&pages[i % (page_cnt - 1) + 1];
+	}
 
 	ring_info->ring_buffer = (struct hv_ring_buffer *)
 		vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP,
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index a76f556f5..63203df4d 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -807,6 +807,8 @@ struct vmbus_channel {
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
+	void *ringbuffer_page_virt;
+	bool ringbuffer_is_vmalloc;
 	u32 ringbuffer_pagecount;
 	u32 ringbuffer_send_offset;
 	struct hv_ring_buffer_info outbound;	/* send to parent */
-- 
2.43.0

