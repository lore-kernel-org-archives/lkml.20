Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776685;
	b=NG/n9MpgEG288tLKmgXej9GCxbhGZJUigIBTt2s3RO+EnPnQ9TaaUl2vXEy51H9OnQJ7
	 hk3hw3CY8c3XTWcif7EoO9g4aEEARzcg7LsrLjZIharPVgjDQ+5P6UhiMgT5MZ8RWNooQ
	 2eQ+r7mym7RFr9hGrwfveiht6RJJv8TBuCJsXgkbASbFY/MSJL+AjNHRgNO+VFvbkxd2Y
	 izdg9Ap0nrS1gwUa8iOvFD0B7vfuWPGMtMoYDru1RVgID2+H5G5uS+Tagf2LfohMtQ3td
	 HlxYv/T1fJWCs84YT8wy1+TdbnXI8RJHSwrdutYpxkr26XpqPv6pvCQoqE52Y3nVYDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
	b=pq767vBY5A/wXITVCaEcY9hDxd0WXxM1U4gagdmwYjz+qQVRRvdnUOIOzABBTnV/xh1+
	 8LzkVBO2ID3gTHHmaHJC8z/P1xobMR0AHY+1hsrxc/1bakxcsv61fhTwPHEGsoFCzN7w8
	 OUc4hyHH943aRHsDYR2wV2oJDPEuY4kDHX+Vm4YDcohk8lapOUkD/u8qlIo9cvq2zOvqH
	 xVz0AYCyxhdhYotLOSXBTr1eFLVrd/K2fEiJVJMeHy0rZyrTN029jKwjqT1D6YtwRAdad
	 5nHhBHDrsVJd/cFmZLxWYjypNH0gjMVyKYlPt1AwINBxjRgft7iyTWmUoSG61iR/anw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F34606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F34606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aXPCVwfx
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db35e7953so424715d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776683; cv=none;
        d=google.com; s=arc-20260327;
        b=H5AAUHDYsze544k+38Mgr8Cn5s4UWVMa7GgSYyP43uocascZcJv6HYqCVdG8EB/F2U
         Okh0vexYoh1+osKg8S7G9L1b/qEGkAtATQjiMFx+Mz+Whq6CxVcHuioXbQ5EQREmre2a
         NAzqqs4i7ebakgWU02NmYs+4F+P1jRLG9aRTh5ylQBFm43kPRy3lD05E5HDyHJEnn5GL
         G33Rc+lEsRcB/L+NRxFrG6qDK2ZQUZo5PKoZ1ojOmDrAH5mst4z4Df+cAv0UbvmnBmYr
         B59OXtmiw2DWoDM03Ra5gnuHfJoq84PEegmhLe8e+/GrD/YNPaMDGTisahmZjmg/AN4j
         ntfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        fh=yV4KFBG8HMuIJ/1gSK4frPg9BIKhSyPJYahTGkIJcLA=;
        b=q8cit5wO2buJTwMXVmnaBKQe5JNnfiBauR5vQnTl+45P3Tks66TVHpqiIRJ5CP1UGf
         G1IpMJLTiDID6Kq08VEudjmfEM/SL09I74Ev6tFBpzk2BIEPlredLtWUKwO17wiiWw7Q
         Ak9H8ZmpGyWJPAqYf5JzdGwyf5SAhsDzXffEUoRgpJ1Ct8tuEySA0YOmqmjQmrVkWuHL
         fUvfKIEQDIp+ak/XgoFFUg7ObeuY7hQxDmwsxBRnLSHW6+kIZq8hpV5DMIpZk1fw66/j
         6bStE3BC8/q32+KVEVOTSqEKyrLb98u/IGNbZJAnAR6WJlpdzl4L/ESNOL8YmHnaix52
         h5Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776683; x=1795381483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=aXPCVwfxL+U9CzSjw15PUia7M/Maex05durHtcijeoqRj39L0XOsvUxgOm5jygXmf7
         dsUly9B5FSkWRJW/0AfffHZktcq5Tn1k2yDWad476fvMt7Q8QS3KrB6uTQd1Y7EwsQIU
         8Tjnk7ldXmlXusoxA1JB7NM/0ejeOtNIePsRXX0ydmMQ/kisjfO8TOVCUEO+1c7D4hi+
         7ExJ+ufyjAyv23ItPvSej33CXAfl0Zr/tbvjXXFLurtBDW7auR4pziSiUURj5fBn/hp6
         +m+lAHg9M/T1nj7/UGpSyVeGFF8KK7OClKihchyjewwnJQNGcbQguSy/O0ABI/jb8QP0
         EMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776683; x=1795381483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=pXzNw40D+CqAh8lEFkYCukXMcgNb3Y7kUuWhEyt9Uk5QVpIGXjZN9Wo9eFALCDNpPP
         Q2GQEtzTCZzl9qKmcIm2nJbUWzEBXcxYPq5DfIRSRG+vmdaG8yNxOJeH5cQ6SwxPrswg
         e6+OSvzM0m3iDZa4omco637lSINV2eaaHhpBRPa0fokyOMWJsktbNqr3mfUbqnjhtgkf
         ZIQtD38D8GZ1qCs32HBtcfexEORUnJ54voG8yOFFLyYYGcJbVXxJuurcroodKxaiOnyw
         DP3wy5ORp6NrMxMAnXcul70gvLEqOKlj0E79P4Vu1ZncJkP0JMCAI6t5mWa1AA4eFaQy
         qigw==
X-Forwarded-Encrypted: i=1; AL+hErEziIVxsT3OdQ+AvW1jSG6z5DwTsGIbPa7gQRanPsp/3KifmU7i97tzB5wvR2oBeHyVKCm0Fzwo2/rKyfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TmdRpERcGRcDrLGLm6CXLFr6iTp6ur9JAonSwTv2NdqflGWGB
	F+WjoVtniB9mczmHgyvEjVZUdFwTP5g/tKYEzBxb4RaO+4gECNxJl/hOtmo3Ls3rxCJbfgYe9JS
	DePFt3EhAej8IpA2Xpr89WIs6wnHkqvk=
X-Gm-Gg: AYBFou38x/aC5mbQjfo1S7f5UVwOnnmJS8dXBJlld7hRc8I9rO2X5X/IbQOYCsyIa0c
	GSLCqxos/I/wznjrmbdTmJVUe+ZYrugQ0Tbm4035CD+FqiOa3exBK0+HpTZwdgWd07CwWA2Z+qL
	ZkEXh/8LXuPuuD+ozz/mpZ8QGXNuisDmBlZsIpMyqDe2kcbQ4roJjevmQQ4yC49ILR9zm7+jzHX
	NsWw599WOSfwyKj4L9fVg5yQBqth09j/+dwu1YR58Qwy6WK0X0TfOvTvx7VhDBJ1yH09ue+TR8a
	LSfGGyPbN78TnkxrJG9lbZMqg1jqebUjuRn7pA42V1LAZgz/QlIZA4GisocQUCsMmwbNBz7TP7H
	PpANfFl1HoYNYKDYDHM45QMkaggHLtPod2icUcrBoH+qyYAVf+m49+xDK22AmHLv0ROSB6g==
X-Received: by 2002:a05:690e:479f:20b0:67c:2b34:31a5 with SMTP id
 956f58d0204a3-67d896aa73dmr2886678d50.56.1794776683083; Sun, 15 Nov 2026
 13:04:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:04:32 +0100
X-Gm-Features: AclHuK9HsBcphbKQs0k8LqAA9uRq4kzQTQJzZ3MTf8At638gba0WRnCC9ExoQzo
Message-ID: <CAFBinCDtqNQM=89mQ9uw7hr1CJVGo5fHNPJd=jAyDZ3+L3wCvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate module
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
