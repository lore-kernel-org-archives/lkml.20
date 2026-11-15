Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765531;
	b=MxgEDZKMFoys/t5HsEAVdeyT6zfpbW/IVs73UID5xY+ADeWsMKWmOGXHUWTS1cLChU/2
	 gr+U5RF1W2jet8FGFmn6SJf4sQXHbHHOL2f3SK4XEdO4c7qELe2rDWwAfBV7exIixA+OM
	 CpDIfg7dI7iRqA1nRv0j4w47wfwC3u/Vj1VzZ3bJ0ymjgY0z4AV9ROXA1Gc50pcpHsr80
	 QezyZCXxK6VK+/mVRRkSnrrFZ378BHZiYx6y7WV2LYXXPvoOnITax2YS97LWRR6jnlCjb
	 rAyoUtONb1Gl9XuC6tRDPtNbJdwNoeKWTmnRYRXGn4dqfEWyDKXvhcQa/1CldmzJAUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
	b=FQmIwmGiNA6nbCtkICnb0h9lZbp+XFhF825RtbnsnL27SKJ8QmR6pfeIa9u/6C4agvuZ
	 PI+H6bE2Q171aXr9VzvwX/yZl0K4plbP8tYav1yVRxZFGrNQv+mfa7SU+6vmnA7RZCGhx
	 6Z5/Lyuc8D6k+q0SIiLULP8pbR15PZlAVurtNW/tnml4BfLUAvYemVByE9r4uJIYANBXg
	 vgx/aI9nmCpArbdMA2X8Hdckv5KFM9HQ/NqNaZKT7Z6Tp1/pUYLXD5HwYvs6pRwvodDVC
	 4F2bOQW1lXr4y3Xq6716WAG32C0xvKh1I0De40a1MTh+skbR48CvmC20+QL+YEJc+sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2585264d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765530; cv=none;
        d=google.com; s=arc-20260327;
        b=GCycw3oEmOav8T69Wsgo7tYbAlBGtYHKH7kSgbHrmbgt4b9ADmazV8MEqM8j1w8Ov2
         J2QTgyOdITtfUiiMckO9+oJOMl44XkY5It/HFLWc4UQGJYd11Cw3OPVq2UrhzSkZR+9U
         359I9t6XrmTCzTRrZ0Jf9RnGfbnuOd3CAQ+wS+emn4xiasK+JoUgETGgUsXnGLmrS/YG
         upBB1wS1iLizN50gqjJzYuMMiGPgHyXxOKpYWubPdbBoGFDQ7tCKo1t46yxt6dxxCzXt
         JOJP0FdDpx1maq9zwpqrJw7WG5uKGN8SRuyLo9vvwAZCphds28jfSIj1KHXD/c1+nYrx
         lmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        fh=Ou1M1ETSLMBjt1V288eCRHrrPzB9AQg/HkSb+lQGpos=;
        b=ZPs9dliKUCxq0hFUvVEJhCw8ykzVX/PS4mHcSZg7bH8cUkzS967xARK7Up6Huj4PCH
         TKvlnVWt3HwySnjZS9M4Kb4vMifKugk81rhFj+9SJ39NwFi/6O8X3K+1Lq5E9aMHEQz2
         8fOQhwdpKhNw6Lf4bYFvyA21Z0756D39kIRU/KwBI0DjFRwobLY/3FUhdxnJsdbY3CN2
         Oe+x2mEZiuKYq6BDHLxcOmX9PrEym00fP17/LRKj173PJtjTsyivbh9pceoSzKU7fjyM
         GCQa6UcMk+eYii2vVqGzP33/jQ9HfDZwTqt5q6PYffZcnQE/6eZNAnQ3OuDmTAfHJ2IH
         3PeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765530; x=1795370330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=XPWWAxNt+Env286Yntq/K2JIap4Kn9A0wPQ7tm/yBRaK2JVC2a85qlbNrRRwiFS1eq
         rzlJ7NnIsHBdv7DtFwG+MAWE+xYIoHbmECwek3wSKRZwEK/bzaGXXmHTCP8g0C1LOvMW
         izatP19yRmpsv1AhkVO39qy6GJ0EgyiQgGi2ZvAn2jKlJQJIMEOY2ZnQVQuxGKv5zuzj
         A3/3a/rmUeMo3ytH/gDnVwaYJcOlne0xmKIzCKyaKfdAHbpTcKSnUBrSP5+/WEGXMQ2z
         tP8EitL/OdpmKWF2Ugqu278BoaAGRT38R3Q+S5oEB0mOq5WaSQiQu1OdNuGvwTfLB/lE
         2V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765530; x=1795370330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=eIuJETM9T/k+HfqWSGbZk6inA5fp+KCJAL4NSvmGjPXD2NvDf6I3Tgdizoj7nImEMz
         eUfbeQpDfogMQQDQXMQD8R9UTcH9SqhxSRDBu7r1oHVvwZWTgLPoJ7VJv4Xs8QI5SJU6
         Zx1Fj8pBHnwrS0/VxcjXfvZYQCrnLy1njC2Co/8qGd6rPXG80h8rfD0Mbg3N+tYDSIrL
         1kR3k87Qv6a6zMdxz2mL0tAA94EzrLYBz/k6emjPoWRsXrQVOORl9oCM2x/Ky/9eW7Vd
         HksdXqVoEImlZjHSG3xL8wsKNH4rUCjkdg+DJxA548NG3/g/dgMvH0/YRZqZbguEMaWG
         LU6A==
X-Forwarded-Encrypted: i=1; AL+hErENz3QvXV+XItrFzVy3EJdqyQs04wDZis8i/5cVABLI7rb6ymIKK/OjVKgSi4F5YrhMxqc2MXC8jmDibsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHMs2kCoP//RDe0GV7qUNe4WEGwoOlFljREESgkZIoRyAASb4
	sQQ3RAys2L3prlW57Y9hD2eFY1PTVnC8eaHFRqR4nNZ+MzYCJpiM3MV8jGsgVMX1OiBdVnehLUj
	PwQmr4eJukXPcOuclEc+oxY/kLDEEVU0=
X-Gm-Gg: AYBFou2W8WEs4RPry9sLSc4zl+tHeDToctu+lzAR+3dO9AYNV0Vv4EKpItDejMw0bSd
	JpnQvVM0Nu5ex4DArfeF6TulS4ycwkr/tGsPvd2IwB2NQrHH+4Zum+4z4eQORfrNc0A0MWibW3n
	Oh2jilZNkX9QsA2OJdtU9f5wIScM7y53tAbTAbbJud6H65RYnUjc6SHdxxh64GxweXJ2YIP1POZ
	tbUQEH7EmuweKHNKOYJqoiW+5OKBIFBX5MHf9qtE4dyk8BWDiud0NfgqfwZQkmNV2Lfpi7jeBtn
	MDBQNTZQAJOKzrDlw6TYoItbzvmjd+lSaXBL4SM8qfTi114CZ137derEg5+AMUoWlKWhaqzfeG1
	anyCyJLoWM7piZAvcj4psrDRJMZ+szMZMpOybJUA0HfGiqvZuuCl6GDPI/J1zlDHc28U4spA=
X-Received: by 2002:a05:690e:118f:b0:67d:9fef:d61a with SMTP id
 956f58d0204a3-67d9fefe1a1mr1954166d50.8.1794765530625; Sun, 15 Nov 2026
 09:58:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-6-tanure@linux.com>
In-Reply-To: <20261113121852.334604-6-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:58:40 +0100
X-Gm-Features: AclHuK_i44pvTA9IYISQzdnNKpkNilY1KX3H0SN4TaP7nH1OVG2B38AEZw9Q2Eo
Message-ID: <CAFBinCBbL0F=2Wx66Ef11gUKHdz80vYrwjniMFRzeK-uiu5-rg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
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
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
>
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
