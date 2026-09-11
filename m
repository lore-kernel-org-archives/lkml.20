Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711635CB6F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136775; cv=none; b=Ni+dipLAKJMd1cgQ16deOjrJCmzku64xZqQMiGmk3QBvF32Xc+8LWZd/1uj1dcBvkYCSv7kJMYOAx4QtNyUFGcewW6p2JrUovoCZYBLpQaQ1C5yqXiebLL5wKRybiiuG3bifD5qJzNbD4rEXcITXAltnRAZIQvej3539TMtvFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136775; c=relaxed/simple;
	bh=M2kqcs520GNqToI5+X0yVwnAWvYe9b9t/utrb2byT2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLfpZZgm1y8qufT8k7Le3y6XVqLzLUsla32BgCnZVyf9ib3TSV6895Km9KUJgYJX9Z+ApUhx1WlcejiusrBHiuN1bI2sGTJjOp+H6/vQ2Zkrt0wAKaqdZxNhSBfdnaqU6wSA28y4x0KqM4ouZLACAqwCkdxIkU9xLqUTHxDi41k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLcD+p3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLcD+p3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99F31F00898
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789136773;
	bh=5PhvNcmEIXM/kfPhAJlejRP4+1vKY4lWz7V2iV9DdNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kLcD+p3VnYeOJyq7vdt1Mrf9Aa3lwQ8eHv2Fc4K7yxXxFSYS35FOeEVD+I1XwX771
	 MLYL5OdzK9fOnaQWSFaLF4kjbu4bwBF0uEW17NPljGSWWPx2mzRhMStlxWpPbjC0+O
	 G1xH6tDlB0KLplG4c9iAua06eM3qkY3pkkURueO+jRHu59kfIV6KIUiPg5i6MYaKcm
	 RuG4k0WCCJG7PX15li4Q3AxP1PXoHi1wOtyz+Xesp/96+jRcVg/plqPfIigApPWBLr
	 uwQSPeV7fu3b01Hwhnz/ZmcrKdrizz/isBsqwqPbgzSSwNMsE7Vf6QfefFJsz2+gxa
	 8piJmzqrtdtIw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so6899791fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQSUen2LCHKgyHJuT5PRd8g7CKN1fAwIXOSk91S9yqOEgr4C4tmaxi7G6sFr3JMIQnaKYqtpP8zlB6mgg=@vger.kernel.org
X-Gm-Message-State: AFuF++lHLsJj6whCrVkQLr2cb4rx7YaHmHC2M1T2LjD3hlVOyN4GC4TW
	vHynW3WL0/tHFs+CcYT2cnfFQS/+UANhdtiIB8sQSD5RdCBjOitA/R0MePvGzbkqYLMf8+okj2s
	rkKnUYlqeTfidTu4D2zdNUMKgeoxh3Ew=
X-Received: by 2002:ac2:5689:0:b0:5b6:183b:d213 with SMTP id
 2adb3069b0e04-5b8a032c700mr990005e87.58.1789136772191; Fri, 11 Sep 2026
 07:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828032457.2317326-1-luoxueqin@kylinos.cn> <d5f96d83-b5c4-4795-9675-7779f35be78f@arm.com>
In-Reply-To: <d5f96d83-b5c4-4795-9675-7779f35be78f@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 11 Sep 2026 16:24:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0if17M5u2FKNvnnFsonXhG2kiR6QOAw_f2xst0T=nO84A@mail.gmail.com>
X-Gm-Features: AcwNN1WAH4pHE8Tq4UFgOh-4d0yruUjR3MtcGXwEAd9XU7bCjovKep-FmxfyAcc
Message-ID: <CAJZ5v0if17M5u2FKNvnnFsonXhG2kiR6QOAw_f2xst0T=nO84A@mail.gmail.com>
Subject: Re: [PATCH v2] cpuidle: teo: Do not return a disabled idle state
To: Christian Loehle <christian.loehle@arm.com>, Xueqin Luo <luoxueqin@kylinos.cn>
Cc: daniel.lezcano@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:49=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 8/28/26 04:24, Xueqin Luo wrote:
> > If idle state 0 is disabled and none of the enabled idle states satisfi=
es
> > the PM QoS latency constraint, constraint_idx in teo_select() stays at =
its
> > initial value of 0, because the loop that updates it starts at state 1,
> > and so the candidate state index is capped at state 0, which is disable=
d,
> > and that state is returned to the caller.
> >
> > The cpuidle core does not validate the returned state index against the
> > per-state disable flags, so the CPU ends up entering the disabled state=
 0.
> >
> > To address this, ensure that constraint_idx is at least equal to the in=
dex
> > of the first enabled idle state (idx0), so that the candidate state is
> > never capped to a disabled one.
> >
> > Fixes: c410a9a142f1 ("cpuidle: teo: Change the main idle state selectio=
n logic")
> > Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
>
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Applied as 7.4 material, thanks!

> > ---
> > v1 -> v2:
> >     - Instead of falling back to idx0 after the candidate index has bee=
n
> >       capped to a disabled state, ensure that constraint_idx is at leas=
t
> >       equal to idx0 before the capping check (suggested by Rafael J. Wy=
socki).
> >
> >  drivers/cpuidle/governors/teo.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/cpuidle/governors/teo.c b/drivers/cpuidle/governor=
s/teo.c
> > index ac43b9b013b3..906f4f89e365 100644
> > --- a/drivers/cpuidle/governors/teo.c
> > +++ b/drivers/cpuidle/governors/teo.c
> > @@ -426,6 +426,17 @@ static int teo_select(struct cpuidle_driver *drv, =
struct cpuidle_device *dev,
> >               }
> >       }
> >
> > +     /*
> > +      * If the latency constraint does not allow any of the enabled id=
le
> > +      * states to be used, the candidate state index will be capped to=
 0
> > +      * by the check below, but state 0 may be disabled.  To prevent t=
he
> > +      * selection of a disabled state in that case, ensure that
> > +      * constraint_idx is at least equal to the index of the first
> > +      * enabled idle state.
> > +      */
> > +     if (constraint_idx < idx0)
> > +             constraint_idx =3D idx0;
> > +
> >       /*
> >        * If there is a latency constraint, it may be necessary to selec=
t an
> >        * idle state shallower than the current candidate one.
>
