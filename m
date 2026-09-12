Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F33B3C12
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245201; cv=pass; b=HQnq6OP6M/Fit2+4nXyk4wbdfxJ2VaRG8zb1Fsmj7HtIjMMsnTHMncDj7a+9qLuQvrwFw4Pjy5UeRf7ddWb7Rxb44MtBwPIStiyaw+pvUmI5sMPtNvWWR3D0Zy42kHGvyBIsXtfB7NM2/9YEg6AO7mXFj7XpjlF0pAUqnbQXjzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245201; c=relaxed/simple;
	bh=rqyBuqSHWVw61RfLl33rH8YgPC33rT4HhMMfaGZOUmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPRVNC2DLsvn//WSozaTJHdeb2vKweMKfDeV/pSmc2XH3RdoQJv8VQz1h1m8Cavs/mlOJhUFG2vIZkkh7RGSaxKv3tmi2SYT/3y4sElxSZHOL+lC5tblu0NGaqat9K+XjyFO+LEQJufotOQFv3WrlqDL582R7lVUOtYPzAQA2mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jbjo574P; arc=pass smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jbjo574P"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c294938a983so107227166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789245197; cv=none;
        d=google.com; s=arc-20260327;
        b=GWgI/KRV6aB2p6cYolPMuvqlI3QujnX+m4LgklTj5HxgU0J8sPRRdPySh7bMuvrbIa
         Ov8ZpTj/5ay0VsTij7q5ARsD8gJR7XfjUQ2C0+yD7ez/3VQtJjoHg7q2IvHFvCHsGY2R
         UJOyEF6qCP3yxdjuy50a1/2gJuTEiVyMGMA7J7aFym60XEVyIMzKXbJZ7+zLJw89MjAv
         IZKdQ7WFpKPKTpgWarSVj6LYEp9TvL2cVFm2t4mDtBoctRi8k9Q9Ygkfsct2Amdk+3g9
         DZ6VUFiSY/EngGLIRCF5ZdWiPNuM3W6CUrmEOQcxjazuBOMHhqAuwv3dqe3OS3kXQTMJ
         8Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        fh=VutYIiU5d26QgRFCzmJUy7vVjCZwMiYhAfe0OGBBak4=;
        b=pvMK5TxV/dP4nVrUouJ7pe+ZtmP2r9gVkdcaIp+pTAPPnUCzImMMjSl2P5d/SHtOXN
         cvQKynv1ww9JSvSHw1Tr2jn2DilKSaG7gwTWvZR5IMPWgLlGkWt07VqCRJUfAHr9C40w
         Ke0WQNE5ePKsI8MN21TDykpRipVd2IzQoquY6BJgeruOkwRoCHnw4YfXQq8fQwu73yn/
         4jmzZ28zaMFhEwtz7vbIo6RRAYrsmrlCOLqrKb4Ec+qcwJwQCsehHJ4ZmTTzMQHUvBTQ
         wYw7u+/ejP78MoGf/R/g9Hq549zj+RaMu4U1JTDzsbiHVsKWK5X5oFL+hgI792XJ9G6L
         6esg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789245197; x=1789849997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=Jbjo574PeTwU3+ByMmD0BDF3eHeS+YkszMRg9Bo7/IIlHtfBp7jgOLCGKQ7+5+1raM
         fUqdKA0UE/3fwUTp4r/6j/yU3C7O24396HMzfdE9XC65WsHanQkgjirPppgsGFkcdgvl
         bhlgEUqawkFA1HR0vwDkl8c8DbnKmwbzmX/U6dh9095SCPvDa+NcGEzbC0cuf/Ah13XL
         AUTfaAd8hqJbArhLA9GWAX7vPXVAPRsC5K4PRaphHqNMD5424cAQlEE889b1JNP8+8r1
         mg1+L92vDMS1CO3hlBJoqQp6rUsEWQ83E0ya+3hFyICO5HQb9w2EK5ey1CSwrfvq9CJm
         U6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789245197; x=1789849997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXb2RdQOVdFeimkTuBnAC0nV21XWeOYpcj6vU3s52nc=;
        b=EBdrvm1YeNP5q809B4WH4Q8SGtT98YjTrad/y3AdmOAyC6nNKkseixnC+HAd7bpMZR
         h7gjZGfmCmh3QkkyJusjVGkqqCq1U2ABjv1uwlUZ7oTli+wTJhpd+qFxL4tpk0oCftp6
         9oBVH7OeHl5HdgyHBvHfsZAitCq4AlGzwjz8X50EUGavND5BKd2t9HJJHYM2tXCHCeVJ
         +0ag+9ROpxPxR5cWyj5QdkCneDPHFKjEdxdxZJlhkMmGnrFnMKZRVbLj8n3uAL8E+nR/
         dsmOICvG8xHir52+7jn8vxz4A97q97lnmTq9ux2YACUPcJg2xlkPAlu9VMqLijc+4pjG
         ehLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzNQSsNqvbH/rYcohoDzDU9vBA9LtY01EEAKTprqCberjlFzwop56fy0y43SSplEbvTuJH3B4vkZ7wT3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l9EtkQEz1+3Jxdln2CgmWf0I+TuKK1HGfqjIbCO8+t4bj+mAx0
	zZdiE5Yb//qkqVcOTOZ30Nd9VWvUMTPwy+fSyEo+iOw+u/T9z1raJCGpDtEXmssWNDOrycY4XcX
	RZZWHilaoQ8zTnVRDkhS2sRbqyQheGbQ=
X-Gm-Gg: AYBFou1keKThCgWUEgYsQpSF+f5RPCa6aztapRFDI2rpIjGURsDUlpQLuIIrn9JkStJ
	OyB0IVRkk9FhXVME+K0rRsSfhbsaeVHfc9/Jnd/QpHLZWucQSj7cCCdLE4TJ1uHsAlet7utUYP6
	GDjEJUaRz2klk3D1ujjmmdayWcAmHq/deGYybd9TS3u2SQsaI2S/5pukspUjAnN9tjZJXJ6QfbY
	D6FICiz+MDrOcgZq48gx1oGNlLq+IGhoi7xNU/ZrElHzSN1yem9to+y1jEo0V0ywgRyRZQrqlG/
	HDCZokvb7SnUSETqfIl85a+b2fzoynTLE9HPFgYhBIOVK1o3TMCCHiqjww==
X-Received: by 2002:a17:907:d02:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c296659c61fmr976523566b.6.1789245197295; Sat, 12 Sep 2026
 13:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260912131421.2960a12d@kernel.org>
In-Reply-To: <20260912131421.2960a12d@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 04:33:05 +0800
X-Gm-Features: AcwNN1Wp1szdgOCnvhL-ujyIZJIERlGVxaN0L7OfiFu9TcpEfz4jyCgcrEH55iM
Message-ID: <CALj3r0itTv0+8R+mTg3wtMD95=4V3Znwsk48oxaSjrVMLoJfJA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon,  7 Sep 2026 23:37:03 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Sending the AI review FYI, please look thru it and judge if any of the
> comments are worth respinning for. We're waiting for a review on the
> device tree bindings, anyway.

I apologize; I have been so busy this week that I=E2=80=99ve repeatedly
overlooked my plan to reply to sashiko-bot's comment. I will get back
to you as soon as possible.

Best,
Coia
