Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342947;
	b=ETQgzRVwpnSGSh1w5MCtzm/LIjOoNggpJ84orywU9XkATuAo4ZT61v5GLZdugjS7CN+4
	 Bk3R3tSts16krjqQT3ewfDU63LG03nmDZ2qnebPajU1vXfcm045LI7mHgZpyNNG+lBxZu
	 qYuPawV01Bgm540BbIJK/CW/tDkPHDGOGkxkfbxGX0upYw5L5KXjdTWxyCieNI/p89eEi
	 uA7mP7roO/CBvvvxKDEacuGzsmgiqu/iNUuFjGwzCVTr1qA0vdIALBZS06GQPnXWlRJf1
	 aIZ00ZPINoFJrZrxaOlrT1Kt0bkPSjLMVfavraXQPaUGFFSl5mr/x8lnKxidzyxndWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ihZJvFVo5qA9bHBSjqRZ6mMHlkTfcms3YLDhCt8pbv8=;
	b=SjiXl4/V3n8hus3B82Z9uTxC7I9zl5ky5LuYajWTACKefXhoz0nU6169WuOwXzSyMKNn
	 GzZOrruntv9wXkFfbrPAZ83HF5jRx1PKIkrBvJdVdjDYWzWKGRTUiSnuOVBsrWRpNKrIp
	 sn2FhHert63pcaa+AAYR0AiL6tP6SsDyaI9G7K9uhW/9EIQWFSHWlm+Mh5MSRiljT/KJd
	 clBxUyqe7nyxH0JJFaw+XuvtS7zp1YE7eEevG9Q8uBLDow0XYcn8IYHUgmNtTBLR6iWkC
	 F3MJv+EADZHJFgHl3yUUYTJVWi6fPZIpPxip4XIaZ0k+vsfLCILu+UINBxfriFpAPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvSaQaOS;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DB606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvSaQaOS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so1834057eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793342946; x=1793947746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihZJvFVo5qA9bHBSjqRZ6mMHlkTfcms3YLDhCt8pbv8=;
        b=AvSaQaOSZCOjDhrd+clfjgDooA4JmUDAyaTu+YgkbqGjrLqMKAA+Q/0E3ZG3iHGl9f
         PoZXL8AVr0fv/+zmZqXGmeqsEV1w2wdF+8h3PyNl4mxKY5L0HdGxRlrUNc9fPWJvFlD1
         VWrnAPcnDY+brHFJNcx2mVEHiECZG3yq8jPPf7omfYSx5RTwDwB0qVzsyYuJvxzwhKUT
         OZJunlFKbZY2NQFgr1S1qf4m3RYm9e0kUrIRzxajcumRL/rrnZdEEc4jl7hJS7VuYgEr
         BDDpFqnIl+KTscZVSvq4r+POHR8C/a1lw7LMnNca3W3jZP3zbGAHFYW5dZup/OEnDw5g
         b5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342946; x=1793947746;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihZJvFVo5qA9bHBSjqRZ6mMHlkTfcms3YLDhCt8pbv8=;
        b=t4j8I1W/hCMKzXO1A5giWXzlDt+u8Gg5FqcuuzO5gnQDDIei0DNFDW2rsc5ehdU4qG
         v2WUMRclbdXG5W9l6v8Mj+HwvZ984pJdY76e5mX5Y32mpdB7KfOBCqYEr+LG3xHmoZSc
         dV/TLMHKWH8MrgLrrClaWpi3uwmOJlb3RPahxs0PYNmGluIBt2aF7JmnOYWSQhaIC66N
         Xz/TBRrDF4RKZ5TMgKQlseGE3hs00Shb1apuFIbVTLbZL375Au1KZvtgILwsntRDIcqh
         LaTRgmo1SEggjFfsxOWHEOw0qKKMtz4KwYpIhBJb10cGrzxmiUh9UN8XIPEWvGIkU2Zr
         +QrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSx9uFEiJQd7XPyHoUid4GfMsNR+H22SLyMpZu7FJVS+TABSdGd5HBS9qxiMCEJ/XNpvSVP8UNR51dbVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAAcHAyP9HNrnlukYJ8dmRkNo5JhHCdBL1yDd8h/hdDaGyhIPj
	2pFQ/oJxGBoYoiMWVLYOd52Ko8m8AAsziZH5NN2VO99JWne/GV+Kham18yj+bHaO9+9GlPE25q2
	lzC7jTkFtJ1FLWuZajd3y2RTi0Q==
X-Received: from dlbrj6.prod.google.com ([2002:a05:7022:f406:b0:1a8:2945:774e])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:2606:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1ac55f2d32bmr2370550c88.3.1793342945214;
 Thu, 29 Oct 2026 23:49:05 -0700 (PDT)
Date: Fri, 30 Oct 2026 06:49:04 +0000
In-Reply-To: <179324296598.34505.11070163314749859668@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <179324296598.34505.11070163314749859668@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030064904.4149904-1-almasrymina@google.com>
Subject: Re: [PATCH net] netdevsim: delete ports added after a failed reload
From: Mina Almasry <almasrymina@google.com>
To: Joas Antonio dos Santos <joasantonio108@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:02=E2=80=AFPM Joas Antonio dos Santos
<joasantonio108@gmail.com> wrote:
>
> diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
> index feb88cc..a871790 100644
> --- a/drivers/net/netdevsim/dev.c
> +++ b/drivers/net/netdevsim/dev.c
> @@ -1697,8 +1697,13 @@ static void nsim_dev_reload_destroy(struct nsim_de=
v *nsim_dev)
>  {
>         struct devlink *devlink =3D priv_to_devlink(nsim_dev);
>
> -       if (devlink_is_reload_failed(devlink))
> +       if (devlink_is_reload_failed(devlink)) {
> +               /* The failed reload already tore everything down, but po=
rts
> +                * can still be added through new_port after that.
> +                */
> +               nsim_dev_port_del_all(nsim_dev);
>                 return;
> +       }

I prefer =C3=96mer's version for the reasons mentioned here:
https://lore.kernel.org/netdev/20261030064245.4118081-1-almasrymina@google.=
com/

Either way, since this is a non-critical fix in netdevsim, it should
target net-next once it reopens after the merge window:
https://netdev.bots.linux.dev/net-next.html

--=20
Thanks,
Mina
