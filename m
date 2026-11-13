Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554354;
	b=Mw+58Hj0+bU0cUbhDMFWbgTlAzxoYk7ARNBnb6C+gwfzEiap+/04mxbZSTY5BJHUeEya
	 QhD3/ZV5wcVx8Z6OBEybJM+TtrXRFsqWcQIeS6H/iSTGvpNWSUb4tX2UyxQotZpGqYM5t
	 4d1K4x0vIkPRDLuDy9ZM50RZT+RNM4/hROLcsbn9IWOFKQBECAj01xsEWEm8aTQBAVJeQ
	 p/rY9oPKOT2nTnhfY6CqASjjQoBxBrMwKZthYmSAct1yDuOPYPHE5AEMPJUXG4iRQFjWq
	 HFp1tis7aaKrzVNDR+RREMhBZYcpbc9Lbv3F18OrZOak1E4XsJeQSNSF+KTjf3gQqug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554354;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Te2tQwKi+CbFbO7kcRVoVZVDN2GCxgygHMZknPIbp1s=;
	b=Me6JL3jcdIiSCMxKY5Gi9eaeVRPw7k+7+bOZoVG4UN/VUd8C7xhE1l5LPz1o1LU2gmN5
	 dn5o8L+Dyosi3Y+v+GF4LIjCyaY+u2Jfg2mq6JvlHli6NuygmEqpWhYEBllnL/q0//A58
	 XmgPHOk8a2pQb0gZwNHIrSoL1Nj8iNdkorAYQRQpxSg4UM43u+DnP95zmSm1sn+8Ww48m
	 BSX7gqd4CzOUHeAqfmv0nG0ThNdPvf6Q2YMzJslI8I5QHHVfDMyvSbcWTzk42r9Zq8HPb
	 rmIrFXznv04vUQzp56HQBmEzrxN4KON3htqrll5Xn9Ii4RghrSUQ2pFiNqLfFdCw2VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0AC606A330;
	Fri, 13 Nov 2026 07:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0AC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.114326|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0261926-0.0001931-0.973614;FP=7245694826860738781|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034020;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k15Fw7B_1794554341;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.k15Fw7B_1794554341 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 15:19:02 +0800
Message-ID: <2371a225-006a-4c1d-bae1-0deafba938a3@open-hieco.net>
Date: Fri, 13 Nov 2026 15:19:01 +0800
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
Subject: Re: [PATCH v9 2/7] x86/hygon: Map CPU NodeIds to DF nodes
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-3-wanglin@open-hieco.net>
 <20261113044357.GBavaVjdHaKh3oni3q@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261113044357.GBavaVjdHaKh3oni3q@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

On 11/13/2026 12:43 PM, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 01:33:08PM +0800, Lin Wang wrote:
>> +static int __maybe_unused cpu_to_df_node(unsigned int cpu)
>> +{
>> +	if (cpu >= nr_cpu_ids)
> That cpu and nr_cpu_ids mean nothing in a guest so I'm thinking you wanna test
> hypervisor first...
> 
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The NodeId reported by CPUID in a guest may not describe the
>> +	 * physical DF topology.
>> +	 */
>> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
> 
					    ^^^^^^^^^^^^
I'll move the hypervisor check before the CPU index check.

Thanks,

Lin
