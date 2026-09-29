Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EE4ED1AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674916; cv=none; b=rNOkB/+4yZRsGRVBq92keRs8Masd1Re/SQ+ypqpRreNxpqAlxjskGLLZOW813X73AMmO24ANK1cWSO0hG+LhzKfPHKpF4yzVlKj8kHx9Oa+dZz8daBdmtWDz8fJ9igpk2E6wGvzfW0STDexOcWUDwuCfuRLxJdOEd5DeEOW/oOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674916; c=relaxed/simple;
	bh=0P2nMJyk5QJYGA4+K5hLhmxCTWy627UxvCFBI5LIYM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzPEEIdKzoStBceZCR70ZQ+qlcv0ilvxM98Pyc+5e6zW36COAohmfeoDrcT1p75E8+aJS+DhQTmdyS/rmdhO7V+4va5cS+P7r2qBDV+YQOJYwujcOjDa/napdiQOoplHW2yPnH92qfonH/f4/bebroAFm2+WUpRO0BoS+3wCC+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1Cm1QUh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1Cm1QUh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so3128797f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674913; x=1791279713; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=T1Cm1QUhMvOHOsoE/25mc+yKMeANrs509H2KdkE6n/Cky9u/eZaknmHacdahljm2Tr
         Trw5RJwMUQdwUqgNcZmb6K6aCwq87WLAF+rkiWbwt3I+joDhHzN8gWjTtnYYvjvkLcTA
         DrVRuVA5fMFkvXB9uZakZtwdhPuuIMbyb2L/i1y++Rf1dcC1DvAqrN0lGOqTqtbERj5n
         cjPWXBK4R+E02daCFta9ypznAEj23LtH19hvtDid+OnUa6XHtTn5nh5PvALPsKk6PiK7
         sycmpfQ31QjGASQoHeELrsyYSA7sZiTuKaFddL3hx9+3c0CUIIxK2n3oMr5wBkglspQA
         Ahng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674913; x=1791279713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UhT/d71flljW9jNeqH8EFFOweIQ3C2k43Y4Y6+ueZeE=;
        b=v466uvB3tQg5lE7ooUNtyl++qdKiHypI54rdyoziscJQ0jXbGBhwQdNYnzwA2BqaWT
         cLCtK2t3vvdjj6cvRvrmVkQXtmDW3u+Q4aOeX27cigbWO8WppgGGItOvnfPxtRsv/HTf
         NARAkP/htyjg6FMW0vLLW37aixqs2uCyuC+1JxJSugIucaXWXCqgYqgeESISsKKCzjeY
         +as+1Qkok3fEvkq/SiNZd/hMmzvuMP84c+az8CBKgsoJZtl7TOulo1Ed9L9rBvTuJ3aC
         Wqf/YJ42GsY8sYUT0uk5uoBBMty1JdWvD9Qk592tpapehSBRyUsN0sD0HRMRNiWOcooe
         1VSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqFlC+iYmN+3GDINwCalgV8hiEHWkL3E5aoTLPXoCMwwPJGBDhpcer9dZ8JoV+HosESXzjeAomxwL/HjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lrv+a6sFzcVfrtBJfhoX11zb3LJoBfj3VUcd6zfmncDmmshlMF
	27CBX+BmoZo6PgPvVzQraEhIX4XnQdR40k1jl0MYwFR3xfh7ovV4oGWB
X-Gm-Gg: AYBFou1lshblzHh1430uwrdqfgf/UlPqEEqJfNQQTmgTW4nn0bg+WHT39srol0QuguC
	oYYYamRpPi1YNp954erNkRVEwXEODstkUvzuBzw/VulnGw3D9PSCqAWosdDBp9Kl941Yu48re6Z
	MZquXtBoUjyYuRdvmLncaE4CYh6XxigcQ15YGa0OuW8TviP6Ae1vPnmryaX/Y+cT+hgngrSVYtV
	aqVj64N7Jc5g97vTM+QeOdYLrI17v1xrp6KHU9tAdKOAN4SdjYNSpHXxl5uW7WMZvy+2bZVeo+L
	OeWpZtyRoKq4D6jVNIOQvjDCgiiWqAUec8vu1J1eNXV5huOhzynJpQwQ8fdw0Y3nGkioBltxPoa
	aFlQGq/sb3pCbqVQ10mW7w69QQPkTYgkkEhHDsd8poE0STr9QVp148l/bvW6tzwZXwkU3bHjhRq
	kRMEl5SprH5Kn91pjkV4JIrf30jDfPUr2ZbnzObGoY4p8Z4hZLLcz/tj+2z8tx5JuzeC4KwCdhr
	s8wKZO0fU3X4bTjK04Ef1FeMamuFsLNqnSFcMp3nvd355teO3q8emdVBg7tOfrLiIYLGNvBByzh
	yiQa8iEk5jzi6LbsYVyzdlE8CMcK
X-Received: by 2002:a05:600d:8652:10b0:49f:feca:b3bf with SMTP id 5b1f17b1804b1-49ffecab799mr95152725e9.8.1790674912690;
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm64229765e9.4.2026.09.29.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:41:52 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:41:49 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite
 i.MX6UL boards
Message-ID: <aruH3VNnY8rUYJIK@Lord-Beerus.station>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
 <20260929-logical-fanatic-quail-2ff20b@quoll>
 <art_faJ7Zx5CaWfW@Lord-Beerus.station>
 <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c97be589-45f4-422d-a4c3-e5b0a61f5b22@kernel.org>

On Tue, Sep 29, 2026 at 11:32:45AM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2026 11:06, Stefano Radaelli wrote:
> >> Also, look at other examples here, like Toradex. The actual variant
> >> should be the last.
> >>
> > 
> > Could you clarify what you mean by “the actual variant should be the last”?
> > For a board with eMMC, SD card and WM8731 mounted on SOM, would you prefer
> > variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto or
> > variscite,var-som-imx6ul-concerto-emmc-sd-card-wm8731?
> > I had used the former ordering following examples such as
> > toradex,colibri-imx6ull-emmc-aster. (som - som variants - carrier)
> 
> Indeed, the carrier board is the last part. Just to be sure - in your
> case the emmc and WiFi are on the board?
> 

Yes, eMMC, WiFi and the audio codec are configurable options on the SoM.
The carrier boards are shared across our 32-bit and 64-bit SoM families.

Thanks for clarifying,
Best Regards,
Stefano
