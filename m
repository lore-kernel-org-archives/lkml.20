Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992468;
	b=AguTY+tYCIYaQzSUf2JJssd9zM6agDUHOyVED2k3rTwyZQSOR2vY9dwVd2U2MdtGsVAt
	 IJjYqyPUEOAFJk0SYbjPavhJOGsUg1MTG+73BFx678SGgxRuTipSLErYr2STK7OL8UFqP
	 y2VMrf77PKlfuUj9eq2vcmh4JAbw4IYjLKSh29FbI1tygnCqEuop37HgCeB8BnTMR3YIh
	 eckFNFmrHRHxeFOZLYYjpfkR6dooNCyTxrxkc42kdBOJug0cZ2gfhMJt2TdJZTwEHOlSh
	 b+0+UoJguz8IVnaA1hinDKu363lTghFMNFdRtn+LqL3fYcKu8R1ALQwEEdgqMnYgnTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
	b=LX9rR0Jb5h9vqOW2U1tEp/Gz6xRehGesbabTrkl5VQaS0nk0GyHO3gk6YoBdBUYq5q4u
	 11GEJpkHoh5CuXeXdbryr4p87OYndA7CytOtx6lAkWFGnqmI7dnSlFmwSovyfoMn8bCO3
	 9veBq9BjEYR3UGE3uBVrELZnVnA2Vg9WaOv5c/SJqm5UHPd+xynxwrb7NV3UiRPJIwfzZ
	 DSUIj2SxUhMu277xgz/ov4XsYMcu1k5KevjHo6P5fBNmn/Vug8O+fKDm26MJD+mxmxOag
	 SyAMgHMF97Cm+omDPpz8wRKSU1HkKwpy23fh6TIu2zg4CTjxZejdVCPMTbAl85zKbaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A192606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A192606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9914605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793992466; x=1794597266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=B6GYI6dlXSvHyTGhyRFO5S2jaPx3hf2P1YluVp2quvZLGc7kf34BHwcGQouH+BohH9
         gRCBTUvtOBJZ2t63Q2ZNxjjPpYr3e9v8/mqD2LbXAiLJilee4HLye0Pc72q5RFYr0b5m
         d05nZNrI1aJ0/ecnDi1RT6NrdfG/UN7Kcfv3kjOBbcSBxmbDIEJr8ZGI56JHHeA/BwoT
         GBEs92I+HJzXrqU9B1prrc/JCyXu9iFuy70HqZxdHmLB3muxwPXSl/6ha3eoLmMXK31n
         AGQRc6Tnxt2H2IQx5XRXVRl/hGDv4niG2E0OnSGIA0OknklYFzci2i39qPrVRJVLDkCn
         3c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992466; x=1794597266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=WtuzHALdCM603mLaWkW0KE+GuXvQlxReP8mOfdC+Z0Lomte+8cv1BV3uCgYjOg6zjN
         t4hnAsEu3WoDJeXowuh7I0fIz6X12eSCJ2qnXRGHMAFfUk+CCcZDqqVPq1d9RpobAyO5
         nrobx6C7azyrFird1yeAeZXIpstuIt+qmvlRA7jfnHomycfZknu1U4edCkckr+PM+ynT
         5XkPb2iqPlhTkxfpktZB7h21SjiIWS839nJMGN5F1u6BCW0at63PlhOfvuKakqgJsXdn
         Mqb0vuOa84+l5pCjwcNryvZJYk5AdmVTVV3x9fN9NRDPZNlZVV0zg27TVOEr4jb23QcH
         CNxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRN6thZo4MLcCG9SmytsTBkqsh8QmVvuYwBo3kdjXKe2dBXnL6DhL4O4atD9ouydHwfzBOyK1rEp7FjTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GrBhe4ycTfQsrwSBJQtvuBZmrHwXT5uEfbarKVA46bFvEjXTG
	QBM5KfGmLABz0xadGOeHi/zOop/WytVAXOs5xnOKzw2/SJra2hT8j0HpBC3Tc73H7WI=
X-Gm-Gg: AYBFou255yRV+uG1m2fgNnN97qxZYJpdwRmekzObq2o1tHbZwprOzEcgu8E+i3C3cIf
	0hCWk8E30J28K4Pq8oZ2QNod5StKzUPo+TgL+Atm2QwuXdhR7YRtDozT/9LY2IbLtS0AOqW7WRl
	iHYB4xl/NndfvJLI1EmJlJSumkza3lBcOhbq78I4P7ImbAY/ngrTVf9r/bpF/GCl/tyDgwNpZ0l
	P3jIfwGjaduUfRWa/OhvvrkBeLKlr8qzVYEFDJw0HuHN0tyzrqghjWz3bTFTnf5MmNS5rkoTs7T
	ImpXFJYTiPYCgQ2fQaYur/ZobWmetZfI2uz2LxXTL1gdkA9aRLQeINO9OazrnGslHHyy5C1JDT4
	Pck767nAKgs/bkZASzNC91xKGZnFeBarIs+T/tF+f+NUJ8Yh8tYzWeiwIxkxTiOSQbl/5mOlgP8
	n6/NeEUAvws8GObmp2+kfSeNNDi9Dm4r77rqW/JUJpl315/7xQ72deIi3l+1wAAK+2yUPoxBq44
	yP+gEq0yGEKpr2WMrIgZH2Lbk0tYEAqsBbhMf2oVGYb5r/Kru59H7zh3KBOdyIfgayww5CDwIoA
	xOagsicGcPNVdzC0im6Pyy22qvHbXwf1WEGgFwq5DDviAS1577EVAOef9wEApg==
X-Received: by 2002:a05:600c:5295:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4b6de973c5fmr58007235e9.6.1793992465400;
        Fri, 06 Nov 2026 11:14:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm670335e9.13.2026.11.06.11.14.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 11:14:24 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/ingenic: Add a driver for the X1600 display controller
Date: Fri,  6 Nov 2026 20:13:08 +0100
Message-ID: <20261106191308.31303-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
References: <20261106112000.1612-4-olivier@mgcrea.io> <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net> <20261106143827.15926-1-olivier@mgcrea.io> <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Paul,

On Fri, Nov 06, 2026 at 04:06:50PM +0100, Paul Cercueil wrote:
> Is there really a point in enabling the clock on-demand? Why not keep it enabled
> always? It makes the driver more complex and I don't see a real benefit.

Fair enough. I have nothing on the R1 to measure what the gate saves,
and the PLL it divides from keeps running for the MMC controllers
anyway. v4 enables the clock in probe and keeps it on until unbind, as
ingenic-drm-drv.c does, and moves the timing block to
atomic_mode_set() as you suggested first.

Thanks,
Olivier
