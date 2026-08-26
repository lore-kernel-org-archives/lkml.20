Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1A3DB62F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757723; cv=pass; b=Aeq95pEqf95lHOFx+POsL/xctv48hwroeQ1qC938Ti0WVlTurqsaIjKuk0EjrsHN+EyjPEk7mPLOfPAT+U6swvXH7BcXo9lURjQrQvyZtj+IbbozfowBNoY7V22cdTNRgNBejZF29YenvvYz5f0bkfHsI6yPyCrL60iWnAruT4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757723; c=relaxed/simple;
	bh=T+pQUM8yp6b7P/1kB0qn6+JFaFC4LSH96dTTILveX3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYwrqIvr4gcmg4nLJbd2q1fMLY2t5OLo3KzedKELmOQCVnHeXfKP2RmRG0JqIeCh4YOALQqVL0EaVDhc+fSBQtSWx02XAUGXwtbJbCCswMsKfZpTw5yuHTvQx/J1oosUWxEKVWzPPdlIp3gbySWiFn6Rvi9ZFLJURMg7qVIFRIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA5oMiVU; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA5oMiVU"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso218396e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787757720; cv=none;
        d=google.com; s=arc-20260327;
        b=Rk4DST0zUGrw8r6ZBlr+8E2hMfgQpK0PKcfsd95dZfYWJf2/myQpwL0ZGLJ9rpag1w
         iDYprO0rvr4sHApV2Wd5P6FNPTFFdBJSKqAAMrBjeg3W/20RnjQDp9c+stsG/TO2RpuV
         8BDlzmAw/4Wfa99yYSKXfCGm9EZ5R+X+zGLQyapBPGn5QRS0JT/FqgKM8ZdL2X/KNzcD
         4a9rJ4C3ZrqePZpkHVMJsoJvtCENi0Jmf/zNQL+1yaUfdBb8syoJ3rMCngDOOhw8nf+x
         Xv3sbid7RQwtaH12mdbbwe5apBXdE12UtzqpR8Kzi7gyQriISNEP3er7MGW5/Aw90dBh
         WMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=keuFsF67kg9NNd6vPGpbcOXT2Q3wwuaETpuXDlkHZRk=;
        fh=x/VUPe3BCZGRmGtUG0RGhzBmFYlF1bSNFVDQRensfNA=;
        b=VOZUbFWR4tebJS2euZptvtF/5m3o+tNg3nNJec/UEMxguzhyg2nEjH3awxZaS9rgpY
         kdM42qjShbnrDp9HQTmNcZJviEmap9mQU/WUQDn04IYfcK++uV/4XH4JARLYfsWY+HFY
         Z5an3AWg80X/psmvgZ65ItlE5Qelx5+zGTl6mICrrcAiXvjcrlsBXAgh0aELBsNvAx/D
         vZ+ghnS5oRYvQnZQDRhSf5q8H0F/Y0Gfxnf64QHmu0PZgKSkNd2NemQ0DINVgfNGU515
         pKaKTYBwh0yn+YAyKKkKHGckAl1/pzhU86DG7Mslbpp/pKLo7dp4FTCNV0q1/vCfBoSN
         SG8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787757720; x=1788362520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keuFsF67kg9NNd6vPGpbcOXT2Q3wwuaETpuXDlkHZRk=;
        b=IA5oMiVUaNcWoBL35qq6qVFM1uMutr5GPnYgTmjHWWp4ReqGTyRnihDKr0XuLPYyLY
         r4tF/PvYJvjYEzZ0x/B10aN3Jelh6ju515s8EMP2cMEu7i7HjY6ud178BW9QoCGYJ93S
         boEaISRlZD0kWFGR8+QOqHu37Gn6lCX9APshbsvrIh6tKOWlzUTrcPF4a3GMApFWYjyt
         C7hIVByENcFIIZ4bcS+GeGb0L2SmXhtaweh8hqzC7bt74543jZ/rej19shtUZwv+4w5K
         K9YXlhz/tCaCTknhclQGqwPvloUGbI0gXwaYWZh+9Y59v1n9bmenHh1abUDZ3oqO898W
         QZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757720; x=1788362520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keuFsF67kg9NNd6vPGpbcOXT2Q3wwuaETpuXDlkHZRk=;
        b=hxirQEQg4UjeS6deZrUs/xCvg9bahW//mWJ2uqkbqOTUNDVG3yzcNuBW8fhi9QZq5T
         6A1fMGbpaqfVRgEpucLcoyY4imUy2xQ4zwHjj/qfCmISR2OW/nCvVNWdtv0FtE8tPTTT
         0e8yOjRXCwsrbjAveoy2WSQ2BXJU5QDuKFPCqy/h0HZEhtHnP0URX1CQ1m7AJhWd4+bM
         KTeokJZlIOieGxZc++c4qjyrtiWyniQdD9Kjy2K/huHHDmMsShpwyfIYJyA+UvsM4Jx2
         6mBqbkr/7rQYhK4MlS7K3seOwf6nRhcoF0WAn2HEE+Yw58mfrp246fL5Nb1XbwewmhQz
         HSFw==
X-Forwarded-Encrypted: i=1; AHgh+RqYvXWneN3mOOmFj1E7gHbC/WllQog+Zd0eYmBXowt6ZUz1vt12uSvw/vbtkNQXsbVw8P5BbS4edzWBNRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mXzpFYVvF4+8qbT+v/GpMLUjqp90gh+m8OdekZb+GHoE1e96yO
	L40IS5F5I8ucstCYeDRhU5Ldzd1yjfRqkWKIoWoc1Xht6wn50eB6V3808ZQtVSThm97j2xZo8PB
	bgMgm7v2dLvqcm2exXJJsrWKPSiQYK6uoDWKiQ38=
X-Gm-Gg: AR+sD11wYz0PYUL4tZ1K3NHankAaHvRy5pNZgPvLUK5LHm+MpPPGMtbuKeB1GiCM4EY
	mlSygVYbFCx7hWK0xRA4cklZltEZO0+Lh556XeqgRJdWcjFwRRemHPL17Npbh7xS+Lf9+/R8mZG
	OjyDVlLLXnF5RZD2cGQP1p/RV0SrZkNMSlsipTqL01kh/nJa/FJ6QfeQw+qpCzl+6qtDi2/VPiN
	DoFmiTjYUZCX3+k4DoBpeZ6wXBb/bDpl6gIwHS0JTkVm+RFGaMcgXb4OLeCioyet+I3hwW+7KqD
	ZaSDG128xB2V84gIBLo01jjqXlMJC2aF6i06c1w2idqMzRx/u2dwSrlbNjku2wNeaLkYYZ//tx8
	=
X-Received: by 2002:a05:6512:6089:b0:5b4:5352:e2b5 with SMTP id
 2adb3069b0e04-5b4a90437c2mr2230005e87.15.1787757719575; Wed, 26 Aug 2026
 08:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-1-0171bd86a667@gmail.com> <CAO9r8zOGUKnyro5G7p8dnWchDKJ0KWobJSPv8aRw_R3QnjvS0w@mail.gmail.com>
In-Reply-To: <CAO9r8zOGUKnyro5G7p8dnWchDKJ0KWobJSPv8aRw_R3QnjvS0w@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 26 Aug 2026 23:21:47 +0800
X-Gm-Features: AcwNN1VNU1SolCqpSZfpskC5xY5O94jEhgtYqGj47VrZyJ04ZF8bPh8P4IjLdpg
Message-ID: <CAJxJ_jhU1+3qA_+RDs4wJRTrhNWQn6BpqD=f1WmW7NfGyi22Yg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/3] mm/zswap: release retired pools via call_rcu()
 instead of synchronize_rcu()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 12:55=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Fri, Aug 14, 2026 at 11:54=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.c=
om> wrote:
> >
> > When a pool's last reference is dropped, __zswap_pool_empty() removes i=
t
> > from the pool list and schedules __zswap_pool_release(), which calls
> > synchronize_rcu() to wait for readers before tearing the pool down.
> >
> > synchronize_rcu() is a synchronous, potentially long wait.  Replace it
> > with an asynchronous call_rcu(): __zswap_pool_empty() now hands the poo=
l
> > to call_rcu(), and the RCU callback defers the sleepable teardown to th=
e
> > release worker (the callback itself runs in softirq context and must no=
t
> > block).  The grace-period guarantee is unchanged; the retirement path
> > just no longer blocks on it.
> >
> > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > ---
> >  mm/zswap.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 37f34e406c8e..cc4243356e21 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -155,6 +155,7 @@ struct zswap_pool {
> >         struct crypto_acomp_ctx __percpu *acomp_ctx;
> >         struct percpu_ref ref;
> >         struct list_head list;
> > +       struct rcu_head rcu_head;
> >         struct work_struct release_work;
> >         struct hlist_node node;
> >         char tfm_name[CRYPTO_MAX_ALG_NAME];
> > @@ -382,8 +383,6 @@ static void __zswap_pool_release(struct work_struct=
 *work)
> >         struct zswap_pool *pool =3D container_of(work, typeof(*pool),
> >                                                 release_work);
> >
> > -       synchronize_rcu();
> > -
> >         /* nobody should have been able to get a ref... */
> >         WARN_ON(!percpu_ref_is_zero(&pool->ref));
> >         percpu_ref_exit(&pool->ref);
> > @@ -392,6 +391,20 @@ static void __zswap_pool_release(struct work_struc=
t *work)
> >         zswap_pool_destroy(pool);
> >  }
> >
> > +static void __zswap_pool_release_rcu(struct rcu_head *head)
> > +{
> > +       struct zswap_pool *pool =3D container_of(head, typeof(*pool), r=
cu_head);
> > +
> > +       /*
> > +        * The grace period has elapsed, so no RCU reader can still obs=
erve the
> > +        * pool through the list it was removed from in __zswap_pool_em=
pty().
> > +        * Hand off to a worker for the sleepable teardown, since this =
callback
> > +        * runs in softirq context.
> > +        */
>
> Oh I didn't realize that call_rcu() cannot be used with blocking
> callbacks, sorry about that. What about queue_rcu_work()? Seems like
> if we use that we can drop the intermediary callback?
Thanks, that's a good idea.  queue_rcu_work() is a better fit for this
pattern and avoids the extra callback, so I will switch to it in the next
version.

Best regards,
Jianyue
