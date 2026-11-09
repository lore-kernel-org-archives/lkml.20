Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213844;
	b=olP8hgorL7O2WhO4FO35tspPhFe9Q6ekts5ov7guDS+Q0aWXHqG7R2CaAzC+iZn1NrLN
	 JIdsNFtODctB0DOJrkc0qaivRKJaQJYmAYKITjngHH04ZhKKguLYlQcV+T965XXCXGcbt
	 4Kv3sqdzZXqw7wQEHl6Ogi9pzaDWif+4XybxSXCXcYXFw40T+nQYanfAxm+N3Gy65KQ0S
	 YnMslu/5LA0NTrXsfFslGr4tw0QmW1rQV2Ykv1jnebbgF0Z94jGv0gh2vKHQiWDEiK+BG
	 V9VXEOguy2OE9RD6oDIgwI7mYHexDhfiYcxGN9FZVVgpT4JsLhR+qOYd+3T+Y1EM3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213844;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=82PkIr9oWh+9WEvQCbRpd/yKOBCqCdVoFSxvqu/3IqQ=;
	b=UaSbUwZeJiGDCuA81l4HcgFMQuLXTA8oenzXPonnpPVIkmNpeLh5mILh4tPa4aL196yI
	 L0RXbd1anragSO+kj7xAFOPJ3r0sJPB4yJmsVvgGPD2P16vk36aH+XJUPthTZDZwHZz13
	 W0vCEf8ihW439vNx3k78aKMM7d402yj9iq/JX+t3SarVQI7EO+1BYJ4RS0rh4G3DQrgcm
	 q/j4Zfv2A213tqTANf2tgUY9MrUJRCJdz5wnZ9/Bivhh7ueXhZelCpWJgHX7mlAABUOsr
	 o+DToHD9mpd+P2ubtLucCbYDD+jxm5rMltpq1GlNcZwVkfnT8bI8/oTdYyaMt/OUbtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EvxTS9k0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3VoO1AHa;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A3606EE96;
	Mon,  9 Nov 2026 08:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5A3606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EvxTS9k0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3VoO1AHa
Date: Mon, 09 Nov 2026 08:44:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213842;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82PkIr9oWh+9WEvQCbRpd/yKOBCqCdVoFSxvqu/3IqQ=;
	b=EvxTS9k0/TXKKW+ZS9VGUysNKO/84IWJsNzQ9cybyHjuK7bYjY2h3sZy0RPqkdgwpmNEGB
	BF+cEYqr31X68c1c3Lqa57OyIaApvDAUwWXfXsX6J/leE2mctx2JHzA3Fuov78XzVqYCIE
	X4FTYkqD6KDDl1Ug5gbwMMREsFzjrK6XAH+7PR/AuLdcdJTSuBNfSTUaWD/kySzRxbZ6uR
	Z2OEMuVgOdtRXve3YQS50XkO5mBZ8j9SNnqpcpUmA/S+MaIag03JmDqH+6jhim+5ZyeR+E
	mdhZjSZqF705/Pmm86CK5Awuvq8rTBNZUBki2Pgr7N9/yBszdFzK7qkMAvhpMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213842;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82PkIr9oWh+9WEvQCbRpd/yKOBCqCdVoFSxvqu/3IqQ=;
	b=3VoO1AHamJyQ+P+kpSRkIFBnNtE94OQlpujA3u93C38Tn1jVZWBUZVy6q4lb/yFs/MGHjT
	DCZuEVk+H43EszAw==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Protect lockless rq->rd access in
 print_dl_rq()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
Message-ID: <179421384104.2093942.980541513220914052.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     340928ba43ca1a57eb9ae5b2a301cc0ef44cfd47
Gitweb:        https://git.kernel.org/tip/340928ba43ca1a57eb9ae5b2a301cc0ef44=
cfd47
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:03 -04:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:57 +01:00

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

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
