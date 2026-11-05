Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912279;
	b=UpL5ff9JBq6SOnvw2aRMdBO3e6FIdIoDpIMPugRCkqeZ5QUi3OGnNB5DsAcofZPzDHOY
	 joUXhFLdaojMuc9LE3sKvhT5+pYF3glVIF+iQRalVls3Qjcq4Q8WJfHrx2JHIzV+xhtcA
	 uDkEuZid7VUKZoU9FSnTT++UBclCq6cGYu9mg0VURuw+9z1eHYkDg27Djbk+MMowwx559
	 3xsbqPgTIRsm1qlsgxQF9epxdvoijObVD+Zb8R/lbTHwP8307qi5eL3vDLbzQgu/KuWmw
	 YsB5NvzgbBrwLT1smeM+WnesvCbz2n11qn8luQX4Jn8A3/0nOdRKjWTn+O0QJ23qMQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912279;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
	b=0GJ8qQHz1Fmq7d1sRcSxU+YGq06upX6TUuNwQ2pnImM8HcydMYLBpkJyTFPqapupM4C6
	 YNsm9y4jNjApx//UiEs5JkmzFIPtfoawRlRO/SN4EcDD9LjCq7j45LKC75NzGABkC60DJ
	 pRpTDfNkr3EXbPxaGiY0ghH4iiWoktjsjUiCVAjOdgf/2B+r3FR5bZmfZDD//eSIozk5V
	 qwdjLlqpjhgbFep5g8UeiFPAoq6hJWz4wJumgcr8OjgvYUz4ZQhrSkmeXTYnBsPbVdn8r
	 UPTqX2mHCaUyikSaSeCFf8b+Oih4vL/nMzDeV8KuhKzYsL8RbufsKX9Cp0uPahqZltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B5606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41B5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2003118a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912278; x=1794517078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
        b=wGPv3Z26LXh60/agozbmnBKP2F4OF/+BEj7V3aBv4eTFRuFCHOgJSnM5U7xhW+d7pR
         91yU+TOABy5PC+YUpa6sndIamh4xdEPfjL3XBwOa9jHDWDP2nUSmsLKxout28sOeEJWE
         BrOzCVEAMkQA7o3LSCWdLTJEmryug9FSuLDyamBWEdg8vdbJqZR25CoCPlxVpXqijRJP
         xcodcx+1WW8bE0yLhFpWg7YT7GxJU0gndbBNuPY/uDaXCcZKa6EA5J+qMqdKxgJoRcJ+
         ALOuQspZ1CVG+9k/O40TxCUxKvGgLit4c0FWmjqXmEfNUKQ40MwrTBlo3ghNSNHIwuYz
         Sb4A==
X-Forwarded-Encrypted: i=1; AKwUvBzgGme7va+FPELVUgqsNcS113HNQW99m+n7QGxpSRr9G0BeUQzLQ31Xc78TntV/TlSKq4J8AB3dee3772Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iBeB/EbHzLmHH9wC0iIuTMsBe+12Vc869WgkLKszjdDH5ZwMi
	MQttRhlckAMHkhz9pjE0MKleX1MJ+lFOsoBtOl1yp9nBbhuzCYnbLpiAio7HAA==
X-Gm-Gg: AYBFou30g6a9uhLC/ZTOFY7YGpqL6p8yQb5NU0Q7Adr9BqQKo87MfLDCZPXvWMlwqaT
	LoTP9bGo2EEtpDpD1j2OdT1JY/ZK9djfaybKQy6HnWaMJFJaxtqUxbutDU//sNPuXG/sGwDedd9
	evF39K2hkt4kifRQmtdoXe+jG81EpJz/kN4GwEIg9ujvLo0ztiPZL5aR50xES9o55XyvxiMj9ob
	iF4iCIAdaIEjyo2bl5+s4ZVH8gO+li+U6eUkFsPgeHmVxyPU9Sug7AZe3yv6fjeH4Sa4/HU4BcB
	lpv8ItSjhwHg6XnYbIn2uVR0VddCYKN3ZyvxSh4T+DmGfK+GK8sfVNwPCEq72qggVhvzcdop1y2
	rxV3WAluobiOuXgLMGfG1rZyQbmhhifSp5I6GOTjow51qaUoUyBIUwVM/eHPY6jtImYvF1mBRSZ
	yNLKKPQ5tewnU5bJ5IwY7Rtt8RwwxfNK7hDYGKFe9j9GDG4lNmYpQ14OKLL4ixehwn8LEx6kDpi
	XS4wJtVYpkyN07j9oXAMzF4Pf0Hgi+iZGURr9IGOZ6yWfmiCOKKacjPJ7hEKR+I3qKDZfnyX/2g
	T3gnNw9JbjdR1dPX6GdLlG/aZer3QJ80z6hHMK0FZJtfTOwwQTlDY8F+beT6eeRAEesM+8gn2RL
	TavQemYQYN3VhhjxHW15izGQokjSBONim
X-Received: by 2002:a17:90b:314e:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b0db70531fmr203036a91.52.1793912277992;
        Thu, 05 Nov 2026 12:57:57 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5091934a91.3.2026.11.05.12.57.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:57:57 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d6765756fso3048968eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxDhftYk3fvz9GjBuq2I409kYhrXBQ2sbuNOs4Ph4cGVaynYcsg1Vz9jo1yRmhSYQmkc/hg0yuiD1ra6wA=@vger.kernel.org
X-Received: by 2002:a05:7300:ea91:b0:36a:6d52:e16c with SMTP id
 5a478bee46e88-36f75253924mr438929eec.12.1793912277153; Thu, 05 Nov 2026
 12:57:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com> <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
In-Reply-To: <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:57:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-Gm-Features: AclHuK9hGSAdRKsJYKbyzOuaSV6hdi58LXaj_oUeX5Eo9bGiXxx_BR0j2WjKwyM
Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Do you have access to another board which has a PHY connected, not a
> switch?

No. The GL-SFT1200 is the only SF19A2890 board I have, and the only
other one I know of, the vendor's evaluation board in OpenWrt, also has
a fixed-link on this port.

> There are unexplained delays here. Is it the switch, this MAC, or the
> PCB?
>
> We need to understand if tx-internal-delay 0 really means 0, or it
> actually means 1065ps.

I can't tell that from this board. The sweeps measure the sum of the
MAC's delay line, the switch and the PCB, and I have no documentation
of the line's own delay at step 0.

What they do show, in the MAC's steps: the windows repeat every 8 ns,
which puts the start of both eyes about 4 steps (0.2 ns) below 0. TX
ends at step 51 and RX at step 28. So with every delay at 0 the link
works, but right at the early edge of both eyes.

Until that is known, how would you like v2 to describe this board?
