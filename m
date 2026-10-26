Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025713;
	b=SK7VMmZAxic2e8/ePqbTM2p5/QboGFl2OXnpBQJcbJYk1ISQhttQPQ36+ue8scBeZbV5
	 jxqzoutP2mhqjC1Qlw+osqDFclDlUT/WYJG0L/rQdzXWVlMnyJuaRpxAu7JCJcMYWf2OM
	 I3Xnr4J+JNhTcrkc53ksWoo7yqN1ZVfsBLLpuoyDkAPHtIrsYopI+wqdRyU+8zrZq1Wgf
	 0i6OMMe3gW/KL67NqnV/CPuf7DEtAULuIfI4c3ARRXs4gIPWSPiT5+9mEjzIYGw1rgq1d
	 Uv0vC7CxWo2+8rWfxOjb5TM1917BVck4s9UC71Xhe9SpNTxlWCqbiJWSJiF3d7ErifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025713;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ztGkvnKx9b6NJdGw48tpWlBfewbZxe0B7yDbowRvvsE=;
	b=Q6Y+QGHVG6v2pEvhJ6pF6blLzilKjs5Dge1MMFl1R3Wx3qjoPuuvX4ViQXrbnxnZkE25
	 1v4XuvYLw9yUAfU/5WAz76Yj5qONNhOdpdCdael1pjMmCtkf+H9Yh/8VZI0ltJQ8fO/tP
	 Z4Lk/YvDxEXF8HAh7CPJpJTU2lthJWdGkCf2prZBSrXll6zuSm0bzRrU1Sn2Eh2Y+FGel
	 cG96xMtv2ZqCWQW7jLp090tJELsKnL6ct6KiB8Qjn/VTxUnBAE7JrTyX2nLI+aSdmv6IZ
	 tiUPOXky92y4M2RK0ggujU2RzdamSqx/4po1fn1dU+FfSS5AXd7tCo0OZQhSxPZVXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="QG37E/tN";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73745606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73745606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QG37E/tN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ztGkvnKx9b6NJdGw48tpWlBfewbZxe0B7yDbowRvvsE=;
	b=QG37E/tNZjLHTO02byxSbrEzytXJShMKXlql8TZhK8WlcWcx3G8oVr4x8x3U3s
	9GALkalnBaFBlZWBmE2adcTCqhuUw8hRLkj4MiplFvTJSErfX3fQ+HjAqbEYFRIE
	Ma+l784b8shJP4H05wWMb4hDxqX77WNFiTzDo/d9TGQvA=
Message-ID: <760eb7f6-8ec7-46a8-b4e7-b3f8685912eb@163.com>
Date: Mon, 26 Oct 2026 22:41:02 +0800
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
Subject: Re: [PATCH] exfat: drain dirty pages after forced shutdown
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org, exfat@lists.linux.dev,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20261026091542.1031813-1-chizhiling@163.com>
 <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgCX95p+Zt9q5GXYCA--.14986S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw48ZFykCr15CrW8KF15Arb_yoWDKFg_Ww
	s2kw18AFs0y3WrAanxZ34YyrsrtFZ5uFWktrWSk34Yqa1DJFn7Zrn5ZrnayF40q3s7Krs8
	urZ2vr48J3WkJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbjYLPUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+B9L6GrfZn9OBwAA3h

On 10/26/26 6:59 PM, Namjae Jeon wrote:
>> @@ -283,9 +283,6 @@ static int exfat_writepages(struct address_space *mapping,
>>                  .ops            = &exfat_writeback_ops,
>>          };
>>
>> -       if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
>> -               return -EIO;
> Please move this check to exfat_writeback_range(). Returning -EIO
> there lets iomap clear dirty state without writing data after
> shutdown.

Okay,

> 
>> -
>>          return iomap_writepages(&wpc);
>>   }
>>
>> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
>> index e50ecbfbfbe0..6383739f5700 100644
>> --- a/fs/exfat/iomap.c
>> +++ b/fs/exfat/iomap.c
>> @@ -165,6 +165,9 @@ static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t le
>>          loff_t end;
>>          int err;
>>
>> +       if (exfat_forced_shutdown(inode->i_sb))
>> +               return -EIO;
> This check is not needed for this hang fix. exfat_file_write_iter()
> already checks new writes after shutdown.
> It also misses existing mmap writes, which use exfat_iomap_ops. We
> need to add a shutdown check to exfat_page_mkwrite() also.

Okay,

Thanks.


