Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891320;
	b=3kgqRjh20zgKB5Yh8MWSSSWUFKnZAs30M/vyGaHrihfFEQzVj28FPAniQZaMwJnSJb1N
	 XvH8QMGVvdFuAOP62NtxwOBm4Az4wjY9N4cLNuiGZilzkVHdzFYHUPnGi092lDUeYaCUd
	 HgPJ8DW3PJjAFhl7elaaCkpxnW7knM7iFsSlKfmRQrOjPqupQBy7ZI13e1M9DpgpMuuiB
	 zmQJCQgG+EGYHyO2kiTMjtAHzwjDZCU59+1sJ3aNQYmSHFMC5zOzvnVyY40VPeEYosV5+
	 pEnubP4eNiWNqCq2utJkJka8KYv2k98dH40Pk2F4K0p69NPUdrHKy415gPYSum512Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5UV/eD3mOSLOhUnYm+40VgpE/6LQSC239IiMgTRBykc=;
	b=RF8IcH19iZxGbABgcvhsoPK/9QzbsizIsTDLsJtBf9GVDQ11+VkhaWd9jMKbjKty4Ouk
	 VqNEZMgKMsRvBdcZxNVYkWZmjthlBDb+O1cAT+NKIZtGqz7TeGPGVByxOtDemjJqrJOFC
	 uWfb0chvOuaClBMBAnd0g0OJ+J3ek8fPc7o62948LQb5/lDznZSeumFxocROdTyS8Ylr6
	 XBCJ74jrcxnbPH4tbH5hH4C2S0ej09eZ6+znO0xwJpBoh0MzlJ1d51McqfVo5kYMnPVIF
	 j/dBSS5Nl07DrgMPUaOvrqI0c9eh1ZXRrFmPUYwJSNsGtGGVef/A0Ei7GahtY2bG3Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qq+EekGb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E78606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qq+EekGb
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso913116f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891318; cv=none;
        d=google.com; s=arc-20260327;
        b=oHPGauktRWzEdpOudQTbFUuMvLkZ+3mST7oeyPHc3W+VAEyuBbE8E9X+VEgyXUPIui
         jvaBt7YKqzilqzwypGLED2f2Mi1JvNK4JOJOOoh+YU9nxcGQA3z33NJexMW1HhfIKopp
         rcA9SlTOr/qbBO+yvbl3kmfEiaqsRIVWnq2jGHKhMhHKMWkY69dox2tf16L13/r20ZNJ
         k2+P1KA82uDQt25x7E8QMKFUvh6rgbxM/hbNHcwVF65b8eeMS46RnQlgEi9ECy75zOp3
         1OQRg57Zje4x1dniq7rAuJCVaEjIFSjcfeGOObjxn6223LeTf0gPttuIYOfaCkHfMQFX
         Bkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UV/eD3mOSLOhUnYm+40VgpE/6LQSC239IiMgTRBykc=;
        fh=vM5mSwtRftwCn83QapWlD/SFPPlDX0OcxvG86DaCL74=;
        b=iS3cb5oDHWtnJSJvE81LXIRlIM/irlfTTP6xkMN9btu00REBSShxne26U3KzIeVgUO
         D4YW8s/cMGqY2/Dvo1ppNmMVKvQNZgJPnaoCkkPEaiRZceYjqyp1QGPW0SG6MAIp/oU0
         H4nLIdFgyDeRYiL/lRgYyLAcPjBmsAY0Rz1GaBkWzutDvE8akB+9UjMT5ZGnvwIjqMoS
         4iBF6qeHy9dhAn1m1bVIMnhpr0k+H/GEI3NbMf0xxae2fK3HpevB70p3afGrCN+fydZF
         /97xlhDHjhkGG+z6WLxzcoLZ2NfY3ffRSJAZEqdT6oZ+h+0vdjBQpGi3sZ84X9V5hZT+
         T71g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891318; x=1794496118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5UV/eD3mOSLOhUnYm+40VgpE/6LQSC239IiMgTRBykc=;
        b=qq+EekGbR7z5eAFRySATL2tex2TFEUOIIzHIL00RBxD+MDXziMfogc/YaJA4uXccW1
         O3nrh4dIh4pBakz7QbY6+Hh/72iKiIfaBaB17zXnUjdoF/IjfzQDeEXaABFv8eAYvqGj
         ic2fqe1J6g6tYyE6jTnXG0/eQYQK2Ri67ZarORUGzh6rG6eTgXsmkDa74t43zrpN8Pw6
         vzYvwW2LmkYz6zg8u5qCw8VBJMdTGkGE1ym7cPDOayb8F8Psjdk9iMEKLGKz6W8wuwEO
         YiT2YDenPzZNVL8BsNKKMy5MLehgSktIpc0Fd+7D3UfJL4Z+Huot6ds/RdM+FpzQIsbp
         vwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891318; x=1794496118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UV/eD3mOSLOhUnYm+40VgpE/6LQSC239IiMgTRBykc=;
        b=1z1zYQVu1X5LOE9uDIIxOIyRxzuZUBa/xeqZUd1uF9XeEHc1Pyr4h3T/wJUuWhSXpY
         CB012LrXBn4hrzfj/HELvzgRwmfJkvVB+hQdK9QrbodgoXf8fqTkP0Fo964EPyg3v2py
         l3nYTlqsCZ1CDTcGSanadk6W/IbM9WuTJGgLlPyW7R0p2kIPndtTBlTMYyL/RHQ7/id+
         BWM1kmgBjLZFVCDoeYurm4b0/Hu6h6EgxK3WzP10QhkTlbq5wuqNkttv9iFjEwgAQood
         d6HZN3aRxJZ68LOav0CypSSllqUI2fZSpDsZVCTfIDzuzBfA5aEkbG8NoJQ6DuvJGRqE
         B8Cg==
X-Forwarded-Encrypted: i=1; AKwUvBz5JuEv4AvwcXK1/8EdtHimSQeSMoWDNq8vZhkoSosBjrzgz1lt2Zt+dABRCf237JdP6ShwjLhNne/7Xdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GYDhJH9iYmbeYPhd5GSNTHz/bZNCL/gdeyhW6/iEuLyWPIiQI
	KtUfQSoSSiEg5ZYbtmMaOkYQC7K6VvUoJVUoXgFqTEPts3NGxQXeZH8FF8S5VCb8FrlruFyX3zT
	1c3KQqFvH/mdLwG0qGhMFb/y5rrrDUp4=
X-Gm-Gg: AYBFou01tsRfgqKDeyv4XbcefODFCTSePR26qolEgF32wjddYkLIDeZiIl6CXTTF+qs
	grDLvROv78pv8phm+MzqLfgCgv9rOoAcNGU8GssssVGE7obtTXZlAWPT2gAkF0C4xNzD5QvETxK
	dbYZRXTcOR/Gfui1i6sJlA6YT8OFbKT5czBDVo46ExDH0r2q6kzEy4fyj3YHDWyZxIlC7OCu4Z1
	cLMK2pEtX5wHnlwz7OZLsiXEUD/MsbWIRVqhthgq9Uu3lo0clBpebS1708BIiTQzAcmW2pvIbqi
	7rSYXCfjwHcm83X38HGjaqy4j8FGNT3QZdyVdEruNpUkoar+UsAr1aM9nbmQzD0jNL0mP6ZWCEO
	QMaB6Y1ltYHCKLcEbD5no7p+FkLJ7EUi04vXJDUYLT/4XkXfzpHER+XZJHSDpD+bfMhRbmC+kFe
	is8Z0xcXZBPdoD5xmeKVrEfOnbTv3hU+bsjSA2gN0c/CdV4In9NSGOFpaeBwJPPO7N1vNYQZRDM
	g==
X-Received: by 2002:a05:6000:2088:b0:48d:f6d2:9c88 with SMTP id
 ffacd0b85a97d-48e6e4f8daamr42883065f8f.47.1793891317789; Thu, 05 Nov 2026
 07:08:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
In-Reply-To: <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 5 Nov 2026 08:08:26 -0700
X-Gm-Features: AclHuK9DGsKaK7xiTGD0CxvOvT620BRSQMIPoyAV2tzbxWnS5VA1TMg1GxpmWIY
Message-ID: <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 6:36=E2=80=AFAM Chris Wiseman <chriswiseman@google.c=
om> wrote:
>
> On Wed, Nov 4, 2026 at 9:05 PM Sergey Senozhatsky <senozhatsky@chromium.o=
rg> wrote:
> >
> > On (26/11/05 09:10), Xueyuan Chen wrote:
> > [..]
> > > > SGTM, but I'll let Sergey chime in!
> > >
> > > Thanks, Nhat and Chris, for the discussion.
> > >
> > > If Sergey has no objections, I'd be happy to send a follow-up series
> > > to make the shrinker configurable and add the unlocked pre-check as
> > > Nhat suggested.
> >
> > Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
> > to determine who sends a oatch ;)  Just joking, let's first figure
> > out how exactly we want that zsmalloc-shrinker thing to behave wrt
> > zswap expectations.
>
> Haha, Xueyuan is welcome to send the patches!
>
> Dumb question on the zswap side - aren't the zswap shrinker and the
> zsmalloc shrinker independent?  Even if zswap's shrinker is turned off
> at runtime, normal swap-ins still free slots and leave fragmentation
> behind, and unlike zram, zswap doesn't have a manual sysfs compact knob.
> Would it be simpler to just keep CONFIG_ZSMALLOC_SHRINKER as its own
> standalone config rather than tying it to zswap's runtime knob?

Yeah those 2 shrinkers are independent! I think we should just let
ZSMALLOC_SHRINKER default to the value of ZSWAP_DEFAULT_ON.
zswap_load() (i.e zswap-in) by itself is enough to create
fragmentation. The zswap shrinker is just another trigger (and it's
also irrelevant if zswap is disabled anyway).

How do you feel about this, folks?
