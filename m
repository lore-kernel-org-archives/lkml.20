Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801419;
	b=IROvOjByFNnw3cWDGPF9ZdPeQQaH49xKI09tyJxcU1j16yfGB3zh0kIqm7QXsSWGakrQ
	 w/e0uqskPdEjYihzG1yliluiDze9kTxjGd8hxegRrAHLvFY9NAib9kBLo0DYwkihaE87O
	 nXkd6YhlxKs1vVxv8ppEHEBV+EA2SySuXJ/QjSz8R+SKGRJuu4eHTj+BKixETsBZH7qnn
	 0hAQnuIWeNyoIsUyapcTuLHzC+zfyRfJoVfF2uFcKuf20aqioP1ZouWR7NX3JMksSgSye
	 RnrarH7an5go+icykNfSBPCs9yuIRaqsknU+/qSb6J39dqrkB/C9PwmrcE3KCI6GdXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801419;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IYnSLOYsE8inyvJNEYcm36Vem3jCUVpW+NlLSzt788I=;
	b=0gXZ5GliwitQEPrptUJnEJJodAnUtknoFb6ZUbqF5mE0rLR6rbAkXqZMH/4cDtCC4IFV
	 lC6xwrfYMz61M7B4F0Ftu5S4gtYm9I6y43rBGcutXQJNgPmcJMi0gZkUKimiAkEy0UBsr
	 xookIYVZQ1dcx61yJdefSlmThOMymYH3LVqnA9wVYm7aWfFUH5QHaY8w8nHkzddKU+IJo
	 TvwCjuyzNNDSCJW9ighBAODirvtBLg903cx0tdH2wu3R5c+3QtfuGyJgA93MTJ2OMZ7Ib
	 5BrKHb53o0hm1j34CvWmM6t7wFDM/p0xBsKVECt073xPpRwprAazfyGIDrtQLtIIRLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vDriIk62;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A24606A331;
	Mon, 16 Nov 2026 03:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A24606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vDriIk62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vDriIk629JeKyprnh7iFLYoyVd6z6bRUhHPBLkzbjda6wOXQVvO21OhTromVDlE92kY3JKBIk0QjF
	 jyNAQLQTFDoUd0/c5NHUtdkvTwNCHea2gP3lx4jCG6uSakVjpx45qFm3MSN6RokgDIir5y/gi+QGru
	 N+jVl6l8FELg9UWw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afa7f082d9-9b75f;
	Mon, 16 Nov 2026 11:56:56 +0800 (CST)
X-RM-TRANSID:2ee86afa7f082d9-9b75f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[74.82.203.40])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa7ee7fb3-7c014;
	Mon, 16 Nov 2026 11:56:55 +0800 (CST)
X-RM-TRANSID:2ee66afa7ee7fb3-7c014
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Willem de Bruijn <willemb@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] net: do not run out of frags in alloc_skb_with_frags()
Date: Mon, 16 Nov 2026 20:56:19 +0900
Message-ID: <20261116115620.18151-2-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
References: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
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

alloc_skb_with_frags() can need more than MAX_SKB_FRAGS frags for a
data_len that passed its size check, and then fails with -ENOBUFS:

- the tail is split into one frag per bit set in its page count;
- after a failed high-order allocation, the order is lowered without
  checking that the frags left can hold the rest.

tun hits this with large GSO packets from a vhost-net guest.

Use one larger page for the tail when splitting it would not fit. Only
lower the order if the rest still fits, else retry the same order with
direct reclaim. If that retry fails too, the allocation still fails.

Found while prototyping >64K TSO in a virtio-net guest. Tested with that
guest, page allocation fault injection and the KUnit test in patch 2.

Fixes: 09c2c90705bb ("net: allow alloc_skb_with_frags() to allocate bigger packets")
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
Tested on an x86_64 vhost-net host (net-next 303d91a15925, same
function) with a guest sending 512K GSO packets:
- without this patch: -ENOBUFS, the vhost worker spins, traffic stops;
- with it: ~100 Gbit/s, no drops, none of 354872 packets failed;
- fault injection on order-3 allocations (5-100%): no failures;
- not tested: the direct reclaim retry failing too (real memory
  pressure); it only runs where the allocation fails today;
- KUnit net_core 20/20; arm64 W=1 build of net/core/ clean.

 net/core/skbuff.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a7d555b3d2f28..43581ca020243 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6906,17 +6906,40 @@ struct sk_buff *alloc_skb_with_frags(unsigned long header_len,
 	while (data_len) {
 		if (nr_frags == MAX_SKB_FRAGS)
 			goto failure;
-		while (order && PAGE_ALIGN(data_len) < (PAGE_SIZE << order))
-			order--;
+		if (order && PAGE_ALIGN(data_len) < (PAGE_SIZE << order)) {
+			unsigned long pages = DIV_ROUND_UP(data_len, PAGE_SIZE);
+
+			/* If splitting the rest into smaller pages would need
+			 * more frags than we have left, use one larger page.
+			 */
+			if (hweight_long(pages) > MAX_SKB_FRAGS - nr_frags)
+				order = order_base_2(pages);
+			else
+				order = ilog2(pages);
+		}
 
 		if (order) {
 			page = alloc_pages((gfp_mask & ~__GFP_DIRECT_RECLAIM) |
 					   __GFP_COMP |
 					   __GFP_NOWARN,
 					   order);
-			if (!page) {
-				order--;
-				continue;
+			if (unlikely(!page)) {
+				unsigned int shift = PAGE_SHIFT + order - 1;
+
+				/* Can smaller pages hold the rest? */
+				if (((data_len - 1) >> shift) + 1 <=
+				    MAX_SKB_FRAGS - nr_frags) {
+					order--;
+					continue;
+				}
+				/* No, retry this order with direct reclaim. */
+				if (!gfpflags_allow_blocking(gfp_mask))
+					goto failure;
+				page = alloc_pages(gfp_mask | __GFP_COMP |
+						   __GFP_NOWARN | __GFP_NORETRY,
+						   order);
+				if (!page)
+					goto failure;
 			}
 		} else {
 			page = alloc_page(gfp_mask);
-- 
2.43.0



