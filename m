Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164F476CFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760531; cv=pass; b=JqhGAhuRSUD28SLRGPc8UjnIPASGw4+WkerKaRgy9n5arPYOGiGYIHqlgW9XNR9bFj1rw/2/6EmZGTknIJwElopV1pVbrcKKW2zyp/jfZo4+skqSQ6tre2JhfoRV1s617/jSMVrAjezWcVgearrCd74/l/Ay7u45+RGrDkBaM6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760531; c=relaxed/simple;
	bh=T76WpZqN4/IbfvVy7lfZnov8gBZtsqtmd5Xf4GGb2zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT+au0WJ8vTVm2To2D2OcGOkGrIxgON0kTB//bmWXgTWn3JiFTfTgULsca2YyRAbDRjFPQuCa9wI6NZldQeDCcTwlgihVlZXQoOaYs3zPGd6JqpteAYMnPuKeEfi0Z1zg4gcRFIHLy7Dr25G3UWaOSfl1MrtmDzwZOxb2Aj2u8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csPXx9PI; arc=pass smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csPXx9PI"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-53331a61f71so42860881cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760529; cv=none;
        d=google.com; s=arc-20260327;
        b=GylJvtJ5L9opiCOFaskSIjOeIcLo/aCYdTliYK4fvM3EBZye/aFwUdhsMpQFnSLNqx
         t0aBWyoWpgzIt3Eg/oR9B5ZdEwN25uIypJx96GnUSjNgp5OZFDz0t4MxXwUl5bfXKfI5
         E32k6dHnVxPMUcWZmUN3Vd3r/+7MxnQfevRX/gEIL8bLcVX3lJ2mzsNqdUuLcAmmTe3Q
         7YQ02kEnYDpdkGAbFwc0KwTt5gmt6plkiqvbgJdpxLEWTucNUjjNSnCthwooWLbAQzHQ
         6ga9MNZK/CFMBy7YGIxlj98CZmca+hmXnRnBw/bKSFyiAOFIcpew11sAu7bBiyTeK+Yf
         0pAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3CrBLtpMFVR2oAWbasjUDCmVfxEQqEwO1Ii0xLBkEWM=;
        fh=tx9dogEwrZhGcNHSUfPBcbG1LRlNhnSUEZC1s1eO1Ro=;
        b=Rfhmm2NLOFWO44LtK7BL/Bq1wSHF1H4hJCmkdo2HHGV0oCmgjevLcwkAuCyzAxx1ie
         /dc5Jl22jBrIDm9R7CzC1uRDPajoSSVKBX7fmgc1+ZHg0Po+ZDxFrG8CAOL/3Zb8n+B9
         NskEA/SyNILiszz6FfrhBFpl1JAzbpu1u1K9B+ixlaNtWVv00lLYQ5/lYeUeQY+/eken
         Z99JG0SOZmoHtvEdhJSqRSODYPxxDiafR9k+P0RsJnCRh6e19bqQgaVZk+YNFAzgRwBF
         jrbZra5AJDdwWl5QP1oGmEcJ4uvf6FpbQ2Y5IyQlxDfgi8rHZ4uOlsbuFGc7yvb4K+6q
         Qc2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760529; x=1791365329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3CrBLtpMFVR2oAWbasjUDCmVfxEQqEwO1Ii0xLBkEWM=;
        b=csPXx9PI33IfZIyeegqy8FuLVXHHVF2+Q04RIhl9A/cX9W/A03lH++6mLJOFcFW0I7
         kzxYnbCdv0TqXsExV0SnnbR+bGeaPnVG9bQWKkBFNu+3RTWUXUu+tE+Zmxt54h5jM/Yo
         5Zl9Bn3YM43UBoOXe6vcHc64WGRWZhTvlq18caQYoRXWVngnDwM1sHUKgBSeSD1PdlBj
         IF+AN8jID/yvH/9WfZ0mhkvCtjyC7IC1IQGw79uFhXg+pHEPkvIdBzQAEQAhwbuQ5F/l
         QNYmDnx3v0N+QI1rieQ4GvBSz6rAHV3TMgP1uuGcjfSVUpvvT+SN4HvggPe7l9ECN2Fu
         OKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760529; x=1791365329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CrBLtpMFVR2oAWbasjUDCmVfxEQqEwO1Ii0xLBkEWM=;
        b=QvvUNU6sxDUl3GtZkX7JBewbnWc3aOXc9NYqvL3/LPLguEaZsTeeKXN3FRZhLOjmOz
         yIsjPZhWnDWn3S+yQCJrSJKZOtL5DioTdwgnHIMvuGBTl/UchTS6VFdWVLaiGCMCHAWA
         kXkzmPXqylCR66jcxGxwgaKQgNDzjX6aINApAZM6J97QMbb21BnFiwfeVLB5PL2xpnQf
         5b94WaXM06qNCwAfbBRYUUMNVmQHHl36l460Am0VyWIfvCneWSd0oMw8M0h3crpcL/Wf
         dp//njtwNEs0XdApjf3PYGfcZEuRHLxhyQtOlrbAU1D/E2gMx7qVvQLvOJVqviq0Z/Qa
         M4gw==
X-Forwarded-Encrypted: i=1; AKwUvBxuJGx+OIY8sAuaaz3XjvvIcPN1Uv++F1xORlKYCgR5MzwQQYwER9hfJgzfbNHXCsqKsh0+nV3gkosSJCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nnEItGAkhCRhmRBxWQUdSs+ObAhKoSCiEvvuWFf0yA+79P03Xb
	uNbAqbA+IdfGAnOg+HbAJEYFjjVIgypEQf4JJrlvQBDni0vtjIjRdOjNj147EJRkizkYAg6UceW
	zCkcbtXvVZ//AClWxi1pLwAbcvlyZPaM=
X-Gm-Gg: AYBFou0/pYGqQcNhA0XGEi9bVmsjHa4M0784x3R/VB0RjA9dDc8DGDk9Hxye7VUbWjy
	wMTc+zaJqNLFE3jql1zsB0tLq47002iAOsbst3uUTBGQB7wy/Bjc0Y2QAMcPa3QQz2xUQfeiDcj
	mrFzwZXdPmbvdb/hdDp2KyGtP+HKCOKOMGE4fFcuR/G6e2+Skr82Lc0s8CYZdE0rCZ8xfhd8cp6
	zERp9NpNEcxKujfNLlgo+VZ2xZhohlTQkoRpSevgDU7mjbgkAMsHoLU6Vr0MLFutlf6+pemhPW2
	t8BiYx/BaNlUsWwmSkB1XPohtoxWDptSluQsYJYa7FGrcR/CXTE0+6B1W/Gs/fXfWkQZw82CsU7
	qj9ru1TVuUetWSLG8qmb279eQp4Jdrt+45qmkW9V8fhFKo6TbNHpprQOn5QTiDMEnPlt9WBuiLJ
	D+CIj26u7gzyXB1WumlpEWDfpASJtw3CifoJDT9skyD951iXIiOb/zdUGNZFsSInijkUicZWQcV
	Qo2iNMt//yyaIZUfh4j5Zpz4XIBCJgPi9bjG8sbZw==
X-Received: by 2002:a05:620a:6606:b0:939:d459:4810 with SMTP id
 af79cd13be357-93ca96930bcmr109030985a.26.1790760528632; Wed, 30 Sep 2026
 02:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927051743.71460-1-jain.sm@gmail.com> <20260927051743.71460-2-jain.sm@gmail.com>
 <20260930084943.GB3401365@unreal>
In-Reply-To: <20260930084943.GB3401365@unreal>
From: shashank Jain <jain.sm@gmail.com>
Date: Wed, 30 Sep 2026 14:58:37 +0530
X-Gm-Features: AclHuK80YDh2K2zmzx7GH9vHBnXfwb5V53s7GWLI9C8EOorIStLoRwfAijUqhKo
Message-ID: <CA+FWx=k7LbhYcA7CMDcQ1Wq5ysjKqc1R=9HT=Q9Z0CQLVp6NUQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] lib/dim: fix 32-bit overflow in dim_calc_stats() rates
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Simon Horman <horms@kernel.org>, Tal Gilboa <talgi@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> How does this 32-bit overflow differ from the overflow that can also occu=
r on
> 64-bit systems in `nbytes * USEC_PER_MSEC`?

On 64-bit the multiplication itself cannot overflow. nbytes (like npkts
and ncomps) is a u32, and USEC_PER_MSEC is 1000L, so the product is
computed in a 64-bit long and is at most (2^32 - 1) * 1000, about
4.3 * 10^12 (42 bits). DIV_ROUND_UP() adds at most delta_us - 1 to that,
which also fits. So on 64-bit the product is always exact.

On 32-bit the same product is computed in a 32-bit long and wraps once
nbytes exceeds 4294967, i.e. about 4.3 MB in one DIM window. That is
reached at normal line rates, which is what the patch fixes. With the
u64 cast and DIV_ROUND_UP_ULL() the 32-bit results are the same as on
64-bit.

There are two other limits, but they apply to 32-bit and 64-bit alike
and the patch does not change them:

- The counters in struct dim_sample are u32 and BIT_GAP() takes the
  difference modulo 2^32, so a window that carries 4 GiB or more is
  already undercounted before the multiplication. With 64 events per
  window that needs a very long window at very high rates (for example
  about 86 ms at 400 Gbit/s).

- The rates are stored in int fields of struct dim_stats. bpms is bytes
  per millisecond, so it only exceeds INT_MAX above 2^31 bytes/ms,
  about 17 Tbit/s.

I can add a sentence to the changelog saying that the 64-bit product
cannot overflow, if you think that helps.

Thanks,
Shashank

On Wed, Sep 30, 2026 at 2:19=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sun, Sep 27, 2026 at 10:47:42AM +0530, Shashank Mohan Jain wrote:
> > dim_calc_stats() computes the per-millisecond rates as
> >
> >       DIV_ROUND_UP(nbytes * USEC_PER_MSEC, delta_us)
> >
> > where nbytes is a u32 and USEC_PER_MSEC is 1000L. On 64-bit the product
> > is done in 64-bit long arithmetic, but on 32-bit architectures long is
> > 32 bits wide and the product wraps as soon as a measurement window
> > carries more than 4294967 bytes (about 4.3 MB). The same applies to the
> > packet and completion counts, although those need more than 4.29
> > million packets or completions per window.
> >
> > A DIM window spans DIM_NEVENTS (64) events. Drivers count events per
> > interrupt or per NAPI poll, so under sustained load a window can easily
> > carry more than 4.3 MB: 64 full NAPI polls of 64 MTU-sized frames are
> > already 6.2 MB, and drivers such as mtk_eth_soc count one event per
> > interrupt while NAPI keeps polling with the interrupt masked. On 32-bit
> > users of the library (for example mtk_eth_soc on MT7621, bcmgenet and
> > bcmsysport on 32-bit ARM, or virtio_net in a 32-bit guest) bpms then
> > becomes the product modulo 2^32 divided by the window length, and
> > net_dim_stats_compare() makes its BETTER/WORSE decisions on a value
> > that has little to do with the real throughput.
> >
> > For example, a 1 Gbit/s link at line rate that moves 5 MB in a 40 ms
> > window gives bpms =3D 125000 on 64-bit but 17626 on 32-bit, and 5 milli=
on
> > packets in 2 s gives ppms =3D 353 instead of 2500.
> >
> > Widen the products to 64 bits and divide with DIV_ROUND_UP_ULL(). The
> > results are unchanged on 64-bit.
>
> How does this 32-bit overflow differ from the overflow that can also occu=
r on
> 64-bit systems in `nbytes * USEC_PER_MSEC`?
>
> Thanks
