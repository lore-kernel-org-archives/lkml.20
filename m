Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117532;
	b=pJreBx96R4LhNcLOishRQb9sOU0swo8+ktE4R6skIFppOXCFiV8iZraRbMaiFgU/Lm8t
	 a11YZCm4rbTk/BGbN8973+e/b/V4EF20pgwbWs/Xm4rSsRGhmpRYs19iJuYYpj+I7BPVT
	 BwUk+YapX2V3DGV6l2gUFJKY+5VS7bdDUXZTD14yEKaPSpVxfOaiHozE05AtqpkHO3YgR
	 TQvITEIz5n8MP7GFo7myS0CZuNZVxnJB5J3IFzuVBBgJhlkRtiANinSPa/mThlaHMseZB
	 4nFUWOQv7OOmmVRgXj16T79MG0nLvdlZqhi7oHJobRnjk+9Gcjeses4bIVbu3Q0qnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=48V2i++CxoO9ErJxlzp+qOCNmqGeLS8hRD7IL1WVdDU=;
	b=n5Q3H8IqcZ88QmlqG8lPu5qaqQy5oqGZDfD2nGmfQhpL8gchWf55GE2Dj6GDEpQiweE9
	 DIZjZlGLGmSZs19ULJwE5QaNTqxtlBI8qA8eNCqPkZfSl6pHSOUFOGqGDxyTjLwT3SucZ
	 BiXPnGETr9f//hoRxfwFgaPnVqyAPl8ETrfIBlbuPjGq/xl6O5lZlfUJ0kJEygpx+8b2K
	 bPeob+LVjT5jQ0kNPX880TW9+rmdu1vIkzCdf/zc9V6+r3sxpUFL8vsBkaobyySdOFNve
	 xwh6ZMXR00wh6wwnStEfEAdS78uW//1R4f8G+EnZvhkN5yUrdTCitYmBUzLOrnmmtWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=or8Rtky6;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=or8Rtky6
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so633568a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117531; x=1793722331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48V2i++CxoO9ErJxlzp+qOCNmqGeLS8hRD7IL1WVdDU=;
        b=or8Rtky6X5DW7ZLNlwa6WAMACMzLuKjerT80CBc7NH4wj5wBu380fVMSfGW5WMrdZ+
         79v6346GJaa9zXl4Y3zVQTAmhGrcgsuCWcpgOCWi0ik+gc24DY9jCd1HfWKzxVG7M0tl
         FCArwrZGot2GmgLIOq2c3K3ZULX8vDq4GYEcEgGREy4RTlaXQGkd+S7hq7/qcd17RfRM
         FHdtlL3ZAkhV1lJ10H2onQyfwn5jXWTuaqPbJJQOnLU4Y8PfvBG8m3FNIdOfpVQqf/pb
         ahJFs27+GXa7oyqNNZk0oLT7PZxyxSuf6JhaU+AyKoiFgiKjxAkP6wXyL2kol76jVLA7
         6FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117531; x=1793722331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48V2i++CxoO9ErJxlzp+qOCNmqGeLS8hRD7IL1WVdDU=;
        b=pM6d0ruakhkD9Bjgv1GZrycjAhBhYm8tcWpmgMY9jgLY4nb8Hc6XAuQZFPC66PjIj4
         v38LqcS/csB9ghgPrOuFeu9FZTymOVI9shopQ27tlIuoHjVInkvtwiHaBzJoUB8IAbX0
         GEA22KmYd7mPWDJ4PZbCCigGunS1abNet8g319lYP+bdCYZTh1D1qh0AgJkDdRfQQgBC
         d+HVo5bm4AqEVIZ3A8bmGL7BH0dcwY1Vycqch6R0Cyggg0BP78bieyVQlKO12bk/qBl5
         AvMDYsNObflXbu0Chste+vO+Xl0elAraTmUtS5sBm3jwEPVnQ2/J7nJ9zBX6IQWu2EnS
         y0bg==
X-Gm-Message-State: AFq9FYJcYsEv00uFwROKb5Lsym7Eesi9XkuJS13Xd9nld5KvVFs622XF
	/3aUZgQNjDQsh6i0y4FhMcEsMIW8DO2F0T97qoI8t8XoieW1hE7xg3m7
X-Gm-Gg: AYBFou33M3NSqGdeGa7EWFMMFIYdQGuKcLxB0WEN6YJ2rFrZbmp16AYSRKmINnfBP8b
	HJMfCUwDzqylZYOjZx9DOgVbjYQjtgusP6Gx2gi8d44lGCtFfeya9VDNLpTEek5UNxfEQspcYap
	wClVgF1l1sVAevNk5zvOoSiHiLYsvfXap80gQ+kZXKI3lwhTLWZLOeGtAulyrXR0FI5og+j03fd
	+Zl8Dcb4NjJ1zQ7OBDy1gzNmNk4Bz5LNakwfz3QbWq/p68Zshudm1q/NNuDqVwU/fx77edEOeUS
	f+CGLVtiiERnvoxlKTP+WpqvTiqayhymKYCuRmDRPMidcvwKSCVgEUUstf74dQukTS42UzK4rht
	pJO9jGQdGpkaIg3EnC4eOdsRLa/1ZO7+NqohrBSjzlHqr1YuAcabI4OMuf25NmlJblwwjZMRrBP
	1CoVoCmWpbfFd8h9KvVu+rsxGevRGjiWDAlGyi+6enaZV1opeG1OOhSeUAQ4ioAbmWIgn/YlFW7
	n9wbGICGz8oQ71DR20LCTsb2U9+6tLBF2AYCxDTaAAQego7npysVAs4evmDXkjfXMwaEJ/uzXh4
	Qk39Rfj38SVHIOttCm06uGjmzvpKvC2tm5YyAlqKMhhjDLzeSlYULhbq0/eAHWReV92vOw==
X-Received: by 2002:a05:6a21:178a:b0:3e1:a27e:302e with SMTP id adf61e73a8af0-3e8eab1a4dbmr1746535637.24.1793117531324;
        Tue, 27 Oct 2026 09:12:11 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a72c9f0asm252149b3a.46.2026.10.27.09.12.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:12:09 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 14/18] lib/plist.c: remove requeue function
Date: Wed, 28 Oct 2026 00:11:44 +0800
Message-ID: <60abc13d07a46750d14478d9cb4bc1ad480321ee.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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
 lib/plist.c           | 64 -------------------------------------------
 2 files changed, 66 deletions(-)

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
index a5bef38add43..b05ae7ffea87 100644
--- a/lib/plist.c
+++ b/lib/plist.c
@@ -142,58 +142,6 @@ void plist_del(struct plist_node *node, struct plist_head *head)
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
-	 */
-	if (!list_empty(&iter->prio_list)) {
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
@@ -231,14 +179,6 @@ static void __init plist_test_check(int nr_expect)
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
@@ -262,10 +202,6 @@ static int  __init plist_test(void)
 			nr_expect--;
 		}
 		plist_test_check(nr_expect);
-		if (!plist_node_empty(test_node + i)) {
-			plist_test_requeue(test_node + i);
-			plist_test_check(nr_expect);
-		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(test_node); i++) {
