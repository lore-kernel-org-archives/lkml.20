Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596615;
	b=ocqe2pW/UhJpzhxMqnx/XvFXYpubwChCfxuo0nAGfE6QwJ7Egk3+aspqMd2rvcOIBfuP
	 7SSfeIe8y+3wUj8rsbQsLgXiVczShsf4vFka+XWFnbMb1afysfyckjVRgjBBdNXBYdK0b
	 CizYB4EbEuH+1dNpv/npwN/bszosI0E3zyZN8vjbkKy3AATba/k5U19EyGzfWbusfU7qD
	 nX5b6tkUyv80WDYpaJSNIH7nTjoDxUxU7WeUO9Y7vgEDyFITpDFH368fTkKmuaJhnpwA+
	 tJAq8rlKIf/SGJ3+xfpbIBYOugg8TXsvUys/Rqm0IcIJMc+PK3/f6Xiz0ETOpYrBCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
	b=GaP53r8GvxBa6WpUsKNBm9hozTDi6fDv4HhMvyHGLXk+PW9jYakzZs9Do03Fhxh5TCSh
	 UH2k0HXmzciLGdtvCWyTzSenNRVRe2H6/l51RmiOZHudNZfKLy6f20tA436rbpDVc5fag
	 BdLtyx6ySjb3K42YYMjXR6hZ+xhreAP04ModGqX8/A63lzOI0PhWBEOzgrnESjT7HPDEk
	 mdQySoVyIllbR6P4/j+2rF8kPU3dPNMDBscddC09c18BdBVNduIcMqRSo72rBG1I9bXnh
	 +ZhRRhp+v0eBDfVIJHBslP7Gq5AV5rR1lFo0lvoontcffVZOIw+M6T42FskgLRbKcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0g2FVBx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A733606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A733606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0g2FVBx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso632149f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792596614; x=1793201414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=F0g2FVBxNGt25z15jXHDVej8cSyycGJloSn/fXbzGxg6vLaYBa3sw+KStMwK5TnxR9
         a17xy8NhyFOaRggNefISisvAQlvSrZUTfjJdykNp+RqywmeVdXNHvyoiGos21tDt6BVl
         owk9zd28+/bo/wyawd+KbXtb5rCkzmANQEnlSfDKOJ860CgKcTt2OXZgp6mspQx0mg1c
         Gj2SpG1HOLbn0q487wuoULJ71f8p4zd8tWsL0o4XKXV6ayUMH1Pv5i3TpCioZhqwA3jt
         7aZu1lYSRPPIANGjcz7N65zGf6pKRotoLKlZQrdWyBDjOaCYr84oPVCLCb2SzrvhTXU8
         PxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596614; x=1793201414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=yPUOkno55Oj2LbxSrvTuZlVRWAdjN0uECoJqIFljRvaPGa+r7jv1aAqDIc+s7h/SQw
         aFs8QJsV4/p32MQ3VChl4Gbd931092HpiGCoTp25KwebBD1lssXcsXvoC3FpNeETAPs/
         31VebheCa+IwPBaeb3Gbdoh6yLgljS67BJ3nBm1ji8xukd7+qZTxj/IzxpMtKcWfzdP+
         hNadg+Q/aE2KbtQfj3I80DGqD6lZaA5kWKyP/dFzPLmS9syJ0+hoXsQIKHOAp5e5C8dq
         4eqlScwHfUYLBJGqBqvG7XRmI+c7C17Go+XIn1+jzFXoesfbE5HpQVOgb341ZUCrlDkT
         edbg==
X-Forwarded-Encrypted: i=1; AKwUvByiXK/RNACGmi/VdYqtnw1VMSmz3jSXZ8lRAzgfqv/uFPjjK3BWvNoabVz1cVeEWC4uwrsE0/nhAynTIkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJliwSwCPukW+Qr9fTJ3AJfTfIiVtLgxaexRfe5Igkah8YM+aq+
	gyuX1HFpuwZZbIQGi+fjEAbFiTKxMjeOnE5BoTXcGCFdWfd8aIwZSvXR
X-Gm-Gg: AYBFou1RYMc0XCACZ8bXuacoNYrGURe7ojhP6YVqKSioYm12XZrpSZWCXXMjVX+ntnL
	AxHzCQxVk0642nfE4PoiripYyCvkV33jX0Eo391TY1hK15FyAN/cOO2hfMg4RoEqEs3o3IQApFZ
	yxGQGCFJaNmssujUVjORcxfxdNuD9s5Md0JYJbLPNraMs/HJVVGKvwgO64nz75F0uJ5Ihem6dVL
	9fsM98Am+Jwy6R14pwb2s5b+b4pb7FbB8F3bKAO6btB0HLTtapoVJsNSi5ALavK0feMpZVkhORE
	jiSGihlR+dTkbzCuE16zjZEDvGqaWFKR8SJ/W/k1Km24n4wgd0lD6PL2lLFn0+ipzU5KDg3Bz/6
	J6SZ+/xX8gDbLo/nfVy8ZM9F3kgEzqZFy+hYzUGpF26LJRiFmF2LLxmqdPGSAvPOyHtPkGLg1jC
	kYGgQY6mY1tJVtI5lf+tqFJWXgrjJSZCJFnPhbXEOhErZuXaw+sjcqIPMyaStMo1MNin/VF1uyC
	BhsH5JGSa6ltwyoFZGYjre6R86tET/xfDJvaKdc8f+cJWrAbidBXvOhjAQ+s9GgCDu02qem/ypQ
	7hrdZ6qY2GewQTUzQ49ylwNNgUm7BXnQnCrJdTFyuNWlcMO2yQg+3bY=
X-Received: by 2002:a05:6000:1623:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e264e4b62mr3988627f8f.48.1792596613403;
        Wed, 21 Oct 2026 08:30:13 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm6370102f8f.43.2026.10.21.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:30:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:30:11 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
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
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > [...]
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> 
> These seem incredibly wide for something with only 4 gpios?
> 
> Thanks,
> Conor.
> 

Hi Conor,

Thanks for the chat at ELC and clarifying what was said here on the
list.

Regarding these masks and their width, they are indeed wide but they
determine what to match against, and we have no reason to match anything
except the exact number.

This was previously shortly discussed here, and clarified by Rob:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/

I'll be sending a v3 of this with only the camera patches soon.

Kind regards,
Ernest

