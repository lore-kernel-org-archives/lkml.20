Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785266;
	b=z6tXqgEmJ04uuQwZaGW2eVbmIkjMmjGC0/eUA1cAlC6KrPSmk+6Y3V2egkrsBRbP+AbY
	 BLVwS167XXwqzFm/3cG3wqs0cpykPC0p5/vs0UFyPNH83OwWRNPVsvHzM2PCMu9MNXPmG
	 wqUTP77bM/w96tmuYvbZ9PDQs0P6dDujzCleSvnILU6pTApnJCFqiW51Jhpk+q9oVhTrl
	 gkCc6DpqFR7Y+Re/HJYkITQsr3iIOAA1HOmbfELyxENgk17huBElSq9jVw8UV+cALZ/6A
	 NXi/c2KHZLCs1Pc+I/eopzkv5DZe+e+7tOMa+3cfx9Z3i/mToL2pVxPkIabnJoGPZWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785266;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4e2r44nu6mA3b6XLEZGRw9TnvEFy49nMx0rS5f2LA3o=;
	b=IsEiAx6a4VK6WGPD/Luh3bjQBw73/9id0R7DlOzs++DmatVE/TSbEgTsFuzkEsyjKrd/
	 SJP+QecrST4tr9ywNKTuxuFZQ7+y8nSql6KZLVEb/pd6H1ZGbXrs09V+Jt5v8CWbfz1Mq
	 2yzhaCFoWvFunTR+0O67jj3fqC8j6iRifkb6uxILCtqCoxNmMnJpnaBO9orqqkZPngKpU
	 5HmE+oN5kUkmSEFshgAdOiP45tUmJbupEBmtmjVWBtOkPz6OlwHlU8ckjunQ9afDiSW7L
	 O8z87rmnj3XomgR6qCiu9El+uuwSrcBq+BOycrIqevVsrvtvQZ8DvXfMrNq6QAAumOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irxaE76T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80736606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irxaE76T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD2D1F000D0
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794785266;
	bh=4e2r44nu6mA3b6XLEZGRw9TnvEFy49nMx0rS5f2LA3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=irxaE76TZjaVoncSE9tYDvA035iKo0NS6IFrvq0soJjDMJcqKfUabYXayabxsA11J
	 qu8i1rWFTkh9fdw0DsuLmkjq1imog+nzXDJXFowNScocCCuYBBEqn7abpRKOdQ6MdY
	 7eaLXm/kawL9b0IJwxHVioB12iKCTVIUVLJ0/BBrDp64LXvByHLKlAK9ipEuP538gv
	 6dBb33RlpplulWrSbLviKV+2CIL447/faQzIGAUxjn2PQtHY0gbtTVgCprgGSeO6vk
	 N4X+Qlq0F4PuJgnLeLlRlVkTuqhU8yNi1cdgKlDpmH00fALA4dBQ0oPcopZXHVzkh0
	 PTt+JKVVmWang==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9497a167a6aso53208385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:27:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFymfKSCLpL8hsIScK53BiySt2Af5jF+zQzUy2nJ+ElH0JZXrTpyVsEJ3PJbTBO8TfhhsFIOJR6uubFB7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BnlBU9LoyRx8jPOcNBtkGiSKxnS/R843Nj75kScrKp3paklld
	Pa3xwtSSyqDD/KzTJr9WR6mT9H+1gCGENF2y8rDIfvpcZovkNV4NjWOzwmQla6dNwjUuZ7VTYpK
	5hr1HntmBDfflHzoN+fI9Q9hagAQghas=
X-Received: by 2002:a05:620a:172b:b0:949:6f45:8244 with SMTP id
 af79cd13be357-9496f4590bcmr630546285a.40.1794785265663; Sun, 15 Nov 2026
 15:27:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com> <20261115230231.21194-1-baohua@kernel.org>
In-Reply-To: <20261115230231.21194-1-baohua@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 16 Nov 2026 07:27:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zrBrNGa9Maw07s7DCSYc1VHM5-46tb6JiTom4-aEQQyA@mail.gmail.com>
X-Gm-Features: AclHuK-BHmlNrclwISN8ugTRlIUZLjtm3btle4oaGFFiLuEic3eqQoXD008317M
Message-ID: <CAGsJ_4zrBrNGa9Maw07s7DCSYc1VHM5-46tb6JiTom4-aEQQyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mm: batch TLB flushing for dirty folios in vmscan
To: zippermonkey@icloud.com
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, bruzzhang@tencent.com, 
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:02=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
[...]
> > ---
>
> Hi Peng,
>
> Just a quick update: this patch is still on my radar. I ran a
> quick perf test while building the kernel. Without your patch,
> try_to_unmap_flush_dirty() accounted for 1.75% of CPU cycles.
>
> I guess there could be workloads where try_to_unmap_flush_dirty()
> accounts for an even larger share of CPU cycles.
>
> # Children      Self  Command  Shared Object      Symbol
> # ........  ........  .......  .................  .......................=
.....
> #
>
>      1.75%     0.01%  cc1              [kernel.kallsyms]  [.] try_to_unma=
p_flush_dirty
>             |
>              --1.74%--try_to_unmap_flush_dirty

It's also worth mentioning that 1.75% may look small because
most CPU time during a kernel build is spent in GCC. However,
relative to shrink_folio_list(), try_to_unmap_flush_dirty()
accounts for roughly 10% of the CPU cycles in my test, which
is quite significant.

The following shows the CPU hotspot distribution among the
functions called by shrink_folio_list() without your patch:

swap_writeout                 56.93%
folio_referenced              21.76%
try_to_unmap_flush_dirty       9.60%
try_to_unmap                   5.10%
folio_alloc_swap               2.80%
__remove_mapping               1.42%
free_unref_folios              0.46%
Other / self                   1.93%

Thanks,
Barry
