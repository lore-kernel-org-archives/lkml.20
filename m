Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com [115.124.28.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B447353A95;
	Mon, 19 Oct 2026 01:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374866; cv=none; b=P2Hb7dr6RyggQbsHqHE0zAyWsQmJ97JGALFcW616qMMcYsxhKJUGMi10FzGG8l+vb9cq42Dt8P1lm6QObQrS/eIuaukmiocWJbJCn1ytuy38y+CzzMxCdVrHgo+bkr1MY8MCV5WRfN+D2W43aRpbYJMc3Mt4ZebkFC389zDzxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374866; c=relaxed/simple;
	bh=8vjHJeYZsJVSDI+E8mHJdGuyJxa8mzSi7S72x5z3vgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xce01tIyyeGh7whUbBy+qm9XqOp1U/NCgEwAGLGvMkDemtZ4yvJmih1l12D9rLnb7JNxsv9218vZDLKzTgBG1ORGJzUTX6L+XINyTLHD+N0lOLbmY1Pio4v8KBh5KlaU5GhABzL679kzaUA9bZNNQhExLcJhsVO5WL8so5j0E2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1033654|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0289942-0.0041458-0.96686;FP=5558288521628470933|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033022149254;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jjc-LXz_1792374847;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jjc-LXz_1792374847 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 09:54:10 +0800
Message-ID: <ee5dbd51-0318-431d-a7b3-31a6859b1331@open-hieco.net>
Date: Mon, 19 Oct 2026 09:54:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] x86/hygon: Add Family 0x18 DF node enumeration
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-2-wanglin@open-hieco.net>
 <20261017145226.GA359037@yaz-khff2.amd.com>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261017145226.GA359037@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yazen,

On 10/17/2026 10:52 PM, Yazen Ghannam wrote:
>> +EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
>> +
> These exported functions don't have any callers in this set.
> 
> This issue was mentioned in the last revision for a different function.
> But the guidance should be followed in general.

I'll keep the node helpers local and remove their public declarations,
stubs and exports until they have in-tree users.

>> +		return ret;
>> +	}
>> +
> Have you considered cases where the cache build fails but that are
> expected?
> 
> We've had similar issues recently like this related to virtualization.
> 
> In summary: this failure is a true issue on bare metal, so the user
> should be warned. But the failure is expected within a guest VM.

Agreed. I'll avoid warning when a guest does not expose DF devices,
while keeping the warning for failures on bare metal. The error
returns and cleanup will remain unchanged.

Thanks for the review.

Lin
