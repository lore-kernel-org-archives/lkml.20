Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E39840B0EE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338874; cv=none; b=qEw+DmZI2XFu9aawtb4OQuBS1KY2GTpIosL/0BLhLepADeSFIxS6aJYe/4wEEMMBay7DowAUSiO3IDSRAV0x9TwJoTmfE1aFaksn3NWvKoAaJYs9Q7egi8r1GEHfDdtp82ZNl4ktOU2PBT5JNhk0ZX/71ESpccpMAjmLZnYp2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338874; c=relaxed/simple;
	bh=R3g0qMKyEsRuZkRO8pRVCOksVJJlTG6JMTRbXgkDV3k=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unZqaMCghswR2FfOSTbgd78t5+ejcf1SRVa3Ha/WmWSpPEQnr5IEocHUBLHAFk8qTB4s0bPBW+vtqOSFSCq6/6Aftiyu7tW7Hd8NNTb8EBHO8AS1V0PaU9rB9pJ5Cmr4jytQfiYKvwJ3BnixRbitYSW6ER9J1AjyetwunOR2GKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRwDCchp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRwDCchp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so6328855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790338871; x=1790943671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uE38oAB42n7bmIsl4KnELZdu25j4VHGq3gSZMQshQlc=;
        b=PRwDCchpEYRqki0Vtpo6CPRNqbj8jn3tmHrmIwr9xZSeK4cRYFGa73CdL/xpIDqRr7
         ExAxm4bwOJbvj6yIoiz/4XdJXcQsL1XRDKAvTUoiPr2GEYzj1rP1mkRQ21kjoCTu/nzx
         3d/ioNqimSoOHbfGLC0gXFVJPZ8BwWdgfLOtwyWO3n6k5Ka+eUPf+gNm6BeEKA0o8yi+
         ZbUAQ613a3WKViNS3fqKjSKDx7EBSbFwP+58a0mWu1Kq2Dc7etyuWcvTbzXsoDd7du5x
         f6PAfSTGUbXyXOFbxJvAujYrLhpu9wIRLwBUcN1t55q2B2AFMlOM5OlxbIpyjl4uly4g
         4uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338871; x=1790943671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE38oAB42n7bmIsl4KnELZdu25j4VHGq3gSZMQshQlc=;
        b=pGHBpxSLGdV6ZTb/DrqrjeGaYLidzimIGnjKBRJWb0vt2+rQ3/G4T9WFKPRrZmOWBM
         KopxFzz4613Oa/ALw8iN9lYHOgP6pPEdAE3v9wamUR4qYVfzWrxpUPEtODcnhtu49Gnq
         3JIrpBQ2O6ZxjwKCVCRZPAgMNiknpj8i41/kp5tHe4QD+Dn++uXkVVTFI4QAEMxNB798
         MoPgoWuDnJViTEd1RMoYFdcIrgilxyWgyfQousRLi7NHrrg1d2SeCkckkyXfj4q5ExdV
         CmHIAgdJqY2L3Oyk/QqbQ0AeXXGG1c2zVdcdNLopKRqcV2Ic9vInA56ixcNCphW5VPVk
         QlRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdVKCgXcGKORCn9MiBgU/mWijbZW8mcFnbjZWUUrhhRKgwzaomN/NVRiS0V7Kv8+fWWQhJFs2c4d++mqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nu1f+X+/TEjheNnuLfK/2A69TYeyF+rIRpf/kqpxojCXyetTbd
	OXsXdA9WwHbbM4NUnzw18VtZ8TrPx6t9T6nfEzVS1a4sD0+mNXio1Gz0
X-Gm-Gg: AYBFou1112rl5RKZZdXdFvcD4wuvu/U0kH5csZI5Bl9nx+3q48phqgdpzOWBTxURtHI
	V8l6NA+ex91xLlFbS6exJtzy67d0mLDZNusohkLF8wmhxMhYKwDZxPOQ+tP9MvdzGgE/HzEePP+
	DAUij4jJnd2XzdyPmntEUmYTBHlEsrLCFpgaUBCkrmXqWQxDL7b/i0HmlaFUCBWfpfLtgiDt187
	vqqUnYVUF19L3DeRr5crFFDOCuOGVFtD/VNLCzmerQ20YKdpmJznsfSApM6DoeZec+gtKHyfl02
	CbNnGxY4NF5QzCSjP/SfEGlBYmmWkwkE3FJ9/NxJAXEMX3odY4AXbmSkBIRTWVDpHZdOxXUSv5R
	rVhwFtpyz+9kpe58+T6YTBfL5cA8gzW3y3SU843G3lbJgEWRFiHWAwu84Olh48dW+IoHcxVhEKg
	UYHoJHI32v1tG22fuzr/eL0EWR9HfnJZjfoqoKz2h2o13etFm/N7nwS6teEDXrPMYfHd/Yfl6//
	q7R3Yb+MlJBC9ARoQgujXp0i3+iQcHmKHKAuW7x0OBPwFY=
X-Received: by 2002:a05:600c:c177:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fe67080b1mr104067595e9.31.1790338871100;
        Fri, 25 Sep 2026 05:21:11 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdd58sm68080805e9.10.2026.09.25.05.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:21:10 -0700 (PDT)
Message-ID: <6ab66736.82f08bcd.9574c.5483@mx.google.com>
X-Google-Original-Message-ID: <arZnNemCJV6C8TEE@Ansuel-XPS.>
Date: Fri, 25 Sep 2026 14:21:09 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next v2] net: pcs: airoha: add support for Airoha
 AN7583 SoC
References: <20260925072712.23419-1-ansuelsmth@gmail.com>
 <d1f5d3ce-65bf-4f87-908b-39d1022e934e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1f5d3ce-65bf-4f87-908b-39d1022e934e@lunn.ch>

On Fri, Sep 25, 2026 at 02:10:24PM +0200, Andrew Lunn wrote:
> On Fri, Sep 25, 2026 at 09:27:10AM +0200, Christian Marangi wrote:
> > Add support for Airoha AN7583 PCS. This use a new analog PHY
> > implementation that doesn't require manual calibration but makes use of
> > internal algo to lock to the center of the band EYE.
> 
> Is this PHY capable of other things? PCIE? USB?
> 
> I ask because a generic PHY driver is often used to represent the PHY,
> and that can support PCIE, USB as well as networking.

Ethernet and PON serdes are only for Ethernet usage. pcs-usb is USB or
ethernet 2500base-x and pcs-pcie is the special thing described in the
other message.

I'm already using the PHY API where possible to configure the dedicated
mode and speed where the double usage is present.

> 
>     Andrew

-- 
	Ansuel
