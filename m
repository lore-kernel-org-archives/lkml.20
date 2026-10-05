Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA844607C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192813; cv=none; b=MD6gqpl6ayQuteqkKtEcYfGA4l0ylazq+NQCRgT93+YKUY95pqbNJE6+MpVElTp2MRYfiSQVhTkmMReq0D7nND25uAkISWeEn6vAsYYNZ1m2K5bg8DSLjFnhxJ6TA4QWAMYS0oFXJCXl1OwHI4yf2x5us/6q8+W4meBXJGANEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192813; c=relaxed/simple;
	bh=+cEEr6znaNoigBam8Uz4P3hHrN1WO+xiS9Xy1l2461g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzRY0CF5PRvAgyJb/FLgrQEk1jRfy2w079E1AVrl+RA35WWdbyc3hBd2UAYDD1AYi+Krh/V4VQAN2CGm+OmKB5iIWiiGGXlHTtJFPliPv4LrQCEA8BJUKltNpeyiBOiT5KXfqgWVMGyOkStUVbiQGyrvOyzKnNejY9rUCUJTqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/p46LFe; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/p46LFe"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso697618a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791192802; x=1791797602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=V/p46LFeBCwpmiN9Rb3ln/6vl8QHBNSP8j3kitbf6DWqNCrFssMdZiN8uwnL2m6nNB
         P67vW6mW4ySpUn1SmjeAYxAu4SFQTw/KtVGNIwdZz5tsbzKbHMAm4sJc4koy7E9VI0kH
         AZ4Tvg7xQYKy/xncjZN3IamoT5fsrwmJqgcFjsb5pOU7UYpXYllCTQfThEccJ2syjQaj
         Q2K0LMdJgAJrTapH+5Vfl7uZiwBGSkJxo6oQGdMbaySSQKE30bcQp8dcfQTNSTABd7B4
         x9KTlnoYPsHs9BY2OMTcEo6Mrlouy3JWgLLqKSP85nX5MO8JOZPeuA9JnNXgjdhcRkuT
         NhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192802; x=1791797602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=k09Y0X9eFRM87IGqDh6m0bz3kOB5joKBSUyGxtuSMLqlQ8GDOOpC16oYpdihEkBCqR
         NJTOhz1E1J2kN7aRwjGMqc1cfQweTyknix51tWf/+w5B3AWknyvq3ka7Um9htApymnzg
         xjW2rFQSwrDK7gxzGAdDyiV3U8OkVnsiAkGMAQbNUE4nkqvF5+hVEjpvirB2gx6Qod0R
         Mn18VlBQKOQ/y1kwlvJP9JFlpShTxyuu8FX6mFrf++moK9ws4rzmiHTOlLY/FTYolywa
         VSXLTIGfB8UGxgY9mb/vxSVD3NNDJegL6z/9bVH8Y8IZSrB2lvtCcLphDMbTtoXMEC/O
         Iq4g==
X-Forwarded-Encrypted: i=1; AKwUvByurv8ZUM01oMzAagdKEKcyUPLgZWZNCIHY+VMQTSJhC8LAtahhR6YYjNMUNm5TJkCB9oAgDN1VSOslhy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7l7Q5H37WMKuRMEYPk3euSYesvenpiipllbgMuLe3rOms0M6b
	6/FEaAJag2qoUgBatHLqCTOVc/eCOrlXfBfvBNCcOZF6iI4MXJTHebYy
X-Gm-Gg: AYBFou0OSdZcEo4aFK2UGmMd6QOomA2/qCYuwwEuk3BYkeGGnOO50JzTGutjqYHoZoF
	iUvCJr2PQFsY5t/Bb+v7AM1Wa6mZHOOXJ4WT4Q1FdXaorWkduqMLccxAiNLThv2/2Zo8ADvAgJG
	V+82WpcJTXPylpeRb6tkNT5jB4JMAA45M1sD1P89OpVDCi3R6Ax5xiEk3Z5eTLw7yTcWZBKCsPr
	MG9KUIWGV96k6Pynu1bF8Mh2GsSfR/ZwwUIt9QrcyliCtW/pNHsqUtBXKs6aBTDJSNIV6PgZCh1
	GlVHd3uhL3K8M9iK0qpuzV4Ula6oiApckOAgT9pBHpNQ9YjNXMa07ytLlafn6VllasaDeYCmxPf
	UjqDiC6AVxRH1OANpvz0jP6fcAHXz3bHUn0zUPagL9UlYBzfsbHrjPaLKfOBbWe8dvo13CCdGIK
	YMncTyensFOKjF4PyQZuRV1rtQ9hGKEZ5Bz97tQnhTUt3gsYPT8OgLaujLXntgz4Pt8tVCxLPWn
	PUuhBDHGcFf21oM5Qc=
X-Received: by 2002:a17:90b:3c05:b0:3a4:a525:56fe with SMTP id 98e67ed59e1d1-3a7138bb9e0mr2976843a91.5.1791192801892;
        Mon, 05 Oct 2026 02:33:21 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ad87874esm4527886a91.0.2026.10.05.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:33:21 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] rbtree_test: use rb_add_augmented_cached() for the cached augmented test
Date: Mon,  5 Oct 2026 17:32:36 +0800
Message-Id: <20261005093236.62702-5-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093236.62702-1-s921975628@gmail.com>
References: <20261005093236.62702-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

insert_augmented_cached() open-codes the descent that the generic
rb_add_augmented_cached() helper provides.  Use the helper instead,
so that rbtree_test covers it: it is what sched/eevdf relies on and
nothing in lib/ exercises it today.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 lib/rbtree_test.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index c1386d328cfb1..00f62e4f9d10e 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -89,29 +89,8 @@ static void insert_augmented(struct test_node *node,
 static void insert_augmented_cached(struct test_node *node,
 				    struct rb_root_cached *root)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *rb_parent = NULL;
-	u32 key = node->key;
-	u32 val = node->val;
-	struct test_node *parent;
-	bool leftmost = true;
-
-	while (*new) {
-		rb_parent = *new;
-		parent = rb_entry(rb_parent, struct test_node, rb);
-		if (parent->augmented < val)
-			parent->augmented = val;
-		if (key < parent->key)
-			new = &parent->rb.rb_left;
-		else {
-			new = &parent->rb.rb_right;
-			leftmost = false;
-		}
-	}
-
-	node->augmented = val;
-	rb_link_node(&node->rb, rb_parent, new);
-	rb_insert_augmented_cached(&node->rb, root,
-				   leftmost, &augment_callbacks);
+	node->augmented = node->val;
+	rb_add_augmented_cached(&node->rb, root, less, &augment_callbacks);
 }
 
 
-- 
2.34.1

