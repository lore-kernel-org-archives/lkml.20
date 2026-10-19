Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86FE21D5AF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370435; cv=pass; b=epqdhIk2vDV1wnYdOIPRU/WPrOZMnGCjeQxRyo6a/M5/pedc4n0ni4+TFTDnhuwtD7ntW5Vxdb3ofp9+HoysJNfi1M/6M7LxwGycwaBEcTX/JqVtjVCROpYBd7N3i/a80ns8/yPG8fvY68H8TZRiP42Yr4xISInbzY2OAh5utlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370435; c=relaxed/simple;
	bh=4mT1f/FkgEWZvx3hboa1SfVZRjzrNNR4fyTa9aEM4sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIPQH0vVF737vBqtUCbN6SS0jpkohQTLX/qLmYHzTH1MNZwr1xxZ9qd/8WoDwCYWkbBKLvGAlUimV/2nUG9Cjb36MAk18oLzxQXcuhtrRT9oG/aq+TXLMohWH0Jo4t1ELHss9uea5YJxrGpZF1sHnhGWvWnnwqgsB2gGTWO3uDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYJKSytx; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYJKSytx"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab38a051aaso11672457b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792370433; cv=none;
        d=google.com; s=arc-20260327;
        b=ChrNVO758unJCuv8RB86LH/3lT1hLcoBXp4nI+VgIlPIXicbNfrYuveaOgOL7OgIq8
         kG7W/wb2cMi5G6Zsp/heW9Q2zE417cyx0Y+Gbdw4JDSKRUZGpb+nxayd0MeAL7sowLfE
         7UK/iSC2BqLemp7uJAV8xZghj+I+fBhKe4Sz3mQSQ8I7e3cGgCeVKCRXa2dRSlI2uKWy
         SfNHUGcUvrGwdkE+MQOykwc1Auu2WZGpCpsUHJGRk7/sy2m/HnfH0oswdTJM/2PVE09d
         VvfApPfG/KUgYGvI99nlLXgBrIVksSE87PZtkdgM7qtIKmMC9QsK5pz7goL1VkAa1QHv
         8fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hWed0IDwBI9tkyg2fqDRId8vpQroFOJCTY18+5ctqrw=;
        fh=DaB/Ub+Dvj9R+MUSnDsNm8clNGAJleBVA0pUBaCksh0=;
        b=p7G2tB2kuF3tZmh9s9wjcckmNvsdBpF6EcR+uwspG/PTQC62RkW1ECI1Ah+8D9QTmo
         DgDF7y3O26wErbKqLBQnEhh3LlAUDXXJ9YiwjyO4hBs2I7Bqpc5yMmg37f80oln1Nusg
         5yA+Q89PyelxOd4eQTYCvk7t3/tyKfhcO5Q2SZDHz+EALTlOJKvaBvAGvzDo5AkZnsyF
         1/JEFRv6Po6mi55d0gWYHwyzzyNvOmbOHiYP/PUSN0Tk+7soB7CKZil3iZ6u9YYurdF/
         GACAqMW78Y8weXRSqf8Z+SnHG4X9vI6FWpCCojVjx+jUqzZAXb1p3bxpXkZI6HS/zGTO
         fyZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370433; x=1792975233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hWed0IDwBI9tkyg2fqDRId8vpQroFOJCTY18+5ctqrw=;
        b=OYJKSytx6PpRGJajfOHJjiBvryNaJZL7vmQfIoEUGjrEKY//JOXcA7g2nm20q/yQ0q
         L/iTKkfJT8cC9FZafiMKGhi6uPU5nzRDP92mSgGjhzQaf+cwwH+kLbA5aFXYlz7SBUtr
         hgbWTKlX+DzlJ5aD/5op9qxlckif9czwaKGwR9/e3cM1gaBHpa6KQxM/wablbxZ2Eeh4
         jK+nLHV9EnLxk9IEz/uWycPq4iU+1WsOnOr6DLHJ7XUxZeGIPcZc+E3Lf8XT3OJU32gf
         aSXXQbn34UMOwVUJHx8todlBpaQBcwcIFPw1d8nyJPnJ3RcKbGj/ss9iZdT7kXWlLUT0
         IE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370433; x=1792975233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWed0IDwBI9tkyg2fqDRId8vpQroFOJCTY18+5ctqrw=;
        b=MyxhlW2G2cxreZ7peEYUIYf8/pDu/v3s79oCBmRAQgK4OK2iT15bEzMYnvVEoRYmiZ
         /AfpPKkExqLZYX77Whv5VA7OVoVvExfvrfOSBYcEKVenNX+rnLmlwEt0tLT5zY3hRz1i
         Wkj9T/WM5FTyAwlvJo0LS92Fj4yZ3+DfVp3IeoHRj58uycLcVVu9hlv9gIQF+KKS7ugz
         gKGKJySnBWkkv3M94PK3ZntpS8ZB+uW8BQeA5CkJylJl9pOUk+dM9ZbMXccaG2dWt2zZ
         hbgFcnRb/PUIVKV3GumuNgVLzL9ZVbaCaP+SBYzrv4RfJoU2DPfEaqOMOSIjreZaKKcV
         bZuQ==
X-Forwarded-Encrypted: i=1; AKwUvByz3BQb390SZrQzhwv4bDggEfAZ+jK8onY+S4AXeo+FFfXKNyLCItbd0To0B/Nn+hvhKYLwYy1FEY77qm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/fXviXMclrAYbBNNHU9sRimn/B014AArtTTG6PSJLxF5o8rq4
	33O2zcK22DYh3CdAc7hBFV8XrRAiXRpbBLrHHdunImZUT3oNVF0tTn4mHF3N8dRO8Hfx/WL7aUB
	/nGjbwTcOwVFcCq+DQU87/PoZ89OctmQ=
X-Gm-Gg: AYBFou1vLFdJA1PP7/NlQXNBLTpDsAPDYE4c3YetXBUvKLkPOd6li0iXVDH8lc2F4xY
	PWg3cWf2GllcYB8ZD4LgozMcuSrRBUAVy+j1aQOFRODZp2qIaUkr2mp/ZZb7KXTnXLc9YqjcOhr
	R2AD+GCUO4huyk7nWfcA4fZztmBN3ZSNS7HV40CIJP+DbePhGc2On7aeSzyrJTGDvJDjUDFjk28
	zTghz5NdS3GC9DapBhvx65Nzh3ZAHqn6IFZpjVaj8uc2DxVrI0iJlhkLaoE0nDlNKOi4BvH5hkK
	mESHy5s4XGygcH6rR8TZ/MliYBJ6WEUnm3yMNbLaxHRVIjJUyS8TTUy9fYnHIvHR4KlKVTC2edT
	VkViDB9T76IQBSQfmXtWYHMBmF84p6xMiGjFfhtlIeoeK
X-Received: by 2002:a05:690c:47ca:b0:8b0:cc24:f7b8 with SMTP id
 00721157ae682-8b0f2245744mr13155427b3.69.1792370432796; Sun, 18 Oct 2026
 17:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018113312.10455-1-kartikey406@gmail.com> <c19a047cc3abde3ee342cf4188620e70ab51b429.camel@kernel.org>
 <179235634403.1724252.2120669689990867061@noble.neil.brown.name>
In-Reply-To: <179235634403.1724252.2120669689990867061@noble.neil.brown.name>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 19 Oct 2026 06:10:20 +0530
X-Gm-Features: AclHuK-k7bBUnVWcQDeP4Fon2Hb1aX5pEUZH9n4MT7krgkcfy_LsGVwYyWucUSo
Message-ID: <CADhLXY4Gv6tt5xXsGZt=h1gyRwxcsAy3G50=_9=vbk4GrkJafg@mail.gmail.com>
Subject: Re: [PATCH] nfsd: fix out-of-bounds read of sv_permsocks when
 starting a thread
To: NeilBrown <neil@brown.name>
Cc: Jeff Layton <jlayton@kernel.org>, cel@kernel.org, okorniev@redhat.com, 
	Dai.Ngo@oracle.com, tom@talpey.com, bfields@fieldses.org, 
	skinsbursky@parallels.com, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:15=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> On Sun, 18 Oct 2026, Jeff Layton wrote:
> > On Sun, 2026-10-18 at 17:03 +0530, Deepanshu Kartikey wrote:
> > > nfsd() derives its struct net from the first entry of
> > > serv->sv_permsocks using list_entry() without checking that the list
> > > is non-empty. If the list is empty, list_entry() returns a bogus
> > > svc_xprt computed from the list head embedded in struct svc_serv, and
> > > the following perm_sock->xpt_net load reads far past the end of the
> > > svc_serv allocation:
> > >
> > >   BUG: KASAN: slab-out-of-bounds in nfsd+0x118/0xbc0 fs/nfsd/nfssvc.c=
:894
> > >   Read of size 8 at addr ffff88802d423f50 by task nfsd/5988
> > >
> > > The list can be empty because nothing guarantees that a permanent
> > > listener exists while a thread starts. With dynamic thread spawning, =
a
> > > thread can begin running after the last listener has been closed and
> > > removed.
> > >
> > > Take sv_lock, which protects sv_permsocks, and check for an empty lis=
t
> > > and read xpt_net in the same critical section. If there is no
> > > permanent socket, report -ENOTCONN through svc_thread_init_status(),
> > > which wakes the creator and exits the thread, instead of dereferencin=
g
> > > a bogus pointer.
> > >
> > > Fixes: 88c476661719 ("nfsd: pass proper net to nfsd_destroy() from NF=
Sd kthreads")
> > > Reported-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D561b859d032c8bf2fb5=
3
> > > Tested-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> > >  fs/nfsd/nfssvc.c | 22 ++++++++++++++++++----
> > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/fs/nfsd/nfssvc.c b/fs/nfsd/nfssvc.c
> > > index 2edf716ea022..da6fce79efae 100644
> > > --- a/fs/nfsd/nfssvc.c
> > > +++ b/fs/nfsd/nfssvc.c
> > > @@ -890,17 +890,31 @@ nfsd(void *vrqstp)
> > >  {
> > >     struct svc_rqst *rqstp =3D (struct svc_rqst *) vrqstp;
> > >     struct svc_pool *pool =3D rqstp->rq_pool;
> > > -   struct svc_xprt *perm_sock =3D list_entry(rqstp->rq_server->sv_pe=
rmsocks.next, typeof(struct svc_xprt), xpt_list);
> > > -   struct net *net =3D perm_sock->xpt_net;
> > > -   struct nfsd_net *nn =3D net_generic(net, nfsd_net_id);
> > > +   struct svc_serv *serv =3D rqstp->rq_server;
> > > +   struct svc_xprt *perm_sock;
> > > +   struct net *net =3D NULL;
> > > +   struct nfsd_net *nn =3D NULL;
> > >     struct nfsd_thread_local_info ntli =3D { };
> > >     bool have_mutex =3D false;
> > > +   int err =3D 0;
> > > +
> > > +   spin_lock_bh(&serv->sv_lock);
> > > +   if (list_empty(&serv->sv_permsocks)) {
> > > +           err =3D -ENOTCONN;
> > > +   } else {
> > > +           perm_sock =3D list_first_entry(&serv->sv_permsocks,
> > > +                                        struct svc_xprt, xpt_list);
> > > +           net =3D perm_sock->xpt_net;
> > > +   }
> > > +   spin_unlock_bh(&serv->sv_lock);
> > >
> > >
> >
> > There is another way to get to the nfsd_net here. It turns out that the
> > sv_stats field for nfsd always points to the one embedded in nfsd_net,
> > so we could avoid the socket lists altogether by just doing something
> > like:
> >
> >   struct nfsd_net *nn =3D container_of(rqstp->rq_server->sv_stats,
> >                                    struct nfsd_net, nfsd_svcstats);
> >
> > That avoids the extra locking, but it seems a little weird to depend on
> > the sv_stats field. Maybe we could wrap that in a little helper or
> > something to make it less ugly?
> >
> > An alternative would be to add a serv->sv_net field, but most services
> > are not per-net. nfsd is the exception so it's the only one that would
> > use it.
>
> Most services don't use svc_create_pooled() either - only nfsd.
> I would add a 'struct net*' arg to svc_create_pooled() and
> store it in serv->sv_net as you suggest.
>
> Thanks,
> NeilBrown
>
> >
> > >
> > > +   if (!err)
> > > +           nn =3D net_generic(net, nfsd_net_id);
> > >     /* At this point, the thread shares current->fs
> > >      * with the init process. We need to create files with the
> > >      * umask as defined by the client instead of init's umask.
> > >      */
> > > -   svc_thread_init_status(rqstp, unshare_fs_struct());
> > > +   svc_thread_init_status(rqstp, err ?: unshare_fs_struct());
> > >
> > >     current->fs->umask =3D 0;
> > >
> >
> > --
> > Jeff Layton <jlayton@kernel.org>
> >
> >
>


Thanks Jeff and Neil, for the review. I will make the changes and
submit patch v2 shortly.

Thanks

Deepanshu
