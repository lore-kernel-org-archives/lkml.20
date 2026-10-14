Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E904A9D44
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012031; cv=none; b=qOPpmMODnVsg2rKhybL99QD+LX5IqKmwLXjfsdSo9KT5kv+BAH2PhC1C7+NYQHZs6gXoUiPYO/X0DF3WsuU9RYYKcsxdPyEZDCIG2aD5OwUEJw9CXHDNg6tzH5XvIdK8OKNvbVS/uQUXaUr/EycLzRDyfbaveHTD32b9Pii++9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012031; c=relaxed/simple;
	bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwBvXTopat9YHidkDZnpE46rYocYqEZsbNJI2kd6kvB0/GpWRramrC0PiaZVqOIzb7khTn4U0L5LWvTzKa8a7g8fgO4p7RY7cwZ7MFPeasfBoC0qNTdcIOKUL0sYKYNrPBBRkBVjcnSwXHnN0RmWYMZrg7BulWUgp7EpqYT0LAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0d3adUG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0d3adUG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so36067195e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012026; x=1792616826; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=;
        b=N0d3adUGbgSQdaGhhpa5kkdhZi54EnRGUxO3dt99xX4lIRQhPC5j4/4WSR8+ptQgEg
         tOm0G/xGNmaTbSB/cPOTHl3VaC/5dpzY2ubRQTo0iCtZqwohYI1tIRLeJaUXXdIVPxRs
         Xg1S8a8jDSenl504aFsFtUap+HtVxr6p1nfUS81MFO6T3ESf8qYDVbIpo/jCTnaUgZGW
         7LmTFRaASkVfNwV9jFlNtf9nURwEAKFp9Wa9T5IL7xiEvcWyR5q5Vd08jZI97yxvwylD
         7/MMvZ+eGAapYj4+P/nQEjo7dPXYeubbNstDxZN0ElWp/gj60GZoCPTge2SWE8rFzPQn
         K/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012026; x=1792616826;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=;
        b=jyC8Z+n1t5PEAqW95exe57pL0JfcBPmQAS/5+/PYMqt2OzfNfeXG+LEuRMXVjcOQMU
         Mnqt9id7nnNzveVXRAds8jkWkmi2Tt9qjDF7mfHflLGv3GP9mA86hKzEhPKGnQK7FoF7
         NQ+FUHGo5jCE4oAvTZZTdyFwor6MXTWKKzkglXu/tiKj9VmzXGFV/SaGvhqoQbJYyx9j
         GU+vilu54+L+ganIYW0H/Lxx3SbnLqTNzg/Z8/8tCKq2rUUYt1JU21DKC3lLTYqWrqjm
         n94745YXp/l+PukUi9dqBpAGrGOFsPqfSxb2xKf96PBNoYmJRgmxGerbou0iRQ70cLNq
         d9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBytrMW+SDvKIE/RUTx9mn9BUzj7XIgNFMFLwSP9Xk4yULRMwCqKStofMMXmUb86x4HRNA/CMYnArJbcbO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqzwK1BfrpKCsSLAGthx3RixLZvaOyIQsqgoBabF3PSX/Z3Mdq
	nJ5iSFRBIBfzRhYmlE7bBsI8hugDBaROFu/yedZpQZU3ONOBIFxp8uqI
X-Gm-Gg: AYBFou23fbTZbvl04htSIIRMjUgP1ih/00mSyRBU9zY7kFqlTOh7ip4KHyU+mWkG0Gp
	5bZt8cg/r9h2BY7mRxEacqtXmSPew6l5bqQNn8gjfBgGkEPAtBq9l1VZ+p7RZJKORFHnIdiYrWj
	6PauVUS7xH9EP49iP9nHwjtmXbIvBbNk9ZtnOzgF0n5m0QAQlkqqx3FPuENr+xe1wsTZyVBvcEd
	4NLFs+EX7WXT6CtXZagWTHGlIIEjC64PedoE3EVWCEP3cjmYA5kcpfn5aAyqUkOEdKrs7E/pY2P
	x7157cwxcbgWTqoywywr0kA7RK/zD/FXknpHgj0oOe471CseXCAVISiK7w4QWB/nStMUSbgFxiR
	UW8ivaVdG0EOcUtK7UWK99sgWdOEYtYGnmV20HBpRLL663uDYuD2kOsjDG/OOQFf1XmUZkUHcXi
	ONXq6UFnrGn1wqvJagAdpIEFCvScAl0FaxUfwO57ETpnhhuR0ko6TwK9B2FqQYyCVyuYq5v9FRM
	HqSUx5pEqLVEF/YDadTKwp20R/XzznCBAxaAkySCQasBbfRh29TFWHfmxvjxw==
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr331849525e9.35.1792012025838;
        Wed, 14 Oct 2026 14:07:05 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68dce7sm8179535e9.3.2026.10.14.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:07:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject:
 Re: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Wed, 14 Oct 2026 23:06:57 +0200
Message-ID: <1wUqZrTnSiGMTyqeA30cyw@gmail.com>
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014131954.GA1623979@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartzLu3b8EiSJuMDdR1hVgfBw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartzLu3b8EiSJuMDdR1hVgfBw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 23:06:57 +0200
Message-ID: <1wUqZrTnSiGMTyqeA30cyw@gmail.com>
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014131954.GA1623979@bhelgaas>
MIME-Version: 1.0

Hi,

This is mostly a reply for Navid, not Bjorn, but since the topic of=20
capitalization came up=20

Am Mittwoch, 14. Oktober 2026, 15:19:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Bjorn Helgaas:
> Capitalization of "zx279128s" here (menu item, help text, comment
> below) should probably match the commit log and marketing materials
> for this SoC.
>=20
> The config symbol should use the same tag as the subject line.
> PCIE_ZX279128S might be too specific if more SoCs might share this
> driver.

=46or my little pet chip I decided to keep the letters lowercase because th=
e SoC=20
name is borderline unreadable. At least zx297520v3 has some minor visual=20
distinction whereas ZX297520V3 does not. If somebody had asked me why I wou=
ld=20
have said the above and that Linux generally uses snake_case not CamelCase.

So I'd suggest to zse zx279128s rather than ZX279128S unless the symbol is=
=20
capitalized anyway.

Now just wait for the zx234502 charger and zx234290 PMIC...
=20
--nextPartzLu3b8EiSJuMDdR1hVgfBw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP7vEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoihqoP/2vakcsfXpu+Ci+GS+WV
e7rBcoFUyeSymrqBIbFTVnyAjrjc8gPnoJsgGCeYhjKPqMuHfgoic0eVqtS4cMq8
BHExipQPVyxZO6NW0HMfIEhbII9WDqdctyOcuy2GSedoIMJzIPWMXpMnX46JyKOB
1MBV8Q/S8GWhnhk1T/KCKwkaSoSZJHhoiw/lo5o8F+P8I9dcp7ZrxHx5adGFs+fe
UNcC27+Sp3EVDpBFGm2+6CCGXA0d/Qo7Uk5ty7NM0+HSJXcALpE+7LaJiI/86tTw
Vt3hTnzzG0eN0Tip7+9uRebVf+Qs9c7bfw8Sul479iAAxyG9Z6P3HOWpFb+w8yED
YOClg/A/MOekZBJXb7IYLXV4ENzO3pDqoKI2X8UX8lkNhHQsQzT1ZNHyMTMrvbbk
EaRsivRO0CHD9AAX5PlqzJCpNKNEexkpzqkIN9cCBDl0OcY/Lcx0YT2Zo0F0bY0J
9K8/B9tRssVA56pmeoMY4Yf9cOGXFBOUXiNhJloY/r4pNYA8dCp68WWAB/pVxfGJ
qKiMZAcpZ7oUuw4ShbC4SufoVUrsvcxNWwuuNex2mpLspZCO70Dpy/Vlxs6KAQb7
Dsyp9HyIVZq21HsJ67gfF1MMRcEKqg/zJPA+6PpI9QwuLB9kJFmh5dH/oSd+HJsK
q2rJ6y1sOhtsWG3VBwTYdMBy
=fL1G
-----END PGP SIGNATURE-----

--nextPartzLu3b8EiSJuMDdR1hVgfBw--



