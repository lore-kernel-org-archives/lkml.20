Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794455268;
	b=kcUZ8blFjoRGLgH/LoP8Z5cLQDsXo7eU+phlb8xWig/ot2t9KNsA/PUrumK5ITYn9d5Z
	 UHU4fcROptwswfX69njNzPNjtPE5+zi/tVQaE09tPmNgaNKQP1s5ojBD5i9eQ453+VAmF
	 vQdzl0zpATo/mFTR9310HmCiXq4VcpRxQr5rYjhO3Hj/3ia1Waheayfp2oCN5z9ChmdyP
	 0DbT7TwqUc5Ho9n4DxG5ui8JfxYpK/s9ieQISNoSI6Bmgtx3QscpwKt9TED7gZKLUa29J
	 kmJ0gvruaVfbp2/Vos/Nt7xDbnilcTWAsVRqWMckZmavCET1yf6Jbq4floty8nBBjzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=iwZKB7nwtPgPNz+YCvPlIwTeSdJDxh3u1WNVkxdvYlk=;
	b=EnWPIO7icVcXlcRWYD79GP/cwwHcb2p+FLSaOk6aYCTUoz5bSIFz3qR8awOxJ9Z5hLhV
	 gxxSJfyYzK079qLjeNW9xIb2F8biURjmqSb3Xm1JuRNK+zKm8XoLjJD2JG71Ji7WQ5y3h
	 jfT1FmSnCPlgkNuB2jJWlhWi3cGapw4cRwIdZk25WroZxnzeZomgO/8Xm0ypIfdNqlXuW
	 DB3K2WkcPGvUfSCgoYWVx54s2nd+fGZ08DhxWGogFxr40oOF1X6t2Bn8GFrpKOqd2eFBA
	 yYKN6wtwxaeVhgzN5CHjwyMZZuKe90YuFXr/Jau4zfBhjWhDan52LjI6IWUjQdPqrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Pg/fy7SQ";
	arc=none smtp.remote-ip=91.218.175.8
Received: from mta0.migadu.com (out-8.mta0.migadu.com [91.218.175.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEA9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pg/fy7SQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OadfzCGW2WfZe3bKn2zs0QyfwtQX+wSf4CH5BaN2Vtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794455266; v=1; x=1795060066;
 b=Pg/fy7SQkfATu7EVEkhbXVw4DwKfwKMto0NUPELfZ9AHXXR8xaAOlByyv+FN8K5l/dRzXkQL
 dfPCAwb6k9VOG0jSKXgv9YohjOi17WCLOY5hLDqrkMYDhboVmWszad9rSC+0FKMqOKXguOaensd
 9MhvQArqYWMf97YkIr4S4FRo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 64ab2262467329c6;
	Thu, 12 Nov 2026 03:47:45 +0000
X-Mizu-Trace-ID: 64ab2262467329c6
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
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
Date: Thu, 12 Nov 2026 11:47:28 +0800
Cc: akpm@linux-foundation.org,
 catalin.marinas@arm.com,
 David Hildenbrand <david@kernel.org>,
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
Message-Id: <B10D5832-7D7B-42E6-974C-6C394371108F@linux.dev>
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
 <20261021212738.321547-1-jthoughton@google.com>
 <11457D37-5AF9-46C2-95BC-CAD4B22741A1@linux.dev>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 22, 2026, at 10:17, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Oct 22, 2026, at 05:27, James Houghton <jthoughton@google.com> =
wrote:
>>=20
>> On Wed, Oct 21, 2026 at 2:33=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index a1b51251103b..4dac7ed1df57 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -1613,9 +1613,14 @@ static void =
bulk_vmemmap_restore_error(struct hstate *h,
>>>>             * page is made a surplus page and removed from the =
list.
>>>>             * If are able to restore vmemmap and free one hugetlb =
page, we
>>>>             * quit processing the list to retry the bulk operation.
>>>> +             *
>>>> +             * Folios whose vmemmap was never optimized (e.g. =
because HVO
>>>> +             * failed when they were allocated) can be freed right =
away;
>>>> +             * remove_hugetlb_folio() has already cleared their =
hugetlb flag.
>>>=20
>>> Since you mentioned the hugetlb flag is cleared. So it's unnecessary =
to clear it again.
>>>=20
>>>>             */
>>>>             list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>>>> -                     if (hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>>> +                     if =
(folio_test_hugetlb_vmemmap_optimized(folio) &&
>>>> +                         hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>>>                             list_del(&folio->lru);
>>>>                             spin_lock_irq(&hugetlb_lock);
>>>>                             add_hugetlb_folio(h, folio, true);
>>>=20
>>> Something like following:
>>>=20
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index 6a011b627986..1ab3e61f4704 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -1616,21 +1616,31 @@ static void =
bulk_vmemmap_restore_error(struct hstate *h,
>>>                * If are able to restore vmemmap and free one hugetlb =
page, we
>>>                * quit processing the list to retry the bulk =
operation.
>>>                */
>>> -               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru)
>>> -                       if (hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>> -                               list_del(&folio->lru);
>>> +               list_for_each_entry_safe(folio, t_folio, folio_list, =
lru) {
>>> +                       list_del(&folio->lru);
>>> +
>>> +                       /*
>>> +                        * remove_hugetlb_folio() already cleared =
the hugetlb flag
>>> +                        * for folios whose vmemmap was not =
optimized, so they can
>>> +                        * be freed without restoring vmemmap.
>>> +                        */
>>> +                       if (folio_test_hugetlb(folio) &&
>>> +                           hugetlb_vmemmap_restore_folio(h, folio)) =
{
>>>                               spin_lock_irq(&hugetlb_lock);
>>>                               add_hugetlb_folio(h, folio, true);
>>>                               spin_unlock_irq(&hugetlb_lock);
>>> -                       } else {
>>> -                               list_del(&folio->lru);
>>> +                               continue;
>>> +                       }
>>> +
>>> +                       if (folio_test_hugetlb(folio)) {
>>>                               spin_lock_irq(&hugetlb_lock);
>>>                               __folio_clear_hugetlb(folio);
>>>                               spin_unlock_irq(&hugetlb_lock);
>>> -                               update_and_free_hugetlb_folio(h, =
folio, false);
>>> -                               cond_resched();
>>> -                               break;
>>>                       }
>>> +                       update_and_free_hugetlb_folio(h, folio, =
false);
>>> +                       cond_resched();
>>> +                       break;
>>> +               }
>>>       }
>>> }
>>=20
>> Thanks, Muchun. :) I think it's slightly easier to read without the =
second
>> folio_test_hugetlb(), like this:

Hi James,

Could you send it as a separate fix patch so that we could merge it =
first?

Thanks.

>=20
> More clear, LGTM.
>=20
> Thanks,
> Muchun

