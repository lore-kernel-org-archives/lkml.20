Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E271F09AD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989727; cv=none; b=V3SCW1gq3ENPTBz+/cc7hgsG+pxkVZxDEf3u5TEw5E44lsToHRiSXGvwaZP0z3733dcLpAKy1W8ZaVAMW+v43U6lwd5vqwouEJDGYYpDqB24H0mPsTxIDt4Kp73bUKpLI2IxQLqOMr1RdK7oqnfzJ9Ns4lJ4YpZK9xlvzQ+8vF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989727; c=relaxed/simple;
	bh=2vq6Z7ZSe/CnfQnpo6YCDKeG1V4nRowKTs6jGCSXi80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muYDPQ39JqOkHnGICwmxkbvGITpfxTtKbTMVCf4A2r7nQ14hyTEyexqKVupSyox1zJaqRQPGxyqtHE0gNnJHBMuL3+HrM+2y4wJnlB5eyxsym4a8CVLYQB3uVPLkKpEQfl0EAIy0KQ+R2C3POfoS8ubgkdhbA4Vwdxtz+SM4SeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX7hPMNS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX7hPMNS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbee846deecso2390094a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989726; x=1788594526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V58LX9cQfAsn8GO5XE1VypHteINKmbZsjfFFi0DDS4w=;
        b=bX7hPMNS6+f4keV19vGL3GBAe7mrQWpZxBE39+w5cjOEplWg2tv0is0stXdmqdo/rY
         Et1ohiGC8KdPviWSAVltzYEuK3sPvaBzhNpFU/RsYT3ak0vdGqPsCexM2cTjK572AB4e
         8wsX+P6Qn3h5nNrCOKmSts1LayQuuwbDxIdCYRzGlj+/rSHoJkyH0YqgtQ1BfhgG+XPw
         yqEWQ9Bb8CWkGPGOXeGpWiWY49nkLkPDiB25uiKV6LUsHiOdhLqyv3pGhuFPnd4nJ/wW
         FHoQfczvqtySzKIfnz7oSZTjc8B8syUE+BLkAFdDb3UiT5PxomdS0kGcvvxbHORhEDwa
         zrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989726; x=1788594526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V58LX9cQfAsn8GO5XE1VypHteINKmbZsjfFFi0DDS4w=;
        b=bjhjVVS3PoDJ3PwabFnUNOGiOQKPNZ4zI5Taw3OWiOLmsnqPxF3qtI6ucHMb6KAnOf
         /QXd1y8P3Vkv/fzrGvdFYlh6A+Ihi5ORqYDjpe/TdOQIlg56VehROmSPumSoVLburkvj
         8Tta5gDxiJeKMDdlHY8wDIRKj+3225yj44t009PQKk/Gj2pT8h2+ZJJJuN91vNYljdNP
         c4ckhf2HN2L4rynelBZNbnDbsuFpwcK32OKaPfqQuWApvEnOhX4gHKZNbFNE+y0OGdNI
         vAqWMWAPNcrsZtDsA0JFOby493FGtegMzQjCTERwRB7D0P8R3tMQk7EgdBELbqxPiEzR
         JUtQ==
X-Gm-Message-State: AFuF++k9UamwktNMloKFj7clXZBrncy/t17nlV1D27MhnmAp4wVVOgEn
	/8BnNJ5qdfzuMWwmtMF1oej+dOzYuqQgL0RzRWYqwscSLvzLiiimyf7m
X-Gm-Gg: AYBFou3vpiA/1f2I670gi9eXYuvddjmVoKE2ygAVBvFCLi1GKZ2rb30R8EfW1+dZCyh
	qngOmmq2Gq7UKq8nI0Egn9kWnVWbam2fHHkqc1vnImq1oA8zJiQpxIvMTJ5HdikmsHOdMLL+jG/
	JJgdB82UYX9J/yoeepAah4ikzseC0wx5Uf6eAThR9cqBpJob3Pt+YlXJWCaIH9NMQZeyvVa5H8J
	brdpOiUOOgUV88RQs+PzbBj8H/5edPojpDgGtv/aMKibfcQGbXw/arbshamO9Ycyv1gAO0agxYt
	c8oH4Wf/un1WSz/0VvxTDZjYghu8+lcFXGRR6shYmMSb8yzV5bxV3TBJ3rotI2qCgb+GFX2qV4C
	ZGL1wkJ7aMka/rgHjLRlDuVPBd3RXx9SzwSg1nUIilvZvRZYvLbdB2iQybk2mbabsz0oilFDBzM
	zvADQWpgfvFs6PfUkOvtzu2MozX8d2cQ/WlSd4AWmv5j6U9/htX+LrbBCfrMmWmXtfWPwsZ2jaF
	84Y4BkUlrpDZdjFGZgyCp0jeC12
X-Received: by 2002:a17:90a:fc4e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-396d0f8fdbemr24035986a91.11.1787989725941;
        Sat, 29 Aug 2026 00:48:45 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm10748234a91.10.2026.08.29.00.48.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:48:45 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
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
	Thomas Gleixner <tglx@kernel.org>
Subject: [RESEND RFC PATCH v2 13/13] lib/plist.c: remove requeue function
Date: Sat, 29 Aug 2026 15:48:37 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-13-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Now the last user of plist requeue is gone, this function can be
removed.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
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
-- 
2.55.0
