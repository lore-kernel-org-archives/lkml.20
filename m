Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765486;
	b=ryTV7g6PqU6OZCM4dA+YHQSaKG1Mj1v0JspXDav8IFC7SWrUrHTk7vAeMmw9//u6CQ4h
	 MZPh40+h1KxcPJ+vZcf1hVPMHRhpQuD9yEGpxFwGDovPlmoe3SEUXBPnnbhqHPhGi32vL
	 FKHkJHboCYWwRDeipKOAkHi5tb57nPxSaMQTVU5+obzg4GdT9NDBdqimi0mtxyoZ4f790
	 6RLVRRonIPQ2Au7OPyUQaWHXgQggu6Shq744TvuDaAkBSv9YhHWIL9UjiRK1PSXTVN2Vx
	 XrLqeSJj5zdq4ggJQs/DT1IiH5l/S2NV11KB0YuUr7PFVipi/ZlxVJPBNgf5vko8tYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
	b=LL1sgMhwChpfEucjEBn4cufG6SUTrZWK21Wj2tq2XqofmiNhtGyHUFAuVJc4MR76VYAu
	 yo+jjanoEWiIr/1qYa3cCF3qCjaeYXnA3wLb78l/Ii9rrR4K+w4+BZEfUkJNUouvCY9cE
	 I4a0h377DQ+LSlvvImyWRodF4oReBveQiyX/eXJ/87tYLBARNkv7vnQV27lDGxDTuRFci
	 yji34N2f3eCfulQU/1NDNA5+yCg0qHMSK50psBnx7kZEOJR2j8N7EGTPWnbULFUerELba
	 gTW/ghKglh7RL1SSJwm1BtZCsFvKE+3ZZvM7o9UVFgrm+aNvBTo1oLdgIy4ExUUsWBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A2606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0A2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db35e7953so344085d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765485; cv=none;
        d=google.com; s=arc-20260327;
        b=hmldevp1wFxdl5FLppKM81dyAC26XfzIFxbnaCCPZ7LVqiJn52f9C/HatCJgq2Fi8s
         NuTtnj4CKkMiIMbuO0R1Tma93QYn/X+x4AaO3rdKSsBtqa085IS1u1hVBLKE1Z9fP0Wi
         vbwcgPcmLeMMEBpAW1CB3oUGQ8CwlD2yXIjNI7T7uo1tLHuwRAxZb9Y+m/ROthIgr130
         OXdfZ5PU17hgjLSmyKCJELpn7/Gb+V7YTfLzyPVVo6fANS7QEG5Xipuyq2/kwbRm5v6N
         p6ywE2CXM5WAupJYbSYvajXuQcuER2ZbIQaQJCZdWce8pOdaTSkNv0XzMjqTgyuyExK5
         bWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        fh=I4MBQPidYdGNJ4sjNuL1PMY6P5m1SGMV98n8gRXIBPM=;
        b=pShyPNExZrynHLK3kwStvdSzJjGj6i9izRV3R7XuJkhC6ekfRQ6/EfPWHtZiMMV88Y
         LywTf4HYDTBQ8f4q2os/Q5PM/u3tMBydB1G1xwTm0Gi2dLOtpNtkVVaGRo2nThD1Guan
         8g7x48oTRfLE6+LAv3VZ3CI8g+MdAJ0ynPAQSbgoyvRUSvbaQ6o6q/j601KIA7PZCSrQ
         NM2RJhAZ9CwdFwr5Okqw/+SwqPJaBGZVNPQ5cqxa0QlMwQkUsNiD/Q66c1NS1cqRpXP7
         ebRo0YrPe6g1oOqrEItyNA1uT+TqZ8Y76h10wnVUUeoCJ+r2QwTlv1Jfktbozf9aqA1K
         1JWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765485; x=1795370285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=UMJw813NaHp2fp6GmFJEff+sL10VP1gPjYCiJH+OebAxKxF4/haNwCNOZVgE3x8Hsz
         YoID5uBXWYsSL+Xefhx5dU31eW0jDmxlRjsIkwD7vgjEshvRnN7X/hx3MHRrdkNNeOCW
         dj0EvTOlqMvpSvOzfmIoMeut65M6YYPOLfyfoVNW3mMTwXnNcbvGHwykkQ3zB84ZM36w
         1xiDvW64PrJLN7niDMEYHv12teBDEP3RWJgJ1FPrWLNqfTUhgTFwyTv/7D/yov+oim23
         Me/+GAb1wMtADSz5Y7FtMjMOp9pRHW2YJ/z336YKZoFynJXlX0eQikruMka/4QDeLURe
         S7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765485; x=1795370285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=HcjWNr4CxogxUf1Sf4I63esVY9v3dGrRL48Hz+HhtM209s3NJp0fBxoA5ACBFO2q9A
         5IZYt8nYCSBt+apsDkFAcmORqWVRuSuWu9rdwFIbfEYTe0hCOhZq88+c7FtWFkUWNdnd
         0ubeLC0VKE0vzIQ4KJAGJuR5vKZmX3enR92RRYoLJFPf6Izw3rft4b8qFcIqAxwy9peH
         AUeYGeSCXWxOFglxfMvswvpoT3vOJko1FLM6MNeKd1mi/uXxcG/G3+8DO5xdVu+b5rqZ
         Un5ftMeheBZPxrh6+84PpRBTnAH325uHBnIUg3VGiiY4uCISodZp/b1taMduzF9PBn5h
         gKhg==
X-Forwarded-Encrypted: i=1; AL+hErFks3r7P2pLZVWwEnocdKl4dOrGIHYlL6F1YV6QqPXlJNP+3/CyEz+7SDZKt7IZKf914T3poGcct9jSbOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZtHTIkMir8mm/kaLncsiQ9FT/wVpR0dCNqvLNl2McZL7TJiuf
	jO+OuGfdatkkHigc3nYbdXn97S0lQLDxDR6YPGp6mCbEmJEUHYDZmtu/zHX+eH7v61Dw3QOiFnM
	w+/BcswkuDGW4VTx6Y45VQSlHhazqsys=
X-Gm-Gg: AYBFou1KFi2GWkoYq7oMMMGewNqMr7oGp0yCRezMyXGXhyjYb+F6LaqbVnItlRUFZD7
	9ehQ1UpE42HFn6hqY/XRuWpa7RF2J3+VzYMtWOXZXLfMxswUsluczEIWDFy3pigTsQrR02+TgxC
	agGNF1wmZeum1YcTPVuwD5iIszhsLuf4lu4lYeXBmZqJTZ1bAQRTQenSwFnrVV84EWPgFNj3i3m
	3sBvh0hkVetGc11bKOYwrmTdBoEGZz36T1XA5xoTOIKq9Ca8aL923gL2CsHN9FxqpfMJfjKqTb8
	lkE+MigRTqbxxuxFYd+/Pos+TU5uxEf72ixO43Z/xWIv7K1nAG0yQ6ST3EhBQrsyi8FsBGswc1/
	48DDfrFGx9xv22GLcBo3lh2m4e1wZVLL3swuq7s+Zk9XCAkq9DYG+PNrs5DUEwE5m0d9Qrg==
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2605986d50.45.1794765485479; Sun, 15 Nov 2026
 09:58:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-5-tanure@linux.com>
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:57:54 +0100
X-Gm-Features: AclHuK9m7YW9F8wMPiMsA7yThjtGjePZoU8lN6bMh8Ee4d6dZkum7e9qCRT0s2I
Message-ID: <CAFBinCA7XhksQaTHoGP3jCCeSCBdwAYgamW2AfPTdK0ncSCzCw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
>
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
