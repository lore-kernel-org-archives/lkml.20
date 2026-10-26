Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048695;
	b=CFlT8Wcegv+eL4KhY11+tsbypgPemP3jrSR9+pRGUCThk4XrcKr7O2W/QEPmjS4b/kqv
	 yF7ovcmiAzJmru86VwnBBmIMA5rjr6F49BTffW17qkZLKw95WF5vMlEQrULry0D5cBGvp
	 ngrS/2FMS+5fQAYLdGeYGX2jfRO0HX9WGz5f3xog3JHKEMLUZpkrVR4VHvu3RZgPvFF3e
	 ZbfOeh3IB50wCgnJ47dmzCpb8loRMu7GQWKVtW6Gqn3zCRrIWQwBU/L5EdcXIpPLRKpco
	 QEm9Ie5MGwiJv8WB31xIOGNNjy4ReUbRSITztpHfW3f1FhgN22t0pLdjracK1WLqq4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
	b=xjTCgL7QnycCZFxp7zPwbqhvNoqABj1WhpYFJQDzy9Sx4CRvqNmZoYFa0QzWj8W9v7p0
	 XZDI72Fc/riqUzfz6I0MQIBf2112bqO586V/gGpIk3N7ArCbzbfyDreEm8xV4o33Nrw7Y
	 xckoviL7x1Is2loiMdO60ixnpygmwmp5JgjIAFYInQBaNHxL6dnCZ8NYX3foMdJAl15Mh
	 a8lRAFHQoZnny/hRgBX3pytK4T+hopcVkWifU+vJBtUtAwl+RMSn04HC8QtyLUPz69CWD
	 YMma/3+lzNkFmMKSLwVtoPSvF6+5R8JBBDU1SK0MBJNlsnIAKoEEY5OXNlm29FsqZYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="REzh/iK8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C53606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C53606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=REzh/iK8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so14805725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048693; cv=none;
        d=google.com; s=arc-20260327;
        b=LOZi53y4q6yUqjAyERRzdbdB0OS7R6hY0vXVKI9p78N7/WK5IC2/kcZPsez0v7bCmJ
         LLGCkL0r2nVTboQG9BKWEa/Bnqb2Mb64Nhf3fMSRyAc+IB0euHzxqgkuLfDtmaF0H3Af
         MMv15xHor0iwvqqyIykAKKIZnARqSxm+qLWOVoiCvZf04aGK5k3ZQ8a4L3HEdQadPaOp
         hsODL7ekXVq4Sjauu+CXt/YbJaXVRcQB13+DN363ybi6SsmW/egYXJ8rlLR8v05gwXF/
         A4wnzQKVx5WIER8xuDVFX/D/PBGhsC5P6c6MdbvCVZ3JHnVlg+wHlZ+7C/e2nvIoCDiE
         86eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        fh=NCpkbh083GRlnzBNjqZcfuwFpIhgbm+3w77XmNAv1oY=;
        b=ouZp4gSCU1Q8ty84O9MEdZRUlxfg00CNGoX2G2ublAbpBpPvjf5k7C09wyfmEuWh8K
         yzXcIpgpDV/g2+ilrmq98KK+i/I8zPMViaLRhr9f0tumNdVpbhHRaBt6waPnNkTdTiC5
         QwKE4XfhM6HXis/vWjGqY6JZ1Y/S+yOppJNG357/hVk7Cra/DAMlyU2/RV7p3CybmFI9
         Y/BulXPifI9W0yY/RYqxUm4e8tg4K7qbehNrHM51vDk5JYDCg8bRfemIK7qrUYbZPAsK
         Bzu9uJ+A+tNzaF+VgOl9KvycM51Q/IHNu6AdgTybwuQvnsb/IJiKBIYMrVu2AvYulaub
         DqBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048693; x=1793653493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=REzh/iK8/mR9cU2vVYp1mtiiXemFRDWkRiF4g+U+E9FeH9kEHfpk8xm+cEY7SIc7o8
         VW7PKfpYVJ2L1W6cUDxzIrqW81kWWt3AcYPTjWB3wMTvOuTuv7YwHI8/fLOu98Rs6zKP
         iOdyQzX++/3k+4HhBOiQnd7mtfO+Gwt2SldmFEzEHfB6gZYxXicHlowbS4zTZxiHZlRd
         xmj/0p7A1SCa1n0NEUjKp7fm0YXmMEZvN3WXFYPvV9x4BdoIxb8thryjuUhjzw7cNcYT
         3bIw91POCvvsyzwGg/ukMJLQYA9hX3jrFUTCnaThLfm03jm1fjillXWuKZ0YPE+Jw2Yb
         BSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048693; x=1793653493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tux21EfDtTpBbBq1R3ksg3nQktcfpPRSG5HUXyWHhJw=;
        b=J1dKW5FAH6xq5fmFNqX6kg/Hx/fIo6JI4uJq0hRa19g+xFkCcffIP7hPCorN0RJ8Sc
         9IS8quCSFjtYgySDfFYd/nYilfRWQKGTgZ02FhAnYg/slqJxy5fjhQpjHue6GliP6o3z
         fZoUrdn75m4OeCBbAhWYa23CpsGvOZNEBnD3nWh/fFZtCp21Q1d+rf24I4DwtcyUIHv3
         nRsTnqcH7WEJYlNVBVootcJPpNPl6eZ6MGNHKbgAdKAgbY2V3kmlgK5prQfzzg1tYMDR
         IsLwDc7zJYht0pKUTjbGVod/fVMgsSJj70Bx0zCJJx8gKyAr3U9LHTnnMC+4tp4XuZGh
         daaw==
X-Forwarded-Encrypted: i=1; AKwUvByogH1u+u7kb2gRCXAt1m0epC4PS+0yJ/XMCOaGkcszgtEdExoWuI7aMZROJApVxPkXpNPWRxEW4aH1I20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIrDVdFV5Gh9PUef95bQxPjc3BbCbC+NSm12a0AGOsOH/jT2qu
	OEz1Ljv298rtYJ0ZxKRU/13pni/rQ7bcG8kkWwRTFrYrKUq/oqcZ5OpRrymH5RbvmVP2Cc8wa2q
	oQqHk870TK4YIsXsiz862gBuEZG/39AI=
X-Gm-Gg: AYBFou3jiAus+UCbZEAY78CwY2DIJHptGdsNBjLjLZ+/7d22YyPFZ+jS4Upmev9jtmO
	TBEXc4JB5I93R1Dr6oP8WCIzFLtiq/LGUv1QArs/jMDAqlnmpu8mZQ6eHiYHnGCQEfVV+Rc5i4r
	3DGabr6iWUjkvwIiXuVX6+l5I476jEqb09jQ/U/DmRL9G/2pBxEm81bXWDokz9O5AjhseqdQO7k
	CxoRGv1kKjpH1Gzcd9i71UWueis3OoJV0BaTLYYrURGZDLs9d/yR2B7QWblDLVKqE0xE9VaxkbE
	pNFBF8NIYu0iaKMq+x94ddAGBeXKweN7gLwozEWLv3TKv0J6sCPa7j8tSXsfjF6G6TGLG54bJYi
	YRptCBKbaIPA2katPGdp7pb/KzxKXOVFF+p8c+/qGlm1cQjMsb3p7ZjvtzxAhbFkT6q9orOKYRE
	FHd+TAY4aF939dgy1y+hrmcpktInEQPJxHtPiS1pPdmelUIfmiG5W0sMHe
X-Received: by 2002:a05:600c:6098:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4a35acc431dmr140143975e9.30.1793048693009; Mon, 26 Oct 2026
 14:04:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261023214917.157d0c89@jic23-hlaptop>
In-Reply-To: <20261023214917.157d0c89@jic23-hlaptop>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:04:26 +0000
X-Gm-Features: AclHuK8JBvSW5tWtnhuC7bZYHXlymQW5Rkl37e-ZQt82_GXFIHsS0rUkBFiPL4g
Message-ID: <CA+V-a8siO75k0ZKDoQ3zpyzzAX8KwWT9qHUGP1OZCXCU9sumFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
To: Jonathan Cameron <jic23@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Fri, Oct 23, 2026 at 9:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri, 23 Oct 2026 18:59:11 +0100
> Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
> > SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2=
H
> > SoC but varies slightly in terms of available channels and configuratio=
n
> > options.
> >
> Applied to the testing branch of iio.git.
Thank you.

> Note I'll be rebasing that on rc1 once it is available.
> In the meantime, additional feedback is still welcome.
> (It's welcome after that but preferred as patches on top!)
>
Noted.

Cheers,
Prabhakar
