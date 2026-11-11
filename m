Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411425;
	b=SCblrQwAvD2WWScWz9T2C7ZoeliywA7tX1kiJCGc5PePyxrLlbenDLCEmlATnYt7cfhX
	 j8JDo5TGX9M5EVgNomifX+4jpF2deedg1r2PgOUVFHCU77NtlrKAfa62PQZwF3CCqrjbC
	 5eXiF7UJ3jq5EOpsBESHaoEJjLGe0NjUdhniu23ofqOqFtjgE56KIVOPTXps/JCFTjom9
	 0yZHiS+wx+0fMgPQHIF3h8FZOShMs3fYq5zSJKbbwCMyK13pJQE4Q80QGYLxL1d+yryGK
	 T95AdduiJKCga1kocKq7jS/+btFdRD9EWSR0WOHHZ86eoq2WwEC8sHK5M2KTUevQKCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411425;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-ZohoMailClient;
	bh=cXcdL4RZkRanD7v6ytYiFI+7QElAQaeTLZZui243kdY=;
	b=WVCpdOP+h7vq3HOvX6sUnexEv6SQxxP0rCCySI/efY5iEc1n+ODrIEj35rtvsX9ZHKTT
	 N7Rmky5QndctjISWieKd8bsX03MzFV78ydfxYVHcxKbcSYs8MH08beDLJOqjPv+QPsaDP
	 4GmWFQwxFynjUBYJ5bG+icWY7sVmGKtAieyhJ1dZMDrDuQCq0wWMM5TweAXcYKld65ddy
	 20hSJYlMMmLmaqPoox9LsREZ139/H3701NK0ryjd/pM56oVcvmjVuijjy2eg+zw6TGzkT
	 sxo/ZDsu5xZIfpnm2WIedARU89CYw1iPLbcH0ODhA+tgAPW0QW+ot/UMVormHo8sjvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=dxdnf1tU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.122
Received: from sender6-pp-g122.zoho.com (sender6-pp-g122.zoho.com [165.173.180.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350CE606A32D;
	Wed, 11 Nov 2026 15:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350CE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=dxdnf1tU
ARC-Seal: i=1; a=rsa-sha256; t=1794411407; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DX/IsIaBVZXylZ/Jwnp0NZE8RSGRsJlESrHEhffSHS/5GENMZ6v/5mjFgTKIufzEMOUK0PB0w8oJmQLIy21JMhwIDtufnKqQd1a9WHi/NuZbrubZgaF/fCWv3bgLFB84zvtVjQRC7yBBIFy4G8rFzMD/equE7zwJrnkpS+wEbK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794411407; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cXcdL4RZkRanD7v6ytYiFI+7QElAQaeTLZZui243kdY=; 
	b=kWvTSObDt0NBbPPIV3TcQjYHSpoTlrfiRVZoCP+loOw6kU0oeUCcQdj+402hsas8i4KrP4lL/nm/TKTHOInPLj8BmzOVcAbQhPXSXZcJJGvIQttCgAJSY5N6egvV1zV1MgQRlFKmp+v31Qco9voXY1ULjm1htgx4Ag00o23Kfs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=dxdnf1tUvtmfd8NCGQ4jY2u8KeigYZZdannJxSknt4wTNUENqBjXFcImw/bT4G5G1sK2PJCHaTHWjHVGbKa2tIb0wcH5ILoWbElbiZvAsHEEORtxM8uLwKOQKulRnPDa8Ov1dX7ppVnHxrshnbwPB03LVhVfZ4XOoAlzNkUtJl+8msLAeXCM6mRVEgJEcL8i5syHaBm75z5m0rjpjPZh1xgjhU6RRhHLrGTEt8AGSQ07FD+8UPB8AnlAS6uFYQPgO4/y8yA4mpmi6pweK4oK+hnV7W+bbdctHhqo/6nDCzqUlrjJ2nLHFCSSZhtyGHqFKM3XjF7qnrVEQolZmzo5Cg==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=cXcdL4RZkRanD7v6ytYiFI+7QElAQaeTLZZui243kdY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794411405388314.12732903469475;
	Wed, 11 Nov 2026 07:36:45 -0800 (PST)
Message-ID: <fe657d0fb030632683705b7a9637d50782dd8acb.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: ilitek, ili9488:
 make the port optional
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Romain TISSERAND
	 <romain.tisserand@gmail.com>
Cc: Igor Reznichenko <igor@reznichenko.net>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
Date: Wed, 11 Nov 2026 23:36:37 +0800
In-Reply-To: <aac5e0a0-754a-4323-9417-cc17d7d42930@kernel.org>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
	 <20261109160706.2272332-2-romain.tisserand@gmail.com>
	 <20261110-comical-adder-from-saturn-8c8fbb@quoll>
	 <aac5e0a0-754a-4323-9417-cc17d7d42930@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-10=E4=BA=8C=E7=9A=84 13:48 +0100=EF=BC=8CKrzysztof Kozlow=
ski=E5=86=99=E9=81=93=EF=BC=9A
> On 10/11/2026 13:00, Krzysztof Kozlowski wrote:
> > On Mon, Nov 09, 2026 at 05:07:04PM +0100, Romain TISSERAND wrote:
> > > The panel is a MIPI-DSI peripheral, a child node of its DSI host,
> > > and the
> > > driver does not use a graph port. A port is only needed when the
> > > host
> > > links its panel through the graph; other DSI hosts, such as the
> > > Allwinner
> > > sun6i-a31-mipi-dsi one, link the child node and have no output
> > > port to
> > > point at. The PinePhone panel is described that way on the same
> > > host,
> > > without a port.
> > >=20
> > > Keep the port allowed (panel-common) but no longer required, as
> > > for other
> > > DSI panels such as ilitek,ili9881c.
> >=20
> > ilitek,ili7807s and a few others have the same and it is confusing.
> > The
> > port should be required when this is connected over SPI or I2C, but
> > not
> > for MIPI DSI. I think that for MIPI DSI port is meaningless so
> > actually
> > incorrect.
> >=20
> > Why was it added in the first place?
> >=20
>=20
> However won't all DRM drivers actually require panel? see
> b089c0a9b14c
> and 169466d4e59c which removed fallback to the child node.

The sun6i-mipi-dsi driver just tries to acquire a panel with the MIPI
DSI downstream device OF node using of_drm_find_panel().

Well I start to doubt whether a bridge would work in this case now.

Thanks,
Icenowy

>=20
> Best regards,
> Krzysztof
