Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270F3EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069802; cv=none; b=LzBL/16crwFb2gDQVN8YLxHlVo/Y+kUHZdBi6oeumpzRYX8YxOenWAuDje6V75Wi+kO82B7J9HGTxlhjiRy83X9jyaNvN8i+qMjGYF8mNHemrMvPxRWS+aOkGldwu5EaOsZgq3io3aXMYU6OrOFR9ByLzHmeZijdIgEfFsSKN1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069802; c=relaxed/simple;
	bh=O4y14nAEA6mXE15roq59xAB/HvwyVk29/R5tLlRP/tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwP5VABDmTMT5GrkUpzaUDMk6DaII3HoXTacbezCpAtsO7S8C2biflQf9CPLeU5+WUSnQS1wXCx/dZ9rPBB+UopOZHg2gUKjSOzOJVaiiLtzqH2Ghg8GOUQUQ/ID9Zl8VWYDGubRg34o6gyb5DHhpOQ4wLUfzlIA63Otd6wEMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id A23D73F072;
	Thu, 15 Oct 2026 15:09:45 +0200 (CEST)
Message-ID: <55218956-0520-4c26-b238-11747ba5ea9e@hogyros.de>
Date: Thu, 15 Oct 2026 22:09:28 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry under
 force-wake
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, karthik.poosa@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>, anshuman.gupta@intel.com
Cc: Constantinos Chalkias <cch@e-psn.eu>,
 =?UTF-8?Q?Bata_Roland_Kriszti=C3=A1n?= <batarolandkrisztian@gmail.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261012104245.2108030-1-cch@e-psn.eu>
 <as_iOd6A_Yncj8Gt@intel.com>
 <55cba965-208a-44cd-a644-e664410af8a5@hogyros.de>
 <atDLRDvuDES7u00Q@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <atDLRDvuDES7u00Q@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AJGqKuh09DWkZ2cOqjycczmr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AJGqKuh09DWkZ2cOqjycczmr
Content-Type: multipart/mixed; boundary="------------UxeokOPhNA9QHJ4YWd1LtkFA";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, karthik.poosa@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>, anshuman.gupta@intel.com
Cc: Constantinos Chalkias <cch@e-psn.eu>,
 =?UTF-8?Q?Bata_Roland_Kriszti=C3=A1n?= <batarolandkrisztian@gmail.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <55218956-0520-4c26-b238-11747ba5ea9e@hogyros.de>
Subject: Re: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry under
 force-wake
References: <20261012104245.2108030-1-cch@e-psn.eu>
 <as_iOd6A_Yncj8Gt@intel.com>
 <55cba965-208a-44cd-a644-e664410af8a5@hogyros.de>
 <atDLRDvuDES7u00Q@intel.com>
In-Reply-To: <atDLRDvuDES7u00Q@intel.com>

--------------UxeokOPhNA9QHJ4YWd1LtkFA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzE1LzI2IDIxOjQ3LCBSb2RyaWdvIFZpdmkgd3JvdGU6DQoNCj4gRG8g
d2UgaGF2ZSBhIGdpdGxhYiBpc3N1ZSBmaWxlZCBvbiB0aGlzIGFscmVhZHk/IEl0IHNob3Vs
ZCBiZSBnb29kIHRvDQo+IGNvbnNvbGlkYXRlIGFsbCB0aGUgdmlldyB0aGVyZS4gRnVydGhl
cm1vcmUsIHBlcmhhcHMgd2UgY2FuIGdldCBzb21lIGludGVybmFsDQo+IGhlbHAgZnJvbSBG
VyB0ZWFtcyB0byBhc3Npc3QgaW4gaGVyZS4NCg0KWWVzLCBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL3dvcmtfaXRlbXMvNDU2MA0KDQogICAgU2lt
b24NCg==

--------------UxeokOPhNA9QHJ4YWd1LtkFA--

--------------AJGqKuh09DWkZ2cOqjycczmr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmrQ0JMACgkQfr04e7CZ
CBEXGAf/XBBpS2sO4gmzGdVzb9m3KGs03e1hFEjwiaCzxlwexmFFYf9NTLtRp13h
NGwKrgxR0XWf+g6GGJ+yejsu8IPTwBBsngLvlfjUiL/Si/d7evAhpfqoSC+Xifx8
R3wuaefXw6WE/vPRbIL/yDd6zzM8WYIn8Sbf6rbNMqssZopt8T6RqBjk2vkIKXcc
gwmnDv5nBmBBdxJh0IiK2Igj5TmRFX/HLUl5yhG6lAPsHsgwqrKinJqhUBhlwR0+
v5ecThavBk5mSGZCN7SdXsjuBy7NJsihdoOaqnsZa2oP2jodeCnHtkupTaPGNgf1
XrEOLTtF/Fn7U+TvJtkGP+vQSLs3WA==
=sWty
-----END PGP SIGNATURE-----

--------------AJGqKuh09DWkZ2cOqjycczmr--
