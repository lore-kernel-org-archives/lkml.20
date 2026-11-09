Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794190984;
	b=C49IN8r2CndofJ1ejmZQQd9INJKSS2CdwWNMLXYnDjp1efir4kjbJxeL0irIwLYXRnKY
	 wK6/wtQ1cSAiUNNg7/GHvTKHC8XQKdjirWg2rBDecmHyamZizfnA4qQUuC7kUj453l/qh
	 uR1pBGiKwiF2x1Om/dJ/9qoh0anLd0qMTV1RMWlPoNiGam2LP9eqsIS3VoGyCMo7upW7l
	 NuW/yCo0NIMiiGSqYYhwIACuK8Af+LUKcOu/U0wCX1rSgh8DEJ2NpfvWPX/m1upfTK3Mw
	 hkZLmhAapomfxX/3wlYaydqLqbpEbz11OIIcoFzpWiIcVrMuIVs4XR2j1oReTvDwbmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
	b=vXmA4Pa+gVMGg5r53tvBL0bvS7JLf+SBXqTADKKEltYQqUzS4pGb693isJcbOWXUI9HW
	 lk8mBwTGxY+1gbm30Vdvcn8vsA4z/mbv6R0v7a4PZEtRhwR1GoQr+QHtF1zWK8hOJFSH6
	 mV8KET3b3wuhE4M/tafRqPZgEaGRmlInq/QoQ+Y6AC50qkz5tlE5puLdFSy1So2TxOjCJ
	 va53QBfTcmP3zQPrhnOS4gaHLmbyBxqd2uBdz6121g5HQG4hr6GhZ5OfKIVu8XPmQOLxN
	 EG2KFfJpV237luP62CNhjFBywhVIcPyLry9SZ6pxIIasPnAxFnpDhdksKJUdsmnHt3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B40606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCMkFxKX
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso185275a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190984; cv=none;
        d=google.com; s=arc-20260327;
        b=fl/JzTeuiEaiR/vNKY3rAzVjuwPdymCvxlZoxxAMx0LCxdUAmZQ+SeVC8bOI3jHDRh
         yi7UG6yJ3YgT7ACdHoHn2YyJX9HHUMO2WyFrk8fI+AhFN3tHkeEFCeI+WWKmzIO7SQbp
         Py3gNUf3/7ez9LQO8K8Xcwxd2r9zxDUJRTcYJJegnJrLuseKMZBQ2jvTgNzRIph/ch1r
         SgL7Qb124xS3GqhL00e6dG4xx4B2+xyk8ga6gDehL4aBUgEzrlrnDMCh4X7rqoVMSzdh
         8D7NuElSFijlnRvc8E7vuk49qIAsQUJ+YrY6LrF2Y+DPE4THiPgC9eXOmTIyXiX00kGT
         49gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        fh=J9Wb/JWX0lcFJT4/wOecki6w2X5X4DUKgw1mVaE7xxQ=;
        b=Be0DfiSpsW73TuHMp/Ti72rZL71Psa5PD8cTkqoonaMbETqlQ/sYlRquNfBM0cDB+/
         w0NARSdkL9UIDip1sqRNnU8m5NwPfKiQVXdSZSnupURHeStid+fF/vh/0sgD5dAso3o5
         ul3lXxRMVzLt//2u9iIlqxZ9VSqnm5nP72TCuXwvTLZkI/lAi5jDOSUYFT+2JdIYE+wL
         TMiqdVPPWvcUqSUG416z9wom7WamXrUrRRScLBsylnf+DihPRcNz3jRe+vvGKV5hueP2
         TJRkI38rEDXV5ogUsSTjFc1uX/DcaGphuiapO7J+w8HSIZGV4OhFb0RatWM0f3duZZps
         hf/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794190984; x=1794795784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=BCMkFxKXZilOqS5qGGm3zfzewgjNuwk+ApN5Tn6q039iGQMx1tnYeShFlkP5g0aptX
         mtRlkVraq2DkEaDbMUdpfZlR4BXbFSXTkySnLKRQ/I2NTWggzuAcHySDasGW70gDDyXC
         Aqo2aKPslSKIN5QMxdI8XFw4SYLYSEM01xtE7ZmKHWPG4sx+He6tS5xMNihqgp0cYgwM
         w3h2wLk8afqVpScQ//Tb2pAJlIhsDzOiRCpNTon0U8VjNvzGLDtg/ma9pJ3HLTKB17VO
         m8GaGRFacLDudVzNYAglpjAhNc354xwCpvv36Beh6ZTSvi+wbXTbC0lz60vF62ALlC0w
         UmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190984; x=1794795784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=0RB72j5bo1kEZ1L6jf7VRHBnFkoq7hD4ZPsVz76thoSxLRoa7vTZF/Ac80MFZ+ZFTV
         NEgb9PRCNJoHTJ+xHFbgtgF8hasNXtoslcQHWyx40hu2g/78Hs2kadI3kX2iV7WU6/Bx
         7FcPRbQTGW2TpHnDMUJQ4KZq8wv7zkCmnvEu87hR3h2n2/YjxNZq7/XL+uQPYtF5B2A6
         z6qJr+sny7iAh1CyNXOnrn09TzHq2NckXbrRI+eeKZ0aLVvKPZ70WVk+6X5QMOQ46GHI
         qyIbsIOPjIAm2mW/BOYpvyq07UkfYrWzBlrYJ7nuJyCz0h2MuS0a1+K/pTDuIlUhWJui
         VtmQ==
X-Forwarded-Encrypted: i=1; AL+hErGcYYvYlnWdVNXV+DOV+MTYIVcZ1UzApzo1Fswkj+xOh95c6veINyvg5BlVelGqX4jvtH2IePwpE6kN1jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Ukxj+/QwWAzkkl31133lqSSGBf0zl1D7EGa/JeItyVD8FmLV
	mx1NMRYYkWnn7gLu2M83c3bp++BmAY8XNCbDFXogS/Qq/BVpKuTdMapP7ovElGRveEb+bzGXZwl
	Mc4ZWEs6Vyd8VkBs2x82GziMlTNpz4qE=
X-Gm-Gg: AYBFou1CsjIkQ4MHdLSuR7qxUGOfjP1ifXiH8phRmbGtyufj/LoNUR2mvQxhYqbmARb
	It6eqFRUP/v8x/ngmO2Kb09tCQRfqIuRfUs9U8GTA31FUZajF+iS2UGZfihzLAKkCwOcX+dOYCX
	DEKhEP9D333AlUPIsRZ5ZPQV9+Oa9+Krg5uc/BqImR1Mo9kOF6H2AFktXEgSgGauh2rG/vzoRih
	fCytRFiKnqenfn/NjBdqjjAFlvJs4tyYbyxYFVsl2yxzctdpnelOBWmyZyu8H2EmUTuj3XiewHA
	HC37M7smvC4in2Z6gOI6drHYRYYuZV4o03AMoxGlEej3XP/8JPDEbGzqu+GJ3TwDz+mdQ2+yIl5
	4Q4P8kmK1eLEuo6tajSCK+XLVhN73I+/Od8WZy/5QH56SEDzYy7Bj9qzlNg==
X-Received: by 2002:a17:90b:4d07:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b12d488e88mr1529576a91.20.1794190983895; Sun, 08 Nov 2026
 18:23:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
In-Reply-To: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 10:22:31 +0800
X-Gm-Features: AclHuK-so4ygy7ZQpiwiv8L7y68F48OdPR-9-HT6EDLnbJ3aW8Kx7LpzrpeA0Ho
Message-ID: <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HiFi4 DSP provides a separate reset control for its debug logic.
> > Keep this reset deasserted so that an external debug agent can access
> > the DSP and perform debug operations.
> >
> > Also require the reset properties for the i.MX8ULP HiFi4 DSP.
>
> That's ABI break without explanation.
>

The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This series
adds the DSP node for the first time, so there should be no existing upstre=
am
DT relying on this compatible without the reset properties.

I will add this explanation to the commit message.

Best regards
Shengjiu Wang
