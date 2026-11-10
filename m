Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323430;
	b=t7xRPxftL+8zSfUTBqNb+5GI0r4zZPmL5UOgS/s9tnnC4dHIRMefhhoPSyjg3JggnNul
	 Ko9jnECh5dxFdso82jMy12X2iIYxMJKUv2B9nsKCYrO7oHQI/WWQcdueGMeURb5buL408
	 EfjlzRCq6gSzaVBIrBgtVj8HzdGI5oqe3F4+DgSKcthsn6q9X3ris+m+7OS4NStVieaJZ
	 1tNy6LicOZ2gfCWLvW/I6uajbnb2Pl8/IUcam0ZmjTx/Di+FRK5ydf+KPwrp8TuK1B6L/
	 bVSnO2S1Q2H6V9vtoSwTxle6My48M7NUUB5d7U1djU6T6Gsf4odr4C0gj9XBzMZ2h1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323430;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=tNwFIQTuLqPptxDq0q7lwq5bGxrBo31P8x/INtelVOU=;
	b=Vl6jrvQQ6nmnZgldAqhFqhJkLBt8ZrN7cU1AHQ+VhHVg8n7stWqR6MMqJrxFbpJR3Zqf
	 8GfJvSDMePenet6Ifo8D4J2zXA2gvpDVgRahVMKnDEYh/a/Ie1F8fwqlGx7tTH1MfyFBY
	 lYQePFrOUlhYr8EcGpuHAMuON17fuKqrNCYgAoUFQJfPPPhzKOYVeB7YxpCjmaAEqQde4
	 2iGFvn2tZseaUN31JQrpRPs7yRIPGGl9IKpnHARBR6Xg5SloFc41+OYif92Kmq/Xo/O3H
	 dY1Zf6S5lFA1H5tbBuNoL2d4XlI6DrFncgWrlqezft7G85QfEbHVHefxdEX2WM6NCKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=R64kc9tV;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A66606A31C;
	Tue, 10 Nov 2026 15:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=R64kc9tV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7434109ECF;
	Tue, 10 Nov 2026 16:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794323423;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tNwFIQTuLqPptxDq0q7lwq5bGxrBo31P8x/INtelVOU=;
	b=R64kc9tVaQiyNfMtkeRQNcqJEjgYoq73Ip9mVhozEpXakMJrQ0YYJw/rXHZ/THR0GyP7pL
	DlG0JQE9rcUyh4m7MXDHK39U36kunaY3Vzv+JQjN/7FLPdoRDNIP/4nFOXgt03mbvEYF4L
	PPnAh2DjGcJTAV0XfNsrAGkHmBNCTGz4QvHb2vPzphgMaEadahbEkz7ONEaJ1pzHE0+YHj
	/vf84hbdgCZrYJs9xSHegAPQSzFO4qxK8tq49kVSW4ReK+1w+CcmVbEDpjkxbaLD8Zw1oD
	jMVxV08Rc/5/HInFoJOfWBdD2dKUmgyLPwubLoW6DtTQK4ppTW0d0F3rdyTfDw==
Date: Tue, 10 Nov 2026 16:10:22 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Stefano Radaelli <stefano.r@variscite.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: fsl: Add an entry for Cloos CBASE
 board
Message-ID: <20261110161022.7eaf17f2@wsk>
In-Reply-To: <4969e7d1-3e6c-412e-bad1-6bde149ec545@nxp.com>
References: <20261110150024.1530988-1-lukma@nabladev.com>
	<4969e7d1-3e6c-412e-bad1-6bde149ec545@nxp.com>
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

Hi Daniel,

> On 11/10/26 17:00, Lukasz Majewski wrote:
> > Add an entry for the i.MX8MM Cloos CBASE board.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > b/Documentation/devicetree/bindings/arm/fsl.yaml index
> > c8290a83205b..3aee85026f6c 100644 ---
> > a/Documentation/devicetree/bindings/arm/fsl.yaml +++
> > b/Documentation/devicetree/bindings/arm/fsl.yaml @@ -1102,6 +1102,7
> > @@ properties: items:
> >            - enum:
> >                - cloos,imx8mm-phg           # i.MX8MM Cloos PHG
> > Board
> > +              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE
> > Board  
> 
> Should we sort this alphabetically? That is  cloos,imx8mm-cbase
> should be placed before cloos,imx8mm-phg

Yes, you are right... :-/ I've missed this.

>  >                - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH
>  > i.MX8MM TQMa8MQML SOM on MBa8Mx
> >            - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH
> > i.MX8MM TQMa8MQML SOM
> >            - const: fsl,imx8mm  
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
