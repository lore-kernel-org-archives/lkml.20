Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D3402429
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763800; cv=none; b=L+MhlRf8N8OMrSTNdXvLo2YiwMQ3JGpm82o9vfFpIt2yg6JPzlS4dfLoDANrb0qyH9l7wlobpjdn6BT9Vb68JEfv01PXrdA4l7yvswNZg/pSOT/wJ+OhoE9boYdlRCdIBH7L6mze6iOoTsUhnC3Afk8166s6rQOBaUIH2vz+0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763800; c=relaxed/simple;
	bh=wP/VmfgG8uegsHyz+t5uqy0UJrm9m3L+wrFlNnRkDRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baS/YWb/tXXSOdN3BOpLzHQRvw3+5qklFR6Jk4eE0rPy3ZXTqvNWnFi1gaQahwfX28QYiA+9iO09e2UsSGUNXU+ENfTUnnCMvLg+34QTSb62mTLToAy3W8bdiNjP3eTcOXrDgcH+iQ8zCFRk76HYeXO+Sx9QRHusD7W2xhFVqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am2d/ton; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am2d/ton"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso3282089a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763796; x=1789368596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvX58P+MDa4sWTy74Vbi1oLHS8rHG4kgimKkPCwJ7mg=;
        b=am2d/tonGCziKysd2t/tAOhK6U/C4fYVx8sBLIUNeMarz5jlmLkz1jeqUZKvs3hky8
         W9+fC2mI39xkWFWevkpaq8kFJDL9138NfdNEC/DhoEl6g9zA4EhPKPX00PV7Ph5bCa4D
         OtYIX2MRM/R5/wt1NJyqlg0ZswFlFXGKeF5ImxTBRkzrG9kpH9TuucOTRnsAGsI8XkVD
         xzp1DIo+z5IAYnYwtU4XHrfVWXoIdOY0HLEAHl92zq1WERzMfc9Pqogt5OJYw1o9bH0T
         ImDVQza6M4mXiqWCXVyza4CGM+ocherHvujaV0+JeSC9H4t0PLfm5pdn5smtxsRhifwV
         OwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763796; x=1789368596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvX58P+MDa4sWTy74Vbi1oLHS8rHG4kgimKkPCwJ7mg=;
        b=OfJadDJrN++LfVPPbw+tzdTx3ez+2FJQroLOkoQMkXzmdjCg79cK2P2SHG3SNt1f3U
         hn4nG15Mp9GKG+WjbSxX/tY3tdJRdrfWTv0Tzkmo9/WQ+GPxbqEY7LKjeWAmY2NSEbuz
         QhJfs8kzaeWuqSVPHweUzGV1D5F23ACv8EpyGL0d9AxZKC6qj0vn8mEIDX68lWdDMz0a
         nbbxI9rNbyjsIphAWc4qJv0C1C94osShJ9EtjA2xfVL6aRWEDZU8uhSl76ewobjULLD9
         pNMz2InmBgWX5Iq433JwsrrA6NnRkEj3Fd4I3t61iIAkeZxtK5wvcm3+A1c5xyMgU1ht
         vpjw==
X-Forwarded-Encrypted: i=1; AKwUvByY5x/Edi8mO7AX/o8b/feSYHOIJsDQmlIn+AskgXIsKyRd4QMwV2wi+yB/BUaVJj6WI8ZHVOLVFQz+thg=@vger.kernel.org
X-Gm-Message-State: AFuF++kTLlp3ViMWcAKyc9wCpGR5Gql9N/3H3h4ZlK58kXRYmjnL77cv
	IkfRqR+KvQOikKFNtQkskGrAQL87WOOhL3VdNcDb9NHcSnz7k0m6OMun
X-Gm-Gg: AYBFou3wzgDvEq/vrK6yYumb/84m09KSKtfQ8TJQuy5CUFWczu10X/IHcAm9RaNLGuO
	3vfmexnV6Td6LcOwMJD8izB14N7ZXFOR8cYU/TFEqiMCax4cwKK8a9R0L3SNCXfXSlQ3tCnG8fF
	EMMDB4GhnTb4bZfm5in46FcoVsircWJ+5sQjO1LNFQi98q78noAORylBzPcDaxWZFnWUgToJ06y
	MWlb9cgJy9OUWIYckj7nuSpEJLT7Jfk3cwyA1GXsrfKz7qrfAFz/uvq6EKi+qjd/+tvhUtxfAHJ
	Zkcyhoj/VTH4OVbihVN7+my64c6gORruO5DNbBKhkbkrIDtDEQxWBAeSGkZb09pe6PBJcQDTrc1
	ocvI1EynQVoj8XEbg68kG0ed5FukK80M9C80DqJKShcBoOPhwjlLC5vAzKONz9sf2N7VePwabKv
	ClZ/zZ+HRRQ9uyjHRjphw3CYffgSC95zJiManxXnySi//Vr/h1oZBCZZB0Xu6tfyzGyfwJ12BQ/
	b2l0K6rkaOBYnb8EXLEDF0p
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr29785514a91.3.1788763796366;
        Sun, 06 Sep 2026 23:49:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm465210eec.31.2026.09.06.23.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:49:56 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 1/2] sched: fix typo "upto" in comments
Date: Mon,  7 Sep 2026 12:19:42 +0530
Message-ID: <20260907064943.25304-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064943.25304-1-hemanth.selam@gmail.com>
References: <20260907064943.25304-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/sched/ext/ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 713aa26b2828..721f0b3c5c07 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -5840,7 +5840,7 @@ static void bypass_lb_node(struct scx_sched *sch, int node)
 
 	/*
 	 * We don't want CPUs to have more than $nr_donor_target tasks and
-	 * balancing to fill donee CPUs upto $nr_target. Once targets are
+	 * balancing to fill donee CPUs up to $nr_target. Once targets are
 	 * calculated, find the donee CPUs.
 	 */
 	nr_target = DIV_ROUND_UP(nr_tasks, nr_cpus);
@@ -8816,7 +8816,7 @@ __bpf_kfunc_start_defs();
  * task is inserted.
  *
  * When called from ops.dispatch(), there are no restrictions on @p or @dsq_id
- * and this function can be called upto ops.dispatch_max_batch times to insert
+ * and this function can be called up to ops.dispatch_max_batch times to insert
  * multiple tasks. scx_bpf_dispatch_nr_slots() returns the number of the
  * remaining slots. scx_bpf_dsq_move_to_local() flushes the batch and resets the
  * counter.
-- 
2.48.1

