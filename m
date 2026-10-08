Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF32E3E171B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446213; cv=none; b=NeMjYOkGQldu56I5rFrp57bPrLvwvpg5NIvsQX2A7/jINzj2rGt+c3ehO6gXeqNfufCUbQAhQSV0Ir5LPyLr1QrudEdIqmYBAtfOlRoPf84ZvWV7xexqLxrePhWfXlUZCLpe6rAegJyCQ69z9NxbPfEQx2DWLMbqzNSeRHTkvew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446213; c=relaxed/simple;
	bh=U7QVkXNnYfuM/LMEHQr8++9K9K8ZO32+bUzB2T+0yCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IVkXf1FF0sk1edx6JAerzeZR/iLK+XAZQ1hPnqkUUHOknqBkxV/BwmYaGtImkQVnj/UFqPJCcihc5QH4h4GzCxU1af4MyJJVzmkuHFKzoVHiZWfAfQvW2/uwuJubgLHffgTvRGPYtYsiEj//Ti+PR5uWAqwdlLU00Pe74iP3Qec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=qv9HfR3Q; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="qv9HfR3Q"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=C4HbqLovK92A6TAwb6P9llvvE6m7BStHvYxN8zYGpyw=;
	b=qv9HfR3QrszT10UTjPpYwRDXkRXy6+IUUZu1DdDU9d47C5a8siP68NwU2ZltaChZlMwVNvN4e
	KC3GtRwt4NOQRzhUPjsF06rPBjU36zSnCgsvQM7gHQgXCAixv6WM0DRyqxnUAU4u/0wXNhRv5Ae
	nY6lpLYIMKWJQM38y9fVd10=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j0hpS1F12z1K9D2;
	Thu,  8 Oct 2026 15:44:32 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E0B524048B;
	Thu,  8 Oct 2026 15:56:46 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:56:46 +0800
Message-ID: <da4bae65-7dbf-4f47-877a-be1b6bd5f533@huawei.com>
Date: Thu, 8 Oct 2026 15:56:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of
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
 <20260918161407.2300-9-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-9-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the gdb 'cpus.py' helper script with the new register allocation.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  scripts/gdb/linux/cpus.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 6edf4ef61636..547a623280ae 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -185,7 +185,7 @@ def get_current_task(cpu):
>              var_ptr = gdb.parse_and_eval("&current_task")
>              return per_cpu(var_ptr, cpu).dereference()
>      elif utils.is_target_arch("aarch64"):
> -        current_task_addr = gdb.parse_and_eval("(unsigned long)$SP_EL0")
> +        current_task_addr = gdb.parse_and_eval("(unsigned long)$TPIDRRO_EL0")

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>          if (current_task_addr >> 63) != 0:
>              current_task = current_task_addr.cast(task_ptr_type)
>              return current_task.dereference()

-- 
Best regards,
Jinjie

