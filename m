Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751983B4EBF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749038; cv=none; b=RS9kHqJ3XOK/eEWEkHCQYyzlNvMPt89CNgJhV+ukPL8nVYpKkubIu7xjzlTIXtf6xtpeTGPai/tZISkT7xpJyoQcqucj3DpCsmIfD1l8g33WuCvdFeFwIuSBATD0z5p7im+sCP+wjjRSELR4rlAdeLgtHrbDgT/3B/DZEUnroSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749038; c=relaxed/simple;
	bh=cgNeV2tJ5a7FvFwP3uUFLMcXc/n8hHn6AlN+Pk4uHcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFNu0UC9IP7tX+p4zxRO2g3tbeSMIhI5aGXvmL9GhaBEQl2SIS+Nls+o6ov47HSF1l/HCNKhb0Cz0kWWD2fAEMXT6o3EFX2BJoUd5I/MML+sastqpivRP9eV1FT7RoQ4caHrLySAguIxpMX+wO+B1YzaSs9ooBegeBk2aTP5ZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BwiFO3g8; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BwiFO3g8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=GEC5VrGsxOicCDpbpbvlL71buf+2GXHQaTNttgTKeW0=;
	b=BwiFO3g8ms96Pufu/W2BKG/zG6XBTPtGsgSchgwGJlVHAYc4crzmNMIvN2uypU
	ukV54XrDhCZLQeJwdi+JTvBi+DFFk+lX34hPyzhdcTIXSZaE4yuDXs+0BBmfVXLo
	rUuvhD4y3umr+j38V4tuJZw0gWGFHP4YvyABsiPqoifF0=
Message-ID: <cf7a4ce8-1f64-4ab2-ac97-033f1a45438b@163.com>
Date: Wed, 30 Sep 2026 14:16:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] exfat: dirty all new pages when extending
 valid_size
To: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>,
 "exfat@lists.linux.dev" <exfat@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "chenxiaosong@chenxiaosong.com" <chenxiaosong@chenxiaosong.com>,
 "dxdt@dev.snart.me" <dxdt@dev.snart.me>,
 "hyc.lee@gmail.com" <hyc.lee@gmail.com>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "liubaolin12138@163.com" <liubaolin12138@163.com>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260927080305.831641-1-chizhiling@163.com>
 <20260927080305.831641-3-chizhiling@163.com>
 <PUZPR04MB63169342024E0071F334B25B818C2@PUZPR04MB6316.apcprd04.prod.outlook.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <PUZPR04MB63169342024E0071F334B25B818C2@PUZPR04MB6316.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgDHPFAwqbxq8b+oCA--.32329S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW7KrW5JrW3WF1DXFy7KFg_yoWxCFb_W3
	4kA3W2qw4Y9r4xtFW5tr9xAF9YqrWIkry7CF10y3W7C345Aa4kJryvyrZ5Ar98XF48XrZI
	krn8KFWSyr1UZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUgdb5UUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BBA3Wq8qTCgXAAA3G

On 9/29/26 6:26 PM, Yuezhang.Mo@sony.com wrote:
>> +               if (folio->mapping == mapping) {
>>                          folio_mark_dirty(folio);
>> +                       pos = next;
> 
> Setting 'pos' under this condition may result in an infinite loop.

If we set pos unconditionally, I'm concerned that we might miss marking 
a folio as dirty, which could expose stale data.

I think it would be better to switch to __filemap_get_folio() in the 
next version. It can directly return a locked folio, so we don't need to 
check whether the folio has been truncated.

folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN, 0);

> 
>> +               }
>>                  folio_unlock(folio);
>>                  folio_put(folio);
>> -               pos = next;
>>          }
>>
>>         return 0;
> 

