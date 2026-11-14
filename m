Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667935;
	b=03pBIQ78NQyj0382sL6SgT8FYlP1QpGH1EFXXA1I0AFQ4fOud/STwuqJvHXBMZHkuSKO
	 OQJcc8NBGPIV29H9LZhoz1Cs3VwkCAEOHukjO9XpnvJWYKV9NunuzYMgBX3ZMzdWk5vnT
	 yMVHv8X+Y+L2Lq6JN9eXWW46ayD51qUmLMzFPWfKvJeaHJXy3dudP8RaV6x+iA2OzWiyu
	 wZ/Q6wuisPshQRPEclUqbz/qwhT7bHCJOfcRigiAB6iZ8LWFrCv/70gHxyp+lwTC+wQQV
	 x6tncUsNAVV77lMhSjvfWV6fJf7I4qACX4DYNXaJGeTEUSivNY+6t25FXyYle/m3LNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
	b=stEzUUZ3k9RzCqxWuvNfOULTVyq4Yp2aSDUKqR/paLWhjO2YFPe/Lr4YOQshKcqD7ZwO
	 TM150998L6E8oKLnO1t3O6xgaTOF9JM8VksBbrc5wr5J/pDsOIrcYMVjf4MEtyx8boUqa
	 bfyFh1uhQQfuPxsr5huquex2YsuHj0vmWCcTs7NlzU5/I78trz2g0OcsaT3FhWd5rLKm3
	 BV0238xemDHS2S8nsoTTM9EBclsO5ZrYFtdRdoXfIU8fzraEx+GufepV0FafEovHKWNHS
	 GBdnkaPkSyTSoazOzOJ0NOcujC88Wmes0uASsUzRT1gRbh4iD1Jo6/Hplp7rSUYlOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lMCET2HL;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D23606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D23606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lMCET2HL
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2efa9addec5so293055ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667935; x=1795272735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
        b=lMCET2HL8+waVHPTmBoDPbiq0Tpj8VM2mCKRgKDoRbCwHbTgMVwW8Mvk+Pt6q4NBNd
         KbcE8tipIrlpz1h2BIkmfJm/9L7uhso3KrpU1KkIWThk2bthPy6S29RqvdDx7lNi/zBh
         t7yJJAFcX88RNF6H06BsykN/uUyAQ7bofm4ou+wz/qokDY/G7jzRXVA9AbklNtX+ZOAW
         9zubVoH/QOV/tzZadKs0BkAOazWhm+PzKQ/M2hfqoLEfMn0rGzstMF+5D8dB4d7D++SW
         n0exONb+H6/ZiFg2Kn2RQz0x2WMHK6HJFL76tA8Rx02xkskcBNWUchWNqpgjkIIPZmCz
         BeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667935; x=1795272735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftZ9KCAoOVfHj2aG9QGbjRXPabmKfwf/abxcx+jklUw=;
        b=KxTAKmyGJHtQIPYVmEYwtEFw1t65z7LtAAW43R4UlxOJOX2meEwdttm/vbZxqe18K3
         XMuYFFvgc0IBu2dDsrAdy1PMPKOCJTD4//vjNcq38zGKbyzHslIPBQiYuDgG+wDDHpP6
         vsFFLRNIM+7ZjDQp6gkceaRwsu8BWnMf3X1SHUPeUP2uS2weH69K4KXAuR+5OXBiJJ38
         PrSQHvmvicSKZCkCjUbOtetcpF67lyvmdSy1UD8Dt/Z6b1lzHmAZJpaOotJxCTBppy+Q
         46HXRpTPYwu9Ne1m6I+rgOD9p6FN1Ae40JbUa6U+1/vtWOx7cQIjSZOc9bKZh3GIQVfR
         oYBA==
X-Gm-Message-State: APuU4Z/jx6R5WeGB2CB0zx6N9FUI7em41l4ABQclFyfpPdDyeRf+uRLc
	y5VLiN/aYVv8XTfDewBZYM33WA+/KKVK5xKJcH2TU+bfYxh700V7pxXC
X-Gm-Gg: AYBFou1P+rf65JRLjPQ9ugzlm917yB3QrfXCnagtPMDAEbStqDGRD3jmyrlDIdW1uOl
	UvPmsINRugZ78AwmbS9afT+3iYOB37mfdUTN25bO8Hruk9e6B6jCRcTdUsb8vdk5uRG0Lsnnw1q
	RCgzS4D6hAK2Qb/MVGrcQ+HOau2jj4QEy5ZdQrkXi9EWxilpgY4sS3K4l6JRL3xx1Zqp4Ajt/MM
	amP0WD5qhJN6M1EDptvd10lXjGYQzP/82ygnSxlUGaLjyvL8sTrxY3OgEPEs9yOW00KUX7aq4HQ
	wCemVjEtpWgiRGLR2qofNBQv2HwEtRRIE4Q1zgaSTepzr3gan1UDX1kQagwU1nmV+6cRDZZzgro
	vZ4vniWoIzg272s7WWhMm8DVXyweUQLnniQoriIEcW9KDywk5DnsJegf7sN+pn8SwE+IGmbXRQr
	gq5IicokVLvI0iVrZ3NF/wB2z8R/PG0V+Aj4b7CmpYoems4NZ0ei5tLmhNJbmxbg91TMGIIpTA7
	3sVPZ6ytKJ/Ow+UeuMIHIrzHqVExothALOH89rphPpTkKnlBzSMioRE2pgm8/6QQ6Wh8FOlc6sQ
	h09Clci9uSr1d20QEH/ikLY+ngzZO7IHDkwHyJ/LBw8dHEsU8ZMbvHgXpBo2ojqfl61D
X-Received: by 2002:a17:902:f70b:b0:2ed:537d:f00 with SMTP id d9443c01a7336-2ee0dc95988mr49994515ad.56.1794667934899;
        Sat, 14 Nov 2026 06:52:14 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm21342815ad.0.2026.11.14.06.52.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:52:14 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 14/18] lib/plist.c: remove requeue function
Date: Sat, 14 Nov 2026 22:51:58 +0800
Message-ID: <f513864653d62e4ce8095af9fc1275081d1d1c81.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Now the last user of plist requeue is gone, this function can be
removed.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/plist.h |  2 --
 lib/plist.c           | 71 -------------------------------------------
 2 files changed, 73 deletions(-)

diff --git a/include/linux/plist.h b/include/linux/plist.h
index 16cf4355b5c1..73d359c1a053 100644
--- a/include/linux/plist.h
+++ b/include/linux/plist.h
@@ -132,8 +132,6 @@ static inline void plist_node_init(struct plist_node *node, int prio)
 extern void plist_add(struct plist_node *node, struct plist_head *head);
 extern void plist_del(struct plist_node *node, struct plist_head *head);
 
-extern void plist_requeue(struct plist_node *node, struct plist_head *head);
-
 /**
  * plist_for_each - iterate over the plist
  * @pos:	the type * to use as a loop counter
diff --git a/lib/plist.c b/lib/plist.c
index b0273533c04d..b05ae7ffea87 100644
--- a/lib/plist.c
+++ b/lib/plist.c
@@ -142,65 +142,6 @@ void plist_del(struct plist_node *node, struct plist_head *head)
 	plist_check_head(head);
 }
 
-/**
- * plist_requeue - Requeue @node at end of same-prio entries.
- *
- * This is essentially an optimized plist_del() followed by
- * plist_add().  It moves an entry already in the plist to
- * after any other same-priority entries.
- *
- * @node:	&struct plist_node pointer - entry to be moved
- * @head:	&struct plist_head pointer - list head
- */
-void plist_requeue(struct plist_node *node, struct plist_head *head)
-{
-	struct plist_node *iter;
-	struct list_head *node_next = &head->node_list;
-
-	plist_check_head(head);
-	BUG_ON(plist_head_empty(head));
-	BUG_ON(plist_node_empty(node));
-
-	if (node == plist_last(head))
-		return;
-
-	iter = plist_next(node);
-
-	if (node->prio != iter->prio)
-		return;
-
-	plist_del(node, head);
-
-	/*
-	 * After plist_del(), iter is the replacement of the node.  If the node
-	 * was on prio_list, take shortcut to find node_next instead of looping.
-	 *
-	 * prio_list is a headless ring, so from the LAST bucket ->next wraps
-	 * round to the first one; in that case node_next is the list head.
-	 */
-	if (!list_empty(&iter->prio_list)) {
-		struct plist_node *first = plist_first(head);
-
-		if (iter->prio_list.next == &first->prio_list)
-			goto queue;
-		iter = list_entry(iter->prio_list.next, struct plist_node,
-				  prio_list);
-		node_next = &iter->node_list;
-		goto queue;
-	}
-
-	plist_for_each_continue(iter, head) {
-		if (node->prio != iter->prio) {
-			node_next = &iter->node_list;
-			break;
-		}
-	}
-queue:
-	list_add_tail(&node->node_list, node_next);
-
-	plist_check_head(head);
-}
-
 #ifdef CONFIG_DEBUG_PLIST
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
@@ -238,14 +179,6 @@ static void __init plist_test_check(int nr_expect)
 	BUG_ON(prio_pos->prio_list.next != &first->prio_list);
 }
 
-static void __init plist_test_requeue(struct plist_node *node)
-{
-	plist_requeue(node, &test_head);
-
-	if (node != plist_last(&test_head))
-		BUG_ON(node->prio == plist_next(node)->prio);
-}
-
 static int  __init plist_test(void)
 {
 	int nr_expect = 0, i, loop;
@@ -269,10 +202,6 @@ static int  __init plist_test(void)
 			nr_expect--;
 		}
 		plist_test_check(nr_expect);
-		if (!plist_node_empty(test_node + i)) {
-			plist_test_requeue(test_node + i);
-			plist_test_check(nr_expect);
-		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(test_node); i++) {
