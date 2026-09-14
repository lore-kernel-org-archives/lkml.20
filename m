Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A426AE5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352599; cv=none; b=WoToFK+BK2zXZY+M+qcxasHnWkMTXaumCcP8+F5giIx8N0w9GWgKZ2cKrSwya2fXZCC66QApQI0G4/Q49YJ+mN/4sfFrBjyNz1INS3qme9ZMZtDwx/jMtglzQmIlbPuUkhPU/30ZFUkvfJGm90obonxiBXoW5gY6r6QUnkkEPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352599; c=relaxed/simple;
	bh=bX0pjTa9Tn0AVWcZC6pQhwNld6XbQ3MUtrmnVQtVt8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUq3bIBAsL02W5tox/qmuI3u+SDbx/6neDnTFi7WB6Not1OhsZ3N9cvTPdaMm9FXnO8XNVKkhwmR0/Ps1jgs4o6Bpa5M25YS1zEE2UlbMjpKAYzEOJIrSIm/rn7YmTV5lk9lSi34++vNk5D30JYASy/7MKLmssSPFUMy18Vp6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP8lrjCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP8lrjCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB271F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789352597;
	bh=bX0pjTa9Tn0AVWcZC6pQhwNld6XbQ3MUtrmnVQtVt8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NP8lrjCdC6xxiHUtzriW3YAM3bjzD7h5RrodDsp8uSW9wnOAgFf6MN8uOM9JlAclD
	 W5PkIOEHPDakuulH0Tso+l4gUGwbdOplb27I0epU9FkgSviPy7Ac9KS9v4EolNIGZj
	 W50PHPzwCp0ubAcO7NEvhLu176Xn0xmoGt3VlDsB3SAnVmJ424Ew32lq9Km+4YIqCh
	 9sZnlXWfKmmGGs2qhZN3KjQ4aK6hWVQiLIC3gn9iAfJbNH5c9RflW4YtwC568y8NXJ
	 KU0oyRJZGY8rNPBUvtY+0jTzlkA6GQNdaMBE8hKUYRw8lwqnykP7bwFhvJfpEDyvTC
	 7QUzkZUkLw5nA==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb4so238245385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:23:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR+N4aIaHbA/bk5eQsCzRYQf0SzVmPK08GPlK2ISckXLaxuiIGC8mxCpF3r72eH/QP6zllAB76aHEeP88=@vger.kernel.org
X-Gm-Message-State: AFuF++kA5gBhNFm22qXGrK7Up/bk1zH5GPg7yDX8RUt6qJEDVLBlHtx9
	1Bb5yRtwF7OJmSbYv0E9U195SUlQAIUj0O71usF+/44NzEGsZp2vZD8TFlHBR+Ry2/bLwKEDEdD
	EryMXsB7xPBmI0dKgQ7yoDzVm5H9+ECo=
X-Received: by 2002:a05:620a:461e:b0:938:e23a:2ce9 with SMTP id
 af79cd13be357-93a297fcd98mr101954785a.16.1789352596625; Sun, 13 Sep 2026
 19:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 14 Sep 2026 10:23:05 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xiWAs6Lxyec0dOiJTKyJEA0CfRMAWL+7SEcSjwpq2-qA@mail.gmail.com>
X-Gm-Features: AcwNN1VPBQqv9vFICNTYvJvIbMNevtTaersk2NCAqG67ENWfn3vhNYJ9jA9eluU
Message-ID: <CAGsJ_4xiWAs6Lxyec0dOiJTKyJEA0CfRMAWL+7SEcSjwpq2-qA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:13=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
> ignore any THP or mTHP interface settings.
>
> However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" seman=
tics
> for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
> depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
> (although that is the default), which can cause MADV_COLLAPSE to fail
> unexpectedly.
>
> Fix this by returning the result of shmem_huge_global_enabled() directly
> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignori=
ng
> shmem THP/mTHP settings.
>
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP w=
ith anonymous shmem")
> Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shute=
mov.name/
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
