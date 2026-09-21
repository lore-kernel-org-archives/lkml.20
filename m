Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4886647534A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986921; cv=none; b=sX4uGSqOZ0dTVTJbIYqi/7IGOo9Q1rbA8NZer3IGzBB6fjibPTDDk8Zw4wHi64QuqF5ZVTbm6kkZ5L51EuoyaRv6F6tXJkI35DmEYyGaVncQ3iSzsWU7vy2QutVithpAIkgVqNvzX0RDjxvVz1k+V77NMGPQ7LB3GnNkWjx2QUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986921; c=relaxed/simple;
	bh=3SjuJ5yprBdHbNPy6ISdGcdm2v0uG7IMdK+ejrfWX2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ST8z9O8bs2TQB6vQFlOItH+7jvtuK6LsRH0cD7mJH/pSSAqhpxP+o3G303mFS+vXdv7sGXQhC219eAH1C72MumUzszEv0d6idz6laA8cRPm9zgclzK5e8xFk7C1tDLPqZfe0k6x/J74vdw/IbePulY5wU7hlPPQtPP8a/iYMsqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ito3l6fM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ito3l6fM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=D4Ns8s2IYd8NANDTYOdlaFRflLTwoK0uQVGyZdkFNsI=;
	b=ito3l6fMy9BSDe1bWO3qXKC7LpX6EkwK+rydqnC5fMg+/XUYGASCJPObLAHamC
	jYSQGnkz8kXl8fSZWPOjSKCdIjgJKMdhDCknY8UOtSKytnI8cdFSlYY6Eg+RjQbc
	s3icfDdS2Q6Al25rp0RcEVHyl64uZ6FxJHvu7uByMoLkQ=
Received: from [IPV6:2409:8900:1ee3:222c:3c21:ce3b:b986:2f34] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDX32FACLFqOgpsAg--.14968S2;
	Mon, 21 Sep 2026 18:34:41 +0800 (CST)
Message-ID: <4afe1b4d-7fbf-4fb6-866e-71bff3bbea6f@163.com>
Date: Mon, 21 Sep 2026 18:34:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] ntfs: validate EA chains and link
 zero-terminated tails
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
 <20260920083131.1880061-3-liubaolin12138@163.com>
 <CAKYAXd80AqEnzUvad2Od8fLh4yh20X8G7CVN1EcQCg1Vj1iJQw@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd80AqEnzUvad2Od8fLh4yh20X8G7CVN1EcQCg1Vj1iJQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDX32FACLFqOgpsAg--.14968S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDGryftr1rur1UCr4DArb_yoW8Xw1fpF
	WUJ3Wjgw4kGr1UAF92yw4kJ34rXw1xWw17JFnIgw1vkF90gF4ayFWfKayI9a95Cr97Wr17
	Xa1UKFZxuF15Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gEZ42qxCEGdsQAA3v



在 2026/9/21 14:17, Namjae Jeon 写道:
> On Sun, Sep 20, 2026 at 5:31 PM Baolin Liu <liubaolin12138@163.com> wrote:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> A zero next-entry offset terminates an EA list. Appending an entry
>> without linking the old tail makes the new entry unreachable. Invalid
>> entries are also treated as missing names, allowing setters to proceed
>> on corrupt metadata.
>>
>> Validate the entire chain before modifying it and connect a zero tail
>> to the append position. Check name terminators and retain the full tail
>> span when removing an entry. Return EUCLEAN for malformed EA structures
>> and inconsistent information lengths, preserving that error through the
>> get and set paths. Keep ENOENT for a missing name and translate it to
>> ENODATA only at the xattr read boundary. Preserve lower-level read errors.
> Could ntfs_listxattr() reuse the same chain validation and return
> -EUCLEAN for malformed EA structures? And you can send only this patch
> for v3.
> Thanks.

Hi Namjae,

   Thanks for your feedback. I've updated ntfs_listxattr() to reuse the 
full-chain validation and return -EUCLEAN for malformed EA 
structures,while preserving lower-level read errors.
   I've submitted only this revised patch as v3, as requested. I 
verified that patches 3-10 of v2 still apply cleanly without 
modification, and completed build checks and QEMU tests covering normal 
and malformed EA lists.

Please see:
   "[PATCH v3 02/10] ntfs: validate EA chains and link zero-terminated 
tails"

Thanks,
Baolin.

