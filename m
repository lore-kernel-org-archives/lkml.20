Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392107;
	b=ULqiJBCrlUWMXGCIbCT0wC192z5/zIscClXy8/7fj8OvMxukcGUxN1lWwoi4OOEPl7J2
	 KHx4Z0RHRgQ20YKLD7t8Q/6UulSaZhoyFL+uozLCHY+ydFX30/vglmJLAJVPfE+EW9pAB
	 VCb+SOg4p0m+Vzc8K93zMvQj+yAHeLbF3ZHvsI7eOU/DkPhlP5TxO5OsSJcZSYsxHHD5p
	 YPRiGNHOIokbSyWLMnGs71VV/NwlYHZB7mGKLtZoYpl/2DfGkKnWW5v0+BTls2uyVnWQe
	 bDHsuRAsk8MrT0KjKzD8cXHHB3fbj7/IWTRnqRPz19qBVwKE/9iXSn816txC7XqPzdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392107;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=WoFu5Y8HEl5Mu4EdTi3BieAt/LoevyDG2bUSzTwF484=;
	b=kSsc4sHFqn/kpWZETHlHtK13hTSBEtQLf0axkJRcmqsvU+j87EU9oith7SVp+jd+shfm
	 XUZiCnjTtaq4jirDHKu5pkcb082PrhsIGHJKtb+yVA4BBeg7lYJzV9UPBCeKM1sQ5O6pw
	 blPjMmOdh+8bMFYyDlSVLeZ/48owBIN7gH++l27yMnuOcFTxsjdLVsbI/GPRnHOonL8/a
	 6k4VURLmgGHlIR1TNOaBGR4N16CiTPwM0uTCea54Tg0nKWWAK1FehR07UdpjZQzFCRUY/
	 AP0xcq6KcxkMweaGi/+RnXxEtcBczxrhkv2vNMx3/aO7KHCGtQCISkp9D6hnOP/1phw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=hpvU2tZT;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B87606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B87606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=hpvU2tZT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WoFu5Y8HEl5Mu4EdTi3BieAt/LoevyDG2bUSzTwF484=;
	b=hpvU2tZThU1T1BxQr/2toWig69cLVckE9jSW2O40IDMDKabXB4+6aj6yO1He0Gm2NRlgrIRCp
	098Zp68VMRuEU+7iz+UQeqep2Mk8rvcEm/42ADGib0Cpp7b9KSTrfAOrAD3SFIlxayNl6mBRU98
	zvoj8LCGtM5vvTV9IVqiVMc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPfX51cgpzLlt9;
	Wed, 11 Nov 2026 18:14:45 +0800 (CST)
Received: from kwepemk300003.china.huawei.com (unknown [7.202.195.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D54D40578;
	Wed, 11 Nov 2026 18:15:00 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 kwepemk300003.china.huawei.com (7.202.195.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 11 Nov 2026 18:14:59 +0800
Message-ID: <64df30e9-4297-4e37-9e9c-2760d68af24f@huawei.com>
Date: Wed, 11 Nov 2026 18:14:58 +0800
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
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
To: "David Hildenbrand (Arm)" <david@kernel.org>, Yuanhe Shu
	<xiangzao@linux.alibaba.com>, <akpm@linux-foundation.org>
CC: "Huang, Ying" <ying.huang@linux.alibaba.com>, Kaitao Cheng
	<kaitao.cheng@linux.dev>, "Garg, Shivank" <shivankg@amd.com>,
	<vbabka@kernel.org>, <ljs@kernel.org>, <liam@infradead.org>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<linmiaohe@huawei.com>, <nao.horiguchi@gmail.com>, <ziy@nvidia.com>,
	<tujinjiang@huawei.com>, <mgorman@techsingularity.net>,
	<chengkaitao@kylinos.cn>, <muchun.song@linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Ruidong Tian <tianruidong@linux.alibaba.com>, Tong Tiangen
	<tongtiangen@huawei.com>
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
 <16cf88a0-6652-4276-95fb-12306e417701@kernel.org>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <16cf88a0-6652-4276-95fb-12306e417701@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk300003.china.huawei.com (7.202.195.93)



On 11/11/2026 5:36 PM, David Hildenbrand (Arm) wrote:
> On 11/10/26 12:26, Yuanhe Shu wrote:
> 
> While the file touches highmem.h, this really isn't about highmem at all, right?
> 
> This really affects any architecture except the ones that define
> copy_mc_to_kernel (x86+powerpc).
> 
> Or am I missing something? Would be good to clarify that.
> 
>> The !copy_mc fallbacks of copy_mc_user_highpage() and
>> copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
>> set while the data stays readable, there is no fault to recover
>> from: the copy completes, the destination folio carries no poison
>> marker, and the poison is consumed silently.
>>
>> Check the source page with is_page_hwpoison() in both fallbacks,
>> before the copy, and return PAGE_SIZE, the not-copied-bytes
>> convention of the real copy_mc paths, so the callers take their
>> existing error paths.  On archs with copy_mc this code does not
>> compile.
>>
>> Measured on arm64, where the fallback code compiles: a
>> kernel-space microbenchmark measures 90.00 ns per copy before the
>> patch and 90.71 ns after, 0.8% of the copy itself.
> 
> CCing Catalin. I'm surprised that arm64 cannot recover from a copy from a
> hwpoisoned page.
> 

+1

We have been trying to support this feature in the mainline for over
three years. This year, Alibaba took over and released new v14 and v15[1].

In server scenarios, COPY_MC is very useful because it helps avoid
unnecessary panic behavior in the system. We would like to receive some
guidance to accelerate the integration of this feature into the
mainline.

CCed Ruidong/Tiangen

[1] v15 
https://lore.kernel.org/linux-arm-kernel/20260618092124.3901230-1-tianruidong@linux.alibaba.com/



