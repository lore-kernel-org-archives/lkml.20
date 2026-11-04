Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793828814;
	b=Pf4DKwtTk1GC9eyY8rpHOfs7QvgIT+fREoL3p9rdpoCrdDQx0IDBG9YFJ/GmW7kygDRi
	 xbdGKhlYn97b6fcCkx4/85pgxcCwlIOMfdhDSK4Ysh9IIztA+fysnLfZai9UQB9LwTThG
	 6yF+AVZQEN2gTDMGbdK+zDSAUncfQ8JA0PZMLObdtMqcPP2IubG9PsTRfXBO6o5q4rz6g
	 sEJ9WUc961vxpcHenFqNCiyMXaZq6KqRtRfv9utOU3DJ+FlNyFBYmEFguj5Ycw9yQI1FQ
	 MpASfS+PvqyjX9/g6zX+WLCz45T3F9BZMmeUq90W4eOKm9wtlLWGPNfpiITe9XeVfSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
	b=P7cK48bJNQ4DEvmc/1V0Qd9JPRCTESYRcRlM6RYxyCxuGwnItE0ZhuwO6+Q+z55rOZEO
	 u6NGaZkP6wa/BrxWKnMdwa6hbjKAEyJNr+3knfwrep72sGxOlxzeee+6QrL7m7+5o7BKh
	 SPp7K1+O9oB5z1Zq70btFZ9SY6AeKtaw4fUD5cU3KDJUFm2v5B4ZA7g9MpzprzL+ubm05
	 wbd1reA9SYb7Sotf6hdCl+gweruPj3Uppdnw5bk984QHSgHHxmHVeLyKmH37uYiqAhPIU
	 0hZ7M/2DeQD3jCjJF/YBFmDDl/RC8swigfrSSFUxYQVSvoYxlt6pBUj1uxtohkgZVxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DD606F2AE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2DD606F2AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so957a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793828812; cv=none;
        d=google.com; s=arc-20260327;
        b=KXRb8bH4skWY+l6KLDGBH3DBH1BaUcIjAEx0rSOGoEAMlOCXllpbkewy6JKPYF8j2Y
         s/dMIkHVBTYAZmhv4i/hyvwB+wF6yIVxaDUB2bEXfYn/qa3iQtwM66Q/NyF4glvussGQ
         gX+HdIaK40OCyZHlxSfzfrvW40Vav2FGXrS4gShmjLL5Kv4IKzTCXfGxNFDmwUWkIalt
         +BbqVnKoWo0yXCWngMjVvNaQlYGpUfIcYNC1LuFzp0v20vGml6sWz6J8QPTvVCH8lU7O
         7IdA20GQgw/jWXXAP+EYVhvwm9XPcWDSbUOC68gd/BKT82RNVr56FboiszOORJ5bIUrC
         +3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        fh=6O/avXvVsCvNCVjKBDFZxMNNNV27BS2+fNZiRpLIyZ8=;
        b=dlsgxEmTypCwr2x3CPmYDnZwig91/9OrmS9asL2Lb5UghTFJOyOb5aBv7pAT4QyJdl
         DJgx73Y8xB9ihBEOqzaBOEmog5K6zzxsinPa0i+lwQACqHrC8X9EUZPYjnt4wQFnh2px
         NC+OEuxrqJ2c1Os/7c3M7c6sF0GfJGRL9xa5Bsfa1zGFwb2wBlT9e3AxtoHH2hWsgf9C
         +/n4L+o3XCAiUpEmna1z+euf+YpGvnP9UVCyH68cs3DGJiPYb4JUkTbh4Xhnm9WN9mJG
         QtkpVXw6b24L/AUd2NiUVzkDq+epRuiB5QkBq9kQ4riKD22688qdnvJBLuSJT0tOVaAr
         2FAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793828812; x=1794433612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=Ewe1JQDxh/OpRUCdClFd7Kz1BJmW0JX5ObbSRd6Ekyr6w1rdIhE7jMbdYwplY3NCKk
         g2aFJz08a6ruEkG/lNyZxd26EKiGj86XAMxt7uOLgX25eme/UvJCfgY83ENm95r5k1h2
         qiYJWnp7FGT0h/ykL/xzAKDzuumb6PYNgVmBtJDl0E5vVOEJZQlJ5OKiOOGlzhKY7pgK
         V50o3jeKznfmSCKKczWrp32DcUEdqOkaOEbva0veDWOkR9ZHgsPs6Uq3t7MUWVnJtiJa
         abilpf21PQjXpK0rSl0BW25FeskGFNYkmAYeYPtlNoFAo3KDu6Tq85Tc+PymlrpOJMrG
         33OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828812; x=1794433612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=NF7Nd7Q2uvkqigSCgXBJP1RYFc0qPsvRytiYp39CGqjpkGhFHUXii/rDv9zFdOgkBz
         8j5oVhMFfD9NBXoQ+0QyRwiGEfaWihSVQRkILZomJ3U37S0pKcMRDieuwRQ6pdL8sheq
         Cw7+vFV/wppwELNZjdzqjDu6/J9XSzw+O4CDiFsIBrv4W7/r0bwHEssl8YW4ZIS9AvTV
         SJ25FKEEr8mdLYcXfCn4zQgJzGwMrN/OhM/ByzTVNqU7sRq9piMXlbdXqc8sf/6UYAjF
         RBW4DIKaogTC2I9BT7n2TxtnntbPkjBY2rT2s7Pib1DVmygGtoYLMjdnj/MJOyxzwSZx
         QbbQ==
X-Gm-Message-State: APuU4Z8TuOvzxlUd+W4utzkO0j7pznXxpSNTcsPv0uTE8mCzvcEj7w6W
	HU9h/pLkpac9N4NxFJTj/gN7OttjZXhY71EEkGs5Zciy5+9RZv9IWnEJsvnQWbmy13IOX8RcFAi
	70b5suLr6VP7T6gjqc75ZyUGLGfTlok+bcJqCGHv2ttD0SHocsLVlKxT2YtI=
X-Gm-Gg: AYBFou2YiJdyUwH9XkREcLfGfIcP3vdcuO9cvkg9s36s5pgJZQ5tZTu3sTkY+kEFint
	ne7F8vo6wCblyLe0HZyvs2nBykZ4XzQ01XVltAIeJJDMPpPc7Ps/4BoWrekT15om+4xJFtp54JQ
	K5nZqUNFDMiDp6BMbesNMvOTFxXnXzAY6WPODfST4rYRLxpjzW0KK9odLwZ+Ot+WlgGQplWQAUR
	huusSGz46SOaEl9egmV7cE5W83juJx73st5TzAclfbTaQ65Aq629OPZLCAlhB9WAHpTuHnSGPky
	zepFN3CVHTS0szvI4tDGFp1XP1l50o++hS8vvvzUzKePSRAsfwybnKZR2oqy4hQy9YPLMbgnpdm
	fkRwgBL4D+thvzxs/JmA2sGveLZe5BGHWcfs+hlv4OYYgVUrMVUclhSwH8GFn4uSr5t0HCg==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr4477a12.12.1793828811278; Wed, 04 Nov 2026
 13:46:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 4 Nov 2026 21:46:38 +0000
X-Gm-Features: AclHuK-hVkemMHCNU3tA_P7qPrbGUQncvgIj5WYJYosiCeTanBP84HUm7Z_PAwc
Message-ID: <CAFgf54pn3=gsB=3zCsr=6xKU7hWtmi_sxdA772vhzdAur=fZ0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 7:19=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
> to assing the QCE/BAM to VMs.
>
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/un=
bind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
>
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
>
> This patches apply on linux-next.
>
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
>

A gentle ping; both patches are reviewed and I have been using this to
test VFIO platform with kvmtool
https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Thanks,
Mostaa

>  drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> --
> 2.56.0.212.g129ede20d9-goog
>
