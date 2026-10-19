Received: from out28-169.mail.aliyun.com (out28-169.mail.aliyun.com [115.124.28.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4E34EF0D;
	Mon, 19 Oct 2026 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374318; cv=none; b=n2wTUyH1WUGih9es/QnjV76fFbIRdbHdCLnrfwKcYAk5NFFS4kaIleSelY6Rn09nVZkJrG7HuR5nIsBiVSbpGsfyWj6xMGlyu46dmyZs1g7OJQV8qNW2gziLbdRuyTh+hdh14KRA18UMFYV1tAMdlFHYh3ETDBXZtO99MLwWcfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374318; c=relaxed/simple;
	bh=UDs1BFTA5AmyzS5tymictTCpz0QgddHBMFaPcy1pu1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EM9V2sRiceBfOTB0kJ+hwAaGZLZfJC9K3GsYnqk/6eaGPsycHW8gC9g9tZtUtnTH5jaqCx4U1FANijB9barV0TRXR2tGX5BB7GoELmN8vPj+u7I3faCDmWXxY4+GFqz170POLbsC9Gaw/7w+CPk55DfzfrI2PU/H53j2mMyEHjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.219396|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0353986-5.29155e-05-0.964548;FP=3140052470678269593|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037021217;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jjbwPiH_1792374305;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jjbwPiH_1792374305 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 09:45:06 +0800
Message-ID: <a8af3fba-72a8-438b-bf32-1885d99fcc10@open-hieco.net>
Date: Mon, 19 Oct 2026 09:45:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] x86/hygon: Add Family 0x18 SMN access
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-8-wanglin@open-hieco.net>
 <20261017154140.GF359037@yaz-khff2.amd.com>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261017154140.GF359037@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yazen,

On 10/17/2026 11:41 PM, Yazen Ghannam wrote:
>> +EXPORT_SYMBOL_GPL(hygon_smn_read);
>> +
>> +int hygon_smn_write(u16 node, u32 address, u32 value)
>> +{
>> +	return smn_rw(node, address, &value, true);
>> +}
>> +EXPORT_SYMBOL_GPL(hygon_smn_write);
>> +
> Same point as before for exported functions.

I'll also keep the SMN read/write helpers local until they have
in-tree users, and remove their public declarations, stubs and exports.

Thanks for the review and the Reviewed-by.

Lin
