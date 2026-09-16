Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E43546DE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526470; cv=none; b=SZGbn6LdtNZpVQ1T1bnyRsAfJLWFcAU7skiTs+UbOiLQXNbsU1CILjK5rkRRqjGWEfJXZ2A0GQmix4xG9KRREaJKUWWqmnVFTrzXtAJ9TEEDIutbe34pTbcPG0XRaxHFvCKZ33fMqq38WoRlzDVV2L7MOHvzpAMugPT6RaWKPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526470; c=relaxed/simple;
	bh=r1K3qA+7Rtrk9ghTGzqfQFIldO5MkrvMPOQG02U67bQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YYCGNyjBPDvfE0TxuRZDA4xquEG9X+4aFHCkQfDbq8JXNTruX7ZbEEChEQ4rX6czYy792V/LC+wn2GKAxKHzgQ4aMM/W5bS7kFidKrqKzXdViv6R2OayhkutZq83a9E/YgQJeElyw/qIPj0Y9vPSqMVyyBAbDd2VLDRr0Wv/Ei0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SaN3FB7g; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SaN3FB7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=M4bTji29G+jookEIhIvNuytfYXCohWT5fsNukdnScYA=;
	b=SaN3FB7gPzM9jgjus5pV9y3yUOGKvLQFT9tTNb5cIB5Ql9lIl1jA17n3NUY18L
	erJSYJSF8ohuhViHmQW+9QnGyrBgYjxsLe5ln5P6ToWU+Ckje7+SFAY4B/pyOLMX
	RDzS4sNcSpkXQOSANKlQyLnn/ZurRqu0iPkzZj/H5Trj4=
Received: from [IPV6:2409:8900:21a7:a33a:bd6a:dd8e:75d1:52ed] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHYwOkAapq3evASw--.1800S2;
	Wed, 16 Sep 2026 10:40:38 +0800 (CST)
Message-ID: <e98a2a00-2e37-4c40-a534-81061c0520ef@163.com>
Date: Wed, 16 Sep 2026 10:40:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ntfs: report filesystem errors through fsnotify
From: liubaolin <liubaolin12138@163.com>
To: linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
Content-Language: en-US
In-Reply-To: <20260916022345.1151836-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHYwOkAapq3evASw--.1800S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryfAr4DWFyxuw15JF1kXwb_yoW5GFWxpF
	93JwsxGw1kKry2qr9a93yjq3WF9a95G3yjgrnIq3yxCr1UCF17tF4rt3W09FyrurySg34U
	Xw1UWrnxCryYyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U45lnUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gaueWqqAaaBswAA3u



在 2026/9/16 10:23, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> Report NTFS metadata and shutdown errors through the generic filesystem
> error notification infrastructure. Use volume-level events when no
> affected file is available and file-level events when an inode identifies
> the failure.
> 
> Split the reporting by allocation, attribute, inode, MFT, and shutdown
> domains. Propagate reporting state through attribute searches,
> mapping-pairs updates, and MFT mappings so callers do not emit duplicate
> events.
> 
> Changes since v1:
> - Restrict patch 1 to the volume helper and non-file allocation rollbacks.
> - Introduce the file helper with attribute reporting in patch 2.
> - Separate inode and MFT reporting into patches 3 and 4.
> - Adapt MFT writeback reporting to the current asynchronous I/O path.
> - Keep shutdown reporting independent in patch 5.
> 
> Testing:
> - Built fs/ntfs with W=1 after each patch.
> - Booted the patched kernel in QEMU and monitored FAN_FS_ERROR events on
>    an NTFS volume with fanotify. Verified that volume metadata errors report
>    EIO without a valid file handle, file metadata errors report EIO with a
>    valid FID, and shutdown errors report ESHUTDOWN.
> 
> Baolin Liu (5):
>    ntfs: report allocation metadata errors to fsnotify
>    ntfs: report attribute errors to fsnotify
>    ntfs: report inode metadata errors to fsnotify
>    ntfs: report MFT errors to fsnotify
>    ntfs: report shutdown errors to fsnotify
> 
>   fs/ntfs/attrib.c   |  88 +++++++++++-----
>   fs/ntfs/attrib.h   |   6 ++
>   fs/ntfs/attrlist.c |  16 +--
>   fs/ntfs/bitmap.c   |   2 +-
>   fs/ntfs/inode.c    |  62 +++++++----
>   fs/ntfs/lcnalloc.c |   4 +-
>   fs/ntfs/logfile.c  |   2 +-
>   fs/ntfs/mft.c      | 252 ++++++++++++++++++++++++++++++---------------
>   fs/ntfs/mft.h      |   6 ++
>   fs/ntfs/super.c    |  27 ++++-
>   fs/ntfs/volume.h   |   4 +
>   11 files changed, 329 insertions(+), 140 deletions(-)
> 

Hi Namjae and Hyunchul,

   Thank you, Hyunchul, for reviewing the v1 patch series and providing 
helpful feedback.

   Based on your comments, I reorganized the series for v2. Patch 1 now 
contains only the volume-level helper and non-file allocation metadata 
errors. The file-level helper is introduced in patch 2, and file-related 
error reporting is split among the attribute, inode, and MFT patches. 
Shutdown reporting remains separate in patch 5. I also expanded the 
commit messages and tested the notifications with fanotify in QEMU.

   I have now submitted the v2 patch series. Your review and any further 
discussion would be very welcome. I look forward to hearing your 
comments and suggestions.

Thanks,
Baolin.

