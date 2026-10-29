Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316537;
	b=3oCVuH+TdMzLEEGLRkdmm4B3HFyI+VB1ozxb3IoP4wH5M03lOxGzJOMk4MtYjtRcpu2G
	 Xeyijv3zP0PS0F9EjfjSNE14NCCZeG6njlW/t8yIMoT74nsoeEnZXMlnf0sILqIRHx1C2
	 zD5XOGKZh+hOE+kCNegpdgR2+meR9bBqNjHLkoNlNM2sBERfz/8nP0HsCh4o7NKYdKx6t
	 5f4+3aDDOj0f65KPibS1norl4SrN9/dp3js6YoOwkAaHZMyjL22NM1QUBISUN2yJ1Tlqq
	 OXk9OlMBBVDhxXKiyy1Ge8iOBQIWzLnh9h/2BdcwQqvQ1LVATKAaNxD9bME4HgMwm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:User-Agent:MIME-Version:
	 Content-Type;
	bh=5h2QYAUToJaBGd0SGBHbFjbHZlMRwFbs4A1MHWtxF2o=;
	b=u3sRlfu6N68XaEHbs6Xv2rrpLxMNXSL0stIJp703sUla0O1Fqw0YC0Ck25czWPClCPCI
	 aKkTYmnhuhQdxH9kuLDv7CYoQmI//I9XVeXS3qFSKcoNtsAFVdcoHZlu1xIl7STK4Gh+H
	 VUjjuSyXUP5vo+JmJOGKiEZ6vPuYP/28lmuq49F+0mhhtVppjpKULH4i96cdroSx/ty+y
	 nMOLHffm3Lc2Ck2g29FSu4fYRQjCIJqPXCLfaK3sUwox6d5K+MB/QT1N3EKNr51+FldZy
	 pGl5leoqZ/erNpvH56zNSDX1MpAqGpeLQPnDlRH/UQNrv3qrZLWfsEBGNXmnhZbsQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YOgm8mcb;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FE60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82FE60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YOgm8mcb
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so137695c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793316536; x=1793921336; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5h2QYAUToJaBGd0SGBHbFjbHZlMRwFbs4A1MHWtxF2o=;
        b=YOgm8mcbczfA7htknXvada6PreAPrkYysyTyxZIjC0VGtZBE8sM2qbalP55zVF52zF
         Je7HazYD9Hm80fZzmMbfwmSxVHCginJPN6PzK7/X3WWrl7aC37ytFd6b0iy/wRRXNi94
         tYw3fN9Mh51WgGDhAy5EWVUTfBx7oOi9Qhe/oQicWugzmsaAFKccgq1AxeOwuk9U3O7a
         xmlHbSAowdwzgS/0s1t8uQgi/w+3Akx0vPOf3IIRwp7lfXgY5sYmarSaa43wpJVasINm
         t23ZH/X+/xsvCrOv4+ctvnCT5vt+FWvsBwhyOCmT/qfgq+uShGXAJhYdjrpTG4r90V9Y
         sR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316536; x=1793921336;
        h=content-type:mime-version:user-agent:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5h2QYAUToJaBGd0SGBHbFjbHZlMRwFbs4A1MHWtxF2o=;
        b=lQeymCl7k45+we8sIIbdlc857nqh45cmKUCn6n1Qa1ziVg5LyUOGBVBMRUBWtCdCEz
         X1o1jjfY8FFgH5BGrS4/CuyATlbvYPargGntbH4OBMnqmurXUPUX6x6jfa8cFNaTcBtX
         iB3/z+OcYnIR+p2LAe5E+Rj/+AFPcqGhbVLCLNQ42b3zov+TikikuPZBFkoLE8uBDbbk
         Zl4H2f/6Nh1FlUy7XmHAO7aq47igDtKfxEpx5fRfAMutBAyLAiic/GvfzraL+tl7myDh
         64N5K2uqEmme3xpL8b8YjCI6EddJxDPsmw6T5XFhphMt6igWn1lHZNl1XYJ3PN2uisap
         LUeg==
X-Forwarded-Encrypted: i=1; AKwUvBzbE7IIHV2tAaMfwwQfQ6ablzh3kjVx+vXanTaGBL9r6/tMULJj53dXLjkd/7WtB4soTP5JKX4X0rNbwbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcLMuFbpmtmmH2dV+400BCgfBqsnB1z3W98Q+iazw8yoXD/gri
	iwqODjudJpDqWcSk9ASWsqW056e0NUds1pBItSfcaCXgFFNY7d4Blm1/18J5LY6fP1basZMvQUj
	rqowpxn4KQFI=
X-Gm-Gg: AYBFou3fFkvt9v+mdCx0YY+in4RUPAAPwTlZNPRDuXk8MYuJNJ41GpcdJApI+EG5yzO
	kHY5ynW+lMZgF1sxiQYP51WJgtjWX8vhnmMRXdSRD8tBjRpk5IiLZwrMqcz4kIO6tMiBk3PczkB
	pUqklgYXqeY7ylmLVWdUCfyJb0ewGQMtqaSGFk/+rrCV4QrbWPUdDmKIZNIRbRERMstP1K+nVEQ
	n9RJKCtA9zMLp4M5THihRBSi5gEGf4jFqvZOz5hGfkOZd601y/HF65NAdNVhRwmjxbpiIPXOXn6
	GueQUKmVAl7vaWMz7MzC8EHSYgdymL8Z87FRauL4nkm+tuvnYctdn+uFN7Mg8ks3fOQb9QLkxFr
	N5LPRRkRezcCtw9TpnP7vhyH3jpUfn/9fVpLjeVjlm1lJaqaqe6pvoZBu6xOmW7nDNkebkByuBb
	E5XeXzBi3y7OmtZetpf+SW7A/5dgWqHjEuy77ohybjUsCqJPqpP7RlR59DrwR51N6jjmIRkJnFY
	TQy3yia49RnBsxTte1/vLOubzIiOv7I6zdusG5bTPrSYiCyjt6zbEQD+5gh9svmPXCwlcW4UU3d
	znf9W+FL9EoTH5tTkzydKYHL4uWf3D63JV7JjQ==
X-Received: by 2002:a05:7022:f20b:b0:136:c443:80e5 with SMTP id a92af1059eb24-1ac56d94b0amr847420c88.6.1793316534852;
        Thu, 29 Oct 2026 16:28:54 -0700 (PDT)
Received: from bsegall27.localhost ([98.45.141.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm2146185c88.9.2026.10.29.16.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:28:54 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] perf: skew perf_mux_hrtimer_handler firing across cpus
Date: Thu, 29 Oct 2026 16:28:52 -0700
Message-ID: <xm265wykhyrv.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

When in nohz_full, perf_mux_hrtimer will wind up checking if it needs to
update jiffies as of commit 53e87e3cdc15 ("timers/nohz: Last resort update
jiffies on nohz_full IRQ entry"). When perf is run systemwide or against
a wide process and needs the mux timer, this will fire against many cpus
at the same interval. Then, much like the timer tick did, this will
result in unnecessary lock contention on jiffies_lock. This is
particularly unfortunate since nohz_full is intended to reduce the time
spent in irqs on those cpus.

Adopt the same solution as sched_skew_tick and just have a different
offset for the timer on each cpu, and make sure to redo the skew if the
interval is changed.

Signed-off-by: Ben Segall <bsegall@google.com>
---
 include/linux/perf_event.h |  1 +
 kernel/events/core.c       | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index eb3f7bab498ca..e1cb052af3d2e 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1123,10 +1123,11 @@ struct perf_cpu_pmu_context {
 	int				pmu_disable_count;
 
 	raw_spinlock_t			hrtimer_lock;
 	struct hrtimer			hrtimer;
 	ktime_t				hrtimer_interval;
+	ktime_t				hrtimer_old_interval;
 	unsigned int			hrtimer_active;
 };
 
 /**
  * struct perf_event_cpu_context - per cpu event context structure
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 457d75ea71420..7885071bf0856 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1277,17 +1277,29 @@ static void perf_cgroup_switch(struct task_struct *task)
  */
 static enum hrtimer_restart perf_mux_hrtimer_handler(struct hrtimer *hr)
 {
 	struct perf_cpu_pmu_context *cpc;
 	bool rotations;
+	u64 offset;
 
 	lockdep_assert_irqs_disabled();
 
 	cpc = container_of(hr, struct perf_cpu_pmu_context, hrtimer);
 	rotations = perf_rotate_context(cpc);
 
 	raw_spin_lock(&cpc->hrtimer_lock);
+	if (cpc->hrtimer_old_interval != cpc->hrtimer_interval) {
+		/*
+		 * Skew the timer to avoid contention on jiffies_lock in
+		 * nohz_full, whenever we change interval
+		 */
+		offset = cpc->hrtimer_interval;
+		do_div(offset, num_possible_cpus());
+		offset *= smp_processor_id(); /* we are PINNED_HARD */
+		hrtimer_set_expires(hr, offset);
+		cpc->hrtimer_old_interval = cpc->hrtimer_interval;
+	}
 	if (rotations)
 		hrtimer_forward_now(hr, cpc->hrtimer_interval);
 	else
 		cpc->hrtimer_active = 0;
 	raw_spin_unlock(&cpc->hrtimer_lock);
-- 
2.56.0.317.g454f8302e1-goog

