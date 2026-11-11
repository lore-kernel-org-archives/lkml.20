Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388495;
	b=mO6IIBtWMtTCuVIowgRp3BDFnj+h1Qj9ZX04JpJHtEmEJsaOTbDChFde30PF1y7iQWCk
	 XWkktuEoD5ewJX2mtDkgZ4oxLcxxX5w3lqHDjKXwlvPnEKDCJV0F3vlhkS+NnusQdtTkO
	 EOKXT+QcrnH6kAIg4zJ1CQ07mF7R/lgXXCeSjRzvKfHxEJ91jxkZyayrcTUipRuE/1TYa
	 E0Vhn5JXacd5azGuH1AkizPcj+FqkUjxs2OObYTIyqqV268f3l0dNVpyTxvUVKZDtGKXO
	 bSM04zbF+yoKyLKlZ7NMvFwMZoqHE4JcGB9d+1LenY2mdR1cbae0Jwk16In/KVWiA3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
	b=3Eaca2IGT5WKF04WNQFCD4Xqw10/CzC81xIU14vHfrp74JY8gjZL8z4kF0wNSRz8/yAn
	 dlBNJgbrQfsUX1M9kAFswb+vO8nAr94nzJ4T/6GW9zIoT7R9YDemjebDcwbAv0r3wVNR2
	 I1602STA7yWXDxDDCvdCHsRxrfr+VgTqfv/3JNzD2tlbIMyesSR9/SXev7u2l8qBI+13w
	 KiK1MGqZYo+U+zAONVPehTXWxS82zl9W6immsL+Yc2QOou0bdpvAB3erAOAqbFz5nECfC
	 dNhAglqRhW0cA2GLSdiI5/s0v2E2+OOjovJeEPHdfeITXs8Oo3EL5FCOItqtM4mrwhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Mo3o/ejO";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F43606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F43606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mo3o/ejO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26557335e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388493; x=1794993293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=Mo3o/ejO5eEm/4lsClFXD97OGtT2rZOLvBTBTgG1NveGUf2IHBjdEX2ZBRkaCeSkAN
         0+B15HUnQdIeOEuw1osEeAv8iy8zw09HeRfarjQ4Ou1p8eQF/JgrdyyRH4Akkovy82PA
         gFGholXanrrhUyhHmi8WxQJy5CQ039dFebXE15W89v9z2UFB8YJBgXX1KmQUC4U8Rd2S
         /dHTh4gHXH8KKaKb6onZbYvygCi+/+Gf2S0rb+Tm8KtNxDVjkKYo4goh3h1rxRh6l3sV
         s2T7URet6HooCiQOE1OtLDSK/rLoB2/oDPc51diEwiNpFJ0TwW+YTrFVg3rgZ3I5y37q
         sLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388493; x=1794993293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=oWIdstX/Yw1SLhZRnQaC0MkFTYaMs8ur9UgFcr4MUUOnMExO4Ke6mpSXDPTHip6bAe
         gCtO46hGtJLYAssvwyZVItDQPG11pm25J5vRp4+ixJFHPeMYEe3Ss37GeXTS8TYuL7ae
         gK/3MGIsx/SHf4bETu0r/asMjXe8LMzvYLx/trkgwaKxUaoqfU8wfp0MhNpyausf57gy
         r/DqvN8StymgYU69FOlU00E5NvOMB/Hm2Ld+KemHKLbyLmD+IXBs+JksI1zDMGOq5L2G
         yZsaxVuT4y3GhomTyo0HGSxkIOIvRoV/DCyBX9eUBk8kj+ngJgRz+4cDzqydDFEm1+ja
         0obg==
X-Forwarded-Encrypted: i=1; AL+hErFJVMc/63U1zWXac+gJxoTihP2c7E0o7OID3GhfnDRzZPUEYlHG0Q+TT4XaMT94pwaXtXQHjwIDhJ7rycE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6CmrjrWNWJnggTAc2PSPKSC66LZweW1uFCkJdPeRTArhtjeX6
	31pdPhus2z0d/CfBD1l0lJmdPqjZ9EjjhsTOk1HQpBq92mXvCRyOIS4N
X-Gm-Gg: AYBFou04FfQ6BL7+qi24WmxHuODttam0H1mFgr8MtKFdKSD7jSg64ZtokJi0ctBwQ/1
	EKAXDdVT1ijUxmQojsqMJw6gxQCpQq3CPUfA5INIsyp/njrPgtmkyPqTUI2Gc/Lz7m9idnWr/58
	dlFw0h/Al3vc9meZk0H/Dpr2g6JrGgVEMvAfW0Rd02c1scF+Cl2g26vHQgZzd4MehP7nY1bU1Yt
	NQCERvSDPF2p98/Jy0mtNJYKvAQr0WP7E9LioLp2nzxXuY+fPoSUpqiGJmEVaffrAg33J10lUL1
	A+QnRbmvPzAwAZwU11BS/VE+Gq575wZszKEhHXWGuUsHa4PVx2lpCBLM6ZTxeiRCEtTFNnSw36u
	cD1CxAoaSaOjZ1NlL4hOF4hm1VS6tnWmblI+7PKrcdHQHWXgxJagcvLSImwrTO6hv/E8HylIcfY
	Zs45OHR0Ii/iPYmZLMQ68+aFFPqPcGZ4p9tW7qHARlwJCPDdkldGuRosWuN1frEbDvlVi3uics/
	6P34idb3L48bicDOKwnYMLxIpyWFf58qq+WzaiiN6Q8GJ/zwdsyH3bjbM5zFcn4AX7njL6uQo2s
	yyItTisPJZiU5eGPv+skH/b2z1ERFxFXUgWOABM6clXhjAS8alrsIx9vcKqGIA2eVkye5s09Ar3
	zOXntke/oVtGh1l2kwnWRc/ceptOyE0pplsqBq5izjFPC42DSYOqjysArzAg5ow==
X-Received: by 2002:a05:600c:6994:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ba0935bd68mr32873845e9.4.1794388492912;
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm145501635e9.1.2026.11.11.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Date: Wed, 11 Nov 2026 10:14:50 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <avQyCgitN-stXoS7@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
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
In-Reply-To: <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>

On Wed, Nov 11, 2026 at 03:03:12AM +0100, Andrew Lunn wrote:
> > 2. The Ethernet connectors, LEDs and their wiring are on the carrier.
> 
> The PHY itself is on the Module?
> 
>     Andrew

Hi Andrew,

Yes, the PHYs whose LED configurations I'm moving are physically
located on the SOM.

I'm moving them following the approach we previously discussed here:

https://lore.kernel.org/all/31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch/

https://lore.kernel.org/all/fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch/

Best Regards,
Stefano
