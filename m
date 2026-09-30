Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916A3CBE6E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757442; cv=pass; b=cVwwsin5uPTeb6rxYQxwBiySMLvWXVO0Uf9cfZnETchZmXFwfA5hLaIRiUhPKqX48LqzJnQDHq7N+dVeaCFV5a1BOvDVNzxYU8AqIjy5s5YGRjwbpTImdhe9AZQy9w2GGe5Zqgm8z8hheV0c+FSaTWpR5dBG4959Qva0X22L41w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757442; c=relaxed/simple;
	bh=bR8m88aGaXrfrsJOpMkJ/BBxQtrF3+thka+XnxLV90A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsHwvF30PT6m1PX0Mwj8uaW0X73lUJGX+lz6CTRmUv9xjkfMv0LBipMjZ/HN3r6xyuqNxX8S7PToX2z9zcyeKoOFmhjYv3DlF23oUgroXhV0MVWI0sCehtgX2WQ1OdZSbKHh0yPXaONg6sv+MRRGbTJSYzzPoByFePEHqxx1uxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3jXfUfC; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3jXfUfC"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-675bcac8ceeso856735d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790757440; cv=none;
        d=google.com; s=arc-20260327;
        b=QmnhJCQ43+0sJBfdmcYq7yzte/DwrOD7xpGSOz4G2ZztFaIE5lyaFuALSUnkLkC0T8
         esvitwGYT+f/6tjBDm8y/ORSjh/cEqTHQ3gAgSLx8vKxaq8So3FoOMuKIuiWIGqYcccj
         fAVSICVHh6ihpIioiD4vMGblQIRTYxXM5YiHt1IUAwvybE2oKBQzewr57oOCU9GC4IJY
         6K1ncM7PzYI3lwbauzy7DAjFOsrC/j42UZHLIQD6hafO3H2fuVF2TE877Hfr6lshMnOp
         dKBfb+bZB9fKE0nEs+kGxqp0LbrwfnvPpUIvqcuAJompYiYOtyfcP2RKxueSg1bvoR2H
         f9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        fh=Ie1IU2otabGescnkU1NeD/I/sMFK1Yy4Zs67iPdtNLY=;
        b=kzGE5dThauM1rVvCiwxkn8kgFvCpjxcKDSmhXUjJZZDujq5Hi7/zJbNsP0nD0fxzFu
         UP4RLzzIy4jY39d2Cpa+h6Fk6jF/8mR16AZRN8qJqDKVRH7qH84AKWD/eYUzermTDgpr
         zLrurK6yQCthEEIJ14O5yN6LE+nxXLYjkMuuDEKM41P7/eFrjSmFb7pCZ3mJhLt/xHk5
         BA3JdzrxPb9hN5U7R6of5uhhgCQhkKhtZswLz55tzI/CfutxuvecV6+9ivZdjywuMULD
         tOzpz6orblZsJ1ehWd1pCL3+zOQ7dnOYSPfu98RppJqA+V7dNKbCVZXDHvLw6dKkpCcz
         yTqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757440; x=1791362240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        b=q3jXfUfCskLmgnN1nFKDmV9khZIazXLOiGbrss2zOKA8yUQEO6sA0JJ+feqj/6W91M
         GWKSzCYAwTjS/xvP41P/8LHXs/uth90A/Qca2opQpTg19IWSlLOX07LVU+ul7dxQCTu3
         ouqk8xh7QpN+Yqq3UUR/k7+ZjQHGa2W3D+G7+aDCijqqpX+zuf0E+WGbjNVpKzGohjWb
         WMbw26OvaJjjhVzHDgXxwwjYe73fwQSI07FDyIEWG5NxkEYCXywxl/O/irO3WCund4VB
         K1K9BfJ9bSy9wPE9FnBBdFyyc58/CTw8Ys5BNwPoAPlj0wbvs39dhyoIRwSmt/YEI/UG
         jDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757440; x=1791362240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        b=A71iD4+XHLk9bf9v4uBCRqcF2srPgvTEHW5l6X/d9f8zBmBKMtPy8p0DDbpqNGpTli
         cpwkuS4JFcNvjQfQda2aDrMUt9JDi1XPmCPaBnKv3Maz9D6y3AzxRAFpZfThl03I9e7c
         rbhjWNaIpxH8zBjbNzpkkGD42DRYgVWzAZhhgU5w98kdfRUHOhU5r87zQB/SPlzzfu2z
         c2WXIcqrbLkvdViR+0EP4xpF+5tXuq0JTI6dlwhjOF0PsrvtqylRF0ZhcGw8YbyTvHaY
         3vAiaBKywJd/rCnInsqdCKe6xXe2yzc1sIrfNnflq3Hk/uRorijxgpx9UODhdJfzlyEs
         3ZWg==
X-Forwarded-Encrypted: i=1; AKwUvBwafFeVNP5EQr0/xZYyXDHD2KLkMLfpOq9hbLHm8dUjNhWZ5KY82QWxTFQHJ/QTICdb6G8eKGVad/iuwq4=@vger.kernel.org
X-Gm-Message-State: AFuF++kifJZFkfibjHF5XkuYa74Q6fdrlIfR2EEPtx4C4Cca/NJJ68Eq
	cCqMylQI6nHHgB9DfQJLsCnhG+b5BYRN25vmq0k5ON3PtZGTwNWyr2V0YAwDwvOKSZCR4FFVZ9c
	Ll8Scq8oeK3Ez/xnuIcuf2vtlT3bNOYM=
X-Gm-Gg: AYBFou1LVkCgPJbf1sxeKm8is4EFRLKH11F4L06I0MTLJ2amx+Ktt8PGZEyiKsXN4Yq
	2nslveWa+yMObz20TIi2BJhSgngbsKpHjpzqrDqGNVVX06BhNCOyC+KPSzyJwnt+yQmy1wQw8X5
	ezGp9VAlhoeuDSepW9g2Afe+NyKKlHfryPM5V4n1yjVIYXHn75Xxr3t89QP+5QDOoSnLRSuwVdq
	CD6NpPJHs3a+nJTVwSYV98xDifOC3WkbJW2d8sBJaL1yGWTSG/XB1/DyGBPnrkULRaS9opnSus9
	y0rD5j/xATkrkNfqN5Mp8Ntr3IND+eEwUFFdyWgsA8u5BD6eTObANhUs6+qizlEH/eBDbWzYKXa
	XFFd92dJV2GtEutGWTlNiYZ1iqRog9QX8FFpYXcVWMar5
X-Received: by 2002:a05:690e:144f:b0:676:858d:35e3 with SMTP id
 956f58d0204a3-676858d42a7mr151082d50.44.1790757440382; Wed, 30 Sep 2026
 01:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121230.35359-1-kartikey406@gmail.com> <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>
 <arpcrKbhue-aRud9@extorris.mess.org>
In-Reply-To: <arpcrKbhue-aRud9@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 30 Sep 2026 14:07:08 +0530
X-Gm-Features: AclHuK_hL4sEK6mtF_ZzNd7F71VC1zJspJZfhjhXLVWvSJpVrusATxRquQk8KbY
Message-ID: <CADhLXY5Qtz=_6oHsHyZUVv4-rrbh+AmXaR-E5to6tOyep_A31g@mail.gmail.com>
Subject: Re: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:55=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> On Mon, Sep 28, 2026 at 05:48:26PM +0530, Deepanshu Kartikey wrote:
> > On Mon, Sep 28, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
> > <kartikey406@gmail.com> wrote:
> > >
> > > ictx->dev is a raw pointer to the usb_interface's embedded device,
> > > cached in imon_init_intf0() without taking a reference. On
> > > disconnect, usb_disconnect() can drop the last reference on the
> > > interface and free it while a userspace fd for /dev/lcd0 is still
> > > open. When that fd is later closed, display_close() dereferences
> > > the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> > >
> > > Fix by pinning the device with get_device() when ictx->dev is
> > > assigned, and releasing it with put_device() when ictx is freed.
> > >
> > > Also drop the dev_dbg() in free_imon_context(), which only printed
> > > a debug message and is no longer needed.
> > >
> > > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > > Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708f=
c
> > > Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@g=
mail.com/T/ [v1]
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> > > v2:
> > > - Remove the dev_dbg() in free_imon_context(), as suggested by
> > >   Sean Young.
> > > ---
> > >  drivers/media/rc/imon.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > > index 049a73b5f882..562a70186db4 100644
> > > --- a/drivers/media/rc/imon.c
> > > +++ b/drivers/media/rc/imon.c
> > > @@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context=
 *ictx)
> > >         usb_free_urb(ictx->rx_urb_intf1);
> > >         kfree_rcu(ictx, rcu);
> > >
> > > -       dev_dbg(dev, "%s: iMON context freed\n", __func__);
> > > +       put_device(dev);
>
> Why do you need put_device()?
>


yes it is of no use. So, I have removed it and send patch v3.

Thanks

Deepanshu
