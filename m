Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959013;
	b=UmLYoerm9zIolxwO/Rz6jecPTy2EvXDxdiTfYIbDPnpbZC+kMP0FjPetBk8kxV+ayszi
	 bMjZ6EGnJKtNHODiObPq5xR18IxAaapOD4ZsgRJNQrQ7Z2SmgrWO4foNViqhxQBaXT3L/
	 DmG/A/r23cpUW8Wvu6DvDItmWuprTdTBd0smz8A4hQh/46UDJdxoSoxowLyjtENfj1ar8
	 k0S12YaEFbWZ2nIHPQavAhbdkpf87GuIWHGvMFZm0AJ6vINjlf5F64xiyOePr6jjMO5UB
	 gEEy9rD8YXRn62RdWduWIXsme1N8cP/Kbb1sDJrb425DuP5VL814koWPlLwbVAoZEwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959013;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XAkSWWlSKWrfSpGakr9IRtUKXWmzHK5177/xyA2/F6U=;
	b=zN9FtcC8mqZFcMFBbCLAuk3ZMAhO4S2Juy4JV85yBh5BPjhYsT9ldaUowRRmxVqaRXg0
	 uvUsGkgaa6+FZe/SamSagzOMLtq/V36kDsYTkVHu/yY1ezdeaCPYKLnd7I6UgtYFPdtUD
	 +jsxjWdCALG27p8z55ObXjn8JL/lc5/Vcn55U1C5T/5Bqm/r0O830U/PAwgf15n1rsHRE
	 In2yxEzeNqwjLCzDHTqbNLKA6SauiOd9c+5wyoq1jWwx81T2crPUbzQKpZmsKBONCmncB
	 wkD2kIjSeoCREke+MhTnQ1hROTbeXysOwZEeW2HcFtemTW2B15K4JyFLusJX1aiL6gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hhrXfhLc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB62606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB62606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hhrXfhLc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20CB1476;
	Fri,  6 Nov 2026 01:56:49 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28BC3F628;
	Fri,  6 Nov 2026 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793959012; bh=0WBXFs1MiLuO2PVoH0yOAYbRTTQ8cqOTi1RLFPjBnsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hhrXfhLcOF3M5cj3yeVnRsYrdvVg7xXEXL9iwfog98xq4ECNodhUH6MEsipsTN59D
	 OjZzf8YM0s7KlZi/zE581GGp6U0IiJTOvaZrlrz1kcY4OrLFwT2PDs2DIfCyX23INa
	 iyrfHDkmuTYW6J7UD5Pkio1isF8xpnQMJD2c2BlU=
Message-ID: <17294983-0e81-4f73-928d-34e676807b29@arm.com>
Date: Fri, 6 Nov 2026 09:56:50 +0000
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
Subject: Re: [PATCH 2/3] irqchip/gic-v3-its: Zero ITTs reused from the ITT
 pool
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-3-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 09:26, Fuad Tabba wrote:
> Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
> non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
> genpool. The pages added to the pool are zeroed, but an ITT freed back
> to it goes to the next device as the previous one left it. MAPD is then
> UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
> zeros" (IHI 0069H.b, 5.3.10).
> 
> Zero the ITT when it comes from the pool.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 5613c52adf88e..5c3ab9d30f6af 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -267,8 +267,10 @@ static void *itt_alloc_pool(int node, int size)
>   
>   	do {
>   		addr = gen_pool_alloc(itt_pool, size);
> -		if (addr)
> +		if (addr) {
> +			memset((void *)addr, 0, size);
>   			break;
> +		}

It is safer to do this at allocation than freeing something back to the 
gen_pool.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

>   
>   		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
>   		if (!page)

