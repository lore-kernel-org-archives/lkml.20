Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4674BA1EF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270997; cv=none; b=YS96ksf16H0tbfQ6gaR3eCex9/NQuGocXQj8IyLxWrHxNl1yisK0gWPK9NeFw9Rfi6BBZG29puX+14ZkvY4HVdyLUSUurijpW8UbeYo+69wjONcHUH++feHXEunlsQ5qH8ula9ol2lwB5hQEzlVihlbzfnU8id8hc+l7Ar51QWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270997; c=relaxed/simple;
	bh=nnUUo2nDrt4wu97RgkFtWXJy9n8reFZKLjMwmibE8s8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nHDqiO6onVH1IDEmj1rp9EngUgGcCm9q5EVjEtwoC8bAY3y+GoGedj8tHm5RgaPztHobYK9P6B9+GZhjmMlkKicWo4aBHNANRWm9auA28Ax2xH34JlcyuBcgnGSqa5PvL9A01YUBEJGH6F2WTxiX9OV2g0MZBJitysO1qLgg9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=enjakVuv; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="enjakVuv"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so197088b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270992; x=1790875792; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/mgSrJpw3YOisDXCB5xsNmyqp3J9irft+yFn98nNFU=;
        b=enjakVuvME8xVU1Q7Xxex8qtvPu5IofJvZQ2bMtODvalydublbJ46CTRu0uiME0Qte
         Ioj6OF0d8Wy04gX5BlzlhJeOCVVvxtRB3huRkwGV5KqNXxx+I7S6+F73LjfTpKe234YS
         DBHLXdKe5qzm8f9H0+VSSju2/PIl4vvQiiSSfHCpW2yDAGeNo1kG02goCQWmgwKuHH+l
         KkB7Elj5542vyW7dpUnz4YrH2Hk0OvV6dUSOqQqrNr08zkgfOaIz56ezxkuZ2F+asv3I
         6SNVIjAnANBv2RiGypy9bLdmkvx08NmDMzcJL3lEs2FAIVVafzGwcgM5vpzfIsKTIOYr
         Uj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270992; x=1790875792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/mgSrJpw3YOisDXCB5xsNmyqp3J9irft+yFn98nNFU=;
        b=nv/K0u2rF2lVEsHOCIZfA5ZdRdz0RRJo3xlcLrnjbJG4fn7RZ6YRYZYbOXMtVagklo
         VgEPJIRbsAgx1gvqhrw5fMmky+R/HXNWGaVYIcxeyXhys8LkM6LpYwuTCBaHxyXqTJh6
         PIy9dXWbUuEubP6Gw8TXC+ZIz+2sxtVrW1K9IVSoWfCBi6M16aj2XGKQtrupuGcGtRsy
         CgIIUjfDtW/S5J1iik6hoGsrVQ9TK2xnyqIsKQ4+GP1JrTAMvA0kTHyJmBvUPOA+CShk
         N7Xt5ZvdTxBa0bAZHf6EXMFG0IGXU7+8JYmCTktKHA4lHv99jWX3ucXDCVREt+wF1nAP
         72wQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2/gYGOG1PujE32hkDOoiy7gfoYnp4dNsjyjuBxRUhQdoZG1rtUc7SO1pFiTPv1B4C6S0PLEVpBLHJEoc=@vger.kernel.org
X-Gm-Message-State: AFuF++kE//K3ztjGLp6d75Km42kbNW+E25u0KgEikmau6AoTbKkb3050
	lAuTAh6hMkroJBgJGXeXkQ6p16DpSBEDcLjZaV85nBhXvDSMVnd/3GlzRzUKjoetxlppYrp/SY4
	mGsEfptODXkqWk1gWgr1xKnOB0g==
X-Received: from jahf8.prod.google.com ([2002:a05:6638:8a48:b0:5f3:a70c:f5ab])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1921:b0:4d5:291b:b84f with SMTP id 5614622812f47-4d72ef591admr3194424b6e.53.1790270991307;
 Thu, 24 Sep 2026 10:29:51 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:20 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-15-coltonlewis@google.com>
Subject: [PATCH v9 14/22] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

To modify PMU guest counter reservations dynamically, the per-CPU
available counter mask must be updated while host perf events are
temporarily scheduled out.

Introduce perf_pmu_resched_update() to update PMU state while holding
cpuctx->ctx.lock in between scheduling perf events out and scheduling
them back in. It accepts a callback invoked between ctx_sched_out() and
perf_event_sched_in(), accomplishing atomic counter mask updates with
minimal perf API expansion.

Refactor ctx_resched() into __ctx_resched() to invoke the callback at
the appropriate point.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 31 ++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5842552294c19..32e3c0d365963 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1242,6 +1242,9 @@ extern int perf_event_task_disable(void);
 extern int perf_event_task_enable(void);
 
 extern void perf_pmu_resched(struct pmu *pmu);
+extern void perf_pmu_resched_update(struct pmu *pmu,
+				    void (*update)(struct pmu *, void *),
+				    void *data);
 
 extern int perf_event_refresh(struct perf_event *event, int refresh);
 extern void perf_event_update_userpage(struct perf_event *event);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index db7b76d6b68aa..06d1128d194fa 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2991,9 +2991,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
-static void ctx_resched(struct perf_cpu_context *cpuctx,
-			struct perf_event_context *task_ctx,
-			struct pmu *pmu, enum event_type_t event_type)
+static void __ctx_resched(struct perf_cpu_context *cpuctx,
+			  struct perf_event_context *task_ctx,
+			  struct pmu *pmu, enum event_type_t event_type,
+			  void (*update)(struct pmu *, void *), void *data)
 {
 	bool cpu_event = !!(event_type & EVENT_CPU);
 	struct perf_event_pmu_context *epc;
@@ -3029,6 +3030,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3040,6 +3044,27 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	}
 }
 
+static void ctx_resched(struct perf_cpu_context *cpuctx,
+			struct perf_event_context *task_ctx,
+			struct pmu *pmu, enum event_type_t event_type)
+{
+	__ctx_resched(cpuctx, task_ctx, pmu, event_type, NULL, NULL);
+}
+
+void perf_pmu_resched_update(struct pmu *pmu, void (*update)(struct pmu *, void *), void *data)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+	struct perf_event_context *task_ctx = cpuctx->task_ctx;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL|EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.56.0.rc1.310.g51773c2048-goog

