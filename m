Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309815;
	b=fjg7sgNABbolfCHNkEOI1+UYjnHB7Col8ufVjNSIn8A+Vpq/x4f+N9xJPEP9IxPmiMIX
	 YyEWObqEgRKLrekUEnnpBN+4qMLnOM6krKhEF81wjW0k3eKhF76aczNQqWZPRQoZ8+oH4
	 jWii+WTA2hm5Mh3Fr0BFEekYfH9+yOX+8Or2CiOO99Zt0Tigz5K+NA9CgY+cgUk3mxT7m
	 X7HcWEub6Z1pDoWPQKJJ7mznHoOvksDMeOHydvvVPEJIDkOMnE5nwzahEAkkzbiUD+M1B
	 cpxNk7Z5VU+Qi0otHdknfZpNlTxdSLkDKe4sdQz6DeNPOh74i3J0GxbRiV7KqrcJemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r5U8/rgfnjSuKRxmIlR9EPiXA6jixruLFsqUagZ4x5U=;
	b=BGVMwP9wv8yPg6BvH0ORmEYsMq+ST3r+KGGlvuR9Ha1UVWLzu0oTC/gThSHYJ4wseAPq
	 fEeW8a97fP4rL2RCTkGrRW0tNYSE5EwQdShw9KhBXaEkyHORAaLpLXCCZbh27Ax0GaVFW
	 Th4tepd6A6Eqo5zrxHD6SN9I7NT40a+JzQqc6IjjDUMLwbS/fmLhVNNDpax2l7VS6UiHf
	 /da7wNpsHOqj3MZONwhpWRCjcoTtLPepxBCdsIUGL5LsGR3gslFCglaKbqpGyGHvcV+yw
	 paUDU50s1IypriMQt+0ZbbkMZ1bXvI0UHmtdW/d8KbS746crUvNHBAtjOSPKD0HVQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7qnHHdf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KS5L+TJU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31960A2618
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C31960A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7qnHHdf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KS5L+TJU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794309813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5U8/rgfnjSuKRxmIlR9EPiXA6jixruLFsqUagZ4x5U=;
	b=P7qnHHdfexDO6cnOCT4s98pfW00OUw51CDXH0RJTO9QgKzB5TRQhhdVajm3IjefwgQP3lS
	vPTtMOuyf0xpmlYD7JALFrXo4Fhzpu1p4mJ46D7T+o+gVdmgcfZGO63fFZk3wb3+6xnIF9
	5R7yg60K6IP/Mtn+LJyH+8NEb9HUI6w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-DsAVMS6PP6mZyCN7oc-06g-1; Tue, 10 Nov 2026 06:23:32 -0500
X-MC-Unique: DsAVMS6PP6mZyCN7oc-06g-1
X-Mimecast-MFC-AGG-ID: DsAVMS6PP6mZyCN7oc-06g_1794309812
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea5866643so36402306d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794309812; x=1794914612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5U8/rgfnjSuKRxmIlR9EPiXA6jixruLFsqUagZ4x5U=;
        b=KS5L+TJUm595P/fXVs47ssaDLl2fhFtlG5KQA3qq8h39mrmAlUEZUQws1D27OAzvAz
         XHb/J/H+S5mLvNeguD/ks5PLVESAHR3ZY/19ELUI2qdV42Smr0/weywPMNJmNgKXl2Mp
         vEOkNl7X29W9cMsPVQOLxMa9lgGWJC9WTjdwAnRfbNs3QYLE7GLmP2UBFD1Gdlgk0U08
         CSNqIU5NF98DCsfftfLclGU30y8f4e/NVG3uoxmivQjUV6le6mI0vSe4DC1n8IVl91Q/
         LFONWvyGHeF39wWIF9uNUIma45j26ox81iXN8cvJwdHPTi3eFV2RVYLz/EGBJ581R+K5
         d2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309812; x=1794914612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5U8/rgfnjSuKRxmIlR9EPiXA6jixruLFsqUagZ4x5U=;
        b=mxmMbzl5VuVQbe87bD8pzEwZ+fBS/5ogtKn4rPw/9X97XSweaxV4KQWrkE20yqc92I
         ApRW3CaGfNZI5Ea7VPplKeyG056+rCj+AJyGsh6bwSR+2hxsjN1uDOJ+Sr4SHijQD+9r
         /8g4dbO2KB+NrLRrXPQZt9HBmp5O5OHMzRTZOllLyjsr0Pik+LLXtNrCbh866zIdIuNG
         olJBhYJKPOkxobvoFqsiKFEduwuJHTh6UocOvy0qqSXiMkrc7DBWt/9s6YDcLXWQCd3o
         Ma4oYgWt8us91/Tfox//8qk6fKiRZeJ0GEHPXormXmSCd0a0tflzlay062C381tdyIGt
         jjHg==
X-Forwarded-Encrypted: i=1; AL+hErEiVhbNn++dvImrk+HZ8nVbicaf+ISZl8ceKZDDTfIvVrEVdcF0ya/UdXxsYk8mUUSnZGGE9rtkF7C58S8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wgtfGHrzUPy9vpRIfW3G8V9cutTW+lWgU/TFelCQZABlJQ/3P
	64DmxHeCQeMQBXQwhvz2oPAuHKGuez+S4AMCiForREgBoZpEgDWXFd51YOFlVU1EEMA1lfZciVW
	5iUXmWn6AdCeh1MQzk9cYbCnjeqo5kPiMSlnUA/e6CEnqzXL8LQsFIlnlS5L6Gl0K6A==
X-Gm-Gg: AYBFou1IS8u2LtzM0sp9sKTuUhg6d4ELqDsnilowE5Ft45KEA644gea6GNy6mQw+pWX
	mx9yHdLdO09PkoCVX8xkFaXuPiXK1Ws6esuh8P9jyGHF+ad99gSFIp+kulT/HPtrEmUx8kAVPJm
	tMrYIgAY9sWLMJoccNVFJnpO2WhvFNXE67FSxpHpvTEABDBYHe6hHl7PLZ+WTgYhiAjOkAJfgHJ
	LDdBWIinqHB7ZlDrY71U1ZZMz/zSr8HjrsGN+k6L3T95l7U/KOWYHISm7rh8B3fjj/ieocMyKxB
	MZLRTud6OpJJmIdk0qU8eRrmurUJnGIGEZlfDPnqUihout2nkLZDcftyC0+P/KuWzKVz0h6qJ7w
	48tKRCDp43vBfCIPG/H4bh5G8RYsjPOsaqwVIpsnEUudqgNvtcr10r/B6TTueEM2wj/DZyA5AD3
	MMfnMJSlJd3EyF1UeoAKHvN75nAxfMP5N3dMzCeM6YAqcndv5otlu2OhpT3Dv7uEBnbGaGPll0f
	L3qgYG8P8orBzGomzide2+LspuH8rGLdeN3oM9tlR6BocF2RPtU
X-Received: by 2002:a05:6214:27ef:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91eef98c2dcmr36477136d6.48.1794309811479;
        Tue, 10 Nov 2026 03:23:31 -0800 (PST)
X-Received: by 2002:a05:6214:27ef:b0:91e:8a33:6434 with SMTP id 6a1803df08f44-91eef98c2dcmr36476776d6.48.1794309810956;
        Tue, 10 Nov 2026 03:23:30 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04e7315sm18569186d6.22.2026.11.10.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:23:30 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/4] net: skb_splice_from_iter(): group consecutive pages of a folio
Date: Tue, 10 Nov 2026 11:23:23 +0000
Message-Id: <20261110112325.3263078-3-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110112325.3263078-1-amarkuze@redhat.com>
References: <20261110112325.3263078-1-amarkuze@redhat.com>
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

skb_splice_from_iter() appends extracted pages separately, preventing
adjacent tail pages of one folio from coalescing.

Group contiguous ranges of a folio on direct-mapped builds. Normalize
large folio positions into page-aligned coordinate windows so fragment
offsets and append lengths remain representable, and widen the coalescing
endpoint calculation to prevent wraparound matches. The boundaries follow
fragment representation limits, not a device-sized fragment cap.

Keep skb_append_pagefrags() ownership checks. HIGHMEM retains actual-page,
in-page-offset, page-bounded fragments; software checksums walk base pages.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/linux/skbuff.h   |  3 +-
 net/core/skbuff.c        | 63 ++++++++++++++++++++++++++++++++++------
 net/core/skbuff_splice.h | 34 ++++++++++++++++++++++
 3 files changed, 90 insertions(+), 10 deletions(-)
 create mode 100644 net/core/skbuff_splice.h

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..b19ba550ae11 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4009,7 +4009,8 @@ static inline bool skb_can_coalesce_netmem(struct sk_buff *skb, int i,
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i - 1];
 
 		return netmem == skb_frag_netmem(frag) &&
-		       off == skb_frag_off(frag) + skb_frag_size(frag);
+		       (u64)(unsigned int)off ==
+		       (u64)skb_frag_off(frag) + skb_frag_size(frag);
 	}
 	return false;
 }
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index ee7a1bc72cc2..3a66a50513a3 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -98,6 +98,7 @@
 #include "devmem.h"
 #include "net-sysfs.h"
 #include "netmem_priv.h"
+#include "skbuff_splice.h"
 
 #ifdef CONFIG_SKB_EXTENSIONS
 static struct kmem_cache *skbuff_ext_cache __ro_after_init;
@@ -7532,6 +7533,23 @@ static void skb_splice_csum_page(struct sk_buff *skb, struct page *page,
 	skb->csum = csum_block_add(skb->csum, csum, csum_offset);
 }
 
+/* Add the checksum of @len bytes at @offset in @page to skb->csum; the range
+ * may run on into the pages that follow @page.
+ */
+static void skb_splice_csum_range(struct sk_buff *skb, struct page *page,
+				  size_t offset, size_t len,
+				  unsigned int csum_offset)
+{
+	while (len) {
+		size_t part = min_t(size_t, PAGE_SIZE - offset, len);
+
+		skb_splice_csum_page(skb, page++, offset, part, csum_offset);
+		csum_offset += part;
+		len -= part;
+		offset = 0;
+	}
+}
+
 /**
  * skb_splice_from_iter - Splice (or copy) pages to skbuff
  * @skb: The buffer to add pages to
@@ -7540,8 +7558,12 @@ static void skb_splice_csum_page(struct sk_buff *skb, struct page *page,
  *
  * This is a common helper function for supporting MSG_SPLICE_PAGES.  It
  * extracts pages from an iterator and adds them to the socket buffer if
- * possible, copying them to fragments if not possible (such as if they're slab
- * pages).
+ * possible.  Pages that cannot be sent (such as slab pages) are rejected
+ * with -EIO, not copied.  Consecutive pages of one folio are grouped within
+ * the fragment representation limits.  A fragment is anchored at the head
+ * or a tail page of that folio and holds one reference on the folio either
+ * way.  On CONFIG_HIGHMEM builds a fragment stays within one actual page
+ * of the folio, because kmap_local_page() maps only one page.
  *
  * Returns the amount of data spliced/copied or -EMSGSIZE if there's
  * insufficient space in the buffer to transfer anything.
@@ -7552,7 +7574,7 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 	size_t frag_limit = READ_ONCE(net_hotdata.sysctl_max_skb_frags);
 	struct page *pages[8], **ppages = pages;
 	ssize_t spliced = 0, ret = 0;
-	unsigned int i;
+	unsigned int i, nr_pages;
 
 	if (!maxsize)
 		return 0;
@@ -7575,29 +7597,52 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 			break;
 		}
 
+		nr_pages = DIV_ROUND_UP(off + len, PAGE_SIZE);
 		i = 0;
 		do {
 			struct page *page = pages[i++];
+			struct folio *folio = page_folio(page);
+			struct page *fpage = page;
+			size_t foff = off;
 			size_t part = min_t(size_t, PAGE_SIZE - off, len);
+			unsigned int first = i - 1;
+
+			if (!IS_ENABLED(CONFIG_HIGHMEM)) {
+				struct skb_splice_frag range;
+				u64 pos = ((u64)folio_page_idx(folio, page) << PAGE_SHIFT) + off;
+
+				range = skb_splice_frag_normalize(pos, len);
+				fpage = folio_page(folio, range.anchor >> PAGE_SHIFT);
+				foff = range.offset;
+				part = min_t(size_t, part, range.len);
+				/* A tail anchor also takes/drops a folio reference. */
+				while (i < nr_pages && part < range.len &&
+				       pages[i] == pages[i - 1] + 1 &&
+				       page_folio(pages[i]) == folio) {
+					part += min_t(size_t, PAGE_SIZE, range.len - part);
+					i++;
+				}
+			}
 
 			ret = -EIO;
-			if (WARN_ON_ONCE(!sendpage_ok(page))) {
+			if (WARN_ON_ONCE(!sendpage_ok(fpage))) {
 				iov_iter_revert(iter, len);
 				goto out;
 			}
 
-			ret = skb_append_pagefrags(skb, page, off, part,
-						   frag_limit);
+			ret = skb_append_pagefrags(skb, fpage, foff, part, frag_limit);
 			if (ret < 0) {
 				iov_iter_revert(iter, len);
 				goto out;
 			}
 
 			if (skb->ip_summed == CHECKSUM_NONE)
-				skb_splice_csum_page(skb, page, off, part,
-						     skb->len + spliced);
+				skb_splice_csum_range(skb, pages[first], off, part,
+						      skb->len + spliced);
 
-			off = 0;
+			off += part;
+			i = first + (off >> PAGE_SHIFT);
+			off = offset_in_page(off);
 			spliced += part;
 			maxsize -= part;
 			len -= part;
diff --git a/net/core/skbuff_splice.h b/net/core/skbuff_splice.h
new file mode 100644
index 000000000000..dd51daf74903
--- /dev/null
+++ b/net/core/skbuff_splice.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _NET_CORE_SKBUFF_SPLICE_H
+#define _NET_CORE_SKBUFF_SPLICE_H
+
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+
+struct skb_splice_frag {
+	u64 anchor;
+	unsigned int offset;
+	unsigned int len;
+};
+
+/*
+ * Use page-aligned windows of INT_MAX + 1 bytes.  The anchor is a byte
+ * position within the folio, not a pointer; callers have the live folio.
+ * Every offset and append length fits the int arguments of the fragment
+ * helpers, and offset + length fits u32 without wrapping.  Consecutive
+ * calls use the same anchor until a representational boundary is reached.
+ */
+static inline struct skb_splice_frag skb_splice_frag_normalize(u64 pos, size_t len)
+{
+	struct skb_splice_frag range = {
+		.anchor = pos & ~(u64)INT_MAX,
+		.offset = pos & INT_MAX,
+	};
+	u64 space = (u64)INT_MAX + 1 - range.offset;
+
+	range.len = min_t(u64, len, min_t(u64, space, INT_MAX));
+	return range;
+}
+
+#endif /* _NET_CORE_SKBUFF_SPLICE_H */
-- 
2.34.1

