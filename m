Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB050128D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016967; cv=pass; b=XcZzYCWTchBMVl7x8+UPqDPCKIOeL18TxTAotZpNccwv5qvdwHGG64WFWokmza07ZHgWAwsQKsjBB8HJtjhEUcnCX3w4mkCPakWP8X3s565nAo+cAo5mwHJqfStapoJ3vQV5TW3fvP11yzzGjCf+lrgjAzfY3eloWWg9uNwNy1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016967; c=relaxed/simple;
	bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kONVjdD/zSfIn+1tlWVWUwa8xkChEiTGUZNNrAa5Pt7+Yd36lNtK44XPOvRxWG8Gse3Jpb2e1bKlQC4USDT1UoQ8WkzFDdvNDegce8aYQMUBR9aynWc/8ahLrB8cux037i2a8k1MyfKC1TNTL6EqpIJ3ISjcK7pdEluX/8ME4f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPU9tOsC; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPU9tOsC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2612255f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790016962; cv=none;
        d=google.com; s=arc-20260327;
        b=Do7xAPSwymG8P1EroH/bNrJi7SnQfVxWmCQR8L4UKWNi8rrdMcoOG3XvGDJ4+bQy+b
         jEl6uGtjPuTQOfmIfDqzyHV5yr02RH6s6YGYFC9TZCknWGS9Q4uxaTZsQ2hqry6vD4aQ
         JaJ+EWvgYFKEYEqsFNPxHVCdAsiwhe2o+ZZs//r8OK5B4Gwu0/PifwmN/UT7qHQ85F7R
         4sV5h1aJm+mJmcF57GKq5Ig2lS1flbzre1iYYDkk9mlCiNHt6tdkgPr0cRHPs4VaR1aX
         EzZLwMBWR/39ANUyJoRK18q6P39Ms1OSiNaNHVCunUpIh0FLosPlDBr+H7vXH1/iSn0L
         gTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        fh=/FvR0cBiG9oR+p9xHXYb+vMqxGp2gbEe/aP4kX7FDAY=;
        b=sf1Bp4s+xQiD21RL2d5/Ot28iRDZs0PX0UZQlvZ/f/FKr7JcyzQVk5IPKnID87dHIc
         WADXZxMdP14/+nwS54vYd14JPGTaKwvMSDpDVEgAyf4lq2czKBUQQwZp4y+ECXpg/ZzI
         DQGe47g7BrOzp7223dXo4F/qnF205gd6M9ugjydBJR4DUhX+QT52cXWVzW6LJs6ak2ET
         zsvrYAXPFGZOwKNu4J+IgyHPTDA0xHjjyQGSrcDMx1txah/sLgVpJ7P1nuhIIT//PLTL
         290P7caDwP3r+LMSaSo/CTGoOcGq6vHn9iqCmDKzgqbjGQxbEF4o7P4hHeq4QX/CTnP/
         35Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790016962; x=1790621762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        b=DPU9tOsCqXqbBraOPxqWp1o9AB/EkHB2jwVYQ+lTlX8ZwJwyTT/Jxfkyr/a9Jlix+/
         dpAkD68t+y0gstZ2/HTRyEKwrmnXYSunHLpU28k40cqc+WV2A25u4isPw9wXMdlOVr0u
         fa7E/jVP3lTeNARJK7pnVVac1vULG8qRUbSi2XHrJZf5MglCbwkqeMlXHNDb5I6TP7iZ
         ZWQakQ0kQkWtw0nyAZImz5h15i+uE9YTTxu9C5oMFGQZywoEKi0BTiGilZp2K4AK3OvV
         99ePtEkCEyqqX3/vXozgEnL95Lk4I+91InnHCOLgf/GpOwWmVmTOHyJ8rWP3ML1uB0jC
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016962; x=1790621762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        b=JpsUyHfKIbTz3bUUz8E+6OkZCa/IuJCWFbZKpW0pN1nTxHF9djeQyD2KeJgM51ciBz
         nDIZeQ7+9VNGNmQ2tfEzyOAwZesdAiXIAByLwZLYHcuZzJzVtOqfuV8GRqagE1MhR6BE
         TS50rRMZkJyIRwWEeXI4oVCNcRFfx6URJp2+jPSP2xynJHZGtAPjPgSw06JscL5s/MeU
         JA0e/Zv2FhqX46xg8fuegDgfl0FStRi/UP83+YOgGackECXydTkUoHrIPE1fynlBqgQ0
         ceps0JodtPa5FOmnK7tRZ5tbIZte5lYrE4LaL8H+MtYGjqBYeTMym6l+ko1DC86ry2ye
         rW3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlvaTHvOfmhZoSaF37ov/VbE4jF6KkQYwAOY6WCCvRTM2UkJhNm356blKSobIs+D7uDhDnghUXmX3Hm4o=@vger.kernel.org
X-Gm-Message-State: AFuF++npIm2tW++u0FYBw9fo6gAu7R7gTkHOn8GGVkekTchUMJVP6X9D
	w5J8l/b8uAW7IXbpnGqoLiloeIjtrjJ8szUT/nb29AhXpJOYsl+DWjs10adphbEcYJYOMEdHRYX
	AjMMyAYPi7zgt2RVZ2YV1ufmV8X2bgc8=
X-Gm-Gg: AYBFou0nlVil80vnBhiiQ+BO3FK9OqzstMIqnnVT3AHrQBREDji4NqrinVQ2YTGiIuQ
	ljGBFWT9CfuhBCfwcMZvcahhBKD4qwxYLxrbR7ye6Wl6op1WzTGqzdLz+LOCJOefVa53+mugRAb
	qlMyVwrB5UhJqP9Ae1Axoxph2GiAoAG+Pun9LVJmUmynnTq6kvvEr804lQy/GdV88DiHLIYCk92
	r6yWqIrgOGEkRdmnny/SK6AvGnOhjYFpSqNM0rSHJT8J2sEBsPET78o5dCuuSR9hl6P5gUQyTg8
	flI5QWMNMqqOizR4peN6N9kQJcN6ySSZqONQ+Po/tuDE6I8r9iX0hL7ywd51KkitxDYqm4jOmTX
	g4USlnK9isBI=
X-Received: by 2002:a05:6000:26c6:b0:487:fa6:d7e5 with SMTP id
 ffacd0b85a97d-4871e386ffdmr22164283f8f.25.1790016962241; Mon, 21 Sep 2026
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
In-Reply-To: <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 21 Sep 2026 11:55:50 -0700
X-Gm-Features: AcwNN1X9C9t6jZ1elLcVhCMK8X-LC57IMfgOb3DvTZPE3O0yZGqwzYORodlnY9A
Message-ID: <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote=
:
>
> On Mon, Sep 14, 2026 at 10:00=E2=80=AFAM Baoquan He <baoquan.he@linux.dev=
> wrote:
> >
> > >
> > > Is 9AM PDT fixed, or can it be adjusted? 9AM PDT is midnight for the
> > > UTC+8 folks.
> > >
> > > The time is still fine for me, though, I tend to stay up quite late
> > > anyway ;) so that time works fine on my end if the slot is fixed.
> > >
> > > Is there a calendar invite or something, please send me one, I'm happ=
y
> > > to do a swap sync discussion there.
> >
> > Thanks for opening this up for discussion. While the time slot is a
> > little late for me, I am not very sure if I can attend, will see.
>
> No that time slot is too late for Asia developers. I don't think we
> should use that time slot for swap alignment.
>
> We should find a time slot more friendly to Asia.

Any time slot would have that kind of problem. We're spread out across
the globe.

Let's just use a standardized time slot we have for MM alignment sessions.
