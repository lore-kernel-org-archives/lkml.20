Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836631;
	b=T6pZICWG+MYnlMT1230UZrWMKgKGc/ygFnPPYZ2WX0Ai5nG37CyCqbIKeUZVcWOBoQ9J
	 RTDRuD3k12l7IRbiqje18PpiQaLIz+PM2N/PLR031xLMR/KyIpUtznBVpw4x5roVUYJ8Q
	 YqWrNGytXmsxAMbCshfRdxUgEOgsk/3eDIJdFKrXPinBUtJ9xWb7h3pQP22o+7VaTZ3gB
	 5b3uR8C677oMpdP8TBlA5UUz4hnKqrpppsKFMmecajrVi7JPqMgJrdxQOocE8Ofbu6n+i
	 fy31fbbVW2FdFFdXCvXCLTPHgAmaGhlB9TBncOBwEnkdNnlzDDFkDxs/uw+8OZ7+arQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836631;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OgpKVi56iYyrqQb1XrLNVi7ftcITPhmk6C7+krOK81I=;
	b=jFuGva6JDy65TLXRveLMl53da45xRuVJMyBEIxr4RYATe2wxIfZRpp3/sBKhk2vVpT6p
	 CBDA6GwHC8Rs783Blqs0wF0zI/81IZZYWVKb3q4AInKzx2vVYFQf5r/S9JlLRv/ven/8N
	 GFCyc3Pn7r8eP/ll0GhcaJMWcDkZroLXUsgVQvYh04Z9whgaHO5ZFtIk59xTByZDx6dPI
	 AZkxN6cyujkzXSP/5Ci3NvN/ybhdlG3ZA5LP5hUYc4jkUgeXv9H8C3J+8/VTHQARVESJT
	 EjA7DNRQ5KJhGaijyVelNwwJlT0AGghM8DV0e9oAgXnHPIEbWAhmi/ffzTmsD96AFdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NzhE4WrA;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B234606A323;
	Mon, 16 Nov 2026 13:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B234606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NzhE4WrA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OgpKVi56iYyrqQb1XrLNVi7ftcITPhmk6C7+krOK81I=; b=NzhE4WrAx6sZNQUV4/SVRdwpX1
	6Xt5b3BQMx6CM6lrifP4tOmcFTEPbB2/61J9kecr/gJvgzWS+IGsuRTW1yM+/spsRSki3b5pvmzxW
	p69T2L2cWesX2gauOjZ1EA7x0kP/6vGP0qVHV94jhbUh3KqJz8Y8vvwfZ2YI8MYLEGgc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwzV-00GvKE-JM; Mon, 16 Nov 2026 14:43:25 +0100
Date: Mon, 16 Nov 2026 14:43:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Add RK3572 support
Message-ID: <d9114295-47ac-4fa7-ab4a-db631a46b363@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
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
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>

On Mon, Nov 16, 2026 at 03:39:13PM +0800, Cunhao Lu via B4 Relay wrote:
> This is one of the subsystem submissions for RK3572 support.
> 
> This series adds the RK3572 GMAC bindings and support for both Ethernet
> controllers in the Rockchip stmmac glue driver. It provides RGMII and
> RMII mode and clock control, together with RGMII delay configuration.


> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.
> 
> Passed functionality:
> 
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
> 
> Stability:
> 
> - Repeated cold and software reboots complete on SD and eMMC without data
>   integrity failures.
> - A combined CPU, memory, network, SD, and USB3 stress test completes
>   without a crash, lockup, CPU offline event, or thermal shutdown.
> - Ethernet error and drop counters do not increase during bidirectional
>   network tests.
> 
> Build and checks:
> 
> - The kernel, modules, and board DTB build successfully.
> - The series passes checkpatch with --strict.
> 
> Untested hardware and paths:
> 
> - NPU
> - PCIe
> - GPU, video output, and audio
> - Other low-speed external interfaces

Most of this is irrelevant for netdev. Please write your merge commit
message for the subsystem doing to merge.

Andrew
