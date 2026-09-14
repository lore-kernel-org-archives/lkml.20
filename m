Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458246AA6B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391417; cv=none; b=EKvYf4HFIE8rHY0CtE63dfDhnlMNK1BbcXlCH5ZlaMrpCEQXCyIxumuO/vqc1NvpFYEF7yRDWPfUjfARIf0f7zZdARoMuKUPzIOfosKNeuHfGm3npkms4rvvvGhD37i0sRE9MqdIrgkf1aHVze5Fd9c1Z4y+/8hQBA46bgfrrAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391417; c=relaxed/simple;
	bh=wfatmhbThLRAdgeIRvdH4FPTGW56XGTDozsx0MtLU5c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rCxGH1tayG7rrAXsPg56Yv41oSS3ZtLiizcLaoerg5t/5wsxdcjowsmLOskJKjHGQN8NANdPEdwbIcNC7kltGA1hOdqlFBGAWYZ9X5/ltw0CgTDWofvWEkxM6t+YtDUkbP1EGQurN2EH+I1acCnKq5qiSenxwh7uaaEQjTiphmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if8u/h6F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if8u/h6F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so7969165e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391413; x=1789996213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/+Po/a3taRigscsjIoJtwUwGLspkQC2zbXgjN4cvwQ=;
        b=if8u/h6F/MeCGKNsiMMXxuWZmm6Bmj8fqRF3nTb9rOdFmcjIfMSmjn7qvZOrSl0Rf7
         xpFUKFsjw0ClhdBzMg9kcyc+amNBUKAC7+YlZ886BNXWsub9accW+ARUqXrP/oLyTuOR
         QO/WSOwk5+ofOs7Ahe2EEfTba8++xycDJ4/OcmEXwv/jmDo3Gd4FpYo8+pRNAF4v9gsn
         h5Kz/0X3Y5qbSgqetpVPOMrsnchfPOXxbiPwmBBgaugFHp+yInYpdRiHsGx++qEWlDHa
         BzcKypqHqe8ki0h+TNhQ9gAoOCeupJURL+ZxiTUZYxSQLVRBuQXH3r/zoCfcOAUEHEX3
         p5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391413; x=1789996213;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+Po/a3taRigscsjIoJtwUwGLspkQC2zbXgjN4cvwQ=;
        b=ppwFQjBknFqdCMbK4zJ5v8hNzJB+ksJ0qT9lg1FJQ98KUl9zuhASvI2tEi72d57+/S
         0cCS4dQeVSoWR0+N4CKihQFvneZn9luOTdT3K3v308diqo2X31vwFocQ5C1dhxNqo6Ov
         KPvyfjRmCHAvl+UWOEEU3vvwgHhoP1jrE1u49QCbGwLLmaDPa5NPR4keZav0q4729hTP
         GEoR9SvvlImyJB/78Vob4kxy7v2KO9SKtQ9OsmXQG0kyBiKstwPi3DbA/boRw5uBDLMo
         ur2Bb3R8CjcvtKYG+3+vsoGyBLldY3ojoADX3HgdHb/Y9NHoIXWj4zNFfsu8s/Eu7uId
         fq5w==
X-Forwarded-Encrypted: i=1; AKwUvBzwIgkHuPVpRwrTeWDpeBI08i+6UMkgCvF1LNpZp5TRSeoqbcC6wNf2Dg6v5joxLWx0ijpZsUQDignVtZw=@vger.kernel.org
X-Gm-Message-State: AFuF++njKAHPwkIXzJPW1KZXFewCwRhoTfTCKnALLZxaQqW37BM5dtPh
	zgWi9pJJsBo9AjRYBr4Ysxqd2MEc42uO1iHMHknxvhmm3f5vAmfg0dCs
X-Gm-Gg: AYBFou25ClPubmMppVTbGsVwswNirRz6xpFrublKzUd070+X+8fsrwiCpRWNHSdHTVo
	wqdAgwQ5AMANhmn/eqxrmtB+RrIl2Vid+0AHX+PjSdqr5M79SvheAuflqmcOKLmkeWM4HleA0JR
	x+iklHeC7BTQxf77pYclaMRscs6B3LAMjyyHqo/fWw8Yv1iPYpd8t+LIVGYotTKoJTdKWWXLTAb
	tOX88hIBTD7EvBwaCHLbrfFNlBx6wXmfxMDNCnAVIvFAB7XZOAYFqGffQ2MHK6JFLMq5iuR+bjM
	Y4HBxI4udZBRX7393yQ2dd1iLg0Ouhmqq2PFtXXBlDjeCAFLn/KIPWrJSJkHOBrZD9YO6agwt0y
	InhyDormRZqGMAY1562vDUKnoQubZZushs4SgNvpuT43W0yDMAwxYapPULTe1LYgxRDcra29BJ5
	pa8JndCs/ZMI8YSGVYkL11gvTiGrN2BVrNdHrjBVdkRlslV3IDxx+d6k8nXbly4eYjHxYudykYQ
	YkPrCet7ZX6UxqsKORGszTF4D13zwPUc5G9ng==
X-Received: by 2002:a05:600c:3b0e:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49e7a64894amr28913975e9.11.1789391413113;
        Mon, 14 Sep 2026 06:10:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm482828385e9.13.2026.09.14.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:10:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:10:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260914141011.751db036@pumpkin>
In-Reply-To: <20260914120147.GD3500130@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<ac626425-08d8-4967-bbe5-2ceb971af668@redhat.com>
	<20260909195223.4d2dbe86@pumpkin>
	<20260914120147.GD3500130@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 14:01:47 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Sep 09, 2026 at 07:52:23PM +0100, David Laight wrote:
> > On Wed, 9 Sep 2026 14:01:59 -0400
> > Waiman Long <longman@redhat.com> wrote:
> >   
> > > On 9/7/26 4:41 AM, David Laight wrote:  
> > > > There is no need for separate prev_cpu and locked members of
> > > > struct optimistic_spin_node.
> > > > Using a single field simplifies the code slightly.
> > > > It also removes any possibility of the two values being out of sync.
> > > >
> > > > When cancelling a lock request explicitly set prev_cpu to zero.
> > > > Nothing actually looks at the field, but it means that it will be zero
> > > > after a subsequent 'fast path' osq_lock() call making things consistent.
> > > > The cache line is likely to be dirty (or be dirtied) so there shouldn't
> > > > be a performance hit.
> > > >
> > > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > > ---
> > > >   kernel/locking/osq_lock.c | 57 +++++++++++++++++++--------------------
> > > >   1 file changed, 28 insertions(+), 29 deletions(-)
> > > >
> > > > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > > > index 01988d00c480..23f00c670507 100644
> > > > --- a/kernel/locking/osq_lock.c
> > > > +++ b/kernel/locking/osq_lock.c
> > > > @@ -35,7 +35,6 @@
> > > >   
> > > >   struct optimistic_spin_node {
> > > >   	struct optimistic_spin_node *next;
> > > > -	int locked; /* 1 if lock acquired */
> > > >   	int prev; /* CPU number offset by 1 */
> > > >   };
> > > >       
> > > I think we should document the fact that prev=0 can be viewed as a 
> > > marker that the osq lock has been acquired.  
> > 
> > I think that happens a bit later in the series.
> > Trying to keep the comments in step is quite hard work.  
> 
> Still, that's what you gotta do. Now you're asking us to try and reverse
> engineer things while reviewing.

That's what I had to do before changing the code :-)
It'll win a 'zero unless waiting' comment in the next version.

David
