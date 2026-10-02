Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C94EF14B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955934; cv=none; b=Qu/jtPuHtJei7mWzbo/FVo4anRzMqfg7RtjHN+iaD6IrRcufEvmkqXCja9iDHw5KnbTY1JaZecFmFxweHw/aF8fNcmHDPDHjt5/WKGuhGW5iX3Gks1a91Z5qif/elbxsCLCW9pR91SmcHrvhx0hBMywFOc7iK2w9YGj9dhZlDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955934; c=relaxed/simple;
	bh=Lkq2thXBra+9jyaZNWFz8y5q88bfRFP5x4L8/XdL6qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ME6sqluSCm1pLXETIIBiIz+vyeLBLsq2smwJW/CUd4Q/E4yHLEk/LdwWJFkaqQDHcdRVunvZ0VjQkJazRVXT5nPRZwIBAWdjaejv4RcGDOqdQsQF0wogzwvVsJdvrZL3T546DQ2cvpiWUej4cSFa2Bva8MQ/KZDfn3bC7tOVY50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y21N3SuB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y21N3SuB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso340255e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955929; x=1791560729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AczkvEVMwyiADmz9Aen/RP9scTy6HPzxTwLuS0NkCE=;
        b=Y21N3SuBGYYsFcZBa3CwfSEgUBGXst6qWulZGmb721PRcYeEn3x/ZjZxsMYrCTCc6F
         +caem5jICeN2eB8TN39xvX3uxbLUYnAPQ1OV/gatVJs+pr8ilg8Stl3+P0dZXrDRuWjO
         eua2nVm4X1lgC2lB0ZUBfdG2n667K5wADLMyVbLRfJFHkaxCEDP3XWRxsG/a0XQHnwOy
         qG/VEmDMIc52XN/l33KN7Kmeiirj5JAufjWpomhVQ/Bfc/ucN0AbE/ZQFLzp0L3u+q/l
         YhR4oFl4b0VyoQqAb2eDhHjpKKdkHGjfUn+LpBgfH+/U26Sncz26gcakwiwcCL570amK
         WLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955929; x=1791560729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AczkvEVMwyiADmz9Aen/RP9scTy6HPzxTwLuS0NkCE=;
        b=NWdS5WZw7xb8HJFnAFWwXZECNLFsgHXrJPPxOWvFWA7OHIg3xA271stKtzlil5SCXQ
         dCtmCts3k5HFUEz9Fa+i5J5Tqwu3BWM4Ffc2J9/LaqBlL9oViYxRLMp1qsFSDjtU5tki
         u58yoqy8F/dOSiwUPDVCAuZCTWGEN1ry9GgHBBiZWCg2AawfgejEVJdBFfiOViYKvySl
         UtP/br2asVyn6gVeKpmKgPTYCincb2HEET3r4XIMmhZTPhgMGTW+/epDY/MAfhbo+qbp
         G2sfyOHL6c6X0kF/pt3+crFLAaB+WvdInvBVZ+j4snDd/bG8YiMOnEodIz+hMZgweeqo
         qzWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwRoO1cs+9AF3A2GLoBrkg0UqR2ny1ylxRuT7G94Tpx5frppi4QX6D6aQ8jRVCHUVnxgSZquXb+0qObso=@vger.kernel.org
X-Gm-Message-State: AFuF++kgM436wPiZRqQUotLxxXSNbu6IA1XLHgP6yCsr3tjefQkdFbaK
	0YEtPZ3xk+Y5OTpf3fGEZZQreuYShGrNaSXUi3V+cbNZ8mU1/afVx45CCmLUoWMGR4E=
X-Gm-Gg: AYBFou2yMwgghp8lnkitQgAsN4nWfR63eezwrCrdraiEBs6+RkGToKZYKiI45suLZ/o
	J3g/gy9B+7s7KItro7qFipC5Xnk8TTp444nADxBWjCYCVgHaBD1dTfhX6ZnNxGDuu6zOCjuN6tq
	2C4H5v9CabB54WE8bYwXELnZoZerK33DN0uwAE7F8bwjFnYQx0VS350R45PjwgMOCIZR+aqgmJF
	R7UrMULUN0dURMF4+rw40v9ZgQk6HcyegD7+zVcBdfCD3FNNJYVbicsFLsF4gQyBIJ63BzGUh38
	BSYKiA3h9zpfpmBwzzS09ZKxs2rOvhBTjK+SoXYP0eoqkIAC+XCEZH98gTuBHB7k6MCkM3uokPk
	FwW5DYMJq4Y4DsoocUYbBsiQ8bzcmWjySJlkRUrhiKz7VpRlkpUA6dxX8o9CAxANDI24yWhLIsU
	xx0JvxkvqZONa7n7WD+U//cUBdhpt29vKu5/Sg53BgauPEiM7QbeaXPC9WJI3geyMmOSXS3oxP0
	IZH3icxIF03z2/e
X-Received: by 2002:a05:600c:19c8:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a027559795mr67180475e9.12.1790955929334;
        Fri, 02 Oct 2026 08:45:29 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 17/18 v2] energy model: Remove unused em_cpu_energy()
Date: Fri,  2 Oct 2026 17:44:14 +0200
Message-ID: <20261002154415.2270586-18-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused function em_cpu_energy()

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/energy_model.h | 97 ------------------------------------
 1 file changed, 97 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index 89cf109cbca6..c4f9558b58d1 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -244,97 +244,6 @@ em_pd_get_previous_state(struct em_perf_state *table,
 	return -1;
 }
 
-/**
- * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
- *		performance domain
- * @pd		: performance domain for which energy has to be estimated
- * @max_util	: highest utilization among CPUs of the domain
- * @sum_util	: sum of the utilization of all CPUs in the domain
- * @allowed_cpu_cap	: maximum allowed CPU capacity for the @pd, which
- *			  might reflect reduced frequency (due to thermal)
- *
- * This function must be used only for CPU devices. There is no validation,
- * i.e. if the EM is a CPU type and has cpumask allocated. It is called from
- * the scheduler code quite frequently and that is why there is not checks.
- *
- * Return: the sum of the energy consumed by the CPUs of the domain assuming
- * a capacity state satisfying the max utilization of the domain.
- */
-static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
-				unsigned long max_util, unsigned long sum_util,
-				unsigned long allowed_cpu_cap)
-{
-	struct em_perf_table *em_table;
-	struct em_perf_state *ps;
-	int i;
-
-	lockdep_assert(rcu_read_lock_any_held());
-
-	if (!sum_util)
-		return 0;
-
-	/*
-	 * In order to predict the performance state, map the utilization of
-	 * the most utilized CPU of the performance domain to a requested
-	 * performance, like schedutil. Take also into account that the real
-	 * performance might be set lower (due to thermal capping). Thus, clamp
-	 * max utilization to the allowed CPU capacity before calculating
-	 * effective performance.
-	 */
-	max_util = min(max_util, allowed_cpu_cap);
-
-	/*
-	 * Find the lowest performance state of the Energy Model above the
-	 * requested performance.
-	 */
-	em_table = rcu_dereference_all(pd->em_table);
-	i = em_pd_get_efficient_state(em_table->state, pd, max_util);
-	ps = &em_table->state[i];
-
-	/*
-	 * The performance (capacity) of a CPU in the domain at the performance
-	 * state (ps) can be computed as:
-	 *
-	 *                     ps->freq * scale_cpu
-	 *   ps->performance = --------------------                  (1)
-	 *                         cpu_max_freq
-	 *
-	 * So, ignoring the costs of idle states (which are not available in
-	 * the EM), the energy consumed by this CPU at that performance state
-	 * is estimated as:
-	 *
-	 *             ps->power * cpu_util
-	 *   cpu_nrg = --------------------                          (2)
-	 *               ps->performance
-	 *
-	 * since 'cpu_util / ps->performance' represents its percentage of busy
-	 * time.
-	 *
-	 *   NOTE: Although the result of this computation actually is in
-	 *         units of power, it can be manipulated as an energy value
-	 *         over a scheduling period, since it is assumed to be
-	 *         constant during that interval.
-	 *
-	 * By injecting (1) in (2), 'cpu_nrg' can be re-expressed as a product
-	 * of two terms:
-	 *
-	 *             ps->power * cpu_max_freq
-	 *   cpu_nrg = ------------------------ * cpu_util           (3)
-	 *               ps->freq * scale_cpu
-	 *
-	 * The first term is static, and is stored in the em_perf_state struct
-	 * as 'ps->cost'.
-	 *
-	 * Since all CPUs of the domain have the same micro-architecture, they
-	 * share the same 'ps->cost', and the same CPU capacity. Hence, the
-	 * total energy of the domain (which is the simple sum of the energy of
-	 * all of its CPUs) can be factorized as:
-	 *
-	 *   pd_nrg = ps->cost * \Sum cpu_util                       (4)
-	 */
-	return ps->cost * sum_util;
-}
-
 /**
  * em_pd_nr_perf_states() - Get the number of performance states of a perf.
  *				domain
@@ -407,12 +316,6 @@ em_pd_get_previous_state(struct em_perf_state *table,
 {
 	return -1;
 }
-static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
-			unsigned long max_util, unsigned long sum_util,
-			unsigned long allowed_cpu_cap)
-{
-	return 0;
-}
 static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
 	return 0;
-- 
2.53.0

