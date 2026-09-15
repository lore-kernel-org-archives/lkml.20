Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA8E35AC33
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467254; cv=none; b=r2cAtuwtKV0MVtJTZpDgmdVvUPFA68WpQZRY+Vk32SU/yD1M8aDuUijR7y9zONlnQfTcPT88IVyaU2vIkYJmHp4el4hIt6dP4vg6dFkRaKttJppm/Rg0kkVxdYR0ROAcQ0yB9+urJtk/JukhDaBxM/ffONfxKZIf0nrmz3KA52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467254; c=relaxed/simple;
	bh=KB5sbDxu+LPGmHQgyIYpCw1xuaXBJDWGgz+T3Nqk9lc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hk7oLlP0kjm4NDM85KBs6vv26dHNYWCdKFzqgnnDrrdImbqLhh8xbzP8lgCMrPZKoJCPURUUJ5FMcWxBu5GYl6sf18fy/EigLwHuU/UUSV3aeRTOsq1qtkBODmeTg//MkxugaPIezsTn96l907dqViadtz/ZN6vY4JiputuYyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of43+oRL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of43+oRL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2395434f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467251; x=1790072051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ym+pdl+rXrvMyEQNZMNpgxDVKVFZHEFa9d0oo/m058=;
        b=of43+oRLud8XYyDH3NMPdoBDbsr/7bj0MtKOpJ0Xva2cnmB2vHsoNgtwTTCeokF3lS
         BOOksVDCestzVyN0zLxOgWHsEOQFHsmG1YP1ngbjyEHx7fxKEz7vTiVx0RM5BGfl52eV
         g2pccnZSQEfhu1ndmHpz+atUDqAJjG4n7Qem4Gk6hIMef5AnFNeY2VnLvL0VgGY6WqQv
         upNYd9MVblpcZeBl1mYtCtAwqXJfntk6FYnPZaM3RTxZI2xPbdYnxQ1tBQg5l3fAI0pk
         l2JKvOEp7vPvlB7H4OUb2hN0IKV9scO6BNrE/4okm29OSkC6jUn/2DCXNsB4Z6ZMdYUF
         oy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467251; x=1790072051;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ym+pdl+rXrvMyEQNZMNpgxDVKVFZHEFa9d0oo/m058=;
        b=k9TPsx2gzp/PWhvSLEBYs1gBsbMl6ivbaUJ0ccytrzW+HV7WqMUa1MnAPOnu2/vaPN
         BT3UFh5kPDnX/1Nii5hZ9zCMReMBTdyL5Td8wuo0+2KUFNrZv7dArRSN63dAH9CYrEEo
         I3hpqt2VUiQhqGAdPc212fP8X0QL59KW66SKnIJAohWi8lRwM/c8bDan5y633EjBSj04
         ycF0bJLF36X5r+stz7O+VuKC15sWN7UuXuYhwGX4e3W8mg3XgCRZgIpVXxsO+FIlGR2W
         HU4Up11YIssOrqD6vzJuaTbk/1Hx25wrZXVtaiZTLwUCTpEWFfnlxpPLPPiH+S2w3u5D
         yWNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBGvHxCf1MuBBJcNy6UJK9vOaXGxxLQndmJor6y/jh05vgsxlRxO7+gAEZDAD9e3Ros9EJ4bCg1uPx0Ng=@vger.kernel.org
X-Gm-Message-State: AFuF++kUEud6wUJVBTAqJxX4WG3Vy07K+SdNZvQQAeyUuQv6yph/7N+r
	uKVMd+fOmL5xCtmzWd52dRq7nAU6nQzNMU2iFT5kdbnXRjSMmnkmHVN/
X-Gm-Gg: AYBFou30XsRk95EZ5etC7cI8F7fHk/eYPawsEtOpJdiO5esOFosYz831GlF0uVvwXBo
	KT7CqSRp8EDHAllZa4cB8p8YnSXr5UkW7pBTB4e86tIqV05nxVUtGdIlKENtyJfAP/5z+/9b2/y
	uIMkaTJlK0E8aETjlv3//nPSMaQmtFDaMfEjC7f3LcP8YaRz69DT0AgYT26xvZiLx4Hf0yCrWAk
	S5HDekQOEwBiypNYWYk9MFI8Mr0pRjPIPwHOg1zYwmgw8S+nyLt+sfnCKq/4ZavwXrvKPxVIyVq
	zZXwC3TZdFJXgaNIv7cfwrmqGWj85kjihgDKilUwutyRT/pBUzvAXt+rJNUSD7Zuz9N8RrdvpgJ
	0GeklwVUum4iSRqseJvYy+3E+VNYR7d2EQtBak9y562bazEgoep4Z4/8+QnqP11r/KysYjLbIs9
	Ix0cTzSY/ouNj7Meh3eL6fzT+ONC0xK0A/A5Mri7/VVKBkLH9W5d4Bor1n3ehghkzrQIBYRDsbs
	zN+8JEIMwWZ7ygTe2EMHxVIdH0QM3D1LQED
X-Received: by 2002:a5d:588b:0:b0:486:f99f:8236 with SMTP id ffacd0b85a97d-48702b18952mr7923167f8f.44.1789467250659;
        Tue, 15 Sep 2026 03:14:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm33174208f8f.22.2026.09.15.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:14:09 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:14:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915111408.2c8a3ecd@pumpkin>
In-Reply-To: <20260915084047.GZ4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<20260914120352.GE3500130@noisy.programming.kicks-ass.net>
	<20260914140832.676eb1ad@pumpkin>
	<20260915084047.GZ4121339@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:40:47 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Sep 14, 2026 at 02:08:32PM +0100, David Laight wrote:
> > On Mon, 14 Sep 2026 14:03:52 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >   
> > > On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> > >   
> > > > -	for (;;) {
> > > > -		/*
> > > > -		 * cpu_relax() below implies a compiler barrier which would
> > > > -		 * prevent this comparison being optimized away.
> > > > -		 */
> > > > +	for (;; prev = READ_ONCE(node->prev)) {
> > > > +		if (!prev)
> > > > +			/* Lock acquired */
> > > > +			return true;    
> > > 
> > > This lacks {}, but also, is not ACQUIRE like the return you remove
> > > below. Did you want smp_acquire__after_ctrl_dep() in there?  
> > 
> > I need to get my head around the acquire/release logic.
> > I think the READ_ONCE() in the for(;;) needs to be an acquire
> > (matching the smp_cond_load - which seems to have been wrong for ages).
> > I may have decided that because the smp_cond_load was relaxed this
> > read could be as well.
> > (They both need to be the same.)  
> 
> You cannot change ordering and not mention in the changelog. If you're
> unsure, retain existing ordering and make note in changelog.

The existing ordering seems to have been broken.
I'll rework it for the next version.
(It rather depends on what happens to the patch to change the smp_cond_load.)


> 
> > >   
> > > > +
> > > > +		prev_ptr = decode_cpu(prev);
> > > > +
> > > >  		if (data_race(prev_ptr->next) == node &&  
> > 
> > I'm also going to remove that 'optimisation' check.
> > It is there to avoid the atomic below - but it only fails under
> > race conditions.
> > 
> > David
> >   
> > > >  		    cmpxchg(&prev_ptr->next, node, NULL) == node)
> > > >  			break;  
> 
> Someone will put it back eventually. It is typically good form to have
> this pre check. It improved the contended behaviour of these loops. The
> regular load can be a forward, while CAS requires an exclusive load --
> or something along those lines.

I know. I think it really depends on the likelyhood of the compare failing.
It there is a reasonable chance of it failing you definitely need the compare.

David
 
