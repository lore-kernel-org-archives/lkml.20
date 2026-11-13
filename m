Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588514;
	b=W4Z9nYqLkAnjDdpjen6/2Kx4LXQhtYJR+J7mTHddJwLUR7zf17eujPMQ1ik1o6kKFm6B
	 24IngB/V9AYVmpg2xoLPAL/bYPw/MLMJqq3KCCAWwrtufN6Ve2rIbJz+xFfQv3R4fYQ/f
	 2RvwQQe56fYthLkLS+8JRtflbcbW5cwHyS+vNk0Pgj+4j3sq0SLOPdwV6+2pJeuvx93sV
	 3mo5U+hPkZbxA2ha7FAZHW+dckiJqWE+LVPUUBNfRCJgBXt9+tYN9EHdtvGDJPTcFFsYd
	 wDnHsYRgH1VOCHWFkimW1h9Af1dSgkfPqz3gRP3uHiHaTMy5xVV0BXbOVHjqcwqdYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=skcqS+8ac77eYUcchznlRTYKurrkiQlKrxxFR4B6VdI=;
	b=S/13AyvD5tSLPUAJ0seipr1Fk8GuIq9StG8cV4uhjl0pNwpli5ThXlZPWzuaZKczhtt5
	 B5JHjD2/haEa5BPQHt/FEZHUz/eKEVUzgKOEn7pJPcJ8+jpw8jzKdsBuapCMTpfL3pDuH
	 LgKSHWSebzY1Wp1a3qzHy8OyOe1PT0kajmP5hPkqaA1j2ipKskMnSvYapYudTqLC+uJP/
	 g2FZeu//34E8WJi9Md/NF57xGI0iuvTRde/e8tFZo3cBETu58A2QrRqEr3vYsi3oCwTDg
	 J2wUCCVSI2vkES+kp4XoXOZC/7rY/bMcqEoCTOLktNVITrLKNoyzlJZBeyi0YEL9OtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcTO8C69;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3992606A335;
	Fri, 13 Nov 2026 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcTO8C69
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640D01F000C5;
	Fri, 13 Nov 2026 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588514;
	bh=skcqS+8ac77eYUcchznlRTYKurrkiQlKrxxFR4B6VdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcTO8C69P+H/9UHJPoXjeO5FyzZJRgtthRjsL+WIS3sXykdo+YT6yDO6+0EfXyAUV
	 5vNe7yXDemr+KMyuM6+yFxKaBQLK76rRLlHq2PJG0o5xTfmftUtPkpqZQgc+BIlBBz
	 GHVZIj5UCbXJj3QUYLIMEgcVSiLTCFAsBbRriK91+DNAHlQxbes5TnG4DcW4LnmAza
	 zCLmPlJYOZ1NIY6+nf42xBxdhfgup2QMhuJA2jyaUjCB1fE1Dd9BruyQ3prPpYGerx
	 Aevm7rIEQ7XrUA/ToK19xD3ZvF0wp/2REg+QLEJ/3etLHVlhoMhAR1aHotu7C3JshI
	 kjTd9r2Q4wXaQ==
Date: Fri, 13 Nov 2026 16:48:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 5/5] dt-bindings: arm: fsl: remove outdated PHYTEC
 i.MX95 FPSC
Message-ID: <20261113-modified-spoiled-e01e679958a7@spud>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-5-3ef58af5e689@phytec.de>
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
	protocol="application/pgp-signature"; boundary="iZ92SGTP+TDYvN6h"
Content-Disposition: inline
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-5-3ef58af5e689@phytec.de>

--iZ92SGTP+TDYvN6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iZ92SGTP+TDYvN6h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc/XQAKCRB4tDGHoIJi
0hyrAP4/hkjo91I+3YhKmBjbBFwHfkA38P9TmLn65vrMX2MKnQD9HeBYSfwve0Ab
To9jhl/rmlNnu333KuSTRGMrMbwtjgE=
=xQUA
-----END PGP SIGNATURE-----

--iZ92SGTP+TDYvN6h--
