Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456A47798A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252474; cv=pass; b=GDXo/xohjcxxAVRzWU5oc0NKqZr9/oEIzJSiZrQE96JrBcPPyenOiY/aAD75T7z/MMoB87+r+EDUO3YdLWscnHEP6cH/DoF4ZWFG27iUh7tfr/vB820cwoy67yt8mpzyiA6vUEeVoUchXiTqlZcdUeTw/+cpa7VYMnjIKvcw6Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252474; c=relaxed/simple;
	bh=K9ufhPEWTbcGbUWPnsFi5tG5G32ivdBgHbHB+/9JtVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeLlsUZR4DxG7m7IFT4OY7iQYupt2y1OdXI4bOr5W7mpbYA6V6BOxQwmPNYFoVbV2KJW2DWnDp1Q6usFCh4a8sxwJ8pJyMG0x+nO4UW4zcYz2y+6bLWTp7dR6TU94/fL/4zePcjgeOvJgzr7+T9/yc2IrI+w8ZKC+g5tuEf3g+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxOLFp8z; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxOLFp8z"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52faa58bff5so237491cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252472; cv=none;
        d=google.com; s=arc-20260327;
        b=hrw3UPD4Gh5X36T+b+XIIcE6MDsr+aWKasBw9JC6IDyngP7Z8sh9I0azb+xR3Yz/a1
         WHBg2LtxqTp5OsIZp9kGTZqaTSxPvYUOOsyUyqAABCALgaiOxa/wesX1+rEHVLOn9PPq
         6ENcN/hF6d6FbGJNcQUvPptM1WnKHYddCupqodGGC6dCUhuvBP3FmxBzxfxzjhAD6ssc
         jbwlJaPMiIUc5Ohgra8MeB7KXrbfVk1lr/pex0p5so618PbxEMQW75rnBaURHi8N3jtj
         03k71q4W4VpaGG01la+xTmsqDmjzM2R4Uo1WzHoDmgxBtPE1VDPKjKD4VOXdcWgRSVwX
         mPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NkGH7LeMJDJfHMf9D0brPKFR1SEB0UnnB2ab6h95oe4=;
        fh=UeTpewyogaZLouDz5r2yGXDrZ+CWL92J7jcDf/J7Cvg=;
        b=ABaxZflmTqbwO5vmGOi/du1QlGjDaWLZ/6ByoKW2UQsit9uTIg2rnwcuA9K24DaVeO
         zUIcloMly3y91qvFMj7+7Ku8I3FtSxMHdBrJUYIzTdxwKt1yCpWUTbCSUjcgoLAO1lTZ
         W9QViMgyBx3Bw/dR3AkQfQEv1pIUwDNXTQduO4O9HocUKluByz2SIS/51HwOglufV094
         C+3Pa/xP8YXBHrTIuuqLPf/QxKpt4TzwMJKdk83fUZKyORwd+59sVOlJd9V2dKxBUW8u
         66ry6PR+W8wxXZdgU5sE+Rche/MF+IIUIz3RQfZb0xrF5X+SOhtN2gmDYSa9l0B2xySF
         Gs5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790252472; x=1790857272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NkGH7LeMJDJfHMf9D0brPKFR1SEB0UnnB2ab6h95oe4=;
        b=RxOLFp8zns9PebEfZOT5KCV4HOlHPO51bVjqJXi77VlNxbLzELm0H3mDLQ0YG5FSbP
         iHnwm+NSqxJ6fMldJbBXqaoBzY68es+RwxdL1ReKIX/wWGPpQsaLPH71d6bmCOiCn6l9
         UrbDCzYsyF0jPJE0prMOVEUbVQqjAy2TKax/yaCQVXqQra4x38ey9+i3CTpaD+pOizwV
         CDMvzkDNQBIB2RnIZvX663wd8SAJ5W0bgdUnvLnzjPllJ3qiTF1IcO/N9B8KhX6PUMaU
         lE8o10voXt4eKcpDKrx6JTPn2hnLMemEJ/Lya/Ay6apKDtceIncTxBlInsqPK9sf72dq
         setg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252472; x=1790857272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkGH7LeMJDJfHMf9D0brPKFR1SEB0UnnB2ab6h95oe4=;
        b=aPtTp/5GFlz301Bvv/gH2YeB9FZaQu+JyOdAIUnPStzcz7LL/l1StUmWeDbbhJQc7S
         YEnMJKEuBSQcGEXIm8PK0MTCB+RFb6Xgw8bs6c3Kpi/H/n6+gZGCbc4+ZGaAEPmtbS57
         U91G0D0k0TpZ+zNoEBsfuL7MHr2dZ2topTF5vDiBW9s+EdS1zERSbcDcjW93IeKWyp2z
         v8X2/6nbNw2xYt2tw9n8ORTcrLtugZrhmOkThwUYRi/gKBdWlgXZIC/PoPUmso4o84QK
         K6o7fb97s61kGimFBUVuNV3SElvnfDxFddYlU/IyrmixS00ANNMNeXL+X1JTxeNQyDNZ
         iELw==
X-Gm-Message-State: AFuF++m2hIIV5cMDxe/IjCubuFbaqhkxk7sSeYWKCp4Nj9xDYYzW8250
	9GZu2LzDBe+z8CtpNCZTfx0Ma3+rCVC6gaplJn35HMFvzgc6EajH0ty7ahknMvRjCY9pJqmRgPo
	xgpctKYVmLq2Wk8xv1yyW+THqjj4U19RMjloU4v5L
X-Gm-Gg: AYBFou2gRyoEJ5zFAN4txmRVuiTgw3stq0lbo93hDPUl/Pkq6tFrhP72/M8rxJ/Luvk
	rRtjwvmVVmNQFoINr/IxpsaympbGwzTCkneRWxCwuONpPGRxoc4Np/usSvtaRqBkm17xbFYa+vN
	W1M7tAC0OqdjSaM4eG/FFoRbjElXZXdKmP704xsEH1RwAnOGkH92RNNhSfq7kD7Fvhh0jCUNn4q
	ZuDPDfOg9WIpcH/io7dX88SU9aTqBc4YIR0KI9OzWq0Xedq49e41GuAQDzaTXrfGMH7pd+AKpip
	6hpKsrjcMdWz4ZZDUCAOasLeOk4fwI9oKYCE7UQ0xTs4hzTpypzALSW1uvPJCtx724u/AOIJ40+
	nMOTNc7ic
X-Received: by 2002:a05:622a:5507:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-532fe9f468dmr9310531cf.1.1790252471121; Thu, 24 Sep 2026
 05:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922211559.3633398-1-sadrul@google.com> <sqmmgjre63ltp2m6y5ui35hijnnwfljnzjscceunvzmzd5rh6i@us2amzhvtkw7>
In-Reply-To: <sqmmgjre63ltp2m6y5ui35hijnnwfljnzjscceunvzmzd5rh6i@us2amzhvtkw7>
From: Sadrul Chowdhury <sadrul@google.com>
Date: Thu, 24 Sep 2026 08:21:00 -0400
X-Gm-Features: AclHuK89lBo3kLTsEvW7wqXIE_9vbscPCVVxotToLaOHDgnCk-gw32aXdN6iQ4M
Message-ID: <CAKgcGXgfr-hbBj+tc--uD5t3J6Q7zhnSsm17JwU0ZdVhb1ai+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs/epoll: mark epoll_wait tasks TASK_FREEZABLE
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 7:24=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Tue 22-09-26 21:15:58, Sadrul Chowdhury wrote:
> > During system suspend (freeze_processes) and resume (thaw_processes),
> > threads blocked in epoll_wait() sleep in TASK_INTERRUPTIBLE. When
> > try_to_freeze_tasks() executes, it must wake up every sleeping thread
> > with a synthetic signal so the thread can schedule, run try_to_freeze()=
,
> > enter TASK_FROZEN, and sleep again. Upon resume, the freezer wakes them
> > all up simultaneously, only for each thread to re-enter ep_poll(),
> > observe no ready I/O events, and call schedule() to go back to sleep.
> >
> > On systems with numerous event-driven daemons (where hundreds of
> > threads idle in event loops), this causes a large wakeup stampede and
> > thousands of redundant context switches per suspend/resume cycle.
> >
> > An earlier attempt to make epoll_wait() freezable in commit 1c441e92120=
1
> > ("epoll: use freezable blocking call") was reverted in commit
> > c511851de162 ("Revert "epoll: use freezable blocking call"") due to
> > reports of userspace corruption (Bugzilla #61781). Under the legacy
> > freezer design, freezable tasks could wake up prematurely while
> > hardware and peripheral drivers were still suspended.
> >
> > With the 2022 core freezer rewrite (commit f5d39b020809 ("freezer,sched=
:
> > Rewrite core freezer logic")), the legacy fake-signal mechanism was
> > replaced with the TASK_FROZEN state. Tasks sleeping in TASK_FREEZABLE
> > are safely frozen in-place without waking them up, and the scheduler
> > guarantees they cannot be woken until thaw_processes() explicitly clear=
s
> > the frozen state.
> >
> > Mark sleeping tasks in ep_poll() as TASK_FREEZABLE. Benchmarks on an
> > ARM64 test device demonstrate that combining this with freezable
> > select/poll reduces thaw latency by 63% (from 20.64 ms down to 7.55 ms
> > mean at fixed CPU frequency) and reduces context switches during
> > freeze/thaw by 87%.
> >
> > Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
>
> With similar caveat as on patch 2/2 feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>

Thank you for the review!

Regards,
Sadrul

>                                                                 Honza
>
> > ---
> >  fs/eventpoll.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> > index 6cbef8b4c2e0..35992f6457bf 100644
> > --- a/fs/eventpoll.c
> > +++ b/fs/eventpoll.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/rculist.h>
> >  #include <linux/capability.h>
> >  #include <net/busy_poll.h>
> > +#include <linux/freezer.h>
> >
> >  #include <trace/hooks/fs.h>
> >
> > @@ -1987,7 +1988,7 @@ static int ep_poll(struct eventpoll *ep, struct e=
poll_event __user *events,
> >                * the same lock on wakeup ep_poll_callback() side, so it
> >                * is safe to avoid an explicit barrier.
> >                */
> > -             __set_current_state(TASK_INTERRUPTIBLE);
> > +             __set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
> >
> >               /*
> >                * Do the final check under the lock. ep_start/done_scan(=
)
> > --
> > 2.55.0.1082.g2b9226bbc0-goog
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
