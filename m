Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225111;
	b=JTOcfirhfxk2hZ8gNC/55mBw6vPR3ShocIaOZhetdQrnZCdJe4kWtXnkKOgSss0OZT1M
	 goqBLVB/UXQvhyN7Px/iF602yRAQTinZSTLLk1wD7uDy3Myd2Iks/g8aZa5M1d/otd0Ec
	 MgbCs8BXMgyeDfbuxWmrQVuV1i982Sgxk/5dHJo+AWvazxHCz+f04XboeKiT+itnNtFTj
	 tRNz6Yq86S2Cn5A4s9pTRLEFAnsCy7akHRTRhFQQX26p7ZDK/c1ZmVagDsxTa5iAryVd4
	 KOj3Wwodm/oVB2e4aQtmv0QV9A4KjFe2rS8rCuhu5XPMF7qSNEfkc7+QotmcGF1FFKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225111;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=1UPevI7WKuScXsMZT7gDPXjOAAzdjjcPuo0MhA49GNo=;
	b=uLe9t8LkRJeiXO06u2pgyhWtVRi88owzKLtqyt/H4A6oTQuZq8BHzwkdivY51H4czamT
	 /8FhCBzA5/r6elHcmHWfAnLbFlI9gw3gxWFJd7BOLHjcedSATTxmeV2yEKjWr1MVYJNpN
	 y3fpPmOSqiZT/UDHGqvL43zWt0Ot1aYXpHrH+tn1TXT4jNDmjqBmo/1ZWlU6NoiPkCd+s
	 nt+mnQjjMayY8MXWX0Sb77WtaCUBfdWRrILypilckAjRFKeiBJO7Ti/lZ439Z/ZRvw26R
	 gtxSvWeKt0mEAjm9s3ImV5Y6uEEruubfjQozm0wEoSjRE1TsugjWUOWD0DtRR/y1rdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UGivb5T+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BU6Qk321;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8E606A31C;
	Mon,  9 Nov 2026 11:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UGivb5T+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BU6Qk321
Date: Mon, 09 Nov 2026 11:51:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794225108;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UPevI7WKuScXsMZT7gDPXjOAAzdjjcPuo0MhA49GNo=;
	b=UGivb5T+plAcq9J0k81DRc3EZnbPTOgwYXo1syRLn9leJ2h73fviXfvN458Hyzb110mDtg
	xgE0uLkmBPWpvbgAuVWCG3+KpabARltkZ5Cx/LAgNImMnmUB24DeNZ99tRdrwTOLwvotCs
	2RQ6e2OhdAPJWS5Wpc3/AtvMQEgKjedZyjd1sBfC19pwyA8pNgPyBAtpRxItXz6dsZHtvd
	Yi68k/M458MR+X4dw7IDc13rhurZJ9aQI93dYihA/oWdJ36ucevGnu+aOsEXXBXDgKFH8F
	VzgkI4W0INi4iJLwWs8kBXZiBvLMf6opP6GQ/ECtJjIO0t2oOQvv5ymnQ91jOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794225108;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UPevI7WKuScXsMZT7gDPXjOAAzdjjcPuo0MhA49GNo=;
	b=BU6Qk3218ZSEDJ+gAMwDJuWZGfWSPFyC3+TXIBvsx134nOeJeBXfj1IFaZVcAVLy0dousg
	s7fH21UESEtms4Ag==
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
Message-ID: <179422510657.2093942.3742262954322150670.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
Gitweb:        https://git.kernel.org/tip/d7e670601af6c564ccf6d3b2ddf70ee4f41=
a6d1c
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:03 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 12:39:08 +01:00

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
index ab6ff91..ac4971c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1176,7 +1176,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl=
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
