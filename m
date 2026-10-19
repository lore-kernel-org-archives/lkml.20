Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com [115.124.28.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE212147F9;
	Mon, 19 Oct 2026 01:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374067; cv=none; b=W8QzcCBkLJZg4fyQmo0crLz0qh1hauf6go2Gk6TXXSK69Gkf5h1nIJes36JEmj8fhVAFUYCFg+ViMdb+6gEKsK36lUyvTRPWLXLFnsUXUUiOT9KEjnzPttFK2aeonPo5JGKOXL18tYvAas/Pn1PejDc62wDM/j0qH7UFmDRW2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374067; c=relaxed/simple;
	bh=6xUbYkBIJhGYbSS1dK5KTkctSrY2u4ejMk2K4r2d9XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkmuK2GeLKDtAwaeedveYvWgtZOhtyvuyWs6wb2GMrR0usxMUhQYKG0/riGL8vKZPL/NBQyTHl4uj5VcgpPoSgecrYGgM4vH6rUO10BK9gzMJI3+Z5RxfWU5bGTLgZpFAC1842m//bTC8G/JmhcT0Q62i4SggqD21PNDwXAmrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1526008|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0393427-0.00567814-0.954979;FP=2962175283032585611|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jjkjvo9_1792374051;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jjkjvo9_1792374051 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 09:40:52 +0800
Message-ID: <aac8bc16-ba12-4312-9e93-3fcf217cc6e0@open-hieco.net>
Date: Mon, 19 Oct 2026 09:40:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-7-wanglin@open-hieco.net>
 <20261017153308.GE359037@yaz-khff2.amd.com>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261017153308.GE359037@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yazen

On 10/17/2026 11:33 PM, Yazen Ghannam wrote:
>> The preceding patches remove the Hygon matches from amd64_edac and ATL.
>> This change also requires "hwmon: (k10temp) Stop matching Hygon devices".
> Suggestion:
> "Hygon vendor matching has been removed from amd64_edac, amd_atl, and
> k10temp modules."
> 
> I think the note below is suffient for the k10temp patch dependency.

I'll update the commit message as suggested.

Thanks for the review and the Reviewed-by.

Lin
