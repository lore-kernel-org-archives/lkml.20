Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925D51E432
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984182; cv=pass; b=VmurMGTRtHP3rtcZS7y+oIkSZKlRlraa3u64556WJOHOEBkUa/KLDQgUgdgdC5PFqH7v9SWx9R87YAE+bg5Qlu6XsnhRcH1jSCT23p1qQKOSKb606dDfsvFJPR+6KZg2poTesb2RPeQDNV5O9Pq3E9zKiNverrAFfiF2xIRenoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984182; c=relaxed/simple;
	bh=sx62d86u+TFaCg/f+CExTaHz5XyZuk82UhxVFxnoojA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPjMViWqwBh8OfyCJhWF0GDc99GiTAAHWGSGG9x+Bgbdi2G8p8eU18OBIogzQktM44CdBSn0zTZwoR9N3/STOMkAcBRXn95NTOOTdXgffg5EqETK7HLcqvHPzeu+v4Q0ClDjWMD3bCMP/PviJ1EOjfYOL87HY5uOcQ/sfcfddVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J61v5yps; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J61v5yps"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso3691691e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984176; cv=none;
        d=google.com; s=arc-20260327;
        b=RT7QWkete+HKqWEC0b88kRZc7gx/XjuMa5hb+Rwge1oDqSDRoRP5jF9LxxPws163mL
         ITgT1q1eQAIJsYESsYZnsn951UtgYS6f/0TUvVOFPDtV9UKkFNTTUnQevrpRdEa0fRby
         Gzw3cIxLPAaZBkIRSqdqOh/UjnNlGEtKZJPSP40rzubqVMmxsuEnzDTbETSGZiY8TFiA
         QFbc5+0pjCnNZsgoUCq7ckcBGKcE4llN5+nH72Wjp1vhnObEBsMeLvUjE4/scahGeIyu
         i4V4kOgERfbZUk2KF+oO8OBNGES7DgeglcokFPOanWtniZ4UpuHPWhdE6yZUlNSv4AVS
         JWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sx62d86u+TFaCg/f+CExTaHz5XyZuk82UhxVFxnoojA=;
        fh=r/KWlx6qs5KtsgoutTjkU1iy7Tr2U/Bo2h/OwHsoir4=;
        b=fkAhLdgZgRYnHjMbX8mU6Kw6Q1iw6DqPxIncB5tvJB5r8edOiU1FuaQOcxfXD0+Koq
         o+Wbj94AY+OMWLlsui3wgaz8uVFFYCv9cUegCBLLGRnUiu+t/ih7PT4gyuu8dAY+2kxD
         +aJpB6HfAwqIcF1mcj3oYl2OoXR8KXyflJXlg6Cx/pThA1T8r+Senht95K6VvMO/dWIe
         bWVnnimqAZF0XI2MnkWDhh/bMzLj8x8LSHpn20UaNd58D3gOcFqOzSRkz/IfPdtfh8LY
         4uW9FjArlyrOSOW5J1L4hJG7jACzqgjsdn6DN9XMS+ctZv7UZxBBMoFfysEgKddcNyoe
         lFnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984176; x=1792588976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sx62d86u+TFaCg/f+CExTaHz5XyZuk82UhxVFxnoojA=;
        b=J61v5ypskIS88w0cB4ewIfhQRL90OmfqKQ4h4DvaLaYK8JDgi/I2c3uInGEcgeRxuK
         Ysd+KkoAQbeXeIB5GX6rk7pNQ3+ibVf+jY5zDVRnwnta+FrdZseCAykos19ieLtKmqsZ
         gHTyUhVcMR63qZk97wzBCxftedd4nUNZSQrashIQM44S6dkg8n+F79IQ0VLOZDWK+cWH
         /gb+Fb4I7jwHN1gwRjw28DPuVGBjjt64g8p/riQWr+30iEwhCeInwZZ6Ioc3uaLcY+P3
         Wc4s8QA4GLJ1ogiTNrdRw0vs8Di2kfBqqsp9Lt4fLorh1nCwOtLCOqkp7XeQim3QtYvo
         677g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984176; x=1792588976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx62d86u+TFaCg/f+CExTaHz5XyZuk82UhxVFxnoojA=;
        b=Fudq/yx2/zyqjnYRbH53+ZSkTMXtjf21QWVTLF+yPlizzLmV4U7xmaUpEqTlDuJJi3
         TamS4AxzsKJ2V+7wAUMp/TKZRfeguddMW6xeVnW2kauxPO43Z7U/1mAAlOZQ+2Mtuip4
         Hc8oeK4yQo/E0bYo2YSOUsupmO57ZURQJF8ex4JjhrpA2bZ/Xf+5E1/TQlems1dAAS0S
         CZTfYz1Q5V0nVl1HHXlKU9m0O4/1DVz+aC6s4KVCmuDQarP8YHrtavgpgTU369xzHp/1
         tgcx2bRBoMb0jOgWMQFgfdTPCDFkmX9+H7fWOFMMxP1+3UbUPuxbmGK1CcgE9vxXEVyy
         Wg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRiQZ03XkxKWyw08iN1sexVDTApSJaZyGiKcRj0lQkih+M0cSHXJb3KC3WFcAnIz4i3WQ6xlEK5FV3cj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgUu8mZ9eQTrODA5tZKKETgQgzhB6wPhUf6jX58BdgB852xg6C
	tiRthvnQid2OKSoniabbsYZXfTtaGNBAET8b118WmVmZFl9CpitAaAqaNI47PenN83LAnXWnE56
	kJYlxaWfSqSHjx3UMD/pcW8DeK75gRIkwfWMluVsONEwX
X-Gm-Gg: AYBFou0Q2ls/SKDuqCYPcBY273SBI0d8FU0V4M9zsz8An0RiKnaAqJEIk/elf1zApo6
	ielvnOK85opsJS97h3uloJwyzQZ46bzJV5K+BeATOczLfYbpuRYFthTN5y7iS5jaEhVrQf3tKhi
	BdcaU0h3AFbUe8QvHS68KC4U3yD3D8lXNe60/y+O1lyHm7aeJe0fjRnsXE03A/ay1Hj+HV3P8Nk
	kb/xNHyvVyVTX4ad4UvMTU/Ajpe1qJmLkZ7mQsdAbMivFY0f6ZapNXDSczqi2qpjuwkpEgGcqfA
	59nlbDaOpwabgdlOzzZuXLvxqnY0zDsawvSYQtSRJB6yQLLZCIqBqfrE2JBx6vPe8i+jecimrd2
	Sn4J2250/wFv9Dxahcv0M+03o57Tle4P7By1mhOGffxAA77oIP1s3fncRdBR/kgOAxUyqRds=
X-Received: by 2002:a05:6512:6c8:b0:5b8:edc5:c9f4 with SMTP id
 2adb3069b0e04-5bcde6b4009mr5690761e87.13.1791984176053; Wed, 14 Oct 2026
 06:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-xsk-suspend-teardown-v3-1-2d6be7602947@gmail.com>
In-Reply-To: <20261013-xsk-suspend-teardown-v3-1-2d6be7602947@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 14 Oct 2026 21:22:17 +0800
X-Gm-Features: AclHuK_CZ8InuoWyy3gcmsKZkLS2hm7xv53f53O43urLI2AeK5PGKE-WHdvjfa8
Message-ID: <CAL+tcoCsz08UKVci6y0BDsEbfhsEzn_F_C63pwSNh8GwswHA1A@mail.gmail.com>
Subject: Re: [PATCH net v3] xsk: freeze deferred pool teardown without
 blocking unregister
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:38=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Deferred pool destruction calls ndo_bpf() under RTNL. system_wq is
> not frozen during system sleep, so that callback can run after a
> device has suspended and gated its clocks. Use system_freezable_wq
> so running destruction finishes before device suspend and new work
> waits until process thaw.
>
> Keep assigned pools visible to NETDEV_UNREGISTER independently of
> the socket list. A released socket has already left that list, but
> its final pool put can queue destruction after workqueues freeze.
> A resume-time unregister would then wait for a device reference
> whose release cannot run until the resume completes.
>
> Track assigned pools per netdev with netdev operations locking and detach
> remaining pools after the notifier socket walk, including copy-mode pools=
.
> This also covers leased queues without scanning pools from unrelated
> devices or network namespaces. Remove the entry on assignment failure and
> normal teardown. The deferred worker still owns the pool and later observ=
es
> the cleared device pointer, avoiding a second driver detach or put.
>
> The lifetime problem was identified by code inspection of the deferred
> release and system-sleep paths.
>
> Fixes: 1c1efc2af158 ("xsk: Create and free buffer pool independently from=
 umem")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Admittedly it's a bit hard to review the complex logic. Thanks for the work=
!

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
