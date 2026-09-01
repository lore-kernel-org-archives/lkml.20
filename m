Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C4379EEC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275205; cv=pass; b=M6BDy/JVFRNefKL8qdsup/bJhumJD2DvMyO+TPOEXq3akeCkSD0uJ5t3gMelbYKx2g1MGdeXn2u7hybEpbx0vzcRUZ8mczydTvatJT7gC2jYr9DMpKh3WcSAIvNWBbn+qRtzAadCBXAy0dUkLyFaO5dvwsXW7ITTmfch8M40cds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275205; c=relaxed/simple;
	bh=4+HIZ4Q5IIrpnindsFnWn35HmY9FmNfg/yZtpPmaAQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbSF0wnsqEiECi1b/s1X7V4lj+5Roy88XSGIt9ccaNYPoEUO9F5E1mjigVV9QCpCzT+lL/caygXJbJxWSA+bn/VY7dx7U9Qwntnzrp11aVn1ZINd0e0Ds57gixni872APH2LXLDgMtwUjdq+BYWMQS4u3UpM1LHKt+mBWBrzIkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY2Abr0o; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY2Abr0o"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8557c3f270eso4075448b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275203; cv=none;
        d=google.com; s=arc-20260327;
        b=RoNZ+aOLv55IWTK7hPJUzY9jKdQuv9ytYKu1jnIteTWh6oL+L2DxyoTvLqlOuL3ToZ
         1S1+e9p4XriZCoBB58BcP/YIFEw1RHavK+s4ecmuHU9GMDQr8HKoSGQJpm/1eW0aAESe
         TiXBzXSi7uBbzctOQfbjgA2n1nDSJ1egglVcRdoiKLnfz5lV4VoCRg8EnN2mcJyyWN/b
         xoCl7txcQi8egRKMQCW/HI6/AmnCXuDlvm+2asC4gTsnEUBHhA2GDPzHQDez8mxtRG9G
         ahxPTtHW+fMLgPfrJcagmuL4q1vPCY8kDbD1rnocGLrkOYWZ+KYPkYTru0LG/SPzSEY2
         rX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5uGLU8oCfbV8VIHqIo2ClQTYY5+lTlorDlDnLTyOTzY=;
        fh=7uU6o9nTJ+mzO/E42dETLKSZcFA/lF+P+vpGdUmUB7E=;
        b=NnOaSo2llcoUPxs2TVss+piaO+UlER8rwtcHnzu6GPa/4wkuVCJduHHal5MTw/5scr
         vm4iAmG4+7LEsmXwA6+tERlIGz+yrHc9Ofg2h3Bhz09UvmXClO2fy6FhqA5W2jy7xSN3
         x4W5xssdNBlRCaBl074veU0v8u424o+XSL5CkE3p8qLdQsHDZmwp4qsT2efZwixYSsVg
         SQtbkIz+qS78NhzjacKcGQglXdXdZlUi2YPLi0yKVK1tzsetZJDakQHSayQxH2+fIUGy
         EPGtikuj0+gMXYNb/9Ubih66seYA1UzTcT5eh7bNkK5cTTBnBXn33dM36KrF+a5OvP9Y
         X9sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275203; x=1788880003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uGLU8oCfbV8VIHqIo2ClQTYY5+lTlorDlDnLTyOTzY=;
        b=TY2Abr0oQout+xARnahnvunuRPGpdGWoItGL/AvegbvEOWMuvEODSewe4nwRgoZpia
         94FYxkhKX06v6x8jzko0+9MBTPZ0zhZgGYk4qDBJKBrxvaF1TdsTOfV6JtWJ3flI3zRr
         NyDnHVegkDOgLnKuj8WPzSgad4PqW6msi4JO7lc2EVOa6s3XGLFuDvIa71bVSl3pSaI2
         Dm8geBAE0JAXt488GA3daN8tJ2ET6ZcTPQsDBtySXVl7/Ugq89TIExsbLG2BlqU1FJTe
         V7ZuM6wepKCsrrL/z4+5dxA0YP3TKCYVV47fI4jhGN2sQpy6WRh2wv0F2dIOF3DxPqQ6
         OJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275203; x=1788880003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uGLU8oCfbV8VIHqIo2ClQTYY5+lTlorDlDnLTyOTzY=;
        b=Kp1voIMRizsuzMK13I/S+2duNYJAyqEbPkpYRKHY4zQEnn8BWKq5EH9LwGfqQj2Vi0
         SRHfCNuGjh5lf9Xw+MkMaxjnBCvsVaWelcSIO27lEJl/jkaghmsyyVf8wkS/FSXnHm3J
         +TXsUWLIgmdgDZ2xlsxoioPPmSWTlSrNpYUGW50pV6qkA8I3rsRUopRqyM9kVR7BOJmR
         I4coE0V3VDyRymiJu0lZUk8OmYrhHZuTH8V77ZpAzze/BlyJ0Hd758MZ0StqkW/kOzWZ
         oXbibiuA0smj7v/9z8PTi1nM903K+UpyeqFMyZ0cbbGtpOxStEM8h8hF12hm3/cGnWd0
         n1gw==
X-Forwarded-Encrypted: i=1; AHgh+RqQUZUd93m9vVjaR8EU62E3g9uKNKP0FM3uaZEdwZKWaNLczjLWfBJuVbyQOMbwjYjwDhljOjxDyAZYvp8=@vger.kernel.org
X-Gm-Message-State: AFuF++l6kPUwyS2s9+Hlfvo6+xoc94688t2XAemZx7EWLUPkERYjh+ps
	U8iCKXc4XSCEZ2QTS9yLxiBpGCIGbpcxyKF7p9IwfpexkUONcTbDchRDoKghw50Owvd5XdMYPBt
	H/LVwgmvk2c3VNzJf4Fz9pLgCAf8RrwY=
X-Gm-Gg: AR+sD10mCpeuDpLXKFSkfKGienSTwkR3MTyu51iOz6lkP/wM8uWEsP1C1lcFdOXR0kI
	Rsj0J9CDJpM08ob81bh8ISLunSMA3W5rkqiZBuI2zhaZcBclfIdayjPBbs3wnnYV1wcu4VZCMU3
	NcGBc/QF8PcuBjEzpbRkgnXy7km2ccni9mnE5poMJk6+lfQknxk8zHf7sImr8eXCKT0tB4AdujL
	aFhTbHQDn2lUSab1vi2bwJ8MrsbHgDCAwVmyYhpx1XwU3z8HKlbpiff/qshd6y1lpxQBCiuRsh4
	xeDXAWXaFntX8H2Uz2X9peXJIH2pp14TgTV4/X6qzz/zlO5q0F4InNUbNq+zRFk3g4RD87SwvST
	bMD5Z4C+0i8thuwcxc6gARA2sOkvGM2uta8QencdDYIse
X-Received: by 2002:a05:6a00:1143:b0:842:2419:6bfe with SMTP id
 d2e1a72fcca58-8562a1f7635mr48366362b3a.7.1788275202771; Tue, 01 Sep 2026
 08:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a7d8773.c5ad36c8.12f49d.002e.GAE@google.com> <68cb4941-3668-44f1-a889-6b2f023b2a08@h-partners.com>
 <CADvbK_eY4S1HbdNHuNq9b=Va-TA_6rNFvnCvtOUZ0sF-AWN67A@mail.gmail.com> <20260901153524.3e92df3a@pumpkin>
In-Reply-To: <20260901153524.3e92df3a@pumpkin>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 1 Sep 2026 11:06:31 -0400
X-Gm-Features: AcwNN1U9hNLddzkdHknmS9iBL9g_3nFvkL-mCp26Qy2kZ2_LJCi6sU3R5oK_nX8
Message-ID: <CADvbK_esKpvPWK0xipKeiDr6KDiAL2_uPOhrREOMMVjJ_ndK7A@mail.gmail.com>
Subject: Re: [syzbot] [sctp?] WARNING: refcount bug in sctp_transport_put (6)
To: David Laight <david.laight.linux@gmail.com>
Cc: xietangxin <xietangxin@h-partners.com>, 
	syzbot+80dfcb1a2235b3efc877@syzkaller.appspotmail.com, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, marcelo.leitner@gmail.com, 
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, gaoxingwang <gaoxingwang1@huawei.com>, 
	huyizhen2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:35=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 1 Sep 2026 09:45:42 -0400
> Xin Long <lucien.xin@gmail.com> wrote:
>
> > On Mon, Aug 31, 2026 at 11:47=E2=80=AFPM xietangxin <xietangxin@h-partn=
ers.com> wrote:
> > >
> > > Hi,
> > >
> > > I have analyzed this issue and successfully reproduced locally.
> > > The race occurs between the timer callback (`sctp_generate_heartbeat_=
event`) and
> > > the transport cleanup path (`sctp_transport_free`):
> > >
> > > Task 1(Timer Softirq)               Task 2(sctp_transport_free)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > sctp_generate_heartbeat_event()
> > >   refcnt =3D 2
> > >
> > >   bh_lock_sock(sk)
> > >   sock_owned_by_user(sk)
> > >   mod_timer(&hb_timer) -> returns 0
> > >                                           sctp_transport_free()
> > >                                             transport->dead =3D 1
> > >                                             del_timer(&hb_timer) -> r=
eturns 1!
> > >                                               sctp_transport_put() (2=
 -> 1)
> > >                                             sctp_transport_put() (1 -=
> 0)
> > >                                               sctp_transport_destroy(=
)
> > >
> > >   sctp_transport_hold()
> > >     -> refcnt is 0, increment fails
> >
> > This should not be 0, as the transport must hold a refcnt to start the
> > hb_timer.
>
> Isn't there one hold sctp_generate_heartbeat_event() and a second for
> whatever 'task 2' is doing.
Right,

> When hb_timer is started it is given another hold (does it actually need =
one??).
You mean mod_timer() in sctp_generate_heartbeat_event()?  Yes, as it will
release the last one in out_unlock, it must hold a new one.

> So when hb_timer is deleted it's hold is removed.
> But the del_timer() is happening before the the extra hold is obtained.
>
Ahh, I can see the race now.

I remember you mentioned holding it before mod_reduce() in a previous
patch, maybe it will work here, like:

                sctp_transport_hold(transport);
                if (mod_timer(&transport->hb_timer, jiffies + (HZ/20)))
                        sctp_transport_put(transport);

Does it make sense?

Thanks.

> The RHS (task 2) would need to hold bh_lock_sock().
>
> Try giving sctp_generate_heartbeat_event() two holds.
>
> David
>
>
> >
> > Also, the delay below is under bh_lock_sock(), so it should not be the
> > real cause of the issue.
> >
> > Could you share the PoC for this issue?
> >
> > Thanks.
> >
> > >   out_unlock:
> > >     sctp_transport_put() (0 -> -1)
> > >     -> refcount underflow warning!
> > >
> > >
> > >
> > > Adding a small delay  after `mod_timer()` increases the reproduction =
rate:
> > >
> > > --- a/net/sctp/sm_sideeffect.c
> > > +++ b/net/sctp/sm_sideeffect.c
> > > @@ -373,8 +373,10 @@ void sctp_generate_heartbeat_event(struct timer_=
list *t)
> > >                 pr_debug("%s: sock is busy\n", __func__);
> > >
> > >                 /* Try again later.  */
> > > -               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20=
)))
> > > +               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20=
))) {
> > > +                       mdelay(1);
> > >                         sctp_transport_hold(transport);
> > > +               }
> > >                 goto out_unlock;
> > >         }
> > >
> > > Any feedback or guidance would be greatly appreciated.
> > >
> > > --
> > > Best regards,
> > > Tangxin Xie
> > >
> >
>
