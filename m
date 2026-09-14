Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3351483820
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401415; cv=pass; b=oHS1SV/sXBFKgZx3tlJC8Y18WQQRaC72bfgfIflZ7H9eJJkhJ53r/CBD1Ia5F0lxtD1dkYtp4XBXOqcQSkzymkClGT4rs7e9heHwBbK+y2Tqm6s4hQGTFDaEMTMGKQkJeQ8GvdAD+0bvB/GwH0+xDkuzqjKCno4pw1Uir5OuyRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401415; c=relaxed/simple;
	bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aa00/tfBcyS2g9AWYliOGuT6z5TT0d9HA25dkqL2Q7pYQh0E1jTumu4xH+h/vd75eq2i0LKnjylDsl03lkDyvw12y5KDEbJbX6+n8GW3yhiWeRGOr7tTw5GISzjnrAzBhq9Wn0CRXXf1KgRqEi0X+Mz+RwXklhICFRhxioZUGCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gpv5iCy2; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gpv5iCy2"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so3761267e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401411; cv=none;
        d=google.com; s=arc-20260327;
        b=Un0knBBrv0B2wTWL2tCQ3LKQytz6BC/Lhf6GqQ/1GwmTyWDt/vBUuwGrKdSlfTu2qm
         KZU2cuW41vE7MB6XPjQkg7dfsvAfLeK50Ch4AhmxQWZlHZW6eTnRl4EZScJ6AW0LzM1/
         laFK9gELuwUNDcQTKNbun27R86klcE0NqVn0q5zD3kSWDtjuWH9WD18ahn9t+1fCT9zo
         gnqh6bOMJU7WfFc2fzmmF9SdlVjw54qPZg3NPTgoqvullVghgOxfARgvNEkq4361884R
         NoYOolF028ltzXy+4PFe9d8UTLwghGFCqf2Kd1MahXdZcJqDeCPpqNSgMH8wH40BWabB
         FwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        fh=50ZRow9LcRnD20ovVWWT72U+aLqmvNg6UED48tX9n/U=;
        b=Qgi1JpH71YEPUz9rpz4TPTwWXy8VKKWTi/UBCqMxMzD3B6BHdrAfocVY8dHxFgalCx
         soGYpuA1V1C8YYCCRsQlYlCqIz+tuWM9QWkfyICoEXUcEeTqtQkY1e/+QPfPsZrM39RQ
         17KJDhjVsk00Ic+s/ZaMfPc2B6jIHQaOgVa7DSV/QqHkoDNlsnTuHmRjfN3z8Gmo2fn1
         rOY8q8oykjLYntC82vrcXsIOMOcFW8Y6LDtxrBz1AuateYt7BFh4Kg/og7Op2aRCQ1+d
         QwdpSfGW937nCMGfU26bTnYUQYHRo9aggpCcV8VOC6wP0U+JAd5K1wsrLz6GtRm5NG1v
         iF/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401411; x=1790006211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        b=Gpv5iCy2zp49QaIZuqyDx/Eh0NnO3o++JH9lKJUbl+rie7NLGcUvmGytdI2fIT7rSj
         pPpVaHU3Y/o75k7lCm9C7+aRS01Yx2WxR26W5hWMLgkXcE3drE6fsxv/fJAtlfeSe7BT
         yjTgEUBdGDu2qoxp9UmyqP+aeaTeXMxfGPK+x75CEF9VMJ03w7xkiiTAbADdy4y/5iFs
         JQea+qDynq1EwgmWgrv4DAbIJZsIhYi+gKm7tobB4a8MXRTW5jJAywChG19t1iRMmVbt
         pKW5j6MQVt+v7qBZnA+enBTJ6nrpPsQiaJuaT+JJoEn1bdX7PgxEHu79557ub0ESN9Vz
         XFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401411; x=1790006211;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        b=Hbio5HJd2Qq5yLMB/eHtoD6R2B4E1TkNo5kMJPHf6HImin6Z8J+aSO9YNCmm2gqPFH
         LUWTwXRcupxw9YUQh1082ACFbLOHP96koXcBKk7HhoDPSOqMpZ88lOdqj17EGBxhdQH8
         kv4FRA2xYyUTrOqsHf+I5hFrXW5d8+Db3ScnnE60pdDfHLpwDdZrYasxzm3vLETDrEd0
         pS87A758vOszzgVlZrtcefV5w45jNVmYw3JOpzBtPCZD5qpAk2FPTppgIPzZ1yI5b2I3
         1b3t4jGNxFpABP4WARbLD5kuBzC7zblTPa22+IXzquJ/G2kDwCRhVvaAQNnj3HCOUNJC
         LmVw==
X-Forwarded-Encrypted: i=1; AKwUvByqjtwARBg9Dp2+nVzmREELZw0Rg1cHhawE+U5trwNo+5uml2/SALBgk3zZWnBy6rHz9USvaxlZOQDuPVs=@vger.kernel.org
X-Gm-Message-State: AFuF++nMwJ+lWCprs7JCj7E1tDvmTy8NGOuYU56dSZGotvZya1bC3NOD
	YZ/cYdI/WOdvKBAAXWWIAtE5Z1+DnIDWcLG3/a1KgiqRGgQf5qdWzo1y4x5RQlzLjK+svyaOE4z
	TZesgUrdzIFVC21KNvOBxTPPUZuPD+C3wA03Tfz3X
X-Gm-Gg: AYBFou2W7OigwhVmxtOiyXLxzLsJE1m1y2QHD6bp9vuvb8L2B2VhfgHKfCH9v72vwKT
	46J9jW63rInpYPWS2VkVV3YSgM7OYr7cnHU4/lVNRR1Tq4yMHcK1o8dwvXTMGjEZoHJ4UK+fsJ2
	U6rZsuhSsv1GCWGWwpnAddruxzW88HvfXG/s/PgmxCSWPMynAy+cyUvbS7Zfx3wdDVcz3YkSX1V
	UO48CPZSdRdMgRxs+38vFIPLdGOyNOsOfPPk/Kaym6e/Wu1e+cfVGeq6PtnHj36ZkhGHmtJ514A
	cED0zkxpilUmd5DQWitKDsfJVT6qNQP4D20nt8uvqMOKSMij/37PrNgehus2WSHdfrDOi1U+31O
	iHqhN0a1yZQ==
X-Received: by 2002:a05:6122:4b8c:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c981d3a2b4mr3488872e0c.3.1789401389359; Mon, 14 Sep 2026
 08:56:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:56:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:56:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org>
References: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
 <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:56:28 -0700
X-Gm-Features: AcwNN1VbtSw2suRdJEPwwVSKB7yg54T9kxDFDisYSP9Jtt5N7Dkjunh5FrFt35g
Message-ID: <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix HugeTLB subpool used_hpages tracking
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 09 Sep 2026 14:49:25 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> HugeTLB subpools currently only track used_hpages when the user configures
>> a size limit.
>>
>> This is buggy since when there are existing allocations from the subpool
>> that would have satisfied the minimum reservations,
>> hugepage_subpool_put_pages() will still restore a reservation to the
>> subpool. See below for an example of a false reservation.

"false reservation" should have read "false reservation
restoration". Will fix in the next revision.

>
> That sounds annoying, although isn't clear how this affects end-users.
>

I'll also add this to next revision:

hugepage_subpool_put_pages() falsely absorbing reservations (aka
reservations being falsely restored to the subpool) means
hugepage_subpool_put_pages() will return 0, and h->resv_huge_pages won't
be decremented. The page(s) still being reserved in h->resv_huge_pages
means fewer HugeTLB page(s) for use in the entire host.

>> In addition, the subpool is considered free prematurely, is freed, and this
>> ends up causing a use-after-free.
>
> That sounds alarming.
>
> Do you think it's best for us to submit [1-3] for -stable backporting?
>
> Is it feasible to come up with a set of small little fixes to get
> -stable out of trouble and then to prepare broader updates for our
> ongoing mainline development?

Please see [1]. I don't think it'll be easy to come up with a complete
set of small fixes to fix all the issues that are fixed here.

>
> If it's "shut up Andrew you're always saying that" then OK, I can take
> that :)

[1] https://lore.kernel.org/all/CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com/
