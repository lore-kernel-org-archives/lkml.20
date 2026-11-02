Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634946;
	b=e3rDAUQeTDPR4RlSUyKg7rb11cris51t3qUEAQBnQSsS7h1zP3ZIXNNZT15BAeOol2NL
	 STbB/Nkb5N4/g02CcfnXpFwFyHxPofPQTLJ4wQhFlIY8+M7J9O6+aIxNiiGNTAKjh4qCX
	 jNxDh6RYDNZYNFxQCY6v57iQMYIgxjLCk6df/I8Oig57QLhUa58Z2d/Sz9Ox2uSa5G4Jk
	 DggaaAv4YSlbvRFrnk8otrPnWkFVEgdlsHUdh4/92niOWMye7+Eh+OLjWNstG705pzW3v
	 NdZhK01EYn9sgKEQx7q2//n++qf625SGLGMpPyGRn5bQg7kxgc7eMsfSkEgzY/WTjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634946;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ZsBtyqiFaBBCC9dG9FA7W+94CvmMBULM/6mxGT3R8BM=;
	b=tOQK3SKP/w9TmcMT4CMuh9ISAT6sNPHTwVE2hNcXLOp/XOGFzoTG6KTLZuXxEM0vudaJ
	 3xVuCszv6KDcdBv5j7XHY1+IcOMgvQV2eEFPo0uSSiP8hdSGDxKnqGPKVhd56geGqmvEj
	 f+t3rLroZCo81x8jtO0YjNCbAT9o4b/OSbrTdGdsYbDAyXFHuYHksrP86BBXUCUPKnLvP
	 5TGrOU5RK3uMU1OqgKvFtZ+s6E2D3eSf1BMIBvsBPmJvzgvJBgc3fATTC+lw2rJUgxkmI
	 iDdT9PeT/hpylhV/w28MNoP5uzmZgAYC3/BAB6/85wJmSTIcZrW0jK7NNnyAkogUZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CwvcFy+J;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AE9606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AE9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CwvcFy+J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6DE651A140C;
	Mon,  2 Nov 2026 15:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C14260750;
	Mon,  2 Nov 2026 15:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B71410328E6F;
	Mon,  2 Nov 2026 16:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793634941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZsBtyqiFaBBCC9dG9FA7W+94CvmMBULM/6mxGT3R8BM=;
	b=CwvcFy+J9S0wTdIsKcWAkHYs5ZvouQoUrRmVIw1RULGNtbrutD3neWuBZifCfDT1xy6W36
	KDh9++9M23/rYWeQgh+LmfGEjGfEj3AKBDLwlVE7y8Ga51EEvS3ajrWe45BHPnn4YMLB8G
	QpsBlCT3ePQ3va1B/b7XA1cOcv5H/pAUKFsi5dnzwgsP7cnJLg9HBnS9uI4fiscXatSO4r
	6DEV9Z56hvyapq+QBaxXnrfIhKTnjWENclShIZEUxdh98I0ogvd2ofdAvlMlgU+OMOz510
	81xq2b8OVpflPQ0QDlgn2gevr+35Cjn1xnBIE3HvP4d/LQoVqM+HpRQeFRBOtw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno?=
 =?utf-8?Q?=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Thomas
 Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
In-Reply-To: <20261029-positive-unbreakable-zebu-d4484c@quoll>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
 <20261028-eyeq5_msi-v1-1-c464752fb55f@bootlin.com>
 <20261029-positive-unbreakable-zebu-d4484c@quoll>
Date: Mon, 02 Nov 2026 16:55:37 +0100
Message-ID: <878q3b2pom.fsf@BLaptop.bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Krzysztof Kozlowski <krzk@kernel.org> writes:

>> +  num-vectors:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Number of MSI vectors that the port supports.
>> +    minimum: 1
>> +    maximum: 4
>
> So your SoC has multiple blocks with different number of vectors?

No it has always the same number of vector, so you are right I will
remove it.

>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +  - msi-controller
>> +  - '#msi-cells'
>> +  - memory-region
>> +  - num-vectors
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>
> From here...
>
>> +    / {
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +
>> +        gic: interrupt-controller {
>> +            compatible =3D "mti,cpu-interrupt-controller";
>> +            interrupt-controller;
>> +            #interrupt-cells =3D <3>;
>> +        };
>> +
>> +        reserved-memory {
>> +            #address-cells =3D <2>;
>> +            #size-cells =3D <2>;
>> +            ranges;
>> +
>> +            pci0_msi_reserved: pci0-msi@806000000 {
>> +                reg =3D <0x8 0x06000000 0x0 0x100000>;
>> +            };
>> +        };
>> +
>
> .. to here drop everything. This causes warnings.
>
>> +        soc {
>> +            #address-cells =3D <2>;
>> +            #size-cells =3D <2>;
>> +            ranges;
>> +
>> +            msi0: msi-controller@5840000 {
>
> Drop unused DT label.

OK I was too close to my DT for no real reason. I will simplify the
example.

Thanks,

Gregory

>
>> +                compatible =3D "mobileye,eyeq5-msi";
>> +                reg =3D <0x0 0x05840000 0x0 0x10>,
>> +                      <0x0 0x05840040 0x0 0x20>;
>> +                label =3D "port0-msi";
>> +                interrupt-parent =3D <&gic>;
>> +                interrupts =3D <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
>> +                interrupt-controller;
>> +                #interrupt-cells =3D <1>;
>> +                msi-controller;
>> +                #msi-cells =3D <0>;
>> +                memory-region =3D <&pci0_msi_reserved>;
>> +                num-vectors =3D <4>;
>> +            };
>> +        };
>> +    };
>>=20
>> --=20
>> 2.53.0
>>=20

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
