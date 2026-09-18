Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2161451049;
	Fri, 18 Sep 2026 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775563; cv=none; b=a2QOGx3/jSA7+8/f99ZVXzC5yH0MdnDwmSoAC3gRnZzYM916mMRjg4TH785a4tz3UU/UgTwPLivSOhEMJEhjlPg/v6mRyQQw2rm+lJXFOCyzqUtlCWMwUE9LFOOReupRrIYD35WtZrh8iaMuwgv4A20KHUUKCKeP4neF1utzQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775563; c=relaxed/simple;
	bh=t6VhpbkjklSluF/CXXchx1PeJLuzzhatPRqUEIoi+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEJSL1GyzwMCLFCuu+k3UdyTYWhX09xntcer4cKbDqhVJ0b6VaYBG43I3eegAnFtLnY/yYeq4X+aIUL9/HoZM1w+MNv9je4uY4UZGlDpaK7eeWUn4vmHz/Qy4ZCO7p2fS5yTi2ycF2B0Oa3l1RdRcQGAHoP8eJSVR2gR8OIHsT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec5aex/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec5aex/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDF81F0089E;
	Fri, 18 Sep 2026 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789775561;
	bh=p5jg7mO714tQeOGzdfz+HH8eCZQZ4oyz3UFgjTI5s8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ec5aex/8BjNcHpwxRDRttia3QcbJNGP0M33Q7WIzdxztvzrd3IpsIPGmqy5omgXdy
	 VSXVCPetOu312DL7vuYYtTBCDYvi4L06pE0eGZ73CuH9RW+1FF1TBcktlp4eLuxsSO
	 Yo+31zQCFPW1cno0hRsw5BZ6GrbGxDPnERvLatuXKgMZ8OH9VztvvVr5a8iHHfrjbS
	 ucm2Nm2J10FvVj3qCRY0lWauXEt2Vnut90krqihqGXKwfAstkntQQ+iTtsrM0r/6X3
	 yTYN0jmLY2rxzkpcTSARshUS1MXKmSfneCg2UaTsT29p+KRK5TO3Zj2lmSS7VRX7QX
	 1w74NmOcPHpng==
Date: Fri, 18 Sep 2026 23:52:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
Message-ID: <20260918235239-GKE297024@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>

Hi Junhui,

On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
>   
>   Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>   
>   [    0.091014] smp: Bringing up secondary CPUs ...
>   [   10.104917] CPU1 failed to report alive state
>   [   20.118689] CPU2 failed to report alive state
>   [   30.132288] CPU3 failed to report alive state
>   [   40.145953] CPU4 failed to report alive state
>   [   50.159604] CPU5 failed to report alive state
>   [   60.173212] CPU6 failed to report alive state
>   [   70.186981] CPU7 failed to report alive state
>   [   70.191411] smp: Brought up 1 node, 1 CPU
> 
> Through exploring and testing, I discovered that the K3 actually
> provides all three complete ACLINT components, and subsequent
> confirmation with the vendor yielded the following information:
> 
> The ACLINT register space is mapped at two base addresses: a secure
> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> secure window exposes all three components, while the non-secure
> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> there:
> 
> +---------+--------+-----------------------+-----------------------+
> | Offset  | Module | Secure Window         | Non-Secure Window     |
> +---------+--------+-----------------------+-----------------------+
> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff | 0xe0810000-0xe0813fff |
> |         |        |                       | (Reserved)            |
> +---------+--------+-----------------------+-----------------------+
> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff | 0xe0814000-0xe081bfff |
> |         |        |                       | (Reserved)            |
> +---------+--------+-----------------------+-----------------------+
> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff | 0xe081c000-0xe081ffff |
> +---------+--------+-----------------------+-----------------------+
> 
> MSWI and MTIMER reside in the secure ACLINT space, which is only
> accessible through the secure window; their offsets in the non-secure
> window are reserved. SSWI resides in the non-secure ACLINT space,
> which is aliased in both windows. However, depending on the eFuse
> configuration, the whole non-secure window can be inaccessible, while
> the secure window remains available.
> 
> Taking these constraints into account, we use the secure window
> (0xf1810000-0xf181ffff) consistently for all three ACLINT components,
> as it is accessible regardless of the eFuse configuration. OpenSBI
> protects the MSWI and MTIMER ranges from Supervisor-mode access via PMP,
> leaving the SSWI range available to S-mode.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v3:
> - Correct the accessibility description of secure and non-secure windows
> - Drop spacemit,k3-clint from sifive,clint.yaml entirely
> - Move SSWI to its secure-window alias
> - Link to v2: https://patch.msgid.link/20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech
> 
> Changes in v2:
> - Drop the generic riscv,aclint-* fallback compatibles and use only
>   SpacemiT K3-specific compatibles.
> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>   replaces the incorrect CLINT node.
> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
> 
> ---
> Junhui Liu (6):
>       dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>       dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>       dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>       dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
>       irqchip/aclint-sswi: Add support for SpacemiT K3
>       riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
> 
>  .../thead,c900-aclint-mswi.yaml                    |  1 +
>  .../thead,c900-aclint-sswi.yaml                    |  5 ++-
>  .../devicetree/bindings/timer/sifive,clint.yaml    |  1 -
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               | 43 +++++++++++++++-------
>  drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>  6 files changed, 36 insertions(+), 16 deletions(-)
> ---

For the series, with my

Reviewed-by: Yixun Lan <dlan@kernel.org>


-- 
Yixun Lan (dlan)
