Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57112456DED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005169; cv=none; b=dPDRmvWbj9JFewpygyTT6pWZMEzAgoL8kw2caWX2ZBJhmPOFoocoX8FARtyXDwT2ZYEpatumwhNICFG/8jDQ3Tc/O2sIdvGlTcTFc2Lt7HKZqhMNwXbf1WPMzqphg/F8Ou61lthaPD3PwTB7Vcrjeuki9ax1WW+xXuDuTMfnzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005169; c=relaxed/simple;
	bh=xIq3t6dChknsEnIOTV74XW7S7ach0NV56IdvrMJxXGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCpWragXG//mGjsCnRXCOMBroMRN185VlFtqFrkFDXtboX+mdZ1nVbcXFXm2RUSXRb7qoYMqd1SH0PAS367ClPSOwLndpyXO3EtA7OQ3sBRUUG2hN651kt/eSisuzat0kgFi/maKBpfbI3wFJVnXG4VpNBNYS3Ojt2XyKA5//J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=YvuStzba; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="YvuStzba"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2086031eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005163; x=1792609963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrhnOyCnuFrl0jSp2QdE1/m0irIgtCD+WhnhWodFpc4=;
        b=YvuStzba+iB0SB8lhAE/rqO16PB8rBnF9dYmh1SZ6IfWmPI8l+9zI+NDhqhOzDsY1V
         5ZfnOfbPLKNZwn30vgfaAWXGTJDoSRLpBuTVecfFaF2+hyyLxoTdBQysoiATfTNHSdtj
         Vb74+tD8fBDQ/nhum5+CQFgdHS/JewpPzVO6on9pXxHZQe7XE9PvTjuu7QM3w8h5GrHS
         yLUCX/U3Ax6mTtUIbezBk7mWg6vys21s28AHU6OlYPkfpoHj100Pmm0Z0/4xHHBVt6Er
         upYVmkMwKr6u+uJsVgXK8h0Kfg0PI7KKp6Q+4EFStDO346MPFPSRinEVmHhiwc98fV3c
         KyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005163; x=1792609963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrhnOyCnuFrl0jSp2QdE1/m0irIgtCD+WhnhWodFpc4=;
        b=FKR8c42tMqWVc+6qPeCdLFoSMq8Dakp/qcX7Pr3phOdJHjDBdIReNjX9U9TKtzfpFE
         6E8IV9u7o1Yl05RYPrDEgbh8Ci9ma3kqbH+bMKge2yhKa3LmjAUCsUK+3heIZWB/bv4o
         hGB2cctdlDJ5zSor8pfGr1yC/V8Z5YrefqUNfGrIBVJ80A316X/yCHHNcjhiqYyor5+x
         aDX6d6LKEwRAebEkDghpSSQTACdOoWIuuxNb9Lil6SYGxwi1UJWqF9t5WlPiE8PpIxh7
         xeY2WboqxWcDhgljmVgpiRxU5hMN9H3SFx49L+3t+s+/7Vsmoeq09/Z/xRAcU1Zru/8I
         GLWg==
X-Forwarded-Encrypted: i=1; AKwUvBw9pAsjHEH3/iJndYdKxEbooCxJr7AK9PUNIOiCSRCPIUsjh89P8w8LZ5mcLGiABKhSLhSmOrYjYaqZBkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjP4vx0jGVLpC0NaXXOxyP853U370lqbaIl5dA7CJklqalM4xp
	UNbyNEdE8pAAZ8q8dcQX9e4cppHeYDS/piK+fAOLycv3t+LmCujLOBoh8mXFpTDxADg=
X-Gm-Gg: AYBFou26Xker8zztSyGLcDtNc/FLMjy0wgE9pePOOeleF2jJAT1XXWGRn+b3EqyWaPC
	P6Q8KG343HETVUxSQIh/wf2OIKMQyeG94xoz9/fd7rdoblQWswYPJOWd+RluVZ6zKHfVG8LGIAV
	wRYbBJzs7chFT7AxGhpj7PBSp+AXMg/Fms4s8TpWVrRw9XpTJpJZjmZVzT3Mg2sBCUpVzyhPZIL
	km3aXFJTlv3rYnFDWLy+lW1huUKh1D3s/ulaL2+CesW9xgMhT0qWXRYBgAqDnzix1F1mxfqAbGM
	ZD1C1GY7YEAqQggQTzmJrJ1zzVxERBhkFbCmhRyPtCElQ87lYshkcYtvsDKdr5WjHhiXuKo8u2y
	9QpXHrC6RnHjR/VdUSPvbIG2VuIOH1GeCfZlPbV12sBz78mDyCA40C07gr+c6fTOc3UsxjuNJ8S
	JJ0z3KMo1XUeI71TmmlQ06fQn/V+q3zzUop9HJKX8TMDqEXR/aejHkARzAQsfp0ql5xLWw5CrAL
	9s0Amb5YvBTj+DSs4UBtMDDc7dzS3BUQZKfTl4kZdGeBgt69E62hB39ADKFmFMk8gBf6z8=
X-Received: by 2002:a05:7301:182a:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-3537e034fecmr22587390eec.31.1792005163180;
        Wed, 14 Oct 2026 12:12:43 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm54329888eec.28.2026.10.14.12.12.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:12:41 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: cel@kernel.org,
	linux-kernel@vger.kernel.org,
	neil@brown.name
Subject: [PATCH 6.6.y 1/2] llist: add interface to check if a node is on a list.
Date: Wed, 14 Oct 2026 15:12:35 -0400
Message-ID: <20261014191236.23696-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014191236.23696-1-artem@trailofbits.com>
References: <20261014191236.23696-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: NeilBrown <neilb@suse.de>

[ Upstream commit d6b3358a2813bb14791259a2227d9af1e7019ca0 ]

With list.h lists, it is easy to test if a node is on a list, providing
it was initialised and that it is removed with list_del_init().

This patch provides similar functionality for llist.h lists.

 init_llist_node()
marks a node as being not-on-any-list be setting the ->next pointer to
the node itself.
 llist_on_list()
tests if the node is on any list.
 llist_del_first_init()
remove the first element from a llist, and marks it as being off-list.

Signed-off-by: NeilBrown <neilb@suse.de>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the prerequisite for CVE-2025-38264 to
6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 include/linux/llist.h |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 85bda2d02d65be05f9fad9c52f60b49ec483d2a7..dcb91e3bac1ccce7c8327cbeb42462f5eaeb79be 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -73,6 +73,33 @@ static inline void init_llist_head(struct llist_head *list)
 	list->first = NULL;
 }
 
+/**
+ * init_llist_node - initialize lock-less list node
+ * @node:	the node to be initialised
+ *
+ * In cases where there is a need to test if a node is on
+ * a list or not, this initialises the node to clearly
+ * not be on any list.
+ */
+static inline void init_llist_node(struct llist_node *node)
+{
+	node->next = node;
+}
+
+/**
+ * llist_on_list - test if a lock-list list node is on a list
+ * @node:	the node to test
+ *
+ * When a node is on a list the ->next pointer will be NULL or
+ * some other node.  It can never point to itself.  We use that
+ * in init_llist_node() to record that a node is not on any list,
+ * and here to test whether it is on any list.
+ */
+static inline bool llist_on_list(const struct llist_node *node)
+{
+	return node->next != node;
+}
+
 /**
  * llist_entry - get the struct of this entry
  * @ptr:	the &struct llist_node pointer.
@@ -249,6 +276,21 @@ static inline struct llist_node *__llist_del_all(struct llist_head *head)
 
 extern struct llist_node *llist_del_first(struct llist_head *head);
 
+/**
+ * llist_del_first_init - delete first entry from lock-list and mark is as being off-list
+ * @head:	the head of lock-less list to delete from.
+ *
+ * This behave the same as llist_del_first() except that llist_init_node() is called
+ * on the returned node so that llist_on_list() will report false for the node.
+ */
+static inline struct llist_node *llist_del_first_init(struct llist_head *head)
+{
+	struct llist_node *n = llist_del_first(head);
+
+	if (n)
+		init_llist_node(n);
+	return n;
+}
 struct llist_node *llist_reverse_order(struct llist_node *head);
 
 #endif /* LLIST_H */
