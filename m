Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF65650F0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874119; cv=pass; b=uNZg246MffP2h9jMpifIIAna1T045Loh/2a0sqrntYqgfoC7PxnLL2cCViYq6JOvIlAHASqkOwimsXl2UFfTkHGeDby4J2JDsmfHs7bhMy0aYMnSi5IFUDV+PcLPqOWvaFr17cVa6Sl3SwVkZnLVSUHfkKnMjil6gpcdwtUJuxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874119; c=relaxed/simple;
	bh=XrWPQdu6aVkIEftfYKLA9OZgTitSQ0N+EPeHqgtL9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qu6zH2UpogsZDPAPwmGGtYNU/n0vWEiLZfNT0HvWUSbloZasmYa5u1Y+sryYHWEJDdIq3f0IzhOfTU3l7r7d73OjaOK2A8/+kb3zgbvj6dIV0Ze7fJ3IwBFQNKKupJrZqQO6qjdYw/qjlA43EhtNYzsawbsPlkkfNg2pTit/mwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDzKyIQe; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDzKyIQe"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso162452b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788874098; cv=none;
        d=google.com; s=arc-20260327;
        b=sLFCc8ZNjXPt9hAa+e9nNuuY3S825KHs/mnJxI4YkMs+J5dnlmZEtN2xCuELb1jvYT
         /pQ6gXkIbMlT0QpJxaqNhirlAAk7OINmf2Ag5OYwgLD37SNeMp+SoUhXNrvPskWbHCmj
         ZmnG9+5gGEKVGXO3BHJhjujJBjMkqszoxdxv/w8IciLaV6/XZoRwOXjeKg9y934rtdFl
         vyqzfw0vkB+vKEb1DJ9EUKgDpANnUhV0csFLlGOSS5syzI20VpMf7uYZCFhVmVvg335/
         obZ76IN7+JvYDXmSIa+w7SyY/GnCQLgf27bH6HCfSzyYyX5siDaGZEIwhnJxp9sPEm3e
         JqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JKqux52iVKTfYQy6cAyWyQ3ntl+32JLmlvNYP6anbHY=;
        fh=CHeQOWZBuwRxPRjCkzraIbJld2yCfh7uNumMCU4DWoU=;
        b=CO+ABQNRhHI8p9D7EQI3XnjJTrp+sHH/haIV/wASyByJJG2oGpA9ROpspntUqgBxRC
         UAFQ5adVYSIMqoD9ndx4u8rWncJEl9QQ95/aVqG0ZjtZrbeUsaTF/YgEO2SsH7I2HZyP
         J5n4lVswIyg7qeCIPbpO8xAbnWjVPtvC0p4ePE2CrTFH/BDQF3lq6IwYJt8eKnrpNsss
         e20ATnBZmjfrH+1OCm/TFneJBCECNCkyIV3TMkUq4TwjP2eq3+Ayyz/d5J0F9NJQj0Nh
         bpX5AJNgaeGunjcEASIEdbtBpgASeWz/0xfXpmVMaGqQhx4cbG4DxPcK8xqCQyDBL1NA
         GtKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874098; x=1789478898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKqux52iVKTfYQy6cAyWyQ3ntl+32JLmlvNYP6anbHY=;
        b=GDzKyIQe6gkTpY6dg7Tc7eMqvtKCONPfezqQzQ5kSDS69CAoCuxI+JOe9Ujb/wFLW4
         NNv+wf/qu5jdSqGH7GT5mO72kF2aRTO2AuMqtrXHH7wlTZ4+aSuFaIJWNgQUXuAMYx7L
         UOXdcc7cxtrl+qMW51cYjvQYfA/iqjn8lj81IVJQxRjJq1gfEBFvoqh+lJXly7YKFn31
         tKPwVvmvAVxONDj/w2fFNezBOlbgpMWRrSC6k0kPaKxjvM9ePRZMOPaXiM8t3LZzy41R
         //xbVtYL4P+kxfcx0gk3zPTtdLqVTnyxH1f72xn30RhM3jKP1qExiEcevXkcF6slhrMp
         xLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874098; x=1789478898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKqux52iVKTfYQy6cAyWyQ3ntl+32JLmlvNYP6anbHY=;
        b=PtHF/nbenW2ONZp2euTNG20GNn+9Wj9Zpo61mgXOWVuMaQIHcEfU/2NjfY2KOh98WY
         CKuGOggiNixWLv2PZteuA2e0ggLGuGFLuf1U9w5bPqk46VQGw2+bC5X8ommudrC7IrFo
         20lFl67Gks/t8Oz8iFBzpdT9SirfMO0KuuHHHHeEr6FWo7zUDL13Pz7Wl81MZXP6I84C
         8SMzEOedQDcqrVzepXcvlJ3UNz5dlJZ0sDXkKXvv4CvmJr3I9hBxFafv4VCUaUn8alsM
         8jN6A5ruYf9jTHMIL3nO0bc09MndP1CIjsgRmte3Ralb/e/7UAqVxapKxjX4j8Sk7PC7
         6AeQ==
X-Forwarded-Encrypted: i=1; AKwUvByryrHpCVrFKA0R3Zl7D5GmmSpIlwTv+oKh5fC0XdIX5yjMUb5aEkrrqOkOaOMzgPIdTxgWB/i4EE6sKYE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpTX8maGjVZAkuoDnD4NBMenGxlFiQVLwiSXdsBSnV5hukYZHF
	2Pa2HdAdI4Qy3EolE7d+UylW7r1WRbxS+jCuT2D5A9pAHidNJX5uDlNWuun0pQ+h5aLhTx/+p50
	MNxz7QUuUU8b3BIIllB5e/Sl+xYw3o+c=
X-Gm-Gg: AYBFou0Ehk3a2FCgvmxU3pnF/Q9WdJDnMwhhv2diRP6y1El6XWMNLLSx5xiOKCY4JYS
	B7j63SHHGoBMJiKOlc5bWm/L3bz4YlyrKo4czn7Ie4vJptfyv6pKxJG4HTspYojCIQYiuyKoOvZ
	2AWL4gzaEJE4xLo8TAVXrRJQ4D4a29iykBEa2j7FkDm09+gKMpAjt98HguIthrzxjBfWBY1AfiE
	tf4y+SgdtBCRe4jztvngLwA2vWMMk+rQu3ydST1nO56bPCqQdGLNxpI/bNOuUn8hfUHQE+vvvOW
	gKa8F4ACPDCl+lDz+dOMHiTtkIbNWZkxR5X+D/DN+O1nbOONPb30Ofo8
X-Received: by 2002:a05:6a00:1395:b0:84e:cd14:aeba with SMTP id
 d2e1a72fcca58-86698fe1ea8mr6346255b3a.6.1788874097889; Tue, 08 Sep 2026
 06:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907151428.643841-1-adrianox@gmail.com> <ap-4khETBju3X8-T@hovoldconsulting.com>
In-Reply-To: <ap-4khETBju3X8-T@hovoldconsulting.com>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Tue, 8 Sep 2026 10:28:06 -0300
X-Gm-Features: AcwNN1UwNNi1uUL8ZrK4YlYg6vVWK6_rZXfk738aK_31iCexOOmSxAgWI8zqjXg
Message-ID: <CAMGU2hXrURUh3NknkgLnmyiJiEwEqZdDz3Ujy5tO8oqVMD9OJw@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix use-after-free in vub300 teardown
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 8 sept 2026 a las 4:26, Johan Hovold (<johan@kernel.org>) escribi=
=C3=B3:
>
> On Mon, Sep 07, 2026 at 12:14:28PM -0300, Adriano Cordova wrote:
> > Do not dereference mmc/vub300/udev after the final kref_put, because
> > it can release them via mmc_free_host()/usb_put_dev().
> >
> > Fixes: 8f4d20a71022 ("mmc: vub300: fix use-after-free on disconnect")
>
> This commit reverted a buggy change so if anything is broken here, this
> isn't the commit to blame.
>
> > Reported-by: syzbot+f312381a95cc080992fd@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=3Df312381a95cc080992fd
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Adriano Cordova <adrianox@gmail.com>
>
> Are you missing an Assisted-by tag?
>
> > ---
> >  drivers/mmc/host/vub300.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
> > index 2dae474dcd06..a1a6aa1aafdb 100644
> > --- a/drivers/mmc/host/vub300.c
> > +++ b/drivers/mmc/host/vub300.c
> > @@ -370,13 +370,14 @@ static void vub300_delete(struct kref *kref)
> >  {                            /* kref callback - softirq */
> >       struct vub300_mmc_host *vub300 =3D kref_to_vub300_mmc_host(kref);
> >       struct mmc_host *mmc =3D vub300->mmc;
> > +     struct usb_device *udev =3D vub300->udev;
> >
> >       usb_free_urb(vub300->command_out_urb);
> >       vub300->command_out_urb =3D NULL;
> >       usb_free_urb(vub300->command_res_urb);
> >       vub300->command_res_urb =3D NULL;
> > -     usb_put_dev(vub300->udev);
> >       mmc_free_host(mmc);
> > +     usb_put_dev(udev);
>
> This makes no sense at all as the driver data is freed by
> mmc_free_host().

mmc_free_host() only frees mmc (struct mmc_host) and vub300
(struct vub300_mmc_host), but the udev (struct usb_device, linked
as mmc->parent) is not freed by mmc_free_host() and has to be
freed separately.

But it cannot be freed before mmc_free_host(), because the kobject
cleanup code of mmc_host accesses it in mmc_host_classdev_release()
via host->parent->of_node.

>
> >       /*
> >        * and hence also frees vub300
> >        * which is contained at the end of struct mmc
> > @@ -1794,8 +1795,8 @@ static void vub300_cmndwork_thread(struct work_st=
ruct *work)
> >                       construct_request_response(vub300, cmd);
> >                       vub300->resp_len =3D 0;
> >                       mutex_unlock(&vub300->cmd_mutex);
> > -                     kref_put(&vub300->kref, vub300_delete);
> >                       mmc_request_done(vub300->mmc, req);
> > +                     kref_put(&vub300->kref, vub300_delete);
>
> This order has been here since the driver was merged.
>
> >                       return;
> >               }
> >       }
> > @@ -1946,8 +1947,8 @@ static void vub300_mmc_request(struct mmc_host *m=
mc, struct mmc_request *req)
> >                   satisfy_request_from_offloaded_data(vub300, cmd)) {
> >                       cmd->error =3D 0;
> >                       mutex_unlock(&vub300->cmd_mutex);
> > -                     kref_put(&vub300->kref, vub300_delete);
> >                       mmc_request_done(mmc, req);
> > +                     kref_put(&vub300->kref, vub300_delete);
>
> Same here.
>
> So if this is wrong (it does look suspicious, but this driver is just a
> mess) then that's the commit to blame.

Hope is more clear now, it makes sense to me, and I think the Fixes:
tag is right.

>
> >                       return;
> >               } else {
> >                       vub300->cmd =3D cmd;
>
> Johan

Best,
Adriano
