Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3F43DA26
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860760; cv=none; b=itNFzWKtU2mPmSGI99x1K9mxUX12z8qrdrbHRfUyrPOzVIosZtgBoF+6TGH5s+mmpq0CcRAbj2KBzz49kMXqGCUYlqhgeNsh14pGHKuTDEaWXqCDLjpNmHdTYvyU0dXEXfvggasC9FASghWNkBZofc+42kE24dZhVQZXGZ2mnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860760; c=relaxed/simple;
	bh=G44DxRMCSfchDoDxEWvMl+JE8jqtlWlGW22zD22lDQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/WYri2roJiPb7rK6xsM8ssOl521w4yCk6T0naWG37tqkgLomY3TJ1MkfY2ZYe3rTGzBMBNj0q9QMVuFnniYZs29Z3mhW+zjUMngmhnfUMSaAx7JksJD2Cd8It+FJm9x09GEWUWcdvdrstWXbboMEycsDzwKBgY0RebEd3fKyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e7YDPNss; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e7YDPNss"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so53026185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788860755; x=1789465555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wl0avOHzFae6yeME6k9M5ir8m7lNuNYJR44ZHmJ09/E=;
        b=e7YDPNsshs7TQMtCzlsQZJAmj7Hfq+ayxy4Dx8E/yRFluokz8tUlVz1cfHHer5m2Ox
         FS6bCv62whU8Yn0EF+H2Q6dK68yvp/PcF9Pag4yCdNLQR5iSOCay9XYOwqjQI8ZljZEQ
         9t6fNtWecrXIorLw7l+KJIhGTACRzRR73B1YiuyfpFOno/whtsnWh5CUJt4J/5eG9BIN
         iXcbJTZbFkrAIg5PbjqtegcanidY31PEGNfjXDsaMvY4TlxBEGp27NKQ5a/Yd7hz+YOh
         iMCBwJ4y35q9lZ0rJ0qbbcSdXerVs8LUQiebfCTwerTwr7mVskbsIHVodp/QBhH5vwEk
         D9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860755; x=1789465555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl0avOHzFae6yeME6k9M5ir8m7lNuNYJR44ZHmJ09/E=;
        b=n7kU4Bc1SYMZPCO0eq4fqo3meiyzcI3v6yySqreba87M4ucmt8K7SgAzSI1rnHZ7Bu
         ctNLOPeHTN+djyWeYmy9VclotHKD1EApKHljTzPghPx1al+UwSRn/k3EtXHQ3ioUvrOm
         0LW3hpr4nCmDAy7NQcK50zSzB2OQQvlGP5+nNorth5/4cM986uwHYf2EwsSSvqX54fqi
         LWR9n2ljwrVsfkGXwgUxzzwrS2YwRu86KRwZ7aDE6AQiQcg+YLkBfnARWgojA1fIo5B5
         FAEMEDs72vWAXZ4X0kK7bfv1aYd9ER8iXtS+Wl7PqEQ3U1nbLXfRsJ9KxOs/6D85F2YG
         /Y5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM3eNPP4OC9vPl+HN78lRd6kn1G4ADwXewB4duXSZEOzIuJ/1fMZdWfSn6HfC486vX1fJnO5hM+B2MRtg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8xl4bqT6RCxJF6AG99fvGYKrhvleb6hC6SgegE5voeO/iZ/GA
	75aOPodaa6c5xJBLvemXQyf7xHOZVqekGd0BUS7hruw8PN+BQlA7m04mmBIHJ282rtM=
X-Gm-Gg: AYBFou3MuncrkQU/z9Dg/5xW28YLcA0x1nUb2cybigyqOR8U9hKxfhfc6A4DIAG5pT8
	PjOADKNz9fFXDlEBPRKohv8GwzcmTb2EgEDlhE3VxVxTPJqEMqUaOcNyE8YOAdCAUU+4czz5ppK
	TAyfyIJmeCNG0OAokuLtVuXVEDUrO9S4T3n4lL2tZuwLlg45bFevoHXXHUIiH1bX+4EySjeR0hP
	smCmoZzch+tBhP5KZgMlbdSNC5kb28qfZ0IxGltrmYD+MoI/82y7Mj0SXc3DS+23pj99y/+i0rO
	IoFfLE/6TOC/eebkfsfhu+W58EVOPGN/u8atvQxBOiMdFGXPlhGpusybZdcvl3CiqNuXbPy6Chg
	g0ejszM4sDesk7KEaN/h5BuOPsKpQaV0aSOUmEM9grZhZ5rOEb3relU/f0qX2AW1NrEKDBZxJv9
	oQQBK3as10d8VJdBvn/T+UlEeI6i27n1tDjLSWPjgfX9IkQuKaxaXEiqvt81Co7R2tXm9tHOAHF
	mpPZ39MJ1eyiHGWzBbbqXOjSVfegOlX74F1Nlet1i4eCGxPOcU=
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr181766045e9.28.1788860755049;
        Tue, 08 Sep 2026 02:45:55 -0700 (PDT)
Received: from localhost (p200300f65f19a904516ed84e8e7b3ca0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:516e:d84e:8e7b:3ca0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cf755c22esm381511115e9.0.2026.09.08.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:45:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:45:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <ap_ZJ2jeeNjt5efL@monoceros>
References: <20260908070031.32833-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cp3al62w6dmuwvcj"
Content-Disposition: inline
In-Reply-To: <20260908070031.32833-1-kmehltretter@gmail.com>


--cp3al62w6dmuwvcj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Karl,

On Tue, Sep 08, 2026 at 09:00:31AM +0200, Karl Mehltretter wrote:
> From: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.com>
>=20
> Most structs that were defined in <linux/mod_devicetable.h> before were
> moved to a bus specific header. Follow the movement to get the struct's
> documentation back.
>=20
> For the list of device ids in basics.rst use an explicit list of all the
> headers that have kernel-doc annotations and that are not described
> elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
> purpose, ACPI_DEVICE_CLASS() is not a device id struct.
>=20
> Also repair the referencing in the zh_CN translation of pci.rst and
> don't duplicate `struct mei_cl_device_id`.
>=20
> Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers=
")
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> [Karl Mehltretter: use the :file: role in pcmcia/driver.rst, say why
>  acpi.h is left out]
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for picking that up, very appreciated!

Best regards
Uwe

--cp3al62w6dmuwvcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqf2U4ACgkQj4D7WH0S
/k7OVQf+IlKONDaaztlIwfKaa0tzBz113Wbuwo/LTE9M5Uj8sB6TEzOpdW6kLfYy
/Ff3VZKsMFI23/pBXI6ChqLnre5R88st2b25kIGSVNR/HQdBhb9tDb/+FqGmg3Xe
FtlnJTfXZQSpofT+HFWdjX/JjJSS2ORm1wEV3FS0jBcsWbJX69KYp2OVihcQk7Kw
qv8nvMC4wSPu5pxAaY+b5/ub1LcdOzLaaEPJ11X7mU5dG0MrmzE4brRg0jJ+5yEC
7N7762W0cab51/ZYW9ozmDOsYYWRoINBEuSrfjbKZeDumE3hnD8qRWW/OW9IsvPb
Au1Jzkj1/mkoW7XHNi5yrAXXHy6wew==
=27sS
-----END PGP SIGNATURE-----

--cp3al62w6dmuwvcj--
