Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841649;
	b=M/YDRGDl1FBdeusm+kKynSaQ1IQ7t/IKjGRYNjjdy2SCFu8aWioZnEu+9qjapwCg/RWM
	 wAkAxQuYbog1bvgB1u2lmbA1K4mh9epYyR3Oy8YKCFVmbLP1F05+mbezcwKcVfCCcffmT
	 m9vPbYF0SyBviOcGktj0hQhKciOUzoS+KsWbi58KLamPon4x4ZHgoEjoxpJGRzG26KBEp
	 HNwHaKugzhnKxUdXuXhJrqtTdg6VAEcbDspD/TTIVEYspUYrhqwGkbrLcBw1i4pbugew8
	 Os9xctrLgqaYQd2ksSVm5JMr/tBut17V3PVl65oTdZfU0W674Xuk6kueC1XxKS9ck/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841649;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=JQrf5hea7mv5gjlexaj6fvZlR+Uj9ye/hSYIgADZYkY=;
	b=yGkfKP7tom12vD47EAjIuyZlf8XlFFcC4CzSWVgwsSHf3R8ljU/R+OIqtRVCQcXpNSaL
	 0sDklCyEpIC2pc4hV1rFnXevM/qJp6AZ/foBO0bH/Sqidayw7dnMVyk/w6stfBZP8JtVH
	 AZygVu/ebMxvD8h9NKGFnfn/tb3lB4OCYhZRaVntgzE0spotK+TSDJlOdvhHt/3FBjMuG
	 4I/ya6valCeQgAQ1nea1N6qePbylWMqs/6z/EfqkGvmIzycZnIj90qzxbwNUDWmVReVIz
	 d1PxXNUJGdGCz/jahySEVawr488cxFGuHCXJVqBLQJW6MyiOBDuzH9wcp4cBRUNaJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=d4kWojzW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2r0ShDFQ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4726D606A31A;
	Sat, 24 Oct 2026 11:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4726D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=d4kWojzW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2r0ShDFQ
Date: Sat, 24 Oct 2026 11:34:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792841646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=JQrf5hea7mv5gjlexaj6fvZlR+Uj9ye/hSYIgADZYkY=;
	b=d4kWojzWyuscCHCFIAfF3X+9/ezG9MAyrUdNVAO0iMwy5oot55JMVTv0Ddwu5kDzmHOLBv
	n91AyaEe0GBtmd4dwJ4eX5Q10Kaxw08nHSnWpqwp5eIgAOt+uaZvl4n708DsQjuLWA5+KA
	D2V+4fMRgCJR+29zPRGa2fzjkrbLHiq30IzMupujc0oCI5vymrD6QgHHLpkqSI8FWOXSRg
	uD14FOUDBDOLXZr2ZjjIow4fPSlSust1XVMooWYTLR59jEqYEA9kYFLfSrDX++C9xyB/CB
	OFKDqme9GU+QJAFZWq4kkWFiUsU36MqvpgY8Dn38b/CtN6V3Km29cPoImDUG3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792841646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=JQrf5hea7mv5gjlexaj6fvZlR+Uj9ye/hSYIgADZYkY=;
	b=2r0ShDFQTM4psNLgthvcah+q2SGYnUp8mOhmZHWSd507j2fD7WAwjru4ebSs/erimuGr9d
	kVpIC3OAjurhSmDA==
From: "tip-bot2 for Lee Jia Jie" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Fix UAF in attach_task_ctx_data()
Cc: Lee Jia Jie <mkofdwu@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179284164527.4109677.4201624416478371364.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     64ea0e8226ed98d14e0231af1beae10c3d5c043a
Gitweb:        https://git.kernel.org/tip/64ea0e8226ed98d14e0231af1beae10c3d5=
c043a
Author:        Lee Jia Jie <mkofdwu@gmail.com>
AuthorDate:    Thu, 22 Oct 2026 20:58:48 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 23 Oct 2026 19:09:52 +02:00

perf: Fix UAF in attach_task_ctx_data()

struct perf_ctx_data is RCU protected. In attach_task_ctx_data(),
the cmpxchg retry loop runs without holding rcu_read_lock(). If
task->perf_ctx_data already holds a pointer (call it `cd1`), then
try_cmpxchg(&task->perf_ctx_data, &old, cd) fails and loads old =3D cd1.
A concurrent thread running detach_task_ctx_data() could free cd1
leading to UAF and further memory corruption when cd1 is reclaimed by
another thread.

  CPU 0: attach_task_ctx_data()     CPU 1: detach_task_ctx_data()
  -----------------------------     -----------------------------
  try_cmpxchg(&task->perf_ctx_data,
              &old, cd2)
    -> fails; loads old =3D cd1

                                    refcount_dec_and_test(&cd1->refcount)
                                    try_cmpxchg(&task->perf_ctx_data,
                                                &cd1, NULL)
                                    perf_free_ctx_data_rcu(cd1)
                                    [ RCU grace period -> kfree(cd1) ]

  refcount_inc_not_zero(&old->refcount)
    -> UAF on freed cd1

Fix this by taking rcu_read_lock across the race window.

Fixes: 506e64e710ff ("perf: attach/detach PMU specific data")
Signed-off-by: Lee Jia Jie <mkofdwu@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index a9ee911..e248f34 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5434,6 +5434,9 @@ attach_task_ctx_data(struct task_struct *task, struct k=
mem_cache *ctx_cache,
 		return -ENOMEM;
=20
 	for (;;) {
+		/* Protect @old until inc_not_zero(&old->refcount) */
+		guard(rcu)();
+
 		if (try_cmpxchg(&task->perf_ctx_data, &old, cd)) {
 			if (old)
 				perf_free_ctx_data_rcu(old);
