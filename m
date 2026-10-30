Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326931;
	b=zek8dhdwl6kxhe2RBLPEtZFDVHmlcUrWRhNTG08gX2rYNY9FGSt0ikYTxfI7Kgbl4qXW
	 y5o0SVSQlCL862QagLV7grNs3p3yYpkhZk0YnOUuQMcT/2yBvN5Q/gtocXZFr4PO727r3
	 yJqoq7mi1JkYT4j0UwIs0fr8Gda9wZYb3lkeRhjXnqd1fOS1I2q7n5aWMrpXriLUUmfwk
	 boKv3dBHNUxLgaUbOaa8MHTIc9ET+dz6q/G66W9HzHifZhS8H+yy61fQ6KAhxVrjA61KO
	 mLT7Tr30ADUyZrpMDJrA/tNa/2gMsoXeWdMoJL5RbX0CYlmmqXy+6XR43moVrxqYLqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326931;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=GuCXOFg/eaPoMDDOQ3AZlcKE9moyp2CTPmKEIesl8bI=;
	b=UvwA6+fk4+SblRCWbOAfRuDWVUVhjb4Viq9vibHtIYN9DHlBtszXjIGsgvogL6hsao7F
	 nwQSdgIzlEtOK+8cOyPXEwyaw3qrqdVoqfHBaHWggr8bNSBX5kQgjDccTn+O2oHDUDwYR
	 qbod1E18lyfsHOiYvJFnsax1Saeydx8wOCOQwmXTFGzCyt21hLrw2nvV4cOGP5mpgyiF5
	 +Jjf7FrjBdgP/fFyFHJGkzKq6Jr2xG5P6seamlQOM5Am/Xcsp90dKm4/aaAKsIF65+N4N
	 jfebIu/U9Fey7R41gIHDwZMiYYNVw7ryw7k3hCyQvY8HNpo9ntuvp89WKKW275YMPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QmZfN2jP;
	arc=none smtp.remote-ip=91.218.175.6
Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C28A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QmZfN2jP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3W7i1+QOf/eQW3A33+hQoH7jzxTnHmjxgFZBOXgW78U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793326927; v=1; x=1793931727;
 b=QmZfN2jP4dUxZiSnaSdskWPARHinFT7ZQjige5i32RhnTdt4N/azDq2U0wo/Qo+edWEqH/dr
 wTcZ9xnxq0+TcBW1ZiGbvdN0hfQwM6QskzlG829WFPm+f6byXk7j16RBEoGB9JMu9iSQCdQdntl
 jbux+ZLv64nT6pKsqXoD95M4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bb3320411df55916;
	Fri, 30 Oct 2026 02:22:07 +0000
X-Mizu-Trace-ID: bb3320411df55916
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv2] mm/huge_memory: set the mmu_gather page size in
 zap_huge_pud()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
Date: Fri, 30 Oct 2026 10:21:49 +0800
Cc: linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 David Hildenbrand <david@kernel.org>,
 Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Pavithra <pavrampu@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4012569A-93C1-4662-B6A3-3521B97B8C57@linux.dev>
References: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 30, 2026, at 08:07, Ritesh Harjani (IBM) =
<ritesh.list@gmail.com> wrote:
>=20
> Unmapping a device-dax mapping with 1G alignment on powerpc radix =
kernel
> built with CONFIG_DEBUG_VM triggers this warning on every munmap:
>=20
>    WARNING: mm/mmu_gather.c:176 at =
__tlb_remove_folio_pages_size+0x38/0x230
>    NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
>    LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
>    Call Trace:
>     zap_huge_pud+0x170/0x2d0 (unreliable)
>     __zap_vma_range+0x1604/0x1e20
>     unmap_vmas+0xa0/0x1f0
>     unmap_region+0xb0/0x130
>     vms_complete_munmap_vmas+0x120/0x310
>     do_vmi_align_munmap+0x1ec/0x240
>     __vm_munmap+0x148/0x220
>     sys_munmap+0x28/0x40
>=20
> To trigger this - it is enough to mmap() /dev/dax0.0, touch the first
> byte so that the whole 1G is mapped by a single PUD and then munmap()
> it.
>=20
> PowerPC needs MMU_GATHER_PAGE_SIZE in which mmu_gather needs to record
> the page size for which tlb flush is needed. zap_huge_pmd(),
> zap_pte_range(), change_huge_pud() etc all do this already. However,
> since commit:
>  dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")
>=20
> a device-dax PUD maps a real folio and zap_huge_pud() now hands it to
> tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE). At that point
> tlb->page_size is still whatever the previous user left behind, which =
is
> 0 for the fresh gather set up by munmap() and so the check fires.
>=20
> Fix this in the same way like how other similar paths do.
>=20
> Fixes: dbe54153296d0 ("mm/huge_memory: add vmf_insert_folio_pud()")
> Reported-by: Pavithra <pavrampu@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

