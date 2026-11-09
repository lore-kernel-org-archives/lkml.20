Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213484;
	b=grajagigTKWBFOZDrcmg6eTLTF5jiLap2IgG9NNbeO/O8MrKM5M11p82HnQ1cupmAME9
	 oL3k2mqx9S9rLhDv3PbTElLHVvLgL15dFHUW0EhqQXyw5zCRiXXU54xWUDV+zz/84wEuq
	 5lLHpqPRjDz7SVG4HgYqIojNfG09kN841/6EFRPPROWA8zCM5SAwB6F0c2oBv6+9QLJSE
	 xSl3s7SUnXqdkP7EUrx6oOOQIWrLtQaLFVF8O+ROkqbCk6boeqmBaLuzMmQeSTcfn16hP
	 w/mRO+DMvrUkghUVgLUGbA7qq8L/xag1nU9CDA1pxqzHCpU9IbCVxzCyG46yv/1uRsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213484;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=F3Z6TpWuBqYRwU3KcH3h1h3UGHYeCZKlXW/13GjYqMg=;
	b=blXCf2QN01jYiHa+Ie2Zbb6z+pmjeJb4zeyPesv4q41vxzSnstrC5XaMbysmtBMJq+ZA
	 YhLUeT0HMOBtS11yqS+z1zlVJ9hloVzJJlFdL4vi36/+VCArjoJrhc4grKGsnpY0q/uiA
	 HFSyj0pDE8tkkq3NFJ3AyicwnG+amoJCo7kISwYdl8RQyIiBfBL+7GAO6t2blt1ivYQNy
	 iEpTy7PVDT6EO/riC7SMMDnIWD//UJsJhRSxZ1SLO34Cg4/xpmIVvxSURIQqjvddqG2Q9
	 BdAOAtuZo2DaNrt0Q240FqGLW4jf8T7O8tHu1JnbmUzjFfxwPTPiLJl8Qo7jb+tO2aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SQaOOMvv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zo95r8yt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B4606A326;
	Mon,  9 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SQaOOMvv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Zo95r8yt
Date: Mon, 09 Nov 2026 08:38:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213482;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3Z6TpWuBqYRwU3KcH3h1h3UGHYeCZKlXW/13GjYqMg=;
	b=SQaOOMvvORr58xDPJtGNe3NxBiu7Bj6WrnfSCpO/WHXaCRQV2ylKMS9KR/4Tv38Mok6pt7
	9tcJmLqAL3OAtfa1rPJGZTd3c18LeQp+ZJYKtVCsckcRfU32rcncRVL8XIVVGk+902DlEK
	XUiQB+vbdVgwQp8DevAIisxCVn7TjeyXvpcF290au5eFKzrr0v4cDgjlesRRaFTD2FJTMC
	KBXjPYeFFUBIeOrFyFk+vQAUFH1GuOZLwhA8SCm/rMK3jSpQc/ATXUfPZI9nP6OilXwFOG
	+wSObMq+X8/V7K6CK3O+VNNwRYlm3aWKtNQQeIK/QfUbNHMbvW/u1dnHp/66wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213482;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3Z6TpWuBqYRwU3KcH3h1h3UGHYeCZKlXW/13GjYqMg=;
	b=Zo95r8ytU1WNBqE3TrVGz8KVbDIrbnBaiyONkPFn6lKr7jOavrQLCoG1TbYYJQcaNBcP6x
	T04BNTaKmHI4IgBA==
From: "tip-bot2 for Benjamin Segall" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf: Fix racy update of cpc->hrtimer_interval
Cc: Sashiko <sashiko-bot@kernel.org>, Ben Segall <bsegall@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <xm26se1ihlqb.fsf@google.com>
References: <xm26se1ihlqb.fsf@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421348082.2093942.3887076447341382274.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     3bbd85b2f67aff58f2cbec9a7fb705677b94473b
Gitweb:        https://git.kernel.org/tip/3bbd85b2f67aff58f2cbec9a7fb705677b9=
4473b
Author:        Benjamin Segall <bsegall@google.com>
AuthorDate:    Mon, 02 Nov 2026 15:11:56 -08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 06 Nov 2026 11:45:15 +01:00

perf: Fix racy update of cpc->hrtimer_interval

Updates to cpc->hrtimer_interval can race with reads either in the
hrtimer itself, or other calls to perf_mux_hrtimer_restart. This is not
exactly expected to be a common config change, but it's easy enough to
fix.

Since there's already an IPI to each cpu to restart the timer, and all
reads are with irqs disabled, just move the update onto the target cpu.

Fixes: 62b856397927 ("perf: Add sysfs entry to adjust multiplexing interval p=
er PMU")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Ben Segall <bsegall@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://sashiko.dev/#/patchset/xm265wykhyrv.fsf%40google.com
Link: https://patch.msgid.link/xm26se1ihlqb.fsf@google.com
---
 kernel/events/core.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f5f2261..1404dab 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1332,14 +1332,19 @@ static int perf_mux_hrtimer_restart(struct perf_cpu_p=
mu_context *cpc)
 	return 0;
 }
=20
-static int perf_mux_hrtimer_restart_ipi(void *arg)
+static __always_inline struct perf_cpu_pmu_context *this_cpc(struct pmu *pmu)
 {
-	return perf_mux_hrtimer_restart(arg);
+	return *this_cpu_ptr(pmu->cpu_pmu_context);
 }
=20
-static __always_inline struct perf_cpu_pmu_context *this_cpc(struct pmu *pmu)
+static int perf_mux_hrtimer_interval_ipi(void *arg)
 {
-	return *this_cpu_ptr(pmu->cpu_pmu_context);
+	struct pmu *pmu =3D arg;
+	struct perf_cpu_pmu_context *cpc =3D this_cpc(pmu);
+	int ms =3D pmu->hrtimer_interval_ms;
+
+	cpc->hrtimer_interval =3D ns_to_ktime(NSEC_PER_MSEC * ms);
+	return perf_mux_hrtimer_restart(cpc);
 }
=20
 void perf_pmu_disable(struct pmu *pmu)
@@ -12780,13 +12785,8 @@ perf_event_mux_interval_ms_store(struct device *dev,
=20
 	/* update all cpuctx for this PMU */
 	cpus_read_lock();
-	for_each_online_cpu(cpu) {
-		struct perf_cpu_pmu_context *cpc;
-		cpc =3D *per_cpu_ptr(pmu->cpu_pmu_context, cpu);
-		cpc->hrtimer_interval =3D ns_to_ktime(NSEC_PER_MSEC * timer);
-
-		cpu_function_call(cpu, perf_mux_hrtimer_restart_ipi, cpc);
-	}
+	for_each_online_cpu(cpu)
+		cpu_function_call(cpu, perf_mux_hrtimer_interval_ipi, pmu);
 	cpus_read_unlock();
 	mutex_unlock(&mux_interval_mutex);
=20
