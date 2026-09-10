Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ECF471246
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041963; cv=none; b=dylLd4wM4YqxV0vziXxA5ru7D0w8v0kszEXqTHKfvmjBZIJ4UmjM+p8c7qBsC6iEypTI+mFXLqiPaJe3QLNtOv3wGTRFGEWjVhnikc/1oAhPTViddZsQEeKO9Ei7v9+8/r4bhuFJ0DyekWWC3uuPUC0jR+hDWPnemjFlXDAEYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041963; c=relaxed/simple;
	bh=3VT4qftbhDKPODMATcn948nm0vOTEjsS8QB7eKRp80Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omM7bP46XNpyQXm6beC6oWPhrU5bB4xl0ng84meJqDCq93mbzRVuwIZzCDlOA+kSy4a/JZN6MacbCKjUP9yEk/vf2aCduuwwzMNFuYFvTi/8oT0cTTaroxGSoqLkuWtRcz3xMDnAJWnnOMD6CyBZBlxVrNdUr8IhQgYLV8R7BeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkLsVxKG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkLsVxKG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1349445f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041960; x=1789646760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Omm7s9trViXUWoZv9LqtAIeUVqmw3Dl5ZIXpoFEKMV8=;
        b=BkLsVxKGput+5ebM02wm4LdyUPFGjpdhMeomaskokLyVw6vuV3zO8X+xMt6YTXuGkw
         cv976iDMNuf8bv1JfFaMCBeqlqN2C2lBZjDOSsqOyQO5uO+vQTXvqxGB42GroYMrYMP0
         1EDx5ICljJ010zt+omVppwg5pW/TaOkrfVPftdCamifcN6s7ZCxXufIVbU24xmFpyxbG
         siTKYc5fqmicmJ5yZpkHMNhAiESod1yGC0n745WriOzOdwbq+X92TV4PtzuVjB6us6V/
         9ZgJp1WDoHt7EBdAdHek74QqdsfBsi4OJD+fGoaTW1qfAVkF/CTu4bIU5h6I6rsNrF9b
         KAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041960; x=1789646760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Omm7s9trViXUWoZv9LqtAIeUVqmw3Dl5ZIXpoFEKMV8=;
        b=mqt0p/cmFHYQA+dgwcWhGgzNQ9SqJewSaM7KB+sNpu6zgNuXGycZxLupGMPllWQl4/
         OEn9xeK16APpVEDcwN/PUupYB2LoAXbU9y3CI7xikzNwgGDrbDvGd2ZwCI+gFcvIiyhe
         i7hLqLi4DmG1jLTW/hXIEhf7Ffz46IsM8tQI5ojw+DnbnsM0vD756rrKgBANGKWV092E
         yIWyAaDtemUsqKC8UbmTHw1tXUj1BgUq7+DveIPw1rZDemEzjXIMEVIMeDTdmKqWYP43
         gSXH4W6rSKJvh4ImANcHiBkZSfTug0WYoijQaWrBeYTlYYvX/LFJ2A+JTsmvp1SL8zzr
         U0ug==
X-Forwarded-Encrypted: i=1; AKwUvBywOHrxL+HAUaQTLji7YV9tOAf9pz9O5w7r57tHFWiFipFnw3bvXF8LkBDkzFwgwh2fyhgoPmI+HPNbjWM=@vger.kernel.org
X-Gm-Message-State: AFuF++ntickPp/BGr/wk9Im+84Nd2QcahTGL2oXgTVqz4gJ5vOo9Amc9
	CjLNpnRKu7zP5MNScDUykyucrUU5cV0J7J2XaU4hiZ47G0mtjBunDVy9
X-Gm-Gg: AYBFou2sU5nJu9Y2Q8y/6a3jOvUO/AmCWi9rdmWgoOb00XRwPqgEaMjMlN+vWpQgBIX
	KxgvIBZSC0zrxuxm9vm0njqDZu2cRv/kHkEFnsgeWRiAg1hyeeFsWM0xIW3XtuR7YRf5IRRPooD
	JeCI8XEg0piHdD6hte8TRQTWdi3LDUYW/s6AAgGrj0gPCdY3r0W8T4Wvr+ZvycbCFvy3CcOJC/x
	MDpNfa+khNRJAiY1zMmYrWhEshe/DAfjF5nS6qFd5sD1rIO1736dcP251O23eC0JKRULwOVMhFK
	6n7lmqQlNzA9BQ4Q3DphQ/T5XkzYf+kOmFj+POxj87edXPfV7rsCrfO9Dtf6O9IChBVLhoA3CD8
	Zbwv0ExVkmRv4Yo6THIg9jCt108P5udkv8U89t+twlH0sjFRoPnuJitcPPmaqpM65Nr1M14Rm6q
	OS9WbsEfqXZommf+LuS4sQRI7ZeJEZAiwJSDVDKXt6fWfTIS0xRgH+3g5P4AYCY9whd5JuY3Q2J
	p/VGtKEVakVLGJ2NoGUSM9pi4W6Jk5mh6s5
X-Received: by 2002:a05:600c:604a:b0:49d:1012:893a with SMTP id 5b1f17b1804b1-49d1f320b72mr161192395e9.7.1789041959484;
        Thu, 10 Sep 2026 05:05:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm49335872f8f.22.2026.09.10.05.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:05:59 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:05:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Waiman Long <longman@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260910130557.74e1ae45@pumpkin>
In-Reply-To: <C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
	<44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
	<dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
	<0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
	<20260910120016.04ba8ae1@pumpkin>
	<C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 11:31:19 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

> > On Thu, 10 Sep 2026 09:45:47 +0000
> > Haakon Bugge <haakon.bugge@oracle.com> wrote:
> >  =20
> > > > On 9 Sep 2026, at 22:33, Waiman Long <longman@redhat.com> wrote:   =
=20
> > >=20
> > > [snip]
> > >  =20
> > > > > Could you make that change to the existing code and rerun the tes=
t=20
> > > > > again on arm64 to see if it can pass?    =20
> > > >=20
> > > > osq_lock/unlock() is special in the sense that lock transfer can ha=
ppen=20
> > > > either in the lock cacheline or the node->locked cacheline. Try the=
=20
> > > > patch below to see if it helps to pass the test.
> > > >=20
> > > > Thanks,
> > > > Longman
> > > >=20
> > > > diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> > > > index b4233dc2c2b0..51cecf297692 100644
> > > > --- a/kernel/locking/osq_lock.c
> > > > +++ b/kernel/locking/osq_lock.c
> > > > @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *loc=
k)
> > > >          * is implemented with a monitor-wait. vcpu_is_preempted()=
=20
> > > > relies on
> > > >          * polling, be careful.
> > > >          */
> > > > -       if (smp_cond_load_relaxed(&node->locked, VAL || need_resche=
d() ||
> > > > +       if (smp_cond_load_acquire(&node->locked, VAL || need_resche=
d() ||
> > > > vcpu_is_preempted(node_cpu(node->prev))))
> > > >                 return true;
> > > >=20
> > > > @@ -224,11 +224,11 @@ void osq_unlock(struct optimistic_spin_queue =
*lock)
> > > >         node =3D this_cpu_ptr(&osq_node);
> > > >         next =3D xchg(&node->next, NULL);
> > > >         if (next) {
> > > > -               WRITE_ONCE(next->locked, 1);
> > > > +               smp_store_release(&next->locked, 1);
> > > >                 return;
> > > >         }
> > > >=20
> > > >         next =3D osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
> > > >         if (next)
> > > > -               WRITE_ONCE(next->locked, 1);
> > > > +               smp_store_release(&next->locked, 1);
> > > >  }   =20
> > >=20
> > > The test passes with the above patch: =20
>=20
> Confirming that a much more thorough test (permutating the test array
> size and padding) passed.
>=20
> What concerns me is that I am unable to observe this bug testing
> mutexes or rwlocks.

The explicit test will be a lot more aggressive.
Especially if the lock hold time matters.

>=20
> > Do you know which part matters? =20
>=20
> No, but now that I am able to test the OSQ locks as a module, I'll
> quickly find out.

That also means you can quickly check which _acquire/_release are definitely
required.
I'm pretty sure that (with my patches) the initial xchg() at the top of
osq_lock() only needs _acquire (_release was added to publish node->cpu).
But I think it doesn't even need _acquire.
osq_lock() itself relies on a data dependency.
Any concurrent osq_lock() relies on the smp_wmp() a bit further down
(I think that could be a store_release).

>=20
> > > # dmesg|grep mx
> > > [    7.010502] mx_test: osq_lock                    padding:  8 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
> > > [   12.014144] mx_test: osq_lock                    padding: 16 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> > > [   17.017572] mx_test: osq_lock                    padding: 24 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> > > [   22.019636] mx_test: osq_lock                    padding: 32 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> > > [   27.022192] mx_test: osq_lock                    padding: 40 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
> > > [   32.024907] mx_test: osq_lock                    padding: 48 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.004 seconds
> > > [   37.026035] mx_test: osq_lock                    padding: 56 resul=
t: SUCCESS sum: 0 elements: 1000 elapsed: 5.000 seconds
> > >=20
> > > I'll use David's advise about including the osq_lock code in my test,
> > > so I can test it as a module, which will be more thorough. =20
> >=20
> > At least with a build/run option... =20
>=20
> Yes, I'll send a v2 of my mx_test including OSQ locks both as
> compiled-in and as a module. For the latter, I just did:
>=20
> #include "osq_lock.c"

I tried to rename everything just to be certain the correct functions
are called.

> > > If you submit this patch, feel free to add: =20
> >=20
> > I'll roll it into my patches (as 1/n). =20
>=20
> Be aware that Waiman's patch did not apply on the top of your series,
> so the testing is solely v7.3-rc2 plus Waiman's patch.

The equivalent changes should be obvious.
Note that I merged the unlock and lock-fail paths.

David

>=20
>=20
> Thxs, H=C3=A5kon
>=20

