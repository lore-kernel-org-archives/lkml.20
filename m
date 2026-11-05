Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839185;
	b=eU+paAJOqrejj567RmY5miutybnHaPdDTAXyzbzfa5Qe61BlbN+9zRedz4MwqrJDgzCo
	 F+zoqSfhD3WIxRh0q2BKnuSCjW35nY9lEUeXPnAcoPyG1s5vLEF7zAsPvNGSJzsXv4Qtc
	 EDInX9Ch6mbBUyYQAD/7LJW33mND0lrV6LPh0D8Y5K7eDDk9eXvpOsnrXnRqt2QSgWRmE
	 pNEOFjB8Av4BpkJ1OUijaJev+PMlXpo3aG0VungxV8rjNUWbw4WkGD7lQJ4coi1XYo8Sk
	 6//6iiIJI7z3BSKGNMBqqqlAMGNNU/M5DDaA36HFyurM3J8A4o/bqeio13sPTJFautQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
	b=Fc0yI1cTWizYyvpwIw46RdzTxDgrWdzCDsbml1x8CtWot9Ibg056EpsIS360qiMCb9fF
	 XUmZyPOM+02/cGKguuezj2dg9qn0cBASFGAeS0h42ATH29xJ+GRtz5zCWBibINfdcXH1F
	 8EYZ2Gx9jcBnAcXDMrazhupAHlcHztFyu2lHKch90CvMaYzXynZbFRwGpxIC6oq7ObMn5
	 GZ+NZon+/NzvTNiksg011SS+4wNvn75qCRBogAxaRyhQA22b3JytH9reK32pruNOXSh7B
	 Qgv+3y4qzopdKv4WMbZBGD+eI0R9ea7CLr5PyvJDCYpHb5zBoTg8iKJyp+UHBCqU8Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA0606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBA0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso886677a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839184; x=1794443984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
        b=VKaWqRgljpOcZqMO/Q524tG3DsRhCrhMkyGvlh/G5nDN2N3PzAgTA1PR83FiBGupcd
         2jlGCWnYZLeUigfq41Vk0DZiOclKN+KglPgqqsHKjnCzf+WkRQrtSt6MCxRYgadE0xYl
         W3syG7b45YKATnn4N3osRo0laLWtAQ4lKTfC4LyGKu2dsQQqlqOTmjVkyXLRZSSf/aTT
         UGgemboKWPugILpo99Xku6C3ytUjuLE8Ri1lmmA2Llxt+pKHBsD3/DSbj8CTC35GfwSE
         FPDdO8Jp6iTW1SBfMWuYwtFfKwZB7UmEtmEQe1lvumOfpXNFo2URsqDckO8PCtyq+eln
         yCJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK8mfP3ZqDWQ3eKqzNmv+S1nKM4xqqSi2ewAQ1etwL3m//IFJoMbbNiEJNN7/cCWl9QaEuOiLA49AuwHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B2Ey/yM1Z7rwdu7JpI80d5BUkZ16LIFVWwmKif53dXRq7BilL
	ViiWBdnRgVvADqKo7jvqGjb277OCgJ8KcNLcpmoYmDRkFoEeWQPbBTCeWyi+rpHq
X-Gm-Gg: AYBFou0SyUYnjLgfuqx0YL2frgQjzkrUsIYymlOPPPuJf0imQekSOh4V5rGHQabXj6A
	d0Snhj4cEeKuarepdF74tCjYOiIHPZjYM5Ms0vnLh4idmVsDzpjUOHZq7jqfX5fZuCo/+dGALpR
	Oz2VDLR6S8jwxfqIILvldj0sSdFQ0wyYLLwDbfv6h29N4f8GZdkYIFvMXwQd8eRxFxcDJ50vQvX
	FUOY6JwWTo/C2jajsmNVpXPn5Y1qpUalHGadNRgiBgcTHtyTnVn4FDwubIYytY1tnz1kRxYRCoV
	3EWC0UQSNJWaLpITPzb6slil7Vll9FLhr7HmS4q5qGbw3uQIsd3B/AGsTczR5TaWbjyD3oBs+0s
	TXG3RHSmV6UM5vpddhKgj9j+BC9+JO+R16eZNHn8kGjvFos4gmhktkZE9Ksnm+071NhwjVj2ljs
	C1Vg1zMMIP/O6RGqnWtFWM3fPb6rMoUNAGbMwj6MQ7t3INKqMpX/Qy7DlIQQy8e0SW30dqLqDFo
	INYbBdqbi9Irzz4WNOV8KoJM2fuWPoPoQth+gToEbpYd+x6ivPnK1pUQ/9rOX96myN8MHj/7JYv
	SnChILAkm7yEji98yCaFrx7YjDcY8LSd5GiHhru7jU00wAKgEW6hjifn2GWSUaI/qw3PZNp6v/D
	xVD5niMkgttD6rja2Sfe4NyWcMaCvKnxuQqTNI4EHLfmaJA==
X-Received: by 2002:a17:90b:5147:b0:3ac:b3e5:428f with SMTP id 98e67ed59e1d1-3ae897ce445mr15747831a91.53.1793839184213;
        Wed, 04 Nov 2026 16:39:44 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf31acsm1025299a91.0.2026.11.04.16.39.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:39:44 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so1820539eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzSc6ceSRGWOyx3YcRJDPKHgO9N2U061TJog5M7VeSYd28VPmyAZIx7TCUfn7XfbjSwUEK1aDWDk55rBXY=@vger.kernel.org
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr38131346eec.22.1793839183442; Wed, 04 Nov 2026
 16:39:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev> <20261104-unscented-armory-4dc756ab95cb@spud>
In-Reply-To: <20261104-unscented-armory-4dc756ab95cb@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:39:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
X-Gm-Features: AclHuK9Sx3shGebCfLzax5r8eL6ok4wMG4whrKpB9TRpvY4T3TEbHPr-vy2WL-g
Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        reg = <0x19e0c040 0x60>;
>
> That's a weird offset and size.
> What lies in the regions around this device?

It sits in the 1 KiB from 0x19e0c000 up to the next block at
0x19e0c400. At 0x0, 0x4 and 0xc are the reset, clock gate and bus output
enable registers of the USB clock and reset manager, which the clk
series describes as siflower,sf19a2890-usb-crm; 0x8 holds a value I
have no documentation for. The OpenWrt port gives the PHY 0x40-0x9f,
and its driver only uses 0x44, the PHY's sleep control. Read from
U-Boot, registers between 0x40 and 0x8f hold non-zero values I have no
documentation for either, and the rest reads as 0. The GMAC's
configuration registers sit the same way, at 0x40 past its clock and
reset manager at 0x19e04400.

If you'd prefer one node for the whole region, providing the clocks,
resets and the PHY, I'll restructure it that way for v2.
