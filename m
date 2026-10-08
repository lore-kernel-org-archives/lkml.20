Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D80A389106
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489354; cv=pass; b=EdwYkfo68blB0Ndnm5Ss3jTNPgLKIQ3IP8+AANWIuHPC4w1Gg04onMO2po9YEtX2w+BHZj6scIiYUGW/w7OWmwxUtfLC5ojsH4z+2heOq5sueob7T9t92EpJrZVl2E34OQsUEHL4lOH4coWxd6US4607j77qkB7y7YvNhZa7VgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489354; c=relaxed/simple;
	bh=ziHAPQRoMkwgfKKfZIoohuKulG35BvtusPrpDG8odo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFI59Sw6aUlPfyb78ZiUKcfVON10tX6OSQB2+kcfbKPWJlndajQV5HcBdKiG6P6bObJTlzU2a87O5FPv5YVnHnI4WtRSut0pogVfkY4tvXHmzU9Sh/UMWtZLW9ABtL9qeHpzL8A+CYJqmBmGD/mJXFG8NjG0kq1X+s9YQicZ93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slItrefq; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slItrefq"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4e5c8b3facaso119813b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791489352; cv=none;
        d=google.com; s=arc-20260327;
        b=YHW8iLtJPsmnbC7019TmQvIpRXYNDKkC+z6WoZwXoUcboKeFS5RiPDTVq4Zfjp/qZv
         kMLzUMpwdhghbS0qUKOI3ifeIU1j6jNIS5s/45ln8h3uX5rU8+WZoNuxuaHtFwv/9UVB
         kGqJxUdvDcO4wkePVtfIvtw1bqc+QGQrzR9otObUtUYbIpVftGN9sU8A0ERMesLBbvf4
         hZ3kKjYukW37migucZcO8TQTylBO+JVA6h1imjNHQ1VE9ee73dZ9Wt4DYLJ6ofizgUZ9
         zCpqohzjEDh0VAUofxRlqWQlZNC58SMniTjhVNY3r3cdsRjCnuQZPOzGMIS0ePsMzKzr
         8WDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgcV5jlz2rBvJZUAbH1QsAzR+KCXqGBXEWNrdPfT0UQ=;
        fh=cqMeUtUM8yaaGDFFLVUJQZbKL95ZNxjJl9qSLDSHUn8=;
        b=AISXqUbNVR+Khhv6r3SGnQ70jaULp9FHFIwznsulu2rLPnXbHLJD2tLovWBscs6/eT
         TvFxv9hx9jk7K3mx9XyYpT+1r1iC1GYEgutT7BmvrvxupCaQObPFdFo2joOEq0ObNeF3
         tDhrgX3eUMl14VngBqFQOG1wLwgp6Gj33Vl5zxM9VWhTRTLshFbE/LPhrx+Ynn6WfZ1J
         e1wp2VxQPAAAp6orf6U/FAPH8v+RE0mrcTa6sLb2dy4V+3GJe0wqyG/8QMpSIyGPDT9Y
         S2+ZuHP4rv7FewUOncTy40d8SNKVXIrBGrxW9J+6H1lRcA9dXwOTQAAzIsyXE6x1TlfQ
         ToDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791489352; x=1792094152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgcV5jlz2rBvJZUAbH1QsAzR+KCXqGBXEWNrdPfT0UQ=;
        b=slItrefqsZEZ62X5Mpm4xNTkRfqFqnU/ZkKtuVIakpXiSTQR/yVhVcsy6vFwX0Veqg
         oPQYLETZpy8jNxUfldNasUAAd2v06+uvC5Ev1xZYXvfTiBBkgxjRlVSZtB9brOMv/0I5
         CmbbIGl4nHqq7ZZN6RbTgnmCif14B8RRz2ivv5sBFrhTGrwGwrLr8XtXj/KdOd+sP8Sf
         kTSTc/kK8pua+ImWs1FyqgVrTNUnmBoilw7r2nBsIa1fuok3bL5xo+DvP/POiVkhrcjz
         ywyiGS46vNYDHL15imaS+fsjrDE2BrQB160ndbMsRZcdbOuvRnIzrrfZrsrNQeXvsIvm
         ZvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489352; x=1792094152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgcV5jlz2rBvJZUAbH1QsAzR+KCXqGBXEWNrdPfT0UQ=;
        b=aaW/qnaLWNrFiGjyHK4U4kw5RikiSsjjPxtkPemXd3yaF8KwSgAGIWnZF/HbfoK2yo
         SGahHIs/yoBBxdzth839XWqdBI5iIQAl4fIlAmudaJ3zrf6t7p2hfC4Qid5ZLxljcSAC
         9BGinvMj2RQpiinsnW5GvREpOaFX9TxmEP9Mhr950Dw3PsfiyNXgyCgA0eYMVblN53LJ
         lNKwaAnf021UuWHcUif/+M4RFbd+WfkYeHSPUNxef2FeCqAaLRoxrWjNPiKrhPMaZbjz
         0rQ4uHoxcvfPUZUC5b5lHvEJ6GpVAVveRIUGR1SaXUxyxnAkicTvj25dt0zI9rRJ/9ee
         ni/Q==
X-Forwarded-Encrypted: i=1; AKwUvByTGFdq/tyxppvUPnoZmnwTTyoO0nXAdO0IpJpc8LMDJS96DFkDwjuZtlsNN64r9njk9+kYFRVF1WBExmk=@vger.kernel.org
X-Gm-Message-State: AFuF++lHNy+oal5ywqbPA6S73nptZ4Iz6XKE8//JllfhQUFj1VAA9POD
	CXfxpubrP8dr4HDGJ7Z/SDcoSs6Na0m8pIyf01JPJAk8C1ejZ0SwVJTtKriN8qLUSwUuljnofj2
	Z/VV2AlK/U17impBBrX8FLgVNEUwGmJM=
X-Gm-Gg: AYBFou1gpmtY2y/kCVsJb5Is6+ARQ+WXYMAiUlNAKlVJaB0rjT1qnsrpWqBB7ugkot1
	82LZx4obkRTgsBhu+5kn4nZWKaixaa3TpSTqWfMFsiagsOlyPcYBNDNI3ytRrdzXnOdUVlSDJFu
	T7y0UYuDkOjstS+K4XXMhFI+nMpB2gfIpljGzHTqgsq9uRPGxKtKJoKndmQStkL+VaeoqhR5zOj
	HmooeaXepff0sdbKB0BxTywEmLn8BUZ3662LK3O8riwUjKuV9pQpDsEPJhooHj5A71bbu1fc2bv
	YrD2GFi6b4z1W7waTbNB7jbRUGcgtku/egxU4i7usZEZc7NkGwAcPWTxBTDbprS9d0VFFUM=
X-Received: by 2002:a05:6808:1925:b0:497:d23f:e621 with SMTP id
 5614622812f47-503efe694c5mr5822680b6e.2.1791489351869; Thu, 08 Oct 2026
 12:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
 <20261006-netcons-fixes-next-v1-1-231cd26f8c51@gmail.com> <afc14b81-32b3-4f91-8b0c-0152889f80f6@kernel.org>
In-Reply-To: <afc14b81-32b3-4f91-8b0c-0152889f80f6@kernel.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Thu, 8 Oct 2026 20:55:40 +0100
X-Gm-Features: AclHuK-BFm-kWbsOrrSZkaU1W93cEM2S6Thw1jvB5mRVOK1OnYY5Oo50P8TSVug
Message-ID: <CAGSyskUE2CM_i_+o2Dtf+_OriRyad+UzG4S-rzOeTL18LnZheQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] netconsole: avoid printing partially updated
 target attributes
To: Eric Dumazet <edumazet@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <netdev-bot+sashiko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric, thanks for the review!

On Tue, Oct 6, 2026 at 9:35=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> w=
rote:
>
>
>
> On 10/6/26 20:58, Gustavo Luiz Duarte wrote:
> > The configfs store callbacks all serialize on dynamic_netconsole_mutex
> > but not on the read side, so reading an attribute while it is being
> > written returns a partially updated value.
> >
> > Hold dynamic_netconsole_mutex on *_show() callbacks to avoid racing wit=
h
> > writers.
> >
> > The dev_name_show() callback can also race with
> > netconsole_netdev_event() writing to np.dev_name due to
> > NETDEV_CHANGENAME. So it needs to hold RTNL in addition to
> > dynamic_netconsole_mutex.
> >
> > Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-ne=
tcons_ipv6-v3-7-bc0915e8c75f@gmail.com
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-ne=
tcons-fixes-v1-0-bb5ffe5e698a%40gmail.com
> > Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> > ---
> >   drivers/net/netconsole.c | 62 +++++++++++++++++++++++++++++++++++++++=
---------
> >   1 file changed, 51 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> > index 267254f046de..188beacb308d 100644
> > --- a/drivers/net/netconsole.c
> > +++ b/drivers/net/netconsole.c
> > @@ -859,7 +859,19 @@ static ssize_t release_show(struct config_item *it=
em, char *buf)
> >
> >   static ssize_t dev_name_show(struct config_item *item, char *buf)
> >   {
> > -     return sysfs_emit(buf, "%s\n", to_target(item)->np.dev_name);
> > +     struct netconsole_target *nt =3D to_target(item);
> > +     int ret;
> > +
> > +     dynamic_netconsole_mutex_lock();
> > +     /* Hold RTNL to prevent racing against netconsole_netdev_event()
> > +      * changing np.dev_name.
> > +      */
> > +     rtnl_lock();
> > +     ret =3D sysfs_emit(buf, "%s\n", nt->np.dev_name);
> > +     rtnl_unlock();
> > +     dynamic_netconsole_mutex_unlock();
> > +
> > +     return ret;
> >   }
>
> Please do not add rtnl_lock() in a _show() sysfs handler unless there is
> no other way?
>
> Something like:
>
>      dynamic_netconsole_mutex_lock();
>      strscpy(name, nt->np.dev_name, sizeof(name));
>      if (nt->state =3D=3D STATE_ENABLED) {
>          struct net_device *dev =3D nt->np.dev;
>
>          if (dev)
>              netdev_copy_name(dev, name);

This could lead to a use-after-free if we race with NETDEV_UNREGISTER
and 'dev' gets freed. It is the same issue I'm trying to fix in [1].
Claude suggested adding an rcu_read_lock(). Since
unregister_netdevice_many_notify() calls synchronize_rcu(), it is
guaranteed that the net_device won't be freed until the grace period
finishes.
Something like:

  dynamic_netconsole_mutex_lock();
  strscpy(name, nt->np.dev_name, sizeof(name));
  rcu_read_lock();
  dev =3D READ_ONCE(nt->np.dev);
  if (nt->state =3D=3D STATE_ENABLED && dev)
        netdev_copy_name(dev, name);
  rcu_read_unlock();
  dynamic_netconsole_mutex_unlock();
  return sysfs_emit(buf, "%s\n", name);

Also, netdev_copy_name is not an exported symbol, I would have to
EXPORT_SYMBOL(netdev_copy_name).

Would something like this be acceptable?

I can try and apply the same RCU approach to [1]. We don't have a
similar seqlock for dev_addr though, does it make sense to create one?

[1] https://lore.kernel.org/all/20261006-netcons-fixes-v2-2-ca652d55fd4a@gm=
ail.com
