Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958590;
	b=P1kyAqwQnG7s17QMx83PP0N7azp/c9GdjR+gqsmntYjd9XuxoB0vjguxQnhw04HX4l7Q
	 5FSR8gmtDNcwFS3q+ltFpKTVmP8DwNgByClmTkATwa7wIr1uzFQt8Sa2foUrKuB31rXwY
	 Ael0aOiq2TV+U+kp6bSyYf3x/nPZF3tHu89hnqbiBNGcLunonHr1708A0mc37gVFouSsX
	 s084N1IvWLTjK7axDYnZHs6Cq7g7OA52UXEjpYw7zdkDQowfggiklibm8vgKstR6pqZZY
	 vzSDyjP4PitxPwC8+0DtO1HDvvzUK/jATf5kTUcFJ8Nx69Rz2zX/aqMXZwWtVMF9ztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958590;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZiIKqYRHXYUrq5jY4SAhBx+dxEMk/9hW4rEcLk5Peqs=;
	b=QGQ1tkgXPI2nAotoCsFa5CV6XetmvOTI3s5wLYy/H/BXfzhsFhqycOnEmSRl6Vis0pp7
	 un8d0DfVp0peGpQRDUKw5j6SJlcAmZSp30TKMB0Zo3GZ0IRme8fmVgQNS8Vh2Dv8z8cVp
	 5CVSbJqzZIL9g5la0zQ5gOfm4IYYyGxE5y8ZfyyysVIf/uxY0u0BeCbrKjpZLi1I2xxr6
	 mct4gRA0Yyc5vIzyqPuaW8mIu0d62Q4rNccN5VUtSSta6uD/Hc/27LN82nPb4XvKoHEHI
	 ofcmkqFF9F/LFdoEwkoSVEFJGwxHN1PNp6M3uXBpGZfS4gbcWqsl0kb1cse9F3QzQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sjTGYC6q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F7E606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F7E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sjTGYC6q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AEAA1682;
	Fri,  6 Nov 2026 01:49:46 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9E23F628;
	Fri,  6 Nov 2026 01:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793958589; bh=LQ0TS4wrpbh7eTZLNIBqGnXpSRsa0/ujpXDDC9XeSSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sjTGYC6q6C4GKCQI3+YrAvT5ASM/aJRD9nUT9eOvYm/rPv4C+9p9QtONiqNBnYqx3
	 qbi50ikTMnDem31yG+ZUwH5Hu3mKGoetr+1io8wKqWzAHu1+j4WiklGCpvu4W/IBWq
	 fM1ctohDAb61wRN3gdtFT6cV2myIz0RDVgD3pOEc=
Message-ID: <5ca3f30c-5fea-4602-919a-6182aba20310@arm.com>
Date: Fri, 6 Nov 2026 09:49:46 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-2-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 09:26, Fuad Tabba wrote:
> Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> dropped the ALIGN() of the ITT address in MAPD, on the premise that the
> ITT pool returns 256-byte aligned blocks. However, the pool's minimum
> allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
> granule is a single byte. An ITT whose size is not a multiple of 256
> leaves the next one misaligned, MAPD drops the low bits of its address,
> and that device's ITEs land on the previous device's ITT. QEMU's
> emulated ITS has 12-byte ITEs, so two devices with 32 vectors each are
> enough to hit it.
> 
> Create the pool with a granule of ITS_ITT_ALIGN.
> 
> Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 282e4bafb084f..5613c52adf88e 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5849,7 +5849,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
>   	bool has_v4_1 = false;
>   	int err;
>   
> -	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
> +	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);


gen_pool_create expects the first argument as:

min_alloc_order: log base 2 of number of bytes each bitmap bit represents

So, passing get_order() is definitely wrong and ilog2 is the correct
choice here.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

>   	if (!itt_pool)
>   		return -ENOMEM;
>   

