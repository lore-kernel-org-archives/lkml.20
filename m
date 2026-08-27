Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A82DF156;
	Thu, 27 Aug 2026 20:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862556; cv=none; b=RKj4RwYNPcOJxBL0K6F1wK/6ghPDP5bymzLxgNCnH24UYML88jUNgVIuQfJCkrSOmKUK+VfMEoet9CICmrwUXWiCnohnosqBJQViJmftaoQg8gDNAl4lCcw/q655aQkvHhymQYtPj36rZqMog3R3ERJXFJ0aAq0Tk3+eDoyugxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862556; c=relaxed/simple;
	bh=yKI1aioQJlwf0YKRcsWpWIyBBhuPEzvVOoABzwXvDTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pYOroe2qM1JcgOAtKcsyy4ywjSiyIuYLXCcZQJoV7L5isDRCWEc0T/pGdfK8/EcYa9tFNt9/7fK9RgpVdMvVjBFB/huzdqAedJD9y2DNmnLwRorF6IrEX1UGM706s+MwvnR9hnGIfbNZsO5WLi2Z+8MbCSLRIluQ/lpezPUPjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byzKT6Sr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byzKT6Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90161F000E9;
	Thu, 27 Aug 2026 20:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862553;
	bh=THtsuyXgjZsB0BJE9sa+H6agkqhj31RJe/nHme3LERA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=byzKT6Sr3opoBEvPsYhrtktqjztSArTROVcFSVVM1nuRXXYlesRBk1pCSBGjn2+ml
	 Tfgtx68Yf605kYj9evrI5lVMNKD4TMWglee8zF2CIuMCRAfAQQqePH81tW/txGF2bG
	 fTZBYhiFiSkNSMNtokeZx/wQCMz52rkXlOTHEo1WQ7FNgczaADy1N7QDsorJitdzah
	 CQ0x6OCIbMwV7I4WPsQrOD1ptfoHvCa7v71gQOskifWp3ePNGzJn/McH+ldwtItBD0
	 4Dfqx503vquo66I2/4Sygfx0sTVvmeKHUQiGfeX2qhvqkgSDEWCnP0gEK2O3EwuLzv
	 vSkOYObPkLFOQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <87v78wezid.ffs@fw13>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local> <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local> <87v78wezid.ffs@fw13>
Date: Thu, 27 Aug 2026 22:29:10 +0200
Message-ID: <875x0vfgtl.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 10:30, Thomas Gleixner wrote:
> On Tue, Aug 25 2026 at 16:28, Boqun Feng wrote:
> So you can get away with:
>
> raw_local_irq_save(flags)
> {
> 	flags = count;
> 	if (!count)
>         	arch_local_irq_disable();
>         count++;
> }
>
> raw_local_irq_restore(flags)
> {
> 	if (!(count = flags))
>         	arch_local_irq_enable();
> }
>
> raw_local_irq_disable()
> {
>         arch_local_irq_disable();
>         count = 1;
> }
>
> raw_local_irq_enable()
> {
>         count = 0;
>         arch_local_irq_enable();
> }

Actually it can be done way simpler because the nasty case of

         scoped_guard(lock_irqsave, lock) {
         	unlock_irq(lock);
                lock_irq(lock);
         }

is only valid for a single lock guard, because if it's nested then the
outer lock would lose the interrupt disabled protection. Anything else
would be a bug on its own and would have long ago blown up in our face.

So we can completely ignore flags.

raw_local_irq_save(flags)
{
 	if (!count)
         	arch_local_irq_disable();
        count++;
}

raw_local_irq_restore(flags)
{
 	if (!--count)
         	arch_local_irq_enable();
}

raw_local_irq_disable()
{
         arch_local_irq_disable();
         count++;
}

raw_local_irq_enable()
{
         count--;
         arch_local_irq_enable();
}

with a copious amount of debug machinery to catch any oddballs.

Also note that this never uses irqsave/restore because historically that
has been way slower than CLI/STI.

A decade+ ago this used to be up to 30%, but micro architectures
optimized for it. Still on a SKL it's ~14% and on a Zen3 ~8% slower.

Thanks,

        tglx

