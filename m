Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E6B5158B7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089024; cv=none; b=colzom1NPG1z8Ycui/XeuoAC0rDExxQpfmgmMBn0r65iHX7KivrFIKS7W3VQ1cPonZCmCJH/QSd2QrcssVc7AEyvjiRfeXreDD7XQ6S2ycxj0g9X17rxW4qpNOoojVVlbSNl/vJBpqDUaggAZ0cUzZOEuBXFNV1nAMO1DQM+Jco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089024; c=relaxed/simple;
	bh=QPkW4aVoe/0NbA4NwEjKqNu/gW6+hIbN3gcfVZFJ3bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6rLmmNMSY4xEJhhgjEmO/TK3zZA+gpYs5N47H4nW8UARyleYMvtEubvt+VdKKin2P1dFv0WuORDf6pYRkHwmXNOyAGnYCQUqU62UnOA7+xiNyOfLI/2hqn4vobFediImzzebdXLhOSh/w2g1prmgz+7mePZaNaWakwVjpyd4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU5cizik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU5cizik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6681F0089E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089022;
	bh=QPkW4aVoe/0NbA4NwEjKqNu/gW6+hIbN3gcfVZFJ3bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nU5cizikVeG90hQ67WUZ/2iqO23zxRSX4tvcl/ihr1EnECPjY3jsEUifxf5AuFoXk
	 PD8AYKfvhCHXW+PTVhgd9Iz9l79DsIvD35nCLi+IQPuElmiTZ8em9P5wbYFl3bFtFy
	 bv/WZIVg54XgkZjFOtd8+mknkwz4gCLYi8diXG/Um/OIiVrNFUxsGL3hZGbcC9MfWS
	 qaIm7Tgbad0joSp0XFTY1WdvyQgQWROQxbBoAhM0UuEyyzzLO0vU5q+02QWvfQ714w
	 M9USA/7XkCkmohYmSEQ2m2UFUqpDsmL5KelcVBUG+EWB1gV/KsTpWZTnyKOJUoQdRx
	 Os3tthbSa8reA==
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672c2880f58so1192526d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:57:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvr6bSM7QA1t5WG0ob/uxl/qO78KoRKhuNUJEgtuY02iXWrcyfMhrm4AJQQg+m4NOLO0kzfglPL1G1HwY=@vger.kernel.org
X-Gm-Message-State: AFuF++mWi+TBJC4/35zd6PwoS8pkTsl3Y17ccd6p75Uxwsce7BuymqGn
	iIt+piyi1CmcPL7sWI6Kg6xWqWP/rggVBwtqEBHYkPVvVflqVT5icE+PCVKkSTQja2bkcR9ybid
	02N1O0Nc+Wo/IO+lIQ/q8v16oxkv1Ui9x3SXz9DXGSQ==
X-Received: by 2002:a05:690e:454e:20b0:66f:c1be:a65c with SMTP id
 956f58d0204a3-6717fdcfd37mr3462183d50.78.1790089020967; Tue, 22 Sep 2026
 07:57:00 -0700 (PDT)
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
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com> <arKRdaNEaKvFOtMg@linux.dev>
In-Reply-To: <arKRdaNEaKvFOtMg@linux.dev>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 22 Sep 2026 04:56:48 -1000
X-Gmail-Original-Message-ID: <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
X-Gm-Features: AcwNN1WXZFPYF0mNrLqLpQPBa1zvff82T2VNW1CuKAu09epCVErwfyw7KrXxM2s
Message-ID: <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Tue, Sep 22, 2026 at 4:43=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> People can speak for themselves and suggest other time slots. You do not =
speak
> for anyone but yourself here. At this point this is derailing the convers=
ation.
>

I am expressing my opinion, freedom of speech. As you can see in the
previous discussion, Baoquan wasn't able to join that time slot. He is
a major shareholder in XSwap. I worry that alignment vswap vs xswap
without Baoquan is ineffective. That is my opinion.

Chris
