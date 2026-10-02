Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515164EFFB5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956011; cv=none; b=kpScTXJRC4qucoAPXnu1IUKjmiCfktZjmwyVN7/nmDTUNZ+irfeAy/XoRhoQNv5rdbFu3u9I2V9wkwP8MEnquUL5akg9fwv5dcweaDk0ArXkEqr0C8Gc5/WlTZSUFxx+poG+S2oXQ1bRqOj6MPrugzq3hZHgSkiEKUeGdAsdycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956011; c=relaxed/simple;
	bh=Qy8PFtjAzJW1JjmeYwixuRE0Je3mICHVPKG+oMpVmf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9MKaBq8C4TUp8OQcLgTR8/GkxDVQjwaKNoFY4CWdd2pXAkxuhbCE/FE9BfSsrS8o3emZDCgFle2sji0yWqWBphkT1CYaTyyEingOUhfhHfki+GJDiCafXZWAzNQY9OFA0CvOxi2WOXePIs9aNccxWt4GYtMB3KFFGWlaXKZVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrRqIUDK; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrRqIUDK"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso20673995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790956009; x=1791560809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m+zr6zisS4zdxc7enNiExS1pfcELM2VHJ4NR8OAQd4=;
        b=JrRqIUDK3dyPLXDCL9k3ywq9o80bii0s6G0vmBpr30gYzpTRuXPOI1xmMSzjbbJS3h
         RmA9D7h9pPCsPy4RRPXgnc9EjG+751SRCvM6Uc5aVGPQBeWAq585mH+6xbj/A4otSfFf
         D6P9a+T4RtBNvaEdADAwUQmDMVZonZDoGgF3CHgi/y7DU/pCzlSrr4gvnIPuXNR1/rh2
         JvnIZImvTzB7dJfYHdZgqFyyB3jQUhzZlY8eP0zu7UQvOm1S38YwLckIFwrorHzVe9da
         fwiDxd4KoIkh/l/CiSbbU7OHVjgshpXaVslSdIK41lmQ4gyEiZK/IKGt0LC0BqHViSXd
         trAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956009; x=1791560809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m+zr6zisS4zdxc7enNiExS1pfcELM2VHJ4NR8OAQd4=;
        b=aJNSz3ZHg736GNJYUgfLVZ8gmSEjR75/QzdjPzyDvOggbHXWC6YcPjJuhNCgCBsYOM
         88/omMzGL4jwXH4hI7p430RXnrWXc0UDccpxR3lKrcEDri5kc2ssfaAMfxKC4DPmJpzQ
         yLt81uQBDqBTxavTQl+43gkyZgEBhlpWVyhtKJT5/xRoy1wegr+IGFvOMPDRPNsUxcD/
         V/PH3AqbHtoDVP9Kichs8hSsZF+a8OPhadrAmZULaLg9+eBcA5QOpbYU3sIUJdZV9s/D
         VwK8pMwtMTbH+iXmWs1SfXSJ+uP1JQeoftkv++40soRGCfJyk3t/2LraUF9X86GHP/cu
         RuAg==
X-Forwarded-Encrypted: i=1; AKwUvByTVe8pWOOah12yKascRRm8r/uLYF/0yr2MXBtvzuJVd3TAz/MTRKmpObep0B76Jt/XeCApU7nDO6CXjiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrKLcnoL/nE06gdUEwkbOzYfP59H2Ux0ULpNucPtirC8g+5bZw
	+4CL1SUSMk/sGNfOwtgXFP/m35CBVOwSO14CWn+SCprf8vl9T6CLoot2svIpEKr+
X-Gm-Gg: AYBFou2jb6iEaKXT30+Bq7iq/fg50ZEbhcMeyXSjlhz4ESmOEnO23zzCDfF8EljJjG5
	j2u+IZX7kp9VqO+MBUU0HcOMg77jvZLhYIyaLmfNITeXG+0y2VtJMfjjbqSwh0gZLy7eq3vPYgi
	exG8gh7bSzY1XwhtOrLPn6s0h7Pxp8epMwb8sK2CLWMAWEsMxNqy+3uVvF3HC3U6A3QDZR5rXlZ
	3SEpru2vqkBB4QpFEnIXzaiWzJBUfHtO1MT5qn7CT5GGUeN08f2p+0nCh74j3Jii9tFiNhOkNjY
	KTur7To9CjcVsfDkuYnVKTDFNLMNy09EzUu5nbI0lOA8u+yXy9ruvvtOehR8/00kXE0G0nsK5Cp
	ibEWANTMCJJ/MO8ieaNioqUV1gBtLaoQjE23p+ZboSxEFJpfPBK1NslNFl9P7PGGpniVJltdifp
	m+GxPPdI5qbP3OiXEk1BjzOJlKt8GuZK2iItayONOQ6Fd+Sg3pSefBK5G1U8R09v4pNJ8p0xoHT
	rBEw3QfPdBY
X-Received: by 2002:a17:902:cec4:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e49b6ad58cmr28347335ad.45.1790956009152;
        Fri, 02 Oct 2026 08:46:49 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d9a88sm9785075ad.53.2026.10.02.08.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 08:46:48 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] sched/fair: Add smt_balance and llc_balance to the decision matrix
Date: Fri,  2 Oct 2026 23:46:32 +0800
Message-ID: <20261002154634.71878-2-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002154634.71878-1-jemmywong512@gmail.com>
References: <20261002154634.71878-1-jemmywong512@gmail.com>
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

As busiest, group_llc_balance is not an unconditional force. Against a
local has_spare group it forces the pull when prefer_sibling is set,
because the group_llc_balance test comes before sibling_imbalance() in
sched_balance_find_src_group(). SD_PREFER_SIBLING is only cleared for
NUMA domains. Against a local fully_busy or imbalanced group the nr_idle
checks apply, and against a local overloaded group the local group is
busier and the pair is balanced.

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..bcb9987952b9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13184,13 +13184,15 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
+ * llc_balance      force     nr_idle    N/A   N/A  N/A  nr_idle   N/A  balanced
+ * overloaded       force     force      N/A   N/A  N/A  force     N/A  avg_load
  *
  * N/A :      Not Applicable because already filtered while updating
  *            statistics.
-- 
2.54.0 (Apple Git-157)

