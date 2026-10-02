Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076247D475;
	Fri,  2 Oct 2026 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933598; cv=none; b=Bns94o3SmB/4kF2uwpvFpINHo8X63H+7GcaVNAi41hfxfw81tMunP8zg1y7nV6r+YYAEuYet5l+/WGpU06OzR8facKzFLsgYfGoaw0NBVJYxsHM1HrtbZ5LZ/FwfZHxNwCdWWdr6zRPxxx05QBHvb54XePRENE9Tlxm5t4FU8mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933598; c=relaxed/simple;
	bh=hnig/fvUI3egSOvGD4GI304REuWWXKt7W8AmRsnlsA4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=lNF/fbVIwpKvXTR1O0vKWpb3xZ8uz3K+Nl33Khc2/6rthaPYDA1Lb/wZw6Gg3RrEtixuAHEouHfpgBS349hAR5B+H5EalX1MqJ8IjrtYkMa4HDsWLzwuU4FTtaxKGaxxoSZO1SlxW+aHiE8wlUMoQiSr9bmaqiP8n3thIh9y56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z4sKRNUO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P5DOLhaS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z4sKRNUO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P5DOLhaS"
Date: Fri, 02 Oct 2026 09:33:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933595;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlhKuNWc04oMYEAjK+/GktV1gs6BPz+3fkYluCi9HA0=;
	b=z4sKRNUOk9vsLo6lyY131PfeNZpS+lNducYLt/LCy0Bth+GnNDXuEuXoybMCrjGS8tqShA
	iitaPe7DgkCGrJeeRn1euqghVsOD1g3i4X/mSKaKjq8NT/w4QvDSbM2JMYhsMNW2JAZFAc
	Ss15eEZF5ACn7SFPbXcmRLdeHUug9EtLe83QjqhSQ+w7hnKs4Nw67W0NBpUWPya5qcW7bu
	x2z7ENXFDw2xXCezcBgEjSzJ26+4WnBLSmYtiaDqo7rDNK8DH9Z1zahWaLLcNumm0ofVqO
	jnlVeuQjfvFiMO5Xw3JWfk/dTknAQ08M3fbFL+ay6BWaUGY6IzDw4xqopTYBUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933595;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlhKuNWc04oMYEAjK+/GktV1gs6BPz+3fkYluCi9HA0=;
	b=P5DOLhaSURcOwPxpYid++X0+0wdco2N0E7v4bm+2lXk7PHbUBOhhClzDKqJ2uIihJDY8SB
	57wCDCwkHt3aGUAA==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/topology: Add asymmetric SMT packing override
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Breno Leitao <leitao@debian.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929165538.726616-3-arighi@nvidia.com>
References: <20260929165538.726616-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359395.3910103.17589323839775671715.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     648d44bda7314ffb5805f2bea8910b4cdccaecd0
Gitweb:        https://git.kernel.org/tip/648d44bda7314ffb5805f2bea8910b4cdcc=
aecd0
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 29 Sep 2026 18:54:41 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:35 +02:00

sched/topology: Add asymmetric SMT packing override

Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
at the SMT scheduling domain. Some systems benefit from this policy, but
their firmware cannot describe the preference and inferring it from the
CPU model would embed a platform-specific policy in the kernel.

Add sched_smt_asym_packing=3Don boot option to force SD_ASYM_PACKING at
the SMT level. Omitting the option preserves the topology provided by
the architecture or firmware.

Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
also covers architectures with custom SMT topology callbacks, including
powerpc.

When enabled, priority remains defined by arch_asym_cpu_priority(). The
weak default prefers lower-numbered logical CPUs, while architecture
overrides remain authoritative. Siblings with equal priorities remain
unordered. In particular, x86 with CONFIG_SCHED_MC_PRIO normally gives
both SMT siblings the same core priority, so enabling the option there
does not prioritize a sibling.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Breno Leitao <leitao@debian.org>
Link: https://patch.msgid.link/20260929165538.726616-3-arighi@nvidia.com
---
 Documentation/admin-guide/kernel-parameters.txt | 12 +++++++++++-
 kernel/sched/topology.c                         | 18 ++++++++++++++++-
 2 files changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/=
admin-guide/kernel-parameters.txt
index 68647ff..8f53d66 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6836,6 +6836,18 @@ Kernel parameters
 			solution to mutex-based priority inversion.
 			Format: <bool>
=20
+	sched_smt_asym_packing=3D [KNL,SMP]
+			Format: on
+			Force asymmetric packing at the SMT scheduling domain.
+			Idle CPU selection prefers siblings with a higher
+			arch_asym_cpu_priority(). The default implementation
+			prefers lower-numbered logical CPUs, but architecture
+			overrides remain authoritative. Equal priorities do
+			not establish a sibling preference. For example, x86
+			with CONFIG_SCHED_MC_PRIO normally assigns the same
+			core priority to both SMT siblings, so this option
+			does not favor either sibling.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
=20
 	schedstats=3D	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227..dd2b1d7 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -32,6 +32,20 @@ static int __init sched_debug_setup(char *str)
 }
 early_param("sched_verbose", sched_debug_setup);
=20
+#ifdef CONFIG_SCHED_SMT
+static bool sched_smt_asym_packing __read_mostly;
+
+static int __init setup_sched_smt_asym_packing(char *str)
+{
+	if (strcmp(str, "on"))
+		return 0;
+
+	sched_smt_asym_packing =3D true;
+	return 1;
+}
+__setup("sched_smt_asym_packing=3D", setup_sched_smt_asym_packing);
+#endif
+
 static inline bool sched_debug(void)
 {
 	return sched_debug_verbose;
@@ -1950,6 +1964,10 @@ sd_init(struct sched_domain_topology_level *tl,
 	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
 		      "wrong sd_flags in topology description\n"))
 		sd_flags &=3D TOPOLOGY_SD_FLAGS;
+#ifdef CONFIG_SCHED_SMT
+	if (sched_smt_asym_packing && (sd_flags & SD_SHARE_CPUCAPACITY))
+		sd_flags |=3D SD_ASYM_PACKING;
+#endif
 	sd_flags |=3D asym_cpu_capacity_classify(sd_span, cpu_map);
=20
 	*sd =3D (struct sched_domain){
