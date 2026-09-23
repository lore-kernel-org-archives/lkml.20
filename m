Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BABE3CEBB9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149058; cv=none; b=Y6SeHDbrFmrIqUHh0YRQGapMs9IzqeHWfMTERJ0ymByGB9IVSDzcKkaBP0z4tc9IGyyNXrGr2ZlMz0Kn+NGYtlZ9RKVXIp350xvla1rB1LGvtCue1dP7wc7YTdtkcZr4TiKaj/81Ybr+HiC6mZxfWBj4oLoD7VzNxGA4RrpqaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149058; c=relaxed/simple;
	bh=Gx1BA9vWWZyB9XgsoHTlWk+aNy2lCCbzV7ql3VWBtVY=;
	h=Cc:Date:In-Reply-To:To:References:Mime-Version:Content-Type:From:
	 Message-Id:Subject; b=cClPYB8Q1THa07iRsZaqeJZ/Ot0SUgR6Yr+Nn1EfoLsBo17haVIiMGqAGSk24MxfmM2Eq/3RcMzj2cpKozhZ5g0FfFXkXGBTOxRj0btfdN+R/0IR4UIvJv2LZqsiho2X+YwGn/Oi3q0n+bxpGgf3dLsc8caA0Ss6mLTsK1DM7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=m2w7lrCm; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="m2w7lrCm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790149039; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YBlfW8eP60PhYp73autqoOChF6Ibeh/Qn5gQHJ0sRlw=;
 b=m2w7lrCmtUG3Ip6qeNEha/+6K69JOrljbzSx5mLUaqgEqUuvKQ9ehKE+qwNLcF/6/g1REx
 2xKloJmIAOc5Kr1IbkNT34tIn8pDz8ZEhO3SarOOs7vENQUZjJGVlDMTQUAYirYDe188Qq
 k++CnXNs5ustxGgsCvMMcRvUkfM7XlG14PhU4JyrLYv8TKRKPrS3zeTHVaYt45XOn6Z0u5
 nQuXYpcN8zI41RmcWxI46TaNfzih9irs1uyEPKwHF+lTvjWPcbSbGOA1K8OTyamqnls4s/
 0um/TfyapCjBnaCuH5cPzDxEbCuSQBLfoPsMV1XKVXPwL/x8DL1j7PPamS6V6A==
Cc: <david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<aiqi.i7@bytedance.com>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Date: Wed, 23 Sep 2026 15:36:13 +0800
In-Reply-To: <20260922190041.d5d983ba6fb1475e40568eea@linux-foundation.org>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
To: "Andrew Morton" <akpm@linux-foundation.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26ab381ad+7ab3af+vger.kernel.org+lizhe.67@bytedance.com>
References: <20260922090749.24905-1-lizhe.67@bytedance.com> <20260922190041.d5d983ba6fb1475e40568eea@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <0c6688d4-7978-43d7-9421-43cfa6230c94@bytedance.com>
Subject: Re: [PATCH v2] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs

On 9/23/26 10:00 AM, Andrew Morton wrote:
> On Tue, 22 Sep 2026 17:07:49 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrot=
e:
>
>> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
>> PMD sharing is possible. That is only needed when huge_pmd_unshare()
>> actually detaches a shared PMD page table, because clearing the PUD
>> invalidates the whole PUD-sized virtual address range.
>>
>> For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
>> a shared mapping can pass the "PMD sharing is possible" range test in
>> adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file has
>> never actually had any shared PMD page tables. KVM then receives a 1G
>> invalidation for a 2M operation and zaps unrelated secondary mappings,
>> so the guest has to fault them back in.
>>
>> Avoid this by remembering, per hugetlbfs inode, whether PMD sharing was
>> ever established for the file. Set the flag when huge_pmd_share()
>> successfully populates a shared PMD table. For the hugetlb unmap paths,
>> skip the conservative PUD-sized notifier expansion while the file has
>> never seen PMD sharing.
>>
>> The state is intentionally sticky and file-wide. Once PMD sharing has
>> ever happened for the file, the unmap paths keep the existing
>> conservative expansion. This avoids the no-sharing case without adding a
>> page-table walk to every unmap.
> Oh.  It's not feasible to figure out when PMD sharing has ended and go
> back to never-seen-sharing state?


Yes, it is feasible.


I did consider a refcount-based approach before sending v2, but my
initial version looked more complicated than I was comfortable with.=C2=A0 =
So
I used the sticky state in v2 to keep the change simple and avoid adding
page-table walks to the unmap path.

After looking at this again, I think the refcounting can be kept
reasonably small.=C2=A0 The updated version uses a per-hugetlbfs-inode
counter for active PMD-sharing attachments.=C2=A0 The counter is incremente=
d
only after huge_pmd_share() successfully installs a shared PMD table, and
is decremented when __huge_pmd_unshare() actually detaches one.

The share side can run concurrently under i_mmap_lock_read(), so the
counter uses atomic operations.=C2=A0 A zero count is used to skip the
PUD-sized notifier expansion only after excluding concurrent PMD sharing
with the mapping write lock.

Sorry for the churn; I will send v3 with this refcounting approach.

>> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
>> improves P99 QPS stability while punching pages, reducing the QPS
>> degradation ratio from 7.09% to 1.45%.
> How realistic is this test?  IOW, how much benefit can people expect to
> see in real-world usage?


This was measured on a KVM workload using hugetlbfs-backed guest memory.

The workload performs policy-driven 2M hugetlbfs unmaps while the guest
keeps running.=C2=A0 The important part is not the policy itself, but that =
a
2M hugetlbfs unmap can currently be reported to KVM as a 1G invalidation
when PMD sharing is only possible, but not actually active.

So the benefit is expected for workloads with secondary MMU users, such
as KVM, that see sub-PUD hugetlbfs unmaps on files without active PMD
sharing.=C2=A0 In that case, avoiding the unnecessary PUD-sized notifier
prevents KVM from zapping unrelated secondary mappings in the same PUD
range.

For workloads without secondary MMU mappings, without sub-PUD hugetlbfs
unmaps, or with active PMD sharing, the patch should mostly preserve the
existing behavior.

>
>> --- a/fs/hugetlbfs/inode.c
>> +++ b/fs/hugetlbfs/inode.c
>> @@ -921,6 +921,9 @@ static struct inode *hugetlbfs_get_inode(struct supe=
r_block *sb,
>>   		simple_inode_init_ts(inode);
>>   		info->resv_map =3D resv_map;
>>   		info->seals =3D F_SEAL_SEAL;
>> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>> +		info->pmd_sharing_seen =3D false;
>> +#endif
> This could use a slightly modified hugetlbfs_set_pmd_sharing_seen() and
> remove the ifdefs.
>
> 	hugetlbfs_set_pmd_sharing_seen(inode, false);


Thanks for pointing this out.=C2=A0 I will fix it in v3.

Thanks,
Zhe

>
> Not very important.
