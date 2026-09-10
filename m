Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27352ED5D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065194; cv=none; b=mSK6FoOeCmfCaBY1BR1pskqFVXdRPpGYJLkuAW60klnKvf/JhZu25dbahM/dhV7zW3qtInqKiVqhozHqOWpWPSbJ0uo5L3M+P1lL4BZgrpB8itE3fmYnuQ4kkvRzejbQQWiS9sHCyds1fjF//Szk/B+UzC3/mjJCEFo9zSR9Jmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065194; c=relaxed/simple;
	bh=3nM/7LI7olnSJqPMrKJo8aFg4AW5OoqFi8DNd+317Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMIYAW1HcRMgvOpT23kX5p4Wp6UUGwCHx+Wzo/WZkPFnVhc0CjdfH8VijzFdeuxwB3JGXu3Nd8MLVOCghG9FjBXbLMRTwS/QOR6c+ub30EvoIy2i+47v18ycj0QuNkArSlPPR4w7SEWDDsMJpZuCf9ZR9DDla8i7vKsvTeKL3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osh0MPFc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osh0MPFc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499de29beb7so127055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065186; x=1789669986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ost6d0L83lIoeZ+lEEXbmuX93WTw58C3/ZwNuzffpI=;
        b=osh0MPFc9cxgmfb1CnDiMrCdC9tWwLfLZn/pp8Qe4Oub/GMcasoh0AJBH7+udkdYEX
         WdJVGieVYt+g59EeyCkxHJdx07kT9QIplTFoH6850IZn5Ylzc/ni9woXLAGLYh2EmOvY
         O0wtZ4rlkEYv/OlZLmlc1GH4D+F5YwcJW8Pf4pmk5S8lCcqufLOWlumG1lcsEpwBD18T
         a2meG4EtCzgXsOaZq3ocFlZPq/Qq74vdt6835VtCbzY4dR+44sHElo4/nCSwOfQSMa6c
         GQgz07QyFhdR+GbecDMaRRmle2BuA1LdxhyLiLwLBWd6rTcqmkRFWcfjj8n3Cqw1Kai0
         u78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065186; x=1789669986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ost6d0L83lIoeZ+lEEXbmuX93WTw58C3/ZwNuzffpI=;
        b=KpfBO3hHc7oGTwgLgipDx9L5HxJWYktogPxwfcb06HUHroaTAznp4ronh3Zn723Qcv
         sqdJTF+0gkCHCeIsFXRE539foB0rpRMwKgrCTmQTiF9rEnhL3H0G1c6JH8PjPtaurv7h
         r4Hb7Ui3ZMBQkFkOK6WB0PgRuLEF9WGqOdwC2zQLCttiC/368E/VXGQ2B+2efmykvpWy
         WBOJUAO3XIE3myE6dl3hcV2h9FAyTBTNJRlX5lEvdrB5ME7KGLhM3bb9rDZTuEsAqXOY
         40cKUqkcPIsBBzIx8pDkVrgfXFns0dw5j3Bql5sMvCg2vz/PzBzxq/CKLhj0n9b2yUL5
         TdeA==
X-Forwarded-Encrypted: i=1; AKwUvBylGKtqe2IwW/gTP5qsPBkFcaWwCfxVg/d+mH4k6vlfmCXvASroMKnZVucKfoS6SEko/C1ODiwmXTQokk4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXaESoDC4mf9mhkCQn75V/YY9KxhO8VvK62/u80CHKNSwXRBp+
	cJwQqBzEjrdzIzsIhO5dfTC7M0AA/98hkjjbKbCr5q/zQ/KtL6mn65hC
X-Gm-Gg: AYBFou2bdvqJWPJD18U1pOY6SGGeoKDNPQbCsG1IH5njmcbnIWlMJisxWoiAjYC8JDR
	7YJrW3V04tpS9vfD+jXm5sgtk1/XbUOatQObh+w5H6lLbMzG4yY8AI2kbG0jKkXJPWUEVzMGOyl
	FjqwuNO1bloJ9Q4Zr3jZOwmskP5NmP8ilpGVAw46tQwLIo0uYG6BpgnArJGKALvIR9D6pdO03hE
	Hgm3H/uBpeG1qr1N/5mSHwgZoH6YYV0SE5rgLYjy44a3gw1WHiAXN2312IRH+ZVhK5pzyKH4S7Q
	994301FZqEoDk+g4VfPNpD4umD43UKAb5xI/aF92TJpNOtCInw5xIBuI7WIP22XcaDu6fl3grJj
	YVqD8AvzOYAjIHBebzeYqLL1J8AwGuKdOHLtH75kLgAryVell8jAqZpbwvdbepzJF54/iR9zKgE
	R4C14pHtZHyLYakR3frwHMwv7nEPqU3mOA4w/dlQFL2AjXlxwBJFjMg4knOmG8eNeu9Ghfcafts
	8MRfR1X7mic/b7mGuT+/DZbMfp0yJu1
X-Received: by 2002:a05:600c:4688:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49e619ec129mr2824565e9.2.1789065185924;
        Thu, 10 Sep 2026 11:33:05 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5765152asm40701325e9.11.2026.09.10.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:33:05 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: brauner@kernel.org,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	imv4bel@gmail.com,
	jack@suse.cz,
	juri.lelli@redhat.com,
	kees@kernel.org,
	kprateek.nayak@amd.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	qyousef@layalina.io,
	ricardo.neri-calderon@linux.intel.com,
	rostedt@goodmis.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vineethr@linux.ibm.com,
	viro@zeniv.linux.org.uk,
	vschneid@redhat.com,
	wanglu.priv@gmail.com,
	yi1.lai@intel.com,
	yu.c.chen@intel.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	ziqianlu@bytedance.com
Subject: Re: [PATCH 1/4] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Thu, 10 Sep 2026 21:33:01 +0300
Message-ID: <20260910183301.1208504-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <82736e1329bf8ed195bbbc4990486c87094e6789.1789061845.git.tim.c.chen@linux.intel.com>
References: <82736e1329bf8ed195bbbc4990486c87094e6789.1789061845.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello :>,

> alb_break_llc() decides whether to break LLC preference during active
> load balance. It does so by testing that every runnable fair task on the
> source rq prefers its LLC:
> 
> 	env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable
> 
> But the two counters cover different sets. nr_pref_llc_running is updated
> in account_llc_enqueue()/account_llc_dequeue(), next to cfs_rq->nr_queued,
> so it follows queued tasks. h_nr_runnable is updated in set_delayed()/
> clear_delayed() and drops delay-dequeued tasks.

> So under DELAY_DEQUEUE, a preferring task that goes to sleep stays counted
> in nr_pref_llc_running while h_nr_runnable falls. The equality then breaks,
> alb_break_llc() returns false, and active balance is free to pull a task
> off its preferred LLC. Active balance only moves runnable tasks, and this
> is the only LLC check it consults: once the stopper runs, LBF_ACTIVE_LB
> skips the per-task test in can_migrate_task(). The runnable set is the one
> we want.

> Fix it on the counter side. A task should be counted in
> nr_pref_llc_running exactly while it is both queued on its preferred LLC
> (pref_llc_queued) and runnable (!sched_delayed). Define that membership
> once in task_pref_llc_runnable(), and adjust the counter only through
> pref_llc_running_inc()/pref_llc_running_dec() from the four sites that
> change either input: account_llc_enqueue(), account_llc_dequeue(),
> set_delayed() and clear_delayed(). Gating every update on the same
> predicate keeps the delay, wake and dequeue paths from double-counting
> or underflowing; see the comments at those sites for the ordering.

> nr_llc_running and sd->llc_counts are not touched and stay on queued
> semantics.

I have one question tho, can't we combine the checks with h_nr_runnable? On the paper
if we are updating h_nr_runnable we could check if the nr_pref_llc_running can be 
updated and update it if the condition is right. Because, every nr_pref_llc_running enters
h_nr_runnable while not every h_nr_runnable enters nr_pref_llc_running. 

Why instead we just check the nr_pref_llc_running's conditions on task_pref_llc_runnable()
and call these dec and inc functions after the h_nr_runnable updates. Wouldn't it be clear that way?
If possible?

Thanks,
Kayra :_:

