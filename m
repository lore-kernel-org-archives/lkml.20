Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6682D1F7B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741955; cv=none; b=BZvPdEPJTEAXKbtqkNKGLolGaaxnpXbPhs+ghtotEQC1ABOZT4PV/ijha0CqCLX380H8LESS8nb0kxWbdH4YD1H8/yLuXslbM8CE3hFyFhchpDLOZf2HZ4zfkMYt/Zq1N4OEw4fJV8qYRBMIa+9ZNTEh9GUE9p6cZJ3CcQsLFMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741955; c=relaxed/simple;
	bh=CQALW02Bw6EgY+Vkrvm5u+HSWHMVu+co3R+Z3tCagL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEWxmjy9ZfsXOe1gH2EL2mX3GM99RO6JCnmYkg1jjlHHvaUfodWZ3YI1MNMK6qW5PBUT60yEr+dr2pbYPxC+CWj8d1zWKcUFtNL2o8icVUF33GEPBOrDtoLJtUKkrHFBbMG7NV7d1z0fDhAFCvWOOAM+RyYIYqwVYlricJsJ6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4IuyXOq; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4IuyXOq"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8b0dso640283b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789741951; x=1790346751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQmGJgE2Cjr7TfgtQoudFuhaqKbLVncSFW+Ruq92ZCc=;
        b=Y4IuyXOqvoesxLZiQTJB56SXndTIl5qOaIAW8lc/0M1lqMTzr+Dt5gfBxnEe7A/SKl
         tBjRCjjw3GRimbblmTvxYpaqhG2BPkP/vZP9dziH1cV9X9fV3mO+jjR+zHN3RaB/fi3a
         v1cZA5DwFHhARkLq7KiJx++IEwkE9WzeM+OWV0mOupuH2Un5j6dKGxH2jG+gPehJLjPo
         sOUnul9x0XghvZIvPFyqdxRiCsiqCTJjhfDjlPrn7Z14PpVpAHAwyc+MGaPeWpBVZvLE
         zMtAfFCvyCFdvmMC0hvuYSs5aRnUW5FoKhE7zKKZ0oFWg6KMADdbWDat7FmOSrAJIfo8
         6FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741951; x=1790346751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQmGJgE2Cjr7TfgtQoudFuhaqKbLVncSFW+Ruq92ZCc=;
        b=kIoK/5W0pMcvs+u7EVxevg0QEFfl/nPYTwOzJY30sHuXAek4lyUAhD5rdSQ5e+Iz5L
         hlmRRp6xiiRPtOdWccXX7cUEIP0Yj6QF5RgHyCZBV0Q3cW1ntKfXPwTOPNosxB/kiTVH
         LmHRhosKJL+wdw0VdBySwpxEZXjZBgJy0fr7y1ZpBV1eDNTk3s/NbhFMcXTOgTtj3YGz
         neQFqHr+7U2uoLARtHquYEuZSzjBy6Nq/IMmdkPNknl0FHDIcxqrv4vZ2KDu9/Cbfc5n
         U0AFf63ECJw+ACqHsZndVrKnjDS/WhPbmNxtVVD2SfVlJOIvB20Uwvrq7YNOhmWTsbvG
         WBJA==
X-Forwarded-Encrypted: i=1; AKwUvBztJGUjoTH1xUfQHVv7Qc0klUKquE6QV+IQ1+CSRPXJKkudxLfF/SIpSbTRCRJF1QdAGUOGzbY4wQFZ2mY=@vger.kernel.org
X-Gm-Message-State: AFuF++nOoV8r9O8QGYqjbce1sVDgzppjgG6icZU/S4pzTTZuC44KF5t3
	+6VWrfVgtaNPvStlQetVu82bV/64qoDfNzCC3XE3lECoLlj3xg1GpPP3
X-Gm-Gg: AYBFou0YEvoJl7IJVZFwB42+MpmB8sB47QgiMYXxARxakJXPKQopf/tsfkHXV2Pv1fC
	OlIs1KqJQnTTNpSs/NC0o2nsqtqXgbzHhwBzLkAVD8KntkYMCfvxr6w7EgRWhC1SwnY6CebU954
	T7WNqJTXO4Vns94pwcCpLKDFd0qdIGMrkr7M2mToxQFn9/AUD/B3acFaoz+IBJyUnk2cB3nfZh6
	Fw8KjBh3ynCoR74Q2lM2XDLBBgfTp5mtUe3VqAyv7ZDvlQqmTBtL4/JgkIualbRn+VWyFo11oa3
	qi60pdpWs8q0SQaoZjcYkTIxVUShwznffgY98CDLENW2wNRB2tWcBQ7bTrXcFo3bjbd1vP7ffny
	3btn+yPpDDIKLUKpLeUThvFehdOSNRnHaTnNC6+pC4Dq4OgGvRS+A2vcPy2XkuzRy8l9AROAlN6
	HHZgrOaRNpN2ammKj90r7coSSX/I/VistIqXIhEpRViOgu9PX7XqHpmkuesOX5p5w=
X-Received: by 2002:a05:6808:5092:b0:4c2:dd8a:fa46 with SMTP id 5614622812f47-4ccf642cfedmr3841440b6e.16.1789741951460;
        Fri, 18 Sep 2026 07:32:31 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e42815ff2sm1615667a34.3.2026.09.18.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:32:30 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 2/2] uprobes: Hide unprepared uprobes from the breakpoint paths
Date: Fri, 18 Sep 2026 11:32:09 -0300
Message-ID: <20260918143209.709291-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260918143209.709291-1-adrianox@gmail.com>
References: <20260918143209.709291-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_uprobe_rcu() backs handle_swbp() and handle_syscall_uprobe(). Make
it skip a uprobe whose instruction has not been analyzed yet, so neither
path can use an uninitialized ->arch. An unprepared uprobe has no
breakpoint installed (install_breakpoint() prepares before set_swbp()),
so the trap path treats it as not registered yet. This also gives
handle_syscall_uprobe() the check it was missing.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 kernel/events/uprobes.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 686585539ebf..bdc05fdce0a0 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -924,8 +924,20 @@ static struct uprobe *find_uprobe_rcu(struct inode *inode, loff_t offset)
 		 * try again as we might have missed the element (false
 		 * negative). If seqcount is unchanged, search truly failed.
 		 */
-		if (node)
-			return __node_2_uprobe(node);
+		if (node) {
+			struct uprobe *uprobe = __node_2_uprobe(node);
+
+			/*
+			 * A uprobe is inserted before it is prepared; do
+			 * not hand it out until ->arch is usable.
+			 */
+			if (!test_bit(UPROBE_COPY_INSN, &uprobe->flags))
+				return NULL;
+
+			/* Pairs with the smp_wmb() in prepare_uprobe(). */
+			smp_rmb();
+			return uprobe;
+		}
 	} while (read_seqcount_retry(&uprobes_seqcount, seq));
 
 	return NULL;
@@ -1123,7 +1135,7 @@ static int prepare_uprobe(struct uprobe *uprobe, struct file *file,
 	if (ret)
 		goto out;
 
-	smp_wmb(); /* pairs with the smp_rmb() in handle_swbp() */
+	smp_wmb(); /* pairs with the smp_rmb() in find_uprobe_rcu() */
 	set_bit(UPROBE_COPY_INSN, &uprobe->flags);
 
  out:
@@ -2743,23 +2755,6 @@ static void handle_swbp(struct pt_regs *regs)
 	/* change it in advance for ->handler() and restart */
 	instruction_pointer_set(regs, bp_vaddr);
 
-	/*
-	 * TODO: move copy_insn/etc into _register and remove this hack.
-	 * After we hit the bp, _unregister + _register can install the
-	 * new and not-yet-analyzed uprobe at the same address, restart.
-	 */
-	if (unlikely(!test_bit(UPROBE_COPY_INSN, &uprobe->flags)))
-		goto out;
-
-	/*
-	 * Pairs with the smp_wmb() in prepare_uprobe().
-	 *
-	 * Guarantees that if we see the UPROBE_COPY_INSN bit set, then
-	 * we must also see the stores to &uprobe->arch performed by the
-	 * prepare_uprobe() call.
-	 */
-	smp_rmb();
-
 	/* Tracing handlers use ->utask to communicate with fetch methods */
 	if (!get_utask())
 		goto out;
-- 
2.51.0

