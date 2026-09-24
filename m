Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F930C16B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215881; cv=none; b=pSgesP6SN40DSDrN04tACsuAIkCWT3y8n0mBWUVhLTxPgqBSa8eZPprGMs88bqOTS2yedkHDVmTYQhPiWc4yppAsQpOYto/5hPohWLDb+UfKzPYznLs5uHzvmM32KJ7sWAp4Hml/rNuyFKvqRV2FFoa6/0znm2ijWaXKgI9PSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215881; c=relaxed/simple;
	bh=Lcya/Ph7NNNPdpppcypcCsE8VfW6DS4oIWcucMkFKeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hm2p/PgA954PkN3g93oknVzoJjMSn8dLcbo4KY7+ehbJwdBJX9h7kHrQlQh4Zwvd6nvUhx2xPUHyEiEAcpx5COrZhWYDii2kANDtlH3G7Fi4FbdZWmH+2Cuo3fD2ED7DkTsJz9nglTT2BnO5PQGZmkBvfarAyb4nbn+PGAreM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AMGfkgfG; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AMGfkgfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S4QSewLEnLIPGbNR6i/Iij/uoo8De3uC7phM0IJwuos=;
	b=AMGfkgfGzTcev4msj15i0RV2kb7rpFzqlpFed002+IMTX7UUOCGOy8P+kltHM4
	6y4RVBw4TcMkl0NZxoE1AJzxcTckDchwqa5UNIBKJrao/nRE5LRxf7gbssBeropw
	cARMgua6qHU8KyMRaIQhTJwx3SVZzGH5CInTpCS0FVS9s=
Received: from [IPV6:2409:8900:1eb0:45e:3c13:fdf5:6f81:b37a] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHfr2lhrRqHsXJAQ--.908S2;
	Thu, 24 Sep 2026 10:10:47 +0800 (CST)
Message-ID: <8a52d6f6-0c16-4ae8-af98-c6eec9167e45@163.com>
Date: Thu, 24 Sep 2026 10:10:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] ntfs: fix MFT bitmap extension allocation
To: Xuewen Wang <wangxuewen@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260924014514.1678828-1-wangxuewen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHfr2lhrRqHsXJAQ--.908S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW5Xw13AFWDKw17uryfJFb_yoWkAFbEgF
	93t348A3srtFnYqa90yrs2yryrK3yDKF12kF1qvrs3Xa4DA3yktwsFyr15KF17CF4UCry5
	Arn0y3WfC34xXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREPl1tUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QeSXWq0hqel7AAA3X



在 2026/9/24 09:45, Xuewen Wang 写道:
> This series fixes four bugs in the MFT bitmap extension path:
> 
>    - The adjacent-cluster candidate can be outside the volume. Check it
>      before accessing $Bitmap and fall back to the regular allocator.
>    - The allocator can return an adjacent cluster that merges with the
>      existing run. Preserve that run when rolling back a failed extension.
>    - Rollback can wait for the initial $Bitmap scan while holding a folio
>      the scanner needs. Wait for the scan before starting the allocation.
>    - Direct allocation changes $Bitmap without updating the cached free
>      counts. Update both counts and honor per-page accounting and space
>      reserved for delayed allocation.
> 
> Xuewen Wang (4):
>    ntfs: bound the adjacent cluster in MFT bitmap extension
>    ntfs: fix rollback after MFT bitmap run coalescing
>    ntfs: wait for the bitmap scan before MFT bitmap extension
>    ntfs: account for direct MFT bitmap cluster allocation
> 
>   fs/ntfs/mft.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 

The series looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

