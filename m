Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650477;
	b=BP9kcLm61unMHIsYLDUkOllwYEHHhEgeXFcCVBSdfbXQAysqi2bFyiv5JcojiJFIcW3p
	 ymXx2o7dyYnMR7vmj1A1Lbjys031EgNJyKc9R4nCUdGQZXhuLqnTHlzdg5Z+ITTudIPTy
	 qdrN6xGGMzd+MumHjqVWYd4RQfe+5SvhijYQ1WLdIWDNkDmD4qpG2OvJpQISC6WjuQxJs
	 QSGg/tKLQzfcde/um9V2tDClu93xnEqbyERrJ/NW7CT0AZphr4G+HscWqjFS1KMy/1vsL
	 j25xFsi0yqHxBKCVDK9clS/kTMbx1yOjzmr71FtvXSceUHZthETOlErURPBBBiMVZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650477;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=4H4b+3/76q62u3qzX7qZgWwUH08AcwDy4+VDBczMcl0=;
	b=DSBvRPfsNw11V3/MI8h8vsgVCiq3QtvegSzVfy80cq+/QINMrOjxkKRh4BNVZSVcaGo9
	 to3hoUmiznih/CmMFJNp8UpN0L0RAU4+oj1BskDka4q7SglfIGPNdp/Yg2QaWwny966Nz
	 5vLFNaRyJ3BdEsOFqGLCZUj5/PyEtMvGARknYPOxS1mkIhSQtwrfHGlnbfZi2RfIcBrqF
	 WBwQ/L7ckugtDXJgLgloqGvrCsZ1Azq4QRCy4qp6G5YlwjoMhXm2WXjNiWI18/CY+V0H3
	 KhPsjumD8hn6c5ZsUToG+is2brJ4YTKW5pveAuzMlRJVXWz5aAA4UR+Rngt0kjq4R4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H6LhaWim;
	arc=none smtp.remote-ip=95.215.58.111
Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CE606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390CE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H6LhaWim
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A7Wi4XPUPqxfH/qhOds5gcalhu0uwexg0PkzlXKTB94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792650474; v=1; x=1793255274;
 b=H6LhaWimV3OoG5UBVym689zsfrNgvksU0eqnLktIyyaEtoC2SplrzEkWnQGTfLATLCXMGkoi
 GAkca39oo3sMvoC2fJ71KfAURoQrdC+lsxi2XqKmgl9BXw8ZIf6WJZcMNsUd3/unY5vkK1TMpAk
 IPomPdmz7ECzNtOAKIwx46M8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ab1c5c7b2a738680;
	Thu, 22 Oct 2026 06:27:53 +0000
X-Mizu-Trace-ID: ab1c5c7b2a738680
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
Subject: Re: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page
 handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261022062401.62096-1-lance.yang@linux.dev>
Date: Thu, 22 Oct 2026 14:27:39 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 osalvador@suse.de,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 qi.zheng@linux.dev,
 jthoughton@google.com,
 david@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <79779E11-03B9-41D1-A112-52B7375E10A0@linux.dev>
References: <20261020115824.823278-2-songmuchun@bytedance.com>
 <20261022062401.62096-1-lance.yang@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 14:24, Lance Yang <lance.yang@linux.dev> wrote:
>=20
>=20
> On Tue, Oct 20, 2026 at 07:58:15PM +0800, Muchun Song wrote:
>> The new head page is already tracked on the vmemmap page list before
>> remapping starts.  Passing it separately gives the remap walker two
>> ways to refer to the same page and unnecessarily complicates its
>> interface.
>>=20
>> Use the page list as the single handoff mechanism for the head page,
>> removing the redundant state from the walker.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> mm/hugetlb_vmemmap.c | 17 +++++++----------
>> 1 file changed, 7 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 8b3abb562599..164e93e980bf 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -25,7 +25,6 @@
>> *
>> * @remap_pte: called for each lowest-level entry (PTE).
>> * @nr_walked: the number of walked pte.
>> - * @vmemmap_head: the page to be installed as first in the vmemmap =
range
>> * @vmemmap_tail: the page to be installed as non-first in the vmemmap =
range
>> * @vmemmap_pages: the list head of the vmemmap pages that can be =
freed
>> * or is mapped from.
>> @@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
>>     struct vmemmap_remap_walk *walk);
>>=20
>> unsigned long nr_walked;
>> - struct page *vmemmap_head;
>> struct page *vmemmap_tail;
>> struct list_head *vmemmap_pages;
>>=20
>> @@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, =
unsigned long addr,
>> pte_t entry;
>>=20
>> /* Remapping the head page requires r/w */
>> - if (unlikely(walk->nr_walked =3D=3D 0 && walk->vmemmap_head)) {
>> + if (unlikely(walk->nr_walked =3D=3D 0)) {
>> + struct page *head;
>> +
>> VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>>=20
>> - list_del(&walk->vmemmap_head->lru);
>> + head =3D list_first_entry(walk->vmemmap_pages, struct page, lru);
>> + list_del(&head->lru);
>>=20
>> /*
>> * Makes sure that preceding stores to the page contents from
>> @@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, =
unsigned long addr,
>> */
>> smp_wmb();
>>=20
>> - entry =3D mk_pte(walk->vmemmap_head, PAGE_KERNEL);
>> + entry =3D mk_pte(head, PAGE_KERNEL);
>> } else {
>> VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
>>=20
>> @@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long =
start, unsigned long end)
>> * to remap.
>> * @end: end address of the vmemmap virtual address range that we want =
to
>> * remap.
>> - * @vmemmap_head: the page to be installed as first in the vmemmap =
range
>> * @vmemmap_tail: the page to be installed as non-first in the vmemmap =
range
>> * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is =
callers
>> * responsibility to free pages.
>> @@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long =
start, unsigned long end)
>> * Return: %0 on success, negative error code otherwise.
>> */
>=20
>=20
> /**
>  * vmemmap_remap_free - remap the vmemmap virtual address range =
[@start, @end)
>  * to use @vmemmap_head/tail, then free vmemmap which
>  * the range are mapped to.
>=20
> Nit: could you update the @vmemmap_head/tail comment too, now that the
> head argument is gone?

Good catch! It should be fixed in the next version.

>=20
> Nothing jumped out at me, so
>=20
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thank you, Lance.

Muchun

