Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956100;
	b=WLOVDNNiK93degg4pvAKh40hy3XtdR0cZ1yOZSH0nP+c6whQJK2cnSUzA7ocj/6hs8Gp
	 1uJpbTYI50M/SIc/Ged4VdDpla6AMfgT70OY7CJ7zLDkT6Hzgsdsjm21/GII8cyDXgY5Y
	 y0Q1N01DWsGh1Ooi4CLzA9jaueNySrXLMREPXB9KlNj1XroP4jsRbR/uUSkSVgcBk24eg
	 J16yqrp7jP4ohpPRK02paXnMFmZg6wZU6MKmprUptiK1aiRqbfZZzHGOtJOZSXDVqcVFS
	 J3vO/mTsvf5m1OL2olm4SNEAzZ7gZNXg5EogWzDAkzdrcqti0HjheJ31yu2e5fbziZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
	b=3WVetafJ28uxvadpzDOq6i97C/pg9vegf2YvOfo8OFe8XIYPSBp0yRx1FvRbT4GiRY/U
	 +elX11YI8L4+aj1Ijcj5m4UZ1dk6J5NVIrF/TKLFCsi8Np4UMttUJtF+V1O95k7Bp/qH8
	 FZaRZJGBou9rzudwW5jceY+UAuiBJjcjFFp5J+SjWbae172ztvIzXMWYOL8NuHaVTlQIu
	 zQpr0bg4IB0ucrcsv8/jhDUVmouKcgy6jdrd7Qy85jmv/isQQXymMBzmLy2ZO2K749GuO
	 HYn59fS4CpGzUs3DZCnF8WDkhKAuln1KwL6Pumugbvq4mdMBIH2vXiKi1VZpHQyPw1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E0960A2608
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E0960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M3KUq8wh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so5640968eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792956099; cv=none;
        d=google.com; s=arc-20260327;
        b=QqMNnYoQ/V0oeQvyYbh26TEMlGFVDm94jYNImbodTiAw/Vvxs0AQKwOjRzZ0PUvDbd
         7GxpLs2L2ChCeLDaVUH9DSS766+JnMUFSdwSvkwM4K3Seo/wNmF29Rq0f/naaaZkhINq
         FkQay3Lfpd0Xn4J6czKVOsIpy+YPaiw9HXMRnLXVtFa2iff0KSaEk2bNsBGYGBt+WMtp
         aWzVdb2GwEhSN9ldIJRQKaQlILyw1AC35j36ofK4wDDqgepKDNuseH+jbK8L2ViWoa7E
         wBHzEFJ+NEwS0aCVLmh0KuNsFjSKW2IVNnzjl1BlblrjJDU++1X9Rmq2ksvKc/i5Y8aC
         4dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        fh=3qtdBJDjM+DmFYodGF2GTAtJmZZuSMdmB1ImsdiW2cU=;
        b=A94BolJ1WD8ARxzbQBzdHpUG2LTWS3zlG0sc/OAs90VYPOxhRpid0XO3VcM8EdjumT
         pPRkNbo9PBUswosyzvIGyelTf+eOWDuM7Jk7+8k+Ql1ajG55xED7BUQdxdEbY3pUQ2kz
         CFTC5Vtf5e8HuXOAgyF7oSWx+M0b9dKxuavlWgvcvVuBqoodycO2CjQ3JwYawYbfM8R8
         PiH4ssu7/mgmHSn9kPl+P0FEwnG3m15+90Br0l8mnUjpvSU7u2vPfMnBwPvsAx6EWAp+
         ijwaj2WLViNBj4G3A3ahRJ8Lzwsw33m36iI/GBFRYGv7ojxVn/cflF8OsWyVXw3jyzkS
         uu8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956099; x=1793560899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=M3KUq8whaTsLJ6plVgkBsYp7Udx+ghUM+jFVw6R5idi4BXD5awRFMvFS+EglrAC6Jz
         559v5cbuPq/LvGTLvAo9XzWo4w16yiYx8BS/OU8BwS5LJ7U1spf8EP3frSZaB8JLLUpb
         z+n/YLecOuCouGUToF4uSikzuQAKwJeNb7UpGhtwNBfpt2mwbj83uNgF5w6qL64LNS2j
         xYCC+OneYqgSmBqSx1QEUyFHHUw0g4iikHrQBKZsf0UGY/oxH4hkzLTmJ+agS0oKxTEV
         r7oB15D/4w4DILHo1m6pFZJDudN0kq5mKOvy97I0Ta2Z+IY/QaoxpD4acg1Ms5PGlruI
         VWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956099; x=1793560899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH1v0lTH3i5PVrd8YAnHucUCqAE9dOjJzTTBfZTDUMo=;
        b=tpGmRup8FfTFuHiJ2Ew6KwprfqyUUf2yOF1ZrRSN3t13xKBC5JPLaNGiV9WGlsW4xo
         NbCL5M+QEMXaZGOzDHszC53IIoZtLv9iDCbNu6BQSIWKo67Q8MZM5Yw+EstAaAsn3QYP
         2F1zLN+r+AAMJaNThTuPwoomMo6u9Xg4jCLFPEHb+xezzW4Fbouz79xVwMh/dRJAhjkC
         N33t36vTTE046cA0YN208mp7cjV6pwMez+Y/b7BRK9+zgNWmNEXajxakMQx5BFLd0pOi
         EvuhhkTN7c3Jzi71KaFfSNgTVGCTaQKoQQuS0fH3JnROL4i95ayc2nycy0Ma5RBxCKRp
         j2dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzte4ZPXou21xkG7qHhpqicu4NCn2Ru0k4C+DvbkPIiYNCvKtJNWfn8q3UOIZYk7FjCbXbQENvyuXVHC7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi+rmig/XDEkkf8N1XLuTYp5AsnQe9D6NX3j9rlixs+13S8eOC
	kol8584sP/piXXP2Kbbfw6RmQ6woINmCOEqn5d7TqAB6uiJ7tb8KSmBSfxasEpklcUUDC149ZfB
	nEZPQfFnHdyE8h26/aV4tqU4EcBidBIs=
X-Gm-Gg: AYBFou2IMwxlsocQTWhTgGinoNTO/chOhMKkczsVpMU3TBmxuXfpMVNI/RG79GCYQYt
	ia8DqHc8GfZvlMGO+5u3X9RqkoSU7/1ojyUA4afUmFlW5vwQ6hNeSSEYdXWD2zf7bmNlS0tTNfI
	B5T7k5MHgUJ4t+T+rUuGRRv05bvvtghHiQffFjkbS2S9nItAPbTZzJ9jn1z8GkXqAusgs1qd8bV
	IUjh2OLnLhqum5iOL3k42jSLmXuWViL9q2u5nVITfLxrrT2cYSHo8cGZQlb9Qo41lm8meHkNiFU
	5dt6Ake+fesnj7ocZYimGtAGFSfyZVdItFsOdf9UHRG8P2Er44BHwZmTnrsg8LAC3wNmpXkhrC0
	mF8GRhWX5q62gCfAoDspVLEuq6hmz4aeoP9ujsKlF1rUiKptrixpfvpKxRgDVlWdo0E01e0TYQh
	UJ7uHFOmE/6F4r3Jc=
X-Received: by 2002:a05:7300:84:b0:35d:eb9c:fce with SMTP id
 5a478bee46e88-369e84afdb2mr8666043eec.25.1792956098996; Sun, 25 Oct 2026
 12:21:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
 <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
In-Reply-To: <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 21:21:27 +0200
X-Gm-Features: AclHuK-Zu-La3MBSX4NrGbqHTCl63lbPGopl2QWUuujCrh98e0xucb-_xaWX1wM
Message-ID: <CAPVz0n2QpNfTfubqvZ2i9B_Z_gug4oKSmD0YMJ7Riymdh+guYg@mail.gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Patrick Fischer <admin@tsv-stahl-riesa.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:5=
7 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> > Register the gate with pll_p_out3 as its parent. Also drop
> > CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> > 72 MHz so we shouldn't change the rate.
>
> I ran into the same problem on a Tegra Note 7 (P1640) and ended up with
> the identical change. Before it, every DSI enable logged
>
>   tegra-dsi 54300000.dsi: MIPI calibration failed: -110
>
> and enabling PLL_P_OUT3 by hand made it go away. With this patch there
> is no timeout at boot or across DPMS off/on cycles.
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> While testing I also found that tegra114_mipi_power_down() never drops
> the clock enable it takes, so with this patch PLL_P_OUT3 stays on after
> the first DPMS off. I sent a fix for that:
>
> https://lore.kernel.org/all/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e7=
55b4cb@tsv-stahl-riesa.de/
>
> Thanks,
> Patrick

Thank you for cc-ing me Patrick.

Hello Mikko!
I have observed calibration fail on my Tegra114 devices and your patch
fixes it. Thank you!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
