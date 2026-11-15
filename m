Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765740;
	b=q0q+lgUlwueQDZcP7S+OJb0CLlt0kx1HCHxJRMfBbyJe9RY99hLXlZf+0Xo1ltS6wlvU
	 Kbtms8pqpUO1iOYg1wBMnYMj6IVSA9SO6IfOYBncE5S0TDseT+1gwvkVJHmQv2HeNWVRf
	 KvORhB7736vVG5ERRcYSjzrKryBpvZaczup0e8k0ut0JImZQkPHK1KKkAywQM4rs3J6SX
	 2A1HQjUm/TQ+M0Bq7JSDjFbp5dzF36k6YKMMTUN/TfmBG9GIT//t7K12VWvLDC6IvENUZ
	 8ZQR/7cV+DF+thmxZNVUIs28v19n0ESK6TN/aD7ipt7m1wgMbUdSlwTy9jcxP+XVV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
	b=F77cblnmdJdi/WDhRhLKnCsOYWzGyyLbHg/wfVHNSq3vwmaoO+COxklkZ2QR+2MAmGk6
	 wOVxlL3fYfEokXjrovbYpoy82qLfLccdBqxGO3a+zZrW/IXnO9CtZjya8hiAtuAzlTEtd
	 X4GoFLHdGBE4uAJjK5JEI7FZqxX31yPEhhpBp4qv2EemSdAVcK9czbNA2vQSOpzHMqVxQ
	 7FfSEK9fiWkxWY+y7vnpjN3xjUFC3qcRzQHWog+dp5w5YZ5RtRiJAi94NABd20sJjkcgG
	 XdeeLVlpl+GfaX8ygn4VTXHbis3tISk9e5rbDqTc9VpVY6UN+vJpDkfJURz8/aMaNzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D8606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso3541914d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765739; cv=none;
        d=google.com; s=arc-20260327;
        b=JQpPNr6DDNmXPZ1IVPK5ztxK1mER9+rXkyY1xmgZmmlgg/r4dhihcXWX2J+0zQyZmO
         JjrKe72RRI+tOFS21Gv6oIEdCrhJMSFoct9J6psNiwh3Lmg+o5CPZPw/3BDUuwxU88dv
         TPyvz/gpOmTnQx5w1YzFOrk/ohzbtC/R/Ek7H6hHj2GydvIi1U8b1GlJepAf62mZWJC/
         z6xk6UVm45RyyhQPYGuKDnIujHNStZfmGjT0Fg8XPlWbC4xcvyFMOcftMvUcPc2coF9v
         EU2fx8hAWXyrtJbXTAfGczDCl6pK72d63ofORvav/WcFYIMO1XS19CYTkhk9pzwgbtgk
         3jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        fh=vmN20oI6LDFZmEbkTeVpgAIZUSleThi1jOsFxWtTtAM=;
        b=Syin+TDvDwRlPZPbBw6CDGBE9U3BweMVInWkSy19FY1bBTj6+KW8A8kF8yptWEDegT
         K30IFrPXI9nL+SvaO6UdXfPo/oAfAaOeu0R+zQKtFM+xZQHG6wxyQq46LpL+Z+ygtNZZ
         RU1z/Pt8wtUhL9FqD1tUKHWEJEbU91OSwH6SSA6TOLuE6xwkrrro9p6rVKLeckz4ZGO2
         1MU3fcuNMGHMqPcJyVEnC0PcSquO9d18k6CNo6yVt2N0VxUa1G97oBnDlWGh9uuACw2c
         D2cJaZMbpgvSTMRFNKluBEkKZrHOCOXKBxsSLBICkhS6Hu6r7/6tht7qzoFwtefH2Yzp
         xrIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765739; x=1795370539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=trcjy1Jsu6uraAxeRq1k2El7wn6wlXZF2ZLBh9CCWP5wataRKIvera4oeEeA9Z1su2
         s9rEizFFkNLrERo4aaXhfnjn9AWhTpvcK1Yv9W0dwusaSCKr1DmtYB4pptoKFiiVgmtB
         7hGbZtwRP+sl5/0vR4DNalGHry3ANAx1LFtAl7jvxdJbXSEuMHW8hiy13yP8hv9Xt/Cv
         CPD6SmiUfnDj9w2N5G5lbCdciKToWR/8X2PQEb2Hc/GXJJ4Yxrt8NzSvaMVaXY9adj0r
         kQLWGvZTOyb6rns6/kjEKSUdPkshaXES9quCICOwsSJfLfP+Gk90Je4Ts65VttVf4grr
         oFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765739; x=1795370539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=HCkSA5lvaSnMdu3ORUbLNLpHjZ0nOu10mpYVgnH7Qw2MthX8RnQt35HhgXbUHCNxOs
         PBfl3C8mn3bQ+7r3rF0O+47XKuHUpVuE8/USIlKvEA8++G22++hFnUF07pNmh2SR+9Jt
         JscdmtU7wXn87Nf5M8AnLaZP6GvnsS9OTNBLuWyzhwaqpbA6AY3AwBrUzqF6bA+1L7tl
         hI9/29Zc95AAT4n/PTw4V1+BZluFXUzB8VugwuBZXorhl4+zrH5F3/8Qzm3gaTTJTFXh
         HUyxnnt8tB7g4t+dxuKIEmyT+lXOAoVKO4jpiSP94cs0e3GqTccwNtUSPFS261MKaxr5
         +CaA==
X-Forwarded-Encrypted: i=1; AL+hErF0Fn1ojjhuxx3rGx5Hycba+/kyWMrcOwj2h+bw4Bie+iCaPOkf/06cWQkUfXnGPo4DWx/3YFD8QmwxlfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DZexdRIpt2KaSUWdMAjlhqVxEV6YOu4Cg+ytxINemerZgQfiX
	hOXQktlzWX7LEsCLsonN6bT1gqEey/+E/lpxjUiIKlWWLl7/jpXpUXX5124cUC24w0419NFvmGK
	+k4e9etMuhaRjFqTDoyKvVZbXLV15lqg=
X-Gm-Gg: AYBFou3xjWqFj95X5dEXHSJqJu8BnVvjS+3H4nUL8WFcL34YHg5wqw3El2egDKlEIXe
	GKUa960z74x1I+m8qxjZua6tw5nBbjBLUVVrC+8/fGf2SNQ38kseGRoNCxNDJ6EfpAVrs3kGi7y
	HICWKTbQKI7XeL+r33EH9vJVHDL+p3yJ/wfjSIBRggLsPenvG06eBT7ByRX/8SaJHZ/OAqugU1T
	Ku2hTUwonmyPpPEEdY6MiTubzFGgplsz0YM/eyNHq1rYrleRnau8YE1Kmle8rO9wE9Vwkp21heK
	oJpsEYQgjwCUkbvy96YImYrOE6jXeRxsyLuL3FTMUor2bzjJ3D6dlCpWWgDs9Kk+2FQV7xlZNts
	7ACZXz2KUpDNN1L7Ajz7cmHA8b1/FfKKoxE5qD7xdhIJlNdBcVIXca6U36ES04mAIQjbeaw==
X-Received: by 2002:a05:690e:c8b:b0:67d:9fef:d62e with SMTP id
 956f58d0204a3-67d9fefe0ebmr2566936d50.6.1794765738737; Sun, 15 Nov 2026
 10:02:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
In-Reply-To: <20261113121852.334604-7-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:02:07 +0100
X-Gm-Features: AclHuK982JSfMQyLz3Nt-omny5MSefKP7dqRCWJKkI82T-Lx69OJ3UT6uTKWWOc
Message-ID: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
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
[...]
> +                       eth_phy: mdio-multiplexer@28000 {
> +                               compatible =3D "amlogic,g12a-mdio-mux";
I think this has to get a T7 specific compatible string (dt-bindings
only, no driver change needed):
  compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";

If we find differences in T7's mdio-mux compared to G12A then we'll be
able to manage them.
