Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D83BCD3A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003188; cv=pass; b=tSAjQoJzSmyMgl3qpFY4DvgHgatAT0oSM+w2Bk2pRA13VMbxntMDDFMyjNkp/rPgTiH+aoD8gwzmYIxVPyZqkgjS08RiF0BH5mJaAZ7j3iQEb9qqsRtUcPA4MVbBSQ6QyRKiX/U70nNMhtOojxBCUbUsxMGxpGMs+8RkNSK2TPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003188; c=relaxed/simple;
	bh=Hi3oLimrk06HY77N752dV/sqU29cIiskVgmmFoM1BrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxcOTpVBOKY85NvIn2XlEUZSHhUyc0TQJLz9dEtCOaGewoonuVzY9CPBlfT+RtdoZOkCjehfyCAktdvBCtuuMQKzMf2XLzJlAiR4+RZtO9yF9KnvY5kMnBYKIm/KRDHh2SG9Sve6Dsd7SH6MAiul7VcT9eXHEvXzw9C8ATxvbqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlGT/VHy; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlGT/VHy"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dd8e918218so193635eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792003186; cv=none;
        d=google.com; s=arc-20260327;
        b=AbL/VI3VPaQVARE7g7M7XBektKEaGc32i5Yoy4S6+Mu5TLWEAHY3BA31n1+0HfSweT
         Gdur0I9XEqokzl5XYvKccPEUj88+9XNSeaH7QMceZv15mVr/g6ts/DmLyYXn3QP8k2JN
         IZZmlCk3ejR+zLWSM+SHtCBhQ60QEe2LGGnv3tY4loOKfgbx7IGF1yU8MeimEsYfNPpc
         6dGhIQrmB/JmSVKbVlbuNaw2KkfdRmhlrNexP8UCC3P9KNCUp9OXgT6hr9JFk4l/hvSH
         i9Q+U5JDZNPgXpVLtjOuMWjanpfaoyMU5YrWn534V9jgTBTF+/zWXjbmtx23ziLI5V3i
         4LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nfJLxdiTo6vJhA+TJkzuS9wIdOWg1+Cfb8ilaZ5iWJU=;
        fh=RXKK1IPn0Xjtsl7S7st9NIZGtQb3KAmEcC70g6t+RN4=;
        b=YFy7Jsd5KrvXE74yVGwZ+4WdjlCI1AI0wVGcL5/ifIAkE0QtkX+m/UWO8dhrdBxtjr
         5mlogDUtyNs6cnE9jqG16WQvWXNJ7pvpRuhA2pa7OythetQLaCYrB/BNY0XI7m1AHczj
         747KzW0gNkCL6fhQL35g/TjEwYuvvWV3nyuAAYDmNyrWhnAtoCDURRQl5kvcfx6RIW4e
         FCU1ygV2gmkxUuBA4+lRDAgBvJxpJbU9gAb3HGoWoNw0HY1PjUwEuz7K6Uv06JQxK9jO
         LRiEY33NzCON3RvP44j2w4aWoYEBYAvYGhXO63Wv2qfPsJn9UdX2oS4lmLoMdRLQOl4D
         x61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792003186; x=1792607986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nfJLxdiTo6vJhA+TJkzuS9wIdOWg1+Cfb8ilaZ5iWJU=;
        b=LlGT/VHyAgrN/IdTQ6Ev9lBxxjVLPU7IvPw+3n8w/2oSZdb4C4GhiwCyYdc05MHGCW
         DIGRLng1bIT0K8ka2XlxR1z46Ab/bu8D3U3/nuCUNIDNA95ZU7v+coVJye3gTrtA8AD9
         Uv1G/uJm79zKmnNd0k+TGg471AH+FOZmqyOBlcAcOMzvU7crgj6Tnc3u5+AcPHBp9fTM
         TylteBLo+YMZlD7WH0+71IMu8/mABZyGEYwCAKeccW2uD0Vn6seyXJ7YTZnDcQivMpkG
         98BbtWtL1eFgGwe/hcSHdFOIZf1k211IhdoNQDpDKdHxO90/TK6Q5MP3YjSNwwEC1VMy
         blLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003186; x=1792607986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfJLxdiTo6vJhA+TJkzuS9wIdOWg1+Cfb8ilaZ5iWJU=;
        b=qenxK/BA0PhIe9db3qFAYm6yvIZC2JfuiABRjMXeZWpZkwAHnqhSeVuJVguhpKPM2v
         VpRIzI16c1eroS9sWPjO/4GYVjx8gxyrdRS8zo19M6KnAsVOiMnEKrSnaix/lN8d1cBx
         O4XciLnZMaDJbPc4mRcuxVDKDlnb6HV4jE/4dS5horlwcuOlyelezMOk7ILKxElcHltl
         dH8Js4kfamQX90s+NcKbC6o3x1+IvNbA09AIUIr1MNsWv1xRZmaWNQgz//nRDFezCOVV
         SFg/rEOy0Rjk3YAeL3q1kdNb5RIe6crG8Q/X32NzihHggoSKk1X7wHjzY5Kp3R78/kBh
         Sreg==
X-Forwarded-Encrypted: i=1; AKwUvBzn3hFhYNcHJwNWS1ItsgAsrmn2MrB1//6IBai+igg4aRtXZkxrl1ZjJCrRMSANPcIiQXBv2nG8dFGpXtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdqNuK182WJ/8MDcqbSjG33iBtVmjdXjMISNp9fOWlmuTmimK0
	Y9joR4yjYPEPzOWOr4gfXV8pO9x1xKLw2AxYXk+oTxgRU6Tzx86lvzzvO7PneHbhk0U6plSAB+X
	bDc6eIIYG3twdsRY3fnd4DGlHXldmwL4=
X-Gm-Gg: AYBFou0MqKFVD9lhcGcnpFmylLRyqSfEOE099qs2NEHxkJwsxPQspoSdtMxAXP+uPev
	cxWmStQ0kQE5ctYkMe1E5PEw7fmjfIJbIxAH1AgK0V/JOZtT+TxXP/lKOdQcsRRCiQ8YHwqD51u
	4Yt4Q+IUxisrZiMmBvRoJXCN/MMPw0xkOzxvP1VZ+al2OpSj8UCPBxHstI11Hmwm+HmAn6VUTPJ
	6NSg4nhXLNlM93I6Z0Piyulb+sQl6LlyfZSA4cMyDHQVTf4K6prhzXt+3XyEC7QGi/PlPIgmtmp
	0aWdCvKtjBaLTM4i5sG+yae+jd1JMWO3ZuF8gzrqXUlfgT7DvDlPYKwbGm7GfoTZlJXxWSw=
X-Received: by 2002:a05:6808:50a8:b0:4e8:9e40:a0dc with SMTP id
 5614622812f47-50c41108624mr24831152b6e.1.1792003186157; Wed, 14 Oct 2026
 11:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-netcons-fixes-next-v2-1-ac8ec4c62edb@gmail.com> <179191204261.434549.8984165771561140450@kernel.org>
In-Reply-To: <179191204261.434549.8984165771561140450@kernel.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 14 Oct 2026 19:39:35 +0100
X-Gm-Features: AclHuK9H5B8TXm5v5mDMBoKGdofCkC_RwhygYwsXkWt2btKwSIv0kBCAj4jxGFY
Message-ID: <CAGSyskXLys0G5MzhnRjGzLBFcsGfWUwJbBSxOezL+1UpPqc2NA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] netconsole: avoid printing partially
 updated target attributes
To: netdev-bot+sashiko@kernel.org
Cc: leitao@debian.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 6:20=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In drivers/net/netconsole.c, local_mac_show() still takes no
>   lock.
> - [High] dev_name_show() still races with netconsole_netdev_event()
>   writing np.dev_name, even though the commit message says this race is=
=E2=80=A6
> - [Low] The commit fixes a user-visible race: configfs *_show() callbacks
>   can return torn values while a store or the netdev notifier updates=E2=
=80=A6
>
> --
>
> netconsole: avoid printing partially updated target attributes
>
> This patch makes the netconsole configfs *_show() callbacks take
> dynamic_netconsole_mutex, so they no longer return values that a
> concurrent store has only partly updated. dev_name_show() also takes
> target_list_lock to serialize against the NETDEV_CHANGENAME update in
> netconsole_netdev_event().
>
> > Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-ne=
tcons_ipv6-v3-7-bc0915e8c75f@gmail.com
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-ne=
tcons-fixes-v1-0-bb5ffe5e698a%40gmail.com
> > Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
>
> [Severity: Low]
> Should this have a Fixes: tag?
>
> The unlocked readers in dev_name_show(), remote_mac_show() and
> local_mac_show() date back to commit 0bcc1816188e ("[NET] netconsole:
> Support dynamic reconfiguration using configfs").
>
> The family/address tearing in local_ip_show() and remote_ip_show() comes
> from the more recent inet_addr/family rework (commits 46b3f9e7e761,
> 56ddc8d48e75 and f6e96d72f64a).
>
> > diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> > index 267254f046de9..953a1da071862 100644
> > --- a/drivers/net/netconsole.c
> > +++ b/drivers/net/netconsole.c
> > @@ -859,7 +859,20 @@ static ssize_t release_show(struct config_item *it=
em, char *buf)
> >
> >  static ssize_t dev_name_show(struct config_item *item, char *buf)
> >  {
> > -     return sysfs_emit(buf, "%s\n", to_target(item)->np.dev_name);
> > +     struct netconsole_target *nt =3D to_target(item);
> > +     unsigned long flags;
> > +     int ret;
> > +
> > +     dynamic_netconsole_mutex_lock();
> > +     /* Hold target_list_lock to prevent racing against
> > +      * netconsole_netdev_event() changing np.dev_name.
> > +      */
> > +     spin_lock_irqsave(&target_list_lock, flags);
> > +     ret =3D sysfs_emit(buf, "%s\n", nt->np.dev_name);
> > +     spin_unlock_irqrestore(&target_list_lock, flags);
>
> [Severity: High]
> Does target_list_lock cover every place where netconsole_netdev_event()
> changes np.dev_name?
>
> It covers the NETDEV_CHANGENAME strscpy(). For NETDEV_UNREGISTER,
> NETDEV_RELEASE and NETDEV_JOIN, though, the notifier drops
> target_list_lock before it cleans up the target:
>
> netconsole_netdev_event()
>     spin_unlock_irqrestore(&target_list_lock, flags);
>     mutex_unlock(&target_cleanup_list_lock);
>     ...
>     netconsole_process_cleanups_core()
>         mutex_lock(&target_cleanup_list_lock);
>         netcons_release_dev(nt)
>             do_netpoll_cleanup(&nt->np);
>             if (bound_by_mac(nt))
>                 memset(&nt->np.dev_name, 0, IFNAMSIZ);
>         spin_lock_irqsave(&target_list_lock, flags);
>         list_move(&nt->list, &target_list);
>
> The memset in netcons_release_dev() runs with only RTNL and
> target_cleanup_list_lock held. Neither dynamic_netconsole_mutex nor
> target_list_lock is held, so the new dev_name_show() has no lock in
> common with this writer.
>
> MAC-bound targets do show up in configfs. A netconsole=3D cmdline target
> bound by MAC is exposed through populate_configfs_item(), and
> netpoll_setup() fills np.dev_name from ndev->name.
>
> For such a target, can the sysfs_emit() here still copy a partly zeroed
> name?

This might happen, though quite unlikely and it has limited impact:
printing a truncated device name.
The fix would be taking target_list_lock around the memset in
netcons_release_dev().
I'm not convinced it is worth it, but happy to spin another revision
if someone thinks otherwise.

>
> Two options that look possible: take target_cleanup_list_lock in
> dev_name_show(), following the dynamic_netconsole_mutex ->
> target_cleanup_list_lock -> target_list_lock order that
> drop_netconsole_target() already uses. Or do the memset in
> netcons_release_dev() under target_list_lock.
>
> > +     dynamic_netconsole_mutex_unlock();
> > +
> > +     return ret;
> >  }
> >
>
> [ ... ]
>
> > @@ -906,7 +933,14 @@ static ssize_t local_mac_show(struct config_item *=
item, char *buf)
> >
> >  static ssize_t remote_mac_show(struct config_item *item, char *buf)
> >  {
> > -     return sysfs_emit(buf, "%pM\n", to_target(item)->remote_mac);
> > +     struct netconsole_target *nt =3D to_target(item);
> > +     int ret;
> > +
> > +     dynamic_netconsole_mutex_lock();
> > +     ret =3D sysfs_emit(buf, "%pM\n", nt->remote_mac);
> > +     dynamic_netconsole_mutex_unlock();
> > +
> > +     return ret;
> >  }
>
> [Severity: High]
> This patch leaves local_mac_show(), just above this hunk, without any
> locking:
>
> static ssize_t local_mac_show(struct config_item *item, char *buf)
> {
>         struct net_device *dev =3D to_target(item)->np.dev;
>         static const u8 bcast[ETH_ALEN] =3D { 0xff, 0xff, 0xff, 0xff, 0xf=
f, 0xff };
>
>         return sysfs_emit(buf, "%pM\n", dev ? dev->dev_addr : bcast);
> }
>
> It loads np.dev with no lock, no RCU read section and no netdev
> reference, then dereferences dev->dev_addr.
>
> enabled_store() sets and clears np.dev through netcons_netpoll_setup()
> and netconsole_process_cleanups(). process_resume_target() sets and
> clears it too. Both run under dynamic_netconsole_mutex.
>
> The notifier also clears np.dev, without that mutex:
>
> netconsole_netdev_event()
>     netconsole_process_cleanups_core()
>         netcons_release_dev()
>             do_netpoll_cleanup()
>                 netdev_put(np->dev, &np->dev_tracker);
>                 np->dev =3D NULL;
>
> If netconsole holds the last reference on a device that is being
> unregistered, netdev_run_todo() can free the net_device after this put.
>
> Can a reader that already loaded dev then read dev->dev_addr from freed
> memory?

This is being addressed in
https://lore.kernel.org/all/20261012-netcons-fixes-v3-2-1aac85ed7665@gmail.=
com/
