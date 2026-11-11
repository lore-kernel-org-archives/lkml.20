Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367381;
	b=bpC9uEG8p5wNmjmGpCbHG/I2ektuSp3vbyful7Jp5OWIB4U/t/XNJqUsfOiqv8w8Mg2d
	 VB75mKHnt0FaxNeWU4wWzjEMLOd1angObwcdYrbBxcKQlrozq3e1IcuAqIXScUgiipJPo
	 rSaBGVBwrCE9FN7lxWKA1vtYVVZwJx22v6n7BH9GUxAq9p9nMyxNYOiICETqeVRVRYXkE
	 7MO44hQiOY4A2aCjI1iYXjDm6JysDDRz7rbXIdQps1nqb6+Bx6b45unuUGuXnfa7u/3+2
	 Bbty1u4T6g7NdL5XCURB8PksAcYR5I+OXLlezXKbbnYLMADaiOLrnXGf/ihgmwLCJJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367381;
	h=DMARC-Filter:DKIM-Signature:User-Agent:X-Lms-Return-Path:To:Date:
	 Mime-Version:Received:Content-Transfer-Encoding:Cc:From:Content-Type:
	 Subject:Message-Id:X-Original-From:References:In-Reply-To;
	bh=cwlQpXqaLUwHvZtTs8DVVBeTiYBaieNwyzTfHe3g38c=;
	b=yEHQOy7qnYFpuMfPsAjOjmXdzRi/tX8r1O8/tSC2s+o5iPeoc6q+rFSN4s9oajpGDJYL
	 hYIR3jwUVdV1voHf+xLTEnZrOM/iPNqJijNMjBjaZ8LUaCqgQ6R7yBKeZ6Kb+vYt4KFzG
	 OKzqLJtCajOhVMFoPOCjq/Dki7y6uZOqFUHaPHBkURvo+6Tqb1KvTH3CFx6RwtoBBrEoC
	 1rE5U61TO74tnMvZzDYQ0i3+f+HXvpKEXT8iCux9Hcp3ggh15+HrrfNUbdij7QNi51U/u
	 1KMrp8G3es+gBRysyzAnOmj3Poo2ndNfLeMaDAOiee50P7h8P/88+1wiBe9fZJbXpaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=QdU2PjN+;
	arc=none smtp.remote-ip=209.127.231.51
Received: from va-2-51.ptr.blmpb.com (va-2-51.ptr.blmpb.com [209.127.231.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFE606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BFE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=QdU2PjN+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794367374;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=cwlQpXqaLUwHvZtTs8DVVBeTiYBaieNwyzTfHe3g38c=;
 b=QdU2PjN+S8MHyDoR8BoIIAvVmAtOsi8yx0EEPS4BkrbIqArHI0gSgae+o14zTNcsbmpG5H
 /Csdzuo+Izi/Verz7pp/S5R6kx6kzDGfOV6WaySoPq2zDWt3GVjltOq3CXwCj6Tsxkp0C6
 XsceqzKhlqwNXqfLD99X8mSwVaVQ6BiMDz8Q2bpGV3fl16+Quzlog6Kb79V2k1MlgMV98b
 sgI4dTeE0yVi6bDoxbnRpQm8+w9+6fZjbyRy1K4MYWzLvbtZPCYl1uZipL88OdzdkaIDVe
 5irPPHFNWgpECodUkwmOuivz42dCQxJeXbUgFer3cWijbByB43QGc2AMHOUyzw==
User-Agent: Evolution 3.62.1-3
X-Lms-Return-Path: <lba+26af3df8c+79df59+vger.kernel.org+rongrong@oss.cipunited.com>
To: "Conor Dooley" <conor@kernel.org>
Date: Wed, 11 Nov 2026 11:17:48 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [192.168.8.156] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Wed, 11 Nov 2026 11:22:51 +0800
Content-Transfer-Encoding: 7bit
Cc: "Rong Zhang" <i@rong.moe>, "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: loongson,ls1x-wdt: Add ls7a-wdt compatible
Message-Id: <227eb9a3dd5c1cb1af4cfbf2c94f30db1755a5d6.camel@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
References: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com> <20261110-mips-ls7a-wdt-v1-1-968bb85122e6@oss.cipunited.com> <20261110-barterer-pandemic-e4c658cac7c4@spud>
In-Reply-To: <20261110-barterer-pandemic-e4c658cac7c4@spud>

Hi Conor,

Thanks for the review.

On Tue, 2026-11-10 at 18:58 +0000, Conor Dooley wrote:
> On Tue, Nov 10, 2026 at 03:02:30PM +0800, Rong Zhang wrote:
> > The Loongson-7A has a watchdog, which is similar to Loongson 2K0300,
> > except that it has no clock controller.
> 
> I find this hard to believe, the device seems to be getting a clock from
> somewhere that the clock-frequency property is providing the rate of.

I must be losing my mind when I wrote this. My thought was "software
cannot control the clock" but my finger typed "no clock controller".

> 
> Why is that clock not represented in devicetree?

I will add a fixed-clock node in v2.

> 
> Confused,
> Conor.

Sorry for the confusion.

Thanks,
Rong

> 
> > 
> > Add "loongson,ls7a-wdt" compatible as well as a conditionally required
> > field clock-frequency.
> > 
> > Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> > ---
> >  .../bindings/watchdog/loongson,ls1x-wdt.yaml       | 31 +++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> > index 50a9b468c4a3..cb93e9578f82 100644
> > --- a/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/loongson,ls1x-wdt.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - loongson,ls1b-wdt
> >        - loongson,ls1c-wdt
> >        - loongson,ls2k0300-wdt
> > +      - loongson,ls7a-wdt
> >  
> >    reg:
> >      maxItems: 1
> > @@ -25,13 +26,34 @@ properties:
> >    clocks:
> >      maxItems: 1
> >  
> > +  clock-frequency:
> > +    description: Frequency of clock in Hz
> > +
> >  required:
> >    - compatible
> >    - reg
> > -  - clocks
> >  
> >  unevaluatedProperties: false
> >  
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls7a-wdt
> > +
> > +then:
> > +  properties:
> > +    clocks: false
> > +  required:
> > +    - clock-frequency
> > +
> > +else:
> > +  properties:
> > +    clock-frequency: false
> > +  required:
> > +    - clocks
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/clock/loongson,ls1x-clk.h>
> > @@ -41,3 +63,10 @@ examples:
> >  
> >          clocks = <&clkc LS1X_CLKID_APB>;
> >      };
> > +
> > +  - |
> > +    watchdog@100d0030 {
> > +        compatible = "loongson,ls7a-wdt";
> > +        reg = <0x100d0030 0xc>;
> > +        clock-frequency = <50000000>;
> > +    };
> > 
> > -- 
> > 2.55.0
