Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794764459;
	b=Oa1KjWkWIX6trLhqubTH87I2P9m3vRgGp16ujTJHebmjteHpcoQKxpyBdZj7bYDNqulc
	 Yq7U2aYYYmV+9tp7k7AGRLHmyY5SL8mM7zLJ+8nBAvGbq6CoQN6GjxU5GxqB8pDPILcWf
	 nm/xJlLX68LZ+A/lBfee6oGOkuPmYeS98sFRKS2AgsFBWUzApSYnaoNFHUaThrShwJCBx
	 2OjOq3MpqT8/qFM+dYvL+05Yz5W3KSpHXXOknC8BJYgnYPUIVg46FIm9OCm8FyercWlfV
	 GvbQFUULUS2fxbgeFH3UfPw0IV6L+3IXI2Js16uoqRvd/S32nmdKWhJOLpM2iBYyEYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
	b=of9wbSMwE1756T1EPC2Yo9caX8TzK89jEuLtDoYUQItKzPnaCpDLfuSXtWLrGTN5hDAl
	 anI/j0PjtQvVuHYjH+6qMSpOEqrB2cEH0G9ah+X0RC8Oi/Ip65e2M1VXsoK6eaewyNewB
	 CHZZABF2FgVMufFdGIdzUzITeqR4mNCaBrphSFlJhbDyGOIFvXEPpeldinGQno4SQBRbh
	 jD3uD3x/CJTbatFc9rV89QQru6PIb/bKHjhk/SruDjJAnj55Cfdm9G4MQGJYmNrIN93SC
	 4I6s6VuuUW4vBbGSylPsyQxLlpQP1P7ScaymDXRzrrtmFMOGt69Re/bgdxcZ2hh59Yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8675606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8675606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Jje7TXn5
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3402105b9so19602107b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764458; cv=none;
        d=google.com; s=arc-20260327;
        b=hKSwjXJrOPQBqHpGc4jwcglkBMKlHbM2wbxI/NbLZYtV9iYs1vcOhHBD95XsCFubBW
         FRyf9YuqM5URyuUyAvXcpf/UF5XSrmXMqqdms0UbpUL+/Hf9PszDvQaISxT7JfI0RXHS
         lNgqOPnTO9f+ECghHmOd8H/A++M1NbMkdswR869DGlZVaGhRmesbBTKzNlK0D/Gk0PYU
         1lwXnHXjUDNB5W0URxjc5XLmBvNaOTJ5/uyuu1viKsPEk8+l/FtC2KP4Vg+/RlLa26Sq
         ByS3eFyNh4jK9/iaQboI5afXZ1ijhW+2UTScGnDVpivqoQ87bJvUcZ0/LDRkDvcGEv6A
         IHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        fh=pOxj3xzH7VEyTL9N9G5lEb+M6VOlXyyHa5A/stsNuPc=;
        b=Vdbkgka95XhIBOW/x/K3t3S9zE1tpjhRLiOjOQy7YAy/hVxKBdadOGaAJjLHiTmHo0
         UajRiWk41exf2nytNC0U/7hekiltdr5DfqbaOlzkHFVTVySAfRuabuueFP5dn4TQqs/p
         tHNmn/26JsMLcugSsk5Kz3ctJPlr2gsdmF1Ri7xT3pEjz6KBKBK6PzLgUm5icSDHFsWV
         wd5EB8aSHA9NmseKQAHEER9P1X8ILp7aKV95pXVQZm9Sf8SK+ZJZ9in9YRK+Piix7Acb
         qbx7sRLCrZSwjb2B7otFmfL1oAfJ4eNBVj5UuefLkN2ZInGwJOMP07rNEXhNG5/3pNQ1
         zheA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794764458; x=1795369258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=Jje7TXn5xdDDB+w6rdao9ux0C1IgQ67VAgpVxPFtfOdvlz7lkhl7mP2+tFy0/NbOJU
         Fjc/89LRHU9zMs1/ZAr5Y43zWNnOy3GmRjvXAk4xYDkiKLg3vXg4231YplRheFAdw+hY
         QYFIbQGhfEnoiwW5aE0hz4b3Blj2PUkqt2LZmKn3n+YLKc+X+2JtdTxdAb2vS/n9ONDK
         UQWqgEzMDf3ofcO0sJob905H723CZGmcpuXmrqmA42izlGUuMPWpBOx0Miuax1k0R5vG
         ORTTaUHfDYT3tC8bHYVpXG0y0DQDfEwU3uXCGUHJe0BQsG2g9FHEu9jrpt613ujyvYug
         l5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764458; x=1795369258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=RN/MRmQq6gM/XRTiwBSWpzTAmRoIgatG1sTsFkcP7XO+v9KJ0qyeJXiZfr1MmvNlbT
         xj5pH+Ns9L6dSAadKNQM9B2VhiJAHMkA66QNcwgEvJPyHIXcJqHsciNz9ZGBbGftnDNN
         YSDLwK0Ntv08gJLimGRXMZWs8qyfginL8u10NhySQbU4FFFvcniPwQTSNSy9tXhpyH5x
         T/l3zOAFrBUwZMLtRBUxgTjblh3bn5hT6adilZ1/R4/TLR2636HrZxwreshcKqKMtBzy
         Ad6Ym55MdgMlEoYhQc4vQfOruqLWa+ir3Yjq934mpt7YiSeGeeKNRdiR1i/lDmKz0aUn
         nDfQ==
X-Forwarded-Encrypted: i=1; AL+hErEKK2UkCyaj7mK6DZc2rOxtH18/x/t3EvATQ3gUCkYbUt+gFht/4gwu99iz1S9laeaU9bNz/6jQ4bNt4q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KapNeZZQwzG2hACtw8mWTKkrA7N79dm/cIZG5MqHkhJpexvfF
	8Ti/EAbakIbozORGIdVN8jlpevoMUap3urP4i8iOD300j5/oUA32nM/HPZfOk6XfC5sCjHXahZd
	jov7a5kmTxUxVaWAi8XSyXvEjhaPDTdA=
X-Gm-Gg: AYBFou3fnMamAiEtzIb/d/u46VjOSwgmiOrwrLhNRudj5Zbp3DhLVcbgVD2WsvMdV21
	pn213/XK1lcYPjys9+2Y2uEJd5mStpfRBnyd5CQJf6bEccrP7+sddrssZNTKfW3ic329ZiwWxcN
	w175t8LBJRvipHiWvgki/GXh32k73XzzIAFTtZ7dg7UWfImaqtNQ9j4HtnVotKAgak3waZvTdRQ
	ZQVNcBnwmqumjwlhgssiMK10sfjpIn4iuGF9P8dOLFLA6h7PKcGL9ymUbgKe2TEpB20uhxmx0JK
	jaAm5wAk5vTdvI9w/JHw7rm+WUfPaCQ50EHARSDD2+ODSoZ7ZPqU5E/XvCwE21Ded1K9tiNp43S
	mBXd8KMFXcC24XQ0eFzAS3D2mFwP1GYdaELtjvqsBovQIGNzknePBltegoKwIu6umhbLrzA==
X-Received: by 2002:a05:690c:d87:b0:8b3:4911:2dbd with SMTP id
 00721157ae682-8b4aa2f3717mr45349387b3.54.1794764457708; Sun, 15 Nov 2026
 09:40:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-2-tanure@linux.com>
In-Reply-To: <20261113121852.334604-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:40:46 +0100
X-Gm-Features: AclHuK_keCn1frC4iKcAHTa13eQ5wSmPdFzN8zUCJ22f34lvfbzGE6mvQz0vUGQ
Message-ID: <CAFBinCBc6=XPXCuxNLug2mRrvrA0EebNgxgxeNOKgVB7d58o1g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The compatible property only checks that the first entry is an Amlogic
> name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
> the list. It cannot express which fallbacks each SoC takes, so a SoC
> built on a different Synopsys core cannot be added without loosening
> the check for every other one.
>
> List the combinations the device trees use: Meson6 falls back to
> "snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
> reports a 3.70a core too, so it joins that list; its dtsi gets the
> missing entry in a separate patch. The example used a two-entry form no
> device tree has, so give it the Meson GXBB combination.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
