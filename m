Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FD339EF2A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701706; cv=pass; b=b6fYykemMQdkaD0C7/GII5YiE/1H3uew1N+uvUyb1zj67dS9Mmag+a9iznRVighyKfaLUgu2qnIlk/+kAU+ckUE7TCbf5nmSLHx/ThhIbjBKhP4YdsWiOpW96Wbt9MkZ9TBUWYX3NeYzZIhLTGfD1wPPUbJPB8Z/yTBE+Mh1HnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701706; c=relaxed/simple;
	bh=rmTCDex/Z766FtnBu7Ba4CV3FoVdwmvovlkUigV94mw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+jTR0fNPfLlHCbmRIey9SRLbnwsKV0fsRGfM7kh+pVgRZVtritcHxlDoc6VdL93Ee7jaTL+9IwjdjT/qd8tnSSLjL7qbHe23dVyuzBqKrkNORWUAiyTFPKw/14XlXhbjBnt//H23r2g7vYoyGgbMyh+saI1NLEYCg+SMydnRJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0QJYxs6; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0QJYxs6"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso3540486d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789701704; cv=none;
        d=google.com; s=arc-20260327;
        b=XW/wq1iQ5hUm1psps2MuDqyz/g83FhPmIF+1ueYheCOdAZnNSZjA3YfLKdDx+GbuR2
         1I6fLra/nxCu3FrE20hPYUWpGPkvnuWEiBu+Hb6AzLBXr75RkGWGmcb8fnBrvYrmd7hr
         SiVFiqo72bEmfW1pinG1F8C5vr2zQESY3vt8mnpQIu5Gdb4kWvKTEi0pFKaulholqLro
         KdYLGANfesdpaTBLCXeSn6vv8YuNumi4SNf3Gmhos6/mYPwqjuAxxHxUAq+iIn9uOa3m
         BeEpYBnj57pvsTS0nYBhCOj0+xwuu3zf/Ylw7/oOa2uBvAbF00iGbQChzX4WoyctWFrN
         oC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        fh=DQ2wvK+Q7Fdm3C9SdutSsueVWITZVXRl0S9MKk65msU=;
        b=Sh0oYiOeVl8a8Xow4hxOsLLRHFJfvnVfLdn3NrR6mElDsp9H2k7xoBdufkcpNAXVM7
         dHKfsyTu/cS+XI6cRTZPgWUyQ3T9JOr1ODcyLLL/X6sgRe/kkP5rTcMAD8DR9uVqj3gk
         ExfvGLNRZzVJ47nF50sEe9662V4O7jcD8WKg/36VgZbasVhQlK8dZ1IkAIf6mG0Dk1cy
         6IXK1QWWx60uOpZ/Q5nXs2Ac/LnUfUKH5uLViqGK9ZhzEjWFV2w1/ApvYotjCtJu1u9f
         ggNYI/VdvKbpCzH8xzfyCPl9XhJ7oYhkmhcg+tJpckkY+qTM/6Cxic8sKMNllVK8IC3N
         RjsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789701704; x=1790306504; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        b=k0QJYxs6KuzAjvp9mY+SBJKxff1R2KzdiUnWvh1kxAlAbqsJAMq3PJybQDLhDqKqnZ
         8rDeQOqi3l1B/WPwN6C/8R/VMd6kcpXGsC9IcEX2RF/Y4C+KwA3DJd7WenAvBAGkc7NP
         MUZEdOqb1VBz7dSpOQ/EeybiMDfpwPT9LwsQu2sUV4ciyd98WeuwWQx1k26/ZBrwoS/J
         6GMFnvWvBMjCW7LQwc5UJBkwh1drAnZuAwKqWvEYbuKGGpIUgWpiV3DhT1PlkYRu1ES5
         E6Fy01MPxuPGApNVDAWhX2WRCHUGGP7r9HR2N1YvD/i+IPogvozPnBOrH5jwoIQUTLZj
         nAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701704; x=1790306504;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        b=gOxU00KwzN70FM72iN4z7OcqJIh9iW3HkbNYJCrFBRslKMd9WSvzHBzgBh/5eibZbJ
         bAdSLFBuynoOT7BxOwNNf0ePtLvQr7zwOUn+oQLonOa1yqFp2TLhUClYlKcA5h5NJnQW
         huWghvwfP3bCYQrO+jAFNnSDVQuM6heL4r+RO+ECv8jRa4arfk+OrzH6kAzbAHQns704
         9XSZSvmJsAUveokhfB7KDDdJG+qU4VqLGiuSoAOYkzzJ8W4G9h8cw2tpDikE1o+lSuOX
         yYj4Mz6m325Zvou31jWoVEd2q3O2q3R7szZ3L5pcsQUzlC0U9kKfusKgPR5GcLbnkHn9
         ynSg==
X-Forwarded-Encrypted: i=1; AKwUvBwLqI4Xk8tAurmmyS8xg7q0SjUnb1h+YENvB3UDMV5T1H3dFG6gMzwOgHsuOYB419ioCT1lx1sCCkHUufg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgeVsZJWjq4cDsbECGFqWg2YRzFYF7FOr3CH0gymxFsMY7QsX4
	GRkc+3z4ms1Zvnlpx65tR9JXXcZ5H4pg+/p33b3n9pEdPVrLYX1nJnc7mrhTOv5FAq465XqYjvH
	nbdbyFc+KaIZgpf9bAQYYBwFdCu9UG75nuAJSn1ER
X-Gm-Gg: AYBFou2dwxcPX2LXMBJVz2qRIfsU1NbznNxI6u9ZiowUTP4fHIqYB9AR6IxcatyLhAh
	bINC/ON1B049+xOqfliGKF/J58BbaFBRTtvOCZzHjq+FVi/QmASEUPoexHoqsR1j9IhxVOv4zjc
	WvCRe16zBVl0oMpKar0qdRAUXXfmDu+uz+vmZKbLmULzloiB17S/2/Q6QeIl468Kq1cqitAb3QT
	5nkbFW0wrDCcAm7kWu9D/6CrsEH5tC5Sh8roBtucd7zqEM9grQe8tPrsCNSBJNSJsbvHtMwvjtv
	7dwvDQ6N1pR5iHsKDVIBwD2DI9D/pWOjB+cAs/D8qlwZiKVyKe1LFSYEvynpqDoYtfLnEX+XXLM
	6Gu/l/iV06dU=
X-Received: by 2002:a05:6214:2f03:b0:8f0:d59d:78d2 with SMTP id
 6a1803df08f44-91254b085edmr20535346d6.5.1789701703240; Thu, 17 Sep 2026
 20:21:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:21:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:21:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 20:21:42 -0700
X-Gm-Features: AcwNN1UmZTajHstBlVwK_8w-qiRF_BNJfwUwN_LNEwXV7xnF5kJXV5qm-KLh0ag
Message-ID: <CAEvNRgGDOG03=faAE_ZA1aHQ7Za8gShUUd=h+J0xZ2f2FaWF0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix HugeTLB subpool used_hpages tracking
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
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> writes:

>
> [...snip...]
>

Missed out replying to this!

> So if downstream people (-stable maintainers, others) follow our
> recommendations, some kernels will get two of these patches, other
> kernel versions will get three and some lucky kernels might get all
> four.  Are you confident that the patches can be split apart in this
> fashion and still produce a good result?

Would it be better to add Fixes tags such that if one patch is applied,
all 4 are applied? How do I set that up?

Patch 1 is kind of a fundamental fix in subpool accounting, which allows
other fixes/simplifications in different places.

> After all, we're sending
> downstream some patch combinations which we didn't test.
>

I think patches 2, 3, 4 would kind of depend on 1. Without 1, the others
would probably do the wrong thing.

Or would it be better to just squash all into 1 patch?

Each patch does fix a different part, and also I didn't want too big a
patch, which would make it hard to review.

In terms of bisecting, even with patch 1, the bugs fixed in patches 2, 3
and 4 would still be buggy.

>
> [...snip...]
>
