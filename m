Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481867;
	b=aLdBwqM+r/m66BxkqdwCjg7R8JRaScL0ccBG2k8NjtbGOugpCUUlIllS7UumI142BVqk
	 Q2DDaiOGLVh3ZFYrJFuo4JzltcidIBmzTlzokbKcgwfg+cR/maQ6unuGn3KAXmggGLdf2
	 uTmvZ+fFpFQ2yHUOUJDknBGvizapwE06oX1+uzuqm38QCUib2icbsULsm0Av3eyPDES7u
	 jJDqUtokzi9TCXOaz72B2GyDY1D+ej5hWfslQ3rCdOYB8wPkB8moz6H6Q6yZQFoMXsoEf
	 70fBb36fF/WNp8EsOmNEuH7HlyFV9AGwdw9oXEO+009S5XUe26K39mhRL12x3UwKh1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=94XR5gOk8DlPYDFwu+IBAqEZksNGwvd6rrUPYI6phV0=;
	b=J89yKRS4HUnWbaVGatppLhruWeDa3Ih6BfHyFcHEAee8XbyHQQHl6cR9oLkIl3JEFbfQ
	 WSH/ElOu7T2myVbEaktpJ9eW6IWtsehFujXNJTGhUHnO2eboMWAleFikqf1+d77pTKvvg
	 79XgzXezZ66H3iYECgzzQeq4Qzk05Sp88ab5BdHGtab1jHHlmNksRhR8PbDNiCLi1dit4
	 5JYFEwXG2V2z2wE2b2s49YOCGP3Fonj1PwsIFPPQOmMgQxVrKnR2CVbThTb6lPPgdc4U6
	 EWk/gZc+R73NPILc60JDRSsTgxuASuMJlpAs5V490CmpQ6hWsqF751r/IwPMhbHjxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WuFV0D4I;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC18606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC18606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WuFV0D4I
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=94XR5gOk8DlPYDFwu+IBAqEZksNGwvd6rrUPYI6phV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794481863; v=1; x=1795086663;
 b=WuFV0D4IDTJHZIBsD2JEUD2SF6saq5ozXTLrdBP1x/JVwnk/ocPbJH8QSzHJoyt3pemLOsjI
 GLl7+JKnbBYBZpehchfo4JF5ZgLFYYVBKEGBKPpyY1aSC21Hebl1a0XMYDdp7QztyzkfviRbvRI
 T6Y1ardMbJVI2ia0tbyh64aQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b717040691903752;
	Thu, 12 Nov 2026 11:11:03 +0000
X-Mizu-Trace-ID: b717040691903752
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Avoid re-syncing runtime_enabled on root domain changes
Date: Thu, 12 Nov 2026 06:10:55 -0500
Message-ID: <20261112111055.400697-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105624.GM2668804@noisy.programming.kicks-ass.net>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev> <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev> <20261112105624.GM2668804@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 11:56:24AM +0100, Peter Zijlstra wrote:
> How do you end up with 4k cgroups ?!? That's wild.

It is common on hosts running AI agent harnesses: every agent sandbox
gets its own container, and each pod and container has a cgroup with
the cpu controller enabled, so a single kernel easily carries over a
thousand task groups. 4000 is the upper end of that, picked to show the
scaling.

> Also, why do you care about the rebuild performance? I'm not entirely
> sure it makes sense to add data for something that 'never' happens. Do
> we really need a new member variable for this?

On those setups it is not rare. Agent harnesses and KubeVirt both
hot-add and remove vCPUs at run time to follow the load, and every
hotplug rebuilds the sched domains of the guest.

A rebuild runs rq_attach_root() on every active CPU, and with the rq
lock held and interrupts disabled it walks all task groups twice. With
4000 cpu cgroups on a 32-CPU VM, one rq_attach_root() call takes 188 us
at the median and up to 938 us, against 2 us with both patches applied
(20 partition switches, 1280 calls). So every rebuild leaves each CPU
with interrupts off for close to a millisecond in the worst case.

The member is there because rq_online_fair() can't tell a rebuild from
a CPU coming up: the CPU is active in both cases, but only the latter
can have runtime_enabled out of date after unthrottle_offline_cfs_rqs().
