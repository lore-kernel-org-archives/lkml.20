Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962993;
	b=Myh+8K9rD4IMqNU05eTChEpOkSvF3YVCQ4igWwcU6MBYxbX43w5WNT4LrPieB7fkBLQe
	 Q86dM7+3BL6ullCv3ou9RqwV0+q5toVeLdR5bgXzjU5050TTc05HSBP+xcaFE1fbZINOq
	 wIdj5iSKB/b3kfWCLAOnau4zNxlb65aoadOp573W3E6Rh1jyqki8KGs3aCk250aMBcjvm
	 ctHPUauUpOvBLvKVW2fFvqdinS0iVKDij6th54xyEbbM9iONtiRNGDuCsghrl6Wu3/Mh+
	 P2KIiYhNQWBXBC6N/771iNUiNt7V3M/4TtJ2jLrs1uPNYpP1pLGqOpKSAnW8sBAkiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962993;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+AElvHQZoFGP9DlewYqnVP0xXdCddfuFHZpt/5Au+oI=;
	b=cJ5CJl3Vc/2u7AxJaWfTsZr0l9V4GXiSaZwAvwQduo0jRMEqPC1D0SOaPm00kzdC74S9
	 r6myGhGxr8AV7Qofuw0gXOpWZ6DA6BRjOAEf4hbzQh6itn8PpUVB3yyT4xLjAFHHZlRaG
	 9kHRT/N7DRHY0XR/BJz+EW+8n2zIm4w6h+rCPmCLnbrobNRJ5Q4yOwk2u/Q8Mnbkegi+z
	 eYfvhmWEZ5561/7HmDfR/PeL1uUV62sY9Ar306C3z5Q27OE0ZaXVjwMHmJZJXjLMx/0sW
	 7l2cMqZo2TFCA7jJi0kxkTui4kIPOdikKVHwGdFhDd1BlxVNAnRZ7WaqtWhvA3wqhMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcTzmklI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576E606A32C;
	Fri,  6 Nov 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcTzmklI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8140E1F0089F;
	Fri,  6 Nov 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962992;
	bh=+AElvHQZoFGP9DlewYqnVP0xXdCddfuFHZpt/5Au+oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RcTzmklIohIPhAtS55i7sWu8AM7F+O/qnYiKepi2J0WX8e/jteStCrqykHDiFmrLW
	 ETw48LnQ4rv44dWuMvepFvpMME3YRe2lCfSfNvJRJhL3P2JFAXK9Hqu0QdLKkxjEU7
	 mzm+1GHgSzYR8TcbW/lb4gxWfHV8OrX3nLIQT4V+eHJAJLuheREebDSnZBRiBeOH8Q
	 phOAdDk20dLqAAgwUbd6Ej4d3sdkivQinhuZ/HXulqfry/jJF8pyFaAfrpqHWeMwCc
	 3zjOSmtM6TZZhT+tkfcUEgLJHFAjqrgBSqjUH2YRfsNj1jr61cptGqKRTVywh6a3Ur
	 91cXI9Rls0hCw==
Date: Fri, 6 Nov 2026 11:03:08 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
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
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>

On Thu, Nov 05, 2026 at 04:34:13PM -0600, Rob Herring (Arm) wrote:
> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd 
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is 
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch 

We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated and
relies on an FPGA tile setup. Replicating this environment is likely
impossible since the original bitmap files may no longer be available
easily.

> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For 
> 32-bit boards, this cuts the remaining warnings in ~half.
> 
> I verified the config-bus devices still probe after moving 'mcc' node 
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (7):
>       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node

I assume you will take the DT bindings via your tree.

>       ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
>       ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
>       ARM: dts: arm: Use standard node names
>       ARM: dts: arm: Add missing "#dma-cells"
>       ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
>       ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level
> 
>  .../devicetree/bindings/arm/vexpress-sysreg.yaml   |   8 +
>  arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi      |  20 +-
>  arch/arm/boot/dts/arm/arm-realview-eb.dtsi         |   8 +-
>  arch/arm/boot/dts/arm/arm-realview-pb1176.dts      |   8 +-
>  arch/arm/boot/dts/arm/arm-realview-pb11mp.dts      |   6 +-
>  arch/arm/boot/dts/arm/arm-realview-pbx.dtsi        |  10 +-

Linus,

Do you want to take this series via your tree or prefer me to take it ?

>  arch/arm/boot/dts/arm/integrator.dtsi              |   2 +-
>  arch/arm/boot/dts/arm/integratorap-im-pd1.dts      |   2 +-
>  arch/arm/boot/dts/arm/integratorap.dts             |   2 +-
>  arch/arm/boot/dts/arm/integratorcp.dts             |   4 +-
>  arch/arm/boot/dts/arm/mps2-an385.dts               |   2 +-
>  arch/arm/boot/dts/arm/mps2-an399.dts               |   2 +-
>  arch/arm/boot/dts/arm/mps2.dtsi                    |   4 +-

These MPS2 files may get deleted soon, but shouldn't be a problem.

>  arch/arm/boot/dts/arm/versatile-ab.dts             |  11 +-
>  arch/arm/boot/dts/arm/versatile-pb.dts             |   4 +-
>  arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        | 146 +++++-----
>  arch/arm/boot/dts/arm/vexpress-v2m.dtsi            | 322 ++++++++++-----------
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts    |   9 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts     |   9 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts        |   4 +-
>  arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts         |   2 +-
>  21 files changed, 298 insertions(+), 287 deletions(-)

In case, Linus W prefers to it, for the whole series:

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
