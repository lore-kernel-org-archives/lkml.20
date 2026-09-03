Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF5360EEE;
	Thu,  3 Sep 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429261; cv=none; b=pBPO9IbPNSQk+LYGQ7k3vUH1IGqLUBHGFluuiDwnZF2YtK9muZpifH/1PEC5ERCxJuAZ0ofnJ9QjEYKglwa/Xp2dEJQ0AimshFbnGBWLrLSF3RmWiZs2fh0DWAH22SM5FFyul5OBrLX1crn/gIu31PruWw1LpXIqGxpmvswqAFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429261; c=relaxed/simple;
	bh=fNcUNlfnWxPl9ohgFql4///teT3N8Pfs1Yc5cH/uBV0=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=roAjkV7uWUzWin7U4vS9LD+WCmNd/ut1lJvttxr5QEnJh9t90JkXLcLz4JBTuqGMyV6tCaG9n89GrANfYFe9MzJDwkv0c1meUypv+CBJ0NGRykxSbaK7E7HyPTUwJj6esLAu8BrithWqd8UK2X9SvhVtn9GeXoxC5DLHQnZLGBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NBMW2MDO; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NBMW2MDO"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=D191mRiW4Ai2eSzoB8c9z+UK6Oit5vvaURV2uNRno4Y=;
	b=NBMW2MDOwYACzE9UeW6rA7LydoObVxOn5hgg+ibYsXhevRrq28CEGmMFEeRNOXHmZXaCer7ez
	Cx/1YT1AVE4fySggBLU0NXLU0Zkawlvx3NVD7drhYQ9+CpXV3MKT6V2SgfjdDjZdl/WZOxl2iJQ
	EPsisV2AswARAIlEPj0lFHU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hbF5h5NVKz1prPv;
	Thu,  3 Sep 2026 17:43:20 +0800 (CST)
Received: from whupemk200014.china.huawei.com (unknown [7.152.185.79])
	by mail.maildlp.com (Postfix) with ESMTPS id 176374056D;
	Thu,  3 Sep 2026 17:54:13 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 whupemk200014.china.huawei.com (7.152.185.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 3 Sep 2026 17:54:11 +0800
Subject: Re: [PATCH v2 1/2] RAS: Fix inverted context info bounds check in ARM
 processor errors
To: Abbott Liu <liuwenliang@huawei.com>, <tony.luck@intel.com>,
	<bp@alien8.de>, <jic23@kernel.org>, <ardb@kernel.org>,
	<rafael.j.wysocki@intel.com>, <mchehab+huawei@kernel.org>,
	<luoshengwei@huawei.com>, <jason@os.amperecomputing.com>,
	<danielf@os.amperecomputing.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>
References: <20260825134323.4181892-1-liuwenliang@huawei.com>
 <20260825134323.4181892-2-liuwenliang@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <001d4025-1b48-56ca-af5e-b1bda83eddf9@huawei.com>
Date: Thu, 3 Sep 2026 17:54:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260825134323.4181892-2-liuwenliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemk200014.china.huawei.com (7.152.185.79)

Hi Abbott,

On 2026/8/25 21:43, Abbott Liu wrote:
> Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
> allocated memory") added bounds checks for malformed ARM processor
> error records but contained a bug:
> 
>    In log_arm_hw_error(), the ctx_info bounds check is inverted. The
>    condition `sz + (long)ctx_info - (long)err >= err->section_length`
>    adds ctx_info->size when the context header is already past the end
>    of the section instead of when it is within bounds. So change the
>    comparison to <=.
> 
> Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")
> 

This empty line is not needed.

> Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
> ---
>   drivers/ras/ras.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
> index 03df3db62334..2540538a16a8 100644
> --- a/drivers/ras/ras.c
> +++ b/drivers/ras/ras.c
> @@ -74,7 +74,7 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
>   	for (n = 0; n < err->context_info_num; n++) {
>   		sz = sizeof(struct cper_arm_ctx_info);
>   
> -		if (sz + (long)ctx_info - (long)err >= err->section_length)
> +		if (sz + (long)ctx_info - (long)err <= err->section_length)
>   			sz += ctx_info->size;

sz is an int and ctx_info->size is u32, if ctx_info->size is big enough
for example over 0x7fffffff, the sz will be negative.

>   
>   		ctx_info = (struct cper_arm_ctx_info *)((long)ctx_info + sz);

if the sz is negative, the ctx_info may pointer to a wrong place.

ctx_info->size will not over 0x7fffffff in practical but should we
consider the overflows?

Thanks
Hanjun

> 
