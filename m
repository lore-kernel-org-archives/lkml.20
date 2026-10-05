Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C7448B9D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192796; cv=none; b=PjWDe/QqzZ3UlaiqYHyjJBz/91JJ+5XmJNaXQMGQVjnUuj3F3tJD2eb4mTVcbiCd2FnVA2ASF6d1W7ho9VO1x4EOpcNVwFbtsoTPvANgBeKnlAu0kaVhMqlzNkbk1wUjXvGQFsi9FCKH+kPrhivniLFdjPmF30JrTGl0POUBwLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192796; c=relaxed/simple;
	bh=ljRvTa1FKA++fXKqZkWKN8lwihjtnE8tip6RujlYs5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PW9+JtlDhv1u64sgsphnA3gxRdL78AUXEKzxqfBZQaqexJSX9rJDPZWXzVhtHEgwemZH4DTRZefQrXL/ZnnszmBP/RTTof6R66ZNLCDB8AeLPtyWDwOZSqaYoDoKAGzdrz/OKUDYqLGSfkngJQ6sF9z7YcoOfBljAxV0GK+EEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+ANPpma; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+ANPpma"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d1802740so758487a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791192787; x=1791797587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=R+ANPpmasXczR4MLk/lqBpKV/9YLFrMBYhR/ZGE8e/r7kklNI5m36HYDzSkuC1xXUl
         jAMN22A0/t0hWR8He90N9ZA0tdthKTsMEyl/J/Oq2FftLCKQrwmZ0BZ/zYEm/p9r56C2
         T9BWHqW4VyIefG2pfhczQW0+80pvs4hUYTPp2tlw4iivy4rQSNvLon3juhR2P3k8jO0V
         2/ZEE3rTu0o/+agykz7YWbenf5o21z0tL55gsOZPrHF60Xx+sHA2X+cEwPnD5S1v3yoR
         bjhljdA58/3/cbBPJXTcEzePjCwOL4AmpGEzKQTZ3mAct6GISnKHri6W7qWvwcsL+ecO
         bVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192787; x=1791797587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyOFPjEEQvNyGsovA6lNcMTRXqLjejzL5M22wl797U=;
        b=hr7UKnKUFochjDdykaZx9kYtkRrpAC0CtW/QalpoUTP78m9IxlK/iE/snCgh4KGSfR
         AeiRf1NbZZCU+E3kI3MNavsunOVwehoG8XLrbxTE3iQXXOuM3w71zO2K9Mj/JWK6xJ4g
         UI6cll/7KDMfe0NKHYs5VqrlCr89PdDZ5H8/eiN67T4dBfLjl+oFJfEnaHAtApBCs6xM
         AfXD4UiifjwNSvQWQkoBhn/aRs/V8/T0crBI0TBWigrozX7IigKOHU3nzT2kstV12tea
         kI1pQPoc0obwRFmBao3VuHx1lPBwzb72I3QMY5iUVLFw3cgS6KzdnkYqIgPv8qjs6wsl
         aL4w==
X-Forwarded-Encrypted: i=1; AKwUvBzexqnTRbMKtbdEI3tkkpCU74uEQ2QsYIYt6wlsY0Xo8tRL+apkyMdT3bSn9aaa2Ua5szuqXqy3ejjbJqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOxrvMJPamcOVJOTZA9F0LTwmIaLksQvF5fkfsEnfWF1WepnKt
	MXCs9j69CCAklT+ELS6sEypKUAh3kNqIKza2nwbddoJnvn/pbUS0Z24B
X-Gm-Gg: AYBFou3GXMOmTrT1nJalfG093jsGR1c7ZMPuVxb5eM8mKS+7WbPXRu3VW2bR9nxlqkH
	H5kEQwVdDPQ/mZi65FjcAbIHsCun8jMlgFwwMK8tzKs8LsKPnyAUnRFQcKUVeWYFYopDDopyyRY
	JWOyteSMXlVSOIlGWzlMXRXWo9Kng0I/FRpcdUH5s5g232urRn1CkhrqwEhD686yeACQmIx5tSg
	m5aPspCoZ4xD4eVwwQKaqSMrrNX4rYBe2bTuWUfVXd/KRTT3Unb+l+AYmB+v+01taiQ6h6hlfw5
	IdwiFLErboj5dZoci06zSJw6B5Sw2kfFmJDsq3IVrT8qlqIZ7h0dnhVRrjLgtO0q+xXIc+CGsfJ
	PDgdFvZZnEtxR970tyHWTSohKgj2rb8HfUIoNA1u9TD7TgiEqLP1bfY0XUJEsBvfdXUnoipQA2O
	EMCdMMGPfbetbpXQ5R0SazIh2ms7RZFS2oDQHfunYVJJ3JUhmyQ3bx/zfwrfTbkduZpBQ951hAm
	y5Bo+JaPDu3ZaoVpxE=
X-Received: by 2002:a17:90b:1c12:b0:3a4:9f7f:8cc1 with SMTP id 98e67ed59e1d1-3a6ce75d149mr9261079a91.24.1791192787284;
        Mon, 05 Oct 2026 02:33:07 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ad87874esm4527886a91.0.2026.10.05.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:33:06 -0700 (PDT)
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
Subject: [PATCH v3 1/4] rbtree_test: use rb_add() and rb_add_cached() for the basic tests
Date: Mon,  5 Oct 2026 17:32:33 +0800
Message-Id: <20261005093236.62702-2-s921975628@gmail.com>
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

