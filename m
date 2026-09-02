Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC1545A2BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345452; cv=none; b=OZPRALEP6bBuSs/ldKNpXYumNYNZN+NesKQO/WCRDbjPGI/vKgIK0MaHO4Fu0ZTlHfsxezC1W29oavGO5o3nr1LtOKKEz4PNVbPKRHF181Yy1cCXD0LfuCHq8A1/g0WHFFAhzlk7hBZsWqVP5C+5ENO/rbRPSwfFoBOwCz3JLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345452; c=relaxed/simple;
	bh=fT7IVu7aFVQfQr/L+icXE7NMgFptEmRr1+y6ErHWrPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIfRpqvZVazCy+z/VeFKkNTgvWGLAWHOzo91Lxlg72jxJqf89tHp6tZUhpap9rDNwFDX13rVnDJ705c13r6mvfrQFPCaZv9/c9EwTN+DICw0JajOI9ZlNBLC86jGD2DoqsDX7Yc+Zkzurb2j7crGnBGJWsdogJO4XuUGmJVv3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I6YdpxZW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I6YdpxZW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ETO3mB1C7LiuFbXXbTBEqUN6KDHlx2zGjrBCITzqSfg=; b=I6YdpxZWyT2BLy6d+NogBCWz8P
	5TYj7OcEWwXxDZ8LCH+W8j9S3167Opp8mWBgcbOQdhUEkNOcvZrsFYF7qN5BVKKFiy6AuBYoBTEjV
	R2Ec7VIl8NUgUHhzvTFTJwf7t9UIeblpnkKeRzxhOZgZj5cl8MR4qDkuFEqNHyOTqbf9VqCmajW84
	+zj+UeduJtJNe6ltU+cLKjAFIKHW3pxd3ttKOPRIql18IOOsGZOllhPGBAm88CWhc0owWUOSvNLnN
	mJwQF5sb7KH1dWm1WxD8nE1pcMkHNYle75T90Dy4j+cT6EOJCqMduJ8xH+BpIObykKjGUfuKbb7/5
	AgVE9rSQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iKt-00000006rdc-45P7;
	Wed, 02 Sep 2026 10:36:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 095C8300FB6; Wed, 02 Sep 2026 12:36:54 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:36:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>, mingo@kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	tj@kernel.org, linux-kernel@vger.kernel.org, chen.yu@linux.dev,
	tim.c.chen@linux.intel.com
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260902103654.GB4121620@noisy.programming.kicks-ass.net>
References: <20260828074059.232353141@infradead.org>
 <20260828075558.660152190@infradead.org>
 <apezcsScwu5hdNrr@fengwei-dev>
 <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>
 <20260902081301.GS4120091@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902081301.GS4120091@noisy.programming.kicks-ass.net>

On Wed, Sep 02, 2026 at 10:13:01AM +0200, Peter Zijlstra wrote:

> Let me go and try and reproduce.

Different physical machine.. *splat*, virtual machine it lives. Argh I
hate computers.

Anyway, confirmed on physical machine that triggered it, the blow seems
to cure things. I'll fold it in.

---
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15287,9 +15287,6 @@ static void set_next_task_fair(struct rq
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 	}
 
-	for_each_sched_entity_bl(se, cfs_rq)
-		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
-
 	if (throttled)
 		task_throttle_setup_work(p);
 
@@ -15309,11 +15306,15 @@ static void set_next_task_fair(struct rq
 		 */
 		list_move(&se->group_node, &rq->cfs_tasks);
 	}
-	if (!first)
-		return;
 
 	WARN_ON_ONCE(se->sched_delayed);
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
+	if (!first)
+		return;
+
 	if (hrtick_enabled_fair(rq))
 		hrtick_start_fair(rq, p);
 


