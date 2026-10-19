Received: from out28-172.mail.aliyun.com (out28-172.mail.aliyun.com [115.124.28.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77CB3C1F;
	Mon, 19 Oct 2026 01:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373390; cv=none; b=nnccaRat8c4hMCes2/qnUkJn+k5lfCwX0LX4D7hjnx8pfDKKzFyEDCz6jvzxTKJ3rLyEtMBQvhRBWBSX4MZtx+wQ+yvLlrYMJeLACXe0TeaHqvci3Q2hu5ercJMZwKNrFthBFzucm2nBg7fyltEN20pDtYiAjvYIqn3JTNJylD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373390; c=relaxed/simple;
	bh=lHmBsQoX2AOJjBvlUnSlSw+GcyB0kqc/zH6EO/JNeO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+E4QIr2BxjEtOCtPb3HkxdTQufimzeGLCH5mvH38I2DkHG1lUMO7ht+ofpzLVdDmzjYpr00oQxREOUmWa8Ov8JF/B50otTSkJwXOej/ox61aBd0Qn0NZAoc9jKnuzY5Ei0s1K6xpgsvzPSAT1ZomPQxh653IMnGiMO32CUCkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3837317|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0326507-0.00192891-0.96542;FP=5279867885040981227|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jjcyopw_1792373374;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jjcyopw_1792373374 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 09:29:36 +0800
Message-ID: <ef471849-efb9-4034-baae-a90cfe323103@open-hieco.net>
Date: Mon, 19 Oct 2026 09:29:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] x86/hygon: Map CPU NodeIds to DF nodes
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-3-wanglin@open-hieco.net>
 <20261017151031.GB359037@yaz-khff2.amd.com>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261017151031.GB359037@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yazen,

On 10/17/2026 11:10 PM, Yazen Ghannam wrote:
>> +	socket = FIELD_GET(NODE_ID_SOCKET, phys_nid);
>> +	local = FIELD_GET(NODE_ID_LOCAL, phys_nid);
> Minor nit: align on the '='.

Will fix in v8.

Thanks for the review and the Reviewed-by.

Lin

