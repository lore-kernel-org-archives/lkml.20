Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B74CDDDD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392469; cv=pass; b=bXg5MKBIxDP5yzLaB/eEpd8ZRExJxMwATkBAB2Gb9iHcg74Kgt9tGRY7VOMEoxL0SGcXMOr3k87w0qnFDkUw5Vc+jFgTNHdcISlVQtP5Q1PRxDEpV+9+272TyPvrOsO3shkWYmUXPI2c9tSiohDJJhF/vRRBRCnrfuKRGbVjX5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392469; c=relaxed/simple;
	bh=lbi4xj2Emd1g7pOLi1U2ASUewhb5WLgJ4dWZmBXY8TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeaUVvT7sH4DbGdquL04JGNIL1yv6hKtw3x5D+IEzfMeqCCGPdmYGzxV/uUrKzNlHINdy0fbUl55lcxKRbRqEPHdVb/eUL07HHqM1OQTJ2hlnGYuLtpVMgcCgN1iWKdEf67MkwonIMFFXVwe6G96Bb92E60soW2yrfmjhPV3YqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzTcTWpY; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzTcTWpY"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98c7353395fso673797241.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791392466; cv=none;
        d=google.com; s=arc-20260327;
        b=A4T4ApqgVPydfWBj254zwLLtWzvNofnSR4mBGFUYQkhJiUnWUUvYTGUJbA0dNInBNA
         skp88N0fNF4VBFdrQEedW/1Us82K1qp3yxFMXf5LE3yRGSPh+keW5UJs+Ly1J7y4EDAX
         kSVpHDXnec2KwTrpJIXiS+kLG1NpRn7i7XRilj77AjNmOb2fWq7cky4993RYt8i8fuEU
         zo9keoAcXzGIWxKaQIj8qexP2aNNJW78ud8G6fG6NC67RxjxMCjPgNRb8eN800iGHxRK
         HQInSqYN+TzRNggE3Rpkz5KKaMly0Giw6N8CUqpk/FDJDtCtVWplgg+tQBfJXEHpMOHZ
         Z7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        fh=XGN3bFk0Tsiyd1zMQN+B4U+7AhkjQmp8Kntrl9P0cmE=;
        b=ZC8BJnlMmQNciR02/7mHENeoDtGrMRxSHmmH7YVyjUP1XyjodrcLv97Ovx1mYY50x/
         fAE/mqHCTqzVPvcT/wHuHolqljHz/WutyQHPjbnAmTxKJk+H7t3Y3JJXWddKxTuMjZ0j
         u1hegTaFuc6tnd7IFBfteE19QbW+C8hNX125kx32Gd92IFAVBqBib1J4u3tGsBxI7HM9
         n6aHlUEhISkeuIiJUbV9PIxiZCg7nuBjgDzJQZG9rwfMbTJhQoqwjI3jaYqHF6mX6260
         Bvflh0lifxZIcwaIqjRqiXpnhdGtAZVngL4MUZ8Ykgl2JhIQcUGDUObwXng8A+bA2WII
         2ThQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392466; x=1791997266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        b=dzTcTWpYCFXATiNRgrUVH5sjbY1942rgLe6Nw3yP8zFIfZMVD2zyPB0mLsO388v7zl
         CQTx+RI16V0OacCKhul28xZdppvMCnLOgK4y+q4xLGybDrgd7VEAvEEda42Vj8C63FRq
         clJgrdtxnXdCxK0j2yfNP5k7NKEfqle0+318NxTiZGZLBSxMzWTzlHqmBBx2fPnEvAz5
         I1p3EmpxHLXyd0AfmyYt1TqIXbdN2Uxrwn0jqls0Ii0Wh9i+IxCnBB6BWqD4wT3WmGP8
         bcr2LXjx7mF93TUP6XiICI32+U5/eKEwcJj+F1vb2DLiAMi4azaHueGXqUZWn8KfWCcJ
         t8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392466; x=1791997266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        b=vJhrnwoN5mm4j0QLEXQrmBFwAIb07tREu4/lQrajyEWuryVBFjYl/JzRqnWN/D5VAD
         R3o/VF5h7W0N/4/icJfyda1zHn6mjuOvP76FOWFaCu1SicClA122LgzzgqhHJoqec4hN
         PIPVzUA/zieWIKrFGB7NpL3uJp0X1Kh9uzcpKmu7z8BDBuXJT5DAYkVVyReGnZIvjg5F
         4c4dzpYJQqeUy3+lmISMQJFe+VYeerlWHzFu5TmV/8SS0DVwLDXcwYNn+n9Kle7xJDfK
         OPhglbFOd4Onna1bbD6Yd0l/0dXNNbr21y+mhBCyZpKhwhEXLP1Mj9EQHZsYhUfcS0Km
         d2kg==
X-Forwarded-Encrypted: i=1; AKwUvBx5l6o299pL4j9dlq0AeAA/Sxt5xNinuqj/7LW2vi5wS2JWdTNK8a8TDO/NQZOM9nL2ZvM8kZ7sWQGtDec=@vger.kernel.org
X-Gm-Message-State: AFq9FYINCc++5ONNYomd/PV0tvIOJULwsdgZjpLfS1nI/vX08p9f5J8T
	Ij9OclfF1C2BCi7X1xlmRhnmHFUVR2ETlMgl8wtRg3smuGXhnBzWFzl3fULfk2MKJWbkuUuguwT
	k0wShpxBwFry0fidEfC2AiFJc+Ow9DcM=
X-Gm-Gg: AYBFou39w9se6uA1BCA7gb3a24g/PZZlD+e6NUQcJLuWqj3+Est6qTFBPVExCef6vGd
	ROFw+3b6dHcEEmim8HtHKP4GpKe29rTutmY9GBZu8JnYtV+MbQ21DD/rHY3P5lTmRF6ukENPVA/
	nvJn34WfaR1wonrOW4hflwOLX6bFfUO45gdkUiXk/4XQ3ltRd9+gzlHKQPDZgJZtJ7S8qklaYAr
	eiGaXVavHNiz5HwthG4kJYqW3YUWNB+ACdS3mRhpEj/ZPU2k9c/wck14JPczpAn0ID7/LUNh1/o
	gRDVs5pXkEe4q1HBXp66FTvW4al/fI9HOUKwoMD6KTlZWD24BlA2TbWfgVQ6m0gnqmqNN9jNRbe
	GfRTUiIc1L+xGuFHrDi7Yx5fQK6p/R8+GzpKtZ9r/lDB8P7ViMXgpY+0mUX2iltz32kRtRU5FaY
	xi/PGLnNS19Oz4UsX6UhRgiK6fVQaIO0Xhqy4GM/x0qGT7
X-Received: by 2002:a05:6102:441a:b0:7c3:a175:b3a4 with SMTP id
 ada2fe7eead31-7ca38e242e0mr699581137.36.1791392466173; Wed, 07 Oct 2026
 10:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch> <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
In-Reply-To: <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Oct 2026 11:00:50 -0600
X-Gm-Features: AclHuK_jUgMdUcYYqpUGuap2SPkyQESAVUFApu-SDG6nwRRhv-n0wwBC2Dl8Id8
Message-ID: <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 6:46=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 06, 2026 at 07:27:05PM -0600, James Hilliard wrote:
> > On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > > > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.=
org> wrote:
> > > > >
> > > > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > > > Please do not repost the series just to address the above. In=
stead,
> > > > > > > reply to this email with the missing information, so that rev=
iewers
> > > > > > > can take it into account. If the series needs another revisio=
n for
> > > > > > > other reasons, please include the information in the commit m=
essages
> > > > > > > then.
> > > > >
> > > > > Please make sure you read this paragraph, to the end.
> > > >
> > > > How much detail should I be including?
> > >
> > > We want to decide should the patch go to net, because it is a real
> > > problem which bothers somebody. Or is it a theoretical problem which
> > > will never happen, so we might want net-next, or maybe /dev/null.
> >
> > I mean, it's in an error handling pathway that could be hit if there's
> > an -ENOMEM error on an IRQ-action allocation.
>
> ENOMEM does not happen for small allocations.
>
> https://lwn.net/Articles/627419/
>
> So at first glance, this seems totally theoretical, it will never
> happen. So net-next, no need for a Fixes tag, etc.

It looks like there might be a few other ways to hit this cleanup pathway,
not sure how plausible this is in practice however.

The unwind also handles other request_irq() failures. With forced IRQ
threading, including PREEMPT_RT, creating the safety IRQ thread can
return -EINTR if the task opening the interface receives a fatal signal
while waiting in kthread_create(). That reaches the same incorrect
cleanup without an allocation failure.

>
>         Andrew
