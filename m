Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D8A494A0F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047782; cv=none; b=BdZui2TLYEuRgG8F85oSnNRKzex2A0xOBFdfMR3kR+6Z5P268VQ0aHId+LoCrl7Tiy5glcyz4NbWUyFiJoBM4lu1rTzRwk9F5IEUrTWcHzJcXMbUstJetBcxKaeqs8OBNb2s4gF3s5nZnjAlL8Mj/6XTBy3yPiYGLMn4m1SVCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047782; c=relaxed/simple;
	bh=98ToWsIS5d7IjM6ytuYwT3/Jd61Z99/5CcphE1jQArU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ohkd9DRshFkrV/4+2zSN0sKH5kQYNQd3iwWra4krYQPGuUm3F7wWt5wk08DJrp/49sx26QV6lq1kPJkKoVOyofsAvIz4deyt+MUqzIC8rC9Vara0rqEHE1YoDDj5DbqubiWcfPbm4Etz8h8mXledSXGyaniAEq59xG5uBdkIacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyr3whHP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QL/SaU4q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyr3whHP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QL/SaU4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789047779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pJZZpHiP7CPuGKYWAqqyZAd3k8D84Jqu2Jb8Skkggz8=;
	b=iyr3whHPyiAwG5dn8E/SfzANIpfltrCwqPHUy1X5Bn1qhp/6ZF5b7jj1FtJad5e7FRR8E1
	LXOr40oKG6Xws8LSrQGjYVDObwyAKzgWqm64cwAtMMSCsACrOLF6ayVtz7U/WeNj8/Hx6a
	adR1MONlYTf7jfW6Mqs/vkFCrzzEuKw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-rhmxyhSPMIuSURW4lAgclw-1; Thu, 10 Sep 2026 09:42:57 -0400
X-MC-Unique: rhmxyhSPMIuSURW4lAgclw-1
X-Mimecast-MFC-AGG-ID: rhmxyhSPMIuSURW4lAgclw_1789047776
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so11100925a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789047776; x=1789652576; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJZZpHiP7CPuGKYWAqqyZAd3k8D84Jqu2Jb8Skkggz8=;
        b=QL/SaU4qUMxjSQDoGVgI34D9SeUM45rCEafQP1B24QyBd/58GnMl6eNnwwI8wYIQYi
         U1BhM44Cvfb2+nw3/Bq3HjuvjfX0YfgC8qlfgW8nmgdACCyaFGKBDHDcIB+NHQfkJV/p
         LjrA0onvWMG0yUY1kpLw3zZCBAzfkcjyVKtlaPB5mDOErgEaNGx03HBL+J+LLeuSBxVI
         +9OicTHJciHa4GkOfVBKAMg2sch82Ba3YnegfDZm2NP6ee5LO3SXHPI0+kKEQSSkRdw3
         L4S/l9UpMDDUxkMnKrHypUatNlH5AZvm/tn3xBpvZNqZ8FizF45osAEbHtyT1Ve6PfhX
         mb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047776; x=1789652576;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pJZZpHiP7CPuGKYWAqqyZAd3k8D84Jqu2Jb8Skkggz8=;
        b=HGZTbwMJEiZMjjI+mzAHFGPy3uP+PeUwvwQt+3exoRGZ+v1Vcnx1bqSGX96e7gxHif
         EmugZcm0aEhS3kxEYUMbWw4smr9edH2ujHerEdM3csXhDBg4G9HpEuxn+iXHXDYDTI5N
         MJdqcHjCotIhaWh+e4fjuU3DpkjTJf7lFRGjb/MJlduRKiToUC/LLe9LIJb0WA8xJxb0
         3VYofi3HHhgEfm/FuQan3VE7Lco53H+CBXLKHWxzdDcOx/13i0ge0Bi5/kspF2ImgyLS
         9cRKshM1y6iF2wHEfIZET8uhxa5ytpXOlw332EdC+11qK6L52QJ1X3agSALggCYrCYbu
         3PSg==
X-Forwarded-Encrypted: i=1; AKwUvBzEx1hmMGLE1WPY/mfkSb8zcKwtPBfDPOIHIZFvZ2eBLe+hdoxWkdNu3IFETwjX1q+PNa6ZlfLSdN2+oXc=@vger.kernel.org
X-Gm-Message-State: AFuF++kefwzMnOUOolwIEc6+MpS0kF9qFtUgVOPQwm7JQA0utcqMzrTT
	lYIZ1pmEAjKdk5ngB7gzPm5EVd0LN8GJrnHSJclzzHNJGyHgmLHfT5Me+n6hcr5a9cjy5EUTNbQ
	480sWos9qj1zpmPrrraF+hn77FGqBcLJaDbSwzp+aaji2xaRW73DulHJ+Q5J89pGw7w==
X-Gm-Gg: AYBFou2DJJV/7Wm0Njww3yjTxOHbjueiwvEeFZe0fH08owE0I2BR0huZgtKUq2uxV4K
	VF9hIHERw5lGmZOLjjis43gvrdpPMFUkx1y3hobqJdSrQOuG7z2kEmGUR9FMj5b5zxz1ptKAwxL
	MbWEisK045uPfkumwCgUgyRFTQMuRDEQks6dN3KIlQfzZsqMCKOtfGf9Bi7eUiwP39ioq25N6tV
	8cBGDkJk1ny50DMVjfqXsm9KjebSIQjZXlA3GpmWGrqkMCw3o1o88fJZqnBfugzdc6wJwhr1OEq
	pJUie96gtIHdxGLwE1LwwPxDHIrRxUTMSFipGkEm/97Ql9qwHNTK/Ob+7k3dwC/4wmu1UEEJGg=
	=
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr11368182a91.12.1789047776228;
        Thu, 10 Sep 2026 06:42:56 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr11368108a91.12.1789047775647;
        Thu, 10 Sep 2026 06:42:55 -0700 (PDT)
Received: from localhost ([240d:1a:c0d:9f00:be24:11ff:fe35:71b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc467df7beesm7140566a12.7.2026.09.10.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:42:55 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,  "Darrick J. Wong"
 <djwong@kernel.org>,  Deepanshu Kartikey <kartikey406@gmail.com>,
  linux-xfs@vger.kernel.org,  linux-kernel@vger.kernel.org,
  syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com
Subject: Re: [PATCH] xfs: take hm->lock in xfs_ioc_health_monitor() before
 insert
In-Reply-To: <aqJ6yulX3XBEoj4u@andromeda.toxiclabs.cc> (Carlos Maiolino's
	message of "Thu, 10 Sep 2026 11:40:09 +0200")
References: <20260906144629.17009-1-kartikey406@gmail.com>
	<20260907045150.GI1933798@frogsfrogsfrogs>
	<aqI7LFBkAhMSaDnx@infradead.org>
	<aqJ6yulX3XBEoj4u@andromeda.toxiclabs.cc>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 22:42:53 +0900
Message-ID: <87y0d99q8y.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Maiolino <cem@kernel.org> writes:

> On Wed, Sep 09, 2026 at 10:07:56PM -0700, Christoph Hellwig wrote:
>> On Sun, Sep 06, 2026 at 09:51:50PM -0700, Darrick J. Wong wrote:
>> > On Sun, Sep 06, 2026 at 08:16:29PM +0530, Deepanshu Kartikey wrote:
>> > > __xfs_healthmon_insert() asserts that hm->lock is held
>> > > (lockdep_assert_held), but xfs_ioc_health_monitor() called it right
>> > > after allocating hm, before ever taking the lock, triggering a
>> > > lockdep warning.
>> > > 
>> > > Take hm->lock around the call.
>> > > 
>> > > Fixes: b3a289a2a9397 ("xfs: create event queuing, formatting, and discovery infrastructure")
>> > > Reported-by: syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com
>> > > Closes: https://syzkaller.appspot.com/bug?extid=ccdf3469f5f653bff7ac
>> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
>> > 
>> > Heh, I added a patch just like this one to my own tree.
>> > Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
>> 
>> Can we get this queued up ASAP?  It's also causing a lot of failures in
>> our zoned XFS CI.
>> 
>> 
>
> Done. It's in for-next already. Not sure if I'll manage to push the
> attrs fsblock fix yet this -rc, but this one will go to Linus on
> Saturday

I noticed that the second mutex operation in this commit was
accidentally left as mutex_lock() instead of mutex_unlock(). I've
sent a fix as a separate patch ("xfs: fix double mutex_lock() call
in xfs_ioc_health_monitor()"). Feel free to use it if it helps.

Thanks,
Shigeru

