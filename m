Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BA387364
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373139; cv=pass; b=MuSsaTizUXxLKVGD0pfAWIKgCeCzGJ4mCh2ByyA3XDg4u1jklkXxk/Uad/t72JnmDeaFjRF6lq3d5utxWo9byOWRFOJ74V2Q1NRBPlCPBFEKWEtWma5rfYhees3fzGm9yqFfjOtwMAawX/k8yWoFZaxPfWXNYZ7wZnpHXOYuKWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373139; c=relaxed/simple;
	bh=JzLa2kyXoNQFEJZ+dvXzYiWzOVWv/iHENxEf6sv6P3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6IG26mm4KxuK+O4m0dwUWCJ+njBLLOb0Us/gG0PFuS2hZ1uFRjbWKruRz7EejP9oA8pIMXW1p+u4ebOHQZ2PSGyc8RYLvIlc8UMySJgwFU18X3G1AfCy6ySwuPTjiW7nueSd//srzDGahDLbpqXj48Ugu82dex8TEiMve6Z6Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiBkFecE; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiBkFecE"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b056d58f2aso11913047b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373115; cv=none;
        d=google.com; s=arc-20260327;
        b=KdIAK/10guS41p64gR5qNYR1U5aoTzJ+kTznb7Tzr0k2yGm+SiSq7OsUKzdtxEXjjo
         5pAdbEjpF01d18lGc8q+5ZHKZ99n3AlycI2XhxvecisVocRO4DqQ4qrJba2fAeSlrtiW
         RrUgpgug7n/0ffJ3EcELRNJucnW8rgVePrZpeIks4Hcq4RI405mZ0JC1UL57C7aY4Mbc
         WeNLewKMcwGKYKih8xulbLq/nl6VpbbKRi7nbjoYLy9/LLorjZNYY1VMqOnshfAJIojZ
         ISkHqjyjyWF7iyxgHE6x+znIn5QiFtXkT30CAufKAK/OWhaq2BnMrMAtJXVU1rIXUnBk
         y2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        fh=qxp+dtPjMntIgmnnAyO3jcSEXS9HQp3CHzLXggd6cfY=;
        b=n/uExZeJ7jUaP8bxDSI/EB66gBI8aCYd4VzAQTttmZUV0L6gV1z5zNpTTHxrxDu8Ia
         uEpFQvkZrQQvG4iHaK+hQjDxDlNt/6OG0WHYpPzqxhUphx/di0dEFg09qhF90rqpUDi4
         +0N4Qa1efkjsrC+ltL4ZAGxckKPfgSlc3H3NyD/61Qzlx57UGEtiVJmXRgaQlH48lXhs
         WZIWS/1wPUg72NRlI6PYlbtPlR/0S5mWDYFPpLLns+qygi2uSCke/CQTchmEUv8BOmkn
         ZyqfNtOoa9jBhTknfiw2ErZ4rX/e/zu4MlMLc5E6P92+8WED2JKsWe9bo0EV23zkDSaM
         +yaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373115; x=1791977915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        b=EiBkFecEUPRfDjp9AfyTk/rpAdh/pbyXXlq1uQWI0qqFaQnPBIJQ8HmAvhRyF3iwcn
         UmfprsoRDxRdPfzQnAv/sx9hopfLHVv+ZdnGU84M4Ldpy/ig5u82EqWA5a+z1SaunebX
         hCrLk0kAQIjebyJNri88PKzJ+bwXdjcyiGOepUDbIDgISCZGphjCwrqS92jP9YEgW4S/
         YCO1/K58S9L0AbLHjBHKTL+WA4Cub/3ZNBqPKXMFVNaOWenOPSlS848SoPCYUd9/0M9Y
         3my17UntlQKt9ostnk4s0BZU0W33C8JA5NObVCq7+56avC5bpwlF5yAwxoHAWfZuH3fL
         UgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373115; x=1791977915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        b=bcqsytXcRcXOYlxcVah4njyL0tBH/hOakzSyzJKFmXww9M9DwJ9YiGwt2gSNOiYK2C
         xWsdg2JhRkdKhJ2jtRKcdEIbNfD0RFR50TDeJJY8JXJNO6BXR3ZsKfEerOChAwZlrW7p
         /SfG2oWliP/Ssi08ReWBW8T8My3XYMJJVKj0IhF534Z5Blqrw1lFqYj/ReOPMCazYmm8
         icuyH8dJ66CFBvae5Ugc5M+qCHXKTwFW6yOOax6Q6+MoqljUu852+4gL5BA2nxp6tPeZ
         vA/iI8idTjxmjotXdqBi9CymJ5tVpeDODAaYfEjGH2uC3N8TPy10NZGsewF5yk8wHA8h
         gUlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoWMkEzSMJNBXyeUXlxW0/n9E20t7Cs30biugODkhORslR9d9d8kxsKIpvzdqrIUKZZoVlFHrz9KjcoFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxpRSe2M9J5ynLSKX3Q2YI6jSp5V6QW+Dyc73/2uptEgViCItA
	ecGWL3jvOa3DoQUUPJnOzvLb6qeD3A6pFp9efaCavH61+Ery6VSindtLt9Jl9c0B7pjQu4lxx+y
	3HkLIXefcjhuAjj0lkdzZHnLlk5hR+/g=
X-Gm-Gg: AYBFou1Y/SwizNQYpRU0WOrZdOo3lM+JZ4vPM+ksVkSucS+bClS2XEBWCbuBoK/hM3V
	8l9Gqcqj2LAq2+M0r9PAlUMQR152cChzeHrUob1RZzfgO6SP8KighzpZ+mFe0vfuFhX0DOkWvcx
	OsOH171pNaqu02m1apkhAeUhAAPKGP3SLpH1zvaXNLS+nS3JygPAj1zaWNvyHBpDk5ClJNLRIIR
	vhS/rQTn4URyqJo5NkEg4JHhmdztdgSi13znWKQQFm/fZ9+yOHNCduCdd23DOqhG2zEsvvbRphg
	tHJtWHY+Y5jTuu3tsjnEwBAxklxwu6pxBxX1nbP8PXNaSDQHX2r4xvLm
X-Received: by 2002:a05:690c:39a:b0:8aa:dc82:36ad with SMTP id
 00721157ae682-8b05b191e87mr14205787b3.94.1791373115311; Wed, 07 Oct 2026
 04:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
 <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com> <20261002-useable-progeny-f984e157d19f@spud>
In-Reply-To: <20261002-useable-progeny-f984e157d19f@spud>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:38:24 +0800
X-Gm-Features: AclHuK9q7oSZ1h7T5G-3sRuCxbGIEULoECKe9lDq4uTM-LPtzVRcKeJup-HGblI
Message-ID: <CANUHTR_P5eBi=jhS1akdTfg97OXzP1yJnmsUqg=1ewFW10gckA@mail.gmail.com>
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
To: Conor Dooley <conor@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thanks for pointing this out.

On Sat, 3 Oct 2026 at 01:22, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 12:04:16AM +0800, Felix Gu wrote:
> > Hi Guangshuo,
> >
> > On Thu, Sep 24, 2026 at 7:01=E2=80=AFPM Guangshuo Li <lgs201920130244@g=
mail.com> wrote:
> > >
> > > After kref_init(), the device_get_match_data() failure path jumps to
> > > out_free_channel. That path frees the mailbox channel and then falls
> > > through to kfree(), bypassing mpfs_sys_controller_put() for the initi=
al
> > > reference.
> > >
> > > Call mpfs_sys_controller_put() on that path and return immediately. T=
he
> > > existing kref release callback then performs the matching cleanup, an=
d
> > > the return prevents a second free through out_free. This is the minim=
al
> > > change needed to keep the initialized lifetime balanced.
> > >
> >
> > I don't think this is a fix.  mpfs_sys_controller_put() does the same
> > mbox_free_channel() + kfree() the current path already does.
>
> Why would it not be a fix? Maybe you mixed up the delete and put?
>
> static void mpfs_sys_controller_delete(struct kref *kref)
> {
>         struct mpfs_sys_controller *sys_controller =3D
>                 container_of(kref, struct mpfs_sys_controller, consumers)=
;
>
>         mbox_free_channel(sys_controller->chan);
>         kfree(sys_controller);
> }
>
> static void mpfs_sys_controller_put(void *data)
> {
>         struct mpfs_sys_controller *sys_controller =3D data;
>
>         kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
> }
>
> the kref_put() that wraps mpfs_sys_controller_delete() decreases the
> refcount and is the matching action for the kref_init() during probe.
>
>
> > > Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resour=
ce leak on probe error")
>
> Unfortunately, without a signoff, I cannot apply this.
>
> > > ---
> > >  drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/so=
c/microchip/mpfs-sys-controller.c
> > > index 0400a01b2338..379e4f649faa 100644
> > > --- a/drivers/soc/microchip/mpfs-sys-controller.c
> > > +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> > > @@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platf=
orm_device *pdev)
> > >         return 0;
> > >
> > >  out_free_channel:
> > > -       mbox_free_channel(sys_controller->chan);
> > > +       mpfs_sys_controller_put(sys_controller);
> > > +       return ret;
> >
> > If you do keep this, the out_free_channel label no longer fits.
>
> True.
>

The missing Signed-off-by tag was our mistake. I will add it and send
a v2, together with the error label rename suggested by Felix.

Sorry for the oversight, and thanks for the review.

Best regards,
Guangshuo
