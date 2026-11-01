Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793512133;
	b=5Err8PwS8cOMxs7PheL7hDM910+fC0pDdowQh9Zj7LWgfsvVQQc9VMAbGcYWe4uZeDMT
	 Y/1vm+eRj/S/DUJImXd1OorKRQge0JwAyIDV8CqqmAx6ARvpvFDsTwpxmddAJK0UHQU6P
	 SAJ3MDzI1jTsDYz+p4Lgu43HL7lCmzr3eFzux87F9J/RboGXyREYXsXYtR+eQq1ynnhlF
	 ZYb1SIxIQLrD0kqLrqsmNXwbdO1D21VLMTPrgQBpI2eiGQ1XtzQEMMnIstZ/uETR4zMqS
	 5BWgj7t0RN+m0NgRt/8gPR7nM6NG3BtHtakzIUgT/4g6/n2zJZxBBsoxO7lAtEpkQQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EGfxVHVkcrYrQKGYWR3trZufepOrJ+7eV2izdTVo0N0=;
	b=ccRwJVC1/V13nh8Oxtw20TU0pRnr2pY/MQYqC4AkLAtuzZKADEqPCbihO0mtyx5xDQcz
	 TbuI2lc9Kp5Po2s0NbpfD9DgHNfO8rJXBWCBowzdZAsGkzBolh3RHTodF2z/7GAeM+s0C
	 5s4ANbxceU8ZCDi0l5VtT89BwFRx3NVAbAYV5f6RrPZuxJs4/XKiz+GLDWLP2cJKoKT3S
	 wvzPbenwiB1Eb5jHcBMg+nT+VjVuBcPhrh5CVumCjBa5vhdUp2RPFIp0sbA9SxmiXJoC3
	 iqtzor61Lc2HFaFVDwkis4BZJpiqZnrUfQWKYhwnP74RaI4MSUPBriFO7wtMbBXJ6ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weyO2K2Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9BA606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 05:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weyO2K2Z
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfa686881fso1604755e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793512131; cv=none;
        d=google.com; s=arc-20260327;
        b=TK0kD4DdO79nvYYtd8ptD5+Dxo5EBpXDXCyxbfiV11v6BxZkqAo6++jZIN9WKZLFdP
         MhMtdZcgO4Hmhb/9hYhnyPZI6vg5IA4SCqVTRP5FV1xervQEJKHh1fnqHUe/KpT8mriA
         ZLfdKd/9LceBIbbKZxkLfafXt5AKm2rGqJU8VGrAgNbM0f2M0XvpRJtyfYD9saBbsrJ0
         zQNH/sm6dcNTdqcVp/8wyVTNvEzW5fZ0N6XZHIYstri4viZlP9DhNJKHgH5BOc5ueKVb
         GZJZYaX4xEQOK1nNAs4sjsrSUUhNWwcvEFE3aeLM+YpqoW8cPsBhi28cHk0wJYr8ze3R
         98Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EGfxVHVkcrYrQKGYWR3trZufepOrJ+7eV2izdTVo0N0=;
        fh=zZRutXZUI1ZS/FiSSoaGWX9Hw2hgjqs1Njqmir7+RPU=;
        b=jawQ0DPz6chNJSflOqt909ioiyPFwcQ80X0G+raKl35HYsWQvsA83/T4+DDUQ9bRUL
         bIa7TY7bAsiw+lTo0CFTrUi8AoWflvIAUQ95jcXnoG6he1ZKlyG/j27tAAkjQeLXq22q
         iEaVhGIks67kxoaxYK8CWXYZb5U52d8x2jcvG8LyAdSpD2jHe90FAKt13jokilbP16cE
         DF/BelnuIpbVeafjcj6jetUBxaJAJmZ7K9G2E7i2L2qi6Jew+pTBK6bZ6P5yihL0JOmz
         xfqpLHRGiPjfjF0yGvcnGoURKeERQ7Ck8QtMMOBAhplWb3pT76ccjXanJO7mn6rtEdII
         wMRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793512131; x=1794116931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGfxVHVkcrYrQKGYWR3trZufepOrJ+7eV2izdTVo0N0=;
        b=weyO2K2Z3b0LzD/hEyODcUaTMjso5EY+pHzgpgsO36+Go7wri9KGFzwbOpt11QlPm2
         hM6VRrvJCFcWqLlRbdvtdLrcIYxwb1is/W2btLLeBpycRVMvHNZbAnya2ep3XFu7aQHp
         tr2F1uocntttl9YlKlF6ntEWPU/tKGg+OIUkiDbF+AutxMPipzwlq+Ki0KkZRJU0bWo5
         yal59Z9UAq/4hrOU00lGv0fUtxZ3/op2fEx+6Vk9zJlgyxOAYmvwVQGH+7vACMaGArG7
         4TVwXsSvd9lVy+56qYxm0lfSpTgf9Qllc7GxU4poZR+lZM95d7xWc4aNnJqwwVpoJqMk
         QpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793512131; x=1794116931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGfxVHVkcrYrQKGYWR3trZufepOrJ+7eV2izdTVo0N0=;
        b=wXpHCv8ND7rEPdUowv4F9WiDiQDbLgqqxds/9k2FtCE+rmra0x2CFu7qNzYOa2PSad
         9jQHkylQ+gnLzxIA+5Gs1MMkU7jnfM3cBqlMPWE1FsOM+LCQoLV+nhGN+Wzuw9k3sWxM
         BqYRVVc66Xr+r+zF26+a0wUPswwpFjA+T35/jiq/d/1+Ez/2XijvbXGb7MCh9+4cJAh8
         XiBBMNUT0+p8DF3ZqVKp675eOgN/47+suGh5zcKjFvJSgG6jVva7KoJeFZiSFaox+Mp3
         qNTRs6rMd9hhxDYfuXU8zqsYz4d9z2vXsdfte2u9NWXEO1kS4BT6AXGRcChDFK4GbYkh
         bPAw==
X-Forwarded-Encrypted: i=1; AKwUvBxHyjMLWDPmuu4Z0CoBoV17/XqTd3wSp+20C2tVxmij9kMquLV5MUikouG5yo0q3kkNPHrxptods4eckuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gD0nLUBb5zNNXXnwTITmnnrfvpTtOBRWjon5PtctKA9DjTMv
	pGPWocWIzFnJc54x7AbMxHmyGopQkGRBEQEMyHzfmrNMT9kyztHm9XWbjQ2pW7+frFch6nIBEzx
	m7QJ6Hux22L6W7hA/sSmyNqM6tOzJs88=
X-Gm-Gg: AYBFou3hJNTr2G+9T3V7oCVrplVnJZPWDqANGgm8gBm3f+aBY42tFH2j+VVdp5boe9w
	XzB3O8jdZFdiqwb4Mif864qgwYmOE0WTXBMZ+VHojAKynYRtBUP75VcJRLqgfEI6wS1Gc5SEuBV
	lblwdW36S11RGmI+d31fDuXLns8USaWD2bQlfKnQB9Xppal8qrCbjtzWhbPHSQoGFprobWWGEQZ
	i6tFb4mlTxwtBTBwaFFUUKbAzErfbkwFlSLSu0vtxzQ9CRO/y64QOEv/EMyhM4zVfo6uEDQRuRG
	usC0uYupXLy8bhQRdGPtJ6zB9W0A6XaTKJb6BHeW5y5/py1q8N53VEVwI4uSTQaDWv0oa3Y5rFv
	ZvOxgvyb/0UNM0SzwEIy+Il/ZaCDSfAjmlDWGxHEoo14ZBqspQZtH87N2RbEWtL4etQWe5eS/wx
	vaWHluOErD9lTO91+Tjk0dsebzFQzeQ7GXcVIaLkdd27QeHqY9cQs=
X-Received: by 2002:a05:6512:1252:b0:5bf:d938:b808 with SMTP id
 2adb3069b0e04-5bfd954bb21mr2075584e87.1.1793512130701; Sat, 31 Oct 2026
 22:48:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031133455.3070233-2-rsalvaterra@gmail.com>
In-Reply-To: <20261031133455.3070233-2-rsalvaterra@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 1 Nov 2026 13:48:13 +0800
X-Gm-Features: AclHuK9Oijgn2EhPzsnGywVMmHQSWFg3blfXJ7nFJaMnQXGzRvyU2SOiQm3Go7g
Message-ID: <CAL+tcoB6vg+-w1JZdND_cTN_zPeh76_+-W_NU34jkunJUFwrrA@mail.gmail.com>
Subject: Re: [PATCH] tg3: make depend on ZONE_DMA
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 9:36=E2=80=AFPM Rui Salvaterra <rsalvaterra@gmail.c=
om> wrote:
>
> Since 614f4d166eee, on systems with ZONE_DMA unavailable, the Tigon3 driv=
er
> fails to initialize, at least on systems with BCM57766 controllers. On a =
late
> 2012 Mac Mini:
>
> [    1.226623] tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consiste=
nt allocations
> [    1.226718] tg3 0000:01:00.0: probe with driver tg3 failed with error =
-5
>
> Fixes: 614f4d166eee "tg3: Set coherent DMA mask bits to 31 for BCM57766 c=
hipsets"

The format is not right. And please target net branch if it's a fix by
changing your title to ']PATCH net]'.

>
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>
> ---
>  drivers/net/ethernet/broadcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet=
/broadcom/Kconfig
> index f0bac0dd1439..c9875daa043b 100644
> --- a/drivers/net/ethernet/broadcom/Kconfig
> +++ b/drivers/net/ethernet/broadcom/Kconfig
> @@ -124,6 +124,7 @@ config TIGON3
>         tristate "Broadcom Tigon3 support"
>         depends on PCI
>         depends on PTP_1588_CLOCK_OPTIONAL
> +       depends on ZONE_DMA

Did you verify it possibly affects those kernels without DMA config?

The blamed patch seems correct, so I think you need to root cause it
instead of adding a global dependency here.

Thanks,
Jason

>         select CRC32
>         select PHYLIB
>         help
> --
> 2.55.0
>
>
