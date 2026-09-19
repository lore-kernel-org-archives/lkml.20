Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E742FC876
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777533; cv=none; b=YNr27vMeQqdZYeFsBlw1ItQOqx7UsryVPcCdeHyVIw5kaG5yXDGDW9fIu6OV8JMduM9cReq/E9su+S6nqszfPtLTmxvczjTxd7oYbq1AA9i54UUcZAblGPgxYKCylGHOQmoBxFM2JRrXXuYSEtPWN3p957dY4raNdUaSgDEde3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777533; c=relaxed/simple;
	bh=x+yg26v7Yx1hVuz9jsdjD4vsNkA5lMOLxsM2BNyRhlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EONZtNlPj9I+8RSi/TWbhEogRzMBy7Id+pLPgFobqrp5wRUK43TLA0zLYxqZOWGi9DaB6HY0qzBYhQGqciyd/aHfutSoKpa1vsM7C6a/hC/4k9HEYuaQ8oGEUYQ0ZP0PdCHHQiox5z+xPSfL3kIkP/QVrgtoDJJwQ6WJAbdnJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIg8pI2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIg8pI2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9295F1F000FF;
	Sat, 19 Sep 2026 00:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789777526;
	bh=tGQ9hlMFSAhhj6Pqt58SgIgl+joG1AKFvjL7l6x3tt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eIg8pI2gt3hGgJAAUitQ6OTZOETQkx386IwoZyKKv6T3j4Z25C4BXQjVMLPuZ7aZD
	 n7+Avgq0JbVaY1ZPHwliSZ/FFzV03SEX3GUHIDhyvIgDk9m3tt54uEGYzeyN0q0siF
	 nRh1WB2hwdcEyvLaxUFPtmfmcLAl7EPvPAQj+xmW7/x1ltckg9xzQrMR2LzR/gar22
	 C7R5cyZ0L7BPu0+XKyWC9hw6bhqxEGMv9hof9Y6MxnQbuKuaN2mnUuDtQcTGEawWem
	 QfenTvAAm6g0T0sygSgJ7+5jHjfEqLTuqoSUyNV86xLt17nRDXpEBJmp/6ievmOaEi
	 j4FthWc0SjS5A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6081CCE1775; Fri, 18 Sep 2026 17:25:26 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 1/2] timers: Mark updates to hlist_node ->pprev field
Date: Fri, 18 Sep 2026 17:25:22 -0700
Message-Id: <20260919002523.3133928-1-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <d432e78f-1d1b-422a-8622-8d3145cecbfd@paulmck-laptop>
References: <d432e78f-1d1b-422a-8622-8d3145cecbfd@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hlist_unhashed_lockless() function locklessly samples the hlist_node
structure's ->pprev field, but detach_timer(), hlist_move_list(), and
hlist_splice_init() all use plain C-language stores to update this field,
despite the "The READ_ONCE() is paired with the various WRITE_ONCE() in
hlist helpers that are defined below" in the hlist_unhashed_lockless()
header comment.

Therefore use WRITE_ONCE() for these ->pprev updates.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/list.h | 6 +++---
 kernel/time/timer.c  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index 77fb62f79928..e3753695e76c 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -1172,7 +1172,7 @@ static inline void hlist_move_list(struct hlist_head *old,
 {
 	new->first = old->first;
 	if (new->first)
-		new->first->pprev = &new->first;
+		WRITE_ONCE(new->first->pprev, &new->first);
 	old->first = NULL;
 }
 
@@ -1189,10 +1189,10 @@ static inline void hlist_splice_init(struct hlist_head *from,
 				     struct hlist_head *to)
 {
 	if (to->first)
-		to->first->pprev = &last->next;
+		WRITE_ONCE(to->first->pprev, &last->next);
 	last->next = to->first;
 	to->first = from->first;
-	from->first->pprev = &to->first;
+	WRITE_ONCE(from->first->pprev, &to->first);
 	from->first = NULL;
 }
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ae9abf14688e..42afdcb229d8 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -890,7 +890,7 @@ static inline void detach_timer(struct timer_list *timer, bool clear_pending)
 
 	__hlist_del(entry);
 	if (clear_pending)
-		entry->pprev = NULL;
+		WRITE_ONCE(entry->pprev, NULL);
 	entry->next = LIST_POISON2;
 }
 
-- 
2.40.1

