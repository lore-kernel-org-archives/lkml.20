Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C3480979
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469109; cv=none; b=BF08Qo4iSDj5ZFKsDbF1wVfFlwj0eROWre3cnTrRtTuTo/KoB3hkz87HXk/qc2RO+Li511MBZzUZAApsfqeSPugwMTAQuuOLoS4d8zikDV4ma6+MmnYqBP1Ub/qjqw02BpgcAv5IAJrES2nSzzKd+1v6G8Q4TaOVZd6QumlATSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469109; c=relaxed/simple;
	bh=dO2BKQ1zUAOjgfuLGVnCNjWkk132BN+JffoedYEU/Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrJLXWVfxl/AJZMTcmVPuBgKoA0oKwIKq26lVN3ChpeIQqSiheHC8Y6qORSWWuoxGvDYlNbirZjelkg1EapXLjEPvJd2Rw9E/dkLp8yLXBQIi14lMD+ePnrtpzTmU5emut+YHghskt3rMWKStMKOtoxWDlk/Vyt7aJ72nGPlF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+JEhE2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+JEhE2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011CB1F00893;
	Tue, 15 Sep 2026 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469106;
	bh=2GdH+NL4xWFAbeQAxvWFFcsy+SBVjLrAm/HWgncWoLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F+JEhE2WTUeGutYF0cgwYVYBLoExW2mHufIl0izWqZVNPajcp1k9Go/YU0mpLbx2F
	 1/rzahc6luEFx3pFjxRCkXmkK+aJC5Om+E+mV0FkDG2m4Zn/wgJbPLO6Rv3MZu2HHS
	 Tn0mUzWZ/Hwx76c3G31nOtFbGL7yUtUi/wgD4cI9EjYErKyM2AB5e3Fra6qCyR3lgq
	 V8BENFPkU6tHK8C6MYlmTyBfsjkcFg9CEejPRKN2ilN1UybFhwRKQcZ0txzgwRAkBM
	 gZThp5XCaqxDLU40AgAM/DMiKHuqli4Q+zMQ17EK0Y8wVfTCccKRXF99r15oSF1WsS
	 IpoPWfy1Ulikw==
Date: Tue, 15 Sep 2026 12:45:03 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Quchaosheng <quchaosheng000406@163.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kthread: Drop warning on cpumask allocation failure
 in kthread_affine_node()
Message-ID: <aqkhrxXXIm43mqfs@localhost.localdomain>
References: <20260914120941.63968-2-quchaosheng000406@163.com>
 <deab3ef5-e63f-474f-9a1b-fb4f4b65be2a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deab3ef5-e63f-474f-9a1b-fb4f4b65be2a@redhat.com>

Le Mon, Sep 14, 2026 at 01:04:22PM -0400, Waiman Long a écrit :
> cc: Frederic Weisbecker <frederic@kernel.org> for his input.
> 
> -Longman
> 
> On 9/14/26 8:09 AM, Quchaosheng wrote:
> > kthread_affine_node() warns when zalloc_cpumask_var() fails:
> > 
> >    if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> >            WARN_ON_ONCE(1);
> >            return;
> >    }
> > 
> > The allocation uses GFP_KERNEL, so it can fail under memory pressure or
> > fault injection.  A failed allocation is a recoverable condition and not a
> > kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
> > NAPI thread:
> > 
> >    WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
> >    CPU: 0 PID: 5207 Comm: napi/wg2-0
> >    Call Trace:
> >     alloc_cpumask_var_node+0xfc/0x138
> >     zalloc_cpumask_var
> >     kthread_affine_node+0x148/0x2e8
> >     kthread+0x29c/0x3d4
> >     ret_from_fork+0x10/0x20
> > 
> > The other two callers of zalloc_cpumask_var() in this file, in the kthread
> > preferred affinity and kthreads_online_cpu() paths, return -ENOMEM without
> > a warning.  kthread_affine_node() returns void, so it cannot report the
> > error either, and it only skips the affinity setup for this thread.  Return
> > early without warning, matching those callers.

Unfortunately there is no way to handle that correctly. It's the thread main
function and making it return early without executing the associated callback
doesn't sound like a better idea over what we do now.

A warning is the only way at this stage to tell that the affinity of the kthread
will be mishandled.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
