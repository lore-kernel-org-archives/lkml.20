Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792563469;
	b=dLZ2JpfxVk/u6NgrSDJeN1AAEaLZp9o21CxihFkrXFKu/RQJGL1bWsu+Q2+xOzcGmGx2
	 zUSJyHz/jPuNLdg1S6GNSkPPNEGiTkH2rB5ekAInGcu2/uGN9kOn9cv0fs3YwoDe+HlWv
	 LgFFyr/qkriQggJpVIZHonf31NBaCnlzqnDoXIvo1YbqMfiAtYLkIF5wcRHr6XOl02Sbc
	 ABM+aBJ2i74qNJ+kFmC0VQOHopuhcc56W4BlNiK7deyq9xfs8Tjj54NLoyRwcq4kCOmDi
	 JFabEwzFSTLnLJev60FQgg7jrSpsbY18Dh7M9NswNI5uMQUYdYF9JkiZyl26evlakaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
	b=jbveICXuKFqha1iIC62wl25P0InMplggjeSLmOeD18dr1kdj/2dP/mzzDESDozLiLWoT
	 WhewXVgKVVbEe8dsJ9tga0BGGUVk2lmwBB6C7Qe532qu+ZYqNg4KdO/ILV2UlS618OOHf
	 JdojADGoiT5pelFKPzs2N3wO65lvCQ59GE0rduiFNHhXV4ly+l3fdzvpU6xydYrRIS0/E
	 O0UC/ajf3i0hWyoJcL92oudmB72WeG1kxjfrY+ORA6GbyM7GaFYJFGjlxQ2cgLWiKcpXe
	 5FEoz9jjGTY4QaT8+ZTTb4fm/rHsvToUp6utC1o0CpU3Mo0yH6BKG4TjKetdM9QBEoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pQIPJhuw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A5606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9A5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pQIPJhuw
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so7540a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792563467; cv=none;
        d=google.com; s=arc-20260327;
        b=JScJWgSdHHb7MPTC4SeM964wi2u/5lYm9l1uax46IqpQlX55FpnLHQkpGXf2Z5HIr1
         JgiNND7J16IKE8g6ei952O97UF6Jvto5ftFRLgLa36Wv6x61jzYeISIRBeT3FQxXWX3r
         q0HwnUeeGH0qF9FftcGTBS9DcLp2QWGECzWbo7QRdilQh1u2m7JywVFi5TvAJJ1uL2Nt
         ZtFPPAJgtPrbsztIsYqksHUI0S9Yu7veV6bQsB26/fzPOe9Ly9Jtx0RlXyHTHnfctjLl
         rhewwYmn0+R4IcR5IEFgAPSYYlPqYErK8P9vt8bEei83+2jBYnAdSLisUbUZWi+e3qml
         xhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        fh=2Up3HvTKRb6jDabc+1vuDJH7gnBL3pEaIabsjzYLwXg=;
        b=mQ0E8KgnW8RT/ij/+pyhOY38Qd23Pfs9oGcDidye+h5yJt8RxZDb/UAq/eXPIEEPAR
         PuOsIAffCjaGH/RU6dk1/3N61+VoLGl32kIjLciMy90LONr/TkFxyA99GrJoH53Ucs2b
         dCtBhYOwCk3MXO9paGiSr0pxKrd/V0FE/Osl+H5QlrwP6TXAbKByvcfC/BDWO7BdEldD
         8jHLiA2mD4cnsGpJ5tVryocgqoCpGbjmuO0Y09+k3oYzVTPXvnPBrn/JdY50moYojjM7
         pCLqIwbgBuyRQstoK4fhGiBkyg6LLr48iCtjIHuxPL70uBxeVXOcibzKNb5bBlsnzRWw
         Pxdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792563467; x=1793168267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=pQIPJhuwRgwitqjGA3ItWVLOGRQSBJ2UxZPYrPAWnSbOgQb7bum+xLkiJsThMZqhOH
         dwhP0Tb7gfDJbRLLmYO0L58nN/lbc0ijCbj7vD9/AsO9AN+96fT1k2yklolZXbSXuPwo
         LvDI+a8olKugTFENbi6HjsCC3zDMl6Iz1h6NBkZRClcTcPd8ggh/X4oK3qTp3lqZ6g+A
         1/vCcb7V+C3SGzXl2pN5Qza6vN7p6/inIC4foXEFviRK7uLerabWIo3jtiqgZBXKVU0E
         35IRXsTcGT6NK/j4Qt7Yug3jaRtwJPct+J6CNc9iCK/DHqCogYkMU/l3zqzSbvR0IHLw
         KzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563467; x=1793168267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=u2RMPNcM6ayRrEwshVJ8NQeEDpaQzxUDj4aKtlhIa8tU63f5geFHvp/TqDZsTLUUTK
         sk3iMbKA/h3wZZ66GLYPFGdsiyD7KHVb5zQaFACrAkXQdbjS+W/aPVqQv2yfuyItzZ3q
         pzcaeNRjqp2J1aonwak5hGOZ5C+RZQL+VUV0VzYehXSkOzcvNTUhkBEFrzA2XvpUO+Gp
         EH7sIu0St0ay4l3lfteZefRqcuRxPni8owBMOlYWQP/2WUk/o0Zx5JLaMGWQ150WamEQ
         ++H9nEeZcLh3fSvaEUB99tPXLkeozP5Y/lSXHm+wyZhEfE2KBG4gf4rzRWx3i4I85jfu
         ou4w==
X-Forwarded-Encrypted: i=1; AKwUvBxwq2FeTeeHQnPXiAn5lUtFlE8GZ7Dmz4zrLQ4JAgbU2vflqLpCll2eSDce/sKqLD4CRm9WnWQc3rlorZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYINw9C1qHni1RtfrXCVs/SrzPQ80ytxkzzGDsYKtL+kvkhYnvM8
	HNvgk+hEWJGjpTbRD8IacXa51FBVh3J1oQGjUf/T83pGH4aKjnrJmvvT0jZeP7/g9hYhtGjL6IU
	AohO1aKTrs0p1/7MA+75UxW3t2oQcBC318MiA2YEm
X-Gm-Gg: AYBFou1M6j6B2rAsOyXUmMMR9b9IW83EXBH8lMiyHcSuAecufzA4NvA6jNh3PUZMvyG
	eg23kFK79qZkFcOW8vAVVstefTCZCkc+vZ6Gn3PGbbL9rSZA9P/SUqKn7qZYWKOYLBWQa+MHAso
	AUj4pkeVQK3CM1tAzRkbOLOReHsmbL9RLaq6f9CIy4QEwnW4Uinjo6AR4pPW1rs6tQg2oPD4MeX
	PSklWnpwgOyMiOpt1QAh5eyzNGTM835tjBmvlRXl9pJn4RT8mSc9uf0rrdxkM2Ems2kgc+9OxhJ
	D4iVDmLUJ0wRNVxh8GG7PN13RxNAk+ImWIhdChDg8BuyEt7FKN6k6ugXGP+jaxiL4jNMkq0AM2O
	zT7dLqRXuZZmVSWiZKlp7iz9dJar33dGbuA==
X-Received: by 2002:a05:6402:4050:20b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b3e77153d8mr91222a12.12.1792563466679; Tue, 20 Oct 2026
 23:17:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
In-Reply-To: <20261020121858.3b9107c5@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 23:17:34 -0700
X-Gm-Features: AclHuK9x4qWdNnjJvUjsI2EHUcAIAKj09plc1NcLTKxrSfCtCSi6D5JlUi63xuU
Message-ID: <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 15 Oct 2026 16:39:14 +0000 Mina Almasry wrote:
> > Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
> > netdevsim net_device, and configure page_pool instances with
> > PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
> > PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
> > bind-tx netlink operations can be tested against netdevsim in software
> > selftests.
>
> Slightly worried this will bring a bunch of maintenance burden and
> "bugs" in netdevsim. IOW that this will be more pain than gain.

I felt the same way when I noticed many reported bugs against this
series because I didn't add proper support.

But on the other hand the test coverage is nice, and maybe one day if
we add enough devmem support in netdevsim we'll be able to fuzz the
data path or something. Is there a way to get the best of both worlds?
Like put a comment on top of netdevsim that this is test simulator
device and any missing functionality and/or bugs in it should be
medium criticality max or something? Or is it too much trouble and I
should drop the netdevsim support and tests?

--
Thanks,
Mina
