Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D54E80C5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534377; cv=none; b=fCinKdt+jxCq54b6dj02yvPbh61MosK+3hARBaFPrTsmReLcSM/CfbIHrIwXmd4so9oP6mJouU0bZ3gFnlD45id1Q9pxDehbjNgwzCYjmDC9qNoeMVLVxijfE1jCC/GMlZC8sg8eA1acPZi/eMVbmQjbjnVqD8yhehuqHLDoIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534377; c=relaxed/simple;
	bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duAO8Z8RqWxF+rakNZk3/szmEV4DpXCqj2htS6PFUPrqFDEDUn/devmZBHzEXDuELFIj4Fka0ov2kD+HebMr9+X2gmMpHuW4u1YXlYghHlhDxCep783IIG3qZlWqXNUqf1fYianfmgGCsr2ZI68MYP+M9GRsqbtz4Bevoy4wpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RU65Z85f; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RU65Z85f"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c95395230so11067981fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788534370; x=1789139170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=RU65Z85fa/y6MRdrm0/iTY1Yym2etlIlg5flUujWAWxp5I2tiHSGt4n91fpgP74G9D
         nRdfU36TY7kfPBeCm7ZReKr/Pzh1U+8f61wac9zebHb9PDjpD5dlQcLD1z4t6TZp7GFY
         JBJrA9TdmIuaob+mSFMGXdpzDILS0bs07PEZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534370; x=1789139170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=RxzZNZjF18f33hbQOHSHKeTI5fbHc2ov7Uhr2wvnYC1Gi4ZZFd2CTQuIU05VVi/9vc
         hbIIjfA6mqjgGFRfk1pgXBT/tvylm+VrCxQ8HVr/38ODfxzzAwcvnF3JJXnH514Zdnp0
         uKF01RXtleKYjGh6incK2mu91fdkWuQf7w/+pUv43ZCezClQ6N6a9HzZ+y12yiYLWqnJ
         hofnIjbRCA2ECvcUm6mMKXBHwntldrHs6djPcYM/Uc5/xPNiiHH6dSHJsUJ0Ogg2PBrY
         AUm03yjw5HXOB2MsPrTvzVBvtmfA7e/1ZLahtuzl2b3lRsC7oqPbvB/u7zIWaPCXVU1N
         kpxg==
X-Forwarded-Encrypted: i=1; AKwUvBzfmwaOz/nIfghaYpXbtaN6XthzK2FxQtuhOg/mEbkjkEcUn+N1KlDNrMflpx6Mbl5EQpbWGdG8rTEBc08=@vger.kernel.org
X-Gm-Message-State: AFuF++lwDeVSu7V4IM+63lO7jb+AmeuIjMZgYRjYy3oZ1g+d5+lNKozq
	0CPEHOozJQyFGIBlN4KoYRo5f19iPrWP7j0ulTIWCdpD2I0zOUhDqwG3nCR+0WyXc2irdXnzHXD
	e8TM=
X-Gm-Gg: AYBFou1CSM4ok1Mp3I+322LJPcwcnJTY07DCndm32+F09o+VD0d3aV8JthV5Vqezf3D
	RW4PLKVkWPDxGAnxdz2h3p3gQ7G2C2+FjaodxWbaEFxb+LO7oyvBbnlUswSIRP0Eg6+04SGwrxa
	VcxRZ3vS+W46+9Q2u/DIl7FNT/vyGT2WjNsbNz17Su9YxS+aLOzR1ivkhDxIr4A+cYvzfhj0yJ7
	6ZGD8t0B/TiwLk1HtyhDOyveNVcz+s6CJh8y40EoYUC+RQjhzYZm5bLILSCuCtapG+3mWW+DCgc
	WbAVun1SeYZzrKkiKEkP3+bJtQ2bUVBQEQsDNY4Yawh6Jb5JjB6G/+dLjkLVSmK/HgcAU7SE5IM
	d2REeYVxSOzxcUQDPKyjRihGD54T5Mc+i1XxQ3vWeAm5khih7f7gjUmT+E4p0/PKJJoAx+beRtJ
	138T8t9zn/myEsbG446p0KQSTvPTlI83XpEHFBvRmrUlA2AR4cuaoFqpYH0a4Bh62+3gYk4rF4o
	agZDRfDmjXT+Y4rg8fDXxzvalQ=
X-Received: by 2002:a05:6512:b91:b0:5b6:1a7c:fd82 with SMTP id 2adb3069b0e04-5b61a7cfecamr778329e87.40.1788534370271;
        Fri, 04 Sep 2026 08:06:10 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669b408sm567824e87.1.2026.09.04.08.06.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:06:08 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e4998d28so827750f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDVbfMQU0vh8HHyVv0VDci0yOUphp8vhuuJoVsVO0/VeAGykRJxTh5S0Cui4dMTI77BQUfkHT9Ra/ToeI=@vger.kernel.org
X-Received: by 2002:a05:6000:60e:b0:485:8c16:a355 with SMTP id
 ffacd0b85a97d-4858c16a6c2mr4328911f8f.45.1788534366728; Fri, 04 Sep 2026
 08:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904035009.4114363-1-justin.yeh@mediatek.com>
In-Reply-To: <20260904035009.4114363-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 08:05:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
X-Gm-Features: AcwNN1U5Q3Et8gbm1HfFEKvqA92RRKLIkp4skB9nrMClbBiYdjjt_11lut00YBI
Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Skip SET_POWER on shutdown for panel followers
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 8:50=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> When an i2c-hid device is a panel follower, drm_atomic_helper_shutdown()
> unprepares the panel before device_shutdown() gets around to the i2c
> client. The panel_unpreparing() callback already calls
> i2c_hid_core_suspend() with force_poweroff set, which sends
> SET_POWER(SLEEP) and then drops the device's regulators.
>
> So by the time i2c_hid_core_shutdown() runs, the controller is unpowered
> and can no longer complete a transfer. On MT8196 the SET_POWER(SLEEP)
> issued there burns the full i2c-mt65xx bus timeout before failing,
> adding two seconds to every reboot.

I don't think there is any guarantee here though, is there? In your
case the panel might have been powered off before
i2c_hid_core_shutdown(), but is there something that ensures that? I'm
not aware of it.

Would it be better to follow in the example of i2c_hid_core_remove()
and just remove ourselves as a panel follower? That would
automatically call the power-off functions if needed, right?

-Doug
