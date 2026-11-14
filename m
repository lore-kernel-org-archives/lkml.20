Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794618820;
	b=tvwf7lAGdanjwZFnj51qgk1BF58EtqxZ7e/DZ05itpB6CN74WKuAiYINk2Z5TcBfAalu
	 5sK/9VQW4C7hTuIQ4Jjbyvcbl/gx2D32tV2LQnvQ+zOqd1+vi6tPnxo8Uj71Csmgpn9jo
	 Hh3vvz3KcIXDtHb75Azm2IVNHLvxCv0HnY7JYo+aeZQ/4hdseVIW10eCXzVQ43pr04IkA
	 9qqfTvg98BCZ/C7hpjrwdE60WW4gZ79zNQhPGqAAI003tIBM95fp1SXfS6KGpcYmZ3FZ8
	 TfXFyEqHmM7EpPGhSvkPjYDvUsxrk3aHbZOpMGg0gQ1OtFWdpql+btcY8Qr8U9LXSMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
	b=E9o/QkelneMP/VBuuLPPbgNMKi9ly4ahIS9FUK0SlYI3gaKYX2v4zIFbH28JinG9iR8c
	 PPppLW/gpOF1xtQhgB+tKMynKH3cnfgya5gIcbBQIvE0A1R3Awi0dtKjQX+1PVVvdoZHT
	 GOCVlbVcLrWKQAoAw0q0VVkKPH2TtVPCWrCxEWdYMsVKeAtFy4DpbKH6yaqUq4W7d43Ye
	 86ElskaNvCHMfHDFcv/VvRj1+NAvdf3W7lA2qxSgAcIHph+gpiaZHBhsieQmAsq0Vk878
	 Lo9jQtVgK+AbZYBRa+04T8Q3e+svvEDJi6tb23w5j4ykeb3l0CwzjUi/dPriPnJpaBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKQO1Jtr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB1606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BB1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKQO1Jtr
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so2122421fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794618818; cv=none;
        d=google.com; s=arc-20260327;
        b=hH0BTKHMOrGZjeZg88/25n4NrncWirKP1jwFCb0lNjyUfiZuWRfbEazCUCBvnnscEf
         htxcW2fHJRpWL4ryq19jbWElZjUtSpn6Iv08Dy3GNFbMZcEtB11Us6Hcn9l3LgQVo6pk
         LL8S9X1L68mG5QN4yLsGnkt/okRLEDfe/H3t28BtsAUmHEyVhGEJBYXYlswupfwrUxX8
         Hl/bxv9umMGHdPoWKg2sQ+/s2OpcGbFmNnvuDj0e1Pr2mkifWgExgz/fN2aJzoDRmwcS
         YqyYiEnZ9bFMTnvJEYrewkTxR454DZdFBQoox17nIW3XbjvyOhEsHtsSJDzuH8NJoftC
         fzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        fh=tFHS3qyp225S/eWViqzoHIRGSp54Vtr/iNuojre8zGE=;
        b=qz/cG3B99ujvUAgo1Ck8VESaqJGh3+DZm1/hBHjmRjXV16Cp9jYZPHaqMki0IuR+ca
         HPJC8OxSIROo2ZnhC8g9zlIIeGotLze79/6jsc+MAbKhRUJRk7w62Fji+liRUOTbCX0b
         Ef3MEvAR55/b/JPrhZJDBsMnFzZH9Rk7DaNOVMKxDP8eYxDMmMWzdVyUDnmI3x5mjzB5
         4ptTiRhDWQdONdzjR5iLXMA4ZVwV8yW2LNuQaP1qocLMYkfIyUXVIrznI/k+8nYIUSo6
         leaz8WnVRsr5cXrZ/U1t9RtrYGG/J8L5/c8sgOTRwvIWMof0yp6tYLXw/E7gUI0ijVKT
         c5PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794618818; x=1795223618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=oKQO1JtrElFjvMtBC5P6k4rRBbO6GLmIU7F2eRl4LZPlgxHmY9EjG5O4Z/Jc6Qf3HD
         iPmZROIV6txd1l5e5IR5aNSYLrnioo4jpGj25JfuzJTIvv+WQrKdzbLYXg5i4ogddvph
         hHEEoUDaZx54JzFAG59XBPLl4baO34iNRBWfjr9YsvtIbmxvf8qy6BWmunHfu+KixTAv
         JmZQIZ6E0cz4EllKe6AYgvR4KFSflkkMXSEu+56SYKrPDEGj9JPyNVtRlm3+D5aLH0tT
         s3xPdAy2rFsTObvTcwnSyJRQM/S6t8RajpVXaVcfrdRlwoK9WQ/qZLOkN+rGMW/8tNDw
         oZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618818; x=1795223618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRnwY06Mr4WaxMQBOxox7fUWk47wPCvPr48cEnpqDt4=;
        b=q+7JsUTllFPDjDNMwyryZfpQ+k36/tw241h7yt3EkZclFCYjEfk30lAWDqT4FXBqHj
         0SG6RQg7LMHxNES6MO9Oi6v7joyACUo+fAa9nUkco8fhcdLbJUvZBPCqY0hgC6kYzkTi
         GRuTo8AurKSkFSUE63NdHBqRVqfogiEtolcaFTt/cJudyVHJyQrVGRXCOmKZO+0d7UBj
         gIfCPJpZ5kK0deY4kn1qDQvOsp1CWHeT5yOPDh5McuYi1B46xcQewXDMCJVg0/mE1kR8
         NA9obaUaYhspfX1EayuSR2qj9PKOCDdedQBERz7Ma1QYn/w9bZItADksowcewVE/NHQq
         VqTw==
X-Forwarded-Encrypted: i=1; AL+hErHI8REY5OANiEroQWNeFResyszdEpRcvbiQMVlY1QKiUWhKgsM0Pcy9D9gOo50m7s6O5ddH4QXOrzdN26c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s5MEjeY1Wt7Zvz+zgA9Wvub5eSdaLe3Zru3gCvwrHcRKXPPQR
	JLucOST7s3x7bhTbjab6xxuU9+Af6qtxKOalKgU9VLFfxx+EJZhZfeWDcm23EHJw76MBI02pHfC
	9ClIbBe4oWURIBbbcBWP3DuqulLKVJeg=
X-Gm-Gg: AYBFou1maxUZsz6FNq0W0DJQg0LUFeJqkF6Chq+dOUQuSwcSc02pgMklJXZF/c0LHSy
	Xgo7K2TyMtW8MbjTjIhcV1BOZIxJAnDx2pelsFxODhXWOa45M0IlyWB4DtqHuyt3Gm0YH2o4n3N
	6g8jUJGggkmT3bEcGngKHOm/2regOP7MDh6hh1Bzknp87FYnCpjFGQ9xI7Y1+IJ8Lo76XZ0/MgY
	rZ35yZ6dBzuDlJV/9rFC/VhCUAe1IpcdIIU5/bJRMYXpJlEVXGb46+UPCDUm1I0Tm47svxPrc7R
	QQ8XFhN+cXlZqtd26Uy/ozPUmB6zw4hqp609Z5/BnTaUM71ylABPB0q9XW0lNvFoCL5oYv6OD8K
	xlv33Mu/ZfGm0XBrt3kri34d2lhZsXcmiW7kR2GRd1GD+DsiApL7zecl3i5Sy+7gehOUW/tA=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr1887902e87.0.1794618818343; Fri, 13 Nov 2026
 17:13:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com> <179461167656.590303.12402709871115244251.b4-review@b4>
In-Reply-To: <179461167656.590303.12402709871115244251.b4-review@b4>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 17:13:27 -0800
X-Gm-Features: AclHuK_CV3TuQGipcbjy18QP_8RBQLDadnLrh6ZniBLdvP-qmCmNyU7dCRkLAeM
Message-ID: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This new compatible needs a corresponding DT binding update.

The binding already has it: allwinner,sun6i-a31-spi.yaml lists
"allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
and sun50i-h616.dtsi uses that pair. The patch only makes the driver
match the specific compatible before the fallback.

I'll say so in the commit message if a v2 is needed.

Arun
