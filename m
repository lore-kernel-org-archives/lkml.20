Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63A457E4E;
	Tue, 29 Sep 2026 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709082; cv=none; b=hX6QtcufDHehUBce6uQUQzGkNfyeScIhNoo37NOcUuiQNg93jvO0gzb/6oSj7zZfB0H1Y6M2EBxvBqbMRJv1dcshMhsKVU65RIAbzOzDre5sQsNMj2fQ/wIcoTfXvr/MkQj4g92RNabqOB8MqTi+NwTa/Cg1FMpGGYdGDMSvjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709082; c=relaxed/simple;
	bh=izHzaJOs0CEG4YSsC3pzhFbNDXDUjOsPjamc/l8PlFk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Pq0HEyMyz1YJqlv0wAsoWysXE9hRDbgWu2j0DxVkqWYLVVu2Wp91ZtTCK5jX3zVTo25iLAFTCR7APk5QhDpFrr7cJoZ4aEtKG9o3TaGPAvlJJFYlYjycPRqN07Unp+dkmOxEFf3ImPN8jssVqaF/29vB40sUGD0N1R7w51mIiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2bZK6t91; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NyclH/v4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2bZK6t91";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NyclH/v4"
Date: Tue, 29 Sep 2026 19:11:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790709079;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXd4x92/vZCRy1R5g518OCi9+DCUXSWZPLaRtdhAq4g=;
	b=2bZK6t91OcvlA3I4HQwhfwom9wF+kkjhCh5fab5G1ezX7wBoXXNFuFRxapC5+7lHYQLjJ4
	3Jsc8g4uf7UZDyARzxmBSi4xbplmqK8Gm5ZcGqouqPaAkGDvep5DMNhr4Db5GNMKmFiCAU
	aoIr3jpVStgzHmEZ5ePp+b2suih1FtRUYrqmnlai7j0CHYNAjXUuCevR80WaxRc0R2rl81
	UEEGzd1civrbflMRrAAb/rWQkuJkZnaaN/36Saw8qG6r0TIdEp8qo6MC7DRwcQNV7bfnw5
	L9Le8ro4xilvhoRSkOoPgTXEdeNW5BJIKBoibh08/YcCAbdy44t249Y/WzoCxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790709079;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXd4x92/vZCRy1R5g518OCi9+DCUXSWZPLaRtdhAq4g=;
	b=NyclH/v4kBduiQ6+mS0Jy1x4LRcyU8Fmml7+rfcrF6EDbyPlUhq2UGu5iGTOmX1AGrEaZp
	sGRfiPbP1VBl0jBA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] timers: Mark racy updates to hlist_node::pprev field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919002523.3133928-1-paulmck@kernel.org>
References: <20260919002523.3133928-1-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070907745.3910103.4729382723879149495.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     1159ad0a6aaa414dc726a33ccdcb702752d1b8eb
Gitweb:        https://git.kernel.org/tip/1159ad0a6aaa414dc726a33ccdcb702752d=
1b8eb
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:25:22 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:07:15 +02:00

timers: Mark racy updates to hlist_node::pprev field

hlist_unhashed_lockless() locklessly samples the hlist_node structure's
pprev field, but detach_timer(), hlist_move_list(), and hlist_splice_init()
all use plain C-language stores to update this field, despite the "The
READ_ONCE() is paired with the various WRITE_ONCE() in hlist helpers that
are defined below" in the hlist_unhashed_lockless() header comment.

Therefore use WRITE_ONCE() for these hlist_node::pprev updates.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919002523.3133928-1-paulmck@kernel.org
---
 include/linux/list.h | 6 +++---
 kernel/time/timer.c  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index 77fb62f..e375369 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -1172,7 +1172,7 @@ static inline void hlist_move_list(struct hlist_head *o=
ld,
 {
 	new->first =3D old->first;
 	if (new->first)
-		new->first->pprev =3D &new->first;
+		WRITE_ONCE(new->first->pprev, &new->first);
 	old->first =3D NULL;
 }
=20
@@ -1189,10 +1189,10 @@ static inline void hlist_splice_init(struct hlist_hea=
d *from,
 				     struct hlist_head *to)
 {
 	if (to->first)
-		to->first->pprev =3D &last->next;
+		WRITE_ONCE(to->first->pprev, &last->next);
 	last->next =3D to->first;
 	to->first =3D from->first;
-	from->first->pprev =3D &to->first;
+	WRITE_ONCE(from->first->pprev, &to->first);
 	from->first =3D NULL;
 }
=20
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ae9abf1..42afdcb 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -890,7 +890,7 @@ static inline void detach_timer(struct timer_list *timer,=
 bool clear_pending)
=20
 	__hlist_del(entry);
 	if (clear_pending)
-		entry->pprev =3D NULL;
+		WRITE_ONCE(entry->pprev, NULL);
 	entry->next =3D LIST_POISON2;
 }
=20
