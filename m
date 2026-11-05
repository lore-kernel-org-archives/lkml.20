Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900684;
	b=jPF33ntTWS1DVn+52uaMS92RdoUJN/PFNgUvvKKW38V4aVaCn1OkAMi11p1FsBJyJpAZ
	 eQ8gALMhTd3hVhf0sXUA8Ac8kS+vNHdHRkdrZkDCiJ2lfQMEXDS1Qs+Pc4dNZygxhiAYA
	 NKob1v51y8X9zN6mvKTBXMjeRjZJjBNSgd7Eta5eWXh7k8MDQlaMpLk8dQsVq7oQWdgVx
	 yTOitGFUvVgDDaZE/Dn6jJHsaZ0V6oSpmuVgwLU0ldFA1w3oOszGUnsCNN1kZ6yzAikM8
	 /vNh+hhn6yIbEqCSypj065iJK+tvInjhucev79f7kUNd1LLD6en0JOcqmiupi56NHIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
	b=u1ykyqObKPgQu0OB48ofrBEWdjd/Iiz+c5qB9GP515QHrIeMb83U7wNDf+d5Ek3fh5of
	 CztBFgPhWzjhDKiyCQiLZMvY6dVgPvpJAxiLMVFsweLD/Lf9WQ9g/zJ7f1OydZsSUFCHA
	 GGIVZN9gfQ+Ea6zxZm/xmNM9s5jIT8fJ4WICIYF/RxehTGHdKY69RXR8GWebDKpgoiJ1+
	 a1vBJ+NOrbRupFqHi2/Z8USw3yCP+6CtOVBgRt6Bg7qLH9brx1DW+pI+pMED1Y+CYk4vk
	 mMXOw5OKIVDB0dE8mZHzOjuVrRJu8LrOUutwfQ4jLLrhblwPefGQy1iHlPOIo+Cx6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQdyTsJo;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E8606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477E8606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQdyTsJo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20561445e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900683; x=1794505483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=MQdyTsJo6HXeHxH9BNw28+SuNcBKayOk3Uhzn/A9OEQpdXM5NOgZRm+YICTxfaKljl
         1sw0x8YU9eQXFQF6esHGD04Fege4rdmZ8qd+67Tb+Bf0FpUUOI12q1klb8g3yiIufx6k
         E9Sx5dpO/8LLHc3lDh/lQ0KyYjY7r/JfI9ztPR+Ro7yaR/tMeRHiAVGBYACNGB4EKzWK
         NIWXqWSJW3fuCv7KqQ08FOm+n04U7R/JfnXJVydCddFvt9ePOWIb6HmYV67gpEbNM/nM
         WOoyPyJLLaJtNokFTs8Ib7o39eMQJcoDNDYLxq4/0ut85lJBIaMf9sJQvKeafOZfr6Ra
         tKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900683; x=1794505483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U90OTq4pj/0GvT/BUYUlBl9XzS2MommQVkNoZ4ZcGPU=;
        b=nmyxkDuUQwIYAEWSxxwL9wccpDJP+JGWqLbp/Dce9kO5MitG9lNScxnfXp8mVwqNRj
         ufTsfU+buS3vJLpxy8eoXcY5nlGBEWX9DD0C9vmLqxxC/+RiUSa5UQ3pBJfvjQ+M/W9Q
         OQYg62FPxMwFFyB7Vov3/vAxYnlyXd51EPi+JO+UxbGLF56p9A3ilO2nUfzbHt2l+8q8
         RqgCQ9KGtMAY1ZVnR+5DFgeseK1RmZHBeFh/0eXUbDMdV+toc57xLbMWD3Rb/1PxOptU
         IDtMTbM8qOW1KhL7GHdXLm7lga92Zy0BAMfor6i1BMUwCO88lQFncRMt0O9ARM4+1rOd
         rBRA==
X-Forwarded-Encrypted: i=1; AKwUvBxyWzkwhfWcuLq5Yfd+w27H4sxgk6pX5Xr1+5RbfCN/EOUoKW+oQBZomX95VHnO4g1o3Rwozz1jfTv13dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3nSxXPqOVF0tmpRumHbceiLUiUCSnFurSLle6lEepHOMdBXDM
	er7ctg3+lyW3CPqrCGk7g+MKwLqssESiAwdTCwsUOGz1eSGcTcE2JO83
X-Gm-Gg: AYBFou23W4UeGOKy1UraG60XPTD3W1x35BfB+mcI3XGWNn8jWiE8obQbZFCdobzDNIF
	DNsa1zdY5v3qjYc8K60HXUwIeKqwkGCFh5+BHjO4eHPWRgaiVE8iliUorlVM5hAnBjrP/eFW6sr
	xjfrjVW42cOgI8HoCQj4k3OD38nfv8LmElfgPn3tGLdOZc3JLOx8qS/vZVwRyMCBUKqQIIQYzuh
	kOXQajQKvWTvELTTiwMw0G2pe6+LeJbuNpYbizDsTOJa4UfWQa3P5J0pvdHGa3QOpj+K9XqXaGA
	48+rhYPvkDTWecIMkEKnytWCyESJv9foy/Aj2AoNAhPcTKFZQFf9cXfYBzBvkAPexTM43naZSA+
	Bb575MwjgOm3SHHj1EvmQZ8rjb1dEIs4Sx0+doigZ7siSik/wPUjOs1e7IPD9jMpb/vZJG6uT1p
	5Dvu/Y+yD+RabWx8j6R4Aoa6fTHrfyuEo9+1g91oSxkJqi1OsaHrdQL4GlWjcCuru8BhAooE8p7
	Y7eHaZg/XAD8PkfpJ4ZuhavY3PYnfx/qlBGCq3DGfzFkD5XL90UDkCh2aRKtCGnyE0hDAQaI9e4
	Bu4HpZEzJDve33w9+5WiWXSVCWhR41c880svw/rUNt3dkl/7dtwySEU8PFLPRPus3FQmpaj7w33
	M98HWQFYJxxZAUyk4n69TLDU/vz+mJQyaMyOso/jRlbccePxQNJJk8it/Pw==
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr454773675e9.14.1793900682397;
        Thu, 05 Nov 2026 09:44:42 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm86889775e9.0.2026.11.05.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:41 -0800 (PST)
Date: Thu, 5 Nov 2026 18:44:39 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzAh7404GAsY-U0@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <auy-OW_td7N8oHK_@SMW015318>

On Thu, Nov 05, 2026 at 11:34:49AM -0600, Frank Li wrote:
> On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > The Ethernet LEDs are physically on the carrier boards, but the
> > VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> > include their LED nodes. Other carriers therefore inherit LED definitions
> > that may not match their wiring.
> 
> what's impact?
> 

Hi Frank,

There are two main points:

1. The SOM dtsi is intended to be reused with different carriers.
   Defining the LEDs there forces every carrier to inherit the reference
   board’s LED configuration. Customers then have to override those
   definitions or explicitly delete the LED nodes if their carrier has no LEDs.
   Keeping the definitions in the carrier DTS avoids requiring customers
   to undo configuration for hardware that is not part of the SoM.

2. The Ethernet connectors, LEDs and their wiring are on the carrier.
   Their definitions therefore belong in the carrier DTS, while the SOM dtsi
   should describe the hardware on the module.
   This change makes that separation consistent across our boards.

There is no functional change for the existing Symphony and Sonata boards:
their final device trees retain the same LED configuration.

Thank you Frank,
Best Regards,
Stefano
