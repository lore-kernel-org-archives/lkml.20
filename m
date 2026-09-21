Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67E4B1468
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004177; cv=none; b=Htwh0V39cFKZQUeuGaSisYQncxpwNoTbLaZLRBujqc49Du0FQkFQ9rh4hVE44pxvUXXYSskHjRZ1o2K0xPa7jh2cR6Gz8ScT0OESGb/Eykrh4o0LPS+rKuuxhc3jQMDcmoCB2dhkoMGLKzj3u78TlQ9MPbPuf6TC4FX1kfZXj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004177; c=relaxed/simple;
	bh=r/DXnnZh82n9G0B82/HvKKmY0wfkV/SCJC8LIPGqQ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJym7N31km4dGEsUxDq7Gb5796OjvXJPhZ9oCwp2vg3Jj8dLpTf8P6Fe4eSdb9BU2MFrqmKsDk1GLwKGTy4wW1yEzFAbvSbHeuq/y/wtrx4E1GVnz4SyN3yr/yJbh+SeDXE/CN3CgJuDKLSKOno7WMNvFugZO3uIkq2zm9koQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+Zm4pE6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+Zm4pE6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so16801195e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004173; x=1790608973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95ptzx8elX4G0jOf5GWK4LtCTZK63m+CYC1QnfEGz0c=;
        b=T+Zm4pE6nAvONIzUfsAEgvILD/dSx663DFA2MwPZXaLQOxRUDGucNBVHyZVufyyze3
         Os0T7Pf7md8aiLwBbfjxJU/WKjRsvpuO8EOL1B0AJejgz8EJR701SiVWYUfXxPeNaL0w
         58D2t2KooXJBYiCW/AdOz5dNPcshqrxEp0U0PVLr7aK/BqPVf2i3yq+b1ZGuIOcGqmho
         gn1Dr/cfBfbQ4PYT1BGX9xGZcUSouIRpA0WrPgqgUa2cbfvNsH7GPCh2gH+7nfRGIc6J
         bO7SNSnK7vmXj7yBv3L6HVdYtRHjAux6u5szJFI3Ysqs96Ac427KkV+cjN31MhGH3Qa7
         64og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004173; x=1790608973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95ptzx8elX4G0jOf5GWK4LtCTZK63m+CYC1QnfEGz0c=;
        b=KBkFrYemp3Irbq0YosuGyvWZEFoaGJ7EyWy7RaznGDwxnGm0LOQowEHi+pRnzOzkzy
         xcEVg6TiLSh5b3i15ZMTzYeD74ZlgyjRuvJitJ8/1BXONCLm2CGyEBd5ZUUGbOIlnofQ
         XZ7PoUyvA4dEF8CR/t7+e0fYpEWxtxcAujnjKPvnZofz90WiS24KreY4Ndlz+e/dNNpG
         RCMusT0nYhkcOt38aWALKpozql12xH/vSX8ttm/5H33BxUr/c9lZlMHLe2XTJqdVUqF/
         kqqiOr4+yeZzKqteekZPhyq0ME4arQ4mCfjinA2lNYyo/5E++l0RfCFTOgYGZZwgfBbb
         S1Ww==
X-Forwarded-Encrypted: i=1; AKwUvByuI/cEayGam/qiwZCJ76kjgzmJa7xfyf4jmNFGQjQ4z7bV+srt0IEDONNmZYOx6gOXtsJy+5wWO2Cehjw=@vger.kernel.org
X-Gm-Message-State: AFuF++mu6f4cE2WcHAFUd9TS3eFqXnSn/f63JeE/rh/Z6BIUzFVwOaEZ
	hfJiR3d5CiwUXpczeq578oI54nsZyw2fxdpDqCyEG//lI3pC4+3pl+fg0B9zXu8r7i0=
X-Gm-Gg: AYBFou16CgSv0SrOUayPD77imaWH7bq83byhfWNlHrYu+8JCqKP73FMSMq8lWn288B9
	rqJr5nRlCZy5Wujhjuby7nAxHGbmt8LWAvnjwDbav7yzyzoTN/LyjQH/HFOlVAclGL1FohRdjcj
	5gzprWdX1XQcoJjlReHZ9GN9z7+xOgS8akSsEmApAwLGc28kcN0W33MkR0UaSuTgPpPmZuNiBce
	EmhvKpuyVo8a82m9YvRJKbCk0HjPZO7g+AEmyfgBnNDXI8YwLeO9XMhgOxPPBoPLJiGWkSQSRR2
	weM8S7G5i9ismicqi5b7JUq/IbvVXEEqR9KhlJKEltYXSlDKM+n29CGPqL3yXAQGGgMZuGO7/v/
	oP0YoxUwRVi2xfk9p5MXW/DoMcKrsr9Wju1xX5fFY/P7tptlhc5SqOHVb0Jv8GUrxPisY+R2s/n
	vzCa9bzVoMq19sDCuH5o4F6kCvTCu/kHAZhaX/rgIzu2t/FPPpytaFuoTi5tuFA2pLeMz0T7unl
	YK2LUulbu4tI/0=
X-Received: by 2002:a05:600c:470d:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fce7836bdmr96536655e9.28.1790004173599;
        Mon, 21 Sep 2026 08:22:53 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:52 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
Date: Mon, 21 Sep 2026 17:22:34 +0200
Message-ID: <20260921152238.3804392-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to delayed dequeue that enables an entity to decay its negative
lag while sleeping, a task should not keep a positive lag forever.

The sleep duration and the weight of the entity is used to decay the
positive lag at wakeup.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e6eb9a4c03be..4230954d10d0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -896,6 +896,32 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	return avruntime - vlag != se->vruntime;
 }
 
+static __always_inline
+void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
+{
+	s64 vlag = se->vlag;
+	s64 delta_exec;
+
+	WARN_ON_ONCE(se->on_rq);
+
+	/* Negative lag implies delayed dequeue */
+	if (vlag <= 0)
+		return;
+
+	if (flags & ENQUEUE_MIGRATED)
+		return;
+
+	/* Compute the sleep time */
+	delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
+	if (unlikely(delta_exec <= 0))
+		return;
+
+	vlag -= calc_delta_fair(delta_exec, se);
+
+	/* vlag can't become negative while sleeping */
+	se->vlag = max(0, vlag);
+}
+
 /*
  * Entity is eligible once it received less service than it ought to have,
  * eg. lag >= 0.
@@ -7986,7 +8012,7 @@ static void
 enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
 	int rq_h_nr_queued = rq->cfs.h_nr_queued;
-	int task_new = !(flags & ENQUEUE_WAKEUP);
+	int task_wake = flags & ENQUEUE_WAKEUP;
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight;
@@ -8019,6 +8045,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
 
+	if (task_wake)
+		decay_entity_lag(cfs_rq, se, flags);
+
 	/*
 	 * XXX comment on the curr thing
 	 */
@@ -8057,7 +8086,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	 * into account, but that is not straightforward to implement,
 	 * and the following generally works well enough in practice.
 	 */
-	if (!task_new)
+	if (task_wake)
 		check_update_overutilized_status(rq);
 
 	assert_list_leaf_cfs_rq(rq);
-- 
2.53.0

