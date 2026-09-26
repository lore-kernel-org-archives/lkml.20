Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB5352C51
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462573; cv=pass; b=GiCjfpYsqIAGPhKmSSLLvn73T+ImrZcswPc0Qpk7aHkz7++ISsVsWZ+h4rsU5q4bmgxBwELv7IsEaP1I0J96UXm/tTkmAfVE9Zzw1CvHSIDriuPG2CCaeGSJWGH/3p9CxizdPQGt7guN/haa0Hlh5r/dhMhztpMCo1E9obOB07A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462573; c=relaxed/simple;
	bh=oIoustKk4MCA1sbn3VwyOj5Ut9UQ8rmwcxgVxCOzBEw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9IYSHNET8xxL97FNI7jEuFKudpMRYjVKf0fwbEsSE+2dbMD4e1J2YYfJFZCLXAVdEg7QAFpCK3XC/1AWTN+phzPi7Rr8098DIpGGDb6tVKM0hzsLZz1nD2GRBF0EcwH4riDzAerK/yjXav55xsIRcEoC90Frml4r+Pk6GYZWSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n4ivHikq; arc=pass smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n4ivHikq"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba57fso14097986d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790462571; cv=none;
        d=google.com; s=arc-20260327;
        b=QDTxqI/WcLZjCj7oCThCU90vlPlTiQK8cm/oQWrTPtlhXSkmzhDco6mqnOD0NGwpm9
         sYsM3nR+OFGrUGGAAKXcGcou1WbmogaOV8HxWmVyBnnfl+Q60rs996650AlZPall6CzL
         WOzJ3nGYt2fGyAmXQqXai8RR0xTSBPF5fCVtReb2QWNGMxDnnBmuXsO6wEwO2z39mSbl
         KVZW12tc3Z46l5yPghaElK6gVV6ZdRC8smzuSXXQxwZ48WxIw+pqdfygTcLFuypjTSyQ
         GzgrYL+hQwhGt/Bj3FxPKFlF5qAkjnx3BSYI/hB0h2Tjkl/Dy2PArd3B2+a8GedRB2g4
         zYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        fh=XyzuEHSVtI9Q3nNY5V5uOBqaprnzJG4lES4j3O3EKpo=;
        b=oXjJkNDXAvMkeIYvMVTxp5ngIr+6ZM0iKM92GGEuGDqctnRj09c0OLzdSMdUHaTMQw
         lsHJ46FErRWaa7PQxh95zJgT4Ji0qkPYHckomoPUwlTpOGAGq598OSGu3A+y2YUeCfmo
         axHZaFx6OCFMknMczwnIgHBRvOkTtGR4EjLIlwbw0CE+0+No2CsQzB9eDlOIvrB3KNfx
         15OzdX2yOAJUz+r4WeMsXRmdTOeWKskyHDw8L3OAzdrktXp3zMmg8iALbWW229R+BKjU
         BOb6c/u1rWFtPEeqBUraKRQxOFVdgZf+rkwnLloQX/nTHX8tc1xpYlQl0JgCgV56yPuQ
         D8dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790462571; x=1791067371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        b=n4ivHikqoV8KJDh7LQu/SK6F88rEqYd2t2lH+kHUYuj1WKGVWjFT7Fdgxky03Aj5Nl
         RYrFXkJCF7yMws79bx7mINZ8ksDj2hSmdwHd/oMAEAPAE41vXwG7z/CgOoUrvxB1+wRm
         ev4JE8NXqZ6vKaI3emAj7hGz2Eh71Qd7wWX7huuTFMbsjQloRC3hn468HRddYv19OCXT
         UK7Li5D3ctZ0Y3caVk7+A00pmorXk12A9skAugvqeEjCx8/TjnADSgFNncc0MwuXdvO0
         NmDSaXA9rdq7R9UX0Xgl38jOmPf3p7DGOytMrO3I3H0VnGb03kSw4oKkPacUsdg1Wlfl
         zyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790462571; x=1791067371;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        b=gEtz5RR26IBfznC1ZAcQb3USMxyu10eiJGDe13c3ZcMTYpuYJLikceKiNtWydk6zMH
         +1RC7uopu8+IQ2KNqrMUc2ot4NKaBNNXd/6ID/59kREm/t+g+08pt/06BkOXfsYJZO1Z
         ktyynqX2ba0fngGNebVzGtxxEOrL9sp+RX+5Baune/PPc1rRKWI84f/MQ/WMqCxDAyQ8
         auaLbhg3+KrO+N/A380i+qMEsTrDHw27iftQrVOU4hhU1cgbg88z7foaBi2oCT+q4ppq
         FKpTHU7Wg++MlaYc37//cfRK8RC3LAqOpJmVPyWmXnmvJVkwUWFOXO0/noC5RduNCbE1
         UnGg==
X-Forwarded-Encrypted: i=1; AKwUvBycbyhRw75aQzEReqpMQ4YEH3uXdko5iXTvdCEv/lwSPX61/bErB7outCZee4CR0iMkern3rSOY3hccMRA=@vger.kernel.org
X-Gm-Message-State: AFuF++k8DALhdcElq5YlhUwU3CpIPAhCiwME1mrTKkZtlpFQPdXV1QVA
	YE6KpgAK43GZkox9KsD8aPeRV3STEognrc2H649dMNQt7kf61N6Pu2dg2cvuU+G3SRcrobhYSJZ
	88k3d1q02ezhJiAwBk0fMGYn1kLenw8+xfPogWSKq
X-Gm-Gg: AYBFou0zn7K0/Wek2hmXoivgoOFN1NpLMsGArnUtzO80v9NBFBqPjus7Ii1uTREGG/7
	XcSSMMBaVcCbVS/1TOO1WG5XNaN1vtfSiPjFko7eusw0KKytV4R06qH7SBpJgA/fWRbLZ9YaxFo
	b5QvaFY/u9KzvBKygC5vOjZhUYxXr9K84hjaOCgsHHJezT+urxlHwsbOsieUTfo1nsUgqGbzUq2
	bR+dcetSYgwtq/lUEVYER4xgxCBW6E7wbXbxnMDrKH7wf1Z8xOcLgzZBf2Y8voHVs71oKRGIbvw
	y2rVHwICzGnPg8qiJmfg4mvowXqmrZLWljkW2vfhUo5G5viFaAn4O486P38J+AJRBwPlEpkrjkl
	M2MbkKCjdZslQn1TGWud6
X-Received: by 2002:a05:6214:419c:b0:914:4464:41ba with SMTP id
 6a1803df08f44-91444646dc8mr70530596d6.26.1790462570563; Sat, 26 Sep 2026
 15:42:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2026 15:42:49 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2026 15:42:49 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHZTYUuFBXS3sGyyjiveQOeLHuPxvud8o+R3NCCwM6Ukw@mail.gmail.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
 <20260923220912.46905-1-kmehltretter@gmail.com> <CAEvNRgHZTYUuFBXS3sGyyjiveQOeLHuPxvud8o+R3NCCwM6Ukw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 26 Sep 2026 15:42:49 -0700
X-Gm-Features: AclHuK8P2H5EpMJy1YvK3gvIP-rpUihsCxDjwpAZl1LdwcYKlVTgraMVSJkaNkw
Message-ID: <CAEvNRgFPpigP6zq+6+dvC7nubFBjeYNZYPj4RHB1uXd6c26H2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix HugeTLB subpool used_hpages tracking
To: Karl Mehltretter <kmehltretter@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Zhao Li <enderaoelyther@gmail.com>, Jinmeng Zhou <zhoujinmeng@bytedance.com>, 
	Alex Shi <alexs@kernel.org>, David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>> 2. On splitting: 1/4 applies cleanly on top of both queued fixes, but
>>    in my tests it made min_size-only mounts worse on its own. As far
>>    as I can tell, that's because it starts tracking used_hpages on
>>    those mounts, while the two error paths only release it after 2/4
>>    and 3/4.
>>
>>    HugePages_Rsvd, expected value in parentheses. Q = the two queued
>>    fixes, wrap = 18446744073709551615:
>>
>>                                    rc3   +Q  +1/4  +Q+1/4  +1/4..4/4
>>    min_size=4M only:
>>      SIGBUS faults [1], no files (2)  2    2     0      0      2
>>    min_size=8M only:
>>      failed mmap [2], umounted (0)    0    0     3      3      0
>>    size=8M,min_size=4M:
>>      SIGBUS faults [1], no files (2)  0    0     0      0      2
>>    size=10M,min_size=8M:
>>      failed mmap [2], umounted (0)  wrap   0  wrap      0      0
>>
>>    With 1/4 alone, the min_size-only mount loses its reservation, and
>>    in the failed-mmap case three huge pages stay reserved after umount,
>>    presumably because the subpool is never freed.
>>
>> So it looks to me like 1/4 shouldn't go anywhere without 2/4 and 3/4.
>
> Thanks for testing this! IIUC from your table, 1/4 introduces
> regressions.
>
> How do we handle this, should I squash patches 1/2/3 together, or is
> there some way to use the Fixes: tags to require those 3 to go together?
>

I think I have a better way to organize the 4 patches and the two
already queued. Will work on this.

>
> [...snip...]
>
