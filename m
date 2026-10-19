Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E173AFAEF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792379459; cv=pass; b=IwsTJHH6IWTqkMiCfloF/mQQyChTnPeLkeKMascDyK4nMDQ3ib7heBv6wIGTisbzYn178nQHp1TgWNXd2Ewn5LHxJf4rJJtk8Mt2vI2OpHgk7/4uztMN+9W4D5ArNH4mGpCROXz+MqmJcVXe6oOSi+iGNuxFmulNOTTBRJHiFhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792379459; c=relaxed/simple;
	bh=W/do4ufGZmyJubV8mrWLlpUR5HQ6dCXEm9qT/xlG430=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ns0l1Qe6cfdc3qt5YCXSQEVVCNa6MarVVka56EVGd1+Lfn4MqU6DTS/gc8GoZp+X2YxFkoNGiCfukrFzdSt05dVN+5/9Govvp4/olglnM+chhzobA0pXLC209cl5+CcLyMWsQaSb9Xj2MNHFNpLiARZMmeTigFCPyRoLw+VJxXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFdxDNgE; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFdxDNgE"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c37b612635bso179781866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792379456; cv=none;
        d=google.com; s=arc-20260327;
        b=STdsOc0CEY6Bu4FerLeG4lLTG7eDevgv5KRC5ZQ5zKpYxXAJvkcF12/fcJKDSLmE2Y
         TSGpNW34mxVIX5NITU3bCdythJtvckFOvBxkuz4/9l63VygKuXKprbVsjAfA8KqHIVQ/
         2GmbmJfQF+kv3ss1rbQYCd/W2dpG4mqCp3pj//oLojEE6GA30+PtaAXXhvoTSRHL0oAJ
         gViLtalVDL7xYrEPOn03qBOnuLpaJprG/XiEW/sjfeBRkenritZNrtspNbpOo8mkhRgn
         iKuTm0Y0iICpmxQhxwondF7nAQz5uA8DSQWJYVz2i5T9gix1y49/7ed8mAJ6UIAicV1e
         ORHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVIn5xWahvpEVm1vWXeV49buHbgWSkhF2r69LY7fqZU=;
        fh=6gbWsa+lzZ3RNNTBRp0EEKp2DWNLJP99wRkklnGnoz8=;
        b=T5qEFikE8U5ZB6LduBiVfIqSSc6Jsx94rEloPFxv5F8shCNOEFIqsC+3E7YAh4hb92
         1NCgI05LUxW20deoHYOJLqHDH9eLlXoG2dx3634aKeDaRWGrgrDehqcFwn8G1D1AVuDJ
         S/4Q93UbUoUkKZvEU8iZrDdsu3xkdhCwiP0KC/fviwoaLHnku/ZAp3IGoHbFwsJZ942v
         xS39nKzy+QI7VxaYjWF6c94s+k64qmS9yfXzujdUXeVm3eSUhqz4Dri38KjWr9JtYDPO
         Mz+mHB3ewQ/JhfF0TtuGOeLyT/JrrhqwDgtLLMlnChOjhQlevNre0BBw4Yelfm0RDxpm
         1j1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792379456; x=1792984256; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVIn5xWahvpEVm1vWXeV49buHbgWSkhF2r69LY7fqZU=;
        b=bFdxDNgEzPapZpwhH0yIIPGLGf+CB5LSO3ZKzCAqWR3uxupPHHSYqL2jKvVrDhSByk
         F9Apbbx3L7lNwOh653DI2SaK4QeHoK/v3DR/NRe2OLcfDStumhaavHbS2drwJlrBPHVe
         +IXdpvU3QG/WGHdeWrTcjSNYV/PR6dTWBgeMsVqesyydlVjXNE5Po9mR1g602+mo7ZgQ
         NJQ4+sdeFTj93DsmEuBLt/IxlYv3J9YOMijb97X5k40fdokaBA9zPYx8Gt+HAXDx3/7y
         pdJ2c07Vw95Tqd6VAVoglW4uhnBehcRiiaZJTA2wBaZjlP8dLtlZnSoY4oB5TEp0CstN
         o1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792379456; x=1792984256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVIn5xWahvpEVm1vWXeV49buHbgWSkhF2r69LY7fqZU=;
        b=v/4kgId2oo0XgIX/024p4BmDJnPmn35oRg7WrIVyqeiO9HA8uT6hJn1AmyeD6aCdsf
         YXH+Qu53OKGeS75r9p5wldciwvWqfLGuHI/KLZq9W6P8j0oRRk6EdeoESWTKt1gruvLm
         hHXlrU7yp9hfivQNySbX7hDTxst1FuaL2Ce8F0DBkOTsDhM38lBa2h217uCb7haqao22
         KJU5uaBFGhf5KdoLxQF+duZmQDOt9PJfoqSO6FvVaqfQGhZvH0O9w055+sxJRLWfHuwv
         BTNtHrccyiYEO5U37EjC6h3AnbgNeEjWpUu3W9Tphl0yTlHttxZg11VBNsfp1DwUEcbN
         qpXw==
X-Forwarded-Encrypted: i=1; AKwUvBwXXUqOJXidNa25U4vsbZfzzXeRk7HnUjxVlHvY1gPY3QphUiD3k8tzr8DCUMHT+n77O1pWK9oNgDd8Kmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOO9x0X5tEOBqwpL4gq8KzfVD/dF/ub8NlVHlJ2VMkq8gEdPPD
	alioH8jP15kDk3Mrcu5B3ETWiJUmAv9hpe2ehZLfLkmEuylV+SKlWY2hE+7fnTttcUJ6QeGqAVl
	eQCHSMcUkAnxkxF5IZRL3EsLmQk+D0uEvIF8pGwToWg==
X-Gm-Gg: AYBFou3vkQwo41ETDSRKOxtOWnptRKwdUnCvjjZFUxMxG4g9coRiluKWkz57YH5+TC7
	YQJQQ16o3osEJdFr8h5ekZoFCFU9RtWb7XIyjLJRh94xuxwesjVVYRPqL+rcqKma5QE/Y4CB6WG
	jT2CiFdT/evohJDt9O6pAskZPsmzfCfuXRy94LlI0hdLNuT8caGz1iG6NYVVr5wQSDjPDPPmEgy
	3IwKmqCWCV7JMj0LyvdgygPZIWHAvvwTCgO0jnDxSnU8XDuToG6grkUdICEGcuH7qHAueJXwRsE
	Fl1JPpQOnOj1yU4jNlLIonqcZbZlK1lFS5wZFQl0TxfUzyaBtlLHd05o32sl+VrWfJj7gZtHHjD
	lkhRaDYiK0q4=
X-Received: by 2002:a17:907:944a:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c419e648fffmr481909366b.9.1792379455793; Sun, 18 Oct 2026
 20:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-5-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-5-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 00:10:43 -0300
X-Gm-Features: AclHuK8ySw8DCBHhhAXHU-iuM8DPw-3buzw6PIjkn5KwANrPKe7QCILiCb_PGDU
Message-ID: <CAJq09z7M9xANZ2cfYnGgi0VqGE6ppN-efKKMdN8CCXrhdN9VPg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/8] net: ieee8021q: add tt_to_pcp()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> +int ieee8021q_tt_to_pcp(enum ieee8021q_traffic_type tt)
> +{
> +       switch (tt) {
> +       case IEEE8021Q_TT_BK:
> +               return 1;
> +       case IEEE8021Q_TT_BE:
> +               return 0;
> +       case IEEE8021Q_TT_EE:
> +               return 2;
> +       case IEEE8021Q_TT_CA:
> +               return 3;
> +       case IEEE8021Q_TT_VI:
> +               return 4;
> +       case IEEE8021Q_TT_VO:
> +               return 5;
> +       case IEEE8021Q_TT_IC:
> +               return 6;
> +       case IEEE8021Q_TT_NC:
> +               return 7;
> +       case IEEE8021Q_TT_MAX:
> +               break;
> +       }
> +
> +       return -EINVAL;
> +}

Same comment here as on the previous helper: a lookup table would keep
both functions consistent and save about ~30 lines of code.

Best regards,

Luiz
