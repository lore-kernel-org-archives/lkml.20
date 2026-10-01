Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDFE1A5B9E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823216; cv=none; b=KTdhohew39lE17YhWGKaGBKIokdcJnagR3P8riAgSH1CbEBPBb9lyv3aaK853uHyGBD1sKH7rtSwzYysYysFFDAI6VNOinAjU3LwzSNAHMRsRdCVq4PIH63hdRx132WYVvxENcDCeDMzsg5JG+XAOauOaJdzUclAk1o30+2utS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823216; c=relaxed/simple;
	bh=dqPqmJAL6inzWOfzfxfCyeBecNaPTgS46cs6JJ87kuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Du8lkGOB7zJusI5Zo0DXivAKeqOFf3EsmWL/AvDgoZ2MulPShUFeUzyjshxBdQSxB4yU9Yr5Trcl2Y757ZrFtpWtwOrn5o++phCgCkDhqIZw3eGD2hTMNckO3OvTDzhh8DMtOnGCbLCUxa+xDDccuGswdKnbUmVG0Jwg/K33WRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gJaqdWal; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gJaqdWal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=xzIyxJDw0ySzQZ9vUbRIkXLBKSc23dTDjYRzmHyKxpQ=;
	b=gJaqdWalKLZb9cLlwAVbWgsecZIncaUZofDZIwLiKbwQsaU4X/8LIH2jQw6/Pk
	mjG5wHSBf0Eev3C85d4AnCzFm3jdQ4HgKmizEirCiPgPIRFtC1d8SO/9Pw9x7a7d
	CQsfHUg4op9eoJqXIJ6jJkxT/jLseT7fVCF8sLERDJRdg=
Message-ID: <24c5c9ea-1bfe-44a8-81ad-c2b1588e0a63@163.com>
Date: Thu, 1 Oct 2026 10:52:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] exfat: fix valid_size handling and locking
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, chenxiaosong@chenxiaosong.com, dxdt@dev.snart.me,
 hyc.lee@gmail.com, liubaolin12138@163.com, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260927080305.831641-1-chizhiling@163.com>
 <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3Z9zryr1quXhGCQ--.11933S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFykJFW8uryUZr48JF47Jwb_yoW8urWDpF
	ZYk3W5GayYq340yr4vk3W8Xa4Y9wn3Xr17Gr98t3yUArnI9r1ayry3Kay093y5tws7Kw12
	vr4DtrZ7Zw1DJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeMKtUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9w-3lWq9yu-mkAAA3e

On 9/30/26 6:01 PM, Namjae Jeon wrote:
> On Sun, Sep 27, 2026 at 5:04 PM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> From: Chi Zhiling <chizhiling@kylinos.cn>
>>
>> valid_size marks the on-disk up-to-date region of an exFAT file. It is
>> advanced from the write path, from read/zeroing completion, and via
>> truncate, while it is read without i_rwsem from ->iomap_begin and from bio
>> completion context. This series fixes several races and stale-data windows
>> that follow from that split ownership.
>>
>> Patches 1-2 are self-contained fixes: an append write may be moved to EOF
>> by generic_write_checks(), so valid_size must be advanced using the
>> recalculated position; and exfat_zero_new_range() must mark non-uptodate
>> pages dirty so the whole page is written back.
>>
>> Patches 3-4 are prerequisites for patch 5: truncate now holds the
>> invalidate lock so it is mutually exclusive with mmap writes, and
>> valid_size/zeroed_size become atomic so they can be read safely outside
>> i_rwsem. Patch 5 then takes exfat_page_mkwrite() out from under i_rwsem,
>> since blocking on the inode lock under mmap_lock could deadlock and its
>> VM_FAULT_RETRY result is not honored, and advances valid_size under the
>> folio lock to keep the page cache and valid_size consistent.
>>
>> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde@163.com/T/#t
>>
>> Chi Zhiling (5):
>>    exfat: advance valid_size to EOF for append writes
>>    exfat: dirty all new pages when extending valid_size
>>    exfat: hold the invalidate lock while truncating
>>    exfat: make valid_size and zeroed_size atomic
>>    exfat: use folio lock to protect valid_size
> Could you check the review comments from Sashiko ?
> 
> https://sashiko.dev/#/patchset/20260927080305.831641-1-chizhiling%40163.com

Okay, I’ll take a close look at this review comment.

I also noticed that the comment mentions that concurrent DIO and page 
faults may lead to data corruption. I believe this is a long-standing 
issue, and I don’t currently have a good way to fix it.


Thanks!

