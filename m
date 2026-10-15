Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23E4B126F;
	Thu, 15 Oct 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051541; cv=none; b=Elpog8VF/zLcOwX7AIDFZe+npSHEBQCcXXmc2M5847cremCadF2LbcOct6gILp9DpLYH2eARtyRHi54jNN7malbsPIFbI1L33aLMTG+aBWncEdOdxu+fski0MIVHKN8sM7KdaAgSS++CEXlg/OIXVaKzIhME/gaIv5GRrfdLihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051541; c=relaxed/simple;
	bh=x6qsfQLYrEXcjTKoLBVsmrjYQEeMbiSPxq999yD0V20=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Qh7DJs0Pe+dRFKcjx/Uz1REUlMUPmA34XEWQT44zeOqkFTQ+NY/vaOAte2a24XDNGR+wW+9HhHt7N02MO2P2vaU6b3x/rNo+Kpw/TAJhzYutRSjfYVUx2gel1gpL1yPrlgvuf32X07taurJLxLAfXIhVeUikaGMgoeQNKtKdYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rdtRTdFS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M54hrhzm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rdtRTdFS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M54hrhzm"
Date: Thu, 15 Oct 2026 08:05:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUehnfkt+Y+FuqoR0Weqc61MqcL1LTK+KqadBGhAM18=;
	b=rdtRTdFSCHK3aafPxWrcrbtkD5gsRuHQanTMX+9SqvfZX5XpLdYHXq/z60FDGz3sbumA5k
	W98IfEjTjky/XDrGNZLLgBjDiOB+88Epcx5SlQbjU+mV2HtTERzp4hdSRFWhGbUSDn8pjh
	zyYoCrWr20jzNu9Ko8loVPRJxUtZHt6VXIqXRpSbR6h9QQr7gXC1+oUyIqSOGiUIiwZbJd
	ZBku2XyokUWNI55jD3N1f8/mq2vGzrZx2wtR1DP5Gy1WrrXXl766BYpT5vHshM2MaBWNG7
	xjso1+q8GN8tjpYCIGxy8LcSX9coDXX7QZZ6JjYOpYyUjdXE6c43zNbXga4HUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUehnfkt+Y+FuqoR0Weqc61MqcL1LTK+KqadBGhAM18=;
	b=M54hrhzm0vkeR66wQ0Qnva5qI0f9n+Z1roDSQM9tzj+lwEbCZqhXeRzgql8I6NjrD1ktYV
	6Nv0faWSkgNe7OCA==
From: "tip-bot2 for Yiwei Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] rbtree_test: Use rb_add() and rb_add_cached() for
 the basic tests
Cc: Yiwei Lin <s921975628@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005093236.62702-2-s921975628@gmail.com>
References: <20261005093236.62702-2-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205153675.2666988.4350854089315017382.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9fc91ae6852aa6e63c08b6093634cfcc85021b4e
Gitweb:        https://git.kernel.org/tip/9fc91ae6852aa6e63c08b6093634cfcc850=
21b4e
Author:        Yiwei Lin <s921975628@gmail.com>
AuthorDate:    Mon, 05 Oct 2026 17:32:33 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:27 +02:00

rbtree_test: Use rb_add() and rb_add_cached() for the basic tests

insert() and insert_cached() open-code exactly what the generic
rb_add() and rb_add_cached() helpers do.  Use the helpers instead.

Besides removing duplicated code, this makes rbtree_test cover the
helpers themselves, which is what most in-tree rbtree users call
nowadays.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261005093236.62702-2-s921975628@gmail.com
---
 lib/rbtree_test.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 768c5e6..c1386d3 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -30,41 +30,20 @@ static struct test_node *nodes =3D NULL;
=20
 static struct rnd_state rnd;
=20
-static void insert(struct test_node *node, struct rb_root_cached *root)
+static inline bool less(struct rb_node *a, const struct rb_node *b)
 {
-	struct rb_node **new =3D &root->rb_root.rb_node, *parent =3D NULL;
-	u32 key =3D node->key;
-
-	while (*new) {
-		parent =3D *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new =3D &parent->rb_left;
-		else
-			new =3D &parent->rb_right;
-	}
+	return rb_entry(a, struct test_node, rb)->key <
+	       rb_entry(b, struct test_node, rb)->key;
+}
=20
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color(&node->rb, &root->rb_root);
+static void insert(struct test_node *node, struct rb_root_cached *root)
+{
+	rb_add(&node->rb, &root->rb_root, less);
 }
=20
 static void insert_cached(struct test_node *node, struct rb_root_cached *roo=
t)
 {
-	struct rb_node **new =3D &root->rb_root.rb_node, *parent =3D NULL;
-	u32 key =3D node->key;
-	bool leftmost =3D true;
-
-	while (*new) {
-		parent =3D *new;
-		if (key < rb_entry(parent, struct test_node, rb)->key)
-			new =3D &parent->rb_left;
-		else {
-			new =3D &parent->rb_right;
-			leftmost =3D false;
-		}
-	}
-
-	rb_link_node(&node->rb, parent, new);
-	rb_insert_color_cached(&node->rb, root, leftmost);
+	rb_add_cached(&node->rb, root, less);
 }
=20
 static inline void erase(struct test_node *node, struct rb_root_cached *root)
