Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600238;
	b=JXKrLI7ysfeY5ayIyAxT+wF3XuQh9kPxinJ5x8Lcrjpsgl26RYxWzapxvT6uQUz77UMu
	 WM+IfG8aPQ14FYor959LV+srYTq8rpQK9hqEqsdOZ0uB8uBt3nS6t/rQMFY15B91uL3w4
	 M8PuHi98pCfJLMICgMO1hU55fUp8v1gEu0z/KPWggWaPcPe5+ech9oQd+53fo7Z0Hrr8+
	 ICi+w5k/1PJZ7sRwAqFZJhOfZBZd0Howp3GQi/ZPVdhSNbkHB64soPig0jxSBBDlVv9XF
	 e/HBofk4MOuguXlVJ7bEPvCLQNlTtJktOY63dOjFPK7dr+KQr2cFyZkwPZiTInszAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=;
	b=htIo/ClZkTiLHiLvVUvpsEFpyjkNFMk5hA9etf+zWy+GZqb1Y5d6qbQ1Y79ygQJ0F2sG
	 9Bmsdibvwh/Fhz/4ANynEkpI83jb5VA2GPPhv9kVT2NCELfMZwZ1hpbeLP5IA50FWF46s
	 SqNjTqxwziAOBuMkvID21C6nyv/FFgKeLZv4sDoLdb7DeWAgTmh5mg2NAW/0iJuLO9jBe
	 VlnDpRz3MLZ6I7XGZWwJVXVN0JbPCyfQ/+Gu2BbUDDVtPTF17MIVadznF33iXiHG2PIq9
	 k+R0B8V2d4QHiFi/p1MLyHJx5Hb4EDqNpJLCE4noHYpKu/rE3pPz1oZMDOIR9jeH//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W7MKkIT5;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA79606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA79606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W7MKkIT5
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4919a880834so677800f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794600236; x=1795205036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=;
        b=W7MKkIT5Q9rh9Xztw2bm3uuHsYmv57VQi0+thtSj1D49fTxRDDBbJsNmxOPGE6WBjU
         8lZK8u2hqd0IgRPffQoF0dFu8gcIaHJBOeoU4RIDer+/evIspavw77sHj63HL3ektFDs
         Rah12ZicLQ/lBGIH/2/KeADS8NUu7Nn1dNu7nngAVc64X+T0EZrrC28OPQpR/UtJ1Xj4
         qPhzuPKFw5NLxdskX8de53t42gh9dN68uZKDCr+Wu5FGs/ZvMgDUx1KRYMyxttmF7Cgz
         rQAVPfhTqOJCCRwvvkd5FcwP7b4U3MQOIlP/UtkJexWGEW3ko/rm9sAQPOJm/uAhq06q
         ltgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600236; x=1795205036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=;
        b=TJYxIDevcznqK4KdDn2PJXvY5Rv/IsEu6l2NigGGZ7B0uIK2oUyyWCy6mF9PLU9bx0
         KdM454+pNwnckInPQGr2xClM6Q+8xR8bG1br6HPwStv7uae60DUrVb/T1UeWsRPGCMC1
         4NFBeOce7T+3nvSA5ypbjjeq5JktSojLePxAEgcsFxO03KhJLFf7eRInBhM+bCm2MHbf
         TJnOwpzroCgU3zke5rvZ9heBTgQAJPUU/KSsIM303zTTng3B8XLElzMOTsZMjJA72s57
         ldyKL2SCeoBDnFuLl3xElXGkapdvClQJK3DCrqf4whxJt4qPfZNqq+9wnD06xz7gEzXb
         blMA==
X-Forwarded-Encrypted: i=1; AL+hErHieJHe6LjpjPhNrZyboZ1XO5WEBS8swy9OS0NdNw75TYrR9dbhXlAqy9oG+YzBY4gYeXDXzLCzmXq7Tdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DWixehYLwdXq1FeLJ8wn101ZnEqijsQ5pNo5LQucWcPFEVoMa
	W87jSKDeagu4E0PUDsLhloFHMyKSTUVMp/9AexyWUEU6T5XBhlO6iQhD42idk0N35IM=
X-Gm-Gg: AYBFou1n3eGj/zl+mVth7UFdGN5dkMWP5rRr8cdUxSaod4pFH4/OU7aBxfVl0ujj/DS
	/o7/dB21LRIOmxus/dbZt813SJQd0lGqOQu4gjIfwtci6IqMugpbE8YvoTlIVwUA/aAsCrkwyW2
	y4O2AUhMP0liiXgg8tIDsgvnUAZkKOOizZ8VnbOUFjQaQkPsKWqm30cxV2rnlObkwBxlr7FmZej
	R/U/zj5qXinI2Q5wvaQTZE4BSvIQdTMQfnz062u8h2RyTjV6E6rmXdtupqpZBC74HR7SqkLiuFZ
	uD6D2PdIKZCp+3qwqVFMwefYk9Dq0Eduwl6fC1w9v02GbX+mj/bTItdrszgqzc+Tk86nNzOWgKM
	NZcTEGR3rOX/9zihPVz9A2l28JRQR64cHfh9cPmuIzIfuTPqscojZ7Pt0N2R9HbybnxnIZNbkSn
	e4EKBIOEtkCCViHhTFUWGjJOcc826a+HPCa2RDe4M6lAYG7vAPZOOK9eyHF3gNfCeTnRPwRBmXD
	Nif1HOu2rLqjyASPUJhAiJg2aQ3oFHlEq0XrBHXPRrXgN/pAXjheT6/iqcmJSu2mn84tCvd7yBS
	PdTX9KA1CmR+9oLdgbxfYBhMGx0/hmKJs+DVPHAEiMqMdGskDDRsBTu9
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr74738355e9.12.1794600235768;
        Fri, 13 Nov 2026 12:03:55 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb55ae5299sm94406885e9.11.2026.11.13.12.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:03:54 -0800 (PST)
Date: Fri, 13 Nov 2026 21:03:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
Message-ID: <avdryC3GOqVNVF8s@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4g7esaq7hdzrtwtt"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>


--4g7esaq7hdzrtwtt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Fri, Nov 13, 2026 at 12:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capab=
le Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > From: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> >
> > Hello,
> >
> > this series is about preparing drivers/acpi for a change to struct
> > acpi_device_id. The idea is to replace .driver_data by an anonymous
> > union, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for more details. (The linked example is about platform_device_id, I
> > intend to apply it acpi_device_id and several others, too.)
> >
> > Before this union can be added, all initializers must use named
> > initializers (C99 calls them designated initializers), which IMHO is a
> > nice cleanup that can stand for itself as it makes the code easier to
> > read.
> >
> > Pawel sent a similar series earlier, find it at
> > https://lore.kernel.org/all/20260727-acpi-refactor-v1-0-ff900aa326ee@th=
egoodpenguin.co.uk/.
> > Compared to that the patch splitting is done differently and the base
> > here is newer.
> >
> > I checked for the other *_device_id and for these there is nothing to do
> > below drivers/acpi because the few instances already use named
> > initializers.
> >
> > The last patch in this series is just some cosmetic to align the coding
> > style. If you consider it churn, just drop it.
> >
> > It would be great to get this series in soon, as keeping it up to date
> > for a later resend is an annoying effort. Thanks for your cooperation.
> >
> > Best regards
> > Uwe
> >
> > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> >   ACPI: Unify acpi_device_id list terminators
> >   ACPI: Drop unused .driver_data initializers in acpi_device_id arrays
> >   ACPI: Use named initializers for acpi_device_id arrays
> >   ACPI: Unify *_device_id list terminators
>=20
> All patches applied as 7.5 material, thanks!

That's great, thank you.

I fatfingered my author address in patch 2, so if someone wails that the
author S-o-b is missing and your tree isn't set in stone yet, something lik=
e:

	git filter-branch -f --env-filter 'if test "$GIT_AUTHOR_NAME" =3D "Uwe Kle=
ine-K=C3=B6nig (The Capable Hub)"; then GIT_AUTHOR_EMAIL=3Du.kleine-koenig@=
baylibre.com; fi' next/master..

should fix it. Sorry!

Best regards
Uwe

--4g7esaq7hdzrtwtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr3bRsACgkQj4D7WH0S
/k566ggAp3mVFLzwpw2p/Hu9/ihSgiW3Z2Tu9oz8iP6Hksl4NiASgBy6mJoash2/
ZDHfLPzYzE0YsfjakvmDc8blOwPZ2QV69Vx9Fc8fLNJi1PvJ74rqfVIPonGSvdXn
6+2YBRjK+POnqAPEnXAd9cApwIMTQ9NYSvjrWGyQouXTDKMInmgoLfb/tYhLof9q
b9dnQA9vTvGhMcKgdtAHObnpFXb94+Jl4CWWoU0Mk9QgO9AOxkb9TjdpZqPCXbcB
A/FFYcgiErFTmvM7eidmBfW/sKlCCSyQdTjpteEL4Nov/1w7p83cyHBBPnKx/mDk
cN+flW8XminlXyu6kws4p0NQuaFi8w==
=bkIh
-----END PGP SIGNATURE-----

--4g7esaq7hdzrtwtt--
