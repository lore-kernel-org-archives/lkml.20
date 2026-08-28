Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D2399340;
	Fri, 28 Aug 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941233; cv=none; b=IIvYHUuAgjCvUiQobDOcNaKx/1NTxtlXnTLp+ngLsg01WLEfC9o9qPkQ06pERq4gj6bA2w+6IF1zvjiej9VjEK7bLq/5wKI7yBVkz5mth/N+KBN0IiyYo4q5D9ZzBGxRZMc5bZrloJBLPL++jhIZyxOCWc/KjKv0FV4RcX3zjMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941233; c=relaxed/simple;
	bh=QMwhGZJAGr8SNItkx8eYBYOvKS+VSISe/pXl6O6BMMA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tw4sZemqnvTMWcmPPN75aL1LAQ9SOl/ZcKIx2CMCPCrRcqo5C3JFuuYsMhilTkQXe3zyipuvCHBaN0vBMuquxamxpTLfpLpBt7WDnHL8UN3jCpNEIhjTay3uzF94tPa/l4m0Tip/9lQBsw2NpemEzlcGNgJ1DvN68ChRPqNQyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G33tJdyN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G33tJdyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787941223;
	bh=QMwhGZJAGr8SNItkx8eYBYOvKS+VSISe/pXl6O6BMMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=G33tJdyNgabE4IESoyDXoigKgniwzNPwWGRVE/Vte11Ds+3YCN58OhR7NZlkoJGd+
	 yTDDcji3XX5G7JbGsHBrgg9uKXZh7599eKQ+3whHylDJZzj+7fH76VW4+owSH1ghLp
	 +hypORzxG1P+xCAuZt9ZCemCCUiNh2xEQmQ7kLkB12+mSVfKkj8+ku/TyLby8fvtVk
	 YRFjqkjwHLVTDpUFgASy5jHRo6s/ap7gnSUsDl3MMEqRXg9wAuI8D0K2IcxXNXxyhc
	 oCsVRrgZhuympion2YSoJVFLyxkPPeEaYGwG59hCbr7XyMkQ6oi4Iy+U0wMFO9aFNi
	 fjbuhoaZ5cNZg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0566517E07B5;
	Fri, 28 Aug 2026 20:20:21 +0200 (CEST)
Message-ID: <7610c9c97718146ecfd7eea3eb337c1e73c6b1c4.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-ctrls: default HEVC SPS chroma format to
 4:2:0
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Pavan Bobba
 <opensource206@gmail.com>,  Detlev Casanova
 <detlev.casanova@collabora.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Sakari Ailus	 <sakari.ailus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Date: Fri, 28 Aug 2026 14:20:20 -0400
In-Reply-To: <CACak8wMDzt8d60DkAvgvwtnxfhuwJXPc+mDn2q7jpnQsmb3KLA@mail.gmail.com>
References: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
	 <20260811170414.644-1-tharitt97@gmail.com>
	 <CACak8wMDzt8d60DkAvgvwtnxfhuwJXPc+mDn2q7jpnQsmb3KLA@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FQTQ1Xrld4ptn0CF0FWV"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-FQTQ1Xrld4ptn0CF0FWV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 24 ao=C3=BBt 2026 =C3=A0 20:40 +0700, Tharit Tangkijwanichakul a =
=C3=A9crit=C2=A0:
> Hi,
>=20
> I haven't received feedback on this patch. Is there anything else I
> should modify ?

Sorry for the delay, hopefully nothing, we'll get to it.

Nicolas

>=20
> Tharit

--=-FQTQ1Xrld4ptn0CF0FWV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapHRZAAKCRDZQZRRKWBy
9J39APjr/Jml3vOWkvso43k3+P4l4DEktkde5OBf722eQCkgAQDYsHre9OhbE0W0
nNCMrBeXssVh+91ByqICfEqj0YAvAA==
=Yb+q
-----END PGP SIGNATURE-----

--=-FQTQ1Xrld4ptn0CF0FWV--
