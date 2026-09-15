Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC9406805
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442639; cv=pass; b=k77zhMnH0w8ujDRtpAd7b7dTYjglS7tzTRrTseFa2BrjyTHtImsOWR9FdAxFcZSLSzsJITEE8IS3vcwwX/ZLPzxlzM6XtluL+UrHozMMYFHW8xAn2Ye7QPLg+vrCD2txKrjz8BTNAMUzOTqk6FBrQRq8RVDvXaY1uuEQHfbDsnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442639; c=relaxed/simple;
	bh=hrlqEHIst1+X+TMWk/G28Uq0LlSGdUaoK7pgCo9bqCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTCZPnDQ+2brnGKPXVvDeMh/QPHQTXoQYzTdINjWNNAMPsjsGHySBqSG1jG9UoUPgzXWmLGcbg+TF7gW1xCfk+0H+lhaR9bEPFZx/uEm5S+PfKsb45sSFEkvYqn4dWH2pnkUUwAQO78inNsHsFat9+zhX/DFVZWuqwniN/uiYqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+S9KbHQ; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+S9KbHQ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso44255871cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789442634; cv=none;
        d=google.com; s=arc-20260327;
        b=bcry8HUjDmwwJ/oix6mnME+7EhKGaTH8MhZFYRlHMAdzg1v6wBMvw7DcXgjJAPgRnC
         Lh5TjGXCONX2bHWxbLdVi4EQptyr853rknSV7s4Zm7ZGmWjzLD7LEDTqh0M8GQzgsMvb
         F/YevAAD8mf16OS0HEkL8qXp9JFM2CrwZo+0qcNFuoW5AtbIPHs0sqrWp/KIyCLsTmLF
         IXjJuuCWRQnbda/102g3Ij9uHvYv53TnfRrtD245UDPmK7JqtkU2W/dAHlB7t2efiyhf
         0sI/7bPFQIP/EQ5WJ+Z7sfGueOMvREuWctWBp2lVuR4b+2x+OEIoE/MUZvLaCo3CLrFZ
         LeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2EsZhkDukapRbXUxImFy1u31FPKcjz83SS6cNGFy7U=;
        fh=t5XufKPyDwryy0ZGoEkg1r6eKkiFReGrsY5c15Qx9Tw=;
        b=aWbIXfidih+zuKPmnux3S5OIjJPIjpjExTqtcxdA6sET41xZyk/vpvE38r+6TYEHN4
         I3vK0KDNJgYMcf8wUcpM0Jbb5aibKHcWsTuCuDl0bdQO0sqdPUnJ66tuWjwpY13fsExa
         dYKOOEnqsrNSz89Xb77x7QGB/QgGmUqhtyXJ/tqiv8SEuvXfhPLWdVWPu6lR/WkD0Kv6
         OBFa5paotqroR0XO4rg7PQ1vG/a8vIRC8Xnz1e2/0yRQZj9YOVSsrOqPdCO2ocoeQT1w
         AjuOy8Do/eB8v5X3eezKLf+FxYDL6vyH+sYON68Z+/XL94Yl1CBISgblZRVMaTCOzYdA
         75Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789442634; x=1790047434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2EsZhkDukapRbXUxImFy1u31FPKcjz83SS6cNGFy7U=;
        b=J+S9KbHQkhc8Wuy3uBKOw2ZZjCiK5jHRfY+HRx1LYECYkHL8KGu1neRZhCeq2G8Ixc
         85vDh1FwYQ17xgYR6oe5rUT/BXogMU3ZS3JbUPWan+VNjV6MCeIYn/QR1iu6A3OtvGut
         wenUevD91b7hpGDeEYVjtQ4n+j1etPnaP6+hsWZxL06fGAK1j3yxP0YHWQgEJT0jdPDi
         T4dHvR4/4GEWmDAxIYwp4GcDWp1kL5TR2Qbvt3r5lVNPlIGhuNmH6gkrImTgGs56bzpL
         l496FFyZZd0kwiqrVASlMsn9w+fZKrw7MZ0jnlGZTkGqayjfBd8An0TZoYqjQqJbbhFg
         wgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789442634; x=1790047434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2EsZhkDukapRbXUxImFy1u31FPKcjz83SS6cNGFy7U=;
        b=sYi1ooD9shtfRZ+AcOiJTKAXaKQaAm4RXgowFdyfGvpKaCWRjyCgUMFwOkLSGMA8Mv
         aRkRxhnKxUdCOmcZJMJVZOBNNMkI2RgOCmuvWKLtYbfsdG/jz/9RhJ9zSHDxrR8Bso+Q
         UfT5bqTYb6D7Xfh+32+ShAd2CvPRKhScP9Cr9DpMzKctL4ZMxPRxzAKsxD/KoptNBPpE
         sWsI8RPA3IDfxkOzvZ486UExJwNLzGLMLL1jXJYLJDKSFWcw1lFtGvbPIO2qhPjnAuC1
         XnNMIPxYKwljq0+jo19npq6wd25xzZIuVvQC5Iic4VslZlWHKMouG6+XjBS0lzu2wUHx
         4bFA==
X-Forwarded-Encrypted: i=1; AKwUvByrVPa9fhEeamfmz9lQIaKWAcZJM6XkaMenCxfYowip1ufe7Vlsb5zdh6bVe8pjUvyV0BYfCPpnnGViuYY=@vger.kernel.org
X-Gm-Message-State: AFuF++kiKo1+L7wf38xHQCoFaNVGOoFrWfC5Q0KlE3we8WmgtfIn5fll
	6ULP938SJnAI6J5sbprNWw758gUNLkpBnocqvBu1fbp7oNRxankIkeylEFW9xqPGkdqIIvisVa7
	pszJF/6wEZC/meil5FbVRVsTUo/9vURPI6zB0XNNP
X-Gm-Gg: AYBFou009A0crnmIGpC/YIXJ1mTBld/mbdCcN0+SZgBH9K4d9Ih3hZSlGdFGbt9GmTg
	QDabzD2W13OI/VP8CPD06WWttQUzH2FnKc8Jgr9cQvxEj0kQX/hKl6MRWDZQsjGWSIrEOOvEKWn
	aJoo0KcEwjwdLSMIT8REE2U9lcaMRgojYEoSCl1uRL+oCCXf8dhSANvKFsnV814DEeTO27sBZSz
	9l75nSOhN1pnNVFLkwNcR68uHfYj7dHELzTqm6qten6aPLZ8dlOcKSdTv+d9x0XarkZ8/z01IDv
	m7EcB2R6EDdJOG/xF9k1lIwU3vndWepYTsYapcCL5bTAwIwH5MCOAOrGtyha4O9bquAn0qvoyXZ
	Z+q4+k+g8OZTjTuI5+W3d3ZQjLRaWmh3IMLCbd1u32YgMgJpMM0RtDtnD3wGl4hZ14rf08Z2OHG
	Ghbw==
X-Received: by 2002:a05:622a:15c5:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-5310cf42260mr79871191cf.15.1789442633858; Mon, 14 Sep 2026
 20:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073758.2714564-1-xiaolinkui@126.com> <CAAVpQUAUAgAVutpQgMu4LjG1KOpm9Du0Kw1kbp2vHtHqQ5USZw@mail.gmail.com>
 <CANn89iJTMxWERqz1tdxuQ2jW6Rr7xN_ceh_yejtrBTPwN_YEeg@mail.gmail.com>
 <CANn89iJfphTDBFKdNkgmBHDybc8wV2EGSJoiHvzR0ht4V2bMAA@mail.gmail.com> <182acfbd-d03a-4847-8fb8-4d0d29f22107@126.com>
In-Reply-To: <182acfbd-d03a-4847-8fb8-4d0d29f22107@126.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 20:23:41 -0700
X-Gm-Features: AcwNN1W3r4K_dqI2PDFpl2Z4moprvaKFdCce3ABAcBP6EBshrMSO52lUYdXu3_g
Message-ID: <CANn89iJhFL2LNQCXTANQAx8B1GVdGTJgrDwPTZOjbH8k1ygtsg@mail.gmail.com>
Subject: Re: [PATCH] ipv4: fib: annotate data-race around nh->nh_saddr
To: Linkui Xiao <xiaolinkui@126.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:37=E2=80=AFPM Linkui Xiao <xiaolinkui@126.com> wr=
ote:
>
>
>
> On 2026/9/15 04:21, Eric Dumazet wrote:
> > On Mon, Sep 14, 2026 at 12:57=E2=80=AFPM Eric Dumazet <edumazet@google.=
com> wrote:
> >>
> >> On Mon, Sep 14, 2026 at 12:51=E2=80=AFPM Kuniyuki Iwashima <kuniyu@goo=
gle.com> wrote:
> >>>
> >>> On Fri, Sep 11, 2026 at 12:38=E2=80=AFAM Linkui Xiao <xiaolinkui@126.=
com> wrote:
> >>>>
> >>>> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> >>>>
> >>>> fib_select_multipath() compares nexthop_nh->nh_saddr against the flo=
w
> >>>> source address with no lock held, while fib_info_update_nhc_saddr()
> >>>> stores a new value from another CPU as soon as the preferred source
> >>>> address of the egress device changes.
> >>>>
> >>>> Commit 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_=
genid
> >>>> and nh->nh_saddr") added WRITE_ONCE() on the store side and READ_ONC=
E()
> >>>> in fib_result_prefsrc() after syzbot reported
> >>>>
> >>>>          BUG: KCSAN: data-race in fib_select_path / fib_select_path
> >>>>
> >>>> but it only covered that reader. fib_select_multipath(), reached fro=
m
> >>>> fib_select_path(), is a second lockless reader of nh->nh_saddr and w=
as
> >>>> left bare.
> >>>
> >>> 32607a332cfe added the reader after 195374d89368.
> >>>
> >>
> >> Indeed, please put in V2:
> >>
> >> Fixes: 32607a332cfe ("ipv4: prefer multipath nexthop that matches
> >> source address")
> >
> > Adding Willem
> >
> > It seems that this code also lacks a check against genid?
> Thanks Eric and Kuniyuki for the correction. I'll send a V2 with Fixes:
> 32607a332cfe.
>
> Kuniyuki, good catch on the missing genid check. nh_saddr is only
> meaningful when nh_saddr_genid matches dev_addr_genid, and
> fib_select_multipath() currently skips that validation. I'll fold the
> genid check into V2 along with the READ_ONCE annotations, unless you'd
> prefer to send it as a separate patch. Let me know.
>

I (Eric) was the one who mentioned the genid thing :)

Send a V2 with both bugs fixed.
Thanks

> Best regards,
> Linkui Xiao
> >
> > diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
> > index 50e96f86ca59ab164f764f5d2185d158c14a4a6a..5a8bbcb65daaada1c3ae963=
39cabc2e801653dac
> > 100644
> > --- a/net/ipv4/fib_semantics.c
> > +++ b/net/ipv4/fib_semantics.c
> > @@ -2185,6 +2185,7 @@ void fib_select_multipath(struct fib_result
> > *res, int hash,
> >          bool use_neigh;
> >          int score =3D -1;
> >          __be32 saddr;
> > +       int genid;
> >
> >          if (unlikely(res->fi->nh)) {
> >                  nexthop_path_fib_result(res, hash);
> > @@ -2193,6 +2194,7 @@ void fib_select_multipath(struct fib_result
> > *res, int hash,
> >
> >          use_neigh =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_use_nei=
gh);
> >          saddr =3D fl4 ? fl4->saddr : 0;
> > +       genid =3D saddr ? atomic_read(&net->ipv4.dev_addr_genid) : 0;
> >
> >          change_nexthops(fi) {
> >                  int nh_upper_bound, nh_score =3D 0;
> > @@ -2205,7 +2207,9 @@ void fib_select_multipath(struct fib_result
> > *res, int hash,
> >                      (use_neigh && !fib_good_nh(nexthop_nh)))
> >                          continue;
> >
> > -               if (saddr && nexthop_nh->nh_saddr =3D=3D saddr)
> > +               if (saddr &&
> > +                   READ_ONCE(nexthop_nh->nh_saddr_genid) =3D=3D genid =
&&
> > +                   READ_ONCE(nexthop_nh->nh_saddr) =3D=3D saddr)
> >                          nh_score +=3D 2;
> >                  if (hash <=3D nh_upper_bound)
> >                          nh_score++;
>
