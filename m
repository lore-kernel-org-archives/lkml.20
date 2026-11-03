Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723411;
	b=tWbffLtQnhb8A11zK2Trdg3G6x2uyvTW+5HUC22/94LWYqLWsG/uYjxkNtGJMCFPEYxT
	 V8ev5UDQ0qRXNdVaKrd8CalOUJOp0Wr3zXrdKIvVaFkWfDtJxdWQW+hMIvyYy/+lTvlLO
	 8A1DPJ+eTbnSg6TYG8zGiitTQ6+kDywrpj0ccBJtwurYSA44oGTSfatej/zzbzMuh56ak
	 ESu6nYTpkyrGzWZEm5NQUsPZEDRxVX6SEnv9t4Qr90sP7CU7bVx7u2cywzAOO4UWtBhJo
	 5mHe7z+XOPLHmNPRD6W38JeZiO2fPqFbce9nA2og2YgETYXFIcyjKHqID+9LhYmpCCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723411;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
	b=FTffOcBGT1XqAqRS46iMS8wdMG5pN/y22y2ixnX4ZoYn/l8W6ZzdnzyfvBiBcN8dn1tZ
	 LwIzH4hOl2JpBwVzN5ffNQrJ3b8JMPMtKrcviodD/gKTWUtrMx7SWT6Do05omsK8MrHcL
	 RafRYUHRnp9XLtImIeOOnski12zXujdqvyfK67VbwgieDavI2T1+7skQg+fM40/ZpiLbC
	 PxpdprV3xqdofD7kCVHJFXRQ15Bqm/aDAZcPvEAGbOIchZA10JY56kQNz2+2/saw3duF4
	 4vKFfxy1LZ9n5prdcspzgHd2s4DL8OB/Xe2o4PZuBg4Mi6q5XKQe2g8eaIk3eltHWPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75F606D814
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C75F606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679a2297c55so4725222d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723410; x=1794328210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
        b=tbFUg6mUwwnwS6/CjROuMYjQnxpepC/PHJOL0MG1AsZ8UshfED2889TyPiFZ+fND1G
         hiixbGmH/dWacFG01TSBiATUss9YvqaZZ+VLuZwMQyd89WcThF19NrHwfPmpK9d7+O3h
         PRF+RmtUtGQeYYij0GSZtk6LdWrDqTBXw3q9A8fuHsVXKhHJG9lgfvDfkwbuhlaXorVj
         +ipvX0coFmApVlhBM22FejFK72smgBmRrZAWrloLdbx4NQvHOhnIOi2X4N8EEPfoIeam
         6N32sYZQju7zJJ65TNN58CXOhfaa4BETQlEi7rwbNq8EjV3Ztoz8m0+JPsdIMBPAopbY
         TjcQ==
X-Forwarded-Encrypted: i=1; AKwUvBybfBZSl60GYv0HdiUHihthStc28dNjCm1Dp4Y0lMYo0ngCPxyy5t5f4W2bAZpHRSZlZ79uCgRRBUbwG+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QVJdmX4OKnMGXEIOpWMQEWwrUpZxUPBpe8w5lQmIUUwQ9bRsB
	i9NDwd0QOgXqUSjYCxRaMVHHNX/C15dMwio37BXnETu6PLBIU4YpI+YjuUuLnsMFSAs=
X-Gm-Gg: AYBFou3jnV/+q6onXOn90BM4vIyD74GyL5ITHpxT45Kzm3MrA8BSPUaX+E1WVR4aUeu
	wuVwYDfyWTAsaEBb6FQziTuiFkoP8HVAq1SEZTZcGmOvuDIaOkygKI+n4iGvozYzjYgsKGJTncQ
	dop1eCJPKC0j3VXgQkh7WeSXoeC38nLyqsa3IOj/ZYwXnWcPOH6ONgiscUnbiLPJpQ2ZkzwisDp
	lBzjszo79/ISs9eKfHoxE4FymPJjuve4Ns5zQ1qeTY6PzWJZ1v96hwmzn/FqVCR3uV9ZwJa7BD0
	mHjEFHAFGol6n5Z9TtxOfyca5ndVS7W3hsGyymn2MsHoMteSNg4mZz1Rr/3A4Ye4jgXjSFAYuzo
	IFNsCu5kHFiKHJrwGgbCIf16HDGi6vX491r22ICcLMLlA1z7daEac+FM44pkCNppzFQgHjiFOlm
	KS1wnO7mK6dIrgI5Cv9Q2OZ6cnhQtW1qeqmkrYxjY8/XDLJWWEvFBMl6NrO0nUEPs3hdPslPzn5
	CUhUiKePwMHYWOxVdSdtNdxxbjFTRw5oPbLkOHYpe7lqhacbmJ9aTpcKR3CGhfDjsxR0kss9qPh
	nxFPcsyE16CDhrbqETvh57dBMoB/M8N5zHr+Xykf+h2E3zW+75VZZ+OTd9YilnylGO3XVwnRjVL
	gpY2XqbkgNqxVZoRj
X-Received: by 2002:a05:690e:4006:b0:67b:ea15:ece8 with SMTP id 956f58d0204a3-67bea15f0a5mr222845d50.101.1793723409489;
        Tue, 03 Nov 2026 08:30:09 -0800 (PST)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com. [74.125.224.50])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf26d91asm7314740d50.5.2026.11.03.08.30.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:30:08 -0800 (PST)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67a2bd0c297so3700986d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:30:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz+S9qwP763b/0EODIesqSdXP7pKkyp+9mkZzbLx2P8x8wUBgqw8g5Ah8iUewAn2aIlKjGXcNzthyXzg4s=@vger.kernel.org
X-Received: by 2002:a05:690e:4810:b0:67b:9051:e32a with SMTP id
 956f58d0204a3-67ba50e0ademr6918680d50.93.1793723407281; Tue, 03 Nov 2026
 08:30:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
In-Reply-To: <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
X-Gm-Features: AclHuK9mStYKxlMFWLlexMhXND4q5zYuU5C_HQS0PBE7THFUZlCXo6CxCqTl6Rk
Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> Is 0 possible with the hardware? If so, i would accept it.
Yes, 0 is the delay line switched off. v5 accepts it, and the T7 joins
the existing G12A list in the binding instead of carrying its own.

>
>    Andrew
