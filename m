Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993690;
	b=AUxWmivgkKUyEQT55UF2mUBIIDlArLH5CwVvMdfCoGcyUZaR853FwRCcILGMm3yZzWn4
	 TIvrYz18icK+j8PLJ2C20eLChrdCNqlLYut20P1jizcu77+Tittz+O2UjUxbZ/NK30Pf3
	 BZq2Cgx31MUFU8MNMFX9uSzGarx/BpBwtlqhlj4Myze69LWfQO8/cQhGPGxObFeyTAI+t
	 4Ib6D0wp6yNw4yBauPM9kNBMEiZu5miyVKFGp5lcMnyV/D6pxGb0cMIijApiA71WLknMj
	 RSQ5Gh2CpWKtGOV+W9ZDyMiEMPjroZJudJCiPSM1HTRuupfnh4mCs7Be0gMesnam0ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
	b=wyiBlujyCnlEMIXteOWpJptisuJJOQcLcJCkTg95caeIXMBkRmvV2rkQ7U1oW5JF9wVv
	 WSbsGul87eK+XUHgOaS/N3LSCrx9W3VyYQS7WY6qacAsZTcxUS5UXnIu/SDd8S2+5uPAG
	 3FZKsKH5Nti1T+H2LhYRvoDuR1zDh0ByFUBn54nMvw0m0e3Utm7x34IX1bpaR2m/78zkr
	 L+L1gArSJZQ8o+01yR+XlO7+YLX/dxXKU0rxjZJt6A0loZCkTPtGnj/VZqV6sDMnyTY64
	 vyx8IDcukoAefGYKWw2VktVJ0AsMWyp82RE/k38UnGw8rCvEYOXz6Uo6+CW1hUf5GeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A021606A33E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A021606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so12983375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793993682; x=1794598482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=ooWyyoprmnZ0Lw9epK4C81tNr7WPHUvU2iRl9eKcOqcl48P3TtFkkBdYtzLhq4iif0
         NoWKh0PN7dseQbETMek/S4C/5w7E0V0aDNcVP+gKSzrhF+c3EpL/uo9QQfvATmcqBc80
         vxq9QCmQ8dKphdadliHiddTcq4DMOMXuNk/1GXrE6LgfB7UQt/C5Xt/yRQXYghgl7E4O
         C3jqLvAZtqemGOlkrZXxMlhPDPI1/MYYHjBfDH0NoRWyxH4HYgzdDyfc+SEaSIPe7S9c
         7A0w+UG3bpfmwiS6RJ+uFwMX3Yd+RyTNDnl8oNKvEzt5hBROpYYf3VmMJNhL+37s8tL6
         kFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993682; x=1794598482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=pj/nXuQ5nNxXguj0gLf7kI2DYz2KJi5dTFrdb0IweLy0cpIGy19NDE0wikZRfGiBAW
         Gkhrvx0kBHOpGX0i8opg+qkAJhDZVet5hA/VioL3vLlD+ewv7mzo8KOUjZot11EqRT8Y
         LUxnAkh/f34DTi1SlFaWFQoFGCDDwarZwWSOVZ+SuWkc18jRi3QS8kT7uwoxZCAT9Qwo
         nh/MVwFLQBPxkJeCbXh5kn+AT1QO/9XIo21y8gwfV6gn71lprHrKHfkFEcG4TyiRPu6p
         dz/fzz61vLxjZjIJ8z1gy9WI8BoHjNH7AkJ5LWjmgZBNYV2XJeZH4njEcCNpMgdyuXz8
         7pvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT6bk7Mf/igQ2BRzVl1CQ+uVpOdpNJWP6NLTRf5I9UnCYxOcD2A63JUK+kqeWYOfOsJnC7lw5R0xKh/kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ds5TtZ83llwsRqTWevRAbZWGQP4OuyCW0X/gRMl+a72V+84th
	Laz0qgILOlMTzU1JEm61KnrgP38Ac6P+RT9erHVnlm5udMl8mSf5LQ5gBU62RLfdoko=
X-Gm-Gg: AYBFou1Lfqw029/HgbaeaxM/Z1ePtNCCq+fXXHS4ZF4yTqmVRQJ7kxMFQrO4Dllu72d
	9IHDsD1AgL8gl7IXfmZYfkZ/Km0pu1jEqPpd76ZUd994Alyf48vYBp1I8uc1XcX3RnmjwZFCYWG
	CJuvqAMl00yIIV8uyJGIugW0Qtuus2YIgtUS1hq4W+/ueu4o5sUr7xPeGHCLPjcU8iA+4VTUz4V
	1klPLw1H3Q1TtjbnwBZZDiOxCG8fkWm6QG1VF6JiFHB+byY33stOR8owKwri/+n4LZ+gcYphrhI
	a3HHWI0htcuu9T2bPhxfp9RiTxkxBRO2LR0dTBRHxJ5XImxbDuudfFj28jnpjLR2fDqRf9+xO2x
	lCZ+J3WlBMt6bmhs13aTm8snWiMLlbjfMorRLZ4F1wYD6Qyl6/GgK8vGSVxCBRsq+HkwTK0GcSD
	cKW4LO5pKClZFLn5Pxsa9DtBMu55nsf2l8+/5fBDwZhnDmMxB+GBDXrPYlnYvk+xK5crVGRbSOB
	YX4aUyZiNFma74OZcx7DXObVghV2A9z7We3P22n0klv5a6biPJz9I9Yxc3dv/BbCTQbnIcQoWdt
	IDiyqnBJBUxE4Q1nY8s2iXk0/dzhptb6BjLhFBBhlXvlwjYVV8wSeLwOgWt4K9TyLY7SwtHb6yR
	dH0u+eKA1FP/YMJQVl4U16fGRD1J1X4E/eA==
X-Received: by 2002:a05:600c:3e0e:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4b6dfba9199mr64477945e9.23.1793993682189;
        Fri, 06 Nov 2026 11:34:42 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm3329295e9.11.2026.11.06.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:34:41 -0800 (PST)
Date: Fri, 6 Nov 2026 20:34:37 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au4p0xYEFkgEU6T4@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
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
In-Reply-To: <20261106-unwilling-preoccupy-156dbb310448@spud>

On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:

> > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@0 {
> > +            compatible = "amlogic,s7-peripherals-clkc";
> > +            reg = <0x0 0x0 0x0 0x49c>;
> 
> What's with the weird numbers in this example?
> 
> Examples don't have to be real, but when it looks like this the
> immediate thought is that the modelling of the device might be
> incorrec.t

The numbers are actually real, but the example simply lost their context
because I copied the node from the S7 dtsi (not yet submitted), where
the controller sits under the APB bus node (bus@fe000000) and the bus
ranges make the addresses relative to it.

		apb: bus@fe000000 {
			compatible = "simple-bus";
			reg = <0x0 0xfe000000 0x0 0x480000>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

			clkc_periphs: clock-controller@0 {
				compatible = "amlogic,s7-peripherals-clkc";
				reg = <0x0 0x0 0x0 0x49c>;
				#clock-cells = <1>;
				...

In V2 I'll use an absolute address for the sake of clarity (PLL has the
same issue).

Thanks,

--
Carlo Caione
