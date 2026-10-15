Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D854B95C7;
	Thu, 15 Oct 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051536; cv=none; b=hNXIwkvBpaxk8o3CJM/+Z0QxKy+IHjwGerI4Tyrjw7XoO/rloApNONqUWfJnn63Sp9g6XQJ7ySGQo1eyWYD7eaWgT5V6zzSIghlBZxx6qmWdKuplOM5AhaUS3q85/MDmY07nac2CKhp+AGilqmkQbLo/biua71+z2fLFGBi7nEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051536; c=relaxed/simple;
	bh=6IyKGf3/TuVhHDXgnzxe081pwu46TpkTxXGk0CU0aFg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=DjnwSCFtFTNNpIGiOW38zbJiDuYga6YBThBmsERxmupzkIl5R6kE1wm01ik0+0BeJBTvWWeQdfI+jGTYAoK+cz2Lu4C0bqgglvH+AXQE7zsdSwAmIZexpmtQC885nkLdr7K0k2g4pGnt/eiOOpGAtM8m5+Fu4s35mAe16PajwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vuB3ZjPE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XiTl3pyR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vuB3ZjPE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XiTl3pyR"
Date: Thu, 15 Oct 2026 08:05:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051533;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ftb10NUTSYarb0lQyaS29Sql5FH93kLDSp25aN0lxfY=;
	b=vuB3ZjPEO4YEaURZziOQPpPF3pTcF/HUnfn5+mIQAg7F1R3oywRkBTcU/uAgKKBPwzoWUB
	bj/qsdfdW4pas2MsKyh6KzeuxuDPc65JA2oF+x6UUmcMW2OUAVaM4ecGSwCoXBUrqCM+Ce
	umIAkmJ/XZv6gQ0S2ueS3vx+Rk6DtqjbtlmXhuoZjsXKm3HVScvjX2FvMU3R4NN+kLZXGI
	dyv7Lui5xCQBx9YKzJeU7aBQS+E0cOFWFPCBEwCiUnQfX9x7C9RFVVSrKJkzNO8L/y15aR
	bYr4mTOg9LAczHhsFj/MzNU5tFxV2X3HzuhnaKMsJ0Ng+HA800fslr9Ve35QCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051533;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ftb10NUTSYarb0lQyaS29Sql5FH93kLDSp25aN0lxfY=;
	b=XiTl3pyRsTnrZxmY7js3gXMliaggsYE1N7b3akZKjmstuuYqkHLTy9iSDISkXok8ylBxAu
	EpzDL3vSREwGXLCQ==
From: "tip-bot2 for Yiwei Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] rbtree_test: Use rb_add_augmented_cached() for the
 cached augmented test
Cc: Yiwei Lin <s921975628@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005093236.62702-5-s921975628@gmail.com>
References: <20261005093236.62702-5-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205153162.2666988.7600218532770876813.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     cc459ecd9388d96dc20404b157f5a4eedb66c355
Gitweb:        https://git.kernel.org/tip/cc459ecd9388d96dc20404b157f5a4eedb6=
6c355
Author:        Yiwei Lin <s921975628@gmail.com>
AuthorDate:    Mon, 05 Oct 2026 17:32:36 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:28 +02:00

rbtree_test: Use rb_add_augmented_cached() for the cached augmented test

insert_augmented_cached() open-codes the descent that the generic
rb_add_augmented_cached() helper provides.  Use the helper instead,
so that rbtree_test covers it: it is what sched/eevdf relies on and
nothing in lib/ exercises it today.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261005093236.62702-5-s921975628@gmail.com
---
 lib/rbtree_test.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index c1386d3..00f62e4 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -89,29 +89,8 @@ static void insert_augmented(struct test_node *node,
 static void insert_augmented_cached(struct test_node *node,
 				    struct rb_root_cached *root)
 {
-	struct rb_node **new =3D &root->rb_root.rb_node, *rb_parent =3D NULL;
-	u32 key =3D node->key;
-	u32 val =3D node->val;
-	struct test_node *parent;
-	bool leftmost =3D true;
-
-	while (*new) {
-		rb_parent =3D *new;
-		parent =3D rb_entry(rb_parent, struct test_node, rb);
-		if (parent->augmented < val)
-			parent->augmented =3D val;
-		if (key < parent->key)
-			new =3D &parent->rb.rb_left;
-		else {
-			new =3D &parent->rb.rb_right;
-			leftmost =3D false;
-		}
-	}
-
-	node->augmented =3D val;
-	rb_link_node(&node->rb, rb_parent, new);
-	rb_insert_augmented_cached(&node->rb, root,
-				   leftmost, &augment_callbacks);
+	node->augmented =3D node->val;
+	rb_add_augmented_cached(&node->rb, root, less, &augment_callbacks);
 }
=20
=20
