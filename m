Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571668;
	b=Nb5ocivPSvsbZuEEJ4OLqk5DxpmfZqcycWSdTIJgduzTb2h6/eqbW4KwMegI3GSsxaUL
	 QS1uEHGQXnNEm2LDsKOv0kuuno+EDw5Z5YMt9VvtT/a/aJ358m7o+c97jO9hlnm71i0MM
	 hSt9QlNpRA5vy/rldvr//t4jtPueNyhANgVDUahTbXWdby+7fS5Yv/l1cQPwd+0dE6jDv
	 Q2dc+OmCFTtjsdXbwrawo7LZXaM7Z008HDBtJXHjHVGMIycRUsJDCXPvLWOYaKH8R+wLu
	 XxkdMqDbJeGKJVQvHG2WcsCCPCF9Wdv2/8LwBHcg2YodkCL7NgtLycKrmCutqRzfSRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571668;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uu82sUWMY3UO2S+B1frGUyiwgloHLDcTt9LHkabvWD4=;
	b=RVqEOL7/44kmDYX5leOkTrjjmqa0zXI6NfRPk51hQVXglkikkoWtnru8hl6g03bHUQQf
	 FQ7SHLAcPGkJF0EBx3/F8UA0gYPjTv9om48hI33NOfm5dUAvoZM+Xng3SaCApKOEd/i67
	 Cv2Q28Z10XDHlyQ/Y4Rl42/KSDagGW1/eJDdv8OdQ/i1rDBsm34YOcyYNumw6/qTRTIRQ
	 CSnMpn6ws0nM9D3t/x58eQKJykRceId1J5qifOas1b/xInr2Q5wsJQ8O6FLGH76vo8aPj
	 a49KXh97Nr53j5Cg95tpqDaVzJaqdq/QfYOT0cjO+gp+O+Nim5NnbEEhVIgnZPz7x0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlwMq3tf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF054606A31A;
	Wed, 21 Oct 2026 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlwMq3tf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D641F000C9;
	Wed, 21 Oct 2026 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792571667;
	bh=uu82sUWMY3UO2S+B1frGUyiwgloHLDcTt9LHkabvWD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UlwMq3tfgNeCGm0knE2NHd1H1nC/VHez6eYOyAov1+G7J3SJedstaNa8dWk1vi05/
	 DEVumOnzn4CUZr3JDoP/IWTw9vXaAAG0YxBV9evnOJcloOXZQX3y8wdqQ6NnBY4Hy1
	 +3o8Oiu4AP6++UxF5QL1CtdWk2MlGFk39buC+KJ8ib9Bni/PhRSLFOFU65rDvK2jS9
	 XSkuSn7WicBJyPromfIVJylErxjSc3M454U11yP28jjRjPHT/cUrZN2NPeYxmwXf1l
	 49bBPnPOmSCPUmS1PS8nXiqbGgsVkCuP3nEvOuWRoZYeLEaqJ8//5g/dyDLXVomaud
	 Pq27au8iHAKrg==
Date: Wed, 21 Oct 2026 08:34:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Message-ID: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
 <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
 <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>

Hi Hung-Chun,

On 22:17 Mon 19 Oct     , Hung-Chun Tseng wrote:
> Hi E,
> 
> E Shattow wrote:
> > Does BootROM configure the EEPROM peripheral for access? If not, I
> > think the justification is weak here to include this.
> 
> As far as I know it does not. The EEPROM is only read to tell the
> boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
> the PMIC, whose rails are set before DRAM can be brought up, and the
> SPI NOR flash, which the BootROM can boot from.
> 
I've confirmed with vendor, the EEPROM isn't configured or accessed in
BootROM phase

> Yixun, is there a public description of the BootROM boot flows, or of
> which peripherals it sets up in each? That would give a clear basis
> for which nodes to tag.
> 
The ever closest docs is 
https://spacemit.com/community/document/info?lang=zh&nodepath=software/SDK/buildroot/k3_buildroot/device/boot.md

but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
initialization in SPL stage, and should have nothing to do with BootROM?
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bootph.yaml#L70

-- 
Yixun Lan (dlan)
