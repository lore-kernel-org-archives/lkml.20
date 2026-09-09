Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD0758E2CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964399; cv=none; b=AS3HQ/eJDqg+EbIhbXl4/xu0vrpui+FhJek4SDnrwRvGsD0F20d644pR9IWdNlrrQqBWT81kpGbutVsbetIjNND6l61YSWbnuNZ/F4Z0XjfGGYINK43JWWmbOqeb8/sUvMq26MP5cR9v9zv7jMf5pDikpBX2MdKBKdiJBs/WCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964399; c=relaxed/simple;
	bh=fntJjqdG2j+yL6RVAB6nKW7v01eU7mQiMAgAsay0h1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph8pISxWmbi+1zofJq+w7iMg0swBCCLF3VzBCOexcbqOfGRKE1Tl21AxSMG7OVTiycvT7WzMhcReU2MXDi/DeRi5tw09oCo9cLrEwaN/oJH0JnLnYL8ffcDK8/o8ACPRh77hTTNqQ2tax2cbE0FtAixYK54Si8JgPPyRn7qhQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BohNoRLH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BohNoRLH"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-86c0e4dd49cso77200517b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788964397; x=1789569197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0bOlfBpQTbQFgfmthpzay0FO8NJ5huTnd0J4hBWl4w=;
        b=BohNoRLHOGPYLbAvslIJAj4o5LgrV6pt+LILH+usEb4XVgKbFTMSPrDCqCnkpa18JG
         vLPDir4wVI9+AhvC6r20JVK9IteSk+HJzAl5f/eUkjLQd1MN/3OUAX79c9r6AiP7W7H7
         RDLOui3vgihdH/RWDMUNYGvY6kT2TwXZ2XGaNzUfmeKUfSPdcytzHoiGtjgXWR74t2mL
         Rgfi+g/gPsgXOHEvHb5nwBde28MkgTFZ9zSnJwcyOIwHfht9czLaIFUtPFsBTUheFcde
         3Dw5jEn28X7fTE32tGra3HYbaXbz9GqqQ4VSO90n4HvjDau/VNmmUE6ZKLZmm3yw33qs
         Uo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964397; x=1789569197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0bOlfBpQTbQFgfmthpzay0FO8NJ5huTnd0J4hBWl4w=;
        b=UP5XAlNx9p1BtuOct3Cll0Ar+3MAA9R/951/0s80x2iyoSuVVgcL3HLm+oErqJFkIh
         65rTTZh0OlkF47ln+OKQiTXCAEli8aD1VZp5p2s6hpRb5tubHfJ+wOiY+AUcFRi9dQlI
         L4wqHCe29W+QqBsyQPBsqy844/eLK6Ol5u+xN9VogZubbM+S7wCaTUiUmI5rl3ClDWNn
         3LJ13uYIXGA22BiSJUNZ6YzQ/C1c3udTcqrX4WYJRqDeN1hr9tt6l9abwsjUfxFL3jSk
         fea27V5dbqSY4VzcEUhRuc3J3WmpPj+JgT5rpoRx/hC2Bspl5qD+L1tx+7cJv98Bpq8E
         +Mew==
X-Forwarded-Encrypted: i=1; AKwUvByglu9dK6rpIowlhN3CjQxv7cwqR7qc/P1Tc3e66mu3hPR4JOsv18YUBNuicxY7y9sNq9l0FmEirKi/WQc=@vger.kernel.org
X-Gm-Message-State: AFuF++lgIP9luS3BGm8f6PZPGJmhPslTE38l1V+ZzAMNKWIRzZTBECTh
	XmSlSI0gaYt5eYjyu5z5uk/t0O9adCdHRBXQFLuUhnsrALE9GDKx9dJvoYirSc10/HMkx0UTZtq
	KJWMghg==
X-Gm-Gg: AYBFou2OiEqlKoTmkPdWKpK2XAG23xUGANbRx+yYuklb6muKMJhCVlPdEDQ4N6oq5XJ
	w3ZJioWUPpRBepBT81AHSA9pwi4PeTJbzXDEXT4FjP9mwY2oE6HTOuWM5dI3iB6LQBegtyTiQZ/
	RBmRpU553h+mlITaerO/Vyu+yYFJuB9Hcy52GwU3TAiAlNXPf4iC2VCNeUBkZrP9tB7lYr0LAZ3
	i1+oxMWoSOO7gzwRW0q5iL/pvKLNMrQ2bnzfSDgACFtHRNrd3FEop3mUDF29qIwVQKtUC1J0T7/
	wisNerKB/1U0zBK4xeOLoFLRxzXaT+z0M1A3uYioRsJvWn6YbgV/X32k4ZiWpTe3M+jrLS1iFFt
	Zj6S0GI9yHg4qVt2y1JUMmprL56bx6j8A9Kf0W1rm+uaV9PEFLPPc6E452uVjGuZMNo6x0CXCdZ
	e0p7ViVWCShrTtG2a4mOd+rII4UE265RLzZrZ1KIdhc30gXlF2eyH+zqw/hElQLwOkVeFWGG/H4
	wUtt+T36SX1+g/iTQ==
X-Received: by 2002:a05:690e:488c:20b0:671:27a:df14 with SMTP id 956f58d0204a3-671027ae48fmr1087364d50.20.1788964396777;
        Wed, 09 Sep 2026 07:33:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040679e13sm145160216d6.26.2026.09.09.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:33:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:33:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, boqun@kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>, stable@vger.kernel.org
Subject: Re: [patch V2 1/8] signal: Prevent exec() race
Message-ID: <285fa0e6-0ca5-4cd8-b0f5-819d44583fc9@rowland.harvard.edu>
References: <ap6urw5aAxrKO3Ck@localhost.localdomain>
 <87ik4h2icz.ffs@fw13>
 <ap8bUiYYwQT1nVg5@pavilion.home>
 <875x0g3de3.ffs@fw13>
 <ap_gOSWtPNjwWS1e@localhost.localdomain>
 <20260909080407.GR4121339@noisy.programming.kicks-ass.net>
 <87ecf223n4.ffs@fw13>
 <20260909095518.GL776954@noisy.programming.kicks-ass.net>
 <aqFNV4k6DcbyxYCe@localhost.localdomain>
 <20260909124555.GM776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909124555.GM776954@noisy.programming.kicks-ass.net>

On Wed, Sep 09, 2026 at 02:45:55PM +0200, Peter Zijlstra wrote:
> On Wed, Sep 09, 2026 at 02:13:11PM +0200, Frederic Weisbecker wrote:
> > I didn't know about all those UNLOCK+LOCK properties. Well,
> > I know that UNLOCK+LOCK on the same lock, or on different locks
> > but the same CPU, equals smp_mb() except on powerpc. Which is why
> > we have smp_mb__after_unlock_lock(). But what you describe is quite
> > different.
> > 
> > Is this something that we should expect litmus to modelize?
> 
> IIRC these commits:
> 
> 6e89e831a901 ("tools/memory-model: Add extra ordering for locks and remove it for ordinary release/acquire")
> ddfe12944e84 ("tools/memory-model: Provide extra ordering for unlock+lock pair on the same CPU")
> 
> Were supposed to handle:
> 
> 	CPU0		CPU1
> 
> 	UNLOCK(A)
> 			LOCK(A)
> 
> and
> 
> 	CPU0
> 
> 	UNLOCK(A)
> 	LOCK(B)
> 
> respectively. I'm forever confused by the actual CAT stuff, nor am I
> particularly adept at these litmus things. Boqun, Alan?

You got it right.  The required ordering is that instructions before 
(and on the same CPU as) the unlock are ordered before instructions 
after (and on the same CPU as) the lock for read->read, read->write, and 
write->write cases, but not for write->read cases.  Furthermore, this 
ordering requirement applies from the point of view of all CPUs, whether 
they access the lock variables or not.  In other words, the ordering is 
required to be RCtso.

This ordering is weaker than full smp_mb() in two respects:

	As mentioned above, it doesn't order earlier writes against
	later reads;

	In the WRITE->WRITE case, the guarantee is only that each CPU
	will observe the first write before it observes the second.
	There is no guarantee that _every_ CPU will observe the first
	write before _any_ of them observe the second.

Alan Stern
