Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF146DFFA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793973; cv=none; b=UzimKThuHJpjOx4RWfdcTI3oBewDVuS28gHNOu2J4fB4CepLfZZhEgoTMxpoVBU1lrgHjVLZM3mYlKabtrzaH0I6dGhHZFWbaJ6BJQ+IDunJGwhzwjvJMuNz3IROgLePJMijYZVUJ9O5PTH96nE5TwdELlKJPDK6wpueG9TtwaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793973; c=relaxed/simple;
	bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEF4RUEZnWa6hMWjTzuPN7pi+KOBJqQt1fOC3m+05QUeAmyhvvUUje6HLW4bgVNpJ3EaUVSVmK7hZUXAI1zuYi+IXUcj8fTiz9TKQfa56hUvG85GfStOrs9jove1BA5RQg7jZLIDC7hNabF7B1vof0imgabF8oMYXbnzOhN+D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgB4MtnE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgB4MtnE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so3509459f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793970; x=1791398770; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=;
        b=GgB4MtnEl5Tr4Fa2AAToLQIYz45422AuIXtcYmxB7A2ybu1qCGZr032x2qiAM6Tjzr
         DZ91MYlY8jWCXKiEiwFBEmYsDRFuQHt5qbeTx8gHEehBXQX9AI7FkP6oqR1fa64XWqXD
         72w/MZOVLwu7KmDTAOCEp+ocgCIq/mWfRrGK9YAkC7N3G4WiidefXhE1E7bNcu/qC6R2
         XzeNPcUgvT2QWu1uO0ucPKMUYiFTzoRFQ3H+ruM1MzNoBJhuqV55JiIGI/5MjK5eLp/T
         5HbnncOtpWxTjk7Rm1FgGAYx5aKqOXazeei1VGw8SshHDGP/JihWWXTlC06RcQgB4n54
         gC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793970; x=1791398770;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=;
        b=Oi1flB7UJ7yfTJRTVr6VqKhNUb3tsGra2biejboBJxipE+8PZlTg+c/lIv5ByV/loj
         oc80/4KlZpjY9IGB92iCxa89256lW6+sl5LzkeJu14QqR9mApi+EVjoByLgxzX1ibcWm
         W5suwIiUOBET/q3xI2b9B63cJB8zKNl7ZXn2EWtV9ti9TfnZnnpCp/oN5ZzhtgfhcBvl
         /+NyBmscdQReyjGeQTr046VZYe16J0cJMlm3rj7s0Th+OnCqUxLrz3MIpNrmfmWROm74
         j8X/oD9rHh7oA8qkdO+wcaxcCFelpRQmXCfmMwGAxzcmcuZtmzc5JsEriJNNjbaNH9nj
         VauQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoquuuAwM0slvLFGATWGhM4S4n6JR9YUErv0CEd9EIYWkH6+b3TedP/K7TrhiXrWCZEjBxujLVP8fzMYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDRwiNmgfj4ggwvyKEbO8TeaWKcgnMTJRZ5fnxqaar6Eor91FG
	klqRaHuH+3HlFOQHjafEgQa8+yU0nO0LONmTP+eNAvElLcagI9KXREWH
X-Gm-Gg: AYBFou1PEMggXNmqruu3CUE19ubQ4g53Vmxf0+gzeoN4G4ufAM/r3LYjUjzvDKVOh0g
	OyF7xDtdure5SRePWJXG6f8LEX7bX0yJAIgZ7puo47XoXdz4Py27WCCqLsz4rWJ1hJof4Fr+lRC
	3PLALVAHFNX27ezMXND0HDzv8OpZEmaaCgFLiKqBzwa+Hkx0fr46SslqjgpmoxpM6DwJDDo8IlV
	kbvKi0IwQVCbOiVopZpTPT1q7W9G3KVyCmQTqPzboFpmZvI1swot2sspZcV9bHMZfUorwkO73jv
	65lMQxb21SrJw8gDw340wrHJBdE6yBBPOf3I5k62NF4lPeLbDQTg0uXFVn3CuvGXRRcWbWd6uVl
	zhSFMxtfExxEpR0bg/OCM9WBHZNOrfHLbXYCfmi4EwQeB+VTC/J+61L1H6lo5F0ILkkz1dxRgXu
	sM4XBlEuyUiWv13FXx3mveVQ8LgYcNeyEnjKrpLV1Wv8ggK4RZbIQscZkgqmG53Sotq5wUx2+cW
	DT8L8SeRg==
X-Received: by 2002:a05:6000:4914:b0:487:1646:8740 with SMTP id ffacd0b85a97d-48b02525c39mr4664720f8f.29.1790793969529;
        Wed, 30 Sep 2026 11:46:09 -0700 (PDT)
Received: from strix.localnet ([197.250.96.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a360c2sm858825f8f.36.2026.09.30.11.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:46:08 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:45:58 +0300
Message-ID: <btFKzO4uRMyc-9MtgwEq8g@gmail.com>
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartsPKDCllISYmd3lCo26IFKw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartsPKDCllISYmd3lCo26IFKw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:45:58 +0300
Message-ID: <btFKzO4uRMyc-9MtgwEq8g@gmail.com>
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 30. September 2026, 21:40:12 Ostafrikanische Zeit schrieb Stef=
an=20
D=C3=B6singer:
> Hi,
>=20
> This pull request contains the device tree bindings and clock driver for =
ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and adding
> drivers for its PLLs and clock tree.
>=20
> The patches have been reviewed and carry appropriate R-B tags by Krzysztof
> Kozlowski (bindings) and Conor Dooley (clk driver).

My apologies for the name confusion: The clk part has been reviewed by Bria=
n=20
Masney of course, not Conor Dooley.

Best regards,
Stefan

--nextPartsPKDCllISYmd3lCo26IFKw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq9WOYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi0vkP/R8TftVhmpOKvKtkCGcF
4ZtAmaTgZDo368Ob58bGJwjcPcIIQ5zq2NGbYUmEOAwv4cgjizL65aUsbrRruv7q
Nvwq3G1ME/X1DzxqGzvTPnSF1TOn3wlGgwVOUDyhdABmcKcj/yVUAz0MTbGIoHhA
3cBXmIUxge9lFEfvAjA4/4sc0VchClI7VkqMExb+OMLhnLL7Pz6iiDL8nq4YrTqG
FiN8wmVSAfSpoeDd3+JWJVoxpc67pIrSs/sJdUogr8mT7OQ1l8Rq6i7cBaPpMhe0
4Bs7kJfUm6InymbNlNLmN38qaYvX91zNqLVQUJ4mstasx+vSHIr+VrOpu7RQ7mIO
DzBC/tDGB36rVfehgbtCrvmq/F89WzLCAjq8jfmAiWoQjG4EQTZkUFEQgozTAZy8
gjvUozvVVv6zHWh6qrf7er1UffZedQQO6onl+OrDyaJaXcZGulacm0qwxYVpG508
DNWSWKChqM0x1iO7W3a1WLKz96H0pAdRAm/ZqKKT0P9X/1dPCLB6DvJJYzLYmsFG
JE7yeEcQ6Mv54NXTcOkbMq4awIBR8GzwhHeU61K7zC49COrFbBQTvR791IdsX5TE
fVae2s63wZ0LEm9RFZtMf222Js8igqxVObRucgDghF8tO+WgipmsaDW2HWUdXaRP
bkYvTz+t5nqEAikxecJo7pTU
=bBGZ
-----END PGP SIGNATURE-----

--nextPartsPKDCllISYmd3lCo26IFKw--



