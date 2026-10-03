Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5A489869
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045163; cv=none; b=u2dbJY4phVYG7cmruq5gWykFLrA7MHht6H1A8AySt2egJZjj1riOkzSSSkIyx/j5Q1L4zvYqSq6TR6+9x0zsZXjlSWtGPbKYERVKwpYhZrxE4imuLvuYf8Ma+xQzhPAPHT6RqveLqe08tlVz7ReLBUUBCCoz665q5+u5zKart9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045163; c=relaxed/simple;
	bh=kdwilH5OsLsurNREttMGC0xdBg68ib9NiILFCHZIk6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1YKMo8LLJWsf71Lh1W879TVihaELwXyfRgnRwM8C7BqSGm/7ttn4LeE2EyUUQ8cTPtGqjNkpNXINQ3qi1JOiNda6v+IURKnUPTaC/KvJan5WRh3IYiWvTUqMUe5wORCHOs59DIL4iaHiuwZeBK/ot3/473xWs863H6yY1mPy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RNUwRyJG; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RNUwRyJG"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5d82736af9fso257169e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791045159; x=1791649959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6IGX+v8BkO6n9pIMVGytNElaq/yPQhIUaLvSvPAc94=;
        b=RNUwRyJGV0tnICwtekEipgs8U+AMzIeUQz6InuP7yUTWLrLcJPkUqg/szV0MSndPiY
         v+TOY4V35+fOeYMS0ghxzuNpQbDEGc9XlSJQs+prW1y9YVDrWLZSqlrYJHGX7Li5BBZ7
         hLhtIJdsAlEuSjHu8fqx96E3ByLOYJnx7zCrUApnYydAeXH8UqYfeq8P9UVp/NJKuQw/
         ZhJ2ISuo/zbWJqWN+0d2v1QkQGDrT2zdDzMwz9A4i3gl32VLOWmSRIFn94UMGgyesfTQ
         CgrFa3zlDlEbpJVAUOpRhWXzY+AFwPCxbWpJ/grAuSbnfToBNoRW3922a1P90/x9tuhK
         zceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045159; x=1791649959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6IGX+v8BkO6n9pIMVGytNElaq/yPQhIUaLvSvPAc94=;
        b=f1a+cvf7zEcoCOArBXRwCiLuCnLC5tFHqmhDA2P75vISszuA1ZhcR8HxagmUyP6Qvs
         j0CJTjKSnS2Ep2/OvIp84gK9j2H2ihbbndK4Ue5QR/Z489zaf0wCqbvz2+jwjuQCVPh8
         HHisGhdH+lDDXK4w8eKN7ZCyMf0VaDTogjVNKutTXypgfj2CWVw9J8wmsXpnMzBOrVXE
         0S9uGPQMBusGKgkRs8E5y4U6khdwnfUm/uC/r84PIA3p3gPNy3dKLRCqM22BiSvSxjXR
         RvDpIToc5nZ4QndOj+hOapVViTtBDr8joylDSIm0jbA4zhG1OIE4ySMwEgJ/7PJEKLQW
         U2Cw==
X-Forwarded-Encrypted: i=1; AKwUvByNVNGVkz7DthHf2Ovdyo3vYOcGDjeq4gZAGgcxYqPNd4rgdij5IQll+r5QIwD/+bugQbL2opv8gltoACs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1DtQLoO/CkoaGtIbN7WK8W8K0JL7zZ+iGbD8LxW7Vrp5YHvdD
	1KikDARxBcSW6NTt+Cw5Lv0RBwdOCJS9B4Y+9CIb40rWtjCubAsfGf0Ymd6DKChkrVo=
X-Gm-Gg: AYBFou3Xcw6tBUyL5O/oi758tX7A15Di2Jrovh4Geyq9Yx2ySkIBobup6R07X/M2sUG
	FIyqG8/8UEyWtf+tdQ76udvqAaRZ5bzr2BDLVwVrVT/UR/OIp8WL9yhLXVK/nSJ1zFAlN4rIER6
	u82KJhYitttkZKTdxE28PPE/eqfctOaX0+60CeDe7nF6j8uJLsfp1FhFzqEvGPp8aNRHTJj2m7i
	MBw3ft3BTXXScYo0ZWVcBri5hiPrMykQ1DtG1oEEFDZRVdKCJHsP7FcO6tQqHELG9fR7R4m3niE
	9jOcUVMDI12jIvCrYCvmelmfTEM6AkqsWLIR23WNLuL4LamWkryS28NOaB8az74jmOQhwWkeAqh
	UjiuA147r3UeoQWqp2pXhfqjIR6l6g6MBqgxmXMy2e4+ObVcrw/1/Y7nYlNIZcppS9mvV37m0PW
	uHHwBCSBU85GT980XPyhXyngrofAelDVoLMvTrGFgH4x0AFIksphQrzk5YJ+nKGNyUE+pDIQ0Kw
	gzCJS8b/cxT0UNhISCBVAS8q6hfr4Xxg5WceJwHpkbnbQHIKqg=
X-Received: by 2002:a05:6122:35cd:b0:5d8:20d9:78f2 with SMTP id 71dfb90a1353d-5d820d97a5amr2139563e0c.14.1791045158975;
        Sat, 03 Oct 2026 09:32:38 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm7442753e0c.15.2026.10.03.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:32:37 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:32:27 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet
 support
Message-ID: <asEsCbfKIkXPAyCh@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>

On Sat, Oct 03, 2026 at 04:46:24PM +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v2:
>  - Enable Ethernet through an overlay instead of in the board
>    devicetree, since without the IO board the pins may be used as GPIO
>    (Inochi)
>  - Send both patches in one thread (Inochi)
>  - Test link-up and traffic on the IO board, which v1 could not
>  - Collect Inochi's Reviewed-by on the PHY node name fix
> 
> The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
> two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
> so covers that board as well.
> 
> Testing, with a kernel built from this branch:
> 
>  - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
>    address via DHCP and passes traffic
>  - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
>    reads back as disabled
>    
> Kernel log with sg2002-milkv-duo256m-eth.dtb:
> 
>   [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
>   [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
>   [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
>   [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> 
>   # ip addr show eth0
>   2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
>       inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0
> 
> With the base sg2002-milkv-duo256m.dtb:
> 
>   # ip addr show eth0
>   ip: can't find device 'eth0'
>   # cat /proc/device-tree/soc/ethernet@4070000/status
>   disabled
> 
> iperf3 against a desktop on the same switch gives 94 Mbit/s with the
> board sending and 70-74 Mbit/s with it receiving, with no
> retransmissions either way. The receive side being slower is not a CPU
> limit on the board; I have not looked into it further yet.
> 
> v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>     https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/
> 
> [1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/

for the series,

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> 
> Chen-Yu Yeh (2):
>   riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
>   riscv: dts: sophgo: cv180x: Fix internal ephy node name
> 
>  arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
>  .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> 
> -- 
> 2.43.0
> 

Best regards,
-- 
Hiago
