Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22337F32F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417297; cv=pass; b=jIOGFghqRZUgIXx4m/nvot33+5/bd3+bNWDvIwX9j6aj42dW8TyOzn4Kdg4RHNMpWvhVyUF8tQt+NGi6qF1mS4hIOTUxcC0igNlFIqEN8k9KCekGQXMMtkFdNhwU23zai4WCQoaFQqi6wtsWPI/UG9qtNjFH16czXFZNJPl2Ahs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417297; c=relaxed/simple;
	bh=MDyoROjaxtyy3kt1wLEk22lLIUHmORSnmJ1iUH6bkUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0tVvu+67JX8Io7zZz4GWfqz3YGRmtwWAiCr+fBBALODnP4eP8LfgfdTfjOr/fa3fVLak7ma3psg6aMH1K3R74yKhucDqm1TkIy17badAOZJEIocxJYz3GjRr/NkPF8rtNy1YqwuRbUvTEpCzH94vUa98wR2Pyx23NBs7LYIzgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzCBiyAv; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzCBiyAv"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90e9e042ee1so43417766d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789417295; cv=none;
        d=google.com; s=arc-20260327;
        b=qIfb5lhtQis4Taf0ZSCgcJA57C1jXIU3t4TTTQSXF7s0pQ6GL2KsUEQKI/b9VrENCc
         x+gsbJ5tAXdoC8x5nJyNmlLghJxgipClnb5Zegt71V3UK++Hav4+i+A1ubFo+PLMBBhr
         jLa7opw5FTWeEO257xQNCTrvNuzo4yD1ni/gSGQQoXgxtEnwpvrFad31n3fVtyPqcfiK
         twfXI0hH47v0woROXIRGAs17riuquAv5w1Dz9a84C0WSdf/SMz51Jz1RqDdvYeJndHfh
         5zBjZpJUHhsG2zIf2HVn3EkGc153hoMEGZ71aKXSJ8kiXJFjkk609BSJP9D7N41um5Cr
         nlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vB4z5ld/pqswcEJ5booeeR+UrUp3UtJZoZTxdNkowH4=;
        fh=8X45DOD6zSaeJjMft1WIVO8GkabTaT3to71JuOksid4=;
        b=BCdFR8BeS56L1FIK/G12ld5M4xlEqHE+rB52r+I3eWn6S10GCIqNChbvojETwqGBio
         lFdX3RKsOXwDCkH+YkD47/HTbCUtBnpnLg+vSq1EeKGg3eDFw1Tac6tAKxKXqEUA2QmW
         5mK6mKrBixGYAiQvrTtO/iXx66C/BzBgmKWTTYt1M5sRRtqd3ZHGzkvZjHsh8HwaPOEY
         OucI1Kf2phmwGu8ln5NPZOiXF+gvf1pkMbI3uTf3BOgp8vovQHO2hsScYk1li9y27L+n
         cCTTfYqmgRWV+57brjdUCifwjilTJtMFMWAcRhwsfPfovleRyzzbRn0HmReIhzMJiz3n
         wBoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789417295; x=1790022095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vB4z5ld/pqswcEJ5booeeR+UrUp3UtJZoZTxdNkowH4=;
        b=kzCBiyAvIknmqnPn20uUsa1lhbPWZ/rVFTCB48A2bA/PGjVd06fXdC6TCRJS3rIJPB
         PgJOOdKal7Nx4eLDDLbbUk6qWKs9s3rnpWqoIakReWbtLuj2fknLhvKLdr9tZYpz0ek9
         DQPzfoxV1Eo64mLfJGh/iFkG02Baw32TpNMeZO2Dexpb9yvHTGaS/qoo9t7K1nfTd991
         fZ6XU762ZBaCcPKqh+49ahudFTH26cukAZ/qSxMhreBcLJXVInVTOR99GBwnhxnTAEDA
         XFrlf4xmDpuxiPQQ/gPeLAYcqewaarHbCkoaV49VGLYpUqZXhXWmqaIvbgdub+myheDV
         riHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417295; x=1790022095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vB4z5ld/pqswcEJ5booeeR+UrUp3UtJZoZTxdNkowH4=;
        b=tWSmqg/Trk6S7Q/Ay1mDBiam8JxRelVdflLB1NopJLYOqEuFPVbzv6qjfPeWV32ylw
         bqqLrJbK/V5jRcSvDNnWDhIdRngO9/WPf9pILWwbH+QuVgbEauKHlDGSOclbtLRdcido
         jWaVCkxu1/AuQ10XPvJDcwYroSljO8IgDDKGns61xK0RyZIVyKE67aVoGMg2vsbtBNGk
         H0UMkBHUGzuGYW0mm+81KmiaRxgoRtbqHRoLBPTc92RHgV/FpKWn805Mbb/+32hW9KXM
         45GdhAxwMRrWPOyaGs5I6C30N82OzZMH7GAn0OplCLEOLYfobhon0Y+ZWyEe1QROIxTO
         /mzg==
X-Forwarded-Encrypted: i=1; AKwUvBzMJu7A6QsJ7HBZotgy/KbjKZJAHJQ1SvCTDv78no5kygQLuFz3xlaD5g3044HMmCve+zKd6H+uf74UuVk=@vger.kernel.org
X-Gm-Message-State: AFuF++mEkMaDwCi1BJ5EC5iEJyGtG/tx6fDZnzAzPpIxOJQ/n3dJKf2J
	OxffRLJJf24U4NHiCa9xC0bnK/Q9c0I4jeBr0el8EZ2z6gBWis2+LoHXrfukaMxbKytp5mNlpvo
	qWMDYJIR1lkdP1aJPQMfrgfkhvyeo/tL5SdfEoI5A
X-Gm-Gg: AYBFou3JhFZ5MQo6wIJt+E4Sz8KqtpFt4GaFpZf6nq4ZL/3qy17AZBqP9mPpdvG1mHF
	lWq9PuA4btV81+tIk+pK1NYYl7JHOiBtaQ3TybyDHBB91d1OUP6Qj9rnRGBAyCxegNynoYOj7jJ
	WCZy4H9OPErnfJW7Ll3z14shnP52+yTX/MG9/KCmAAYk+3zUQg2wUmHt7y4a+NntUmv7bDX/aPV
	J3j35/2KWXngZRbSFhbAHCBDmAhLxnnvzb8VWCUcaW74+C8TKgOLqYFHT+r02xq+dw6GrnLiD5H
	w1eL5BZqOO/sBAtriX8r0F7xUZUDeYTeXYwJDltHRp33f3bdRfYe+s/dlpnn0U2bTL4pHuXI731
	2KgAman+ODvhYt/aJdU+n3ghhvEhw9TlQPeMwjgkfC6B6ztCtIUSVWOx8Qax9owr1gjdJByQDjf
	+/WaGtUpKZIIOkVhj8Y8RFlQ==
X-Received: by 2002:ac8:5e4a:0:b0:52f:ade5:cf07 with SMTP id
 d75a77b69052e-5310d026154mr60992771cf.34.1789417294469; Mon, 14 Sep 2026
 13:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911073758.2714564-1-xiaolinkui@126.com> <CAAVpQUAUAgAVutpQgMu4LjG1KOpm9Du0Kw1kbp2vHtHqQ5USZw@mail.gmail.com>
 <CANn89iJTMxWERqz1tdxuQ2jW6Rr7xN_ceh_yejtrBTPwN_YEeg@mail.gmail.com>
In-Reply-To: <CANn89iJTMxWERqz1tdxuQ2jW6Rr7xN_ceh_yejtrBTPwN_YEeg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 13:21:22 -0700
X-Gm-Features: AcwNN1VHGOuXR92ZZx6YdPTmJhhi5lWBngDT8spr92jnLRYRfzCHvAqmKTmPEXE
Message-ID: <CANn89iJfphTDBFKdNkgmBHDybc8wV2EGSJoiHvzR0ht4V2bMAA@mail.gmail.com>
Subject: Re: [PATCH] ipv4: fib: annotate data-race around nh->nh_saddr
To: Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>
Cc: Linkui Xiao <xiaolinkui@126.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:57=E2=80=AFPM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Mon, Sep 14, 2026 at 12:51=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google=
.com> wrote:
> >
> > On Fri, Sep 11, 2026 at 12:38=E2=80=AFAM Linkui Xiao <xiaolinkui@126.co=
m> wrote:
> > >
> > > From: Linkui Xiao <xiaolinkui@kylinos.cn>
> > >
> > > fib_select_multipath() compares nexthop_nh->nh_saddr against the flow
> > > source address with no lock held, while fib_info_update_nhc_saddr()
> > > stores a new value from another CPU as soon as the preferred source
> > > address of the egress device changes.
> > >
> > > Commit 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_g=
enid
> > > and nh->nh_saddr") added WRITE_ONCE() on the store side and READ_ONCE=
()
> > > in fib_result_prefsrc() after syzbot reported
> > >
> > >         BUG: KCSAN: data-race in fib_select_path / fib_select_path
> > >
> > > but it only covered that reader. fib_select_multipath(), reached from
> > > fib_select_path(), is a second lockless reader of nh->nh_saddr and wa=
s
> > > left bare.
> >
> > 32607a332cfe added the reader after 195374d89368.
> >
>
> Indeed, please put in V2:
>
> Fixes: 32607a332cfe ("ipv4: prefer multipath nexthop that matches
> source address")

Adding Willem

It seems that this code also lacks a check against genid?

diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
index 50e96f86ca59ab164f764f5d2185d158c14a4a6a..5a8bbcb65daaada1c3ae96339ca=
bc2e801653dac
100644
--- a/net/ipv4/fib_semantics.c
+++ b/net/ipv4/fib_semantics.c
@@ -2185,6 +2185,7 @@ void fib_select_multipath(struct fib_result
*res, int hash,
        bool use_neigh;
        int score =3D -1;
        __be32 saddr;
+       int genid;

        if (unlikely(res->fi->nh)) {
                nexthop_path_fib_result(res, hash);
@@ -2193,6 +2194,7 @@ void fib_select_multipath(struct fib_result
*res, int hash,

        use_neigh =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_use_neigh);
        saddr =3D fl4 ? fl4->saddr : 0;
+       genid =3D saddr ? atomic_read(&net->ipv4.dev_addr_genid) : 0;

        change_nexthops(fi) {
                int nh_upper_bound, nh_score =3D 0;
@@ -2205,7 +2207,9 @@ void fib_select_multipath(struct fib_result
*res, int hash,
                    (use_neigh && !fib_good_nh(nexthop_nh)))
                        continue;

-               if (saddr && nexthop_nh->nh_saddr =3D=3D saddr)
+               if (saddr &&
+                   READ_ONCE(nexthop_nh->nh_saddr_genid) =3D=3D genid &&
+                   READ_ONCE(nexthop_nh->nh_saddr) =3D=3D saddr)
                        nh_score +=3D 2;
                if (hash <=3D nh_upper_bound)
                        nh_score++;
