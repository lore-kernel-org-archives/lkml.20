Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622866;
	b=07iQdKBI0lLmuQLKVrg2X0XAmsqu0LZ2uoy/Z7dU+e8NG30waDzz3mhTz6P6f9nfpSOb
	 kGDUQDdJ2Bbkq0eGPbUGqV1cTio4TOlicEs0/6vBrrplzqqb1YDqJ2teR014uFOYO/mXK
	 ieakMQnnXl3G+7PlJmngXcb+5QvXHnwP9a9AzR9rQzGsS/GcNYXDC+Mo6fWrAlzp5QLUy
	 XdwdKqoIXCs0IwCRGqL24u6SSa6+62K8+2QSt6kwyYoZz5GcC/5V63haCB2k0XBo+U9YS
	 eedPpmVBwVLS/h7E48g1YP3CEuMn+ZyjjxU1Ji50UAFZV/Y4iJHwPN0l+nFsydKwfjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622866;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=VHR2wmYq7evlbOMXxZo7N5sGiKLQtqsE8M9Nv0sAcLQ=;
	b=vDGbIyIQn5tf9XkWZo6vquIti0K5Lcbp3x9vsoaqLYDmTsz2BTUmmPkU+pDUy0/8DSV+
	 u0fKzEOAPRbB9kXPmq9pP4cnh4SzyA1+SjShIPxjZtxe+PeuWtcWJdUdLSxCmYvN7G61S
	 lCy6T0Bz9+wrdH1ClhtDYnLEZgUx1pUCq/LJhy6oYfq5NuMsursGHet5h4hvp4xpsbcX2
	 jElEfXz75vrDjC6Bqz2IV94fJ4/TTUGIcsJ4vPyFzTPMjhzYopG/SvbQsRhsoymO6Dj1e
	 Y8sKtHts6U2+Mc8QQUIrZyHU6uuIfnffC9Bl+DvzZfwPDC1NZqn6PITSSBaJB0o7e3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KfZYqXf9;
	arc=none smtp.remote-ip=91.218.175.28
Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE95B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE95B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KfZYqXf9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nTo7J1ByDV3R803n4yFBSPlPgMm0dVzqitGLHvB5604=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793622863; v=1; x=1794227663;
 b=KfZYqXf9llRLeVn0N8NFxC/MEKZkEp81uwCTw/jQud0fGzxtF0ceZtQPRbsLQEl2V/2LJKe+
 u3lHK1xYDz2BgUhh+5fv3yW40aBcdlJPga6DEQxe2cqjlDqTUbZd8HnvGPLHSwTpF/8tf9mwAvb
 AIaVPgkB/jGGSX0DWebEyZMM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 78ee8f4e54d06351;
	Mon, 02 Nov 2026 12:34:23 +0000
X-Mizu-Trace-ID: 78ee8f4e54d06351
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179361471104.1337633.3959715900505206111.b4-review@b4>
Date: Mon, 2 Nov 2026 20:34:03 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <09EF0F81-23CA-4F3C-BA0E-41F34A0AA4B2@linux.dev>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-5-songmuchun@bytedance.com>
 <179361471104.1337633.3959715900505206111.b4-review@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 2, 2026, at 18:18, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> Hi Muchun,

Hi,

It's my email client's fault. Let me email it again.

>=20
>> Vmemmap page allocation is currently tied to restoring a virtual =
range
>> and assumes an empty destination list.  These constraints prevent it =
from
>> being reused when pages are requested independently of a vmemmap =
range or
>> appended to an existing list.
>>=20
>> Generalize the allocator and give it an all-or-nothing list contract =
so
>> the restore and optimization paths can share the same allocation =
policy.
>> This also allows HVO head-page allocation to fail gracefully under =
memory
>> pressure without triggering the OOM killer.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
>> ---
>> v2:
>> - Collect Reviewed-by from Lance Yang and Qi Zheng
>> ---
>> mm/hugetlb_vmemmap.c | 39 ++++++++++++++++++---------------------
>> 1 file changed, 18 insertions(+), 21 deletions(-)
>>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 0e5b2b182d1bf..4b20a8efc0678 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -334,28 +334,26 @@ static int vmemmap_remap_free(unsigned long =
start, unsigned long end,
>> return ret;
>> }
>>=20
>> -static int alloc_vmemmap_page_list(unsigned long start, unsigned =
long end,
>> -				    struct list_head *list)
>> +static int alloc_vmemmap_page_list(struct list_head *head, unsigned =
int nr_pages,
>> +				    int nid)
>=20
> Please indent with two tabs, like David likes :)
> Applies throughout the series.

Sure. Should we update scripts/checkpatch.pl in the future for MM,
since this script seems to favor the alignment approach?

>=20
>> {
>> -	gfp_t gfp_mask =3D GFP_KERNEL | __GFP_RETRY_MAYFAIL;
>> -	unsigned long nr_pages =3D (end - start) >> PAGE_SHIFT;
>> -	int nid =3D page_to_nid((struct page *)start);
>> -	struct page *page, *next;
>> -	int i;
>> +	LIST_HEAD(local);
>=20
> Can we use a better name here please? E.g new_pages?

Yahs, make sense.

>=20
>>=20
>> -	for (i =3D 0; i < nr_pages; i++) {
>> -		page =3D alloc_pages_node(nid, gfp_mask, 0);
>> -		if (!page)
>> -			goto out;
>> -		list_add(&page->lru, list);
>> +	for (unsigned int i =3D 0; i < nr_pages; i++) {
>> +		struct page *page;
>> +
>> +		page =3D alloc_pages_node(nid, GFP_KERNEL | =
__GFP_RETRY_MAYFAIL, 0);
>> +		if (!page) {
>=20
> I think goto err_do_cleanup is cleaner than ad-hok cleanups

I=E2=80=99ll use goto style, either is OK for me.

>=20
>> +			memmap_pages_add(i);
>=20
> This is confusing. Updating counters only to use
> free_vmemmap_page_list() seems worse choice than walking the list and
> __free_page().

I think the memmap accounting should be done right after each successful
allocation =E2=80=94 that way, using free_vmemmap_page_list() becomes =
more natural
and simple.

Somthing like:

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c04f53f708d2..cab9ec14873d 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -207,14 +207,13 @@ static int alloc_vmemmap_page_list(struct =
list_head *head, unsigned int nr_pages
=20
                page =3D alloc_pages_node(nid, GFP_KERNEL | =
__GFP_RETRY_MAYFAIL, 0);
                if (!page) {
-                       memmap_pages_add(i);
                        free_vmemmap_page_list(&local);
                        return -ENOMEM;
                }
+               memmap_pages_add(1);
                list_add(&page->lru, &local);
        }
        list_splice(&local, head);
-       memmap_pages_add(nr_pages);
=20
        return 0;
 }

Thanks for your review, Mike.

Muchun

>=20
> --=20
> Sincerely yours,
> Mike.


