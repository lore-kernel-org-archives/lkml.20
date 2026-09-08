Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E233403E9D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856415; cv=none; b=Ujlypw+eD7+6ziU/etpCkH+/49uoY9qad59vuZWZdkBN566SPPEzDkhpu2KSaU0Oo9g5U29WMR9iHdG7OVqsr+33qkheemR0D4F+F2+2h05FbAHZeTeTeEHWMzmPFOdn8btCFg2PTR31XnqBWtMzW4z2saQYMVu9v0yJAnwRZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856415; c=relaxed/simple;
	bh=l06Ssd2c6PvY3OkmPnFl2qGsKdKhCfeB2puQ5ijD7sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OYlOAMzAXQHdm73k4wHzGg8LsHE/CzJniOepVtDlSbhmZOOT6V4pJy5x48NfGGKJLmE0+PhhGdsRd+tWespgWUVLgLJUcIFariL+0doT7qPzoTvsk1nIrHBGZxVCddOwTp1mTUvuHlhz4ROYmZPWstXLGEk/q8bsNMt2kzPOmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bqQ/Rhj5; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bqQ/Rhj5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kiOkVi5r17HJzqo+ZKCuE14GzZhfmieEcsQeSDY87Tw=;
	b=bqQ/Rhj5fj26Bld/IPvQ6yOxC5/5HVhRfOQdpNeboKvmgMQkoYQYQGzOvqQRl4FzeRvxPFJoV
	Pukw3gi3ZiX73vgr0p+pOl/9i/WywBGADxa3MaW+q+f1lD5+TR1liO7n1m/Jbdbe3xRYlA81TGl
	81NVH+ONEZYfh17LEJRj6Uk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfH4311Ypz1cyV9;
	Tue,  8 Sep 2026 16:22:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C12F4055B;
	Tue,  8 Sep 2026 16:33:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 16:33:19 +0800
Message-ID: <87672067-8822-4f76-8e52-8b8767a28e6f@huawei.com>
Date: Tue, 8 Sep 2026 16:33:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] arm64: smp: Don't bother printing the I-cache
 policy for each CPU
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-9-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-9-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> The I-cache policy isn't particularly interesting but printing it early
> can result in unnecessary serialisation of onlining CPUs.
> 
> Remove the pointless print.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/cpuinfo.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index b423301a13cc..6dbea3a8bb23 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -31,19 +31,6 @@
>   * values depending on configuration at or after reset.
>   */
>  DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
> -
> -static inline const char *icache_policy_str(int l1ip)
> -{
> -	switch (l1ip) {
> -	case CTR_EL0_L1Ip_VIPT:
> -		return "VIPT";
> -	case CTR_EL0_L1Ip_PIPT:
> -		return "PIPT";
> -	default:
> -		return "RESERVED/UNKNOWN";
> -	}
> -}
> -
>  unsigned long __icache_flags;
>  
>  static const char *const hwcap_str[] = {
> @@ -424,7 +411,6 @@ device_initcall(cpuinfo_regs_init);
>  
>  static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
>  {
> -	unsigned int cpu = smp_processor_id();
>  	u32 l1ip = CTR_L1IP(info->reg_ctr);
>  
>  	switch (l1ip) {
> @@ -436,8 +422,6 @@ static void cpuinfo_detect_icache_policy(struct cpuinfo_arm64 *info)
>  		set_bit(ICACHEF_ALIASING, &__icache_flags);
>  		break;
>  	}
> -
> -	pr_info("Detected %s I-cache on CPU%d\n", icache_policy_str(l1ip), cpu);

As we need to defer RCU registration during secondary CPU bringup, so we
should avoid unnecessary early print during secondary CPU bringup, which
will trigger a false-positive lockdep"suspicious RCU usage" splat during
early lock acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
rcu_cpu_starting() earlier") pointed out.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)

