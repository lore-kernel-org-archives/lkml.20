Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E34A64D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367741; cv=pass; b=Tsy05jE+j6x9/kmzyjcHKl0vR3eJ7uIPsGRJkbFVfAjfaI3RksZcd2NKSgCdWOrRdpvNzrVY6fmLYWA52Bf0MhcBOhY3wMM4tGSy/S0WXuXhvI7hSeMisVE4qvr0JlHQjOi3I2VG2QixloJBc0Odxew9KG8YsY27n+deeP2XfZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367741; c=relaxed/simple;
	bh=XYkJRYoV1HNAeSeUYGdPMaepouf9MvMiK/gkMich3kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdyd9jH91khqLx/uUDtAgU7YdjRec7UNiWgqdQu/FStaqVNQXxRUXcOSpibfPOd6DeNUr7vt/8j688aLCobsboVuCtiYeRPmHW/0fiPUtTIgGth/3V8DVURvmlhneysT/R4ELsUaY6CRUUEoJYeXKBl0ElDAT+BRWZ+6XmIZza8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=CTOdsFHI; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="CTOdsFHI"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c160875e029so16646666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788367735; cv=none;
        d=google.com; s=arc-20260327;
        b=qoE03qf0D4eCXSxCYkAhO8bOwMmPDbTzPuxiUendSdJFm1YLFqmKSl5qJ3B5hcklGv
         YCpTWrIVSyITWg9FiBBgaJTIS+CzbdRoZWHtn3YBHJZZdzEWLeOcmFIsA1Gb9QnYjrZw
         aX5t4IGqI3kvq0rMxiuL3FCmDB91GNghZLcFv+iSku46vKpLakxYBM3hWX0grCLmJX/1
         OBEYvllB7ZTjPJm1TKXmA0e0ker5GGBlgXjtK6nCh6ucpImkgk/Lye0f0QBhv1Pi5+Wu
         c+VaHVXAu1WHFYriUIYdVWsp/ETPNgOt9NkaN+unb0X5j4u45Kprz5jNpCe5h0wHAqSe
         +pNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+zZDLZrzFygr/kaoUDVb3zzLB8Z2nkBsMg0+94/Yy0=;
        fh=qSVSfABmRNfeJfkehjvQxeBtYhDv9RhnxFYFaqqA4io=;
        b=XaISqfrlCw6VhRVJkeUdfOvvi+VDpM0U260Q7/m8ljPTd7KXW/uGrmS220w7FBK0HC
         xTtrwQCyQHfZpL5Gfc46FEqb1rwIvt9xjzRkKKvNSO1WW2MD+psVQg6xR56CefEhLbQj
         O9SB3RJrBhQaoCiIhYI/JgvwnYgGGVripD/q7HOU08Uf2wLFn5KzXB9Wckis/bML9OzY
         ILsA1hPce33p42xAZIwZrLsBmOWePhgya2WufDgUOTij11yJhs8R/Pdk6I53SUcxbAX3
         Gz61zaXi353CYgz2dHQWjnCjLfW93TOnZEhCb2ZK7PwxB5nyXUXDVMHA4OToxXIPV1jI
         1BMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1788367735; x=1788972535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+zZDLZrzFygr/kaoUDVb3zzLB8Z2nkBsMg0+94/Yy0=;
        b=CTOdsFHIj00YsZ/DQEeHqPdgEuI6/fqQdVbKeKk1rVmoE3jlI1lcpP+jZ/AeHAs256
         SEeSfAzFwEpYVgWCRUkvB+WR6KJPC7HvIGj6n0V1Zg6lxdGuF1MQU1XDC98QbFwix9G8
         qyVyw8wM6wVMrwGxxTM7lKmyz7hrw//2utj1qdsMyKzl1Y6SD9zdW57/ow5Z9TOJVhhk
         tGmHFbYXJc+e6cvCKgmPfaitojykqcqhzlr4au60nP9oRZeqJxH4dUbtEnG5qYoxtsFH
         vNFSrXSBLsM4kk1V1LtJAubixWGtQzjUW/QP4tYVzvRpb19RkbvHxRB0sdO/IspuPdVc
         0Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367735; x=1788972535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+zZDLZrzFygr/kaoUDVb3zzLB8Z2nkBsMg0+94/Yy0=;
        b=Y58oAbTkSSiwOrITLPSxwG3gc1cZ3p8AjFYDBXZZep1uPbiZ9qPPi3/A0cYojsAW62
         1VY6OQQ3cgqP6pJakOz2h5f07izJYxRysfUXcAlfsmEJ7DjxZBTCdLAvyuAfukq3I0wU
         AFCOjQlBZhBiZoEFPRyJ97k4wYe8Knp4i2efMapv9MEjrpj7eL9gQYsuZ2VrHtC9jMm4
         PAfOH0PjR+0dYUleYitsVjWU0cjmqol/2CzV0IOHFZ+7k5qjdP47onU4UgyB7+q0joVR
         uDwP8azasQLxv+AIqvvD8i5mIHGWvZk1rHaeFlAXwpu8aedQl4TXFGUqZuiiC089ZNCv
         K4ug==
X-Forwarded-Encrypted: i=1; AKwUvBxdv83kJD1BglGRQjTR0cjG7Oh2wykKjF1+rBzOjwvLCq7Fy0F4p8auV1XPzcz35/ckrrkHOjNjpnMtkGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nucUDyIOmWoruUx2IqPrYPdR0AjwTyDRMwv+pZ5Q3hTRJLcNCZ
	Ng9QjqK+IaVM4eM88DHGo3DUT6iWMGfaN+n7EzslVGhO//Izg5lQ8/vlMEqSMJh3AoBpdboj1nK
	c/bvwj4jWTjSj9XPh/N3Ks+47gG2iUVf1JcAhEncKCQ==
X-Gm-Gg: AYBFou2efjoL2ojm05CY3A5kp1SEAyvud6pbn7eYG+KkYnIA1qI2g/KVx4XBF1rkwGE
	CzC/Ykc0VafeLWJWlBNCO/5W4d9tB7qiECUmufL/Cj5v3QmiqB4w2cBfKoNSO5ZjVmvU0MceuaY
	r20ypNf9cPh0+nGWtm8uZiPrjFfadOhWMYYEq8kw+KaU/J5DfanBZHmAcLPu7DWeUsIXX7GCj4o
	53X/Fi9tqWLVeVRpr6QLUSHxIQq+ptaVpKPGU7I2PwUiel8PuSHgQHEnKgVdSjetfik4Onbi/RP
	UA5vYYrxDnBYI7pwaKAGqq9rrk2YQNBmI/RlduA2G7eLDcEojxm7hvjW850QSY5ORdyLL0h4BsZ
	hJeNxfkSN2VvU
X-Received: by 2002:a17:907:9405:b0:c25:2ded:ad36 with SMTP id
 a640c23a62f3a-c25d4c9659cmr211413866b.0.1788367735185; Wed, 02 Sep 2026
 09:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-rdma-rtrs-clt-cq-pool-leak-v1-1-b169434fd3df@proton.me> <20260902162518.GW24140@unreal>
In-Reply-To: <20260902162518.GW24140@unreal>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 2 Sep 2026 18:48:44 +0200
X-Gm-Features: AcwNN1XFdGQqS1dSNDFwEx4DS2Ose8g86nKoPp3TAhbxN7pNr8uBNxboksiPoSQ
Message-ID: <CAMGffEmz_QSy2TLM5OBQ5GUaOiRozkLyuTNOXV8f9CnbvhPYSQ@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
To: Leon Romanovsky <leon@kernel.org>, quanyeyang@proton.me
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+d396918a29afb8543e1c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leon, hi Quanye,

I had a look at the report. The syzbot bug seems to be triggered with
smbdirect (ib_dev[syz2] removed), so I'm not sure how this change in
RTRS client would fix that issue.

Thanks,
Jinpu

On Wed, Sep 2, 2026 at 6:25=E2=80=AFPM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Sun, Aug 30, 2026 at 03:09:55PM +0800, Quanye Yang via B4 Relay wrote:
> > From: Quanye Yang <quanyeyang@proton.me>
> >
> > The client borrows shared CQ credits in the ADDR_RESOLVED handler via
> > ib_cq_pool_get(), before the peer is connected. create_cm() can return
> > -ERESTARTSYS from wait_event_interruptible_timeout() without destroying
> > the CM ID. The init_conns() and stop-and-destroy paths then call
> > destroy_con_cq_qp() while cq is still NULL (no PUT) and only afterwards
> > rdma_destroy_id().
> >
> > CMA serializes the handler against rdma_destroy_id() with handler_mutex=
,
> > but that does not order the GET against destroy_con_cq_qp(). If
> > ADDR_RESOLVED has already passed the DESTROYING check, it can take
> > con_mutex, GET credits, and then lose the con to kfree. Device
> > unregister later hits WARN_ON(cq->cqe_used) in ib_cq_pool_cleanup().
> >
> > Set a per-connection flag under con_mutex before CQ/QP teardown so a
> > racing ADDR_RESOLVED cannot borrow credits after teardown has begun.
> >
> > Reported-by: syzbot+d396918a29afb8543e1c@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dd396918a29afb8543e1c
> > Fixes: 3b89e92c2a95 ("RDMA/rtrs: Use new shared CQ mechanism")
> > Signed-off-by: Quanye Yang <quanyeyang@proton.me>
> > ---
> > Fix a syzbot WARNING in ib_cq_pool_cleanup(): an ADDR_RESOLVED handler
> > can ib_cq_pool_get() after connection teardown has already skipped the
> > matching PUT.
> >
> > Reproduced on rxe with rnbd-client only (no rtrs server): write
> > map_device with path=3Dip:127.0.0.1, interrupt create_cm() with a signa=
l,
> > then rdma link delete. Device unregister no longer reports leftover
> > cqe_used after this change.
> > ---
> >  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 8 ++++++++
> >  drivers/infiniband/ulp/rtrs/rtrs-clt.h | 2 ++
> >  2 files changed, 10 insertions(+)
>
> Haris, Jack?
>
> Thanks
