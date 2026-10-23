Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764317;
	b=wW3MvcrUPQWDrBLnDV1Tbjr3nWRF/v3bE+TMd9BU6E9T5m6iMmF6NSagGizOM8FysNjI
	 PWGvmAMWBzRu8jZaxhmfGxBCtzelLtc41uYAIaYt9rKq23zOX2jZ+/sKzDZSOyXMSsu29
	 H0YnpW6CtVrXukNz8FJyIS5qjn4rt4IvNGB+Gl9G615Imkdisr0qhcu6l7VGPlrbV99x/
	 +QAh7qE/krZ3eTsjbU5KSwXElVpOb5lYPvR3DOT/VcPJVCyNuEF0uBgp5EGBFwfPw8wcu
	 QF+TC4yYfeA37Hmzw0D87PhnhBjdwQUWv59WZVkGjaLAzp2C0KYOzLcKy2+ByUoq56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
	b=brsHFZZxskEiSREoPHIkB4g4w/dI6HSB9lAnzoUK6bhwCRynMrDOPfKvoFcBIvV0eFEU
	 qN2vby2MBJ8QuiRuSxXNLHazBpPDHCSrsl0AXGS2gFm7AbESrI+VpoyVQ2z+K8VyEIHy7
	 q4KSg5yuWbV0lNCWz+XjErtyu3JIAn7Z055blO9RKiEZFSdm5TT1sJwpTbZtIxnkusBMP
	 dPCEBaI1CvZvpLuGC+2xTv/OEnE7HhVqbSj81hox+1KvDOjhCpXNQIpgtQdQcostnH67L
	 1VfItKyNe/q9T8RDudKPKsI+PEpo+8gMGVQh8vumM148/P2rPJcyatBkDJ5g/1G/EiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eTKGlzYR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F7B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eTKGlzYR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso548265e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764316; x=1793369116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=eTKGlzYRsidVuBlaW02wcQVFmAWhVBC1ONBBHD4iLoOYCCGCP9Azg+vZ03oluhIEbu
         EVfduVnauWkbmsR0ENVvhjMma6X0yOPEzQO5+NmlZcTUFxh/BfMWXqWRIgR0orWI51mq
         bUtP8Z1ZDsoA7SxH90mI6ROT5S/nonOJWovI2iIk4tLewDg6luGk6crvw1/LyuJBucwC
         IUQFCGSK9ee5GjpPDwj/l3bHhHZO5Eg8uqHC56/sW7l6BroW3kWs1pTvg3aTylXU8C5Y
         bXXwI9+d0AJDWyc/BlVSDuqs4cUtbmFjH/3vFMK35m4IBRZ8+VS2auBxMs6h49hgwq4M
         723g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764316; x=1793369116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwYBO9Kk2wO9Ecr7r+S2LJi21hL4Jf1QQvneYBvL52w=;
        b=EWREZjCenLBPWqA9+vzlybedVU1pb1TzK10qskrStK47C83JUiQ2/M/TYmO1n+RBnR
         Rd7TIL1nUcuHujblYh/wkp1KtbaN5s6ewnScpyOgNoYw0Z0iKYPF3W86DkwRq015dsrs
         ttEfmOPmji6uWtsFs+4Q005g3fGnKK/ZzFsxlWCugfifj2+jLf8RhVa+T/xXD/TjEcrq
         NRK2+ZTen6D5e3Y8KjyVg2n8RJ5HS/RyIOg9F6nHDnjpD3Dz90iL7W+kaDjWTGCNqb8x
         FDLx4Lr5MmIWmFlifc4b+PGMuSCrJK/vne6cYM3JlBtsQfbeKlv1tHxiI0N6wfAhnDg/
         1izw==
X-Forwarded-Encrypted: i=1; AKwUvBw8hG1iVNr9IZoKtmSIeFzHs94Mp+TWWeGWuZKRRbhgT6aD6VTbtTETRAfNK2F/qHD1Jhk/roH+IEN3XKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgqRpcaKCEM2BU+wFpq4YnCq1mkegZkL74LFBbh5FWxcwQm6Pr
	3Jws65aPP8vM7KDPXg+kloRfU1MDwVbtNh1r48/byvd82TJadAMGlhye
X-Gm-Gg: AYBFou0obDzPlEFpaZoDTP4v3R+BSAimlemuMdpZQ7xIvNarj0VXAEYg/aiiMRvCycZ
	NFlltVtmrve0or2Jfc/nMF9bQu1keb+V4yXBcE7sHsS0YVg92EslgLgiL2+PNQmOEqAF/0Mq0ZA
	arRsmbTSys5O+oOFujk3SLIfqMwmFZ1i2xjtXDnGJYOwEElF8HHPf+m6zOEg7QjrMLpL5oag7VH
	sT9LW28Au07LFqtxFfBmGrDhOeHaz2B2Dp7qT5xGI51v6wFLZwcWNj7tIyWBXuhgSK9exEt8xoF
	PSXIydCSYqL2XZ7EaophdpJNi4Zdp0sd6wqbvqkQVOQ0CbINYotCD3d6RKIaPnrlSjf4rCE3bbZ
	B8+0Rkd1C1284eaONjU84nHja/nwg2ZrAO27r5rj+FA5RlmO77F0nR/rWiiGvGu7OQOhi9m6qde
	W4YEpKD/8EPEE3jowEeuHUsUw4N9CG6bh/ujKs7jEKqXDCj8ii5R5oNlTIhZi3gkb305ZBsr/l7
	9/H8VkYLDW8gWw9SK4fmx0ADoUNb02Wbxg4Kkgfws9gJ2rnAKzEFqqxStsW4+tl4Y+UeYzt/ev3
	AqEe6qaeePDlETJhblEFW7JgJZkiWCnAaRx91WBFSkozJANDrowVpsW+
X-Received: by 2002:a05:600c:34c7:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a211c9de3bmr42927825e9.6.1792764315768;
        Fri, 23 Oct 2026 07:05:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21545973csm31765235e9.4.2026.10.23.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:05:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Message-ID: <stl2ybj3psmedmjdjbvzj6sstzte6dqwxywa5eph634qcyuydf@6byf4ay5vqau>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
 <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>

On Thu, Oct 22, 2026 at 05:07:47PM -0400, Frank Li wrote:
> On Thu, Oct 22, 2026 at 04:31:26PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> > camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> > sideband signals and media pipeline through different SoC resources.
> >
> > Add a GPIO nexus to each carrier description and stable Verdin-level labels
> > for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> > nexus in the carrier files avoids describing the physical connector on
> > carriers which do not provide it.
> >
> > This gives accessory overlays a stable connector and media interface
> > without embedding either module's wiring in the accessory description.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> ...
> Thank you for good progress.
> 
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_capture: &csi {};
> > +
> >  &ddrc {
> >  	operating-points-v2 = <&ddrc_opp_table>;
> >
> > @@ -596,7 +599,7 @@ &i2c2 {
> >  /* Verdin I2C_3_HDMI N/A */
> >
> >  /* Verdin I2C_4_CSI */
> > -&i2c3 {
> > +verdin_csi_i2c: &i2c3 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-names = "default", "gpio";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> > @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
> >  	};
> >  };
> >
> > +/* Verdin CSI_1 */
> > +verdin_csi_rx: &mipi_csi {};
> > +
> 
> Can you refer to port?
> 
> &mipi_csi {
> 	ports {
> 		verdin_csi_rx_port: port@0 {
> 		^^^^
> 		}
> 	}
> }
> 
> because difference mipi controller may use difference port index. If
> define point to port,
> 
> ov5460 can reuse if port@0 change to port@1.
> 
> Frank

Hi Frank,

Good point. In v4, I can refer to ports.

Ernest
