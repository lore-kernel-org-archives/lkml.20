Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570452FE2F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868664; cv=none; b=uAv4P7RwRt/nIOq6gFLSelCLC3A+uKT0JNrN32O2bYF8TnV2jl4k983Dq1XGcPvPv8aVG0jUeXl9v3lt4+QH3U0SD2rqz5kv/oty9T4z5xIiDuD/0jE17a1UzejmHublHSX4I4IO7OBNSrrYAASsp7c9XlEPwtpj/zd1VMvA4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868664; c=relaxed/simple;
	bh=83tDqTJL5pxQy2kKwGR2dTt8aQYFClW/zbZE+4PfQ9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fKE2BxQyHDJqtIoyP/JIa4xCcCiq4tME8/dMRVV3cDbrTCTrwtpMa7jpsBru0FI+QPuMrPeLmcoj/5iKgH8DpC+KFDAQP6rNc5bjG1m4nqiQKes0i+rInoM3tuWAz7pzSKwbSzSNt3vpBhKHqC5+7cV7YKnnWDc7JtKdAX7rZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lGXJG+z+; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lGXJG+z+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gc43alueHNjQq0WXaXpIZol5pNQHnDbpHeJQ0elMPno=;
	b=lGXJG+z+qP/9knI6Q1Chyv/DIPLN4L+ZycdyfPWLPkNPDqokYAfbRHAPv0PH8mAh9qQqRlQ6a
	EcZbJC/Ur7G6AzVCrYdQObqHEsB/X8bMHp0IatNh5GYe0WcpJeKxDdJb4sSCnCEnPCTZ6KSrzP9
	Ie7+hNJ9ovEbtSJ2Tp+CGdo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hfMbk6sWlzmV8f;
	Tue,  8 Sep 2026 19:46:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E137640586;
	Tue,  8 Sep 2026 19:57:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:57:36 +0800
Message-ID: <1f63a6fd-6e09-47a3-96cb-236eeebf8c20@huawei.com>
Date: Tue, 8 Sep 2026 19:57:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] firmware/psci: Cache PSCI v0.2+ version number to
 avoid redundant SMCs
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-15-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-15-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> Secure monitor calls to EL3 aren't necessarily cheap, so cache the
> PSCI version number in memory to avoid asking firmware the same question
> over and over again.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/firmware/psci/psci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a..8bb3f7c37678 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -155,7 +155,12 @@ static u32 psci_0_1_get_version(void)
>  
>  static u32 psci_0_2_get_version(void)
>  {
> -	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
> +	static u32 version;
> +
> +	if (unlikely(!version))
> +		version = invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
> +
> +	return version;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  int psci_set_osi_mode(bool enable)

