Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE5499F25
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480522; cv=none; b=J6KpYjSbz3hrv3TvyT4EkfwONfAB/Nk277HpCfQ0x39VEaKOBV3/F7ZPDEgx/LyUne9aKYYTI4sJUFFGWWm04ZFaVhp980HO0hwA8QvqoFV0SLClNHyh7jQxaTtsYYV+w1oOzyxF+X45F3a49t4HL1mIt926pmDarxG39FJm/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480522; c=relaxed/simple;
	bh=9r+YwCe0F6qQf4PCsOUIPhvQctMI+l83i76fbj6mtRU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1Bc8tIR0id8FFKi/Jj45cg2BHS3Itf51fzqwEX4qqKekKvxmqtUcFrPV2WWua2Ul/Z3zaxK+LVWbbrjvL2NtXCYMzuYhwslqaDjDLgJIwm18gsFAZlBKJy48YxeOCX4ib7cOY8E5peUE4/IUrpiHmKxPem76HqoagHtM67W4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IULD8UVV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IULD8UVV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2635972f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789480518; x=1790085318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gNNkP5OrQ+lux9cj9RwRKi095yys31ZEfJvxuKIb5tQ=;
        b=IULD8UVV3GbeXLi4YxTTcBetIs1JGsG1J6bfZVgsbKUEVWGw57i8VZsizS7qHcw2jb
         EeLCXkI1EJx6ZLmaD0l7VL/Dn3D6mnw4H4ADHMwSSso1SgY28aah4u0uEDeSaoAPIATk
         V97OoHN5HjDrz9pcBsS8slNOfz2y5vrJSCnhboSPvhHqbGhG7SqQ6oix7swKN/3bZ1Kl
         aDT5/nrux1UwUBMB95NW+SxvUzz1iYKBAvMuwn5Kw5VLtbFEFdF41UeuApcY2pNxQSXL
         qShb5s/nPQQrURfFhZMnWSaXFHG+OThdtE7M06QDU3/xsxNMW9CKaYvAs9f3MhkEViV3
         H7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480518; x=1790085318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNNkP5OrQ+lux9cj9RwRKi095yys31ZEfJvxuKIb5tQ=;
        b=CenXPuhIvdm2k4o+aPctOU7gV1bBMyIg7vGsQCCoW+/098+sljYgnR1/XztBLt2Fns
         GqWSKpWHcXloilAwEzYipsyTYqaxqEj3yAVvQze/RWQngNmGgnJvbS92pJLFXmXxPJF7
         /uWflp8VB+2nFtNuxPtA+WsG68/QEVrVFPrDTfCk5vURPAmIKwQsF/CHsU5OFDN51c1C
         YlB4vvvLu953p+aT2rtoKXm3/oVJZAkZacirkkVpdT4+yaKrV7l74AFsQiRt68u9+/nW
         IpiAjEYfRZtbA96+zuhXiuzbQv9TeR9jrcl2FMHUiffrVSjPEMH/6AJP2LZgF0VLf74E
         dDxA==
X-Forwarded-Encrypted: i=1; AKwUvBxRV/4pINwCrfreg7rqOBzulSl1sjXuPVou5wB3d7cJTgjnQZs63V7JnhSlukAJcbuwK0FPSJyviCvIkWs=@vger.kernel.org
X-Gm-Message-State: AFuF++niGiW3oRHL2Ewl8y2eDAm8LBl0E52Y3QnMkXFP07OQ8EnTDZsx
	wtwVmhtbgGTJAmLRUypR0u94OdGGEU3v6SoR/3d9ItTptIqjLwEVUMqX
X-Gm-Gg: AYBFou1X9QpMPo4Iqd3Qz/jWSMX1RIIj20AALsC2USU3hsIjTyoiK4zmRALFWnBoiOI
	9/XBCorT5BgVGljhfRZycA6cy/pZNr/dKqQ1l2cm5zP8Th6V6xkuXzhklXDsOUEWJtO8bPPdeel
	KhJ9wA438ozUGQapFlKhOalFRsz/iXfaEyi9bVkBgsGR2lIcrQMvbNOdbCN+TuUbSUYhUqF/owQ
	t7G8olc0ky/kLnyvn6dMPqhW1zPK01HM1ulfJ1zjqze8MHwrkH3aUuUiomnIBvnkHa7lGJjvI1q
	z7yzRopccpBosTLcJCsA86XjMtny65obh1q+sAKHW+NCTZZksINa/wPRrPq3zqX+3GtAQVzckX0
	9xGQvd0gLh/tXnhoBeLFTB82AE/XhTFblw7npIEGwAkZ/CkaNXZiPuyKwjY6UxGHacRc6K+Xc6j
	S725r0JStb/xvS/u6LYZ7Bvq2lqQP4JlvDaSYZb3TRPs5B71gDhlQr2QNLi2Gp3+U/YY38tjCLJ
	6wv9TN1XPvrImTSo1nyGSdogqPxM73gJyOlxmfMJzQn34g=
X-Received: by 2002:a05:6000:1786:b0:487:88b:4681 with SMTP id ffacd0b85a97d-487088b4ce6mr6076258f8f.10.1789480517949;
        Tue, 15 Sep 2026 06:55:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48707e00133sm4695178f8f.11.2026.09.15.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:55:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 14:55:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915145513.111c4a23@pumpkin>
In-Reply-To: <20260915131510.GD4121620@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<20260915131314.GB2009045@noisy.programming.kicks-ass.net>
	<20260915131510.GD4121620@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 15:15:10 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

I'm glad you are actually going through these patches.

> On Tue, Sep 15, 2026 at 03:13:15PM +0200, Peter Zijlstra wrote:
> > On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> >   
> > > +	/*
> > > +	 * If 'prev' tries to remove itself from the list before we write
> > > +	 * a new value to prev->next it will spin in osq_wait_next().
> > > +	 */  
> > 
> > This comment pertains to what? 

IIRC, perhaps it needs:
	Having written prev->next = NULL ...

> >   
> > > +	/* Invalidate prev_cpu matching osq_unlock() */
> > > +	node->prev = 0;  
> > 
> > I'm confused, osq_unlock() does no such thing.  

osq_unlock() sets it to zero on the node that it passes the lock to
(since that node is now at the head of the list).
The comment probably need a few more words.

> The next patch adds a comment stating that this store is not strictly
> needed. And only serves to ensure node->prev ends up being 0 in all
> paths.

I need to look again (the system with the patches is off) to see why
it might be non-zero after this patch.
The original unlock code just set 'next->locked' and left 'next->prev' pointing
into the abyss.
(One of the AI bots reported something about locked and prev getting
out of sync.)

> That comment *should* obviously have been here. Also, I would *much*
> rather have this store at the top, next to node->next = NULL; That is
> much saner.


Part of the original reason I started these patches was to remove
the writes to the current cpu's 'node' in the fast path acquire.
That completely saves reading the cache line.
It also means the initial xchg need only have acquire semantics.

David

