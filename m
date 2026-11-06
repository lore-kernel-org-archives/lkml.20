Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958638;
	b=CCRQzmI8bdYb6gCM2ZhrUoU72pPpNoCb7+Mf7hU6hmY/Jhz07C7MM9S65+aZNEPuCI4P
	 fUYUmTtyeCMn0Fmyw0XzvUlveBrnPc7YgORv1vusG9OVcVx9CM5dQ8jAqzIe5PlzbgfsS
	 IAVeVkuL/9S2NvjYiWU2t5XU92LeLtj8X7uMDfWhVTr1gNZuO2FCtAcn3i+AtTrlToxdM
	 /x+GpIsNJUnpfue8HMFDTX5al7Igrmp9yJiTAT8SK9srQLU/Meojtil7Ep3itaxVSSz+E
	 pHpeWdjJwBqgDmWXHpjUKkonKnSHTJHARPr8ZT3aI06cpdf6qiXBbUCSTwsvtXFZ2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958638;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=WdgcK7Try9jMgvI8kpyxuwDtPtoEhYE83ht6bokzE4w=;
	b=Zr2bmyLNngXyVL2oAa60/BSNdfpcyB3mh4H/iB0lQ5JZzToaS88pWRfkdalUzB0ns/9t
	 4dk4eA3FzKIEjjB5pyeiZf6a8ZpK7r0K0y4ZtbgkenChbzy9YEz/bBN5gDWblOLNi5fDN
	 0RssG3o4eUvvpS7NRSjVjF+tZYWWqDMmuh4UW0UT5cPCv5N9NrVHL1DK6/SwkrHPBfo24
	 PEbqW9Ga8x7Ljst22QGFzUFnoFPWGRbDoIF+PbR92psO7iPjjKNdEHALE87Uvconuayj0
	 rAV7neDeW2RN2lcE8CnCIN6n3dwsgWNf+LnI3QwQINTr+IgyOIu99RhqFaLmHg/ICMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pOlGUSGj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wPkVkjZb;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F338606EE9F;
	Fri,  6 Nov 2026 09:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F338606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pOlGUSGj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wPkVkjZb
Date: Fri, 06 Nov 2026 09:50:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958636;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdgcK7Try9jMgvI8kpyxuwDtPtoEhYE83ht6bokzE4w=;
	b=pOlGUSGj3GNP0yNLe8bJQpTGbKY1BYIXzskUtIgRIqhnxY9J2MSiy7IgUt0MJwY1SDP7cb
	sVhLTd672Hv77xxL9alb7nWpgKi1V0A+2qvciuFTXqAX54TIT18gw/GsoQTVTJ6tgadKic
	qEkS3lh88bXyQPY3GYfiGgo4VI1yu014z+7NmA66nQDVlycsgX8cmDs47g+jvFR4QVAgBy
	YFGI/DV1NJ3JRmsrMW0LdQG60ewrTV525W7Dsi69M2nz4I7DYNwraUrpmAkTWzbLpC/imm
	g2anm85Y3A6nP4mR0lWsA64V43dowa2hWwFCcyKoAWeui+/MP8N+NmgSpWruaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958636;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdgcK7Try9jMgvI8kpyxuwDtPtoEhYE83ht6bokzE4w=;
	b=wPkVkjZbf/vrWn4aBjEfq63D+VdjI5HV19paqKnqL17Ob7YtvODqG+un3dfTepY0WJWD2C
	iUPzc3+AKtkXSCCg==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/topology: Balance cluster static-key updates
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021043834.1140951-1-sh_def@163.com>
References: <20261021043834.1140951-1-sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395863508.1009794.5632256681899581681.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     5ebdfe12ab96368d0339593129d4ce0bc2bd06f5
Gitweb:        https://git.kernel.org/tip/5ebdfe12ab96368d0339593129d4ce0bc2b=
d06f5
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Wed, 21 Oct 2026 13:38:34 +09:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:04:57 +01:00

sched/topology: Balance cluster static-key updates

build_sched_domains() increments sched_cluster_active once per newly
built partition that contains an SD_CLUSTER domain.
detach_destroy_domains() instead tested the global static key before
decrementing it, so destroying a cluster-less partition could drop a
reference owned by another partition and disable cluster-aware
scheduling while SD_CLUSTER domains remained installed.

Check the installed domains before detaching them, only while the key is
enabled, and decrement only when the removed partition contains an
SD_CLUSTER domain.

With two cluster-bearing partitions installed, removing a singleton
partition left the baseline count at 1 where 2 partitions still
carried SD_CLUSTER; the fixed kernel correctly reports 2.  On an
asymmetric cluster topology where the parent partition gains no
cluster domain, the baseline count drops to 0 while a cluster
partition remains installed; the fixed kernel keeps it at 1.

Fixes: 8881e1639f1f ("sched/fair: Scan cluster before scanning LLC in wake-up=
 path")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://patch.msgid.link/20261021043834.1140951-1-sh_def@163.com
---
 kernel/sched/topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb..9d3a1b8 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3332,13 +3332,25 @@ int __init sched_init_domains(const struct cpumask *c=
pu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu =3D cpumask_any(cpu_map);
+	bool has_cluster =3D false;
 	int i;
=20
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
=20
-	if (static_branch_unlikely(&sched_cluster_active))
-		static_branch_dec_cpuslocked(&sched_cluster_active);
+	if (static_branch_unlikely(&sched_cluster_active)) {
+		rcu_read_lock();
+		for_each_cpu(i, cpu_map) {
+			if (lowest_flag_domain(i, SD_CLUSTER)) {
+				has_cluster =3D true;
+				break;
+			}
+		}
+		rcu_read_unlock();
+
+		if (has_cluster)
+			static_branch_dec_cpuslocked(&sched_cluster_active);
+	}
=20
 	rcu_read_lock();
 	for_each_cpu(i, cpu_map)
