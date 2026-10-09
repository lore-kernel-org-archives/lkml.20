Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73C3C0A19
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577186; cv=pass; b=q7SXv+YLdrDqo14LBHSvqko47MTjyFDJZG5XfUUgh3Ji+aW2YveOkay+MUyPmCmp6E+0K8kbqcr49my5uTqrHXuyyDRxhtFqTSEfGoFf/WwKO7swKJmKgV8NGXNPV2stkjDkLnbBNwxhbQu+Kh2ku6yHOfshqR/FY5dth0WvxU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577186; c=relaxed/simple;
	bh=LHuM++ypPRN/csYCm9wgjToWu2NKVwtNFtTg8nsZAHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiuLSN+aVntlNSCAwW5tCCHJzSXr2eS1kd/kDrfyqcDzAo04nJGWVZp0Lhu6LGnzZLvuiAlvaQy0KNKkSn1GQrjT/93lvd58J6YiqHAZ2fX9zmerDjP/wg3W7mAqVSZ/mI6WnQrgvU4Y9sFpiVTh0LFdjUc+rxiauoQMFv++xg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiYR0zZ+; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiYR0zZ+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8231ccb04a0so27235a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791577184; cv=none;
        d=google.com; s=arc-20260327;
        b=TS5EGZjFgAKeRu6j46pWz1lqdYC1DHYL8ZujqW+t8oSLZNelotePCy0dasR2KWE7ei
         4JJSKM6R4Kbgpta7yDUC7kL8/WkzPgYjUq28NmvxGIdr5rd9V9EjSNsZZkRxXF5hlv0A
         +30hh3MmLE8FgX3O6K3WOQ7GfMfQBtXXtvfEROetxlQ8+AMy0eA6DyBVljG/VoJVg9pN
         DnbaygrVbSBfFHGxpPUHGZdL/OM7cBEsdOhagB1MA+kFQztlxjocyKfq4kEGCkKG1W1M
         7C/uVs6EkTzvElnYPcIR12fzNeI+WbxwjQfjMY2aqs+MquEOR2Qr9SqKUWhjoRVlNSq4
         lF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DZTn6/Lz8nRVlXVjhpKVoP1fGQxBATGcsrbeLxvH18U=;
        fh=JNbwJQt5J0emtjXBlhFbdO6uxU+tbjBP0bTF4gKx8Fs=;
        b=LzUr+k1tPAMbogykp0idO1qPMv8gBt36DeiQyPoibLJDvbHhk5tLCp3rg/y1MEL9PN
         sROTOC3JwhzchYSziEat6iwodVgFIAs9Qxomqj0n97v+ioPds13GneB+EhZYz3TV9b0e
         ecH9SNFSlKehUtxpmRUSwOtm61pux93Q2oNf55b/l38VGnk1PusggkGeBgqVe+48iO1Q
         x7TmXj0hYpFZzxQmKJeI34WH99RQGnht0XspInjyZlzU63x1I9+NMS4dcKYK9WCuLi3W
         0TQ+HArlDarPasF+amdoEc0QpBU4Zq4Kg9HP0dyHwuHVkjCFvGXpuZfffS8BsHetchVq
         cFVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791577184; x=1792181984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZTn6/Lz8nRVlXVjhpKVoP1fGQxBATGcsrbeLxvH18U=;
        b=kiYR0zZ+PTk+IzW0qMwg6RwQzbSXSqpPY+c5oD+mGrn2Ea6eEqIPB3zTafK5tJo0Cz
         a/y9bK6uoZY1t0trc/sV4e1E7bC3Ymk7t/ibPK2MoyrnS6CqF9DwXPEjs0lIZu/1dtn8
         dPHfz8rkuvt1SAw9FvORGfhM/6DmztEAmfdKdx7RuDsGArUqivC9DvOcXOazIR/m4xJw
         ykSXpIuRlDlgTmmVSeywNYSw0OhCVHPlDw/lMLh0B0L3wxrXZ4HymXY3zduAo8StcEtM
         yE8/6ga0n0JM9BoEak+EPrvK+v6+bQkpX+XpVN8dOkM+bBzmI/z7WRhP65KlsXM/63PO
         Tw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791577184; x=1792181984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZTn6/Lz8nRVlXVjhpKVoP1fGQxBATGcsrbeLxvH18U=;
        b=tXmJB/bFMa8MsKBcK3IOUsSU7phiCc5RYdkh2zZRbf6MVHTMyHaq7kll8FSdqkhNvp
         U3IDEFjSTZDsP+ckXUt+KkbKc5M7X1dzqZfGnP27SPcZcBi7LEd20MggU16L3pRnBKdQ
         zz0sGYl1ZTtaBS1kuNOPyhgRKrIytzqQahmy5NeXzFWzWT5q5S1SMGUzX+CUlVMa70ty
         Ka/QPwfI0DYBNjO9bIcX/jv6iqb3JcrhWPe5ANZxeVRg453ZdIczWnfasme471jPtX4C
         yLJEog3cc9lAnM+4IwMj6xVsuuwAhvmvDL8yAt4gHZY4xpit/cgrxKIcplXGSZF6WC3a
         8H9A==
X-Forwarded-Encrypted: i=1; AKwUvBwo90UznZegnlUqPyJXxzD8NIeu3X0zLj+e2RR5kO2ybb/7nEiuzpbLsmf4wfPJnhkWuxK4+sIXRfpLOY8=@vger.kernel.org
X-Gm-Message-State: AFuF++l5DKc2IVooI2jRtdiWg+/a/o9oZx58njeVdqRp13vQTZ+68Xnn
	nfX1QP6jaYNOhb/blKQsfICPpZCp9vom6YKOKtJ7sy+zPOMXW3uYlP4MF1Wwvo4Tf2qT6zQcvkq
	O7HYWQ73ZrKoiA9AuN8QgueAPSTg4qqU4dp6yDSo72Q==
X-Gm-Gg: AYBFou16Gu4MldIPBA1RQOjnt60RcF2eDinhyXIXKBWgdk1L+N9vl23g17wC5E4d8s/
	FfHuLmsY+8EYfDXsOc+lvujz/xV/+or0H76HPlBS9lk3RAxNpKfhccouSdQGVr5X8fb7P2snkR7
	F+9WrJHtGgiUWKlWrepiLD5pH6iUv4Yn4c9pgOpiSey3FSTQqbVMx0FQLiMEWetQ/sVKWxIm/e3
	kduf4lbjD18184AOaG9IV43DX5dwGYLsAMFF6NiFkQKLvrVA1yB5775hNKxjOMMNE/9OI9IcyGq
	geZe/sP0Cm2SLuaf+OrKvFJP6W61kNvx053GoePn1fzivg6Wb1eIvz3Q0qF66y2KOlL4mlQ=
X-Received: by 2002:a05:6808:1825:b0:4c5:90f1:b9c3 with SMTP id
 5614622812f47-50c438a90cdmr3433845b6e.2.1791577183759; Fri, 09 Oct 2026
 13:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
 <20261006-netcons-fixes-next-v1-1-231cd26f8c51@gmail.com> <afc14b81-32b3-4f91-8b0c-0152889f80f6@kernel.org>
 <CAGSyskUE2CM_i_+o2Dtf+_OriRyad+UzG4S-rzOeTL18LnZheQ@mail.gmail.com> <asjfY79OetvGy4an@gmail.com>
In-Reply-To: <asjfY79OetvGy4an@gmail.com>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 9 Oct 2026 21:19:32 +0100
X-Gm-Features: AclHuK_SmouqZ8gGRicUCLxC1nVPC-Rfbwhq_vDqzm_DMop0yNSTGIcelyt7RXc
Message-ID: <CAGSyskWLdTJ-QSeys=_42wuOYbPJz-=0ySHW6hqmPdvHcmuqag@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] netconsole: avoid printing partially updated
 target attributes
To: Breno Leitao <leitao@debian.org>
Cc: Eric Dumazet <edumazet@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <netdev-bot+sashiko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 1:35=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> On Thu, Oct 08, 2026 at 08:55:40PM +0100, Gustavo Luiz Duarte wrote:
> > Hi Eric, thanks for the review!
> >
> > On Tue, Oct 6, 2026 at 9:35=E2=80=AFPM Eric Dumazet <edumazet@kernel.or=
g> wrote:
> > >
> > >
> > >
> > > On 10/6/26 20:58, Gustavo Luiz Duarte wrote:
> > > > The configfs store callbacks all serialize on dynamic_netconsole_mu=
tex
> > > > but not on the read side, so reading an attribute while it is being
> > > > written returns a partially updated value.
> > > >
> > > > Hold dynamic_netconsole_mutex on *_show() callbacks to avoid racing=
 with
> > > > writers.
> > > >
> > > > The dev_name_show() callback can also race with
> > > > netconsole_netdev_event() writing to np.dev_name due to
> > > > NETDEV_CHANGENAME. So it needs to hold RTNL in addition to
> > > > dynamic_netconsole_mutex.
> > > >
> > > > Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> > > > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/2026081=
4-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com
> > > > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/2026092=
8-netcons-fixes-v1-0-bb5ffe5e698a%40gmail.com
> > > > Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> > > > ---
> > > >   drivers/net/netconsole.c | 62 +++++++++++++++++++++++++++++++++++=
++++---------
> > > >   1 file changed, 51 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> > > > index 267254f046de..188beacb308d 100644
> > > > --- a/drivers/net/netconsole.c
> > > > +++ b/drivers/net/netconsole.c
> > > > @@ -859,7 +859,19 @@ static ssize_t release_show(struct config_item=
 *item, char *buf)
> > > >
> > > >   static ssize_t dev_name_show(struct config_item *item, char *buf)
> > > >   {
> > > > -     return sysfs_emit(buf, "%s\n", to_target(item)->np.dev_name);
> > > > +     struct netconsole_target *nt =3D to_target(item);
> > > > +     int ret;
> > > > +
> > > > +     dynamic_netconsole_mutex_lock();
> > > > +     /* Hold RTNL to prevent racing against netconsole_netdev_even=
t()
> > > > +      * changing np.dev_name.
> > > > +      */
> > > > +     rtnl_lock();
> > > > +     ret =3D sysfs_emit(buf, "%s\n", nt->np.dev_name);
> > > > +     rtnl_unlock();
> > > > +     dynamic_netconsole_mutex_unlock();
> > > > +
> > > > +     return ret;
> > > >   }
> > >
> > > Please do not add rtnl_lock() in a _show() sysfs handler unless there=
 is
> > > no other way?
> > >
> > > Something like:
> > >
> > >      dynamic_netconsole_mutex_lock();
> > >      strscpy(name, nt->np.dev_name, sizeof(name));
> > >      if (nt->state =3D=3D STATE_ENABLED) {
> > >          struct net_device *dev =3D nt->np.dev;
> > >
> > >          if (dev)
> > >              netdev_copy_name(dev, name);
> >
> > This could lead to a use-after-free if we race with NETDEV_UNREGISTER
> > and 'dev' gets freed.
>
> Any chance you can get the lock (either dynamic_netconsole_mutex or
> target_list_lock) in netdev notifiers, so, it doens't conflict with this
> one?

We can sidestep the device teardown entirely if we just stick to
np->dev_name and protect it with target_list_lock which is held in
netconsole_netdev_event() while handling NETDEV_CHANGENAME:

  dynamic_netconsole_mutex_lock();
  spin_lock_irqsave(&target_list_lock, flags);
  ret =3D sysfs_emit(buf, "%s\n", nt->np.dev_name);
  spin_unlock_irqrestore(&target_list_lock, flags);
  dynamic_netconsole_mutex_unlock();

The local_mac_show() case is not as simple because we don't keep a
copy of dev_addr, but we can couple target_list_lock with nt->state =3D=3D
STATE_ENABLED, which ensures the target is not queued for cleanup so
the device won't be freed from under us.

I will send a new revision for this and for local_mac_show() using
target_list_lock.
