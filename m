Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBC14F70
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569256; cv=none; b=dJAlh4TW76Jmh9AFNbzZOyQnZzE6EHs0+X/ezhMexfEkVaOvQCSVyea7NQ9J7HXSZGB+cJzbmVd17JwGPoyi/Wzzyke/x1IEU0E2lCNkptS3aWmC4Vdno45HJjF1TdAnrcT8ANk0DpzbUjcnkhP2/7u+uzi3CldRlkv5QYm2TyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569256; c=relaxed/simple;
	bh=8s5UNNxjNTgWcTEPGOXDlHQ84vTRSMiHLNfmajp9dIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBZdmfeG73SNU2J3Alat/R/ai4Mbuwpg9yISUvSmXM39rryZGez8PKd7rX3lDbzVC446HoIUU466C+XcMMqTWeSMrH7lUMDPebWN4Xafle0s6HbID3yBT6+1fcuPON6O7KCkTMo+Ntypmg76rYaAkkllxswB2UVR3EyX9lASwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlAKHO6R; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlAKHO6R"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso13783805ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790569254; x=1791174054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vf1mL/aY04keQxVMDFJDD2jaVQO8n/7zhuRpmwsEObo=;
        b=JlAKHO6RBAf2VM5+KTGlcHKFlOu8O5zzM77OnRVRBQywGxRim4Djh0YJYPIlZ0ad49
         y3fU/MbCjKFHVvwPkcSDAHOtG+vgiFJFE3COhn3Vvfx6URI2d+l1AiJOxH0VJM4NUy1K
         xYO9uIGI7br3N6gvEs/fKGmu7vFZ/ss4GoarAkSFNssGSHLUGWHBOwM5fSCgU4myR39G
         nl6hqwxr1eevAk9LE+wPzaRXA5OMdldFIe7INPk/RbkPr3DWfDpAeOI5PL3qWQLbjATU
         TpR8Ktp2eF9yR4DV5n+CITKlfXHwr8McdXq0FqQ5eOhhdjiAFqFJCoamDjZ9DWrL7Mx+
         MR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569254; x=1791174054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vf1mL/aY04keQxVMDFJDD2jaVQO8n/7zhuRpmwsEObo=;
        b=lxV8W4HSDdYX9+XcfzA33qbQ+aceA8ewRHDYnGRtGbSqk8wlbbJM9CwxvGSa4oKqBs
         gsDRZtcclFJD8cJetwC1JIlPseSG0JW30C1s9JlrWRk3HDSY0Yi0GxCtecu0rT+U273q
         OfddRljMIu98wy7FEORoZomA7OYGIjFHr0qJKqN5YxrQeBnF4mwcZzow8Z6aQikbw4+8
         DqzmluJQYad8TAUvYaCrYGFo2U30dn64T3tFrVx3JDLPkmxNxfc12JnqXI3ATPrB5pfs
         /GT+npxP1gpGJA2zYiONvHbOu6pAdzSIzos70ibDkYogmh+N/pyExj0O+1vJmw86gogm
         Eupg==
X-Forwarded-Encrypted: i=1; AKwUvBx0Je/MXWA6Ioa+jT/ZnCA/M94wUOZKG1MXroRzqrevllI2IyhDGsZnlIWRbk2vtzvbCQmciVvxVCr9gaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7x106HrgK9lCXepNlLmgwJ19eWeURE96fNq3/KnM5zBK5v4Te
	nX9FHy6w61aqho7O8PKFZFH/eEm4akr1r7BZmr7UXWqpbPiaz7qJLkZC
X-Gm-Gg: AYBFou0Ma4n/S5vcPWjhZuNe2+HKfJe78KQi2iA4XzDtQN0QtRMxA1gNaq5wAW3+3r4
	KiZbnm98yLsQPba2jz5l7dUYp3HT35HJcBkubqRDOJ/HEPZsvVHHZUSKogF0TgrK6Kico41UTrT
	xrtfaym3eqkLrriMkTM4w2ZmbOqHPIQo91JGTuDWAh7PX3Mxyq5Ny7I3sgjqjscaZiAvg4FmV11
	VPr8Hx6jmTLQbLX5L663M1ZkPPCjXj36zyDx/GP+SyLv2XmfYJh5/PZGSaHi5Q6EJVp3njhVaYn
	zP4xrkS2/Je7peS61iP1Un2oJ0LXXpS7jLsmbXIe3gpT+wMzxwP++o8kcCXzPvzd+WgBBRW1Q+U
	+qo+0z8EgPfu/jfj3SzFaLDhB83qAXcbUhRdxnpmeAgddfDCGyPkh3LGZy9NROcCkiX7EqxhnDO
	QIuWrO3RLuYOnxq0OMhydg/KB/AlCJEiweX6PxlbBrbHakSQ8LOpnpwhZF17UhqgPYiJiFKjSZd
	op//nYdvR9Gq0Dr2/AEf2ln
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr6124536a91.6.1790569254339;
        Sun, 27 Sep 2026 21:20:54 -0700 (PDT)
Received: from localhost.localdomain ([167.71.204.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm18252804a91.6.2026.09.27.21.20.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 21:20:53 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] sched/fair: Add smt_balance and llc_balance to the decision matrix
Date: Mon, 28 Sep 2026 12:20:16 +0800
Message-ID: <20260928042018.10618-2-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928042018.10618-1-jemmywong512@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The group-type matrix was introduced in commit 0b0695f2b34a
("sched/fair: Rework load_balance()"). When commit fee1759e4f04
("sched/fair: Determine active load balance for SMT sched groups")
added group_smt_balance and commit f38cc2f0d8a3 ("sched/cache:
Prioritize tasks preferring destination LLC during balancing")
added group_llc_balance, neither commit updated the matrix table.

Both types are only tagged on non-local groups in update_sg_lb_stats(),
so their local columns are N/A.

As busiest, group_smt_balance is only set when dst_cpu is idle and the
SMT group runs more than one task. Against a local has_spare or
fully_busy group it goes through the nr_idle checks, where a non-SMT
dst group may also force the pull via smt_vs_nonsmt_groups(). Against a
local imbalanced or overloaded group the local group is busier and the
pair is balanced.

As busiest, group_llc_balance is not an unconditional force. A local
overloaded group is busier and the pair is balanced; otherwise the
nr_idle checks apply, with prefer_sibling still able to force the pull
when the local group has spare capacity.

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a99..f9ddcecfd19d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12947,13 +12947,15 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 /*
  * Decision matrix according to the local and busiest group type:
  *
- * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded
- * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
- * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
- * misfit_task      force     N/A        N/A    N/A  N/A        N/A
- * asym_packing     force     force      N/A    N/A  force      force
- * imbalanced       force     force      N/A    N/A  force      force
- * overloaded       force     force      N/A    N/A  force      avg_load
+ * busiest \ local has_spare fully_busy misfit smt asym imbalanced llc overloaded
+ * has_spare        nr_idle   balanced   N/A   N/A  N/A  balanced  N/A  balanced
+ * fully_busy       nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  balanced
+ * misfit_task      force     N/A        N/A   N/A  N/A  N/A       N/A  N/A
+ * smt_balance      nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  balanced
+ * asym_packing     force     force      N/A   N/A  N/A  force     N/A  force
+ * imbalanced       force     force      N/A   N/A  N/A  force     N/A  force
+ * llc_balance      nr_idle   nr_idle    N/A   N/A  N/A  nr_idle   N/A  balanced
+ * overloaded       force     force      N/A   N/A  N/A  force     N/A  avg_load
  *
  * N/A :      Not Applicable because already filtered while updating
  *            statistics.
-- 
2.54.0 (Apple Git-157)

