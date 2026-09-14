Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493B481652
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403452; cv=pass; b=jdT/yj6biHyD/or48L9vZWHrApqwX6mONmcxuG/3aGQiPH2pqv7NAz6pnKg7jszED+/ExFbj+RzhHCzM5EdB+WvklpFxuDh8IL9jEvjNX3sH3P24gMLpnQU+bcQAySjoKZXMIyvwHJ6G5kk/S+Vfv15yTtoATGqQWzMpwZcN3mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403452; c=relaxed/simple;
	bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYRqh78ShEGndTLkE5J28cWEGmWmZzVxc4FrJqjt/jfvpWYEA+kgWbJbGbn9dHu9b9JSL2AVcDsB6KAMpgHSWPt5MYE4GOka6HBqf+pj/5bc2UNn8trgO+i37Clv8ixWVANJbr+HdMd6KZXhsaLncD2wCC6yda+jUAzcfQoTSG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkJef4Iv; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkJef4Iv"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7935ecb5d8fso616986137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403450; cv=none;
        d=google.com; s=arc-20260327;
        b=DHn0VN5j2WCjWoQmGws3xRlSiHK/U2+rDZ8OBk0QR3TZSMIx/3nuRxMxQEJb73ogbv
         xxuR2FJsBnvP9iXtrYN7UIO4rmvpX+R7GeXrZ9GDCvw/QEfKTHe5CdMwhwV1jWnFguaV
         klKJEywMVjQHcCVhvYH+cPx+L/ydxgpUqJXc2dqiNkzqHa+yNyq4zkNnHmevfAHeqRHZ
         9yJpO7nqrD/zFB3aUT8aZyd7AolyOhMIBgNMJ3U4twroU5M5ShzGpU9HnbCjO8ETS4EK
         5MKNMTcQjfKlczUO0duCKAh2FhogOsR+BvbvjxDePChJj6H87rhVTef6eRAyg72ITZbK
         aWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        fh=YaK/7QQOamIHHcuMNZCsbsqge/Kq8rVtorxQTlZXFBE=;
        b=K43gcBSbDa55XYtHTjEWqdXOZYp/MCqEdQO2L/C0de1fWuh2wGmd0zx3+NfbgYFez6
         DGFo6N2sLjr7sbg4wvw3CO5hWZ1BgFFXHZqzXeMeiSkxfk2MgE9sNmiNhlxgdFIC0Psj
         8GYc/Ojb07R127wxbi/eaIh72S/cnpfJYGPhHcI4rHrhCUye9zkt/ewKi9AA1YXhCNGQ
         HgNuQye+gR2zHBu0nOvlDLpTZAiOKkV7a+RedbugSmaN/H3WWIMLDzwBDcNqaBGMFYBu
         Ei8whymQRYJ/VnBQmtr8vWDDknrf+0JBJjddYRNf+O27YukCqPDGSbBhcTL9t9/42rqX
         eKjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789403450; x=1790008250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        b=QkJef4Ivs6iY3syqkU/t38p7D+wTwdUbU8t1xmm/eQm99eHLgDtK2CmSnuksIIFK59
         ZV+NQVIGYwtPwi3NTjGeIzuxlmVGudaEysd1VCg3kBoSCi86mxGhd6MIZeu7sGeD3SE9
         rw2XkiUFQKgl0nOCl6Vp/o0odSnDa9ErlWimnlF7NeJ/9wmiNDotmPGEYOLMeZn4bl9J
         HYqgh6o0H6370UJqhu8ieJglt2VaHzMnqsAZnoePtknhQUAzZNiJFNI7Gk/4VC5HSq5Y
         zcPrCSnB23FF5QmUwxtFfAXzSb+7GNFQRefFXTlfRyPUA1l2iVqtuFyzu1zLh5MFqHpJ
         7NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403450; x=1790008250;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        b=Kt8IL1tOfTSBsNuEsCj/Urk+OGvuGWvscW3r0USNHOjUpBsElUPokBzfZEnmLIkoag
         c5KQUclUDIbBoPGk5/nMmHmKoAke7jGDW6JTEh4uQtTkFFFUiNqs7S4XI9uELAlAI+CQ
         HZJThox/5e6SwhVhoH+FCe9DEJX2bMZvulLyNhx2HBPSOFjA5nZ5+FaMMzk+cF1ei99x
         LMbngYpvP1xRe7DFkoKh24ZFcG+wuHkuL9BB68U+u4QYbqh94GUiqdEF4RtcVwiKbzCs
         KGWATx4WjAp4aVf3yEUbxRlnWHXe9rFt6dKHDVk9mgeToHWlNlsO1xII7cMCbgHRAfb2
         btCA==
X-Forwarded-Encrypted: i=1; AKwUvByoZtLC07TkK6a5H4+0W1rIbOBTchpCquTBlwxssflmMEC/3DvLe8JgB6G3zBpU9x9t7Ytu1ry0J3vsFgE=@vger.kernel.org
X-Gm-Message-State: AFuF++ntQOoBhkWT/ULESrTFIsWxEuQvf2x4e1D+2ZIZBKa9O6wiLJly
	Oya31eekgl6u9cNrs9/okzrBqodTpSY4Af8R6693BIsdtEDqxOuQKfhyLWVznBt7MUfPc+LAqSK
	oJ3rCQUFKuERuj+TbsUPBeQlTjWYAdrH5QDSxG7Fc
X-Gm-Gg: AYBFou2+a5G03XrIaB2fMMa0pyWTCn7Ynap5rMO1uGQ2GCJVSpWaXW2MeKCc7vI1XZ8
	NI+fQQHqGNbeFKbFBhkJYSjFUPs3Aj5/8L+ClaXwfr8PVdFnzxiBxpT8ji+SGi6LSHkhKnUyuVe
	OgE6q+WsIM7ZH85vc1ef8XDa0d9hmjNZKNVLM2yrr5hmwEW+CtYp94JmLYbW6Pdf3vnDJ+McbhU
	MNpXKcEgCAKCvta8jD4/AyZQ8nEmjwTuwLh6/7rkpPYpZMS5twcz6reHBogmOh+xXUhAEpUk6+0
	6amCkkEVd0SXDq2V4VD32dxuOd8OtsFnVVcffHQJ9L7w/Du9Fio8mIPhdDjZvucSCplcB0jJGpu
	eH5TGQ5KmrAMY2WbKBsPz4g==
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-79b5b2909fbmr3656947137.9.1789403448800; Mon, 14 Sep 2026
 09:30:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:30:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:30:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
References: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
 <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org> <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:30:47 -0700
X-Gm-Features: AcwNN1XXPLdtIsXucpy4FdPGkhqMrtzwEGfBrz_XeIOSoKwnvb1TbO6LQoI4Y4A
Message-ID: <CAEvNRgHPGzfyr5Uuir2QoLqSNTkspkn3yJ5CTz7rAQmREe2Apw@mail.gmail.com>
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

Ackerley Tng <ackerleytng@google.com> writes:

> Andrew Morton <akpm@linux-foundation.org> writes:
>
>> On Wed, 09 Sep 2026 14:49:25 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>>> HugeTLB subpools currently only track used_hpages when the user configures
>>> a size limit.
>>>
>>> This is buggy since when there are existing allocations from the subpool
>>> that would have satisfied the minimum reservations,
>>> hugepage_subpool_put_pages() will still restore a reservation to the
>>> subpool. See below for an example of a false reservation.
>
> "false reservation" should have read "false reservation
> restoration". Will fix in the next revision.
>
>>
>> That sounds annoying, although isn't clear how this affects end-users.
>>
>
> I'll also add this to next revision:
>
> hugepage_subpool_put_pages() falsely absorbing reservations (aka
> reservations being falsely restored to the subpool) means
> hugepage_subpool_put_pages() will return 0, and h->resv_huge_pages won't
> be decremented. The page(s) still being reserved in h->resv_huge_pages
> means fewer HugeTLB page(s) for use in the entire host.
>
>>> In addition, the subpool is considered free prematurely, is freed, and this
>>> ends up causing a use-after-free.
>>
>> That sounds alarming.
>>
>> Do you think it's best for us to submit [1-3] for -stable backporting?
>>
>> Is it feasible to come up with a set of small little fixes to get
>> -stable out of trouble and then to prepare broader updates for our
>> ongoing mainline development?
>
> Please see [1]. I don't think it'll be easy to come up with a complete
> set of small fixes to fix all the issues that are fixed here.
>

I'm hoping this will make it to 7.4 and it's 7.3-rc3 now, so I'll respin
perhaps tomorrow or so if people are ok with the suggestions on the 4
patches or if there are no objections!

>>
>> If it's "shut up Andrew you're always saying that" then OK, I can take
>> that :)
>
> [1] https://lore.kernel.org/all/CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com/
