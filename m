Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556844;
	b=TBmGywqmE3mNOlGYwKQIRQMBDrmcRGGH0nbXx0uJ98cFgBBa/k86cBDpazUZ5VJvUQYq
	 +CEbr6j7pmQk3/geZ9DjyJtQqPZzAHDMy1fMP2fefMyJSw/qTNr/t94P7cRgbPm/tMIXh
	 UmJohssfwIvgd7vbChfzD3Q73zurDUJzz9sF8MlXo+LtnMiCnlh/W5pmGHgP20BKJ8BlQ
	 EH6O5epPBtC7D0bm2MaZyAYXx0IpQf8arNjVg7oFhceeXUKvpTuwJUfebTUVGC80EJKGz
	 fkTtX1xjocGVZyT0TNiKgGFkA4oURUS42tiiGRWdIQBge0meOziT3jvtPatOGm12ntQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
	b=uC5KQEr+5WVdR5lt476AmCSPRQbmkFvjsqUZHgNGYPcgtAm4LJiHorncIOkkBl8l0PLU
	 8f9L7SLhchBde1dyQAThk3NmZr5R5N8fSIM+826KZzn6P2sBnWQAARY66exf4QsTHEvbN
	 I2zvpqFn4PCeSpHZAJ39P9O94z+niodSIW81fZDc2CeALqMubege3fKqYKrSKigU5qGa3
	 q9s65tlugDGhrQ3bc/E9S6iukYzrFSUbVqboCIJNR9egYVNRMNQEKWQTv5e7JYjOwTKWt
	 BT7680p9vajTZMXwq0HG3UJaNtcUMeCJMdgE/HGdU7YfIB3cRBkwz6q5rgJg0K4fFtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2uct+Co;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2uct+Co
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adf89523d8so966781fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556842; cv=none;
        d=google.com; s=arc-20260327;
        b=h2yN/iVp+PAtL4RfZ2NrBWzEirzGocbLS6r/H22jpv1vDLM3iN8yOWRXry8IATgWOE
         6G287PHios/p8RebvM3EooHEiJxnti8PLItDhW+1+b0hrFUnfy5GF8LxV22V0hoPKcXw
         5e7SbAketp18HKcYMAz7YY1fV/ZpVTakrdb2YXmYN21C+tPI3Al7NRzO5epR+r/aqaIl
         H/vLhjb79zw9hfpSC0BJ7pB1MUT7rmnecyNuZ1oqITdONIPiIHNeqfdN1Adcqc5hWx4V
         46SlH0i2dpwBwUmASywflz7pDw1WNpInPI37MTTGzMqAMx1Hcx9KyGQpSAfPXsC/zhAX
         n5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        fh=n29ovbi3QmBhl/5C+Mk23NB6rJoHGjPzodyttn7o620=;
        b=LQKL+gDZ5Tjzuy00hpHZSYK4e6FliXSYOQjlSvEIQDs+NZ0X8h7wsFvD3g0UI+Bt3Q
         CK5n7VzxnuaFrx1FFHlRtGRnDkeMFzqV3UOJsOf3kvgHU7g119efnM7A8CK/1WGSwXRl
         2E5JQOoe0ex9g+ZaOi6r2sFLzoVovWNBktjnKLRKlz15xpxJt9tv1LRQDDqYEGKpDLNY
         UjLQsh4ZHS1xa3tDiFxPFNz7fnG0qb0zPWY+AthuWZnNnpoC1iOsI5Hw5KKaVZgxsL6+
         +f2qZAAhd9BtncfhVQL/QfE8HGKS+ZjnduDCchV+NjpfkKLc+jYRZWAosWMA3LxgACHb
         Nzjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556842; x=1795161642; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=g2uct+CokQ4F+amxmwUtOlccpC0vRIEWj4TJumELJjvRtBaLmxs8gCQb5ATjefa3Lt
         Wzhs3V5zUzSXkUhmo6yhEPVl3/AyDLgUzOJAKDixRnXG3o5YsBh0qap67riqWsaUsPJt
         JSzEfS85lwNchwUsoroI5gOL2ICTE5VC7v2UHBOeejNP7IOV4kLG+Y3TYy2q+YxXSvX7
         AWDOAFOEQ9KqRwyrWVPwfz3tmIYF1eeT1rsZpV14S0bTNlqllIcRJ3s5dw/FBF8kR4PG
         nFjXCQSXXthDNAqD0L+B61YkUTVoAxOZ2OUastjsbBdu1NUBSml3Rmev4ByY8DT+OMLe
         csSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556842; x=1795161642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=hfdgxI3jZQOQXDlm81SXD3VHzu4N4jrhjlE3qa/hbZQIBZEu2BqVxbgB0eu6bCuOJ/
         Ouy5Bp0D+n92A/Vql4cUVUZsbaIdH9l4ODlB4LM+XRmmq4J7KB3WjxuZChy2ynl2EGpu
         g7pf9R2l0p822sdODAloIZwn6pzRDI1jvYr6EtZ4+zFJVBH/my2bnaQSD6OY/AI4RR/j
         SEWai/w3KE3WurFJV5O2jernBQNWJd3j+eTyt0NnyW86XWkg6Wz62UhhTSuaLZxtLBzI
         0agcfb/B8uqyL9CBibAaBE4tWh4HVY+WEHhLqOp5LU+L59co/21rVqM7k2SJck+u2+wY
         l5dQ==
X-Forwarded-Encrypted: i=1; AL+hErE+0BtNYq5BEX0ccFzLOX5+qb89CLYNIaJcaWP3RAmC6DCytOPavhIf3NHCs0ZWUWk1kd714xUEJ9ocVU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y68tmXtzogs7ig4Sf9sGVz5buZZnywIyv4tjnRRCul1NMGbA8
	hiGThmxxM4Q9M0oBoT23/5dZl4ar/9aVxP0XMehpEeMUgchCR2zG4A464vKRNfcYkvU17MXPYCR
	oqZxZPQuU5odCjo55ALE2+FN8Gpj4WQU=
X-Gm-Gg: AYBFou3DCFOjGgKkrV2BgofEroEY4mg1Pj8MmaYQMlDQtm2JvYvbB7/TI6DBkMAxTjW
	Kz6ktIiDw5xh4QGxp2Luvmtc10Sd0OlQTiePrLFKJTtav1zXnnN5KEy5BI57BangQoaUd0sNWr8
	R84+TIMvu9QQk2uRwg+8FEljUe47qkDr/8BXv7AwKH6sf+hl8pdlrAK/ciZi7Ss6t1eURp48Qs/
	XeF8Lg5KIc5KjcJpP3lr620Npkp6edrYmESSt/FfApRZqI1m0wS8kTJKGi5N9weHqWHoRpOJmIz
	9eDyDWvrYM5uIxh22aXHNX0IJhR2t0Py/Mq7yP0bx6LYQt9Vgu5Ol19Nfr7QLcCiav11zfMCNZB
	gEsLmVOQXST7RYP0q049P4bcN491RFJNCIoYBSUN2JaA87LzM+pdMDA37FfYIjiFEH9o4S5E=
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr682927e87.1.1794556841810; Fri, 13 Nov 2026
 00:00:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com> <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
In-Reply-To: <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:00:30 -0800
X-Gm-Features: AclHuK-I_zgsSZZ7-9_Jv6URD3G7__LXdFVlF7HwZI4Ihkxqdy0NcAMKAgOjjTI
Message-ID: <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p on
 the Rockchip VDPU2
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Just to bring to your attention, the IP does support up to 65Kx65k, but then you
> can't do referencing (its the WebP mode, key frame only). Hughes Fruchet from ST
> started looking into this but his work was not completed. The general idea
> though was to perhaps introduce a V4L2_PIX_FMT_WEBP_VP8 (or VP8_INTRA, naming is
> hard) format to signal this to the decoder, and limit to 1080 the FMT_VP8 (what
> you are fixing I suppose).

Thanks, good to know. Yes, this only limits FMT_VP8, so a WebP or
VP8_INTRA format can still be added for the larger sizes.

> If you have time, it is also miss-configured on the imx8mm, the combo-core
> (G1/H1 combined, like RK modified version). While the imx8mq has 4k h264, I
> don't know if the VP8 core actually is capable of 4k, so perhaps both soc need
> fixing.

I have no i.MX8M board to check what the VP8 limit is there, so I left
those tables alone for now. I will take a look at getting a patch for
this separately.

Arun
