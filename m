Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216530;
	b=3oVf00gf5wWxOB7qoKba5SeNUM545iHxEAabs/bJN75Wpa6rGG9PhZiGn5RQjrZDXnOl
	 K0vSGhedBB0qvsua3eKm3erexfnINJlL/DAG7xYp7nG5TmQrzbq+7i3ztSqkLIYcTGgQN
	 +FY0aWCVw9u/uOP0Qvf+daTLAS6frf3yiuJ8tTk4qT9wNBd24+l6lyOT44QueEwjdDDDX
	 wqV6To61p0hUSZizHNaR+r8c3ClnDBMfrClPMVEWAj/sLvU/mcmpATSEwCbRTTAnpM4+x
	 Tk8huZkIgjCN266IoaORQvobrJGWVu7hLN2fXZxPGio8f1nGw+nD+B1yuCxzwzgUH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216530;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Tj4FH1WP7P6SgTOvnlJ8leky1uN2cTItivBY4193E5g=;
	b=cwS6xWQClhPmsiuU4qPE7uvECAhluEn+wpetmst6+NAthIwJYa39lS13McwPXCctQQ+0
	 Bbe9ujMs8nICNKVkTAnCMi0NdAHbREM0ENq26nQ9njBUHfwLHkTfw8th5Pj2HckKu6m3m
	 Fi6tWYN0DIaJhAnqbF088BgrwVQNRHN1p0XBYf2pdzQ27DX0bKe6TZsPvnU9el3UQYTA/
	 9FHbiauTtB76wzNmhzYD2DI9SKlqkSZYx7hjE9d0A+oxun1VJlrCbXWa6hReQlCGdAZwt
	 fdpRBhJQBRJjP1m0w0tVt73ggoDCpiPCz+R0LuEIGjJrDLFbzSaoe3PlGn/l4xkrEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2vC00V2K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/+e/au02";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA505606A325;
	Mon,  9 Nov 2026 09:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA505606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2vC00V2K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/+e/au02
Date: Mon, 09 Nov 2026 09:28:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216527;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tj4FH1WP7P6SgTOvnlJ8leky1uN2cTItivBY4193E5g=;
	b=2vC00V2K/VMP6MjHZAaZOqRZP6w0ZUfqMNs7GAcg46yvlvXGSj3NvZTdSooiLCXh+AGuUI
	EfZfflsWZ5PVX173Tg90o/liVrWetqBbokTgq0DeOUcxkinzEoWPigXgdz5m+40Jy+P/wm
	a7cna28xDfTo3VZX5NqSmMHZUIXR3BMinZcScFQ6HYdRLhg5xdFITvGPjtx/u0fiBJ75I+
	NdW2GT1+Smgwr9oTGYGvJ7iaDrbAkFCs8oUijs9c4XKylPBCSl1JUGl+BhJrj1FcHRnJ77
	Ywy0HvvGm+vWIadtto/fTFtB7NDsJ3GlkjqoWaNCFFPoxoOFVSREk7uFmRk2fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216527;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tj4FH1WP7P6SgTOvnlJ8leky1uN2cTItivBY4193E5g=;
	b=/+e/au025eByPIHvYGB8d0iFxZGOu42KXEht1KsymsIyRNQ26FIwsEqYkQbYTBzh+LZj3W
	rgeXN4FmCScO41CA==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Protect lockless rq->rd access in
 print_dl_rq()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-3-atomlin@atomlin.com>
References: <20261030151307.768523-3-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421652579.2093942.8936614645869885986.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     2da6e96e9a61dcd8511687c695d4f9a5cf2b5f02
Gitweb:        https://git.kernel.org/tip/2da6e96e9a61dcd8511687c695d4f9a5cf2=
b5f02
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:03 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:23:39 +01:00

sched/debug: Protect lockless rq->rd access in print_dl_rq()

In print_dl_rq(), cpu_rq(cpu)->rd is dereferenced locklessly to display
deadline bandwidth statistics.

During CPU hot-unplug or cgroup cpuset repartitioning events,
partition_sched_domains() calls cpu_attach_domain(), which executes
rq_attach_root() to detach the CPU from its root_domain. When the
reference count of the detached root_domain drops to zero,
rq_attach_root() calls call_rcu(&old_rd->rcu, free_rootdomain) to
schedule memory teardown after an RCU grace period.

However, rq_attach_root() previously updated rq->rd using a plain C store
without an RCU publication barrier (i.e., rcu_assign_pointer()). Without a
release memory barrier on the writer side, CPU or compiler reordering could
allow the new rq->rd pointer store to become visible to other CPUs before
the initialization writes to rd->dl_bw are committed.

Furthermore, because print_dl_rq() did not hold an RCU read lock while
dereferencing cpu_rq(cpu)->rd, an RCU grace period could elapse
concurrently while debugfs is reading the file, allowing
free_rootdomain() to execute kfree(old_rd) and causing a use-after-free
race condition when print_dl_rq() reads dl_bw->bw.

Resolve this by using rcu_assign_pointer(rq->rd, rd) in rq_attach_root() to
guarantee a release memory barrier when publishing a root_domain.
Finally, fetch rq->rd using guard(rcu)() and rcu_dereference() in print_dl_rq=
().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-3-atomlin@atomlin.com
---
 kernel/sched/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index e6a3b51..439e59b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1166,7 +1166,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl=
_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
=20
 	PU(dl_nr_running);
-	dl_bw =3D &cpu_rq(cpu)->rd->dl_bw;
+	guard(rcu)();
+	dl_bw =3D &rcu_dereference_root_domain(cpu_rq(cpu)->rd)->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
=20
