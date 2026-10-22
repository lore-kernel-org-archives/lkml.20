Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635478;
	b=h2aBltrHeZDjOk7VMWrOwDJYixKgjGBfoRDhRkAxwwmMSNNqNiFmxt8btMYL4EOt5KwQ
	 xs1s7N0f+otyXSrB8yoDIK/S7VqLSCIVFXpe1kcO3pnd7raqmwNNy38YUVJXX95ZLLLG0
	 pkUDo9xuD4ef90ANnkVy69txn4JDyoDJJzLrTVFLq9HFTiGC0rIER234kvP3ybUdFL5kZ
	 Ano+scIaZc3o3OwKXtwKWN79uFibmk0zVaruHXH/ZkLcY9kUSkS2MoBdDmB03ymtLaHSi
	 09kYtb1pkKw3LGNDfUXXgRAmYVatfwWS/qS6ufOV0P2vko8LqQzm0tYWAN/nvS4LJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635478;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=IeHN50YZ/NG8ZWpDQLHml+D4SpMDuGPRyLBAp8LeAZY=;
	b=HWiMmdvWoqwasXW4DTvOsCsVTLGhcSCGfq2g6xSFLibHsqtrPb6A225ffUtabvDUL0Av
	 UQHr57TnQs+dcxKb+5Xkxzer+rTW6sjWoIO5wmoGrf5S4GYFbLQgxLAaAsNJLZYNqC845
	 YTZb49iD6rj57xzrgtcI/XTvgAJsl/xo+8A1ETBAP5dUAkCJ3ucRqzqvKU9Y+pFtC3Vzz
	 9lp682PCD8QmynEBOV25Oug6krAMGctlLjMJ1CN5C9CGVXdWZcx5JQiacBpeAxD8WoRA6
	 IYbfB4Ctb+ISNUgGDhiUudiqqsusaekxQp8ZSu2hhTv2QIzxPO7OpbHiRdDW2eeXvcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AhELgdXW;
	arc=none smtp.remote-ip=91.218.175.100
Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927A606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8927A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AhELgdXW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Qhn2nJhqTpx6IuD7zDJXbEf7KoM/IdTDiwQaIPdkdhQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792635471; v=1; x=1793240271;
 b=AhELgdXW2TpRdDnoVNwa80jru5dnYrpMqRckia/ZFKIq7jkTvPqiSVTJlHM8/zMSgYr2ITJ2
 cxvDJcQ1WPfQ+fqJHtU1Si/76j+zqJFHpdFSNh7oDyfgOXmayDypgFmmkWWCtikIYF0wDR2DB7U
 gSV35Tkn6c4UrAMH46WDm+vs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9562aa6cc98d7210;
	Thu, 22 Oct 2026 02:17:51 +0000
X-Mizu-Trace-ID: 9562aa6cc98d7210
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021212738.321547-1-jthoughton@google.com>
Date: Thu, 22 Oct 2026 10:17:31 +0800
Cc: akpm@linux-foundation.org,
 catalin.marinas@arm.com,
 david@kernel.org,
 fvdl@google.com,
 linu.cherian@arm.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 mark.rutland@arm.com,
 nikos.nikoleris@arm.com,
 osalvador@suse.de,
 rientjes@google.com,
 ryan.roberts@arm.com,
 sunnanyong@huawei.com,
 will@kernel.org,
 yuzhao@google.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
 <20261021212738.321547-1-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 05:27, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Oct 21, 2026 at 2:33=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index a1b51251103b..4dac7ed1df57 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
>>>              * page is made a surplus page and removed from the =
list.
>>>              * If are able to restore vmemmap and free one hugetlb =
page, we
>>>              * quit processing the list to retry the bulk operation.
>>> +             *
>>> +             * Folios whose vmemmap was never optimized (e.g. =
because HVO
>>> +             * failed when they were allocated) can be freed right =
away;
>>> +             * remove_hugetlb_folio() has already cleared their =
hugetlb flag.
>>=20
>> Since you mentioned the hugetlb flag is cleared. So it's unnecessary =
to clear it again.
>>=20
>>>              */
>>>              list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>>> -                     if (hugetlb_vmemmap_restore_folio(h, folio)) {
>>> +                     if =
(folio_test_hugetlb_vmemmap_optimized(folio) &&
>>> +                         hugetlb_vmemmap_restore_folio(h, folio)) {
>>>                              list_del(&folio->lru);
>>>                              spin_lock_irq(&hugetlb_lock);
>>>                              add_hugetlb_folio(h, folio, true);
>>=20
>> Something like following:
>>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6a011b627986..1ab3e61f4704 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct =
hstate *h,
>>                 * If are able to restore vmemmap and free one hugetlb =
page, we
>>                 * quit processing the list to retry the bulk =
operation.
>>                 */
>> -               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>> -                       if (hugetlb_vmemmap_restore_folio(h, folio)) =
{
>> -                               list_del(&folio->lru);
>> +               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru) {
>> +                       list_del(&folio->lru);
>> +
>> +                       /*
>> +                        * remove_hugetlb_folio() already cleared the =
hugetlb flag
>> +                        * for folios whose vmemmap was not =
optimized, so they can
>> +                        * be freed without restoring vmemmap.
>> +                        */
>> +                       if (folio_test_hugetlb(folio) &&
>> +                           hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>                                spin_lock_irq(&hugetlb_lock);
>>                                add_hugetlb_folio(h, folio, true);
>>                                spin_unlock_irq(&hugetlb_lock);
>> -                       } else {
>> -                               list_del(&folio->lru);
>> +                               continue;
>> +                       }
>> +
>> +                       if (folio_test_hugetlb(folio)) {
>>                                spin_lock_irq(&hugetlb_lock);
>>                                __folio_clear_hugetlb(folio);
>>                                spin_unlock_irq(&hugetlb_lock);
>> -                               update_and_free_hugetlb_folio(h, =
folio, false);
>> -                               cond_resched();
>> -                               break;
>>                        }
>> +                       update_and_free_hugetlb_folio(h, folio, =
false);
>> +                       cond_resched();
>> +                       break;
>> +               }
>>        }
>> }
>=20
> Thanks, Muchun. :) I think it's slightly easier to read without the =
second
> folio_test_hugetlb(), like this:

More clear, LGTM.

Thanks,
Muchun

>=20
> 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
> 		list_del(&folio->lru);
> 		/*
> 		 * remove_hugetlb_folio() already cleared the hugetlb =
flag
> 		 * for folios whose vmemmap was not optimized, so they =
can
> 		 * be freed without restoring vmemmap.
> 		 */
> 		if (folio_test_hugetlb(folio)) {
> 			if (hugetlb_vmemmap_restore_folio(h, folio)) {
> 				spin_lock_irq(&hugetlb_lock);
> 				add_hugetlb_folio(h, folio, true);
> 				spin_unlock_ire(&hugetlb_lock);
> 				continue;
> 			}
> 			spin_lock_irq(&hugetlb_lock);
> 			__folio_clear_hugetlb(folio);
> 			spin_unlock_irq(&hugetlb_lock);
> 		}
> 		update_and_free_hugetlb_folio(h, folio, false);
> 		cond_resched();
> 		break;
> 	}
>=20
> Applied this in the v3.

