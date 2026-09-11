Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519347D951
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131482; cv=none; b=qeVc/Z7ibYFLBlT1qS+Ywy/J3mtOGjHtnLuxARxbka1e9Vpfw0qT4M/JVxAzKdfoK7QqebZOsu60tFErRUSlwjC2uHA0sWYS3PVUbSCa+W57Hb5xPlHVoL89pdG80afsi9UB5MSOGwsnqazLAMzgXCeGw/OtC+FJ9eyx5xuxLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131482; c=relaxed/simple;
	bh=eLZpKy7xA+DKH6KzsJTLB4l9KITweZmne28OzlGnUXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQKXISRrADqBvKhtMuHphywj1cu9r69cuxhwgk0aZKGr/jgcnjWAZJLJd16AaShmCUPNjHTfnrlQ0sUo83P2+xdH2J+ZCd2PqyIjKHenBi8kgYXAHgYhEDzucT71J2dmR2ohBfRBPsLG0RWwVS7T4RtYmgLXEXb04jbrVlumElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fW/q1i3F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW/q1i3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE601F00893;
	Fri, 11 Sep 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131464;
	bh=vvVxVl1TgVFeSoMoN4hMOU/w/8n6aE/IcJcmNNjt2QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fW/q1i3FdF4YrdvQZvqvkYCQfIrLdswqhsxV1TtukHweIRqWg5rKEym84q/249lMA
	 JoD9Fuu+fuNiqjsRxrYaoUOPS7loHhWPGhTmjXtBYB8Wuc+qNT58RfFDpJCSP+qXUz
	 z8niSUC/XU6KCxyZM2lzdzC3XvW9ykcFyPEMvFujX2726c97qR6lHPtm68/SAz+tCo
	 RHHXse8SvOrOlISYMzQ1AhTPnYrPipxWuV/vicHh+VPliOUxSqRrui8tIn4H/Qn/J9
	 LFaBTU//ZT1pkTMAIzfPA4JUkR8VMa1byeDUmFMQuT6VzCnL7zBUxuWK2fXveUXcz9
	 7kV4hA1H0CSAQ==
Date: Fri, 11 Sep 2026 13:57:39 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
Message-ID: <aqP6wy6BBZXI80vq@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
 <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>

On Fri, Sep 11, 2026 at 03:16:23PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > diff --git a/kernel/cpu.c b/kernel/cpu.c
> > index 97a9bfe4edad..d9fe204f02cb 100644
> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c
> > @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> >  	(void)atomic_xchg(st, state);
> >  }
> >  
> > -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
> > +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
> > +{
> > +	if (old < SYNC_STATE_ALIVE)
> > +		cpu_relax();
> > +	else
> > +		atomic_cond_read_relaxed(st, VAL != old);
> > +}
> 
> As sashiko pointed out, it seems that the else branch unreachable for
> the call of cpuhp_wait_for_sync_state(cpu, SYNC_STATE_ALIVE,
> SYNC_STATE_SHOULD_ONLINE), the old state can only be "SYNC_STATE_KICKED"
> or "SYNC_STATE_SHOULD_DIE", which go the if branch.

Ah yes, it's a harmless leftover from my initial (failed) attempt to use
cpuhp_wait_for_sync_state() in cpuhp_ap_sync_alive(). I can drop this
part and reword the commit message.

Will
