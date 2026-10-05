Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052413B994A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234845; cv=pass; b=mU9SO/UtyIXeObdvAIhgLXKK5oTc84OT3IhKA+gZ+8592fuSOmx0chluug9uzg4NO7Kcas2NejN7oA4H78TMIJgwKWQhutMtZYnaZUJ829Cg62FH1snFdflLiFn1aUPVZQkBiinxwn6tbydN5Gwi0DJ5X6TmjRKAdLsMJiPxIIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234845; c=relaxed/simple;
	bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mpx8TDzQNXHki36w5zIjN7HDlU07GGxhxRo1biE574ktoeUBZ5P/O8+yqdcgZvsYJoImVj/NCgfIl+j/gvxWXSomEQHvhcmgQkU6kHbtFcdYz4Rk1v6OvP8TDUc47f/iW1wUWlbuGPOjbzqySfB6rF+lGA1eWHTc3SDEsUWBA64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLu7YO1s; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLu7YO1s"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e2e238134so151271066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791234840; cv=none;
        d=google.com; s=arc-20260327;
        b=CFFbezqpDC/txKS1C9HClFIqzhZMSH7lF1fpuJenIkhwdXTgGXHnS2u9bHFTZoywFR
         F3OqImPJ5F1XhCqeML6Rv1hoQ55fdUNp5bGKwXqkNYwfAiaAL8LzLBDqZHWmDgBgf/Vw
         AxXSzUv20QWx6et3OaKKF2Fknfu03dgTPeJvs82KArcB1yDYU86ZwvyuwKbN1OTAJxys
         OzXXhAOFLRPTcfFxDpubLILiDB/V/6+K52cAM1+DBQkPBoRPob1BxVRT04PJuqJvHAQE
         5GKzZB7jN0gyyb5yx80POUCcMe26xzyCOV6pFky573tKtyC8YTpAXnji1jdvZnwW+ivM
         Pk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        fh=yaxsgAU9bQk94pMtdZBZWkaL6oaNamYPhGLxl0QJVC8=;
        b=T+fMXpNyDjvMMzeZJMKFYZMwDBaoaAD13wlphfICDRlSEapKblt7q15+ExEqFQwWOZ
         llaUbVO353Yh1OQ4/1sSBIsdAxo7cCUJ0dSE54i6wdVFVf5wIqMXX7b+zZOv7UD0C34j
         d+9lZSaqjRKz7cIx4BUlxxe9BNmxQF+8ZRM+U9CubqlHxsRdFaiawN31S5XZielz1jwJ
         oO8DMEMGddwnvbHgZnP3DYGiNF/1iAw+3y1WS8AnoGDt0ExNSG7IF5gs365QEJUR53m7
         OlBsxJdrhi9yj7Ub3TQAXAxUzkVXEjT7LMoAx0T810rTl5HgHbBXpramX+8fUbSfwegu
         nVIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791234840; x=1791839640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=lLu7YO1slAZEk+Wl6hSffZxM6Snh1lZSsi+WQAaXaQP1v5bvYdKtKSYhsF25BnML4U
         HcAmNaR1PG9wcCytglUyreRWS7KO/AQPpJ7F9m9KzqPlnUqdYVvy2gRRLgQ2BIZl03K8
         xb9tmKEGvtt8s3ek77sLxtrQ7aINnKfHP0ZyIfCvUU8nQZHqAMo6SVbKZMkI7qKXCZik
         27/FLQ6WRy15QyDVTGHvsnjOdlYnpjD5DIJb3MjNJAUU5+imo662ezsCPYAzL2qWrAtY
         i8pw5jFnjpiDUwQDMWI+OXVq/Ui0SOLBkBll3qYBsMJJ61hCONI1cQM8TJCPUXJcJl2N
         rpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234840; x=1791839640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg+48cepgWrDgUNaKNya1rXBAe0v3PkEajJvFhN8l1Q=;
        b=XDcDfBA6PS1vzJa+rRC2NeV2wG3L+skVhAX2eJzQoPjFYlFAYnq1JB+k3on4hVNa9W
         eAPqVjUCG7sZVEXbLKwdj1/NyNQPTAAfmCq273kUl6F3kM11e8S2gfgdP87VmDU9ehDz
         Quu54moCA2qF4BGTEe9CU4Uskyll1aIt5pkBoh9kYW5l95TE5Z3xUhj2kuZH4RR/POkt
         i++1UKgulbTJfQcL681PaWTU54WMYQciHOJ9fr2zGNTtngvLVcqDiUK7PMqCxEK1fxtJ
         b9xkKxC96qqrQbHFtR2aYDPqdEynUuepqqyDXoyqfocpGRDESvyr3Y1GotmnLa4efmZ1
         F6UA==
X-Forwarded-Encrypted: i=1; AKwUvBw0ij2wKyHpoAjKIxQzbYglGv6LcRqg8r8x6hGxi5uRmsstiMezPzla0Kl9n6otHVP/NJG3pm9lYEDuogI=@vger.kernel.org
X-Gm-Message-State: AFuF++kV3d0bTEqNRdw5gyGGMVs8NMO7b8j3wXk29d40bCjwTLy4wKGk
	rDezDLwrjb71nal2/cb22b3dvxqoxDVyeVR5EULf/+hU3zh2oRLgOXQX3SeEyfpRLvxVn2DcYvH
	8SkMYMkHhBhiyAMmK+l108RcLTjQHZdo=
X-Gm-Gg: AYBFou3gd5UMrNpEDOKXw8yrGpSUv9jOTyJecWBeEbCZNiuwx78bFL5HT5xPz+WUecS
	Q1j7BykxZERzXon5ojS3qILdKaGpVdgyXHHfG+Zoqf/S0og8ST4DeJm4rvlAg3gkyczRR+jrVvO
	cg90pRVNdjO6b6vtkKalmh+nXBEwsmNp9JvD/wimrPwqibkCd+rREvGisMH+qEH3pJdxbQp8B7/
	6TfcX/KpY4UcFXQxYgJQmy9W8TBbm2yRRinZH/k/FOn4Z43hShLiUj8wjCstzn1rOniyNk89OA2
	ZqeVQLwa4INrho0dM4UlAenKp2naVKx0FGHZ7daWDXSirDOq8D689kHOjg==
X-Received: by 2002:a17:907:940e:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2e4b2bc542mr1047723566b.47.1791234840255; Mon, 05 Oct 2026
 14:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20261005135833.37376f20@kernel.org>
In-Reply-To: <20261005135833.37376f20@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 05:13:49 +0800
X-Gm-Features: AclHuK96Q0r6tDkOyMFxRRlJTRgYT5CZFZq3doTRuVETMpVpnBIKbah20Qfa8QQ
Message-ID: <CALj3r0jgyhtmwSR03nZm4UJZ7dw6Y16X9N6-ASq9puY40zeBfA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Someone marked this as changes requested. Not sure who and why.
> I was waiting for an ack from DT maintainers.
> If it wasn't you, either, maybe repost to re-queue this for review?

Hi Jakub,

Thanks for the review.

Regarding the "changes requested" state: I'm not sure who set it, and I
couldn't find any specific review comment explaining it. If it was
accidental, I'm happy to repost the series to re-queue it for review.
Please let me know if a repost is what you'd prefer.

- Coia
