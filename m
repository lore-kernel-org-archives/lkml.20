Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213490;
	b=k2241IkYu+hUrMJnyKWtTTeSxXa1Fpd347899LMHeRUPwK+EYSGvT4WOm7TVTQELXRnU
	 /kG648HVYVsCqVoQPOxA7ZZqk6FotQuajjivKLJdm93kwb7Dd3DXlu9obHXsjGr0jlyPf
	 lL0gAIRsBr6NFf1HyLKWmS5W9nTDOUufnZMRr4gnmXj0dSslHagK0qZA7r4808gx9CjXn
	 rNaJZJsHkCrcH6SN3FHnHHKkY6SGaOBVPOhHzsCEVm7fnTj1Uiw5GN55vl4z23NG/zrwP
	 MyiTp6OJnyJEomAsnD4LEc7ATqnul6Wl9RmSjwwSQxo/OfZ0lUbnPz6c4QI8oazrggQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213490;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=BjaJwLCkQ95q5rSSTUFAQ1UcXeN0oPV5wJxscGLCUkw=;
	b=MWCgBCDsO55WVI9rFuRdxXYE3xlADYSdZvLMLDYhUTnqETU2Ujw17MDERzaXjv7m9OrN
	 cpLwjr+DSoEr+0ACXkssVXuM4vKmb2wOjWu2nMYrZQau9waJoZz+/3Gdfq1gMTgrWaLsS
	 HDHOYnYOGKQnmlpTR874XQgSHxw4627qXKtEHjaCTxaW3PodADoXkNSEqfwG5uqY1ANVh
	 v/xE0tvKQwcYsnaVtzKolOJx35FiOf5IK+uNfg3M+QULLuXZRu8tlMejtA/KlQsZJhz0N
	 tsCc4zUVXqpkr5ZBI5WsWZKVrKHSyspx/Dj3xEAxpqw4OoWnPNSvbknEqkilvdX1B5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aG4eU5zE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hWPgG1NR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF63606EEA1;
	Mon,  9 Nov 2026 08:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF63606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aG4eU5zE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hWPgG1NR
Date: Mon, 09 Nov 2026 08:38:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjaJwLCkQ95q5rSSTUFAQ1UcXeN0oPV5wJxscGLCUkw=;
	b=aG4eU5zE5wLeeHzNFRiTOzAnJgbb1SmCUtOJZ2A44Tg/ABQgmOWpaAgquy7Y/rbMnex2JW
	AqT8+ss1M4ur4QgGdQXYvliKcY3eDshgfDObS7mTNp8LOWq9+UtLBXTf+ScFvSuMzdnW/T
	0La8dKB6mfxOuVpin6G9UdnAomHz6oqo5FTI9HwIE0kd90K3ZwEAq41QemGz548TIETf2M
	Lh5rZSyCIccp/g6lG6NizflPuxWYeDLNhSgwx1hpmGqj7wgsCvQwuhVxnYSpkd7VuooV/a
	QxPDFYsd8SKYQSVu5qMRIw2GuTruSci1I6skr0PsX8pTScCiZm/+9QPtk3L+4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjaJwLCkQ95q5rSSTUFAQ1UcXeN0oPV5wJxscGLCUkw=;
	b=hWPgG1NRLZ0R4MeupF0AAnK1JwUTzfD/00Y1BzojClueqTt54MOg2SoGt/Zu+Texq6Kzdv
	hCaM0hkc+fD8rZDQ==
From: "tip-bot2 for Sandipan Das" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/amd/uncore: Avoid context migration from
 non-owners
Cc: Sandipan Das <sandipan.das@amd.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C273135a6d33a40f442fb18e140a90689fae7cd32=2E1793614?=
 =?utf-8?q?726=2Egit=2Esandipan=2Edas=40amd=2Ecom=3E?=
References: =?utf-8?q?=3C273135a6d33a40f442fb18e140a90689fae7cd32=2E17936147?=
 =?utf-8?q?26=2Egit=2Esandipan=2Edas=40amd=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421348625.2093942.1738357521686092965.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     0ae655bce1934857fa3e316ddcb4be38c30dbd38
Gitweb:        https://git.kernel.org/tip/0ae655bce1934857fa3e316ddcb4be38c30=
dbd38
Author:        Sandipan Das <sandipan.das@amd.com>
AuthorDate:    Mon, 02 Nov 2026 15:52:07 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 06 Nov 2026 11:45:14 +01:00

perf/x86/amd/uncore: Avoid context migration from non-owners

Each uncore context is owned by a single CPU that hosts all events for
the corresponding uncore domain and is advertised through the sysfs
cpumask attribute. When a CPU goes offline, the context is migrated to
an online sibling if the departing CPU is the owner.

Before commit d6389d3ccc13 ("perf/x86/amd/uncore: Refactor uncore
management"), uncore_down_prepare() checked whether the CPU going
offline owned the context. The check was lost when the function was
replaced by amd_uncore_ctx_move(). Hence, when a CPU that is not the
owner goes offline, ownership is always handed over to the first online
sibling in the uncore domain irrespective of whether another sibling
already owns it. This goes unnoticed as long as the owner is the
lowest-numbered online CPU in the domain, since the first online
sibling is then the owner itself. Once ownership has moved, that no
longer holds.

For example, consider an L3 domain spanning CPUs 8-15,136-143 and owned
by CPU 8.

  $ cat /sys/bus/event_source/devices/amd_l3/cpumask
  0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120

  $ echo 0 | sudo tee /sys/devices/system/cpu/cpu8/online
  $ cat /sys/bus/event_source/devices/amd_l3/cpumask
  0,9,16,24,32,40,48,56,64,72,80,88,96,104,112,120

  $ echo 1 | sudo tee /sys/devices/system/cpu/cpu8/online
  $ cat /sys/bus/event_source/devices/amd_l3/cpumask
  0,9,16,24,32,40,48,56,64,72,80,88,96,104,112,120

  $ echo 0 | sudo tee /sys/devices/system/cpu/cpu10/online
  $ cat /sys/bus/event_source/devices/amd_l3/cpumask
  0,8-9,16,24,32,40,48,56,64,72,80,88,96,104,112,120

Offlining CPU 8 correctly moves ownership to CPU 9 and onlining it
again leaves CPU 9 as the owner. However, offlining CPU 10 then makes
CPU 8 the owner while existing events remain on CPU 9. Both CPUs are
now advertised for the same domain, so tools that open an event on
every CPU in the cpumask count the domain twice, and the context gets
modified from two CPUs without any synchronization.

Restore the ownership check that was lost during the refactor.

Fixes: d6389d3ccc13 ("perf/x86/amd/uncore: Refactor uncore management")
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/273135a6d33a40f442fb18e140a90689fae7cd32.17936=
14726.git.sandipan.das@amd.com
---
 arch/x86/events/amd/uncore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 7aa5a5b..c307323 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -595,7 +595,7 @@ static void amd_uncore_ctx_move(struct amd_uncore *uncore=
, unsigned int cpu)
 	for (i =3D 0; i < uncore->num_pmus; i++) {
 		pmu =3D &uncore->pmus[i];
 		curr =3D *per_cpu_ptr(pmu->ctx, cpu);
-		if (!curr)
+		if (!curr || curr->cpu !=3D cpu)
 			continue;
=20
 		/* Migrate to a shared sibling if possible */
