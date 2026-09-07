Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8B4483A8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771947; cv=none; b=cV46eNkAY7NS5YBhwcnwq/H7TDK3B4MSAsyMlB1UiXL2ThmjZpnE0Ssoms3XuGg+Lv9P+AHiLILgccYo5Vv/tudSf1PYpQy5bpgJrABlrvby4gQlnroNoI+9fvt2NSAZdqaM5/b0caD1sq46nMxV/P8memNTON3oL8LFasD1FEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771947; c=relaxed/simple;
	bh=1eVS5uD60QPYpABVEGhMCGJNQQppnDHNMyOksWfVyTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+vv9Auj/EAl0lKk1FmSCNOyitwE6PQTjAhRSniYkiKNrgRntNR7iuJKFbKE2qXTULR3Y9AYV9TGR3p8/TXdsTmVbVNQUiWQ6ZXbV2K+47bj2M1r//++3r9WpS6SDZCaWqKBBNKGBkYaT96QSkNWidV8j8b91zK2B0t1uv4NSy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GnyjABqr; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GnyjABqr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788771941; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=XAZCB/JSnsa6CNFoadw16hmFlCD2ZNIeJ8J5+0i8ygY=;
	b=GnyjABqrh6uZq+qqT9uXSWdp9oofCnIeHj+hhUSG6/2FyEljwphIX+bDQXFHbo8SoyaRItp4J7xPN/eDa73WL6j8cW4JPgKHbM8mRFu32AGHBdpOc7WYgtZoPb4/A9iTw+IAsG88YOvxnj7oqqHGxuYbpAeKsF+ZvdF4aVwYKg0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XATAmvQ_1788771940;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XATAmvQ_1788771940 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 17:05:41 +0800
Date: Mon, 7 Sep 2026 17:05:40 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <ap5-ZM-2RMih3iQ7@U-2FWC9VHC-2323.local>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
 <8733vn5t6p.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8733vn5t6p.ffs@fw13>

On Sat, Sep 05, 2026 at 10:39:26PM +0200, Thomas Gleixner wrote:
> On Wed, Sep 02 2026 at 16:21, Feng Tang wrote:
> > Locally, it did help on chasing some RAS issues which needed cooperation
> > between kernel, SCP firmware and ATF, by mapping the actions from each
> > players into one timeline based on the timestamps in their logs.
> 
> I told you before that we don't care about your bug chasing war stories
> at all. Educate your firmware people and stop pestering us with your
> firmware debug hacks.

Hi Thomas,

Yes, this patch is hacky.

From the reply of Marc in this thread:

"
I really have to ask: why isn't this just a one-off sampling of the
counter, kept in some user accessible location (debugfs or something
else), and ultimately post-processed to align your logs? People have
been doing this... forever, and that has been "good enough" so far.
"

IIUC, getting an absolute timestamp for logs is still practical in some
cases. How about adding the offset-since-reset info into the message
like Marc suggested:

---
diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index f3aaef695b8c..d5a54276b49d 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -176,7 +176,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 
 void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
-	u64 res, wrap, new_mask, new_epoch, cyc, ns;
+	u64 res, wrap, new_mask, new_epoch, cyc, ns, reset_ns;
 	u32 new_mult, new_shift;
 	unsigned long r, flags;
 	char r_unit;
@@ -235,8 +235,11 @@ void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 	/* Calculate the ns resolution of this counter */
 	res = cyc_to_ns(1ULL, new_mult, new_shift);
 
-	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
-		bits, r, r_unit, res, wrap);
+	/* Calculate the time since last counter resetting to 0 */
+	reset_ns = mul_u64_u64_div_u64(new_epoch, NSEC_PER_SEC, rate);
+
+	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns, has run %lluns since counter reset\n",
+		bits, r, r_unit, res, wrap, reset_ns);
 
 	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
 	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))

Thanks,
Feng
