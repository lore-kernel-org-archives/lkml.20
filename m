Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2A1E260C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836164; cv=none; b=C0Ea6IlrBPdyqRELIxdcvvLdp0tgDCEiqdpGPMnA6Lww0WxBI4yDreYeAQwwwh3wu4w86ospgZOn1Co1iMJJbOVpv52lYnujtjKN8HpqeJ+PajiBm8TJXx6MgyGWqbi0Jag3bcQMVcHQUk7pcfXYtq0Q+PcGi4etFKBcBfehbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836164; c=relaxed/simple;
	bh=1PlgD+7UsdymrxgP4JNhP5xr7y6/XxxXuXwSmEjkCPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JIOI+YVFXuQw560JDPBeG/Xd177RZP44CnJEIYq3RyztPFTrbNhXMGj9Ui8m+n4QEI9i9l/i0incY6J3/kEHwGCTbEynyjK9YUbUJKiZFVoQ8btD4BJusoqiN9IbWl6t/4SC4aRiOf5BZq59f/sfDJfpEfY2STXPyJfVdGRuRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=0WN9IDDV; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="0WN9IDDV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3CYzChcq0jx4/J4bNcbvKG7nba9LcgoUtWkF6NKKS14=;
	b=0WN9IDDVMyqZcOIqZk1aolIaLzCS8+U/xkoIGJg92XnTZjh6z/STHy0kmwOcCUspHhtmroeSf
	retW5f8XldEsKF7JHE8oloDvC/SQMEpsamKUzIHA1ERWrbh1JZqA3UoieGXIiK7XWqvsuYGp/z8
	UPXWgOhy5oqTCn1Qk0xE+qw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hf7ZN5L9jz12LHh;
	Tue,  8 Sep 2026 10:44:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B6D704056E;
	Tue,  8 Sep 2026 10:55:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 10:55:56 +0800
Message-ID: <39838d3c-6fed-47ed-943f-513e54e7d86b@huawei.com>
Date: Tue, 8 Sep 2026 10:55:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] cpu/hotplug: Clean up cmpxchg() logic in
 cpuhp_can_boot_ap()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-2-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-2-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> cpuhp_can_boot_ap() uses atomic_try_cmpxchg() to transition the sync
> state of the incoming CPU to SYNC_STATE_KICKED. However, this is
> unnecessary if the state is SYNC_STATE_DEAD, since there will not be any
> concurrent state modifications, and also if the state is already set to
> SYNC_STATE_KICKED.
> 
> Restrict the use of cmpxchg() to the case where the existing state is
> SYNC_STATE_ALIVE.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  kernel/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..198c929c452a 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -408,22 +408,22 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
>  	switch (sync) {
>  	case SYNC_STATE_DEAD:
>  		/* CPU is properly dead */
> +		atomic_set(st, SYNC_STATE_KICKED);
>  		break;
>  	case SYNC_STATE_KICKED:
>  		/* CPU did not come up in previous attempt */
>  		break;
>  	case SYNC_STATE_ALIVE:
>  		/* CPU is stuck cpuhp_ap_sync_alive(). */
> +		if (!atomic_try_cmpxchg_relaxed(st, &sync, SYNC_STATE_KICKED))
> +			goto again;
>  		break;
>  	default:
>  		/* CPU failed to report online or dead and is in limbo state. */
>  		return false;
>  	}
>  
> -	/* Prepare for booting */
> -	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
> -		goto again;
> -
> +	/* Continue with booting */

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	return true;
>  }
>  

