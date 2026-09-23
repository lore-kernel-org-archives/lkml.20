Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E2D414A17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170340; cv=none; b=ODscmJevXFm5/DiriKk8Mb2AP9/KCpohCR1kHnrDPQu3EB3uMOZQUYYLEPjwbGz4PZJPwouTcXZyrGzGrHSth6gNz63Blbk9dzrp3dxkiCyx4F1T1pwJWnWgwpwdcTyQxP7qjXEUWzM+P8rqBhbrGaYuraJy9CiyWzb2gjSiEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170340; c=relaxed/simple;
	bh=rxJ0+PdQtJDNjawn0M3k3EfnLQE1Ec58hUkxw9L+9eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhGtzi6MnbeSGbbpzvtLvv4l8t54LR2UB+/ReIJHTf13GCnR2yP+nCRCi35UHX82rZAst5kMryFXQ7WsW2SE/2arY569AIeN+pcquJl8XHY6JUS4S2EM5+IBFqo3RYyKm9Rr8zaZRffrEN01tiB6TT7Cn7PrsYhA0GAf891fSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SupJnGT2; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SupJnGT2"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c796e3aso300779241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170337; x=1790775137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NG4JXegZ//HjY70YRieR3wxtkpzy8rT/C0WH6S4BaKE=;
        b=SupJnGT2g8GDL+NcHXE0GrL75UrTOlMvFZED8eENReUJYL2V3SeIJcn+YJcJc5OD21
         Y9edC2s1rshDqAvjHudoNzJSI9heLVm5n/kK/tohIa6DlX31olOHKnR+fBXlXl4Jwh1b
         OfvihyndBxeVba4NF+ErkzAU3o/0FAWea1QTw/nHM7cUCFGZYuu24gi+UzdRp4Apifci
         jgk4pyIfR4FtaI5G7KFDQ1eFLMZtEfj2mDa9+2t8ON+zU6gvm6f669BGApuIsvlbIRdZ
         ZGnrI9ihHy1a4QSn8bg9m9GBnFnYQIOdPNptSjIuEPqc5Dd3ulPdPVhLmEvvI+B5/P7f
         zSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170337; x=1790775137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NG4JXegZ//HjY70YRieR3wxtkpzy8rT/C0WH6S4BaKE=;
        b=VulM18FdAKC4yWfBugc4RZ8ZBYhP5Bo56TPC9mosDEsAy5/NogswRsXvQ+yuTSeH01
         H77clb4xCFqk6XuMzJ2m1WHmx9Myt/7S7MMDq0tUxVwNimJKKvNz70LdAL/CqKnbnXH5
         ZUbPK8rvUqcfCyvvEpaEsjCuyw8FeCwuXBZgteAnnz+Q4k+AvochrLjIhE4w20E6UpEX
         RIynk+iGFxK7SYZTd15pgAnfYNEWtjSzNYhx/t6y3Ip1C+DlUzSm7sbWHF4Sg65wYcxD
         9d0IY0h5KCRT+RdC+F3C+d/iuZv5TGVUnElpvIGqpeKS7ZV4GUQ3mTM8UxCSf3ttiFym
         MxCg==
X-Forwarded-Encrypted: i=1; AKwUvByv6fO9lLBqSbAzRmvsrdrU+/0DbbScxkc03cQcY213ADq5ijvLmQe4DrzyDYVo1wTMKq6dP+imDtd7CrE=@vger.kernel.org
X-Gm-Message-State: AFuF++mRM5CSvYVOQe5wxJ66RpBRfbkF5gu5G19rpu8LMUvy+c3fAXYZ
	MgvPdUmwz9yckfVR92VRCXCcnM3qCnGD3yuSXTIpr3HEUTt3JP3Ytbgp
X-Gm-Gg: AYBFou2PBxJdogjfUQNbQJ5jk80woM6CrqrrLiFaNL7/l0zrI/3tbatnaktG0Ok7/Ff
	bHZ5Idt997RWQ3eldzV3dXLqZbeMzW6r4F8Jcjn19EcVbZx+9UhXnLtoWG+pM4XB4yrB4Zlaa2g
	FDTTSZeSu3JIlyJgcpeEUuJdowWblR546NCzRcfujmIbr56nEAeRaCshnKF90+vk+oOQQzis/5l
	ppzltM/URDt6ilZGd4ZOlljxs2ryl34tc5WneAeKMt8hoABiu1gUb5XjC879bm2OJMX5xjTJ7UW
	L+A8QYeBxhnGPVh9NsMeVDhLi/x/6MBk5u1dtdPFlpM+nvFThZ9T7er69O6a4dpKHSdcEaLr4/J
	qu2AR/2cikDVnFm+6ZEwxQr7sCcOipO/oSG8L8+EZjD6+2biGFuD0AtOgZ8YdI3IKeQvh30/p3S
	+qLFLAE1uidaAZU9b6zTn7MEqbiwa+JAHr1XzbagsweUPxm2B0O2AnaX1YcGrpMALLmHE4X+dEm
	Te0Ij8TN6b1ezTxiTs=
X-Received: by 2002:a05:6102:38c7:b0:7a8:1ff8:5741 with SMTP id ada2fe7eead31-7ac1b610a6fmr2117008137.10.1790170337260;
        Wed, 23 Sep 2026 06:32:17 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851e8c4f2csm922107241.10.2026.09.23.06.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:32:16 -0700 (PDT)
Message-ID: <4277af28-222b-49de-9372-4087f1a7e942@gmail.com>
Date: Wed, 23 Sep 2026 21:31:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] mm/truncate: fix data loss when truncating
 straddling large folios
To: Brian Foster <bfoster@redhat.com>, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hughd@google.com, baolin.wang@linux.alibaba.com,
 willy@infradead.org, jack@suse.cz, ziy@nvidia.com, joannelkoong@gmail.com,
 djwong@kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 chengzhihao1@huawei.com, wangkefeng.wang@huawei.com, yukuai@fnnas.com
References: <20260922110703.468389-1-yi.zhang@huaweicloud.com>
 <arKHDqdDkQajvAk6@bfoster>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <arKHDqdDkQajvAk6@bfoster>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/2026 9:47 PM, Brian Foster wrote:
> On Tue, Sep 22, 2026 at 07:06:59PM +0800, Zhang Yi wrote:
>> From: Zhang Yi <yi.zhang@huawei.com>
>>
>> Hello,
>>
>> This is the fourth version fixing data loss when truncating straddling
>> large folios caught on the upcomming ext4 + iomap buffered I/O
>> conversion.
>>
>> When truncate_inode_pages_range() punches a hole or truncates a file,
>> truncate_inode_partial_folio() splits a large folio so that the caller
>> can drop the in-range sub-folios while keeping the out-of-range tail
>> intact.  This series fixes three distinct problems in that path that
>> can each lose the valid out-of-range tail of a straddling folio, plus a
>> follow-up that clarifies the return value semantics.
>>
>> Patch 01 aligns the truncation boundaries inwards to the mapping minimum
>> folio order in truncate_inode_pages_range().  With a non-zero min_order,
>> folio_split() stops at min_order instead of order 0, so a boundary
>> computed at page granularity can land inside a min-order-aligned
>> sub-folio and the truncate loop drops that whole chunk, valid tail
>> included, causing data loss.
>>
>> Patch 02 looks the end-edge straddler up by its page index through
>> __filemap_get_folio() in truncate_inode_partial_folio().  After the
>> first split the straddler is unlocked and only transiently ref'd in the
>> page cache, so the page pointer derived from the original folio can be
>> freed and reallocated as a different folio in the same mapping, and the
>> mapping check cannot catch it, which may cause incorrect splitting and
>> potential data loss.
>>
>> Patch 03 reworks the contract between truncate_inode_partial_folio() and
>> its callers.  If the second split of the straddler fails, the function
>> reported success unconditionally, and the leftover incorrect end
>> position could cause the truncate loop to drop that valid tail.  After
>> rework, it tells the caller the exact page range safe to discard via new
>> pstart/pend out-parameters, so the truncate loop never touches a
>> straddling folio that still holds valid out-of-range data.
>>
>> Patch 04 clarifies the return value semantics to "at least one split
>> succeeded", which is all the shmem caller needs to decide whether to
>> reset its scan loop.
>>
>>
>> The second patch fixes a pre-existing race issue that is reachable
>> today, so it is Cc'd to stable.  Patches 01 and 03 require a dirty large
>> folio that carries no filesystem private data, so they are not reachable
>> on current filesystems.  They were found while developing the upcoming
>> ext4 iomap buffered I/O path[1].
>>
>> Thanks,
>> Yi.
>>
> 
> Hi Yi,
> 
> Modulo Jan's comment on patch 4, this series looks good to me. FWIW:
> 
> Reviewed-by: Brian Foster <bfoster@redhat.com>
> 
> Brian

Thank you for the review!

Yi.

> 
>> [1] https://lore.kernel.org/linux-fsdevel/a638a8fb-c184-4069-ae33-379ec12cd514@huaweicloud.com/
>>
>>
>> v3->v4:
>>   - Move the patch that fixes data loss when min_order is non-zero to the
>>     first patch position, aligning start and end in
>>     truncate_inode_pages_range(). (Zi Yan)
>>   - Add patch 2, fixing the invalid folio2 issue under concurrency when
>>     truncate_inode_partial_folio() splits at the end position. Use
>>     __filemap_get_folio() to obtain a reliable folio2. (Jan Kara)
>>
>> v2->v3:
>>   - Rework the folio2 validity check logic to fix the invalid
>>     folio->index issue. (sashiko)
>>   - Clarify the pstart and pend setting logic and the corresponding
>>     comments to make it more readable. (Brian, Joanne)
>>   - Split the patch into 3 small patches. (Zi Yan)
>>
>> v1->v2:
>>   - Export pstart as a new parameter so that the generic and shmem
>>     truncate paths don't need to recompute the start value from the
>>     return value. (Brian)
>>   - When min_order is non-zero, align [pstart, pend] to the inner
>>     boundaries of the folio to ensure they do not point into the middle
>>     of a large folio, which could otherwise cause valid data within the
>>     folio to be incorrectly cleared. (Joanne)
>>
>> v3: https://lore.kernel.org/linux-mm/20260916092450.654408-1-yi.zhang@huaweicloud.com/
>> v2: https://lore.kernel.org/linux-mm/20260909062339.473816-1-yi.zhang@huaweicloud.com/
>> v1: https://lore.kernel.org/linux-mm/20260903115018.2034541-1-yi.zhang@huaweicloud.com/
>>
>>
>> Zhang Yi (4):
>>    mm/truncate: align truncation boundaries to mapping minimum folio
>>      order
>>    mm/truncate: look up the end-edge straddler by index
>>    mm/truncate: fix data loss when splitting straddling large folios
>>      fails
>>    mm/truncate: clarify return value of truncate_inode_partial_folio()
>>
>>   mm/internal.h |   4 +-
>>   mm/shmem.c    |  13 ++---
>>   mm/truncate.c | 128 +++++++++++++++++++++++++++++++++-----------------
>>   3 files changed, 91 insertions(+), 54 deletions(-)
>>
>> --
>> 2.54.0
>>
> 

