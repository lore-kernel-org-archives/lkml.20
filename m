Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C11DEFE8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286428; cv=none; b=gp/PgyXuRUlab5MZwmkNFRqXTUlss8jKHCj15C56iXmvhGyFXaRLC0BpwP6564uSwTr/N2vc9/xwgMeEE8zeqGeEP/APjcbzW4gMaLJUZW5IwRjR9COhuDLzaT/4Rbt1I8Th+t+D20C/GdeYeRkIaL+lc4J1/BC069LVHRmr4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286428; c=relaxed/simple;
	bh=E4QWvvZXHvFDmx8ZpSflWoppDuRLramrcGjjt9WKUQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1yOptHIUv2eOinz1mHOPnMMWjumCEZR4x9Cobyt19hq5quxFsUIzB0EVXvHtC3v0KaK87RSiNSWVWFpeKV7OK6+GZin8tEASDburjdMJvq+73WHmUhKyxlh2iISjw8CwwdTMTi/k23vX43P7gS9CgO93NtXS2FYxNF4CGJ1DYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hix2ITNO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hix2ITNO"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so936167a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286425; x=1791891225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhQF/itJJniogTBZpKWP2vo46Q0NDWJJIYl2MQzhtGc=;
        b=Hix2ITNO55h2MyqfApXztNX2GjwSP1CRf/uDFWpmLb1w9bvG7742TrkY1cS/dVIz6f
         3PezJehGz0gYf4ysrHqnfk3FuShc46aOoa5zDpNBsyB3uf2cfNtrj0/iKbFKb0P0byBW
         k107g2ErG6AcXj7q15y++vu+R4zRHDxQ/tDQINZ7AUGc622uY9nmHmrzvzXrpP5TiZgB
         Vu4YhFTUjWw3WyXFR0VW6M9l3Olq5wJnxgEfmBXdlwKX0uqAOkp0Us2J10EjQsjDyyQb
         NanJJ8Mror9GRwKgp9Vb2Ytt7AK7DBc+HJfb9Y3IaUkVYNCOkauMFrPOhDgiG+R6e9bX
         BGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286425; x=1791891225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhQF/itJJniogTBZpKWP2vo46Q0NDWJJIYl2MQzhtGc=;
        b=m4yYyz9gSYI0kdfIVf5/x7GMZ//rk7o0lts59XHj0hn2lQ+QLZoUxuuv/yn/TIgJk3
         H2n3xyF5NEamTudex4GoqjEAfuqbPegSVLsEMrIgcunXGdQ2fEusofNLgSVqPWOQA9YE
         enB0/OTSt5/5ujvNG4lqeZYKRR0tGWus41wTR+DcjmDB5Hs7mrGMRsm8pH1UGtDBfatm
         sRff79ktxNFxXWLw6NVHfGnHcEYLjuXNVtWCQfzrv39psgTMvr7ymzcQUbsZhsPHfCFR
         ODsR/tJ4bT9462RbRrot42eLvF44KQAtO0uvlWskxtkHq7VfMfI5oJ2Im30o/XBdacO1
         a9Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwtCXjLmX9098xpOqZ2FxMDud/+3VhfPF4vy+skyVDkzre5+pnmkCCNMAgqWo1y48qkZQKFT/I1aVS1WFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOaYm350XTMAMJNDkxmwm1wjTkGXeKh6J8W1EeXIm2Nx/5ib8V
	Z0NqaySas3zblbAomMUfu+SSCw99yIjKTT67qClmxwrpoEcy80EqqG9E
X-Gm-Gg: AYBFou3Hl80R9TaG66rbelyQeCIaHdCBLVtuTU04cpK83aGxLXBkAXCND/E0Sp/yu2Q
	kO6/9k+cfoIcwABouMb2r4QVALm9BN5cTis6gkKu3X5eKG1eN4bSTPEbNY8qNnvxiojMOmIbl9L
	SUQrt5M3SAYqk4ieuVMZwRl2YUofuT2iB4OLamfwGuUtx3/GT4SrLq9uvzihC0piUOQVtykZzSn
	Ew3nOL1fOFTMg2xDsaHaPRvXWWZ//RWD43txhiuCZ7fwu3lvgUpD7DMs8OKl41SXDse7uBDTYTx
	eotyK/7/fJgbRczLm7BTmGDdvwDnGqhom+Wg6YzOr2cZmrGPtZq3nT/zrKdAGOpEDYJZ1oB/v9z
	uiIx1THQi65UhvHd7YzDMBa75drsYnIfN8/1+gP/0oX6ux5uNKBuTfs7FOZjCmgfmN2aLLtOLUq
	riH5j6rzF/gEZ5qYUl3PyJsaKWB3tV0qWuNtXgSQHfDZW9QgEgNI93INSK46VTp+4Xe0LbO2sit
	avkapvPlLX17mTQpUHaaVsT4csuXiEaXsTZmtmd2dUe3BnJGhCi4wzjgEoHz0SztAYy3SeiLA6I
	w6qW1DFOPzLC1ijoVfiT4t0sAuduSk6rdOji1o9mH6hmemaiLaqO+O1OJr5X8pKFt871mVNyoW9
	nUDdasyPfmYxci5YdwYPO4R19LW9A
X-Received: by 2002:a05:6402:3787:b0:6a5:fbc6:cad1 with SMTP id 4fb4d7f45d1cf-6afe2978761mr1144059a12.7.1791286424972;
        Tue, 06 Oct 2026 04:33:44 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5937sm4465468a12.11.2026.10.06.04.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:33:44 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] net/sched: taprio: reject software schedules that overflow their timestamps
Date: Tue,  6 Oct 2026 13:33:34 +0200
Message-ID: <20261006113335.241564-2-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006113335.241564-1-krystianmkaniewski@gmail.com>
References: <20261006113335.241564-1-krystianmkaniewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

taprio takes base-time as an unbounded signed 64-bit value. A base time
in the future is used as the schedule start unchanged, and
setup_first_end_time() then adds the cycle time, the first interval and
the gate durations of the first entry to it. With a start close to
KTIME_MAX these sums overflow, and the software schedule starts with end
and gate close times that lie far in the past.

If this is the first schedule, the qdisc timer is armed for its future
start. With an operational schedule running, taprio_start_sched() keeps
the earlier operational expiry instead. A large cycle-time-extension
can then trigger an early handover to the pending admin schedule.
advance_sched() uses the invalid entry end as the next expiry and can
keep restarting inside the same timer interrupt.

Before a software schedule is initialized and published, check that the
computed start is not negative and leaves room for every timestamp
initialized from it, and reject the schedule with -ERANGE otherwise. Full
offload and txtime-assist do not use the software timer and are not
affected. Schedules with a reasonable base time behave as before.

Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")
Assisted-by: Codex:gpt-6.1-sol
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
 net/sched/sch_taprio.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 299234a5f0fe6..1f753911cdfec 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -1238,6 +1238,48 @@ static int taprio_get_start_time(struct Qdisc *sch,
 	return 0;
 }
 
+static int taprio_validate_start_time(struct taprio_sched *q,
+				      const struct sched_gate_list *sched,
+				      ktime_t start,
+				      struct netlink_ext_ack *extack)
+{
+	int num_tc = netdev_get_num_tc(qdisc_dev(q->root));
+	const struct sched_entry *first, *entry;
+	u64 offset = 0, span;
+	int tc;
+
+	if (TXTIME_ASSIST_IS_ENABLED(q->flags) ||
+	    FULL_OFFLOAD_IS_ENABLED(q->flags))
+		return 0;
+
+	first = list_first_entry(&sched->entries, struct sched_entry, list);
+
+	/* setup_first_end_time() adds the cycle time, the first interval and
+	 * the finite gate durations of the first entry to the start, and
+	 * setup_txtime() adds the offset of every entry. None of these sums
+	 * may overflow.
+	 */
+	span = max_t(u64, sched->cycle_time, first->interval);
+	list_for_each_entry(entry, &sched->entries, list) {
+		span = max(span, offset);
+		offset += entry->interval;
+	}
+
+	for (tc = 0; tc < num_tc; tc++) {
+		if (first->gate_duration[tc] == sched->cycle_time)
+			continue;
+		span = max(span, first->gate_duration[tc]);
+	}
+
+	if (start < 0 || span > KTIME_MAX ||
+	    (u64)start > KTIME_MAX - span) {
+		NL_SET_ERR_MSG(extack, "Schedule timing is out of range");
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
 static void setup_first_end_time(struct taprio_sched *q,
 				 struct sched_gate_list *sched, ktime_t base)
 {
@@ -1958,6 +2000,10 @@ static int taprio_change(struct Qdisc *sch, struct nlattr *opt,
 		goto unlock;
 	}
 
+	err = taprio_validate_start_time(q, new_admin, start, extack);
+	if (err)
+		goto unlock;
+
 	setup_txtime(q, new_admin, start);
 
 	if (TXTIME_ASSIST_IS_ENABLED(q->flags)) {
-- 
2.53.0

