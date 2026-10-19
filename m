Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426272;
	b=J3OTmEAigrsYBsAZAVgwhw9TTh/7lMU9+Rk2xntD05rfRUQBeP6vWBVufv+lHqu3IyDN
	 lVbzOHVooxRysEXbpmWMrwgEmn/buECFL1EZ5Q+1H3IH3PayNsMVKmRT3deFGdr0FptPw
	 jcTcxgS/pDOcM76juRG+pLSqkzlyPfWU0zFmc0CWjcu5tHj/QMR6KGtCuzPQasfjCQCt8
	 LNJK5wfdskKDSk99DuT0+u1JTz0b0W4Y5BzRTXr68QXizTl1dlVWLZHY+AnuAAIs7X3EI
	 sURgxLqCLwCRw6D8t6SsQUhyHbjyHZmyVa8QdzuzsR5uYqISRRrgFCtx0vBaJSNLT8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
	b=FgGF8Hu4HfzB/Xq4slTt76Q/1Vm+xExhAqETuQs0XibxyjZqIhDP0jBwg/bmWNcHp8NK
	 f/AFxskLDVhGSrOrUheMEel5PYA80tNiQw+4G5twgIxuZ/MM8StetoTIaayHLSI/LwKFk
	 aN92+AX7k1R1N1Ypc183arAB4TodlIARpGCmlcchb40inAdZLqNX/q5HJwZa48hZoH4Mf
	 ILT4mZTUGVEHIZPYGtgfyiqgq8TxhY8VoT17rfbMZkVMUxskwP79VcLJQeXRjIJCUyQ0A
	 PBQDDOYlfHV6XS50jFtx3/AyYmqAVqUcM18GMODXL7NIY/9LDEZEZW7czPr4RD1iyJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409A606DA79
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E409A606DA79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso16990a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426270; cv=none;
        d=google.com; s=arc-20260327;
        b=NIc7dMprOeEv4uTZ1aXY/ehAEpAj2zszo7A/S4Z3gmDNgBXz6G+rjnTpOUj0pFwV8u
         OhHJPODSod9b6DPpfFdkuepI42X4xkY6xmxOFFvXiTy0CraP5Ge9MwioHL7/Yi7+VZhC
         yVloAYMOoHZbeSsuh1a+V4xngSAXB/LiKkzlpjxl4bghDrW+s6YfJbxW6c9R3RCNOzNu
         AWx/TaFyRf74jR8/JJelvEJwaV9mABtlKYgh93XUJJKZE61to3+nL+Ae0EyomRWZthzr
         QrGMyLu1JWPbcSFUuGWNP1Adj5pmvY8e4vp4DalwgVAW4+H2/k3g4BntMLc87EiIcGqd
         oAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        fh=9Xo4aKzwRujK/3AvuBKP7pWDtDA/UAYmZs50mGgKFtg=;
        b=dPCmpEqc1HYcXz7lhM3K4PJsI3bTKEryfcvLWuSs/YkGSZP8CRo69S6O7iqmh8tDZE
         jgQvSDbeEW0eXeEiK/BGfsS9extIOUH78P+N7jVYDj5H7S7A+atO0PluVJlrTYlsMoyM
         Lfd2AxzwWEmwBf5bznaWTjOlE8m3ui3tXWmOeaJXiz/K/OiEFk6v5E3buTL6N37jADZ0
         586uY7/3WlHpKGmcjA9o09tx4XAmcS6kxbrx2ti12eZoTdovq4IwF9UKd+dFeVNc+/+k
         CNyDgSmnxCFSK1K28gGsC2aQNKjCsjBpkpxpbTwIyX0++qwxeS2Xx2GfYoLb8qVekmTA
         +55g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792426270; x=1793031070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=tRx3K5jmcY33uFjjLhBl+j7aQChswPzQ8jc6vt21o8gL5HebhBkZhq0m4V5VQXj8Os
         Vxy55uyFlopl85UWtcuhSyXPeS8T5aUmHQFtnKEsZz7CPNXCpLO6jJgwUUnFOIl2yUFB
         91ziLFkt7j059F2wIJiIWCft3lgYJiZpl7D3tjbGSsU8jErVrD+G6+TLwtfY72Fl1BRp
         +udUczkN4A9EVjpSES388lV7wjosc45EmCjnJY0x3QPYLgzoDNHjM4jwwdIDS0kg07RL
         YnqkBmDIKaVV6xViHZm/RbvKeMlM1D1RnEkQXEC8kGdWmFWv98zxVzqcc+Q+Y0hzQQtm
         mbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426270; x=1793031070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=bmkQ3VGHjEWa6jI3WNytlbvSJgNPL/Xhlrxt6kCxRri4fO4tYAhjeOglqKjGEi4WbI
         k7emvQ4+YVWmTbQP4Ycxlm0Krj/Qzoyz7gwCvyggOtKTDzEJsZdBXqvgpAJ3Gt5w3WFJ
         R+/IaKc8FCyXlrWIU3Z2tvo3w+ah0Vz5NBA4xhWAnhHkt4D/6ZREHELs+YxGlGbJZCeg
         +7qpvDVW715wG/oFZc/vt2qmh5tvwSjfwHhbE7d/Z0qTofSHZLmIt7vAdw6pOhrX8oOO
         f4LXBm+TXUAUFJT5+Rze1YwB1cHif+gqXIZUeQsDgmOeUcOtmPkQP8j+jTbCyh0PLsGX
         V1vw==
X-Forwarded-Encrypted: i=1; AKwUvBwXqGo4bS39kWg2b65l9U/ySS0FcJxfLqzUJ2Eu9/gJvXerW0wsLUbzy86eTBbwDgjnJQ0hhAyf2nAGQeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6K759wbbUfJmvuVZeg9y0SBZ86jCSLcmCH7a1Ty3AsR5YG6N0
	x9Ecsk0AXEA+c6AqsrHxO5pCuikORBhO5PWQANcDJGaLQCyTlIMj4X1q82kJFWT8cL/FG7Mg929
	eADU6xc+9N0An814hFzNKOH5BksyTF6VDI9wxopwr
X-Gm-Gg: AYBFou093hmI1QAxCXUrKjzOWY7vNiIifEBvx/ldTQSEYDA5szW22/Ul6ET41znrsOm
	mdiXodmJMxczPnd5Q7VnMP7DOvoIKe8o5CBCLsBlyZcOxV3vMRcGT7Dk5IngoJAMJ7ewKLmTDiU
	hySWT6wUNBk7noeeQ8rTeVB4vkfqNYUp1tzlrABUEB2lUW30G27XdPnr4TwtStEuVK/XydhArlu
	fxIincEF0ocdfme1yE5abBHTs5mZrDzegjySZgDntmoNzN4F0xVNdessFkBPG2GLGjQEqOHCx7M
	lYWK19QmdeJ4xdcVs9NaYg8qemBYhyi6IsBTbrUO7xbmjNNcIMb17rPxRjOmWo+xtfC0aTmmVPa
	2K2k9httQLA==
X-Received: by 2002:aa7:d3c1:0:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b3ad90b655mr92225a12.9.1792426269498; Mon, 19 Oct 2026
 09:11:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-4-almasrymina@google.com> <179233927086.3135.6123492094489915156@kernel.org>
In-Reply-To: <179233927086.3135.6123492094489915156@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 09:10:57 -0700
X-Gm-Features: AclHuK8eiPagoVp9rRWfufPEyCEaXmjBdb7vS7t1VxUSJn80p85wHIDPJ3eEP2Y
Message-ID: <CAHS8izPobFzob0pF2cLqL+nqtJVL-TC50QuDHOem9_cwJoGSxA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, asml.silence@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	ap420073@gmail.com, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dtatulea@nvidia.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:01=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] On builds where PP_DMA_INDEX_BITS is 0, this patch leads to a
>   use-after-free of the netdevsim bus device.
>

Bro this is a pre-existing issue I think. My local sashiko also caught
this but it has to do with us not doing a get_dev or something when
PP_DMA_INDEX_BITS is 0. That's a very rare condition and unrelated to
this patch series I think.

--=20
Thanks,
Mina
