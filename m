Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2152BE5C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071271; cv=none; b=qLBIu47B2L4E0fPgceakJmUudXD9B2jOw4kqEmD2Psk8/+ZEkeZ459vG4kskvh7AxRjfrXWBdt+VkXNykou/yJuREr4pdRehJsuG7uc79z5KKc95jpr8p9IZX5CkiS1781ZLEVk5zM8SMarMt3oocQXtQ5KhcEIzoYPMPz1NbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071271; c=relaxed/simple;
	bh=C6xl6GukQZKBV4KKbyx4hKZURr8yII/oPre5hMdsWso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3dOTN/HlNbRFaZduj62IY/ZUg2mBQMTJyqn+NBPXcqwxGvcwEi9U5KE51ubpmpnsLRgHpcuqsfHDz8lWma1FZxBHkw6syuREVYDajP6NYmYVxgfaJirkvbZUFb0oTvZ5BQw0UGoj5bB5Snim5nj+lPr8QDVl5WOE3FBZuODjbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSk4s2Ne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSk4s2Ne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CF81F000C4;
	Thu, 15 Oct 2026 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071270;
	bh=u6re1XmJtjSrk7I/99qHfd+Zwb9+nsUu4xAqGghABFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSk4s2NeHA+g0oR19kZvsxPM9GDmzu1yP64wQiWAXVH/DvZ/oKchSJkwXCiMyRqae
	 zhENVvDQDw3VSsN7Ft9LIi8fsV3LEP7jFRTkYClm3Rwhc9kUo+UVNy6cEesiR0ZCi5
	 84vp5XGFqDm2mxzASna1EwvRGvxg7HIEj3wdsBy7eYvjfsRTbsWNZ5/kvDlexCG0HS
	 Alz0s5uuJ4k1BF10GhGECt5zS7vQ29ie9oShX+xDoNOROdv/O1FpY9d0+oZyQ6nc4H
	 KsrpxDHFfvA3v/yjw8Ta+4EgKYS1SLRHsvSW9dqojnlRStTzuARgMKLubg7kVeIVev
	 bjRSsbJKaS3sw==
Date: Thu, 15 Oct 2026 08:34:28 -0500
From: Clark Williams <clrkwllms@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: wen.yang@linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6.1-rt 00/15] net: Backport backlog-NAPI threads to
 resolve PREEMPT_RT softirq warning in SMP flush
Message-ID: <atDWZDywit4ilzJ8@demetrius>
References: <cover.1791912669.git.wen.yang@linux.dev>
 <20261014150853.f8I2fNx0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014150853.f8I2fNx0@linutronix.de>

On Wed, Oct 14, 2026 at 05:08:53PM +0200, Sebastian Andrzej Siewior wrote:
> Please keep the networking folks out of the loop. This is a backport
> request which goes entirely via the RT-queue.
> 
> On 2026-10-14 01:58:34 [+0800], wen.yang@linux.dev wrote:
> > From: Wen Yang <wen.yang@linux.dev>
> > 
> > *** Overview ***
> > Backport the backlog-NAPI smpboot-thread mechanism and its prerequisite
> > NAPI/RPS/defer_list work from upstream (v6.4 - v6.9) to v6.1-rt-next.
> > 
> > *** Problem ***
> > On PREEMPT_RT, RPS steers packets to a remote CPU's backlog by sending an
> > IPI. The IPI handler (rps_trigger_softirq) calls ____napi_schedule(), which
> > raises NET_RX_SOFTIRQ. do_softirq_post_smp_call_flush() then sees a softirq
> > pending that was not pending before the flush, and NET_RX_SOFTIRQ is not
> > masked by SCHED_SOFTIRQ_MASK, so it fires:
> 
> I was about to point out that v6.1-RT should have duct tape for this but
> from reading 1/15 is see that this duct is not complete and is missing
> RPS. Indeed.
> 
> A backport of what is merged is my preference, too. However, we should
> get v6.6-rt fixed first then v6.1-rt. Otherwise users upgrading from
> v6.1 to v6.6 will have this case broken.
> 
> Clark, any objections here from your side?
> 
> Sebastian

I don't have a fundamental objection to the backport and agree we should
do v6.6-rt first, then move that back to v6.1-rt.

So it sounds like we need to pull in the RPS code first?

Clark

-- 
The United States Coast Guard
Ruining Natural Selection since 1790
