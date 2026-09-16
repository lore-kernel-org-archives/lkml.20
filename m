Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF6469838
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594628; cv=none; b=FJEDDI3CLEy/NR65s6uc2nRtAUqTPGxJchRK1T4fyQRaBwkC+Al3qqQCOCkzplZY0qrK7a5HRj2hSeLbPJlFr4XdignAHIhoREmmnfrAOWXGS3D0ztAIkSngkAq28G0K9HR5pCYzljAtk2g6nTn4yvVka8++Gs8rToNtEhyvA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594628; c=relaxed/simple;
	bh=PxdfU+Dz3DRINCwhFDnbHX2btVncim5IdyZceKPMudg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDa8gObjDGbzFMj2B4TCQyPqkOsqWArTOv+rmQCVDRNY+GKY4mU4kmdDNPDN4X9Dku153iqWP5sC9jXY8UGapDFAMWI4gt7aCEMuKCBv3djDigOS9A6Kil/djydLiWly9jTaN2K5DU0ZVPkH40W2yehLK+ovGkuVu1DgMbkACh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m5+cM8Rh; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m5+cM8Rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=eIzom9l75Ckl1oIs1hZ3G1vv0VhWavRdQ2NBh6zd7RU=;
	b=m5+cM8RhkhvHnCW238m7jg5ZoEVF5hYMMBWrTOEphS7hCIRWQ+Vzb5tEKnSasP
	DbgD70MNpHzGToYr5vadygXSEqCYQiT9bsCbd6vMqfJYWL8z7NsM2wdAkGDpUuPN
	cgdveayaoGFWLT/+TRv+eXxVRaoYlUPW4FFqJ7GL9eA7U=
Received: from [IPV6:2409:8900:21a7:a33a:b45d:31d1:c098:7d46] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnut7PC6tqo9NTBA--.34434S2;
	Thu, 17 Sep 2026 05:36:16 +0800 (CST)
Message-ID: <2a0a1afd-250b-4e8c-9356-3e98e71aa46b@163.com>
Date: Thu, 17 Sep 2026 05:36:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/7] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhongling0719@126.com
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260915083252.812126-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnut7PC6tqo9NTBA--.34434S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFW3uFWDZw1xuF15XF47Jwb_yoW5XF4xpr
	ZIyrnxGr4DA34IvwnI93y8Xa4S93s3Aa15Wry7J34Ivw1rGr18XF45t3W8Xa4vkrykJw10
	qF4jg345W3WDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UF0PhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hB8R2qrC9Az0wAA37


After several rounds of review and Hongling's revisions, I think the 
series is now in good shape.

For the whole series:
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

在 2026/9/15 16:32, Hongling Zeng 写道:
> Hi all,
> 
> The fs/ntfs runtime metadata-corruption paths only record the in-memory
> NVolErrors() flag, and the dirty-bit persistence used to race with
> ntfs_sync_fs(): a volume could end up with a clean on-disk dirty flag
> despite modification or recorded corruption, so chkdsk would not run on
> the next mount.  This series fixes that.
> 
>     1/6 makes the volume flag read-modify-write atomic under the
>        $Volume mrec_lock;
>     2/6 marks the volume dirty unconditionally on metadata changes,
>        dropping the racy caller-side checks in file.c and namei.c;
>     3/6 derives the on-disk dirty bit from the recorded error state at
>        the persistence points (sync_fs, remount-ro, put_super) and never
>        writes a hibernated volume;
>     4/6 persists the dirty state after the final put_super() commits so
>        late errors cannot unmount clean;
>     5/6 stops ntfs_sync_fs() from clearing VOLUME_IS_DIRTY: the clearing
>        moves to the quiescent transitions, a recorded error state is
>        still persisted at sync time, and sync now reports writeback and
>        flush errors instead of discarding them;
>     6/6 checks the dirty-state commit on remount and unmount.
>     7/7 ntfs: fail remount on sync errors and keep the dirty bit on
>        SB_FORCE
> 
> Changes in this revision, from the review:
> 
>    - 5/6: with the clearing gone from the sync path, a recorded error
>      state is persisted without ever clearing the bit, and
>      sync_blockdev() and blkdev_issue_flush() are both called with the
>      first error returned.
> 
>    - The IOCB_NOWAIT behavior and the per-operation $Volume mrec_lock
>      acquisition are outside the scope of this series.  The series keeps
>      the unconditional ntfs_set_volume_flags() call to preserve the
>      ordering that marks the volume dirty before the metadata
>      modification; a RWF_NOWAIT write still blocks in the marking when
>      the volume looks clean, as it already did on the base.  The
>      non-blocking and contended-lock handling (mutex_trylock, GFP_NOWAIT)
>      will be addressed in a separate follow-up patch.
> 
> Hongling Zeng (4):
>    ntfs: fix volume flag update races
>    ntfs: set the volume dirty bit unconditionally on metadata changes
>    ntfs: sync the volume dirty bit with the recorded error state
>    ntfs: persist the dirty state after the final put_super() commits
> 
>   fs/ntfs/file.c   |  20 ++---
>   fs/ntfs/namei.c  |  24 ++----
>   fs/ntfs/ntfs.h   |   1 -
>   fs/ntfs/super.c  | 191 ++++++++++++++++++++++++++++++++++++-----------
>   fs/ntfs/volume.h |   4 +
>   5 files changed, 171 insertions(+), 69 deletions(-)
> 

