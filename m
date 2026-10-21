Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605389;
	b=mL6mnzKjPau4G4IvfsSDIxee1sdFxqALw711mbxj+yl7bY6SojEWl/+6Z2D6yl6M7pvr
	 y1mcWaxWr4+khBsYBgiI4tT/vxyR90D5fbItQElBARFwYl7i1Q8s4EkZvYhqNeQKK6yhF
	 M/+iLEMG4rGTeG1Vird9mhnsaBOrwZAMwD2sa1m9DgNs/KwCAh7fY4gkmKBrVty9pHSG4
	 W+g9g/9W46BxNWNy3cIpldK3PrNr+LL01vXmvNMY1PfUpxBkFpP+yZf5tfFRzt7eJHOkZ
	 /aDsGc6nNCAPIfFcY1gv/5GBUct2YEUWlFdPGztZIqajOMiMzwDo2EhdnZhd2LnQxLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qq25VGlAW81YVUWZGBDfS97JG2avmzEzTgDrDaF3kUY=;
	b=XT9TA8/7bCaQPGJ+W/P+BWs5yVU2ADB4jr/+4y5Knq1nJguBUjL31eLDe+/0FDfv0UmW
	 tNTlovCxWXW6H9ALXAfef7X0K9kK9I2QhjH285u/t2Nk0XQaVtwqrP0irN9HszKBAW7pX
	 4g65BxzVSUNBvJyMl7VBecoQ/BH3ryHfohFzNLTPtFBqRmnahII2cALPmvrK9p3onrDto
	 MKw/VN4HZ7W8MdvDREmO5/auRR89IqCnfIrOAnUSMKJ7vm0z+Xp4HgDaPkgQASioMwRhw
	 AtN5u55FFDq8hXe76ma0Z7wHYnXHQCe6rQ+s1E6ZWsK6ttzTjgLXCB9U+irEqOePUcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DFY+OsFo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4C3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DFY+OsFo
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so719381f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605387; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1DMqn91bMWpXL2DYZw6JxiUsPs0+XBZpWFQZQp7P9vJuesIkKIfWnv6A0frzKwHtw
         xtguwvbMDTQZUnxBiFgNTaC9MAdCQbntBS2RPhJqS3sXEMa7/8JUneZVPpvVYiMnB54J
         9rONAFlCaNMGxlzNK3E/u3FtKpwQeYoAThvMKRnBGueg0bnABKzmKBmgtGVQs9cFrFEK
         lN/NMumJ54OuN+1k2oqkpbT1s87CC3rwtj1p5+VDkNWYN3GwpudvTpLRtZv3g7zYMvep
         sOa4l9nEuTdoPN1CHCKdjD4k7u/pXCO0F6QNigCSlNAA5URyBuSe2uG31m6Y5FE0FL25
         DVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qq25VGlAW81YVUWZGBDfS97JG2avmzEzTgDrDaF3kUY=;
        fh=KuTMQsHGaZ7ioz2cfYWlRoFbSWr6GU4MSx2MtYweECM=;
        b=lvqOK/7M8/hRqMXnhjN1d4NiJD6uBNEHxcQ0GdAMchgg9JqNtXytiiBC7AqXm+Gv4x
         GDFOXMMPugtKgulU3qvz39nR0ZPsPtFnIkvlbS6vFzdZkEeuPEAlBdgOQXg2dNCOEIsR
         AO1ucP4ui1mN9/eHtBWnWoy1f8xDzYqJFPX4H7NJjQX5QvkDqADBYQbO6AnWtVYToy3w
         fXp43gytL/RZHjubDHR5dGa0VC5cI9acUEJqftl8EiHu5dHZVRm5+29r9J/YomFUuDuX
         SJLetGL3yGDzAdKP/bkPXpWDtDi52plUYghNO07Voefvrb/vTUTm5DMqeT/opAUi7TsG
         kDUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792605387; x=1793210187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq25VGlAW81YVUWZGBDfS97JG2avmzEzTgDrDaF3kUY=;
        b=DFY+OsFoBkMmb+IKJ2T7tv92EDkPI+ArU5vPyaUOsOfdRmot2l8OlQtHYuuhWZvRmv
         bZ7IGG/0WeQCniYPw5e+b3xv08Pvag+ikZ54m+SLTnCSywSeRUcKb18jfYxjtfZEyQwu
         JJiNl8shtP3riWGt909y7UbjSJ7wR55HqcCcr/8AHb0EIccstGXDCboJgInALvW5iH0D
         szzeb97/WILh7j40AwRdhRRFTUgH6WYcDxm0nyS0Me4danS9sJXb67kJa1XtzrZlq33Y
         ewG0TqLYuULLmWAvmUB2CjeEQ1wlQPcTGFecYEACc6ID6pzgYabJS/406wlVC1XWSTiC
         VXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605387; x=1793210187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq25VGlAW81YVUWZGBDfS97JG2avmzEzTgDrDaF3kUY=;
        b=T7V3gtzLjKr7LekcGEvOsDfW71Yr92JwEXdaIxCMAtFmdpeWjrLctEwj9RBvf/qEVc
         uNqd6XFVoEtCyvy+BFvBmyEB82cqYOHRyzHOTxCbT2hvf/tJZ2QVP013VD+LROFolpM7
         VuS6agwwo1W/xs1cw2NwJLmFg62bEnN9Y8WzGmm3AjFobuzwil52ht2WEproWKhMOyiG
         FU9ewTgthEkoz7aPX11HXntj4aLIHvSCSFgC6dx/PGZaJuc+7E+N2Izui9S8zmQ8nCWY
         h9PPQL/tCHVi/FGP+T1DLYN6g2tniLE93VXWuoQPc3BqpFijAlwrZvhG9XEqYgow7nIt
         CA3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuM6MAtFk33s90GmhFE6KjBo54Rr4UuCjqglFOR26ZVOC55+8AX0KbRqONPFRf6HzmD5cgkkiBuvv1a5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHn8rlBX7OWw6YDPm7cUAyHct3z+lM0xCyD4AZOrS5e30jWnqk
	B4KsIenosHkKFcA/vihg7aK8XAvLqSzVF+jSDGntdJpRFadS3xmHZDeLgISOUN4cmpIhE498DGZ
	yZ27wlbw11vakc573OQV03EVrxEd1MQ83xAGgfmeDKRFJeQkt7OB4fG0A/w==
X-Gm-Gg: AYBFou1r7iRNrKR3JbxSwXv82X0mYT0wDZ1BaF3rPhiN3BZSRbft7kRmk9G9g/jJ/fS
	bItZjDLjVWF/C+BIhyCeRpaOQKC5zzIEkXdCOkcR7AZAAkoj1Vp+TG/IkvtDCIDn6HLbEn/+GfQ
	DLmHp9NmcewPj2XS71ZDYdjnLJ+2GRwAi3LX6kAXj4dQT5crKTR+/ZiIP2+psCp7q5V2K+QQqTZ
	ofwM2UY3F3uZf4yjpQR5YnbW9OjTCzqZ0aX9R8Y7RX8YVHdiNyhr90VyprNg2FKMALwh3SHmRhZ
	m6bVoRBsmZqc1WinLQ+ILKZot2jhWVHWDNEDR9e6VDJbkuQTOKz1PKbOQbR4d3jP7EgpLlRGwSP
	LmO5KHYN7XZau64z4XeTuO+QGeRoj0boDG9Sx1dQanDKFZpqtvGk3rR7NLlg3Rz9gZMUxdxitSx
	9wjnqLIfLgdb2DxY5KmyqLglpYttri0QVbhIHoHhc0aycngHiFKXzN5zL/5e59oKqsmqpYYainO
	p2DKoSUuujL3v4N3+wFOckPnW+VsSdN4nvDYhxJSYU4CCJAtHNtOA==
X-Received: by 2002:a05:6000:4009:b0:48d:ffa3:714 with SMTP id
 ffacd0b85a97d-48e264c9950mr6295414f8f.19.1792605386617; Wed, 21 Oct 2026
 10:56:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com>
 <20261020152933.16989549@gandalf.local.home> <20261021113806.GE2823843@noisy.programming.kicks-ass.net>
 <20261021092136.249e2d19@gandalf.local.home> <20261021133430.GP2823843@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021133430.GP2823843@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Oct 2026 10:56:14 -0700
X-Gm-Features: AclHuK8PhOHG1mR9ByxCJxYtDkddizCMhnGOg_IuLGReq30H2L73_L47tYdrxgE
Message-ID: <CANDhNCryxGFe20+Xir0teCuabBdWhJVUBL46WF1OycwU7FdZxw@mail.gmail.com>
Subject: Re: Uclamp races due to non-atomic static_branch_likely updates
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Christian Loehle <christian.loehle@arm.com>, Qais Yousef <qyousef@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, Hongyan Xia <hongyan.xia2@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Wei Wang <wvw@google.com>, 
	Patrick Bellasi <patrick.bellasi@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:34=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 09:21:36AM -0400, Steven Rostedt wrote:
>
> > > And yeah, its always been the case that jump_labels (and static_branc=
h)
> > > updates are non-atomic. Most of them are init time, and don't care.
> > >
> > > Now, I'm sure we've ran into this particular problem before, and it
> > > always requires care.
> > >
>
>
> Read this part:
>
> > > Also note that a simple global boolean has the exact same problem.
> > > Adding runtime conditionals isn't going to fix this.
>
> again, and then consider your response..
>
> >
> > Another idea for "atomic static branch" is to have two static branches =
at
> > each location. One that switches to a "check this variable and do a nor=
mal
> > test and branch" and "we are now in sync and can use the original stati=
c
> > branch".
> >
> > Something like:
> >
> >       if (static_branch_unlikely(&foo_use_variable.key)) {
> >               return static_key_enabled(&foo->key);
> >       } else {
> >               if (static_branch_unlikely(&foo->key))
> >                       return true;
> >               else
> >                       return false;
> >       }
> >
> > And then in between updates of foo, the foo_use_variable gets set makin=
g
> > all the branches use the key, which will be updated "atomically" (maybe
> > some memory barriers needs to be added). After the updates of all the
> > static keys are complete, the foo_use_variable gets unset.
> >
> > The non-atomic portion of "foo_use_variable" is OK because the foo->key
> > will match whatever the static_branch version it has.
>
> That simply doesn't work.
>
> Even *IF* memory stores would propagate instantly (they don't) you can
> still have the boolean swap while in the middle of this state.
>
> ---
>
> B =3D true;
>
> CPU0                    CPU1
>
>  enqueue
>    if (B)
>      something++;
>
>                         B =3D false;
>
>  dequeue
>    if (B)
>      something--;
>
>
> ---
>
> Will still be left with something unbalanced, even if everything is
> super duper magically atomic.

Sure, but this sort of race with a flag variable is much more common
and easier to think about (particularly if the flag value is a one way
transition), since there is usually a causal relationship between
enqueue and dequeue.

But I'd argue the static_branch/jump_label updates being non-atomic
(and ordered by address) can make for much more subtle and unintuitive
results that seem non-causual:

 B =3D true;
 CPU0                    CPU1
                         B =3D false;
  init
   if (B) //sees true
     something=3D0

  enqueue
    if (B) //sees false
      something++;

  dequeue
    if (B) //sees true
      something--;

And yes, compilers and cpus can do a lot of reordering to also break
causality in similar ways, but there's no barrier-primitive here that
can be used to force the order of things.

Again, it may just be a natural consequence that the static key is
*not* actually just a flag and that's fine. But given it looks a lot
like one, it makes it a potentially shiny footgun. (I should know, as
I'm now looking at a strange hole in my foot after realizing my
out-of-tree patch to allow one-way enabling of proxy-exec at runtime
for testing is now "a bit problematic" :)

thanks
-john
