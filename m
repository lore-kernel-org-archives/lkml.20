Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792548641;
	b=xaTS71LLE/NPlhd30QQLITZNrUtK2ysLQzoW8GibUHF48u5gCVd0WKKowCH5+mVBH0rf
	 a+0G0DnhVNR7I2GG2eDedkSDBzuY3exGPQCFH24EHTuVUm9N/lsrTRVhg4YGBYo0jVV+y
	 yOQqtSpldnCA2OSwJ3Q2jaP6zl7ecqtAyRei1gIWKkKgZka2bRuEa2j+gz9IMHRNbghwy
	 ofbGnz33s0NJsXkpSLXvDaeUe80UgIicGzlVM2SG0Bm09dwqcPQU1wlca87jeeWA/DVn3
	 EQ698IAEEaDxqTW+ipRljEzlgeOTUl1msRKRClr28vzgzfzfpu3+VKhvpg0T6V31TqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
	b=5de5OXn0RIE2XddNLBa6A+b3O7LUNgkpD6fpTDb8/BXTvSFtdXFezOeJ5I+PInkfHIKI
	 kaWYBZ31Ybh72vDYbOG0gdCzfX4oLM89T9sUttLhsFGElFvuUnIr+cw/trLyq5da5uUa/
	 nUqxDR24jqYYK7I9PhetmZz4NNcSvh/Vl+XntfqEiLmlJx4y9/xoAZPXob+Ymt+9abOVH
	 sVkFIolsCgRU22MyQpgADUup+iD5taod9hdmlU8sHPNnbBIMrW27GCN4PY0T882vPqkXu
	 hOUcPVWUbm3DL8zN/DaX2YrlLIqUEAYIV9lHkU++BAHZf1v4xmspyRZNkEYQouCKQKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k21jsunw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k21jsunw
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e95bd1c14cso1695075ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792548640; cv=none;
        d=google.com; s=arc-20260327;
        b=gpjhfaPIj5bd28lWb5YdMgvkJWuciymeHzl4Y58KBdubrLGiLxbe2n1UZ715LzlRMK
         3TpMeP7UwjY9nfjFopFL4eAogstZopcuwkpcxNxc9q8BKOAtibFssPYq9d6f1tGCnxFs
         RDt4e2shvbQvPjNoTD6uh9789AxOxVi6p9I3sH44gup277399eRWt/tdhxXG54G4cwm+
         srgaAZDzWXsH3A+PNC7fCrMdDt190aoWWUaHOdR8yehJ5bguF3BsVDjXyLv/7KiYGi+K
         DcZmikuzG8zljJO8MreB1tJ9wG4h1sQGCa2/+imwMiNRl2T8SJ3en80QVoZjfC5p8q58
         wjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        fh=so5qzD+fW+wS1fgvOcPGJp/x+uS0liyYV1qKI+oS0xY=;
        b=AZpUik3xqJhFgg+9/HcaoHh3BJIOrfYZPTzsC153AMxSzwZ8f2tzO81EvFkpA/9NVl
         /CCAUjpI/Ir2CyY2bI9eSyRctDHJAQSlgBEEuSFeACRerqLoP96azqKn70l4RxPabY2O
         BShZVaJaGEDr0LTR3Vj3Xehm83EstImurah7w1nzkL8ZJ4rLhmBFGuRFri8f9ocjJD8C
         7Fhc4HtvkI3l1wC7zO/1gSXeKlLQoE5fU2CBVm1RxkYX84BzkB/hwYH9wcct7lm2h6+I
         fYPq0Q1GLO3RWykd/TcfkN1+sxSpht/+nHoYXwQZ3f6t8WLnps8v+gYB90tNGV1/4Ycz
         sDjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548640; x=1793153440; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        b=k21jsunw5FA7mnHUVYLeedQkj8UYKNVenSZnnh1eXEH1EsX7tjPIUNaZifwCaBfw6d
         PcPkt+oTAJLXQ432zivPjYLpP4F/PUFxak+TBWBzgJ63rjKS1PUZXWA4PZKnYjIE5wx/
         c1hPmfM90XFYPCm2xeeRne8jf0ju/slGc2/yUfSmY7AxrARPnxc1mxFTbrmkf35dSFK1
         JEw1NMSyllV4MiWhHPLXvlyTaTNpwOejn9ny4mxew6b4MZVyqWHrHZlSQZ3n3ndh0TIb
         N/fQf4BkWesqegMj3pRXjSiYt/xHJxj+UNjI5e7q7aaI/HzKskKh6OWBu+qJN80UXjNj
         pqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548640; x=1793153440;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        b=MwKhtKy8o68/I2788ayYwZgIyiEpJVNzla783/xhNge7AkXDcMea0IZUwavenKgB+K
         RohIRPDfd6tsfTmQMOrdBbKNQpOMPiHAWHWyxhHs+Yhpv3wIty557gUrx3KPvD5b63YU
         qAoTbv15M3crhUUoKcJm73x/JK54iOIlTAiDFjTOEGwrLammApcn0HFNLqye9t/RLF6P
         KMh1s0sKGkxhGnsZRTpIq3zmoyGEcEVgoftYNwLLHgvDkb27/9S9I/3ONYyrfm7V/ZaL
         tko7C4RAi3Zbpmq9FU7H1k1Z0xw0fw/M3Ee1lDYkVohZ9NmdOerUcEv/pxdL21PhTfrW
         jH2A==
X-Forwarded-Encrypted: i=1; AKwUvBxd8qirAEYCNCiuJcZRfhCukLoxPfqHLAj61mlDLi0FqzuvTMZ+m20Qj5NZQTKvT/ltWCoP+HrmLeTZmKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZN2SO3De3fXjJiQiQgkZ8GhkLUcMWl71/qd2IcVeJNc2DOUXj
	Ln2OUp5EIRNO+krkkLQZE7/JYQ31O7rPrFEqrA9Ke3aTFZAZYBsBd7nn61Ts7AyV95Q4RfoDio0
	emjpeCBJzcn8DIQxq5mj7pGB4BWCbpJw=
X-Gm-Gg: AYBFou1fPeo4AlXp/I92oacpI6LZHUxR20vXiXplu3mXfuOqDIXkk7qytlxy4+l3jQW
	ArW8+Qeefe6dNZaZSZvGSOlfDssfIg0slF1dEo/9Rbog/3O4g1X9PIjkIjXynKt8c34I2qQ+cY6
	UbAzzo0v8fdJX4eNPk2/BmSxdlVQNznT8wwFHhhMCm1m4i6RsC/aFuKO1XU+O9CzS8KuqH4kZQR
	pkucMPYN33MVwgsqDRDdFZA5PW46IyNZMjJQwYu8++eLmZbMmj8ZgbpPExjylAyJG39G11CHCaB
	s1EBk2Yx6L09mA9x2IeU+Jc/r0V794raDJ3cPMnNJelhhoRxjwRXhzCsKR2VdF1OJktOCtjprPQ
	4Tyn4Lf6lIQnIcZ76pBmLtFWrJaq+pgdbtre6+58gBChqJCOjEDrZBbh9s78h+2tWAV2V2x4F+E
	DZOw==
X-Received: by 2002:a17:902:e752:b0:2e9:776f:66b3 with SMTP id
 d9443c01a7336-2ea437a6f10mr6647685ad.2.1792548639485; Tue, 20 Oct 2026
 19:10:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009091059.25729-1-phucduc.bui@gmail.com> <20261009091059.25729-2-phucduc.bui@gmail.com>
 <179198414722.839288.1086260869798370727@kernel.org>
In-Reply-To: <179198414722.839288.1086260869798370727@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 21 Oct 2026 09:10:28 +0700
X-Gm-Features: AclHuK_ZwnrZGqk3WxBM5HXci-BcHIy_RgoL-sDL9QwBFlnpRBVJSLR94jrFEyg
Message-ID: <CAABR9nEMzYiBfEPKOfOuY3nScuX_kB69XKn=zvcZyjnBEjf3_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lee,


> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>
> Please capitalise your name appropriately here and in the 'From:' line.
>

Dan and Cezary have discussed my name formatting before:
https://lore.kernel.org/all/ak-zMNq_gSa9g8nx@stanley.mountain/

I'd prefer to keep my current name formatting,
as I have done in my previous contributions.

> >               ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(&priv->client->dev, ret,
> > +                                          "failed to add GPIO action\n");
>
> We do not usually print messages for '-ENOMEM' failures.
>
> It was better before.
>

Thanks for pointing this out.
The original code propagates the error to lm3532_probe(), where it is
already logged.
I'll keep the error propagation without adding a dev_err_probe()
message here and
return the error directly from devm_add_action() and lm3532_parse_node().

I'll send an updated version soon.

Best regards,
Phuc
