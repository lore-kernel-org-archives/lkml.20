Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470715;
	b=XUalCiHzrGuIYjc92RuTRik32dFm/vQyDa/cnGQG0on8nBbZAQTq5SbjJNl283RAX/lq
	 Q31//Yvm3o3wrkbNLs9a7/XXAgkXFxvVP/RW7P5AvzSfdvwvei77JSO5g9ghJjSXlVH77
	 AumusvBhtjyDw9IlzAKBg12zb0ZMoyGLOyr/gedoScab5xMPBnF3ljUFLNn5Vt1oHSYyM
	 z4P/9oAQWb03omOMnuk0UqP/HkmXRzc9KgrBINtVl+wAIVywJkG4WOJiqNy2iMM1MbXNU
	 wmXtP/pKzgpeGrPY0QIqPlw/iaUliLip28Yz2oRP+5J4ThiosrAOo2uOoQvcxvInZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470715;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wbKyXXPEsHUw7FHzXJao5FJ2QpebW01qg7WPK2+9SIg=;
	b=5gjxe4BPt/HL0vOR+2oQS/qNbL0oMumOvlBJYp6Fr+vB6v6voK03aRSvM9BPACQLAYqL
	 HbmX2HMKUtvkq5YME6jckNNwuC4Ja10B2slC0kBxgma4kt9BlpiUpoQfe/tQweDKxzdhS
	 IEMh9AgPMp7/SsoEdxbA//HO+J0pfcCl/vk29keBiVOgICZpFWOl1qGVFTklQcQA8yHhm
	 Dqya527W564kcPqCGVQl0J0o2+2U8CgZ6k5O3bsm63yxSXmf93CQl4/6vg3ExGrDjawkt
	 DN/E/1d8Y4Pa34sYDJRUGS76rFV3BiyHB5+blUVyI0GZ6iTs9R1SAD2B6B+5FA65WAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VJF8Geks;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C519606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C519606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VJF8Geks
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794470711; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=wbKyXXPEsHUw7FHzXJao5FJ2QpebW01qg7WPK2+9SIg=;
	b=VJF8GeksOm3uJ1dJQVBgL4A3r8wTUT95NhcQ21yE/nR8TGHVoECHbzoDSmyipi936/hMryZ5vtWU5K31NlLsesQTow8CZktcI0+vrUIVCKik+ZFUmEyupXX+k5oG51zvRmEkXGLQEpAReXdXxH45nts25XWq7E74jXUP2XQFboY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XEbNi01_1794470708;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEbNi01_1794470708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 16:05:09 +0800
Message-ID: <787a1ba3-df93-45f9-abe1-3fcdefbe41cc@linux.alibaba.com>
Date: Thu, 12 Nov 2026 16:05:08 +0800
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
Subject: Re: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Qiliang Yuan <odys.yuan@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/26 11:39 AM, Qiliang Yuan wrote:
> shmem_undo_range() keeps a folio_batch and an array of FOLIO_BATCH_SIZE
> indices on its stack. Removing truncated folios from the page cache in
> batches added a second folio_batch to collect the folios to delete.
> 
> That grows the stack frame by about 200 bytes, past the 1024 byte limit
> of mips eyeq6_defconfig built with clang.
> 
> Pass fbatch itself to delete_from_page_cache_batch() once the swap
> entries are gone, as truncate_inode_pages_range() does. Undoing a failed
> fallocate() only removes the folios that are not uptodate, so remove
> those one at a time with truncate_inode_folio() as before.
> 
> Stack frame of shmem_undo_range() built with clang 18:
> 
>    config                before (bytes)  after (bytes)  change
>    mips eyeq6_defconfig             928            720    -22%
>    x86_64                           920            712    -23%
> 
> Fixes: b97fbd541ecba ("mm/shmem: remove truncated folios from the page cache in batches")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-lkp@intel.com/
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
> David, this applies on top of b97fbd541ecba in shmem-7.5.misc; please
> fold it in if you prefer.
> ---

I think you should send out a complete v2, and David could queue your 
new version.
