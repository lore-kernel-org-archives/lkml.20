Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794253567;
	b=YIJ5t4GtMNQHulTSfDTPJgFPouDqZF6+0TdJMaawnakXvKWoH3uwccP4ux9RjKnnQ4W+
	 qVHOYf8c0IZp6+88W8sAnmslSYWhG1COjG85b0hSqq6oFOdvKzd9B/AXaRQfOW19p1Dhd
	 w/VhG9/7nKfex0zKnj+9rmoepgJ3KqD07FDNX4vHTcmFRX5Lq+mp6zVCZ0DRPIpyLFp1Q
	 ewUfzpp0o6z3yIzZadaoJ3+t8cS8BT1SwRhmspDf24IdSLrRy4b3E3NKF7je2b6zBjVlX
	 7LSphCJMsP7FN7slD9aKYQiCrh4y8C9bAgS1ru/Ajym9y28OE2cHrAV5unajeBSzLzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iOArzfF7wNe46tx1BE66G31FeLK1fkOr8F1BKZ5Pz78=;
	b=O9ZJSBa2vo030HPC8Hm9n7b0eBMucnRIj1m9dLlc8Of5g7FPeFSESa1K2LWxELeNgU7Q
	 e1F/9LO1V/NXe2Cz4qw29sg9fJPSMAwKynBE2Uy7pw5F2KOCuumDBGrcKiTWbk4XulAZP
	 2UAVh4wIRD46GObm84IQVWBK/akHUUhfpPCOkDhBKmBrNONjkHXCKFpICWK2ezlRP/WsK
	 g86C2t2+xyIxOXnfsplM8Bs5UFOFqHZIRL+WA0Jir5aKJeeVrk0KLWj3a0KFat6mGlla7
	 Dvf1Fv2tE7PXXkx7I87O1tH/o6BNz7D7v6WzyEWATLjf5mVBiuSKH4KHnGBruJWWUAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CFs9I3JG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA4606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EA4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CFs9I3JG
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso219935566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794253565; cv=none;
        d=google.com; s=arc-20260327;
        b=MEfKCUK1rqikcX1wRVJxsheNklWHO2S2mZiONIOQblYWM0ZsSrZLWsuUBQFp7EHPJS
         fiKZD2BLB/CQzZW6SnuUDhvK6kxzRSh0CKTiSEcwhLzXiudfKK0wGcOd3qMBC6uX4I5U
         NVnY0WYsq0eVSmhOpkbdTpIsxCdnrq19ZYO4BAaWRHzaLNCA4Arqylzq9OKpdpIMeFKp
         cWHIWuzUoTH9B1E8A7F0l3ut5tcuEGuW20G0uxGHbPx/MwyWRruJLfbQGLH+Q1HNXzXR
         Jej37BlTqr51zq6RaO/3kljAJtCiTywnldUrVgag+dVb4AHi9ghtDplU/FD59HPfldnS
         /97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iOArzfF7wNe46tx1BE66G31FeLK1fkOr8F1BKZ5Pz78=;
        fh=vrJGxB3GuQ9hDsQWcRf4nOb7OTNpp3nXNhuMIsp3htU=;
        b=jkJcjfsGtYaqPq8uV7YBZMINaj5x/AG4v/zztnSzfRZpqfbY7yofTibnOEG+SHfPA4
         dDkhEubHuLLuJPeZRht7Xv05HEnHhdayotehN/G7a1sXpS0gcVti7ALS6hSjnoO/5SPd
         P5jNW3JK+GBpQJCK2AH5PLgRHR0RudqSU+Wv4qRdD+wixyuPP4UCgL4mWolmi4BAnXlg
         ga7eKZx1uxFWSvqSJeLmbF9t9jwJa2Vpc6Yo55W+GDVt5MZU6QFwPbvAtemFYRyux6QK
         ++ZozzG2zCWjM67qb93pS7zOh9qxwzJn0CZY6rwnv9wricCd8jj3wmF0OvFWD8cWe/D1
         vacw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794253565; x=1794858365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOArzfF7wNe46tx1BE66G31FeLK1fkOr8F1BKZ5Pz78=;
        b=CFs9I3JG7+t7GGIVBu2Gb3gYCZIqnIG9eIDR2W7bngmQAFRocBnKTBOHbb1QZFtH3H
         KnaZMjrJCVtJgjAiGJtT5CxuRQ3n5NATFrwD4AZnQOrAlE0dGilWEWtA99YE5o1I5I+Q
         7NNp7qnK2lsNWaZzoeq7JlZ30te310/Gs5TAO2pBIQDHvGHdOX0a4krsIUuEE3UZGwrw
         5+mlYcO2grgYce/D+KUa4SKhSg4kZ9/sZBtWpFIbRNJDbYbQQNCkfTtYh4enmI/Y3GoL
         QugDVwQmP+lnNOQmCqn1sDTbTB8fS+qSgJHaNXBWN/rDIwWz7tohO8+2797TmGjvEHHK
         fNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253565; x=1794858365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOArzfF7wNe46tx1BE66G31FeLK1fkOr8F1BKZ5Pz78=;
        b=OxUorm8QHKwXwYU8kze9w89Bon4+cGGnJEhKq+aZevjlRMCrZ9lLwWOWyEIFYnxifc
         q4s7Un3QxnLgQMSLAfEYtP/uZKpl0riE06+UHExTMjm1fHgj5Tn4Wdb2FMCDA6PX9LDb
         Pm05wnF+hpkgvPxTgMOYrSGyNnPnZY+Lgvt81ZLZWcYhi7OeOj76aYnDC0z3/pZ8esGT
         ejkAqgH84tX7gaHhzn/0loVWEfShkR43tRhI8d+wyVA6pktXigu3Zw9YhZWVsa8a/omy
         XSAEsVB1ENNrJuF55hsSD2i1nBo4bHYc7l2fPdPxjPHdGlMEGOzDExaLyZltVeptvIIv
         a7fg==
X-Forwarded-Encrypted: i=1; AL+hErEZELdwnxO0Lks2bg45+50H2CtyvwrR1G/n/TLw+CpUTWNCVJsnQCcFpKwIYsFKeucQAgVmLAgGOyWuHls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GZv/PwAn4xT0o991v8w02oWV0Y5vkNiZWs9l6RHfkcKgmJEgK
	H9YqNyevJVep+GtKYITGsvGBbqp8e0MgqjG8VQIxvgO4n/EUiOY3t0O1L8jB5aYhG/0NQ5HnymP
	aHIdMK4/WBxcCqIwavtkrwsQS+N+PLAarHtMKgLRe
X-Gm-Gg: AYBFou3cDP7M/RFki0mLuTuIEgpMy+sysYdPS88BymHxZ3RDiooZpdIo0rekDx/+y1X
	VpDmZhZEIHIkvL+njYV27xBifP1MuI9M3ZHNdKQKXVj+8MzSGmeKXTFveiz+mu3o3bBZJ17ikCc
	zfHljez9XkHVd2/dCOmDyQRWbwpx76Dcql/86D5L8udWxO9Pcvsz1Roj0PyZ5ffHPBSUw6dgpjM
	TJs9DMR7CQH6QMq8oe/SxKPX2ufhiDR8gM4PtLwiA/wsNeKWJzG6jCl/Mvqumjb3qol1QKuQ/I2
	1kUxNeVdpu7EXZ86nCXLhNyohp2HK1sVRHiNMEcEGhFeVpVM9QLUozK0XlIc4HjRJV2a0/bd8R8
	ejl4ZJvSv0N7isEKtAiI+CK5XGJQDSHdoNSK47ecbKXRBR1lPVdcF+381YO1Mhm4bpKE=
X-Received: by 2002:a17:907:3e20:b0:c41:64c1:cc2d with SMTP id
 a640c23a62f3a-c50491bd62emr32238066b.2.1794253565000; Mon, 09 Nov 2026
 11:46:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109100437.331423-1-amaan.cheval@gmail.com> <20261109100437.331423-2-amaan.cheval@gmail.com>
In-Reply-To: <20261109100437.331423-2-amaan.cheval@gmail.com>
From: Joshua Washington <joshwash@google.com>
Date: Mon, 9 Nov 2026 11:45:53 -0800
X-Gm-Features: AclHuK-f_6xX0FRybZe2n9V_Z8dkntQqvMXacQrG_VwUeSpjRAkA9EO6aNAi2BM
Message-ID: <CALuQH+Uee+=2NyhCXVmmESwXxSqDYKY3Foj70KM2qY6g5UsOXw@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] gve: refuse XDP on queue formats without XDP support
To: Amaan Cheval <amaan.cheval@gmail.com>
Cc: netdev@vger.kernel.org, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	maciej.fijalkowski@intel.com, pkaligineedi@google.com, maolson@google.com, 
	csully@google.com, willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:05=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.com=
> wrote:
>
> Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
> RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
> verify_xdp_configuration(), which until then refused every format but
> GQI-QPL. Nothing replaced it: gve_set_netdev_xdp_features() advertises
> no XDP features for DQO-QPL and gve_xdp_xmit() rejects it, but the core
> only checks that ndo_bpf exists, so a native XDP program, and an AF_XDP
> socket on top of it, can still be attached on a queue format the driver
> does not support.
>
> The DQO-QPL RX path was never written for that. Its page accounting
> assumes the driver keeps a reference of its own across every handoff:
> gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
> recycles it with gve_reuse_buffer(), so a redirect target that releases
> the buffer synchronously, such as an AF_XDP socket in copy mode, can
> drop the page's last reference when pagecnt_bias runs out. The page is
> then freed while it is still DMA-mapped and registered in the QPL, and
> the driver posts it back to the device.
>
> Refuse XDP setup in gve_verify_xdp_configuration() whenever the driver
> advertises no XDP features for the current queue format, which today
> means DQO-QPL. A zero-copy XSK pool bind is already refused by the core
> for the same reason, and a copy-mode bind never reaches the driver and
> is harmless without a program.
>
> Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ RDA=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
Reviewed-by: Joshua Washington <joshwash@google.com>

> ---
> v5:
>  - Check dev->xdp_features instead of queue_format, and reword the
>    subject and message around that (Joshua).
> v4: https://lore.kernel.org/netdev/20261106114551.212675-2-amaan.cheval@g=
mail.com/
>
>  drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index 2437cd8ba633..fe560f5c5408 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct net=
_device *dev,
>         struct gve_priv *priv =3D netdev_priv(dev);
>         u16 max_xdp_mtu;
>
> +       if (!(dev->xdp_features & NETDEV_XDP_ACT_BASIC)) {
> +               NL_SET_ERR_MSG_MOD(extack,
> +                                  "XDP is not supported on this queue fo=
rmat.");
> +               return -EOPNOTSUPP;
> +       }
> +
>         if (dev->features & NETIF_F_GRO_HW) {
>                 NL_SET_ERR_MSG_MOD(extack,
>                                    "XDP is not supported when HW-GRO is o=
n.");
> --
> 2.47.3
>

Thanks!
