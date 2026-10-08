Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705D3C10A0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446155; cv=none; b=T2GXTR/Yk42gVHS1uenKzPNObI9vmmzZ+lwUsVp3SVXTNBrZr21IUz5cuRmqAkPmPGXKvYbbAAWpGDPNWJ6Rwq7Vl36JQUdHP8uQbYBfEqN5R3uh2FldkMD3G2HIIiLBPt4JGIkJ2UCXcBplmFfkKHgyFnr/gbflSWnoPuZFBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446155; c=relaxed/simple;
	bh=VhUIOWcTsP6emZW5WDH02Sng+YRMBHdm/M1O2WGQAos=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ttzdgQgUNcft8CisABEDjVOY0dbQacLGlOmxVo9R/w7jC6Yob5YaQ/XhOmBd45FbhSAI32epj0hYRXzRlD9KE9Ym4UiBoY9+NN4iwtBuF6SzrdIW75IqFIvZvRg8NSfXOikGCMl+uTCALAGyMq2IhN/sfSwNjy7hYFkkJlhc2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HTI2c04x; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HTI2c04x"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GPJBGY61Mm0F59zwvDOhWaqucyLE0EcmWlV1wN0R5g4=;
	b=HTI2c04xSQNkehN/7k3oL/b/H5NHGvyNiRp3EnjSFvHuf/u7VJibTMYXu9g9XuAl5L4UEMUJe
	CQIoH7vgTxMtu3k/S4GlN2ZQDgLorIcE3GRWgGRKrNRQpHLleadQbV/t4HA0cqZv7Jk4MfozRfy
	viYlIt31jyeJhBxRPnmczfU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j0hnG50l7zKm9J;
	Thu,  8 Oct 2026 15:43:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A256D40586;
	Thu,  8 Oct 2026 15:55:48 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:55:47 +0800
Message-ID: <7d3fd515-50fe-4f11-a44b-68192c84f1df@huawei.com>
Date: Thu, 8 Oct 2026 15:55:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-8-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-8-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the bpf selftests with the new register allocation.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  tools/testing/selftests/bpf/progs/verifier_jit_inline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> index 02e562f56f9d..a3d6c095acc3 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> @@ -9,7 +9,7 @@ __success __retval(0)
>  __arch_x86_64
>  __jited("	addq	%gs:{{.*}}, %rax")
>  __arch_arm64
> -__jited("	mrs	x8, SP_EL0")
> +__jited("	mrs	x8, TPIDRRO_EL0")

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  __arch_riscv64
>  __jited("	mv	a5, tp")
>  __arch_loongarch

-- 
Best regards,
Jinjie

