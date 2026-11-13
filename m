Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568198;
	b=2EMT09PtumjYcKl/4sgw6AU5cFhENyzi+ChgFEY8bqaPGPJgbnKpUMg8Mi6wXGyLso0U
	 4EyzOUcaePKIbZsVnPkGDJco7Y70b6VTxKvCPTcJy+6ZH3Mf6qm2Kui4mmy6le3cH8/QU
	 icgFkPFUo2xFhiLhMy61yuBXysgKaOgsnzD2lL4bG7xYoWAeGN744QwemA5bmwLOM5L5p
	 4QeEHM+Km+ymCfnEpM/VC45L5QQoP4cQjQjVT1DhQlwfNDLgcvTYoIV00ivHinzz84jiq
	 D3Z/+sxtzq1VyJalP5bThXVxUc/9k1i0jx28tyViFKXZuxRXHsn8eAmQ9cN0pD6OiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568198;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=aP0HKF1Y4kyUipuAWkIw5ff7zQHGrIr+0UoFFBdTvm4=;
	b=28Ve9GhoVXehbsM/B+RM2klMCv4qWk1ptzYTtJxFclJuDM5aYHKT6AzItr1jzYEpE0gG
	 q1XIMTDod8ViQjLWv9p9bQUIEy5m2kv8CqzQWtTPzfNpY/kgXypCfnYKyqnYyCNBTHmW7
	 tOpTZm5GdNnv3A1wcFsXW62U8R5I4W+8vDejVSlVZfyf8DRcbmP6Zf3X5xTQISiK3q2dY
	 +JxdgM6X7XU9n9w2IlKFyLRkjqROMedfvY0Fe1hIZm8wZo/BB0B10VYDSbP9PIycrM+ed
	 OyopGuj6oJRkBi+UsSjDy4m7HGSu/GSPE85aHttyFxvttO+W0CHGzhfShs4XMhkldDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Db7ugddb;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE3606A31C;
	Fri, 13 Nov 2026 11:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Db7ugddb
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3BCE10BE6E;
	Fri, 13 Nov 2026 12:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794568191;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aP0HKF1Y4kyUipuAWkIw5ff7zQHGrIr+0UoFFBdTvm4=;
	b=Db7ugddb3uRmWVLzG/X/epdSB4A/gZAo/hVS8jD8Nki58Hq86gWjE8FGjm2Ppd204tYMCG
	Cygj0jRcuQt1WeThqtBIAYnxPRuROckC42hDv3ARyCZVc9BtF4X9YitlDzC1nGjK1G/in0
	1+N/wagugPPLNzfZ07SpeU/QR6knDBfyNXCzhpc1pNP/f5rwQbBNaBIikb5Z8qC0f627nc
	X/sKyMvvaRtwYAPjvIBe2SwdZxtabaH/CraitCOSLVnZU7g1bxwFTL47qlx2fJSEnesvFm
	8gGMqx8MAAEcam5BjNGEc3/f3YEBqNFSAICAW/NMTnYqeiLyPCHZtyvz4VpMCA==
Date: Fri, 13 Nov 2026 12:09:47 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113120947.6c9fb820@wsk>
In-Reply-To: <20261113-roaring-relaxed-oryx-5cfa1e@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
	<20261112163703.3358164-2-lukma@nabladev.com>
	<20261113-roaring-relaxed-oryx-5cfa1e@quoll>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

> On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> > Add "national,lm77" as compatible for the National (now TI) LM77
> > digital I2C temperature sensor.  
> 
> Are you sure this is a trivial device, not like LM75? No interrupts,
> no VS supply? Datasheet disagrees.

In my case the T_CRIT_A and INT are not connected on the schematic.
Moreover, the V+ is connected to board's 3V3.

Hence, the conclusion that this sensor works as "simple" I2C based
temperature sensor.

> 
> Best regards,
> Krzysztof
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
