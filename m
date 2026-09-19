Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BE3515F9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798700; cv=none; b=au26I5z46Hu6RhPTvi8LvCHcSniBQhAcgnx/+w5XY2d0fvgMT/xt28MBuuSDiDMuVa9iGE4ESxAass/xSpfJxEF5tZes55DElI64OySwfXA15Gd/C2yAdjd+r0TPz1SgecU7w2ajYFPZWrkfM34C5IB+WFZhnuK3nt5c6SvZZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798700; c=relaxed/simple;
	bh=MuYukX5INqydoTMDALYUszoXPjgDgYIO774EajtmC10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6Fl4hCC7dFacCmex3GhZAessZukH/A8DPnl03pcmyGT7aiPRxneBE4tgO3eZoqL8vaZngKNjJOiG+B16gMT+E2Tt91aRUvY6vE0UgIqpljBgDaAv5H8zUEKpNVIkuw9z7IAmDKU4JRnymsWHvU8lXKIGeJckdpwr8HU7Aq9dz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhQhl6ID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhQhl6ID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C1D1F0089C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789798698;
	bh=MuYukX5INqydoTMDALYUszoXPjgDgYIO774EajtmC10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WhQhl6IDBrdZE5rCZ5I8JzPYQPTtXz0KhEMoVEFaHjSWw1j1eTuG3pFY4ceQydwXs
	 WHsAl2/Ke4skSl95+T7DCRU0VoQb5zbC31q1cuzLdV0VFccNyeXp9fa+d3owCUPRfB
	 KoFRg2Iy10GntefKp9jh+zzd9hVQURaB74Uk7C0it1QK7ATtUbe8OhWp+kbzJNpwTX
	 KKZCSvN0IGaCxEd9qDdJp6wN0NQZXgLCYk53b6Z5q3g0JwIx6bfQzSXs9kpgZPcBW6
	 qB6wuUlm3+jFpokvyR6ZS6E9XyA0MgFia9RgVNA/B/yOOYFboRiLWwBJpnU1VsWAjQ
	 y/tF+h5Hsq9Zw==
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93910cc46c8so160536485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzg3AquJt2vytbmq1aepfkB363uNPw9Dq4byGBTBMeje1GWJUSAPxeiaw7JHn818W9VqPF0UjwV4ipdKSc=@vger.kernel.org
X-Gm-Message-State: AFuF++kx43ZU6FuLuMmyKHcc14rb5Ok1lPmWcI/k/suf1kEvYDRXNkUt
	Oeq8AsrosqTHkYyBFet+UOaQIbU08JVz1iGCDPvfmkBs8trQ9k5XNVCXryOPvIyTe1zgJpq4cmw
	1EC1HNjmPqrMeR5fzbOo+4RJYtU4hqV0=
X-Received: by 2002:a05:620a:3910:b0:93a:c102:1123 with SMTP id
 af79cd13be357-93bf554adc1mr27973185a.15.1789798698170; Fri, 18 Sep 2026
 23:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918165642.1014988-1-ekffu200098@gmail.com>
In-Reply-To: <20260918165642.1014988-1-ekffu200098@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 19 Sep 2026 14:18:06 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zgZrFXih-+r4-p99rqXS2WLrGK8STkiOQnDANrTP5JXg@mail.gmail.com>
X-Gm-Features: AcwNN1V_qWtR56zqhRr4dQ7q2dZ6CDwICSFPFUz3g3qe-hpoDFs2u36SIAE_S8Y
Message-ID: <CAGsJ_4zgZrFXih-+r4-p99rqXS2WLrGK8STkiOQnDANrTP5JXg@mail.gmail.com>
Subject: Re: [PATCH] mm/swapops: remove unused is_hwpoison_entry()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Baoquan He <baoquan.he@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 12:56=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.=
com> wrote:
>
> Since commit 93976a20345b ("mm: eliminate further swapops predicates"),
> is_hwpoison_entry() has no callers.
>
> So remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
