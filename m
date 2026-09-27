Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8343EE1EA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514441; cv=none; b=C+n0HQb63e/wBo44AOnUqFkIDQ5o+mmB009ynsSi7cspF7N4THDjpvnPugx3g3NzesP/mRzt+w8iP1sXGbdCOonZaSeXWlwrHojb6NKuD+ZhddT6mcZJPk5NR3tBf+ZCNYKxgmXTCuCxXUBXbloYwqHDQ3pA1OS3pLfoU9ulcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514441; c=relaxed/simple;
	bh=h7EyZ6ondBhsjAzfJeVCoPSevYU5WBM/L8a3d5KYL50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjSJxfWisPNQ+9ubyJFym71LSawi03yTksKpLnS0UNRLV+bJsgOOITHlOnNHdu1rov6znK2k+CT5uAhyq+fq5cGL61ls84sZXriJO2ZECb2lz//k9xioeTXWrKRNMBB5oL9YlQN+oEnBDdXJ6o7lfF18lz2KXbO9qphwdawl5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qM5qjiAF; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qM5qjiAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nJprDaPp0Q7y0vJ393VOXwCA6lIV5UlOiphyQi69t00=;
	b=qM5qjiAFNKajjJAoDRQU+xvEzzKcXmuk92m6WVJJGj0aXrST7u8sacouFpm2Rb
	51h1qBphu92Li/LWqGqO6uPjYuBEJlSh3Gk1ym3eY79OINyfdPXwqtg9hUGmpmZl
	8ZeObspz2pFzs6qcaYynSwqPo5sq3EsSeEsx5SxX8JtoI=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnT631FLlqApXoBA--.11086S2;
	Sun, 27 Sep 2026 21:07:02 +0800 (CST)
Message-ID: <46ec6087-6509-4ba2-a98b-807dfec5f5c0@163.com>
Date: Sun, 27 Sep 2026 21:07:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs: fix the undo path of $MFT data extension
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260927105706.3111333-1-matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT631FLlqApXoBA--.11086S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7JrWxJr43Ww43XFWDJFyfXrb_yoW8Jry8p3
	9Iy3s8Kr1qqwn2g3ZIya18Kr1Sga1fAw45Grn3Xw1xCr98JFyvqr10kF1Yg3W8trWxGay7
	JrnrJ347uFWDAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uzc_hUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhZLFmq5FPbb7wAA3M



在 2026/9/27 18:57, Matthias Goergens 写道:
> These fix two bugs in the undo path of
> ntfs_mft_data_extend_allocation_nolock().  Patch 1 makes the $MFT
> runlist locking there consistent: a map_mft_record() failure leaks the
> lock, a lookup failure in restore_undo_alloc releases it without holding
> it, and the clusters are freed and the runlist truncated without it.
> Patch 2 fixes a use-after-free of a pointer into the runlist across the
> truncation.
> 
> Both paths only run when something fails while $MFT grows, so I tested
> them in QEMU by forcing each failure once with a debug patch.  The
> debug patch, the test scripts and the images are at
> https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-27-ntfs-mft-extend-undo
> 
> Thanks,
> Matthias
> 
> Matthias Goergens (2):
>    ntfs: balance the $MFT runlist lock in data extension error paths
>    ntfs: do not use a stale runlist pointer when undoing $MFT extension
> 
>   fs/ntfs/mft.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 53 insertions(+), 10 deletions(-)
> 
> 
> base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

