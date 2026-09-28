Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48A34402B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598387; cv=none; b=N+mqg5dDzRInOjb8zQAt0/ufZhinp1hUc/5YwHgOes9uXJYuPn1fZ/BW0k9Gaq35jM4p8SlagQUwVVfTwmChEoEhqHu7l4sopqWfkr+kqUS02frnJ2h/2qRGmch3IHsKPQrnRut9UxqqL8KeyIK/YYLXTSuvGRsA90bsR3EpJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598387; c=relaxed/simple;
	bh=ljRvTa1FKA++fXKqZkWKN8lwihjtnE8tip6RujlYs5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IkN5561tT6WfsASs93jxxzl7AjR4DondnA6JtREBPEwVvmsmKykC/P6euEb72mG9a7c9KjV0FUBJDsk4LIv1XDmIj8XbjgI06M3zvimsdFRywYGrtaoeaF8M4p6ib7jebv4B9hoIKRb2QcrN+wZExbuE4U4y9TM/cTRsUNMqKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmoSSesC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmoSSesC"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so14930635ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598383; x=1791203183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=YmoSSesCMYZUOy5SLMPEbg4dlhpMUeoWMwanjWzLXri7Y27xAgSN4ZV35BV8GnuAKo
         zulw6BBsm2r/s6ROttoUKc6fIGkNLwaiQ8WMeXYqyBnlf6JH8R2XG60M5adfIno8L4qq
         ZzGk8bARotS6o0we3CMZwh2Mu3c4tK7KcLE9JK8PYTztSMfP7ziN3HUtSzMqQgpozLTt
         fpaGwTGI9QM1KSx+ZK1jQMv26hcmJK8NqcZwlYamsvni+PcjhLtMSBTum2qR4X6/gT6D
         q/saV+Ie03Gaowz1gK47GG55w/9+vxudKkbm4ZAhvOrZrBqobH3YKqxU85Ba7IqXcN/W
         3cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598384; x=1791203184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=y9Ff1SizJ2IKhxlYvZj7ex2Snt7KmVQb7rxMkYrPU9k5bP+fyjPfDaBF3+Y4X7uIdY
         GO6E2l/1vHvtyjvetofOIEwbgUaOfEjOt/tMSITvuWppyfiFqG7Oy0PVU2B06t2bHFO3
         tjeXtDb+y7tLjcscKkNeCSSCWkZgeh0Pq6oJ/2d4cGwAbXm92aYVVSmTo0/0cP/ESddA
         jnNNUOye9cAmjAazT7IkC7lN73Yd4RbeRFQVDDIABVQHi8KZltQZVdF3VKxM/E4GOJSr
         V931zRMnW1sIGlUnX2KPHDhRttxHttfmg8NfrhUqZ+W1c5/IxBcqp4VKtDPR+qpXaBuS
         qVfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTlMY5OiDIXA+8ueCGF/30oabLbdMKdiXt2lNEnmixb0AF13kufsTnslvuq6ZhlDZKiyeemvS29bgpDk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjgYnv1XwB05Iip2M4/OBxLM9dAy21HkxUHXT2gSHZs0qqyeJI
	MKWnh38qB7Hz75rULFolG8TTxzXLuQjGnRo6/fnzlfc5/NRvDFbx243Q
X-Gm-Gg: AYBFou1G6wCjrSnaijmHwOL187ImwdJ9h793gB8C2fd5K/XX53xt0om3XQBYqqo7BpW
	fZlIFLbbjl1Ao4HWWqAzYfVIvG/COBQHQ+uBM1pML5F7Pudh9q1yEyUqL9rFSraaM2ab3uMTSjX
	KuNpBlrv02RBBgaVNl0C9DgG7b8BoXVtWnJ7FwQytyfvi1kgVHPu1W2NNnVrlBHDJfBSYvIFkTh
	96DcdaM5kcsc1g+i9NiFJNrjBTk64tP6iFAcTr3fBuubK1BwiLtMkhqPcR48TMU0H+6IF1uyfOd
	oRYFQZhN3Uuk/GE3p4L8nMG7expkOtrKLt+5DjvAutyQ6iywtptS+yjh3caZwkFN/80Mh6CQfP/
	NWI+5Rgibq3n1NdJlM605ExGfDFbzA5BoRR2xSt1p7jWJOYXL1KbYF6DykY42FK3dcIRXMb7Z9c
	zlYxouSyhqhG8xHF6LAW3gB9EJ6IJOi5Bk4khdThrzbGIkGGLjaKdEKHePyhMuMzBiWa4huWw5k
	7x0kkiRkgMqkwxsnFxlHeJ9cdN4BE55qQ5SRMw8UadpfIeTazhMRcmowCIhQ5ymhcIXIY7P7yhd
	exkiiKOnI3fGWzdRWRrV
X-Received: by 2002:a17:903:b85:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2df7da4bf1fmr101833885ad.0.1790598383395;
        Mon, 28 Sep 2026 05:26:23 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:22 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rbtree_test: use rb_add() and rb_add_cached() for the basic tests
Date: Mon, 28 Sep 2026 20:26:09 +0800
Message-Id: <20260928122611.336351-2-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928122611.336351-1-s921975628@gmail.com>
References: <20260928122611.336351-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

insert() and insert_cached() open-code exactly what the generic
rb_add() and rb_add_cached() helpers do.  Use the helpers instead.

Besides removing duplicated code, this makes rbtree_test cover the
helpers themselves, which is what most in-tree rbtree users call
nowadays.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 lib/rbtree_test.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 768c5e6453f37..c1386d328cfb1 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -30,41 +30,20 @@ static struct test_node *nodes = NULL;
 
 static struct rnd_state rnd;
 
-static void insert(struct test_node *node, struct rb_root_cached *root)
+static inline bool less(struct rb_node *a, const struct rb_node *b)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *parent = NULL;
-	u32 key = node->key;
-
-	while (*new) {
-		parent = *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new = &parent->rb_left;
-		else
-			new = &parent->rb_right;
-	}
+	return rb_entry(a, struct test_node, rb)->key <
+	       rb_entry(b, struct test_node, rb)->key;
+}
 
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color(&node->rb, &root->rb_root);
+static void insert(struct test_node *node, struct rb_root_cached *root)
+{
+	rb_add(&node->rb, &root->rb_root, less);
 }
 
 static void insert_cached(struct test_node *node, struct rb_root_cached *root)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *parent = NULL;
-	u32 key = node->key;
-	bool leftmost = true;
-
-	while (*new) {
-		parent = *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new = &parent->rb_left;
-		else {
-			new = &parent->rb_right;
-			leftmost = false;
-		}
-	}
-
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color_cached(&node->rb, root, leftmost);
+	rb_add_cached(&node->rb, root, less);
 }
 
 static inline void erase(struct test_node *node, struct rb_root_cached *root)
-- 
2.34.1

