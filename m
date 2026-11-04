Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796214;
	b=hDqf6JRa60ozAsN+Df4UnCB8R9rMHTiGZE9YSTORNXcoTuzB3lUREH+5AwW/As1iFuiJ
	 ey1uCuDDU735wHLWy0Fmp4ElKrQLV44VmluD2y9mu1Z27bg0idLN9NJXaAwAp4iw5bdKx
	 +Gof0WMnBftH30rw80m1jkynNCwl8o9ZeL1jFtNpnOeVcUdIXOzW66vR1RNpnDkAAkYm0
	 4BAxT+iP8pA4/8/2HLmWMXMVux4MiCRWq4c5ahRjsrLk/KSAInD5L0WL8W8y2oXzWYss/
	 l46otRXPm+t2pd+NIIS7Et34r0q5P1aFpK03fNdpLIwXaFiwXW/B0FfROT6rDAdOpCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	b=J+dD/Ls6nxJM+mcIF0jgg2ZVoJ1SH3kgEWiGBKjclyCBsJ54AWUhvcYsDWaegRmJmGBN
	 VZ+WjWUAtURt0Nk00wTfe35q+ICdbJY8rxiQGMt/x24IPnVqoFyJ1F88zE5irgEtjXG2u
	 uYIvwPkUYD/2qaLc8c+/J/LrfFqrIdAPlrXdh0o/OAX69wPCyf/NDNgsepEhXQOeZlg+V
	 O6LDD7109oD73NqmX94JDXKF8K8MXrkcvWWFw7vbjqSSi5Draez4HobKdsMAEuc8rKD1q
	 V06Cn4hptP6duqZMhPTTuTiQteX/yAfY6zjbToPVFvD8rgVORDstrFuMfU8IGMaPnFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D6606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF7953F7C4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793796210;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hXxZf016eSpDLt2Tj7WemwTlgaYoJAkq6Gnn4YR8wAPGuhCc+DaizT+tFyH5FtiwP
	 4yNQ8o/4FWDplsPakemx50DMT29VDiZkDd9BJqKKne8N7NV5O53bS2CX615y52/Jge
	 Yu3T/n82kd7ZtvUv7VgzaWNDL8iWRANQ+nElMcskVKWxS/H3B7trM0SNLLW9gdD3yp
	 2+VHx1lf8Zuv9EptTCY8/iFUY0NIuVYqwitq+tRZErxXC+7AoSEg9yY4iPMGuRyi3n
	 LogNavYInIaRxf4jI+m//5nIIL1h4jWCbjOKxVbMNlqtkiB1xeBryqSGaeV5XPM7EV
	 CkPC5Y33prVGPJwW9sFZUTDaX0yEF0rsGzkswtNgvnWuZIIXsgof2LuzOKFBc+8EXd
	 ygJVRQjXuEqQi/kpioA+mVrsN4A1V+RhkRwQEQNFa/5fYnruPqNl8WtapgOE3cYl3d
	 K21dtAPA9MVslCuTjnPYv5wc8bScyhyYbB6WQvTO04/37hhKTjNpoWNodlHwE4Zk+o
	 n9dxpNKaTc4axn8y7H/MaNnv2ylzzZv9EAHeSNO5XmuKYzNLEn5f7PoFPtTzKv/nke
	 oAmSeiXFTqlZ+OmWrOo/oCPS8eSdxCNEHGRXt3dt4+ZvPyu+Oo6o0gDmQUZsEjszrU
	 Fl/gzuqZEr5HcLMdtNI9ZkQ0=
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1e9b36b05so1174930a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793796210; cv=none;
        d=google.com; s=arc-20260327;
        b=ORcfzWS7J805NHAMmZhJpmRybejNGN8iDd1LR2ySz+vBOIW2JfvffaA1RfPWicimhu
         UXsYczby2uoB4R+kQIqIzMyP3KL57Tf2NuxNHdsIpYcFLK1y6fw02Ix63nUW6iu4JKHS
         bpxPPtv9kgokATmTyqZeDnNDHROKZOudRl9wlZyHjttqIvXnzOcMWE1hKg26CoeWrEIj
         n+QmE+1SQU01j1jmQIUDvSMdVqvqSZg6v7UI984y/Lxp8TvBOrMG0yi3dt1PqUTJEngo
         YZrr7Yn7QCr/xhM0LetzLsqEbfjFWTfEeFwdnlePIE6Jf2ZIXtD8YY56ZCi1nEXSC5i3
         Bx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        fh=3OTbeWVt+n+Ip8YUefmicEelF+AmnRmy25bLDsPdwvM=;
        b=eHBm8izOVkp/L8Umth1P5k6Gx29dvvV2SG7W4Mg6PfaDCKZCK6FhndmlDB9c67VMxq
         lZZP4mI/Y6xozvwBNQij6z7Mk6cX+OPc+Gc5HBaxJ5+d7ulRLqGTeGqDrnlUJCHxH+S2
         U60/OwID0SvECOi7jCaHxfrOOWkGJGaRn2Q/7/q/UL5X2dc0bUV5hYp5LHYvBu1kKsEr
         z9AW4OG+0GAecrZ+4WM7QFm0LsZJJQAn+CEC0h+kyerhDRxBpDapocI1pF94Zrksr/JY
         2F7dl/lJycIBh45fcKD0YlqDb2bbCPYzEpbPkVO388ya9rQ9ZOD224e7Zuj1TyB+GqcZ
         wL5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796210; x=1794401010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        b=NiO3FQ9Gc1vyWJD6SYVWdIBNBBoehwtua1uJMEr9qSvAwPJ3ZOV94SuG7/kpt07nWn
         azd6Ku+Wtu1gStnSnEn+9YqchSdGNppao3xIWodHvbKU3C8mm55rNwz9j8a4OFS70Jkh
         vruGaGGviCh5q9EO6VSckS1072qeSsbXfJHEmNtJ5COPT6f5/V3YUtLEDA/vvlO9OrNd
         QdDN8LqhuIVdYa23d9/GpbV0DyIHvZQP1j56P2FpvlQq+ixu6rGF5PNnMmmor/b8qbyQ
         XvGSlGPq/b2xU1ltHjNVKihtByp4Jk9moE5L4oTvCq0BrX9q5ZuaTn+5Lu3fSrR4AIQn
         eBNg==
X-Forwarded-Encrypted: i=1; AKwUvBxAx7L/9c+8GBFqrC8Q+HbkBnx4FordP1DQppX3keHVD9q95ooeNaAzafz1jzU2vISx6/3A3xKeo/RsZhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JkEXNBuIHN16anjcmErVxX6eMmhVZRuHZ6IN3hCdb0Gr9zL0W
	IjGgiYujWJ8yfA7/2budIu/WFNu5sCDceuIE5qqWJhGpEQ3sVpjv27oqQcro7sq8FACuxTCAjv4
	FM58v64UnQdiZMkG60LjSSIu72qtxgn46jBrlpAdup1otAxcFNDLg046DdWya7EQM1B+uc8BxVv
	ihTbRXEnCxGRMJMXnrY2cthWL4XwMpYLo5D1Hcq1uY4BK7lfzH6EsWxAOK
X-Gm-Gg: AYBFou24xUJ/NKtVwsrYmZWQUhaGmb4Gv+Jg56lMLjNWQyceIIJLaKTVh1lpx8GC3pl
	gYAHo7FGuPSFLErdfKDqoeIalpdl7WvwSq9XoSUDsaD/G8IuS6XrOunotKbKETPlihIaebSZpsk
	8M9TKF6dDdF1fmnIzjDwcuD3qyeJT1L4JDwH927FeCgEc0HFPY0H8RJxtBIGdSIyDOjpEutkvU0
	jLCPgBx/ucbMA==
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4cc31d0c6amr700108666b.0.1793796210235;
        Wed, 04 Nov 2026 04:43:30 -0800 (PST)
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c4cc31d0c6amr700107266b.0.1793796209840; Wed, 04 Nov 2026
 04:43:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com> <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
In-Reply-To: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK9NNW0S9qfwpVQn7uKkEb-AwCUJMy4Mu66BWXEGz1K_BfAONgexdW5Tcwk
Message-ID: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 13:21, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> >
> > K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> > memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
> >
> > Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> > flash.
>
> Hi Troy,
>
> Thanks for the patch!
>
> I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
> the name of a module similar to the com260, only it has a different
> form factor and each module consists of 2 separate K3 nodes. Similar
> to how the com260 module can be used in a small carrier board
> (spacemit,k3-com260-ifx) and in a 10-node server
> (spacemit,k3-com260-tq), I'd expect to see a
> common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> module itself, and then an
> arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> describes the extra peripherals that can be accessed when the module
> is plugged into the server.
>
> Unfortunately Dong didn't yet give me the name of the server using the
> BS01DCMA modules that they showcased in Shenzhen.

Ah, it's called the Cluster Server RV2768
https://spacemit.com/community/development-kit/cluster-server-rv2768

/Emil
