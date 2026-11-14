Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620658;
	b=oH3E+nfqL/eSPtOukFh6LjwTry3B+GzMnHUC9/2H/pWqyPm6/ym+XL5HAqnvu8FpA5R8
	 eptGL1dGC1T5llMeybMVtoT0dwl7libM3Wc4aAj2cyxmCEHBaF5M4f8AAMFGFO5r6qWpT
	 +HZl2JoHX4VH4XcJ7PRImG+ZiGT/d4FVHqvS5zzIxNU7e7PhdFhXZLcmNkqky+wyIJ9zd
	 q9q5sVi/eMuxsPLsq1T3GgAhYgacKrybAPnVKDOLxLrIv/zn9vUUN4FPd5eyszL2I+uIs
	 BhFs1XrJ7ExhV0eWxfyKbQKltog+HOqN9zYTSvMSpN1UmkCjGI3z/iuasJXW1bp+Ckw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620658;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ze++7aKWR2T/skYTjKdocWOwvTMkchcenQAZ9t6jBy8=;
	b=N/5If2OzsINsaFOTorY1tUYUDfw+BNt5KMzw5YYnHfVnlHidC7ipZX8u9b+C/LowNXNw
	 t6zz4rsBVEA1hcrgeHms5PMUDkcbJkmzP82aE3L6STtldlDY7xZnqifcXDdBk9pQgSGs3
	 p5LA2XKjmSqRUuXo1X+SLw108A/Nb3KpjjmbgpHHdFtS03CJIWWUM3Fb637t3kbmyqmCF
	 m1CFlyWcUmauD9ZGvhxM43ZZrfdBQUaNhosIT0Y923hZC3G9y8hwpiTwuC5i6ArHEJv2M
	 nLFra4tKI5Xs4iMuA2pAyqI/lj6JFVIHN1YeKXBcjViMLbcUGY9KdXNaf+WFVf5UkqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY6FsRmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA0606A33A;
	Sat, 14 Nov 2026 01:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY6FsRmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F6C1F000C5;
	Sat, 14 Nov 2026 01:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794620657;
	bh=ze++7aKWR2T/skYTjKdocWOwvTMkchcenQAZ9t6jBy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kY6FsRmRUmQrIK7GUlrIO51EsyjeDIn0PGOrBoHwzK+J5wgN0I5tTqJwZRTjE8J4/
	 VxS/F99U8CuYVNlkUY2+Ly8M8L80ZJCWEFfig+EEsRtd6HWutqJs2WgMO8VtQfSMtG
	 Px+/kxLRur9rBAdwyyG3Ff6Epqq5rwIL6SE8LOGjA8bN3wSsVGqhiJQO1qpHNvifc4
	 us8C2Vv8+TI9uddSSBjSwD7xtHp4UniwK0HAG5vwSlEfsCC+EHHx2JIgJANtG0Ii8X
	 uqGBLQeDddJspxuoO6v7OcIAc3jmchGTHaZ3zgRO0Ru7oQzgza9fswH8JvksVTWWET
	 rxUdYCLY9hW8A==
Date: Sat, 14 Nov 2026 01:44:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: Vlad Banea <montrealtango@gmail.com>
Cc: troy.mitchell@linux.spacemit.com, wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com, jyc0019@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own
 DMA window
Message-ID: <20261114014414-GKA99639@kernel.org>
References: <20261113023158.2872492-1-montrealtango@gmail.com>
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
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>

Hi Vlad Banea,

On 21:31 Thu 12 Nov     , Vlad Banea wrote:
> On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
> 0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
> upstream an inbound access that falls inside its own memory window, so
> dma-ranges must skip each port's own outbound window; the other ports'
> windows reach memory.
> 
> The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
> which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
> every port. Give each port its own bus that skips only its own window.
> On boards with more than 2 GB of RAM, each port can then reach another
> 512-640 MB without SWIOTLB bouncing.
> 
> Signed-off-by: Vlad Banea <montrealtango@gmail.com>
> ---
> 
> Notes:
>     Changes in v2:
>     - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
>     - "more than 2 GB" instead of 4 GB (Troy)
>     - drop the RFC tag
>     - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
>     
>     Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
>     use under load went from up to 87 slots to none.
> 
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
