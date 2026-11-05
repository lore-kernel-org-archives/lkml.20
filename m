Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839538;
	b=BA+R67iCHh6Q0a3HQClqQ0zX0uFbOEjUbJOY/45/yaRqTbdZFLn2Ij1GZqKzTuggCKJA
	 4yvSh7tC6fmDmYSAzQj8IRMRdvchFRlmVAt/NxIhrI//cUvYovks//SUMrS/0LTOV24CG
	 jRe0VoyePyOEI7vmWMryQB2X2KaNWqJM882boCigTtsPpUgiSOLRcgN2kguj0NjlTnkyP
	 pUT3FYbfhYHcUWEtMk4ZmRMPitk6LJTBDAoF7ZEOX5Y1A82hxoI+U8kzEh+MyMn55EfI3
	 uN0wnh99lNAbSOTtX0L/Rp1nWPk0JsvHQPkZ6jTysVUqYSqOWOXQXRcKGJm1A9+nseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839538;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
	b=rTgj00Ocmb/jD7ly7mUuPUqF5C9eWqORh93q4AREM2mogtsIDE+4U01r65GqJFJEjrdF
	 uUsnEIegJqDce+J2Nol9/SExRINUbdvcUxp/pgSk7MTapXdZf0miqbb9ZW8yt4KRn4aLs
	 MpPv2oZtVm5kA5/RAzGqB2wLWv56NKKSD9w0Iy7XQ+DGA58gqsrJHiNVO7bHq2+yuBY2c
	 Qha4HxFjpVtmB7yPlQQuiM9HC5BJJkInVMNaKoY7FS5y9/3ssHtRnc59186zmMBzZA7u6
	 Q8gLkFSQvOuXPeSWMBpIk0XmdLivj4zn9yZ5aPdno7FbWlacGi5hmLwSoAa5pjc3Hvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ADC606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37ADC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso654094a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839537; x=1794444337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
        b=a9gLcIy05xGzUD1dUjzoNAnKcnD4ANbDSogyG8zufKyrNNxRWl6N7SybB2WkCB077A
         R3VQaruvX9Y0bwXyriWLaeTo3itwKHCx6pFmjXL4DV4GLXMoUjEpzpLMf3M8R5pHQi0A
         U3fmeoLKQcRsW0oKTVoX3np6nFzAUj5ZkIrccS6a7Nl3VrEDnCdHkM+lESU/TT3krrhU
         taArxngdTWcInoaCyoGIZfaXwsKhiTTt0CuCSP/lDSkL2IEO80zCFmKYNyUKvJsrtL9T
         ddR43C8tRf8FfzLBA5Uq7cuD4l3sbnz1BbMNKRBEsid527naabKAv6qh0atr3hnyn/eQ
         I9Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzJpQ3rBg+6rctfKjjit3ANQgArrMMLhQ5eycHaWnalxQ455jdjUqEh6OCgxaUNlV36ygst0jpUhyu9VM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F40lCVIW4yBMMljjeyh4JMdPZstUncaLGuH4qfcf01YFucfLv
	LpMNmra9JCx8GOMmo1mnaw4RoXl8ntILYmbUk2g6bODZgOKC7DJPYUzqMpMa/5SN
X-Gm-Gg: AYBFou0a1Q+XS4k+WYFvBcF46q1IQrQTjjEhWOjVu2HG4lMSDC7E+RkV+s5Q/2iFVWN
	KU1p5/4Il8M4yK1i/IJH7QKdJMO3czVeNdEJcqMaEmAAMOokUC7C3dKPuN6Qpm6LTwKa5DrUUhy
	XYwe9a1vH5JP/XK7FEm3g3XUwttpEs1rSONyEUdx9zm8hunNZhGTDUoj5cJQHw0/5p2PwNUL7cB
	a3ZH9zGT0a9aZ/KX4f4DNNjTy6/LUtrHkk5uNHuptntehxLaILxcRz9SvX1Y01DOYubLfKgIQtd
	tT4hkUvPlvf3s8w4Z5XP1gUaT5K68FrgRDoNaGzCebj+KbXHVAjdj5Oq2IhdbnaG2ald6JXTlSR
	ojnTYoLi8y6SwUa9pZAUBPRFP/NF04WEcBiVHi597mOG7sq0YWXxGBCQeCx7VUfY/sEBQZjXXlr
	GYP9U4a15uj+DQs8uG/vVA4NOQfOC+MQXLDw6cU3nYEYCISnUJQLfaocmamXjuejIBrNhuoNlTx
	5DqJonkazlBITYRnkle0xjaJawncoy1M5n70fRGZBEbD3QkK0HIl4d2EMUD250YivzGD2b2VfLg
	cgOJX3AiFjjB8cgGL0Hi/Axuq5pzeEi2gaFXRNrkN9sZQ+O/8+rqXAg9/rAUccLoQ09H3Q347ur
	x2qoI9s504ihBMY+2bVOlE+NNAlTt7hCgrBqoD0mWM20=
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr15507163a91.8.1793839537563;
        Wed, 04 Nov 2026 16:45:37 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm1172190a91.13.2026.11.04.16.45.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:45:37 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3219033eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:45:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByMz8BJh8KTiEDIWQgaVLzbG3U60Mk/EaA9kZD2SokqA30s/bfcVlNt/V/6OkDJkrIJ/pH7C25tuC/736E=@vger.kernel.org
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id
 5a478bee46e88-36a423b3556mr44653586eec.21.1793839536384; Wed, 04 Nov 2026
 16:45:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev> <20261104-enlighten-handling-a309345b229a@spud>
In-Reply-To: <20261104-enlighten-handling-a309345b229a@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:45:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
X-Gm-Features: AclHuK9jO8Qr2MXvkxwK5NuEISMbX4skXJyK2Kf-3m6ima855rFUsEPggdBlzRI
Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>
> Same format should be used for both of these.

Will do: v2 will put both under allOf.
