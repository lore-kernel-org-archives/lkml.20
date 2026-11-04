Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788419;
	b=IYqvZdY8DXblpf32ewPxFif0inW8elL9O40reSM4pwWXv7uKqBAfxfrLTyu2tLep8HyQ
	 uydtg5UgVQtjAW+aGb3/yd0hOLLwoR9QHvHmKinxOjY1rCpwJPvrKPn+QFnkRIiy3vTe0
	 YoCR7RiJnyqXj7bC0fWjjo1LcjtPTwJIoXDnt+mMbo97KUNuOW8qq2Frg02je6GcCieHS
	 Y/1P8NrDPJ81AXYd+aHxU4G9FxmhdzuBSbwzgziYXm/3zAfsJCPAjc8ee4yMvo2j/EMbb
	 AI47/7c11m3sKIbuW7EF91WnKxMsIfBhL6L8rzvO9ps6xHsp+Qb0u1fwGPkxwfdVR2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788419;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1v+vPQfoGkHCsYpx/z+qXBL8qgnFTSPKxQiCiSOUl6I=;
	b=gMo+fDX1D6IS8R3bi47tMFK7ZrRyg2EuArDYRCpotyh55BJJhdrQshpBH785GIs4uod2
	 o3EOo3i2rSPsy+M4XWtSaD3cm5iPmtfCYjyczNYfUSZrS8/hDAcASTt+AUVH7Alq5aEzA
	 Un9Hdc33hflc8WIhjh8/DZ2lsI+ysqfnbbXVm97AoqIg/48Q7/rDa3V56d4mUtf1LTVpE
	 kqQWIS2ZFxQAlbX9YoeEKWbqKMtdx3/YzFZx1d1fiNqKZnS8jS6ocVaXRHIfPguMej3Nk
	 HjtnhKeMV+pIlPuqTPBapEI36rRDxaWfF/cvg8L7j3jaZnP5s3rxWI5Wqk7k7vNGZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ix+mIwtO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5B606A31B;
	Wed,  4 Nov 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ix+mIwtO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D081F000C1;
	Wed,  4 Nov 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788418;
	bh=1v+vPQfoGkHCsYpx/z+qXBL8qgnFTSPKxQiCiSOUl6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ix+mIwtOotDrvMTMvDOWVWhNcuHZp2MmOo5SOh/5vik9pHX+wphcZRkXh6OM5O2/X
	 QIObD5khAH4S4R7YgYZDKnsYysgXsY0FjlXVSTekeUTw4h924CjD4L3wRqQzej3lgd
	 CwyVUe4nn1IwD6qMcciN+QEbpGip/SvHoEoxH7EmHW7NG0Q29Zq8wEXx15FE21WX+V
	 Tvt6JV0uTrbVLbs9ziTdVnWdYhkKwubFB/9nyNX00GG7eWg4np6SMcRREE6DZp3OoM
	 8eWyK3sO+IFvb2eF7uoOg+Rd0e5cbiQbuXhD0PTS/99PTQudUVuE7OgEI7nhqxBAkN
	 OY7T/RiIS7A1Q==
Date: Wed, 4 Nov 2026 11:33:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261104-ethereal-cassowary-of-revolution-ecdda2@quoll>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
 <20261103074913.1971025-2-hongliang.yang@cixtech.com>
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
In-Reply-To: <20261103074913.1971025-2-hongliang.yang@cixtech.com>

On Tue, Nov 03, 2026 at 07:49:20AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, a multi-port
> SuperSpeedPlus PHY supporting up to two USB3 lanes.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Also, does not match From field.

Best regards,
Krzysztof

