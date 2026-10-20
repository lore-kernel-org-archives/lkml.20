Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504799;
	b=5QQ36h1Ix0qkUUy1KCXYv8SMS0SkhJ5Q4NfC61OW/AfwkqpmQd9eBQIJiImjxFtjwCSg
	 gb2SA7olKsBKmp7F168U0V/72NCCyubO/EerKymtCU+YPI7R7BadUM2dLCufOAYNeRqXc
	 s6aag4TrSlhMSN/2cDkmOrbt2mAXdYjionR8UUqQ3qfU+x7ityH9OMSHknH59QmueRfKe
	 cUROgT7mBB73sNX+HPRkxizviM0GV6kpOqQp2SVMobCn+OOwMTivLae2ukg/59bDVqCGM
	 IjFXEBoPkGZrhy7r1oy2sxS/FKzdcTvfac4rBLRMQSfpZV+lMEsrL1VcuHF8tty4VSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
	b=NcJoXyFXWYPaM6HmgzdQVg+c0KKk0k57zDP+lexcXWeQj2Hflf8oQtSvYYby/HZhoijX
	 b6cS8nrGGvbtE4z4np+UbAtuEcZK026/SXjDT3pot4vcKYqC2sI+BpRaQawA7nmw7TC24
	 bkacToAh9RMZXrx0GX2+B8G0j35pDqpGGtzah7AR3wx5iTRrpu/savXn4ee4eTLMnOXLM
	 giYYzThp0O5mvcsXaZyiytyX5HWTszJ/q4tY+WkAkYnWeXwD7fp1+wbTjEMzkr9OLqpkg
	 gR7eftadt0jDb01eUI2OOqElIp7KZ+kZ+rEUlxdN1LY2nZyqjkmnryEqdibz37w9f8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DP/IFoaO";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DP/IFoaO
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so17228785e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504798; x=1793109598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=DP/IFoaOO27sakoLsWxYmS8AMQcZ7aKaL51LH0a+Sp5yFDvBQZiJwmWrrRUjQjo/Le
         Hs1aO6FN/Z0GghqkpZYecUqFeTfwMhmPT9gxEQw9ZkwzKnagwLTBZRRmK3r1ffv9MGlT
         1gh/GyGe9+31357fwCPo5CzyNltWMGs0XzCKfSl/o95Wjb0E3osnTRw76HcJxIRMiM+K
         vxbX2NIE3KIP8HShMWTO5uzYpPZ9oSeTAermMB5YrORWVQXZHU3Le/uhi5bTvCeGQ5cZ
         /THmDjubibPzEBNY3b2lgZytV9NvcW8HmnQXaH3i4tH94m4rnyKkl1Ad/pWLoRj8zpjk
         6oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=qPB5MVeFajAWxxFWcpORjq+V4he7Dr/RCCzyTBEKc1U5Qb4KcDddgGZ+9ZUSwnOYqL
         WmULAoAY0bvhwsRD/hJP/RNGh32jAz0neckxsO16wkMvUGsG/2D8xWu1KMCU7ByRLZ3l
         5NdoKbKftPkabQOWi3EdbNgmm1fyCdVwHR2+n4e+yHLgNljb7Hj4xxGs+LjxNYKB7IZT
         aZSXL+ZT9vd6IJQ4sYvH4M05NmacbKHPSnQw8DmwdxnjaVWn0JzIByCaAfCTKUETo4ta
         nwKU/HfGjte4/DL31+e0XuhlpiUWTwr2WM+AwZqMBqPT408n2MTj640AcadA5wI8RnyI
         +qvg==
X-Forwarded-Encrypted: i=1; AKwUvBxcfw45UlzHA7djGyt2mb/xXoNxf4ziWzD2YYjrDWQKyB5DxPAXaZjwZWqzcuVFJ/eKpBwffdqoy1tYWrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE7FAPC0LTWJj/k2a6P4Cw/xjzRolXGFlEszwp3wQaNbDdriIM
	2+iB0Rj+Y7C9uqPSlq+xiNrwjMj8/Vql3ec4bzUtI+U7kQQtB9LaiC+q
X-Gm-Gg: AYBFou3Y73xcxzPMP3k7JGUcIz7gFu3XArvC3eSy/AaBzTLLkfXCFGDNFo4vFHy54ad
	qN1Y5mjQVWB8qvSX/zPnGvY93Q9tlwToxH6VJ2qnLzuJbCao2SS7cmiwwFq6LvfxHEJYCwfujYk
	lvQn/PnCvB572YzWS8YB2NZLkmf6x9CeaiTWMl69k208l/nzTbxugJztfdLzs+zjfeHl8yao8Fy
	S4bw3Z6RXEZrsJ4SNDzvR0Y7jK1SbftYT5ZYiUFEeJxtNcXmn/3RhwsH9l9M5Tp68gNllYUpiX0
	1tA0YI3/2yRGGS1oL23Nij5cOogOCpZhDJliRCemxmv2QLYLCbqIh0O65b2ywoza8hlpwEe4mXT
	0nccRAV/4nvh2dpcyXwiGKcyMclGC0tG10BiUGsGGKn+/8cH7SW7oZDHtP2eGlUXKLUHiCZBV0u
	vDM39GUNJMmtiDR4OeBrVnUM4C7QCIksdD+8I2Gy2wb8zhvUQcTwe/VKfoFMZP4UCwVux6A899J
	kY2A/XeyUaJ8aiV6Zxmc5ANKBELtmpgM9gGBcnfxgKYlFUlHR83RK4mjrficnPTnQ2QF1jlDm1K
	3zWLGI+oiTotpdITl22ig9zHeqq3
X-Received: by 2002:a05:600c:c082:b0:4a1:f377:5c6b with SMTP id 5b1f17b1804b1-4a1f3775fa9mr44357515e9.7.1792504797648;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214e1sm6231804f8f.37.2026.10.20.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:59:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:59:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery
 GPIOs as open drain
Message-ID: <atdz2TonrGyL9Ox4@Lord-Beerus.station>
References: <cover.1792326585.git.stefano.r@variscite.com>
 <20261020064106.197223-1-peng.fan@oss.nxp.com>
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
In-Reply-To: <20261020064106.197223-1-peng.fan@oss.nxp.com>

On Tue, Oct 20, 2026 at 02:41:04PM +0800, Peng Fan (OSS) wrote:
> On Sun, 18 Oct 2026 14:32:23 +0200 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> > Symphony carrier boards, are missing the open-drain flag.
> > 
> > This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> > match the I2C bus requirements and avoid the warning emitted when the
> > I2C core enforces open-drain operation on SCL.
> > 
> > Stefano Radaelli (4):
> >   arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> >   arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> > 
> >  arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
> >  arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> > 
> 
> LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> BTW: Do you need fixes tag?

Hi Peng,

Thanks for the review!
I treated this as a DT cleanup since the core already enforces
open-drain operation on SCL, so I think it is fine to keep the series
without Fixes tags.

Thanks,
Best Regards,
Stefano
