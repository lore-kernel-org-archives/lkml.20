Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE73C2786;
	Mon, 31 Aug 2026 12:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180109; cv=none; b=IbNEAP0HKoVIpJRnY6iuDitSe6bUhO/myJj2ME72pNb77Vsrqr0FrJItsjpiLB07MYfL8YHZLO7Quju0MVGqyXrpC925uYvmcktamRg5qb7y0EDrKtQujceoBNe0fBeemBPkotY5EP7mijGMvpvlHOHpEQ40C3f4AP5G+9epC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180109; c=relaxed/simple;
	bh=QSoxj2b9AGsNCJxrbwmEx+hK6t16X4csQ+3lHQQmhgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3Ba1HehOxJ2PyNgBxjlZxOP2wbIdyag242423+cVXAWWxDDuhWkhNOyJqxI40olj1lwoXiHmDDCRRiWFsVPJwr8qNpAC+LQetfm6a+pclMx3r/ca8cmRiq0ow37kNYkzbHhsAlxrCuO9ZFd8Zwricx8b4bDS3h0uS2DlI8Zl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAz7Ls0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAz7Ls0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88011F00A3D;
	Mon, 31 Aug 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180108;
	bh=mbv/kd+torGFOdxhf/5tELca7nveXe3baZA4e/kLNFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAz7Ls0gc7HE1nFbAok87o9PYdKytGp6TZ5gPaAVMXd625mgwWbgDywKZCaLQcm/L
	 8Febxx7cAvjg4SS8QvM69diPBFDdBTb2O8aqbNFfRG1Ol7oO3xGbq65qW+WO4YEFT5
	 WwPx9Mb53yCxPAqhh41qsBH+w0x557bL5ugNUFqNMoMAqnhzmHieaJSjNh8BHoEoJV
	 MK19YfCT3xh7pRNaJbQKuC2epKcrbclMSoPNHKe7BVa9/G7mB8RLNGvKlHofBOGjJS
	 8tzAIXBVLMUsTE3zJgiY8/yKzNL7m81k/Ttv+woserLa2bZ3B+DyD1wmnfHM0ElzRU
	 uHXwuBzCkYpaA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0A8F9F40067;
	Mon, 31 Aug 2026 08:41:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 31 Aug 2026 08:41:47 -0400
X-ME-Sender: <xms:inaVasqcS6tjE91tNeV5GT3Jdrx-VhZlqpjpGwc_fwXUJXR78C02SA>
    <xme:inaVar-tNHg43mOzHTcQ7qkExIhzpm2g2YhCkLNFRc_NwW-1i-nkZLfgNbCFbnulB
    7jyvRarrxAjcjvua83TuGr_lrhWPFtiAALzk8kVnzlsQF92V871uw>
X-ME-Received: <xmr:inaVaodjEbfkmZN_1hT6vV9JVvlzo5i0UinCh6iNG7vBST4nN2U3IwYaRk8o9Ah5vh9WxJK6UUO_uoRHw4Vr15qHh55WN3KK>
X-ME-Proxy-Cause: dmFkZTFlbxsWchTWC7/9/1k9VDwWZKkcCvsSQ5A/huPWsjoMEBwfiM/a19+LD3OYLeSvS6
    hyIZciqOKu5rb7Odmykrc2GCnL9WUOmTXT5+yIKUNmzKNfHSqC/rOUOyzC0olIc1TR7fel
    /A3aTT79OSjqZRx7bTcGrF17C1swd7RAcHFshD+xF2WpWhr5qDOAbcWKkLv3Mqv898qVj3
    8b9lAu0ruvBp5+yKRrihUVH2g0t8JovBW/tjhxHYFotKfn965YZhYPvDkgd4OjDuaZAcPf
    neLw6OmlVU4ZqzB2+nqvqHT2/frm+agdPsMGf8isDZWwZN0PDwb2ozgNpYzo6CwtE1WlNR
    l2iBmSJPO0UGNGc/dooJA1p34kFoun/h05Nq0W9Iqofxo2QaIovDwW1e8BfEwRYZr11q4a
    en239R8TIDkQqHDj9ga/G5V6NJ+AjTWVQ8h0Nd7Vq/91ijNFZYEooxVQhO27PUj0uz8Gyg
    3lQ6K5DS0AUk9J1SPQXvhNn9aCN0WNGdYWvij4DYmHevtVY5IeEMVFPhF4ZAouKsrNoGMd
    3mPG6K2YDjrH/JRU4ytbk46c0j5LtyImhfDPhw7S2xm2fWda7XDkAh8uvW/NtE/TLknQ39
    NHEvyc8fDT9//12ochfZUJ0KfU0XZmEMQ79D2kuKadiYxnlEr25b3HxZ5g/g
X-ME-Proxy: <xmx:inaValLJdvNaip6opynGJXWYU8AoxzLu1-jB7T8CE9yO5F5iSCebjw>
    <xmx:i3aVaojaEyRrUNlvKT66PA44xH_AvfUAO-GP_7V7Kaa4fdW9JMs6-w>
    <xmx:i3aVajRA-JZBO6CFV4gYtArAhawuiGuDaed79KlYCtsasXFtWngsbQ>
    <xmx:i3aVaiXqlYQeflB-UbIKB3Pblz_jc_d7xk7arfJFJqzW8lZZ4pEnsA>
    <xmx:i3aVavRd_aI-DHid3rAm5YQHhRv8lKtcrUwf6H24qOdoz3rvS3POplSP>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 08:41:46 -0400 (EDT)
Date: Mon, 31 Aug 2026 05:41:45 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apV2iSFXlc3XY7Wk@tardis.local>
References: <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local>
 <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local>
 <87jyp6d2ut.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jyp6d2ut.ffs@fw13>

On Mon, Aug 31, 2026 at 12:02:50PM +0200, Thomas Gleixner wrote:
> On Sun, Aug 30 2026 at 14:23, Boqun Feng wrote:
> > On Sun, Aug 30, 2026 at 09:57:30PM +0200, Thomas Gleixner wrote:
> >> The actual PREEMPT_COUNT_IRQFLAGS thing will be 7.4 material obviously
> >> and as this is confined to Rust then it's trivial enough to work around
> >> it locally without exposing more stuff. See tiny delta patch below.
> >> 
> >> So the only side effect of that is that the Rust implementation will not
> >> be fully integrated into the preempt count magic, but it should just
> >> work, no?
> >> 
> >
> > Right, that works. It's similar to the "alternatively" approach I
> > mentioned here [1].
> 
> But thinking more about it. It actually just works with the preempt
> count bits independent of PREEMPT_COUNT_IRQFLAGS.
> 
> For PREEMPT_COUNT_IRQFLAGS=n, Rust is the only one using it.
> 
> For PREEMPT_COUNT_IRQFLAGS=y, the Rust part integrates with the core
> implementation. And once all Rust supporting architectures are enabling
> PREEMPT_COUNT_IRQFLAGS the Rust extra magic goes away.
> 
> No?
> 

Right, that's why I thought fully revert on commit e901c1510e24 might
not be needed.

To me, the only "magic" part when PREEMPT_COUNT_IRQFLAGS=n are 1)
preempt_count() is inconsistent on HARDIRQ_DISABLE_MASK about interrupt
disabling as you pointed out earlier and 2)
local_interrupt_{en,dis}able() has to save the current irq disabling
state/flag to work with local_irq_*(). PREEMPT_COUNT_IRQFLAGS=y resolves
both of them.

And if PREEMPT_COUNT_IRQFLAGS=y is the future (i.e. it'll be always y),
then we will likely have local_interrupt_{en,dis}able() (or a different
name) as a general API for everyone. So the API (and its semantics) is
not Rust-specific considering the future direction. Hence previously I
said that we can move them to Rust only but seems a bit unnecessary to
me.

Hope this makes sense.

Regards,
Boqun

> Thanks,
> 
>         tglx
> 
> 
