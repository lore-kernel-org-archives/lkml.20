Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA72F8E93
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569249; cv=none; b=srqDQWn0IVYmy8dnmwbjlKgqDLw2vk32vBgyPPE8kC2oTOdWfbvUpxSzpCstjsVGAgHxcKrwhwNPHbC9CIGu+wiaNMBSVHhtQ8+b5F5Z/N8OvrZCirbJG49+TSimFNAhYqoD8zr5A4c9sTWwS7J2BSwgZv5VKPqznM6MY2loWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569249; c=relaxed/simple;
	bh=rFHanh7Ch28fVwN3jE3sxSyoAvx94S6JKqoVFn7VZSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hR/ts8xlEWRLxIOIjISKs/TZUOdbJSNJaCY7ZcIwQKtLalBaEqNvlcKOr4y4G/hEOr/n2dZnIK6jZiEazs9GpJHOeN0gNzD0E3mJ+7BcSy3/CpjCZaZuuYMGniKveMDpVFbZN55q26/U1dkvmxdToPG7DJX2IKSSJmEnmezLJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5ikq1N6; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5ikq1N6"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso1371281a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790569247; x=1791174047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vt+Fys9LPwoKj0epOmuGPS2f4bBUgX/azN8uK4mSop0=;
        b=d5ikq1N62RJ8mvXFRvUpNn+J0xJtIYWwtEH53lMBKnNxd7Cd0Y8qooyqq/R7E5zqd0
         tfKmCnsKHVJv9SY4yJJm450mI6MHHfrwHUo53G+mRXcMdt8UE4AXhqbSgNpCAsR4AzxV
         0dSbkgf3pheYhT65vGQoHZRoK/VpYBa22UuMXJktrElG0GgZDoevm+VO+/VVDvlYoQ/c
         YaKIoQ5VWINtt7dbuI/S5EFF7PHMiO2L+8YqCgR9lOmXjvO4QrVcGS80OWyWFgGxkyNk
         nGDjcKbJ96/0b1WgHZXaazABmSHkJ/rXYyYvLBEL2W6uYJGOUSf5Ngcbgl4vxpInluCg
         0bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569247; x=1791174047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vt+Fys9LPwoKj0epOmuGPS2f4bBUgX/azN8uK4mSop0=;
        b=TBtiCvNm6zx2JTq4jC/skH246M13hZpfaSEs59SArOo4uWYZoTCDkO6CImZdJQOzXY
         Hxaj/ZQC/0VsrIS1aCLEh7ftetIKDvCCTzkLu8Yg3ii01+6DPZ0YkMxHojJesrrw5H4l
         IdaG5xUilFWl7fTUM99KytNNRft+3ts2HrR+fnxSKnsoGHGCZRbW9/+kV8c/undRaP5b
         5qZurB1rPZLxF8X7j232Qo254os3Vn0UrUxuPk2X16CDbYW0O+e9TrCT8ZqH9uUneFg4
         ToFUs08rQdTF8pubMei/QBxGoPrHQ2bUXohQfYsPcdUpeShx9QGuawQfh7xt/x6qr09B
         1lXg==
X-Forwarded-Encrypted: i=1; AKwUvBzMmuNOikmYD2MzHmBx/Jd9PNPjb9twqCFUWMXr4rfxvJ77fawL5gvza/3+1S8Z8uqzyrm3IRFWsB6Paec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZfuyspl+FH01bQYz0WBXRp/jWHeJHdg3/hMJhgF1u3bMQ5zUB
	5IYHjSDdT0ROwBG47BCRZmq/u1rzhfv29Bj8CtkMNTjiH1cQjV2IWwMB
X-Gm-Gg: AYBFou2ZraFAONd4rr/MsOZWyWC++EeI2g4GZYVThL8QaoX3jYun9EUj6G0eSAAtMyJ
	arU4mQt2SBqf+OYb7wKE8elDioeJGSFMyDuQ8fyzpyVM+BHIS+UOiu63WXSzY7b0TVEeGsHRd0V
	xpqfVxbAaGb1cu4fU195pjkV01cflXUs5ngL8rUJzz4Z7E1yyQiLn5q/DDzEbyNA14L8fReDPcX
	1B9RjvWJdoT/3Rbu0aiLQBGbxe3mSzutgHSBHbRazQsfDMyH9VXlJQdBNTShZAOR6AM9kjQ0o7v
	tq4ztNYc5wwHrpvPq3oyDaHW9WLrLx61Ncxh35rUdnKa2sVc6w5JHFi4rZmpu0+PX1hVldm5DsB
	iIs6TcLDT8hNVt997J81t81ruUAOzyTjNlIxmjE7wf1RZL6MpInSh12bb/6Mowmg+lWBbCazqIw
	gSYam7Y/4Usqt+HZbqwG3jNQAqcQT/ikE9Dj2jWx92XddVnRdwzYcCPsc8UII260k5oz2eixzR8
	qERJ0A8xIzrJQfAQuV9kZcAiw==
X-Received: by 2002:a17:90b:384c:b0:3a0:7209:fffd with SMTP id 98e67ed59e1d1-3a0bb60b32amr7375699a91.42.1790569247106;
        Sun, 27 Sep 2026 21:20:47 -0700 (PDT)
Received: from localhost.localdomain ([167.71.204.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm18252804a91.6.2026.09.27.21.20.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 21:20:46 -0700 (PDT)
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
Subject: [PATCH 0/3] sched/fair: Update decision matrix and rename pinned-task group state
Date: Mon, 28 Sep 2026 12:20:15 +0800
Message-ID: <20260928042018.10618-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 brings the group-type decision matrix above
sched_balance_find_src_group() up to date. The matrix was introduced
by Vincent Guittot in commit 0b0695f2b34a ("sched/fair: Rework
load_balance()"). When commit fee1759e4f04 ("sched/fair: Determine
active load balance for SMT sched groups") added group_smt_balance
and commit f38cc2f0d8a3 ("sched/cache: Prioritize tasks preferring
destination LLC during balancing") added group_llc_balance, neither
author updated the matrix table.

Both are only tagged on non-local groups, so their columns are N/A.
As busiest, both go through the nr_idle checks rather than an
unconditional force, and both are balanced against a busier local
group.

Patches 2-3 rename the state that tracks load balancing failures caused
by cpus_ptr-pinned tasks. The names come from the original group_imb
heuristic, which did detect per-CPU load skew; commit 6263322c5e8f
("sched/fair: Rewrite group_imb trigger") turned it into an affinity
failure flag but kept the name. Today group_imbalanced is not what
group_classify() returns for skewed load, calculate_imbalance()
computes no imbalance for it, and sgc->imbalance collides with
env->imbalance and imbalance_pct. They become group_pinned_task and
sgc->pinned_task, matching the LBF_*_PINNED flags that set them.

Patch 1 does not depend on patches 2-3 and can be applied on its own.

No functional change.

Jemmy Wong (3):
  sched/fair: Add smt_balance and llc_balance to the decision matrix
  sched/fair: Rename group_imbalanced to group_pinned_task
  sched/fair: Rename sgc->imbalance to sgc->pinned_task

 kernel/sched/fair.c  | 66 +++++++++++++++++++++++---------------------
 kernel/sched/sched.h |  6 +++-
 2 files changed, 39 insertions(+), 33 deletions(-)

--
2.54.0 (Apple Git-157)
