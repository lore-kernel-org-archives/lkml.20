Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53830483BE5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462221; cv=none; b=PitrKItRMag7H+7XxYqF1T7HOfI3e8+DX1K0iFPAx+aNVi3Tt8QjwS4XKWDb43cefPtfNgs/64ab4THZkZ+olcpDBLEs+0ZMSKBXwCcqQamlkX9oQj8MaXSUUz7ERBd/jeWx5rGnLMW3SHm0MFLxSY1Ycr+IH8DIYBVHyyAzq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462221; c=relaxed/simple;
	bh=pQDFPAA7CErrLBTkf6/TfHLgWPyKA9QFMI0nUOpHBkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWQ545zrKzy9bfk9HrCvnuTEQu88Mws/qk1yDiFAn0JEXkGw0tvdvHWV0uJyweXLZIaha80vgpQC7D687jwoF0JtYncFqmwudTbqKuppv7oZh4sQRJWuuhF5meJcBvEKJvPEoSC0dbdF9OkylQBbZ2B2o2s6wasIjzhPkJhdxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TaKSnQBy; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TaKSnQBy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=641Crc8nLk8TZVaCD2qMjUbwklDFLaeiYHl3S71WH14=; b=TaKSnQByTJWixfGKTHAgQDbojg
	henUuv+Bqeqflh00+/vxD+2lfOWRUMfvNNMVlal5U29bkEy7JRpOoCzL49v5vvBLyeD9waM/rk2U3
	dMyA3Y15Sqitq/+rk3lVyle+URX6uHQJYVvVZ8Laq9rCpj0oIz8PO6EIJdrtbDPLOmXwDwodVPhVl
	JH1bhxLC96W7nEpoNEiP351rdWVRx0xxCRho7qzkXg3xw7Cc3IMDxAXlPc8BqBTkRiIAKkXxj5CP4
	sZ+NHtoDbBPS6UvO6uyB9p8BtRrum0SaICIy8ZoTSqWjBePuMcZXDXEna9LJtJDKh3ekfcPHbcSFh
	bkAIoqlQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Orm-00000006SOP-2wjI;
	Tue, 15 Sep 2026 08:50:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F14603012C6; Tue, 15 Sep 2026 10:50:13 +0200 (CEST)
Date: Tue, 15 Sep 2026 10:50:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915085013.GA4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907084133.3696-4-david.laight.linux@gmail.com>

On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> There is no need for separate prev_cpu and locked members of
> struct optimistic_spin_node.
> Using a single field simplifies the code slightly.
> It also removes any possibility of the two values being out of sync.
> 
> When cancelling a lock request explicitly set prev_cpu to zero.
> Nothing actually looks at the field, but it means that it will be zero
> after a subsequent 'fast path' osq_lock() call making things consistent.
> The cache line is likely to be dirty (or be dirtied) so there shouldn't
> be a performance hit.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---


--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -170,10 +170,11 @@ bool osq_lock(struct optimistic_spin_que
 	 * is per-cpu data the memory can always be read.
 	 */
 
-	for (;; prev = READ_ONCE(node->prev)) {
-		if (!prev)
-			/* Lock acquired */
+	for (;;) {
+		if (!prev) {
+			smp_acquire__after_ctrl_dep();
 			return true;
+		}
 
 		prev_ptr = decode_cpu(prev);
 
@@ -185,8 +186,8 @@ bool osq_lock(struct optimistic_spin_que
 		 * 'prev' must have unlinked (or be in the process of unlinking)
 		 * itself from the list.
 		 */
-
 		cpu_relax();
+		prev = READ_ONCE(node->prev);
 	}
 
 	/*
