Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601723;
	b=x09VDkPOIHcMVhRl7FW7707aFlZDWfuR5RQwknRwM7Hmv1ax04aJUbENmhltxsalBovf
	 qqoQ7PTVjaSGuPToWyupUvyfxmDTfQjt/Zmj/7er51pvxx47W4K00ojLhuLdbZ0JZG8mS
	 zNYVeDPAG3P6tUlizW02gcZ0bfyYdYLnFsGa4ltCWBvcL/SBP48rZxU14n4XtQsGrpIvS
	 Wn/zENBng8G4WvvO1v1GfcU5EAciUyRY/6IdwVQZgooGaC72tLI3Ap9GQH4FR/OenW9p9
	 lYUTR8TgqYh6vULgLS7nH9AyEiuGZkdaR+JZKdPl3eiq1HYishN6FJgo0rP/vYuFHnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
	b=vjbnBZZeMq8eUinIBm4gNTKq0u3svi8ELpJ2UK3sIU2vmW0ajtMdCwPH0RGewrzmXE3H
	 gKPndjEgdlmsUtEYFqXgjPgq0TCccfjDLSxJGvRW9OT5+vdRRito91xvxL6M/nnCk1gjh
	 QkkXaHV0IKie6T9k8As8v39uSSWrk107ndESXQRrA+qun8JKSxo2TxXNQpfwiWfC7QQVm
	 um+noTCyThlsq46FxSlFCobcUJXZAdRs5Mr0/5PSSCybDkakMMjiGFkh1l6GfHqzYl4VW
	 jb52LWAR3W0iGY/TdaIZUjJPzlgk4CXUnq/V8mj+BO4Ho1D1In9esFI0SNu3yYzRB5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc75HuV0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59532606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59532606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc75HuV0
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so2042821fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601722; cv=none;
        d=google.com; s=arc-20260327;
        b=b4C0GWUE4tTCW+0dnkP4fZXnfUc+SjD/ipPY1OxY5uRl6jVxuyHpMK5rrsm0kpQORF
         JOcA8sZImLldZp7oBJyhm8cvyu1hdCPerCUd2EYO4cO+jcse2bVhWDm89HHZTxTvyiii
         h+RH9mz8rQrNDDOlRjSVz0YLQGdx5V4KQF3mkDL3ZWTspY8viMFMCd46z5hgMrJTPGs+
         plpALPZwPhrP/jZN7GW3HRzR4LjFU1iJUxR8AdicU9eqzSimKTvKcslF9BwI5fSBVUpG
         m3/xz6qqQ7h1J+pxLWo/+uYOTNozXy4zlmyE7Peojut040hH5QmPfh1Zkxci44LRNhJn
         GNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        fh=Aw4SIkcwFZbcSGFUzJt7WIkOki5c2BjMPbgVt+6VlAo=;
        b=L8u47YVayM+qZUszes7jx2Ex3W41ELG2jxcYx9OyVOriXw7yGf59A0UYhb+B4LBt6N
         0ls8WwIBPstazSH8DnFqgakI3nhs4OxT0dp4eL4lulDR1EkBKqfZt5kGm6eaGOHpQakm
         EsFQehtB5WcDyZOfAPBOax3G58HLIVxw5gtP71ONhNo7Q2qIvvKk0TbFdRashzjr92WA
         js9rz6Hf3hbJa+jUO2JP8RbEfz+myzfkrrPOVbYBVcKuxJ8OX8gFmCWq8xI2mJc5Mg+M
         j73XDwyqqRqLN38sCFGWXg5/tJUUCDynIABlIw5xXzJ2FNKRzVtjvfjGiEkUrW9HKnzS
         +OZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601722; x=1795206522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        b=qc75HuV0aFNn8AOe4S6nRDBQ+CCOn3Jle9ywaejlVrtfL6XAzf5jZQkW2UiCLHTVX7
         30LuPYMpW2csCZMf9ebs+TILoIhZWNwTCyoHE+cNgbsWHAOvi+8xhF9ckTu5+iAvmNcD
         yyPsI/SCxtLKBpMgAwhW6PsC6qkr4nSxjLRgasa0P9Yy1FjwmdVLCLjEDP0d2XHF66Sz
         ZUqm+dXmfeS7JcIrLaycIXAoYHvIXeL4zlSG6hFQ+ZaAiPXCbbD+GSYW/zYPCvczhuGj
         bBpscQSwFGfdEN2ojeE2CIqfa2R2sPIx6rWrmLydpfIcvgmegSUeoL6PtuR0bmXPJpJa
         TB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601722; x=1795206522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        b=UXHJmOPaSvfNV7529UTDjhcCD8aL+pxIrt+tv1YIfsqXrxYAMDX/5M7lg12QNknrsO
         3ZujPNVBrjfywKKVk5Q5/4mhJ7rzEw1NY9GC8DAsCEOYMwjZwt27pB9MIWxYeYUTz0rJ
         JE1752iGMFfyjTZU/uqOqrputwlg5wFIZbQi5ApUZNUJFavuVpZdj1qWyODRkC1dOc5J
         +c0fom8XT1Jx2OgAxBLXjqim/DZE3ZZ5mnNW/as0USRhwilTh24AdQ4t7jOgD7xlSaM2
         9ZK42Bq6hqBrV9eX1ShwvaEN1o9LqMjiUcAtwkTpF+olz0eibVtk1vJ0aSahP4g7h4E1
         Xh3g==
X-Forwarded-Encrypted: i=1; AL+hErGFiHw0Jb9qdkqZcl/QpQVYMWthNQ3DQjehr8T5nBGhaUlCdjMQr43dT2ynKVgkoMGbP36lrsmHHJPuqlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bIgOcfBscI4n7ucLHI1CHHIR/9m1Y8oYf+hB8Hyq9B27BlM6z
	0H4GJdOso7/GgAlRfo/d5MLeXP/HkUHEsWNSfWaoEqCtMiBhkF3xwpfBqb3KAKud1LVDRpySfX4
	OdH7TLAgDl8oAbGVqti5O0DJCiKn+2INfukpiLlKj7w==
X-Gm-Gg: AYBFou35fEX2VraEqvfpafsykyEww4O05japkHNrA8Dcvo8XRN28llHfrDsHAT+hoED
	NxKGerjQWAP4PfGBnbc0Eeo2fzsLJ69XMS/Ja8EaH4H0Vm26WmLLlWuswRSKa8mUpwA1uLWmSTk
	YhxkXkbcxhJxftxMGIv9TC5TzQVhmxcgeKp9EqNXf0LB3a5VU3e18rIJ8h1Lrjp0fO9N/5be9lX
	pROJNlxUoCV6YZryrRCdICXEyi8/y5ELW829f4qYFeXtZkPv8IIun0/XbvG4FA3kSeaZWZbOtsP
	+UAh0KDmfur2V0WHsbCfrpgwtX/KixgpNzM6Cmf2Hw6yZ69Zb0EZPFyzAsmAEqgvHIpw6evOQYi
	G1OHsbRhHsY2Dg3B5ZrKUmOAswwmUawiu7oR+wlk0abs6MusG8qgt8C54f+Zu5MAdtcnKSq7S
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1725091e87.1.1794601721562; Fri, 13 Nov 2026
 12:28:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
In-Reply-To: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:28:30 -0800
X-Gm-Features: AclHuK97FgaYb-XOEawk8OrUG6zWN4m0UqFKg3z6sSaJjcuTRTUrE7QE_VziCKg
Message-ID: <CAEy9hNUybxBFWQuHTjtdKWsTScXzCo9wtOjNe-FV1GnDcs6LMA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] media: Add a V4L2 HEVC stateless encode uAPI
 and helpers
To: aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Please don't review this series: it depends on my H.264 follow-ups RFC,
which I have dropped, and it should have been a summary, as Paul asked
there. The two ideas in it:

- References: each picture lists its reference pictures as OUTPUT
  buffer timestamps, marked used and/or long-term. The kernel codes the
  RPS and builds the reference lists from that.
- A read-only feedback control returns the QP, the resolved lists and
  hardware statistics with each request.

It ran on one encoder only (Rockchip VEPU580).

Arun
