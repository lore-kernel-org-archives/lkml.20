Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6784F41F37D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532717; cv=none; b=NUhNAdqK+7fOhTfAj311Yc5K1v44AfN4be4Elx+KLE8WmNBx4ZqprH1PiglTgtoUByfh9adBV3DOmmG78RG2TTFLTDPfPPS/dyYLnzEEguDNOHwObxkCwwIylpp1h4n0QV+Nl6/q6X+eNpqxXyeYDrh2LlHQ2c0tB8viQeyfebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532717; c=relaxed/simple;
	bh=CR4jBLPm2g14+zRan08kO2W29O9nAP/iVhyuzBG/OPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGS74hWtyV0FwdsLW8ykDu2x3xjeRxk3t0GLzTcGIwFJKkO+8f3SvU+4WZYLCHdQ42RjOOkVyptiORdr06g9ooiSnGfqlHIXUEfDxtFvs4hk58PDjLZzpucQ12BFUVqthe/FcjpRR+ZmDzQ4/+ja8YGWnj1XqylDO81Qf0EUQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YBa7Kft3; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YBa7Kft3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3S6Pt1yE85lle/nGVa01hdLY3n4t/Uq67vs6BjkSTtg=;
	b=YBa7Kft3e5u9zDioqS/vTRSOpd50xDNOZgFah6sVfnOOgk+jS9nhfiFNoZpThA
	IYYKPRurN1bc0Ic1Yx+eSsfAoBqAsYQCIxd50Bx5Gz5BlpPt3nwZNe3eSMMrUzGA
	EdK3d9KEvUQrycz5v2F6uFxPPFttuwCQ06E0tc7bX80bQ=
Received: from [IPV6:2409:8949:6ca0:7910:556a:2884:1c35:3923] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3HzpSXLlqNZG_BA--.29966S2;
	Mon, 28 Sep 2026 02:11:31 +0800 (CST)
Message-ID: <bb318604-ac0e-47a2-9ee9-f69e69be0aee@163.com>
Date: Mon, 28 Sep 2026 02:11:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ntfs: do not refuse fallocate() when the MFT zone is
 empty
To: Matthias Goergens <matthias.goergens@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1790503811.git.matthias.goergens@gmail.com>
 <77d2e237e1c2ded042f8220350fd92cce5f502e7.1790503811.git.matthias.goergens@gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <77d2e237e1c2ded042f8220350fd92cce5f502e7.1790503811.git.matthias.goergens@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3HzpSXLlqNZG_BA--.29966S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWrGFWkuryrCrW7uF1UAwb_yoW8Wryxpr
	Zayw4YywsFqr1DKFsrWws0qF1Yq3y2grWUWa1kXw17CF93tr1kKFsYyF4kWrWIy3s7Gr1U
	JFyUJF17W3s0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2ksgUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhM0-mq5XFPe6QAA3w



在 2026/9/27 18:57, Matthias Goergens 写道:
> ntfs_fallocate() fails with -ENOSPC whenever the MFT zone has shrunk to
> nothing.  The cluster allocator gives the MFT zone up when it cannot
> find free clusters elsewhere, and nothing restores it before the next
> mount, so after one such failure every fallocate() on the volume fails
> with ENOSPC, punching holes included, however much space is freed.  The
> allocator failure fixed by the previous patch was enough to get there:
> afterwards a one-cluster fallocate() failed with ENOSPC while 123 MiB of
> the 128 MiB volume were free.
> 
> write() and truncate() do not look at the MFT zone, and
> ntfs_allocate_range() already fails with -ENOSPC when too few clusters
> are free.  Remove the check.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
>   fs/ntfs/file.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 3ec82715a5882..762045d262963 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1163,9 +1163,6 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
>   	if (!NVolFreeClusterKnown(vol))
>   		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
>   
> -	if ((ni->vol->mft_zone_end - ni->vol->mft_zone_start) == 0)
> -		return -ENOSPC;
> -
>   	if (NInoNonResident(ni) && !NInoFullyMapped(ni)) {
>   		down_write(&ni->runlist.lock);
>   		err = ntfs_attr_map_whole_runlist(ni);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

