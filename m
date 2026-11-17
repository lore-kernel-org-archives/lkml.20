Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927199;
	b=IQZDLiJh2/i1iji4bWSa3r1Xeq9BXsfeNL8tX1kXT6cYsKfDawQyHTRdVWBgKFZAEIiA
	 uWw2FEhnPGocyJQA57Icx7LT/Ex0GuwoUsMibnjt2ySXMLL6+ry9dyZaWlu+t4fQW2x8+
	 YU0ZZEUaRJFFIBGyzlHKTJ+oXxVrXdvbyzXJcwZ3gytD6Y0xE2kbYkhXJTZQanCpXNSWe
	 CZmZRiSCuStLGP8OZr1GjSOZ73Mn28QaYXGNOMY4wuyj3nVAcO8z1SAciNGB4HC+20wHX
	 2L0HWZ6Kbv31/DXvz37mpJP0Vzx2En7xcypnzP6tKByknrcLk8cP7G8dKV1tmEG6SfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wNETq+Ff/SnhN0Xl2bbtJYPFZmKfGR2WilYu2HW4+tQ=;
	b=TLlX7U339QaiedPd7P4SmuLBtZ7AAo3zzZXRKCXXrJ8l/jZZCxaolcfo/S/VAVT3e0c0
	 tA6FsfX5rVaGg+KssxNsTP9qcPOThHkTfDfSH6vHl42I9yNMru98I6eQSlcQ4vU6ATdBm
	 tSdT+gZ8SfOqTCYNhw/g0s1DAoytKdE7RaWHNJeLBCbNj/daI4yVduaLoy2MLMK37vPgY
	 falh8j8LMxRGID2AOkU4uXadgcDljfT1BQtybLI3y/fYPg08Oozb74n0M8wgWqu8GXJ1F
	 TjP/t6I/+49lXiW1ZDlhT/aUXvjrv/ei7hqpldU1+soPysk5uBUOPlEo8VjuTD8sLlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="aaX0/Qxo";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ABA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08ABA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aaX0/Qxo
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so2404644f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794927197; x=1795531997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNETq+Ff/SnhN0Xl2bbtJYPFZmKfGR2WilYu2HW4+tQ=;
        b=aaX0/Qxogb4RH9yNoGIjfdSqe+14wxy9gGyt7r2HbgtqKklcqkhiLNRZUKhGqRp6X4
         /k8gOh29+UBw1ZEAyfB7GSwNFn29RFo5fuz7Y1n6sFp8w7grAc5qBL14txgTKF5seZ7h
         ybU285eCEL74wP173FrCw7isnLc9RU0PHolSBbRalWyndqE/2aYiALn05GjuzpD3eFH+
         u25BpXmIBdhECB7wVXIuxsTBanz7AqWqbH3MOp1CkFN5Bdq6AvJFfFdrXrGv37Gz6tfz
         4dH+m2Hc6Dh8GLVQeh2a6nw5ue73Z3WX1FJ0LIqvpDB4OcvBmo2nWDkUd/0V9NIZhUFK
         P0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927197; x=1795531997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNETq+Ff/SnhN0Xl2bbtJYPFZmKfGR2WilYu2HW4+tQ=;
        b=x15p2x68TKnPJ1W47FsH29N08LBWfTlonZyI+Xxc7ImwKwvdGQsFNBPwlmzfRA6ce0
         eLRa+lDjRfbg+D8p7qU+dsbrraTXS+C/3BxsnzNgbbv2LHFIN+fli/RjXB/1KbJwW1AE
         OS5sgPrsE2DI1/r/ysZ3HUV1DNK+D+BNQimnE9hz0TvTzNTYdfbuSLWreL/GrqzLgiHo
         G9azzcyf36Jimf3A5wiM8JOoCVmdJIf6g5U+JNwKf/F/I+n5NONEEhwiq9tjM0gHwOpz
         fCpkfeADO6C5l8b1xc29EYZ7xoAPkaVSDUF1HLGW8js91YWf5RLG+9uLK2hprEUYzzo+
         DRUQ==
X-Gm-Message-State: APuU4Z8OUPhTSd6oq1Q6km9WeHDVDzEAU8S+fhD7Vl+01NVtTiwT3BIK
	cvs8+EWKjxIf5seMGbRUhqlQ4Hw4kPyuNygaPEL9lv5QDuaKcdprueY5eS8nT2kuS84=
X-Gm-Gg: AZFdTZe/40Wwe8pZpwG1teC3GCji6niQfPkDNdj3OdqXZavP4jZWVQ2QlXa0jKqmYSy
	OTqBDGe9WdipgmvGvfoOgUJjdIILNUjT9gxwxAMBsCiozB4s3g4cmcEAnv0VIs+XRvyQ+MwgbTA
	hDJEtQkDi5WEX2PQZlLfgHQRrrLffmgWgYMRL8KweBslX06J7U0ldH3DRX1Pw7WO3l2hDUfi7+H
	nAhVrOg7Ff5r6kFdoUhSrQILCOGxQNFw5yjbbXQvCRQXYOHs68F1+UW5GeAtE/fFsp1/wxzhJi/
	HljqHpEzQ5T5Scqkm9O+z+SCtXhAOi/8/TXv72wSMzZo02KVSheQ7tzSWnUHdKnWuQE49zDQ4AX
	CoRumfQggmNjqSNjmAs1yivLFMNcLFtS0SpHtKf/AeUusxM3uTHdGzjOy2OxNNYgyjzcLyyeIYz
	lv1zR1/Fy6u9k8NPDbGnsh68JeICTsbtDmkxvs2Ip2OJ1YtriglDx2Llm25xSIz+UVaF20UdBcL
	yLwifH5qZ7bjvmd4ESpByTNw2571IVINdnN+Qmk5RO4aZrwlAcM6KnxKRTJHG5cuscLH9EbEP7Y
	L5KEtnhGCAX/EwoWA66A/R1Lv3aPXAJ7GKxJhH1ldLqG4wJTErSCWr+IyWaHm+3SLDkKfN5PFn7
	oSySKy/ZrRuHDzLQOibtWI6hehYh8TtW0+eDR
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr29054485f8f.13.1794927197276;
        Tue, 17 Nov 2026 06:53:17 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4a32155283bsm6192997f8f.37.2026.11.17.06.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:53:16 -0800 (PST)
Date: Tue, 17 Nov 2026 15:53:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 0/2] extcon: Rework initialization of i2c_device_id
Message-ID: <avxptCL2mq7Z3vPi@monoceros>
References: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
 <aimaTrJvXFjbDDTB@monoceros>
 <aloDsjYyv3gCsx39@monoceros>
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
	protocol="application/pgp-signature"; boundary="fdnbbxyr7qeu7qu6"
Content-Disposition: inline
In-Reply-To: <aloDsjYyv3gCsx39@monoceros>


--fdnbbxyr7qeu7qu6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] extcon: Rework initialization of i2c_device_id
MIME-Version: 1.0

Hello,

On Fri, Jul 17, 2026 at 12:31:20PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Wed, Jun 10, 2026 at 07:10:51PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > On Mon, May 18, 2026 at 12:41:43PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > Hello,
> > >=20
> > > I plan to do the following to the definition of i2c_device_id:
> > >=20
> > > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_dev=
icetable.h
> > > 	index 23ff24080dfd..aebd3a5e90af 100644
> > > 	--- a/include/linux/mod_devicetable.h
> > > 	+++ b/include/linux/mod_devicetable.h
> > > 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> > >=20
> > > 	 struct i2c_device_id {
> > > 		char name[I2C_NAME_SIZE];
> > > 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> > > 	+	union {
> > > 	+		/* Data private to the driver */
> > > 	+		kernel_ulong_t driver_data;
> > > 	+		const void *driver_data_ptr;
> > > 	+	};
> > > 	 };
> > >=20
> > > 	 /* pci_epf */
> >=20
> > I want to work on that, but I'd need this patch series to be in for it.
> > Do you still have this patch on your radar?
>=20
> While I still have to make several patches land before I can modify
> struct i2c_device_id, getting the patches from this thread in would at
> least make my queue smaller.
>=20
> FTR: The series still applies fine to next-20260716.

It's November and the series still applies to next-20261116. Does
someone still have this patch set on their radar?

Best regards
Uwe

--fdnbbxyr7qeu7qu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8algACgkQj4D7WH0S
/k6vBggAjxHTmYI7C5rpFV3EhXysXCGp8B4SGkJZowz+1A9ZwwJFCYrTkSkZHBON
qVYJjM+KmfiGi9iNkngOiq/ousd7TfHwd6p0LHY7188JX+0GuN7fC2VJSgxJI62v
DEABCr2OSieg1Dbe+THF53hH3Oe6KTbGd6lB8tlsyBpyemEzeyFgVDPNxiyimeay
OWdNO2A2eJwSXfnxA8Y8U1BfEqF3rL7UFvn+H2p5zuWht/Mq+2fyAaa2MmjBom2k
R09jcQZZ+kR7ulpiJVYfs17iGD0Z6AgcYDf190oZaLhgUDqiZ8JHJjKqvy8zBKBw
n8dPKQy6HFSlLJBWu1Rd9roLyQBJxw==
=rtIj
-----END PGP SIGNATURE-----

--fdnbbxyr7qeu7qu6--
