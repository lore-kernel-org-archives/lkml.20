Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAD3E123C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178398; cv=none; b=XQTk9vqOa3Z+OZAbn+YWxEARN7MGe7RZaBIAGZMGQceeME29qQfrJULUEof/c6d4GW1MXJYq0ix6Y0OLPmbNdKJO+p8KzmOs6PeWNma/nqz4H5MqnC/HU6P3ZKU7gH25X5t7VdAKGxqczzNb1XTLYv8PtGFQY4dL5ljMjteVv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178398; c=relaxed/simple;
	bh=PLxxAbrujktGRnRZTWWBERj2ms6HU6jC4w9nfAb5dxM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a/z9dbYdN+YGaAvY6+Z0/BTYjzs1fXiopUmo4ScOrx0ZkjG+TLRE8VMDd9/lBxh7T2HHDWIcpweIYsoPVc0366BSfZbiETzWbI4DKomXqyKu55y6Mrt8unkUrK28LusyeHmH82N2AnlpBmEs6YhTFTljNmwHUOdv5pz1Ikc5ksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gGfYbwOf; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gGfYbwOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:To:
	Content-Type; bh=5akJYmmRXUk88N0xG/Jq0H/5tMkiTfzIxeZ/sqRKUAk=;
	b=gGfYbwOfRXEOpViqrUcm+fyEiDjZGznJv71548gpu2IJy9NiAVrJe21nRxsg9Z
	O6gJTs/izv3YjSmGLkjm3e8lB9TC07rgHLeZMaATrw9+UGyFRXmsgRE2s6db3Jnf
	lLERX+hY936Yl90WBpE1qrExGtwwNIwlGY2Ov2wN/sTLM=
Received: from [198.18.0.1] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnbsuZb5VqDhGmSQ--.62460S2;
	Mon, 31 Aug 2026 20:12:11 +0800 (CST)
Message-ID: <0f10d088-75c9-4287-bc2e-f2def5a9c7de@163.com>
Date: Mon, 31 Aug 2026 20:12:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Longlong Xia <xialonglong2025@163.com>
Subject: Re: [PATCH 0/2] mm/hugetlb: fix surplus accounting and availability
 checks during demotion
To: Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 mike.kravetz@oracle.com, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
References: <20260823034307.1072415-1-xialonglong2025@163.com>
 <20260828161042.de43f4751296883eeca633a6@linux-foundation.org>
In-Reply-To: <20260828161042.de43f4751296883eeca633a6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnbsuZb5VqDhGmSQ--.62460S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury7JrWktry7Gr1UAr4Utwb_yoWrJry5pa
	y5Jw1Ykrs5Ar1jkr4xZ34qkwna9r1fXr45K3ZxJw13t3W3Wr9rKrySy345WFyI9rWfJay0
	qrWUZw1DZ3W5XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UO2-5UUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2xsC+mqVb5tZ9wAA3d


在 2026/8/29 7:10, Andrew Morton 写道:
> On Sun, 23 Aug 2026 11:43:05 +0800 Longlong Xia<xialonglong2025@163.com> wrote:
>
>> This series fixes two problems in the hugetlb demote path.
>>
>> Patch 1 fixes surplus accounting in the source hstate.
>> demote_pool_huge_page() removes every source folio as a persistent
>> folio, but a free folio may instead account for one of the source
>> hstate's surplus pages (for example after a vmemmap restoration
>> failure). Removing such a folio without adjusting surplus_huge_pages
>> makes the persistent count underflow, and later subtracting it from
>> max_huge_pages can underflow that counter as well.
>>
>> Patch 2 fixes an availability overcount in the sysfs demote path. The
>> sysfs trigger checks whether any page is available but then passes the
>> entire request to demote_pool_huge_page(), which can remove free huge
>> pages that back existing reservations. With two free pages and one
>> reservation, a request for two pages removes both and leaves the
>> reservation without a backing page.
> Thanks.  Have you created and tested reproducers for these?  Gemini was
> trivially able to do this for me.
>
> If so, it would be helpful to includes the details in the
> changelogging.

Hi Andrew,

Yes, I created and tested reproducers for both bugs.

Patch 1 requires a vmemmap restoration failure, which is difficult to
trigger deterministically. For that test only, I added a one-shot fault
injection that makes the first attempt to restore the vmemmap of an
optimized 1 GiB folio fail with -ENOMEM. The injection does not modify
the demotion or accounting code, and it is one-shot so that the later
restore performed during demotion can succeed.

Patch 2 is reproducible entirely from userspace and requires no kernel
instrumentation.

Patch 1 (surplus accounting):

   1. Hack the kernel to force the first 1G vmemmap restore to fail:

      /* TEST ONLY: fail the first optimized 1G folio restore. */
      static atomic_t fail_next_1g_restore = ATOMIC_INIT(1);

      ... in __hugetlb_vmemmap_restore_folio():
      if (huge_page_size(h) == SZ_1G &&
          atomic_cmpxchg(&fail_next_1g_restore, 1, 0) == 1) {
              pr_info("TEST ONLY: forcing one 1G vmemmap restore 
failure\n");
              return -ENOMEM;
      }

   2. Boot QEMU with:
      hugepagesz=1G hugepages=0 hugetlb_cma=1G hugetlb_free_vmemmap=on

   3. Enable overcommit:
      echo 1 > 
/sys/kernel/mm/hugepages/hugepages-1048576kB/nr_overcommit_hugepages

   4. Allocate one 1G hugepage:
      nr=1 surplus=1 free=0 resv=0

   5. Unmap it.  Due to the forced restore failure, the folio is left on
      the freelist but still accounted as surplus:
      nr=1 surplus=1 free=1 resv=0

   6. Demote one page:
      echo 1 > /sys/kernel/mm/hugepages/hugepages-1048576kB/demote

      Before fix:
        nr=0 surplus=1 free=0 resv=0
        surplus > nr  (wrong -- surplus not decremented)

      After fix:
        nr=0 surplus=0 free=0 resv=0
        accounts consistent

Patch 2 (cap demotion):

   1. Boot QEMU with:
      hugepagesz=1G hugepages=2
      nr=2 surplus=0 free=2 resv=0

   2. Reserve one 1G page (mmap hugetlbfs, do not touch):
      nr=2 surplus=0 free=2 resv=1

   3. Request demotion of 2 pages:
      echo 2 > /sys/kernel/mm/hugepages/hugepages-1048576kB/demote

      Before fix:
        nr=0 surplus=0 free=0 resv=1
        resv > free  (wrong -- reservation has no backing page)

      After fix:
        nr=1 surplus=0 free=1 resv=1
        resv == free  (correct -- request capped at available=1)

   4. Touch the reserved page and let the process exit:

      Before fix:
        Bus error (core dumped)
      nr=0 surplus=0 free=0 resv=0


      After fix:
        touch: OK (value=0x00)
        nr=1 surplus=0 free=1 resv=0

I'll include these reproducer details in the changelog of the next
version.

Thanks,
Longlong

