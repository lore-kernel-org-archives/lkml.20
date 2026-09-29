Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A31C3F0C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691508; cv=none; b=W5WE7b22McfqXvVjtIRey11xtoCAiFf8c5t1Wa1VtSifSK1hYk/b61KATxWzJBqS4DqY1QRbegAB6dtXBDEizNRgq/eCqwXLpVwrR+jnav6kRZ4Id4Mqv7iaqzCYBqLPnTUuFtvY+q8P6nPt8+lAur4m3E47UqvZ0Xomw2ju2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691508; c=relaxed/simple;
	bh=5gvFEqbkiiTA7FQivxZyuIoOZ8BI2pX49LbcCYDPnVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmUkC/d1xuxrIfStlUE+spPp1LSZoUZixvFX+r9u4wKxYzonCJlouYctH5S1jVKYjOoimZ0oFwdi/w7siZ9Bo/TK6h/KIz10YbFI9bZJ3uVg0vu7qLS5wHeNshaurZ+1BlBOP2k9s6ET/HqplHT3C3x1iNQ0K58ev65FaypEQAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBJ23xMd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBJ23xMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790691506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbXDTdZnaMARV0PaqG68M0h00pQ3SsjxJmf4zOowgA4=;
	b=CBJ23xMdQo8bc38di2tTw9U6gvu6mi584ndVh+mXCaiiK0xcyU4jDF+VHxVcvJbzrKqTaf
	9VHuX2HCS3jLDLaOmJvsug99vfq5AlHF6W39xWkQcQ+JygYsy14DeOUPHGIfD7UtJwBVM6
	X99fB5DhbRhPBAK5A7iZbuWHAxYg+nc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-QdiBsB7aOMuLbJIHVD20Sg-1; Tue, 29 Sep 2026 10:18:24 -0400
X-MC-Unique: QdiBsB7aOMuLbJIHVD20Sg-1
X-Mimecast-MFC-AGG-ID: QdiBsB7aOMuLbJIHVD20Sg_1790691504
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c7d1c402dso322570585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691504; x=1791296304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbXDTdZnaMARV0PaqG68M0h00pQ3SsjxJmf4zOowgA4=;
        b=AnQylUOXlSWhApm5onqqeun1yeql4/wOviyINdn/82lKVBI17qsheQzif/bi42GXbD
         JLqXP0+b2raSILQ7DdqaXGHTWFFjSTWFX+y1GAgJlWPNw4AgOn82XrHIvOvlWaPVcBIA
         h2b5p3S9nydvfC1dW2ff1mscotfoqO70OPePenrG2S0EUavJDJ3IQpGJVrlD77omxNZZ
         vTRfwf2w5DRcUHWW1BtyJAWj4mnJbLL80fQFrnCiVJ2lpfVZQHVbQwTz3x3507NDzcPF
         xQl/qgVpUlsv04NFMT3uqAbV5nGrD6Q4tVrDbsW8Hk9Xw0rvSrUaXiREE3pOFsy9rmsC
         +AHA==
X-Forwarded-Encrypted: i=1; AKwUvBz/WMtoPHhz1DN5WjDgj1JDd/fWKXJhztJGuixjuo5zyhMRAASyUSbxFEZPf7pUyKdPtXs7Y038/n0gmxU=@vger.kernel.org
X-Gm-Message-State: AFuF++m105GhIEm/1+Qzj0nTBH/AaUDOKXlN4ityPw33k/vNOD8A3tf2
	gFRFBmarz2nod5/2Avjn9szNa2kbSz1D1GFs8cH/zpKGduuF8ix7XFY929oIhtj7xX0BMh73Q4u
	pRlLMqC7hhYmWHpwWXonGhYAxo3wUisnWmGAfo/3c+sAVKTE7cpTREuMM2MMDVDBNfA==
X-Gm-Gg: AYBFou2bjahCfVhu+juJeV1tng0HNT4hdFMB9kueCIwsq6hItxtNpEfqW1j6TlwtqTf
	Tcni+y/K03hMkQnKuTfV0ZDu1MFI+MhXCsSfJAHtz3g+PjLwYh6AJwZvYkEt04kWOakGASmnI8v
	4KfWPIKlbJP4yJ1kgR48J+ZURB4+LovfFMruCuTPJgC/1jC7HpCtuX4fbZ1qhUOJFZGzkRnJ+Z3
	ug+sxZnWvAPXz+J3ts4U9ksdAaNGPylosyPeu1G4HZ8t4hTcRwp2HEOs0QVnHT8JbylGR6y8N9b
	kVIGno/g5VkBGwvQ6sFi0Gn/PcnViATVcZBk7TvBREfLaEhdEQf/zumni6EeW0rAfY1B1eLaNdu
	QZAI=
X-Received: by 2002:a05:620a:404c:b0:939:31b5:4e08 with SMTP id af79cd13be357-93c439c33fbmr2664003085a.0.1790691503787;
        Tue, 29 Sep 2026 07:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:939:31b5:4e08 with SMTP id af79cd13be357-93c439c33fbmr2663993785a.0.1790691503101;
        Tue, 29 Sep 2026 07:18:23 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813a4587sm400548285a.7.2026.09.29.07.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:18:22 -0700 (PDT)
Message-ID: <cd4c16d1-d23e-4321-8f2a-6754294b74b1@redhat.com>
Date: Tue, 29 Sep 2026 10:18:21 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6.18.y v2] selftests/mm: hugepage-mremap: fix mapping
 alignment
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: rppt@kernel.org, sayalip@linux.ibm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260928130916.231112-1-luizcap@redhat.com>
 <2026-09-28-2-daily-reply-0006-re-hugepage-mremap-alignment-6-18-v3@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <2026-09-28-2-daily-reply-0006-re-hugepage-mremap-alignment-6-18-v3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/28/26 6:39 PM, Sasha Levin wrote:
>> commit a914785f6349da754e1226420bf4e51961956769 upstream.
> 
> a914785f6349 ("selftests/mm: hugetlb-mremap: add setup of HugeTLB pages") is
> Mike's commit, but this patch has you as the author with only your
> Signed-off-by. Could you send a v3 that keeps Mike as the author with his
> Signed-off-by, followed by yours, or otherwise makes the provenance explicit?
> 
> The same applies to the 6.12.y posting.

My intent was to explain what was being fixed and why and, as it's a
partial backport, I decided to author the change. But I'm keeping Mike's
original changelog & authorship now, can you review it before I post?
Note that the subject will change as a result.

"""
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Mon, 11 May 2026 19:28:25 +0300
Subject: [PATCH v6.18.y v3] selftests/mm: hugetlb-mremap: add setup of HugeTLB pages

commit a914785f6349da754e1226420bf4e51961956769 upstream.

hugetlb-mremap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Link: https://lore.kernel.org/20260511162840.375890-42-rppt@kernel.org
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <baohua@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Liam Howlett <liam@infradead.org>
Cc: Li Wang <li.wang@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

[ Backport-notes: this is a partial backport containing only the aligning
of 'length' to the hugepage size. The hugepage_settings.h include line and
the hugetlb_setup_default() call are omitted. Without this fix, the
uffd_register() call always fails on arm64 with 64K base pages and 512 MiB
default HugeTLB page size causing the test to fail with the error below as
'length' is 10 MiB and not aligned to the HugeTLB page size.

   # -------------------------
   # running ./hugepage-mremap
   # -------------------------
   # TAP version 13
   # 1..1
   # # Map haddr: Returned address is 0x7eaa40000000
   # # Map daddr: Returned address is 0x7daa40000000
   # # Map vaddr: Returned address is 0x7faa40000000
   # Bail out! ioctl-UFFDIO_REGISTER: Invalid argument
   # # Planned tests != run tests (1 != 0)
   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
   # [FAIL]
   not ok 1 hugepage-mremap # exit=1
   # NOTE: These hugetlb tests provide minimal coverage.  Use
   #       https://github.com/libhugetlbfs/libhugetlbfs.git for
   #       hugetlb regression testing.
   # SKIP ./uffd-wp-mremap
]
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
"""

