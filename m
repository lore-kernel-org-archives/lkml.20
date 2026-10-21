Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575190;
	b=PoYGoanZX5FJI+PT5amt6t+hbjuyQn5qLUBfYP7fr+FBTYa2QDA8jEjajtMwAhx5/088
	 aFeJHDg5n1pJfi/wSkeHIqFlKNjbzs9R5zjKFO88iQSNHoKbmJ+afJPOccZ6EReZatxnb
	 5t1rqn1PLnRppmSm5vY7TfZctCxSSKytKz20WEE66G13bry1uO74sZTdy9+zWwhGNni7q
	 Hr7g/f2SqZL+9H90S9CzfaL3EudioAhH1BNZXKUJF/5uOjKEy0GtFjBi3XhRCUSrZ4HC9
	 2pQGttc90SbvLQnemdIV2LV+vDdtgEJwj7ea77tbjVegG4rO6eLXl4g6UrLv/L8D7PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575190;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=jr7HnwUIiu7FdL/RBzGWRsmL/DGvW3qYiYRJage31n4=;
	b=YzbNGJxF0WIQwUMialyt3M4TsnAwsIfPibH1WZ3y9mt8vq8vmD2HPbdHmESDy4xsG/P1
	 zK7fTOXDuSHNXeeGZtpdFvEKx33ad37JaUEyDiZpMtVBnZvUttUR9j1Y7hb3S1BYB15PG
	 19Zbw6NdXTCxYfsXDnSTgl7czKueYrA9bgnm7NZODUmiTItz3yqHwPcReKkLEvbWDK3E8
	 3yewFa7v3j+KkKOWOzAh3ltfmAsAmDAj5HfVFc8DSwpkq9/ihVOQsnRWfD4Pj3WlxfI2V
	 6YlfQE0ApeM1c2cCFmAvp4eOpvurRWjr1OU8YJL9Zc4x3OzGh9ZggMGZVF5/hviSpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mIVZebeJ;
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF2606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDF2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mIVZebeJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dR+VfLDHueVtZzyRT3cCSn71Vr7MLkcSNP5OUCJWM8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792575187; v=1; x=1793179987;
 b=mIVZebeJDheysgRfBLQ5IYp9YqVkwZieb9MhPYSmKwSMHOcH/yx93Iq8oES6Xap5rYT+13qG
 yGIsquauM1c7o+8BMiBIrGKBG0B44BN0ij0dcuL9yskE7+Boo8Wr6HcV4caGA6hDiut3Khw8eVe
 B71aq7l/zBLTa9fvZH75Q6vE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0674a95a7bee71c4;
	Wed, 21 Oct 2026 09:33:06 +0000
X-Mizu-Trace-ID: 0674a95a7bee71c4
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
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-2-jthoughton@google.com>
Date: Wed, 21 Oct 2026 17:32:49 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-2-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> When hugetlb_vmemmap_restore_folios() fails, it stops processing the
> list, so folio_list may still contain folios that were never vmemmap
> optimized, e.g. because HVO failed when they were allocated. Their
> hugetlb flag has already been cleared by remove_hugetlb_folio().
>=20
> If no folios could be restored, bulk_vmemmap_restore_error() then =
calls
> hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
> including those, which trips the !folio_test_hugetlb() check in
> __hugetlb_vmemmap_restore_folio():
>=20
>  page dumped because: =
VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
>  WARNING: mm/hugetlb_vmemmap.c:503 at =
__hugetlb_vmemmap_restore_folio+0x270/0x300
>  ...
>   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
>   hugetlb_vmemmap_restore_folio+0x1c/0x30
>   update_and_free_pages_bulk+0x2c0/0x368
>   __nr_hugepages_store_common+0x2e8/0x3f0
>=20
> Otherwise this is benign: the restore is a no-op returning success for
> non-optimized folios, which are then freed as intended.

Good catch.

>=20
> Skip the restore for folios that are not vmemmap optimized; they can =
be
> freed right away.
>=20
> This is very unlikely to happen without fault injection, as it =
requires
> both HVO and a subsequent vmemmap restore to fail.
>=20
> Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list =
of pages")
> Assisted-by: LLM
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index a1b51251103b..4dac7ed1df57 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
> 		* page is made a surplus page and removed from the list.
> 		* If are able to restore vmemmap and free one hugetlb =
page, we
> 		* quit processing the list to retry the bulk operation.
> + 		*
> + 		* Folios whose vmemmap was never optimized (e.g. because =
HVO
> + 		* failed when they were allocated) can be freed right =
away;
> + 		* remove_hugetlb_folio() has already cleared their =
hugetlb flag.

Since you mentioned the hugetlb flag is cleared. So it's unnecessary to =
clear it again.

> 		*/
> 		list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
> - 			if (hugetlb_vmemmap_restore_folio(h, folio)) {
> + 			if (folio_test_hugetlb_vmemmap_optimized(folio) =
&&
> + 			    hugetlb_vmemmap_restore_folio(h, folio)) {
> 				list_del(&folio->lru);
> 				spin_lock_irq(&hugetlb_lock);
> 				add_hugetlb_folio(h, folio, true);

Something like following:

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6a011b627986..1ab3e61f4704 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
                 * If are able to restore vmemmap and free one hugetlb =
page, we
                 * quit processing the list to retry the bulk operation.
                 */
-               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
-                       if (hugetlb_vmemmap_restore_folio(h, folio)) {
-                               list_del(&folio->lru);
+               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru) {
+                       list_del(&folio->lru);
+
+                       /*
+                        * remove_hugetlb_folio() already cleared the =
hugetlb flag
+                        * for folios whose vmemmap was not optimized, =
so they can
+                        * be freed without restoring vmemmap.
+                        */
+                       if (folio_test_hugetlb(folio) &&
+                           hugetlb_vmemmap_restore_folio(h, folio)) {
                                spin_lock_irq(&hugetlb_lock);
                                add_hugetlb_folio(h, folio, true);
                                spin_unlock_irq(&hugetlb_lock);
-                       } else {
-                               list_del(&folio->lru);
+                               continue;
+                       }
+
+                       if (folio_test_hugetlb(folio)) {
                                spin_lock_irq(&hugetlb_lock);
                                __folio_clear_hugetlb(folio);
                                spin_unlock_irq(&hugetlb_lock);
-                               update_and_free_hugetlb_folio(h, folio, =
false);
-                               cond_resched();
-                               break;
                        }
+                       update_and_free_hugetlb_folio(h, folio, false);
+                       cond_resched();
+                       break;
+               }
        }
 }

Thanks,
Muchun

> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

