Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8D416878;
	Mon,  7 Sep 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767066; cv=none; b=BrEdYVR3VB1zkB24GwbWSMAa8SQDBn2JenmchXIxHS+xodh53HPGBsN9/dI87/MiZwj6BrfXWVm3k6vwWXtiXFMXhTgRqjz4uyuEGSyg0bv9hxvuxB1BCpEkYO+pD7aC8wMjMmV0GAZVEq6Rz3oRLJ82FRV1Mbj0fKUV92pqF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767066; c=relaxed/simple;
	bh=Ek3ocIy7wpS/IDiiwHj1J4m0liDxgBs9O9i0RBBDWWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdnmB3i09nkv2RzDFfYiKe5TE5myv039Nb4HxWZnLcu/cssMYQRnfPsotST8RtU5RBmn70W/stkmoxFGhr/9RNw14zecu8e/O2MRwnwhnZ/2ff2WrWL3xHO3oQmTqsHwaA2VFKGgRK4TvF44PiWBwxNx9eP/epLqB3/cVuTYFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcLnmAz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcLnmAz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962F71F00A3A;
	Mon,  7 Sep 2026 07:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767064;
	bh=6iv+CaoP1NDRXPBD5zrkJNqyxtCMxrNtTEasdO12PNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NcLnmAz0hi7VC85mVR4FNbQyG73njKOVusDoroz9b6n4K+7kCSwM6cxPSrtzHQzE/
	 KIA51TUQO6cSfMqJMQoQORZgiCiSAJXyEUinrbQbLrB1MOI7Lkoebzn5QBkWoj8HOx
	 5oKyy6O92mpR0Wy/2liCTApG/WCC/zPVSY7GNGmhTp4YWxyIlHlXsEQ43uziZ1XZ6x
	 LqA8HsXVGXAzDHoTqJ8NzCNg0pbY+aOBoUz44f6fYiRFJjoEGdjWapREEXwQiGjVI9
	 MAxxSFOfoYEaWQLgXswGvJrNv0zQmjxnQvD5h96IHWnl++RsfLJEyQCbOfk+T9USHR
	 xUXpekM2dQK6g==
Date: Mon, 7 Sep 2026 07:44:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from
 M-level IMSIC
Message-ID: <20260907074421-GKD2330@kernel.org>
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>

Hi Junhui,

On 00:40 Wed 29 Jul     , Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits = <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) = 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
> 
>   fdt_driver_init_by_offset: interrupt-controller@f1000000 (riscv,imsics) init failed: -3
>   init_coldboot: irqchip init failed (error -3)
> 
> Moreover, guest interrupt files exist to act as the supervisor-level
> interrupt files of virtual harts; there is no machine-level counterpart.
> riscv,num-guest-ids is equally meaningless for the machine-level IMSIC.
> 
> Drop both "riscv,guest-index-bits" and "riscv,num-guest-ids" properties
> from the mimsic node so the node matches the actual hardware layout.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
