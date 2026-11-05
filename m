Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879535;
	b=3zwxNpnu3/yRd2bcGaViXIlXiO90piRTP1PHyMEvfvLQZ8t95v+IQIrCXOsElxrlWVXy
	 Smmjx3XFNvW/rDtQT1t9HJn5/VYXJ9RE2A1BTHk3yvmpLLh3RozH435z2CO8PuEdpUiZO
	 1tduLX+9Vpb4eH5nnHbJdcqSuwM/QeCgwXKPOrnFh27rGPXUGuyBwU1OL6qlSV49D9GT0
	 lipAXX+5uTbywvwxPKBHt/PGZfR4D4Cei7I28+mGtMmY/xvMugF9OYR8Vqy0POchn31PH
	 I17ldTv0yteM4MMeIOF+dEIPysYumaEGw6m9Y8uNaA5negTkD+Akxd8oy6gtfsts8qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879535;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rD8RmJQMPrsB8PneNmgZfAY2EXizpS1GrqOCM57L41Q=;
	b=hLu3CTwaT6FSrbOXLFtHJbaFa9xVExIVEcuyVsXts6bRNUbBuJ0L/K0IcOggRN1Cgzwm
	 2NOnNM/qsnmYkWXRHBzI/etPZB0j48ujMXa7YSF4kOTXFEL/3FKVUf+B+Jt9K8tBLy6Xh
	 1kzbC2zDHXWZRtDeCuqi7vXqxExne2QDOQvZc+9CycnepApEzXkhLNm4rFt9dg2Cz58Dc
	 Wt1Hjs2zYg7GPdW1L3BZdCJGuQaaLBGoeK6OCoNrjaoblQEeH0efebxy2n3Bg7+rOBJfH
	 qRy3JTpN3+9ehl+24VKOAb9Rh9U5rY3PIcyXd355dLBO9Fp2Vi2ZIqtoiPG4ZlbpHIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yckc27hE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD2606A901;
	Thu,  5 Nov 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yckc27hE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BAF1F00A1E;
	Thu,  5 Nov 2026 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879535;
	bh=rD8RmJQMPrsB8PneNmgZfAY2EXizpS1GrqOCM57L41Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yckc27hEL9olUgu869FUQCQ9mLJcNnti/uo61805ZdIL9ud0XP4WrNlW6ZRhmCsDU
	 E7fI3BMRFZxKzMWFrz+MqsJAfTvE+aKYY5tG5+ThqSlFGqfjKbOoPNLncfPdVPHJ70
	 Ll+YnrbD8Dm8KML02lcJH8mGPCH2dXuHorKsjB9C3dD0T6FtRy62uddEWYBIphwU40
	 KCkJuhBECKiW03R5p2mjrlrEa+zWGIRsSYxHg63jVlYW8LYxmMOYcJfRN2Vo8mltbg
	 3VLOZgxgcY+uqNvRDVWTZDpcVtoQpc3u89DhK20bBDTKf3NoJJE1pGgjyXAWRTJk6F
	 0FGz6ZspxCuzg==
Date: Thu, 5 Nov 2026 12:52:11 +0100
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
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261105-kind-macaque-of-enhancement-ee0365@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
 <20261105011751.4058411-2-hongliang.yang@cixtech.com>
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
In-Reply-To: <20261105011751.4058411-2-hongliang.yang@cixtech.com>

On Thu, Nov 05, 2026 at 01:17:59AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, a multi-port
> SuperSpeedPlus PHY supporting up to two USB3 lanes. The PHY block
> drives both lanes and all consumers share the same initialization
> sequence, so the PHY provider node itself is referenced with a
> single #phy-cells =3D <0> specifier.

So previously you had two phys, now you have only one. Confusing. Where
did the second phy go?

>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Same issue as last time.

Best regards,
Krzysztof

