Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294689;
	b=qbUqBPuy08Zkw22waqRDuXPFaEixv1hm+NT/fj3P58JxIA8Xkcb22bRJ6KxSvhmrvrio
	 ybM7OprlYpbBYnDQHS1Mh+xPPd3jy0mvS8MX6ZjFne8PSBE+3voWDonOkEpRb0pBGRifH
	 pz6v0ps1cBNFayUz9wVxy4/BHkDDsvMZ5OpcEi7x32j2XeY4XMzmUX7Q1Hf+q3ZVz+F0e
	 NGVNFPWOcO9ESiVXuHR9eEsUoVAvZyFgypwKZlFe0jdXDLAtiujsN1jbijMROae/IG76X
	 uTg9nImPd2r3xX/lb2EI7wy2JfH/or/tREdvlYL9+NaJVpmqLaDowx+nTLGL7GQgDQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
	b=lX9xMdfsyd4393ERkVf0keU4QO7KpQBY2duHHwVQ3o9ei4tn5N0GxuuG+DzA7JB0NPxb
	 eEGqxwVumsvarsmDA7cwzFm//P3taw7SCE3bn+GCE+qLtbwJgYmubIYWJVrEpNn/o4RFo
	 DpYWElFjCvylRVoXqmvTr5Ot9AkZmMgT/tuo5xgtKN6LdpwNbq+6OwtqNK2De4mmSAvHT
	 JRRuSIvBYz/m+B3vhskWHv/ca1f01lVPHh8AdkdwaE8tSE6qr5nUmLGbzBpMJem5lrCjy
	 bubt6xdZ0BkuKP4MPTYtPjhCnAEXIwlm798ynNTh7wDoEryQ4p5kG1pL4NRxVOnyAFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D2D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c05273c38so2028519d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294688; cv=none;
        d=google.com; s=arc-20260327;
        b=WtWAmY3SsUcLMs9Cc8UhIQDsOy+K+Fs2gGGmAeuKaLxjHxHMnyogQyFRS/qQwDAuwt
         6JFLXwmcMLlLT+yp+a/dBqJamPj3H6JLbZ5PX2KQuyj7l+STlJP8hVOjz0UbwUKj/xuW
         z/PYjVSD5KkrxHFBTfO0REmpTZuJuOPEbR5kZUfHJZV2xpEXN/cNbrqr8irN93jh9QOy
         eBHYizXXhuTPv2x6OJjOTWiFXGNFyFZfZxhb0IVCCwGx1KCTCQPgFiIh4wSC5trzwQm+
         qNpnvzQNyg7lpZJUCTI3vDd8fgGCK5FqclZujDu040aG2BFebj9JajvqOCWqeZAehw0y
         qYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        fh=+gZriJt8nz3+eVKnHTX26iok5NQ0iqXcZ5dbST9B6p0=;
        b=qm2WvzC497xtyxHIyj6vhp6vNbVj/JuESjDfA7nU7TUuHjrzNADnzKbxJR6hxLExYB
         JeWD3lTP895WrgO1gUg2u+xuhsQyDOPpWtt7Ln0uRp1NMgZfdsPmLttjmkr64Nk/+Hjn
         m9klD9p6DA1BCxtvc8p1yR4VpWVyrrZ4FuWSsb053FL1GFakfapTZ/OtcRJk65wQ0OOn
         SRaDkf7ovwAf2IX29y0Eh2ANsEAX/kHvprzbI7XZJsWm537kYPLgUFcg+w/alSI34l5d
         hKLybjqPECmDxnJU61h4EcEeWgKtApJJxEUR1rC5uEzQz4T6zA4Ems2lTPAjr746gSlN
         QOpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294688; x=1794899488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=aVZph5jnpz05+IInawFNEBG4LWaGyR6KawbNhlPio048THbmdlYy905j4OFPaX2CCj
         TUycftg6CzZQDxK7jZ7CjGl14d09h98g8UJxxBZ6lnP7g+pTrHx9V1Z+dDmU3/7PamWR
         6GWkClYFkHadDsV02afWsVL5zo6p8KbSPQ8vhwj7MNxvc2wDvZwmcCK9MLd1JLI/IPrk
         CgySYic2c1reZ/EjbRjPpjarqZitNvLUlTFzYU0NJms8wsUrOr5BdiS3VhMtbtebkDTH
         Dkhw4xDoARR+pWLPEeJhdn59fqCKzxGps/S9SS/2HAo6UJfiGQ71mi7wNQ07QvtkYiCe
         0mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294688; x=1794899488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=rUO62l/eJdWUsVw9JSixPop3yMBKzoTbkQ7EnQ9Bhlto6FE7oOB6ZjpkMsBd88yX/J
         7QY5UK5S37ZljTXmCEHjgWHr0UqylltwOqcasQqbcJ6cm8HuZc8/2o2/HFtl79kYAWeG
         Xu/K2XSz94uvSisyKNVnEiC4/eWeUZ4p5HTCXlZYMcSvE3NNHLQZO2DFyNbet6kV9PBr
         vEDZsNIyvtozprzoomO4GZNdoY2Wr1xNE8qgKySEqrkPJ38diNs6/QrpFk1bqsEy9Xa/
         6l+VNdaaBT0Gb5Iiny0T2XDkEBw7EFFqnWi5tlBMv4EHowowXpmJW1IUN7i6p9NXKy48
         xv3Q==
X-Forwarded-Encrypted: i=1; AL+hErGE9CloxyKD3yQzv9yYhF5EfM2nFETPMu4r/aaFeWOv6sZIvrNTZUfS5pP0tRqU8Jbmj6mZLQic23yQNPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HDlHmnREZSQlIaDNBDHjPKy7MSOqXdbJm8vVrRKZa4UH+QRaf
	yrTqA/HKrBFo9nfEUTSVP7vuA2wpjhQu5xxDj+Z4bqqz/Ip9n261+FvVw8MJxPO4QzsFX2eOq35
	grBGkqXMY3INib7PqpZrQ9jEvOx2LnI4=
X-Gm-Gg: AYBFou2qYaleStuQCkV8RuuZaeyHTlkvEZGovjE5wwm4tk4WGgG1lQ61onyTt7YWnam
	L10r8PjD+JimXR27MLI66Szwaawf5+UozNgWpYuUeMBbUz7JgNps0+LBF22DNg2zpMQsoYK6Ela
	rRuAbwroRG2Zisa4yCe+meYbdI6zu6ic4ssIrXY70tOIj/LkXSRDrkP8oYNJu7VQtO/9bAonjbn
	bVVYH0CeBIdqLtuRPEtdLVIiKWm05kVaniSPVTw+BZN7xkXdRtmUpXRpAZct8LiAZQUdxhLhSnD
	NgQit1Oa0HQNoSWVHvrUrn5zRd8Sk1mORlSzGpk70bb1tPK7gfahXedzLO07Ts94OTw8KO38uGK
	l9CMHN0XA3Ey5V0rB7OZ1+fXNMXwbc+RGiYS5
X-Received: by 2002:a05:690e:480b:b0:679:c916:46ed with SMTP id
 956f58d0204a3-67c56867600mr864381d50.65.1794294688510; Mon, 09 Nov 2026
 23:11:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:11:17 +0100
X-Gm-Features: AclHuK_6GpTQ67xpDENQByDg8QRKTv0ORuAztrJZSqgIK4qf--6_2HTmK0qNm1Q
Message-ID: <CAFBinCDi3m0gMTQBCd-yrCfAKkT0QeuXq0wE_i+CfCtS2oX+yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
