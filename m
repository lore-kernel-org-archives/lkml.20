Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316F429000
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216668; cv=pass; b=pHlEPG30ICFOiCnfIadRsMUtIaF9Pv0HjumJzVqGK445Lvp8F85J7hmnbYl0Jh9ty4vDPsOoMfbaHIqoHV+/nUlJFTI8ANDHQpg8MbgMM/xCdJ/M4fkxnao6o5+56v0F8PghWvPLdGX30HSe46gbO8H3K7F35yjtCd9IefTjDC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216668; c=relaxed/simple;
	bh=yeTMH9kFHpJvnqz5I7d+elC/gLVahWKunVAWMBOjsZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbBLEPh/twnNC/ZJyem0B+5ObHJbx+/XajyIVG7/mpLW3BWeMrRI8PGUlBELXu5BTXCjROdqbQsZn2BKjKL5e5OUCM0+W1jUTyR+VWt8HSyWMc0tOvn+KEKSFJTqVKTs/DBS2lucef3hiPpl/I/mo5O+/niEfYqMXVFyvqSAfzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY1P5tnC; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY1P5tnC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso6453955e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789216665; cv=none;
        d=google.com; s=arc-20260327;
        b=GdNfUgMePg9XAAckuK4Kc99nYwi/9HwD9GJuY9Cnh1n9U2FV+4Dn06blMhg0fcCYxu
         O3yP6Trz69+geD2sudv3BsQg/6X9dEH3Sk86W0JVYR1eq4T03vEt7ShaerFNVZxM9AJE
         PYF5aUvvkF+qFTrt3qZTq+RhBnmDFhh3RQ3kAPVcVVsHdytLhgDCEqEQQnX2LP3DYIWt
         /ZquNP5r0LxA4O5+tT5AU6bVNLrCMKk0vnZ7cM8/6Tjo4FQ63RZ2XxqxFAdz9lHmMXKr
         gRwwc/VodhumvY5BGHnDIv7V45kuOCac7LMRWKzDIWie6tEp5UDgixOF8QUWdGxvM0zF
         R6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOoVDEs7Uwz1aej+iBOpVf4z5QYFzaJI+ngfP48MEa4=;
        fh=LQCy+T/KrgvnV4oSABS9pDf6zNqQ1j7YYJFVTgSY6Rg=;
        b=W6E43kOcQGA6jolCTj/CLoUJS+fbepjVQVj3FBEYeXtn6WVP2bNhco41L8GzmIV5rv
         8MYfOovhs2d5naaI1C5p7o59uCb6RIsgdbKHfWvObIIBSmhajp4Fry+YcxrJidjIh2Ih
         NYt7UGCp8vs7FDG/bz7L/0YQCrtdwSW/lL7XAUdJ6QvPy4L7R2Y9Ehg/wCl/v67zUqAb
         4Lhyu1x3a9/buGmDEXjvTGc8XFqHkrmGUhJF/weLFX0pi2RpmJORvwDmf9oQcaGW5Qyj
         T3pwfOjz7xSxsmIBwa+Yo8lptS2FCOnHcjo6dv2/IDlZ88Z6aqNRUDLd1/0PjLFqRZzD
         sfqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216665; x=1789821465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOoVDEs7Uwz1aej+iBOpVf4z5QYFzaJI+ngfP48MEa4=;
        b=FY1P5tnCiXld4fbU9y3Wz+TFWrjMnudBnJbsO9yhH6MQWfxI+6UVT20XgG11e3k9Z9
         7xy2F3ppyuL/xXVJfgxCcPrd2E3x7ZSC8O9HVA62MJUKCFoDabOQbLbW7Vdv/oqDwqU0
         /rtGfo695ENBR5zUyfQW6QkhQ0rqK3Qa5LgscLWpOMENBeCg2aKQxzrrwyyR1wKniKRN
         cmZtmxc65s8OvO2arOulpfZhniiCXPmvmBE9lZxwDpAZDFLOVzk/upFucCy/GJi+Uh88
         JsoHnth1R/v+D9CYowYsY6fZNCDfvh13FnmFMz5SovaYXdFTCadMN5VBvrgupbdrC/4l
         YyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216665; x=1789821465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOoVDEs7Uwz1aej+iBOpVf4z5QYFzaJI+ngfP48MEa4=;
        b=UJB9My3WYLEOe850lxhUzvyZIaGSxlSzbs4COHpAsBEiNPh779pAb6o6A7C7E0au3J
         9oz9MQoVKsKBJo29ph2bP7DfBoWUCtw9SCIrex4spSypnza/sNVaooZakTI7Ys80HkjK
         WK7x5aqTUGJ+VoCXZfP2yqc5lUnbUIDgL1T+o61FizIHadxd9xu00J54ck9nO8GHjmVH
         EZjkmPkxQ+nn+HQfLlwQU7VP+xc2Y4oHIBzT2Ur+SfWZtxSyF36vjumElGHUBS3156mG
         ZIKKaJ+03oHunnI5dRU1O7DjSyW3KuQi1YmpUNFDG5vgkw7E0hGy3o/CsX6XWSKK4nLE
         Gkog==
X-Forwarded-Encrypted: i=1; AKwUvBxvt/9/BIsbHbSxm5pq+UpReO3VtMzggL1ogvlI17XBsB1NZ01iiExWrpY7sRrN1D2snMPzMuU6AVntTnM=@vger.kernel.org
X-Gm-Message-State: AFuF++lakzTAL4XHTep9gXB/WRQBXMy7tNcwUUwub9o2TgMRCbk1S7qX
	4OXkUHGGPCrC8AQfoM1nwuEorZPkxk9fWhBTMBoSoeph0DitjzdpXeF8PSV+H5VocfWOg6rNIr6
	lCiBang8Vj+rdYg5+M4AeyI34m8/89QM=
X-Gm-Gg: AYBFou3YEwfhU/DHbLMtD94jWhxp4+iP0VWpU5uGXngdaes6Y4rzEC7AEd3/6sGH57I
	VAdJEhbTo2IGbOUg6BFXoFTbUPlx1OeD/ivOLckwMHZrFLyk6bkRBcxkFGewnCJ3ZPncUNbXQMc
	lXSSoP8NzpYcIJbDt8bmmwaz8eZyLbTphZjp1QQMSWdZDRoIgMcw4RxZD2mMSD6s+QCJX0FSlUD
	Gsbmn1szhlqTrfaFFiBaGZ1QCtWbIbqP53PysHCF9DbOtQJ0rLcsHpWLgL+9H/FKUd+KLgRiYa+
	AvTAAYTvKtURINTExTO0AyqYxQ0RYV0IjLOx9fBGKeRLqWCV2ZLl32wqzNgS05gTyr81rlyETC5
	u02USPZ577HPEwQ==
X-Received: by 2002:a05:600d:6501:10b0:49c:fa21:e73b with SMTP id
 5b1f17b1804b1-49e619c0bc0mr66674725e9.17.1789216665157; Sat, 12 Sep 2026
 05:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911093515.2802551-1-kunwu.chan@gmail.com> <0cf7b133-d2fd-4298-adba-70a2b86d1892@paulmck-laptop>
In-Reply-To: <0cf7b133-d2fd-4298-adba-70a2b86d1892@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 12 Sep 2026 20:37:33 +0800
X-Gm-Features: AcwNN1XEaUmULXfMYv71uEC_YjUFE0KO5ywjshlJVOo2yB1GNxlsDPPW2QEtODk
Message-ID: <CAN_Opa-uuim=aiOuAmHYUoD5S=vBREemj-dCvcunF-4zNdp1=A@mail.gmail.com>
Subject: Re: [PATCH] srcutree: Add lockdep and early-boot checks to synchronize_srcu_atomic()
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zqiang <qiang.zhang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:47=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Fri, Sep 11, 2026 at 05:35:15PM +0800, Kunwu Chan wrote:
> > Add the lockdep annotation, same-type SRCU nesting warning, and
> > early-boot check used by __synchronize_srcu().
> >
> > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Queued for review and testing, thank you both!
>
> Interestingly enough, it is now the case that there is a grace-period
> wait that can be placed in a normal RCU read-side critical section.
> Does this mean that we should also adjust the --do-srcu-lockdep testing
> in tools/testing/selftests/rcutorture/bin/torture.sh?

Thanks, Paul. Good point.

I=E2=80=99ll check the current `--do-srcu-lockdep` coverage, including the
case where `synchronize_srcu_atomic()` is called from a normal RCU
read-side critical section, and follow up with the necessary torture
testing changes.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/srcutree.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 6a9c432a3bd0..6c729e805fb3 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -2123,6 +2123,14 @@ void synchronize_srcu_atomic(struct srcu_struct =
*ssp)
> >       unsigned long rdm0, rdm1;
> >       unsigned long unlocks0, unlocks1;
> >
> > +     srcu_lock_sync(&ssp->dep_map);
> > +
> > +     RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> > +                      "Illegal synchronize_srcu_atomic() in same-type =
SRCU read-side critical section");
> > +
> > +     if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> > +             return;
> > +
> >       // Initialize.  Either init_srcu_struct() was invoked or
> >       // DEFINE_SRCU() or similar was used.  Therefore, no allocation
> >       // will be done here.
> > --
> > 2.43.0
> >
