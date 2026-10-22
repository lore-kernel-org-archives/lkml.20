Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678552;
	b=NwEJyyPkUrVv2L8mhYh7xCA17u3Bq078SdWBr6in7aN83msBJY6yaVQLx9YKmuyvbPXb
	 hFyFJix0s41KfiwAjrOMl5V2kTyXoSzM/UYbP/ONrUACJv+BoqzxI/PM+nu3CPCb7aK6S
	 Jfbq583y7uC6h1lGr5d9nY+oDkAu74zIbIJhtElgQc0UcBkIi3bZ9Io5e6+Up3rESa4sh
	 N0IOnMBYVuB3zZVLEDd9DTIPtGFDzMpcUIirAsL+8k+oJN6/Ij0F5YuRsMcajMqRPKlCF
	 RaDKaLX4ToqT1I3M/boeiabJpluCTBq3SUGW1gBW+1qw3Vjo3/YzqYeUydv5WvEUFFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
	b=yXINkkPD+q3LQ2JbU7ksW3g5grbr1fDWbG6qAkkCYMoM49UQ6cG+p3Kuxxceb3FzT2Cy
	 rtHpTXC754HK7lIXbKB9hKXsrGn6TNcoCLbL5uUflTOtArpoKtFWaUNM67BAkRc/M7dWa
	 RVV7dqvG7nvLjJ7Bj6BR3CdnvOuG6JcEuwVddsTvSuJB8RndRni7sf85daAhXJFOW9WRz
	 wbYzHq/fCJ1ZlwgWMQEQTH6PDZGCkLazU1h0essJgXuCDkhpPWrxtsOXWxpCx6Iy2XOMf
	 +PndKliyEpf6irtDM7/4H4NSaRP9t2CHfBi6cHXOo2DaM/mxjlixaeHyk2T+qWeHh0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+KeYW5z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0693C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+KeYW5z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17585265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678550; x=1793283350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=J+KeYW5zKbAaR2ohXAf+0Uj0fjYUeB8W33bmWTi/ZMTBJPpuodDtKue6spwAGY4QY6
         3Nr+SYdmRDiB1bzgGMkre61w+w2gKROkWgxKCmW7sL7j1IqOx3IMtBla9F4YToY1DPcd
         wsnyErhtyEiOkEmkJ3i0boFeYHoSj8wpK2/FpOclE4sO2y7KBTGunZexmKdf+zlmBCPf
         JeCC8OmqKLyw294nxq456xv0GH6ceiOwKd/6o9UP/3tZ/EYvj2jUNaCqExXT4dFhXLLO
         7qqVWQv2GC9Ptl7OoRBMO2CUoujqfTLPOua4+Ge07c6MMnbdKElWI1MW0LU6hgRo7ErO
         l1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678550; x=1793283350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=sk8tfuLliVOnKQArx9wJQso89Y/JaKeeWWPL+kgpeVWQyxlHay5ERt8kuohwTbgXgl
         tu3pr7AJSAhJimunm3u5QsOlnu6UEicwhIlXw7fqnB0JBeFun0gXSeyLZ47KU5l3GUhg
         bxnI+5lLDrMUmoCyVkqe69ggJ8Cy4FUn17YnysZwwegPTh4wan/2wEU4AnhjN6tIH4L3
         H5B+wPw49PC3yMOpuwFzBXLBQPVJ/uHWoOH9L2095rSWJgYtkRnTNH5IQhxGSYk4jMBJ
         dukJ2SiCxyRLOKOSoEbUzyHy4leTeQa/SvkChGun8wwO5/LRQVM+JC0ZoAOEJ8wtFzeB
         CowA==
X-Forwarded-Encrypted: i=1; AKwUvBxw630OzMbcT22gymdcUKr4YIj/NSKLyUVB9NdZxmQeUOxSR24TwKTfvkDZ0Fm+lQoLApNNygj0ExeOSz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOw2/bZEhbMAVRLg2e8kiL+J2nU9+I+HozvRpr7BR1tRXRbrtX
	qLqCByNXC36ySSrmJtDwkDc7pn+TxUHiJBAVKfwDNXtEPHsTTsHbOu1W
X-Gm-Gg: AYBFou1KtFb51cm09/QNAewKS2T2UGqeSaJiFHv7f+xKEriIiFDbrLcJPbJhCttI+TC
	2aOqHnFSrypH6Q0tx1p7unTEeUQPqwFsxMyLWjpDf9Y0ER5m5wH9BmlaMyEwKC/f1sk7QiKe9kk
	SJHaVcVBw5Zcqwzel7kZNoREiCFK6yfEbe5UO2PP6/przk5t4cW1tXkVBo36gDlomvGWlstTvIJ
	5cXIRdf4p1qEaZBd+BLQW2V+emjv7Z8ToX5j/0gB5RW9uSM8f/IAw/OgXQiwAIk8BNGurdOTSSq
	1J9FbyQV+a/kvmZa2Prix+LKBQyzRi3VX7V8CbViukTskonmMkK+t16UzPr9k0etEKAzVzNH1FZ
	ufSD3IOugHxm0RqvsvjiMdHazOinRDX4Euz5yISmmxlJ09Za4WF+lNz/38woenFs/1WQrjBp77k
	g0p0zQVxKdv1a0t38kG5ZvK4q7AXExphVJfEOFuf0vDc9Ar7dLsEWs+aUluHZ3xm3i9caLjnDDN
	avOZpzlJVqZSH0NRCVY8lbUMguh+cDaEGvS2rqtCTGk0PF2qBiSFtkyOaSanSkh+Q9Y8c0+TQ9k
	OzP0Nh/UiCLl8lmpdzs0VhvBPMzatefRAj3WtvLJ49jWDsHOPO3heWA=
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr111050565e9.28.1792678550121;
        Thu, 22 Oct 2026 07:15:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add62dsm82627145e9.2.2026.10.22.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:15:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:15:48 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <ew6jybymalb3d3q7hen4qubefipnofcfzsrzyjdajuagw5fnov@b2oe5mjyz63w>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
 <20260924101308.GA45659@francesco-nb>
 <arU0sLhGG__lh98n@SMW015318>
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
In-Reply-To: <arU0sLhGG__lh98n@SMW015318>

On Thu, Sep 24, 2026 at 09:33:20AM -0500, Frank Li wrote:
> [...]
> imx-uart<n>-mcu.dtso. similar case imx9-mqs.dtso.  Uart<n> is cross while
> imx famililer.
> 
> Frank
> 

Hi Frank,

v2 follows this. The UART overlays are now a single shared overlay,
imx-tdx-uart-mcu.dtso. Each module device tree labels the UART it
assigns to the Cortex-M core uart_mcu, so the same overlay also covers
the Verdin iMX8M Mini and Plus, where it is UART4 instead of LPUART2:
https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com

The Verdin iMX95 NAU8822 BTL patch (1/4) moved to the shared NAU8822 BTL
overlay series:
https://lore.kernel.org/r/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com

Best regards,
Ernest
