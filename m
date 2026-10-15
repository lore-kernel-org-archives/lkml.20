Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDDF3E7BCA;
	Thu, 15 Oct 2026 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052703; cv=none; b=RjuW6HlvBi3Vr3lrk1kN/zHeF2bM8Cig9ZyKNOWMERavBm4eJWBRDI6RUNXhb0bf6SAtNfjwFYFh3xIFUgWLjNZQSwooWKLuXeVwatdf6FdUPbiPjRq9UMmA+CYJXAjqk5A9AA6+cPddO7NGOVYKzWvjjwjeci8zbMhFKRA03OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052703; c=relaxed/simple;
	bh=XiQiRCBwfVcoN9vNun3GU7Os5o/NsTsc4l5ZWBy0DzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixb41Rg7lDfFyMfjzPTtHvgpanGS7nPMq+Q/eaM9WGVwl8K2vpb02DM6XLaUGUXOC0y4HoTLPP5BMlSY29IZOkoWgW96amZ74nk0T8kPwFVt9QpIAC0xhl9EmKCOAnhNbbHgmYumqRg0fp9b/2g6yYYE6LLYRtTycBfeQC2CK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNTYKvG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNTYKvG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3604D1F000C4;
	Thu, 15 Oct 2026 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052702;
	bh=Dq6YEzOSltOq1bnbSAgtxDrv3XygJt++BexJFC1y2iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNTYKvG4WcR80nnT+yyv/KQxYVMGRgtXw6sji5FDhP8KkHBgH1nM6ODkkabjNmme2
	 BoIXfneNCDGhzehw2Az7shf7mxiiJaYpYXQtIbBxXwcizzbIfZ42DIspY3Kf4Jfo2T
	 gY1xXxxhFpjRJGmNpkjSU1447LQedlYkCM8H0rokvQkLGPNjgCfcSUxGjGqUAE0XCP
	 ewapq2c96boGvOLtWxaHY6A6PC4yMpYsEzOyEnHdFpdKVon89MpDg4/0ahV9wo6CgO
	 D/Uw8zlpOeEJvhKlhx3ag/JJBNUa142TeP7t8xe7LVS8j5ft/r/u6634/mr1gNM5Wx
	 vaOy8sqCxT58A==
Date: Thu, 15 Oct 2026 10:24:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Message-ID: <20261015-prehistoric-dynamic-moth-3b8483@quoll>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
 <20261013-supportive-imported-spider-c6e28d@quoll>
 <c8c453a5-3c4e-484c-9567-4a8d51fcff38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c8c453a5-3c4e-484c-9567-4a8d51fcff38@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 10:46:21PM +0530, Mohammad Rafi Shaik wrote:
>=20
>=20
> On 10/13/2026 12:31 PM, Krzysztof Kozlowski wrote:
> > On Fri, Oct 09, 2026 at 06:42:47PM +0530, Mohammad Rafi Shaik wrote:
> > > The PCM1681 can use an external system clock supplied on the SCK input
> > > pin. Platforms that provide this clock need a way to describe the clo=
ck
> > > connection in Device Tree.
> > >=20
> > > Document the optional 'clocks' and 'clock-names' properties and define
> > > the clock name as "sck" to represent the external system clock source.
> > >=20
> > > This allows boards using an externally supplied SCK clock to accurate=
ly
> > > describe the hardware configuration.
> > >=20
> > > Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.=
com>
> > > ---
> > >   Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml =
b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> > > index 1f0e6787a..1b3803518 100644
> > > --- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> > > @@ -21,6 +21,13 @@ properties:
> > >     reg:
> > >       maxItems: 1
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description: System clock (SCK)
> > > +
> > > +  clock-names:
> > > +    const: sck
> >=20
> > Drop the names. If they are needed for any reason, then use the same
> > name other device uses already, so scki.
>=20
> Ack,
>=20
> Yes, the clock name is required as it represents the system clock.

I do not understand that reasoning. It can represent anything,  but that
does not mean it is required. Why non-system clock does not need names
and only system clock needs?

>=20
> I=E2=80=99ll use scki, consistent with the other implementations.

No, explain why do you need it.

Best regards,
Krzysztof

