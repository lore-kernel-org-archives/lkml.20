Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310463;
	b=Z0RqT8JpPrS/fulOTQjw2qFMzQAVEj1NGg5tFVGFbYeBbzFvwkoKwKK53kXm15YDofc2
	 Oqdxm7YHASaVK3lfYd+ijgnp+C2i63xiWusUFZ1nrVR/esEdQ5RnCdcIDG/5/CZx51ceG
	 kyS1Rso4ngFYkDB+w6BhmhIJhHUMEHek6juX4U2hNsNzIBxodv4TJtA8KR1gxWefb53im
	 BsDaz5Qhfw5hR0VzmoS8xDWkQHalCauP7q6Qw5XNOFwWNMoKIen2lfz+7dgd6PogRpENC
	 rBOXyRolcnt/Rx+dx1++hg+gi2yt+b2SBr4aHOJkm4jojurxM4/O6oTnE2g0sa6Q3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=A1iRNpBx9Vkn6KLemQ9yb2w9fus6xXpTWWEZmDoLP8k=;
	b=YnBPcoLySAJ57m13PgpW2sRew63g7y6O8/GgEEZe2GqVj/W85+aHnIuP2joDuvvRKWML
	 w5LnTyTYxE70LZYfHxPIFDhz7mNzCqxPUrUozHJips25qATPH0Ve+lVVAfqB8+TzclGsw
	 4KgzSYVLBhGUTJO95UfJrx3dP9zI1XqIaN1bVB4vV5aI5hlY/pF8FGvUkjFiRZ3aSeMAY
	 VRB2/xTSx//yUzq4Dac+Q+Gf/178SJLGQLi9OUwCSceqqNBDGGboB1V6gkU9nlQpcj4Of
	 tPH02rxw/l3L4V08mIEKhKHZYOFoW9F/Fm/NbOj79t3x/z9d8J4Z5Ob1YZ7NQ8oTdRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQp9MOed;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A871606A31C;
	Tue, 10 Nov 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQp9MOed
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09521F0089F;
	Tue, 10 Nov 2026 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310462;
	bh=A1iRNpBx9Vkn6KLemQ9yb2w9fus6xXpTWWEZmDoLP8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQp9MOedjTa4T56aPO+6PIF4YtII/xxEgWNtQmI7qbATWmTF3vffiS0nezH8jdZst
	 o6LNStAURcGZCYwDsrWnhej8000etRyTvI0FnTzChoG6z3fp4ktaRYdsHxE2AyhYtl
	 m+jZYIyKGQ3whMDNcXuCcOhYuLVj5SBYeNyUwUw5jP84D/MO8uW1ua51ygqAw1TTxW
	 UMOFNtOMkzUfBWMKfmOUm8P7/eiAcYzwufWOXln672/6GPtogqHQob9sZuHf4BtDGf
	 /GEHvkJLno+nP5+1pMHzUddiYk2nXQxVU8Vzt47KQkJvUMerExUmUfltZ8DXcoUU9z
	 eghOZE5id0iOw==
Date: Tue, 10 Nov 2026 12:34:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sergey Lebedev <lsa.uz@pm.me>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, 
	Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261110-normal-ingenious-kakapo-f8c479@quoll>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-2-lsa.uz@pm.me>
 <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>

On Mon, Nov 09, 2026 at 11:28:35AM +0100, Benjamin Mugnier wrote:
> Hi Sergey,
>=20
> Le 09/11/2026 =C3=A0 10:34, Sergey Lebedev a =C3=A9crit=C2=A0:
> > The VD55G0 is a monochrome global shutter sensor with a 644x604 active
> > array, sending over a single MIPI CSI-2 lane, with the same supplies,
> > reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
> > 1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
> > its I2C address is set in its NVM rather than fixed.
> >=20
> > allOf moves below required to carry the if/then for that minimum.
> >=20
> > Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> > ---
> > v3: no change.
> >=20
> > v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
> > with allOf below required for the if/then, as Krzysztof pointed to. It
> > is Peter Marshall's 01/11 and 02/11 of his vd55g1 v2 squashed, as
> > Krzysztof asked there, with the VD55G0's description added:
> > https://lore.kernel.org/all/20260918221705.323510-3-pm@petermarshall.ca/
>=20
> As vd55g1 and vd55g0 are two different drivers I think they should be

We do not split bindings files just because drivers are different. If
bindings for a device are exactly the same - and they are here - they
should be in one file, for simplicity and less of code to maintain.

Best regards,
Krzysztof

