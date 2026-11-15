Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765377;
	b=gkiMUBp23/Bvj9ptveMm2YgahO85tHk9YvIjv0gkFOzg9Xos9xM5gsIVWCxpqD1Jomij
	 QpTK84UWqFSnOvIobeGo1uLBBGT7cpZ8GSZTaYyfXN2hmmeAGBMFzbD97yLlizQ/TzSsH
	 vQCjpORfOr6JIePIdnMnM+w7kobGfTk5sTrd9m2eDSMonewN4MKbaYy9psiHTBHoEEXtg
	 rUzk1Twe8YZf4K41EpSwKgIdDcORJBNUsQ3SMxG4lo4Oo4OSa2jF89rX0oeuKhJfERJkC
	 JK6f02uCJyGZi6FdDzbcW/6ND60/euxrP2xCZoCHtIeP7BEbaWvGNHWW/wfawYb1SEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
	b=zL2C+IwQqykqCxjuw2JjINwVEPjkFrSYv3UhoeRnriooCZRQSf48l0S3XuK8Ep+WSJUE
	 TJWdepvvrbUkS+MzRruNakt6cTzlKAwtZtTO2Sht6Bp7ZZqNUv+UefhPNaMxtBomQRo1D
	 WbQI7Lyai+yBxDcU8+cAiUpvpUZ/kEX3YqCRzDlQKue4mRmLXw260R7tSEzLOiMC0STzk
	 q/w2DNGnXWqJ/jXYN7l+BX3VJy0Zu+XkRFruhmqauN4oTA+onq0tM/MbiC2aLCJOnD6Lj
	 tzWo0Ohdm1vWnrgo8JsQpd+yZxrDPetEuzFSgv0jOsYJxE4JwXokPYBhlt1HVGilkPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3664606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3664606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db0791748so423670d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765376; cv=none;
        d=google.com; s=arc-20260327;
        b=UwHcGkBj1asc1mg2UoJp9MBiKyMzOsZGeA9I4wwBGeNV8ZG6Nf+v//uNonrXClNcw7
         0Gj01Kpi2CIfyFthns7uKzfADk+FBJCS9rQO5ovel+Xmr/P4FtAV687+wkM8KRKd1RRf
         q3n1A6SIJBwEzBFwz/Q8GfSowd4ra4fzVGGvddIiiUqBUZjGP4WU4dpwY7lE6iov8Jv8
         CrNFKBQzWPsXEYr4BtjmYDqyJfVUsOZoTB985Xirh9BTvqeEmiH5l9C/vrAFLe/Y/uI4
         8i8fRF2NhZYNiftyUxU8kll6bHZO9qSkhVT9SwPZl/oyLY5akIl6vwcNEMhHfrL0x9N7
         pFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        fh=jM0CILKo5u1thFGVnTqsEDtYArXLyr6pV80FHfmqQ/Y=;
        b=eJ9EnYR/QXCOeVmZG4FfVIVf3D2hCzE1ixtvVwHlsvCFNGpvZcX8uLTZb2e0mBqYQg
         c+vi71wPEzGDVE5Ug8SduRHkJ62Zd1zVDeHMtqVm5Uq9KqmpCsDmczyFBTysrdDBnAxa
         4BRbtqqHymOhqC5o/03p8gqvF7XeOmhEpn4vMdSjpQQddcc11jCOOma6vkA3IaapiCJ4
         xGhsp654UQpxfV8y/KkacKDnCMtSleXKeyyUlgi5DluxrY7dIho63ZRqBTmrbTMHPMGD
         BA20dYzjltRjjjMpvynnrJKEN6T303KXWSrQC8jixsfkulBZ09GpqDDfzYMtM2/Y14Wm
         W+Yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765376; x=1795370176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=pas+8ePtrT3q08eC33iGkr56u7NPfuFn8YpxQC393/ikNvaz7ESYVMC+rMU7CbJr0M
         +R8X0eulKHmx/G2309+RC0B+2JSRNqkHfj4tJCBBEFcdhDtMBoknquLrs/b/RUBGV4dm
         1Bw0o9Ch2AjP3P+3QJnA9+93mjfzMg4hoR44F0Q3QQlXSkq+p5DSWZwe83zJUHANf2Sk
         FahErFkpveX+kHbTOQ4tq9i9bFlGcKKtP7iqyv6ANpkMIhgMHxj1Q4OqTTmm6mWlcb5o
         mMkX1fgPByvBYyHkAI0DxttWhyPbpZLcytpFbirxj5ffC3D1ncK1rdgVnw3Et6tCa3a+
         McNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765376; x=1795370176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=cpiwRJV3dlHkB9cxzcDsUk2MRwRteafq8yfexrog+A2E2nfGxwLO+QmrmQc5Hfaz3c
         GgyafkbHt8q2JuVMACpX2+vPHfuED2ly4GovrhIRsNhAX+9nFO0qRotl3nSI8Qo4zOcg
         RVd8CMu3AvZQ43vTePSHCyR5QOLUh8d+Tm7BTa6tjo7MynS7TS+meV/BvXL9xA2jIIZp
         zc+T0ZOrlgHMWT2GtM1XZXwhTfs+GX2FIl+1vUFdY1tWir32jzUjZQD/EguPj7xJlSGi
         UmzGXN3kmmFWzabHJizmX5V8jLKcjHSTV01XV/2r87fxnrplS2la5BonmxGYK9dL7+Lm
         T1YA==
X-Forwarded-Encrypted: i=1; AL+hErF//Jj5AQVZ4wxDe6QBSlcyrdLxmHIq3LryiCRHXAbYt5jucPqozGO6A01GZBx3RgPNMNlc426ufjwQmxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rJ7P9hjjJ3k7hLBRwgfnUpL1lKZiBCTw6/RAO3BNyG9xcQknj
	cb65aoQz+fqNt3Rb5ZvNiUYUV5smKzPsiwp66r3YF01W/avLukFJ1dV8tdol94I1mAhqqTM7eP2
	lCusQwtboremvS4NXAbld8UBKpuKKeL4=
X-Gm-Gg: AYBFou2ljOjQVBGbuegLVg4n0Q5lJqO86znTgSZMMUrTiDGESFTrwrGdc0Bzm3zQTVD
	sZCMC6PCQWbRciFqlLrymszvBotZHhpQaLX2ZXgoJ+/xTGla1bDdacWfpdqY8LbDYmkJA0rSdmj
	jQtnu7ATqUXpL1EsTsBT87EErnq82Cjx+sZGBuk1JAJTb6mIQIV6QLccdC2kGCUuVPvrx6AAiqX
	QM7/lhL+1LmmIeclJy0J4SnpQyUC1hpgO9J/MjFsvn9sH2YM+2hYm/rLUwO0wshW4b6t6Aq56Np
	hppSy+PDxFQ95QHD+gJBbC2Zz/R++LJOUE3I1/lfqL1RbOVv7UN1jdkooPWyPY8muFE4/BYdAep
	5QXI6sm6YvotxTdF7FkQuaj/QD/Q2iIkuUN6mufxWAd6VQBv11CkyDZ2IycEGv0FckqlKjA==
X-Received: by 2002:a05:690e:4852:10b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67d895d195dmr3505161d50.24.1794765375839; Sun, 15 Nov 2026
 09:56:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-3-tanure@linux.com>
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:56:05 +0100
X-Gm-Features: AclHuK_UkljuS9ciZHxa_G9-g5ueKP83ug6GjLSD0viVWSMIsEbzxQPrFL8LXzo
Message-ID: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The T7 has the same ethernet glue as the G12A but needs two clocks of
> its own. The controller reaches memory through a pipeline stage with
> its own gate; nothing else claims it, so it is switched off as unused
> and transfers never finish. The glue registers share a gate with the
> MDIO multiplexer, which probes after the controller has programmed
> them: the writes are lost and the port keeps the bootloader's delays.
>
> With a newer core, a clock list of its own and delays that follow
> ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
> adds the 2ns, and only the receive delay line offers fine tuning, so
> only rx-internal-delay-ps is valid here.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Looks good to me in general

[...]
> +      - description:
> +          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
> +          Without it, they read as zero and ignore writes.
Please give Chuan Liu a few days to clarify this clock input: [0]
It would be great if he could provide more details on it. If there's
no reply then I suggest going with Lucas' testing finding though
(which means that clock input is correct)


[0] https://lore.kernel.org/linux-amlogic/CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc=
1gAjr=3DFN1p+aTdumpw@mail.gmail.com/
