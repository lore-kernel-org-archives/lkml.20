Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263C3515C7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789247358; cv=none; b=KBaikCF9BVM01lNlzkVl08+DUr5H0HOFqRojIaNJtZbaxwe/SK9RcKzYqxy1MLiXIStNUIn6jMzp16kocDT4bMHeZPM57NMucLk0GRux7vQabJxQItkgQf7PkEtjob1mgbsW3bWPDUqq9wG5s2VJ/Mn3PvsMbITXqa4bP4PaeHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789247358; c=relaxed/simple;
	bh=j4wvyXGkZnRPWSEpzxIlzwr4OCUpO/FLREsU7uo1AHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky7kzeeQTwCP/AGnVY3AJ62LEtNC6sa44bFkmh1pJ4tde0t0M+FjXw1pC/42NrQX4nKeuIg/4IO2lIvUGjBYkePSYCXlLRWvVp/sA16lZtyMbSiFJZNaOa84kCc6NtPbCNytFUqeihdgscVGLTTnZfgdBDaMlGGBidfxa/n5Mc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKpC9NHr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKpC9NHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A731F000FF;
	Sat, 12 Sep 2026 21:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789247356;
	bh=DILXPtS7lOGZqt12513sDInHNRSeU0MZe87J4DW5oi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKpC9NHr3KLJUk6ukegCet2KgEB4ZqlAjA45L1FsO6od6r/Dr5wn3KjSbNpcwNg2P
	 X0XUoIH47LYFx/0Ue4Raq42sV0SgOEd8w4BtgX/TJK33cCBcm+j+EkvtoQvROSCGdK
	 8nf+UeS7nABHqYyridllP6DmP9Z2lPACOMR0pLOujJAOM1h7TaOmuboQY/PlYbsMb/
	 loKvIjSe6DchZkdyLMnKTh742Z60ML+XmsXbNBm9Z8z6rYb+riKDs4D+5lE0vCBi5O
	 le7zGSO6CE31xLfonAFBrTan5DyxaaWC7xhZgADrQu3Ioho55vnwba1EN5XxCJmR3O
	 k/4KIKZQIYpTw==
Date: Sat, 12 Sep 2026 23:09:13 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
Message-ID: <aqW_eWURNJYtFwmB@pavilion.home>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.892445443@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911090541.892445443@kernel.org>

Le Fri, Sep 11, 2026 at 11:09:40AM +0200, Thomas Gleixner a écrit :
> From: Thomas Gleixner <tglx@kernel.org>
> 
> To prepare for cleaning up POSIX CPU timers in do_exit(), prevent
> enqueueing POSIX CPU timers on a task which has PF_EXITING set.  Queueing a
> timer on such a task is pointless because the task won't expire the timer
> anymore.
> 
> The same applies to process wide timers when tsk::signal::flags has
> SIGNAL_GROUP_EXIT set.
> 
> Pretending that the timer is armed allows to keep the POSIX timer mechanism
> "working" so that the timer stays accessible up to the point where a task
> is unhashed.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Reviewed-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
