Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984325;
	b=PPscCfqLZM02ll9FB4bcqF3C8iDec8GcDWE6JSSf9Xg8WsVLvlrKuob7yYhEpsKo3cNI
	 IabUtcw3rvDkThdcFDBdKbtm12QxmUhOU+oXdHMaP2mK13d/ymymMpn/jh/T8U5BPJLKe
	 Y+RqaO6kg+4oQxFBB2TKoudT0ZIkwUD31hxC5tOfp26w54NmFUn8uoIawPRFhzhxB5+16
	 TtmYgiSyVGq1TytKxamCyf6qAlD8gVp7F+zujWokLBAbeQY/xCExrzVFOP70pHrmGECzJ
	 mpzLS1kxVPBY2q6AcqrSEIwn58EVvqnvdivlLqqlGiWWNiA0LOYoMroP9KkVioSMn7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
	b=sTuhdbzdxhzuTrcl1TU9MRDb2IRuMA//urEicncPNXuhrQy3G7gSr2m9e2VGNdY7cEam
	 Jqo4arPkrAYlrp3w9sEBvKk/FI4ASAIkqFRHqsd6zENHSh+uEX4//43SGBmFhnN7/TTU2
	 9MUSgp6GiGGwcndulwNjuC+ksmbxFJFQ+D97PYdel9loHHReVCmRWMheylty0Igigh3LF
	 pDpsa7LcXCbgcgp3GpYDbQoAxsLR7J56GWOFLctxtdpOTr0Z1kX6I6o19dUkBVjt29eyp
	 VrP4QvnrSc9aRfOz36if14g6QTBuLoWZvtKkZC6jDbCznWdEkdchm+IlC2ZFAkuDx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I4GON4lT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4624A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I4GON4lT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so8334155e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984322; x=1794589122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=I4GON4lTJ4LMnJjronDDWCb3xmSNc2TSvi9r3y4hTMN3ziVDOkQRi3jtKIjBi9IdyS
         /S4O6HMRh2/TzGZ3cyUmOsvkNiCqb7dcOYfxaszHVxFP5+VbKk2z+5vGvrYPawRUul+d
         iqEgqlqI//buO0lrJnqGyAwHi+A6X7H1Mrz6rIUHlbi0do6o6DClyVKtt4DRqZndmcNU
         0m/vSyIV/UrhLeXtj5w9+7/lzdpWJo3KqNqeZGBrRW1NkYGQE7UkWH42vTHFqHYFkstV
         /qgWOwMLYL1djbmuh0gJgf2vhj1WFCIkB9j7pZiXoeJHYb3Vw5MM4Im09HWA4Co1ajKZ
         KESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984322; x=1794589122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/btzFdrmY5XJBoGvPfLZSd2G3pBXBTIwDkFPrz2VqSI=;
        b=WhDsc1PMGqSKThzgfUH6tY4QdhaV7PN/zcEK5f3VLsHZBO2cR2BdqJR+9wDho/w+A0
         6z7VQKI0JS5hkZLTyTptmm4YwLKaFNM1uUORi6mmwC+gU6p5hFlX49piZJkwtkksFkkA
         xTG4Fmlyzm0b2XCMNBF0hyJ57O6VG17XpCrCGvc1fKYAMO1hmJiudr4GRufA1mp4ae7B
         NemlcFeQ6QjyxQq/IAMzp8LV0B/pMuf5B9DdMjZjQe4Fef4lVTcjgGc9WXhkj2vwny/J
         6FVaVtYaqEjmutISqhAVt97a4yILfnyCqyr+9za6c03SbXTlwkeTTCcuNqxJbZcy+IlT
         R5LQ==
X-Forwarded-Encrypted: i=1; AKwUvByOzXZS+TfjCTSVs+qMjmrk5umiUhOBS0VgzTL3Hg+YCorbLwAP3dbgy1NFhkA27Ow+zt8nh+jtMb0bVYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/psEgd0B7iBiMdTtDUPrwaOFxP+0tQiCRdmTLYxB25DSKXOeQn
	VXzYTN1Zla9migKJ26UKIO7uX4OkD2mVF++Shd628pwSSI9Gmri1NEnYAJkBnYDiemk=
X-Gm-Gg: AYBFou1AlxzozPeJOXOlq7uKqzCALZ/M5nwFYys83Ev7dCoY1E0nQ0Ji4okXM7tTA/C
	lHoURlHBQLNUiS/2hEfnYoQflM4GffbcpOwt87pGv7C69bhI2xl1gWXrZCq2ZbXPFzNDNy9EQUx
	hjyuB0wYa/NLvqtuC6GVssG3U/DweTUO9CF67tVqyBsUpVC8959PXVNgSMYrjiwRdkqh/oiBiKR
	PTmk7jcogdgRvFO45juZ5DTwMgoAnRh9GI+LBXZIwiEs97suWk1N5JAcp4OjQ23DD4o6ETIDUCP
	DtLxW8Fi2r/HMLgG/37nnyPYRupZrWCZiYigshSvZ7L4kEB6EEzzXssbUzgPDRFjWYNfGjZGZyX
	nd1kCcmxsowkE1cGzEFJDaDjzkw6+yuRwtCRDgrPK1tmWPiyawvXQQNccDhJ1uhbTSbGSSZHFFx
	1IYbGM+BNmUgM39RopTNIUgHa1ob8uFUMzSBQl2/V1hfMtknNSaAY8A7rnYohbNoAWqoMHA4YeS
	TAHNx3IofQjKrAFtol8w0mZ5Nmy/n47oJFNrZ+XSiESROOtycomvtan2ZH2STRh4sv7LlTAnb7D
	tD0dMAqMh+EQ+S++3o9P2KsAVc00k6OkJg==
X-Received: by 2002:a05:600c:4443:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b6df5eacc4mr55980675e9.10.1793984322588;
        Fri, 06 Nov 2026 08:58:42 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b6e168f331sm84947775e9.3.2026.11.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:58:41 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
Message-ID: <au4HBJBd7AD6WCeY@monoceros>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com>
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
	protocol="application/pgp-signature"; boundary="6cl3pv5jzbmvlkly"
Content-Disposition: inline
In-Reply-To: <20261103042608.387626-4-vamshigajjela@google.com>


--6cl3pv5jzbmvlkly
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

> [...]
> +static const struct of_device_id smartdv_spmi_of_match[] = {
> +	{ .compatible = "smartdv,spmi" },
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, smartdv_spmi_of_match);

Best regards
Uwe

--6cl3pv5jzbmvlkly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBz4ACgkQj4D7WH0S
/k4fIwf/ezsGptNEg+r7UnyD+hRzsURzRkivO2yfuPqRfBVWrIwuZdenZrWx0joB
4KjrlqQByAt9j7aopLT/im6JfJWeKKeIWK6lETM+8NcOC64i8ukxqNPmF7BKnIkT
K6M7XSJpD1vQeLPOETP4L2ziJKD7haXC0+deYYXF25K+4woWQzOXriSGUNj2LYgz
7Vk86rxo2l9KMpeMTov2DHVtY7oV1ib2b5fpJQZCU0SRArZtIwyiEoj1oOK/YvFS
ZnCqYxZGpk1d4REvwo+PUGqeywtplhG+cSDaRexArjzFGa8pCFv8HkCPKSgeZLqF
k/O3LJaBjWZ39Ccmh/36kVLfX5MnOQ==
=lr5c
-----END PGP SIGNATURE-----

--6cl3pv5jzbmvlkly--
