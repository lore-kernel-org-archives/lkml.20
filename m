Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC427FB18
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605496; cv=none; b=HW7bV0mcptYCd1zx3PmTlzLavWj1/wxGvlBRIPP4qWFy4fGrkqL7S71VP0ZlAMFGcZwAnRwNsYKFwrNL/tpJTg4eBKSf9+jx2h/UtCch6MpXGBf7dOVdNuMbsMiM9MjjBj710Qnq8nXt6d/jo0rzkCpJRX1P9P2nkEGocwXqXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605496; c=relaxed/simple;
	bh=DMwvOcJgLaYqtquxTOto7I8xdD+BZc+rZ60O+/YEdAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqnkqB4vGQ01569ONx3+vBJv0USSSGXKwuu7b1tKgxEPcGZxvacX26C23VaITTnB0GOsUSlyGgWA+ovrRDv35gO4mfveHU8u8Q347aZ4SQKv9n/rdnOWihM/Z1qJmnillaiQ7ubSG6AYsfdBIlDGJihOREJrgRUPL2xdjGJ6KQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NQiu+dVx; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NQiu+dVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=KbFpYsK7b/u5S0Jk2r7FQwpCtQ5a8PrDHQYGcWqe9O8=;
	b=NQiu+dVxFAMc4XNLuK3LC6+U81mL/MtD+ooy1bzRm3OUvV9mtOIZe9oBbhvlP8
	3gvaw5K+D2HMsl9gypL4OyVipvKpbv+QA+sSj1q3CcJE8wSJlxlj3KWPuz3Xo3hW
	7ZWzeD3GMKXlGH3KWUyNGdE/X2aQbSRpNet1Vl1dX893Y=
Received: from [IPV6:2409:8907:9f4b:3fe:b252:b6b3:7eed:98b6] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBnuhoK9Jtqzk4zQA--.48419S2;
	Sat, 05 Sep 2026 18:50:51 +0800 (CST)
Message-ID: <a07bcb84-88e2-4d2f-802d-f24ac390b18b@163.com>
Date: Sat, 5 Sep 2026 18:50:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ntfs: fix error handling in ntfs_extent_inode_open
 and propagate errors
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
 <20260904090054.3365538-3-liubaolin12138@163.com>
 <CAKYAXd_5ZcxzTP7OD9yv+ns-KYqjz2-BKaNmdi4YmtbVxJBq=w@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd_5ZcxzTP7OD9yv+ns-KYqjz2-BKaNmdi4YmtbVxJBq=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBnuhoK9Jtqzk4zQA--.48419S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4UAF4fCr4DAFW3Ww4UArb_yoW3Crb_C3
	WxKF47KF4UXF1fXanrAr1fXas2kFs5GFyYqr1DtFWIyas8Jr4DCF45XrnrJwsxWr4ktrWD
	Krs7GF1akw45ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj0ztUUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgvAi2qb9AvuQwAA3h



在 2026/9/4 22:20, Namjae Jeon 写道:
>> @@ -2968,8 +2967,10 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
>>                  i = (base_ni->nr_extents + 4) * sizeof(struct ntfs_inode *);
>>
>>                  extent_nis = kvzalloc(i, GFP_NOFS);
>> -               if (!extent_nis)
>> +               if (!extent_nis) {
>> +                       ni = ERR_PTR(-ENOMEM);
> It overwrites ni with ERR_PTR(-ENOMEM). ntfs_destroy_ext_inode() must
> be called before doing so.
> 
>>                          goto err_out;
>> +               }
>>                  if (base_ni->nr_extents) {
>>                          memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
>>                                          i - 4 * sizeof(struct ntfs_inode *));

Hi Namjae,

   Thanks for the review!

   Sorry, that was my oversight. I should call 
ntfs_destroy_ext_inode(ni) first and then return ERR_PTR(-ENOMEM) directly.

   I'll send v3 soon.

Thanks,
Baolin.

