Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213843;
	b=wc3ooWgi6+2TPnK+QLlRVFDHM9QIWI6nvaTqZoI0UnDwGPA//Ja5ym6QVI2YtWMndMNC
	 hBesGvKgYvd+fNjt0mC86zoEKtfphseKQ5S+dLqRJe2CxPrrGJdV4kNKNeDpH5j8H75tR
	 sArNmyGB42+O1wnAvcLeaXNQzOLEl6+CSh5PD5hRUsGiNvak34CuuuRaEqtcEdV0iD+Xp
	 1HbjuQl0ZYklqfo7AfKtion8W34Hc/jVIUt+K/B2MoPbzcGPjVgvXbgpe9rGNrQBMKWdP
	 rfamc/uOJF51swcQXA29W5ayptXwqmm7EtAm88L0gyQn6TfB5BNOaQO4RMjzPOS1lZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213843;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=2CeniJ+HaSxP89uxkw7QZ6nnUVomPrceB6xWekgOGyo=;
	b=RJFD3dBT3nLkSErz1PtGPbiLcRecP6MxFqKwWBXYGfD5+5ssit04iq+ujLkr3036qegw
	 k1IXT1xFaKouudAw5OfkI/X3RGSBU3MHNFQC7H/QoMiXHhOrW7IbnLhUdOTp7zonEPssu
	 H6FJyyy7+LcA38Nex5/WGSwzO1idIwBvXE0gMUUxnu6gjy6kmQHMO4K73RskiyU8N2CWB
	 i+DRUEWftW0inIbYxYvEdAL4whhblhJZO7/einWWdHYh0P3dpPtZZGuU34BoI8li1o9Df
	 M7dV66VGqqCqOCBQFLZom38adtbHE/m7lPwxp/WPHs+qKhF8vcscL7HVSFuRRGDAq4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uWDI6Qxu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WHWqwES4;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E543606D83D;
	Mon,  9 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E543606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uWDI6Qxu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WHWqwES4
Date: Mon, 09 Nov 2026 08:43:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213839;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CeniJ+HaSxP89uxkw7QZ6nnUVomPrceB6xWekgOGyo=;
	b=uWDI6Qxu306kdeKJwh9esUfUEJ0Ns9o2cHfr72/CdHIgkqHye4x1XrjcASUrPv7af35WLF
	2hH1iVp5HcQudXvlHA8OFZLWpmq4ry7AzEsUbrTUMZYcEHb49LlHHxwXNTU1zTYWz6zAEh
	9U3HGjJqg+uEOngUKVjQVls6soof4ZkTiKmCXe+8xtMSoQgfKY9RG0cDRJbf/r0D9HcOVJ
	g7pI4F28sLpXWO9sqKJ2S9He4CxxoinjvJKqFJp4xqwQjRitZVF1SdmWvDy1PAfbRcGQcK
	j5ZieYhiqM2FUyp+NWO/okTj0UwNNWmrOJ35Syf6YQft/XFHW9WSdxUwc21yxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213839;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CeniJ+HaSxP89uxkw7QZ6nnUVomPrceB6xWekgOGyo=;
	b=WHWqwES41eVupMphwk88ykXcgKm63i2SxyEuQ+0o4LcD47i9+IHtQwW5OOyu4gSobN8fKn
	xx3ozpBGr3omwbBg==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/debug: Protect p->mm access in sched_show_numa()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-5-atomlin@atomlin.com>
References: <20261030151307.768523-5-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421383786.2093942.16943375886048681771.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     00139779dedebf0d50469ac931960736210b0be8
Gitweb:        https://git.kernel.org/tip/00139779dedebf0d50469ac931960736210=
b0be8
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:05 -04:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:57 +01:00

sched/debug: Protect p->mm access in sched_show_numa()

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261030151307.768523-5-atomlin@atomlin.com
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index be886ed..a22d646 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1389,8 +1389,10 @@ void print_numa_stats(struct seq_file *m, int node, un=
signed long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
=20
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
