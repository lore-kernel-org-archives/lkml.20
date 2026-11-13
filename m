Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555057;
	b=nwnhuvQKwJmhuklqif0nTGJHOvz6cEurbYpSVYPK6w2sUGB5AqbR2/23GCXRzFVyuR0q
	 GqurhPCJv+4ovDIm45UE9qwiGxhISuQ3b2RBRk1/+1HpaUSg3GNoQttgXlFUjmuVO+gRm
	 xvwK7QzL90CGmnmZSdUFMw06rgmtF6p8PLLTD7xK8MmpkQQAgG7+nHacGT0oTAgWPjxGT
	 RKa603OJczZu8Fu7FA+6SWDjSr6WXkhTx7pqW1wyVwM79IJq6Nwb8lPYpSb4njMTOyIQr
	 99bYZhJHwEqR0Yet7lfnUlO39snFYalXkjwet+mquzkHoXTgsN+2KqZgtuY1tLRpttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555057;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z4qGF/xXhp8h6R/uUmXdxIctCrS1GFGLpy4gJytT2WU=;
	b=OzxuhufzfXpV2U61g2gEmOvf8bV6PiRtaN3OncmDcLNza9hvurQtWUPLQmQMnPiNfPJK
	 bqEDJlw8gUEdXMkcrX2FYG107MbWWmJpypZ4RTjqdYLa8w6eMG41ViguBp0FTzBWvKMt3
	 MP1mj8dYl+lYvLqgMbdq5YPV2JJATz+UcTasZwfCSa9gBUHPSZTKd0vHrYUCMyy83noav
	 2qjHR8pZROlFI2ZXgiQtMKUel5QYSfNmRufMTokDveB6weYIogDOJsgsWVjW5k36Zyfnt
	 aYpa36oeWFNAcnU49NuYkLtYdFYIUfG48C6PpzXExDWT4vzjeJ2QW0myqb1oEMiszbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.220
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B691606A323;
	Fri, 13 Nov 2026 07:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B691606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09034447|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0828622-0.00144669-0.915691;FP=7629473359374968787|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083099174;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k166u1E_1794555050;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.k166u1E_1794555050 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 15:30:51 +0800
Message-ID: <7065966e-c59c-4a17-a491-0117339cba40@open-hieco.net>
Date: Fri, 13 Nov 2026 15:30:50 +0800
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
Subject: Re: [PATCH v9 3/7] EDAC/amd64: Stop matching Hygon CPUs
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-4-wanglin@open-hieco.net>
 <20261113045230.GCavaXjqKx1l36G9A0@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261113045230.GCavaXjqKx1l36G9A0@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

On 11/13/2026 12:52 PM, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 01:33:09PM +0800, Lin Wang wrote:
>> amd64_edac gets its node count and DF devices from the AMD northbridge
>> cache. Since commit 49b96fc0dddc ("x86/amd_nb: Simplify function 3
> This commit is old. Should that patch be in stable?

I don't plan to backport this to stable. It is part of separating
Hygon support from the AMD code in this series.

> 
>> search"), the cache finds function 3 only at the fixed PCI slots
>> 0x18 + N. Hygon DF devices are not at those slots, so the cache is
>> discarded on Hygon and amd64_edac_init() returns -ENODEV at its
>> amd_nb_num() check.
> Please do not explain the code in the patch commit messages. Only the
> non-obvious stuff.
> 
>> Remove the Hygon match and the empty Family 0x18 case.
> That's what the patch does, no?
> 
> 
>> MCE decoding
>> in mce_amd.c is separate and unchanged. Hygon memory controller support
>> will use the Hygon node interfaces in a separate series.
> This is unnecessary.
> 
> Please concentrate only on why a patch exists. No meandering, no obvious code
> explaining, just to the point.
> 
> Check your whole set pls.

I'll reword the commit messages across the series to focus on why
each change is needed.

Thanks,

Lin


