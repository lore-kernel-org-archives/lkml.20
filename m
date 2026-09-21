Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7D4F393C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014258; cv=none; b=TjZkfFdUh+rLc5CyjA9YIQjzug38XTmeg8couMIUKkZOaMkCNMeuFsDw7D0XoIxatPNi3VOPwE1OPNfImd8qRPN3NIxsbvdh9JPKxyybQVHKgd7lHXdGES5dQz0ncYVDR9qxof9IGNQTxouxMH6nNGa+PVvTWPiqWi1kTucIuto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014258; c=relaxed/simple;
	bh=A4YlHk0Z4dBpT4St85qh+RwCN1WxOsQET3StnHyFn1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixr+uY1ReCVxxT5UTnki8h4XGDSUYdOvYujjGM8l5KEXNwff04QpGcFQ0KpnqtEnxcrln06CyQeGFpSYsJMtPjFPDteV1hQkdpF0qJAc3aRi8Qbrdo0oVj+yJzwq+hsReTxHIwAooWIxFXnv2OQwqAAT/epsFSCTGnrKM49HB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MChE/Jnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MChE/Jnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013411F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790014257;
	bh=wuTO6WkU+BVPbOKs1CY34gM4QOwUjJ4/vjC8gwb3pGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MChE/JnxobCbG9JoZ+GkmIXjHA4YnhuT8P2bFG6NLvzH+rlgWKR4v5lUxFSSI1eyw
	 KIKZ1V+6HQoTkcnA51udmDXFM5pgv2Zet4mAoayqBbm/4/OgJjLQ0Lo5gIgr065/pl
	 JeDnNRxlkioqRmA3+ilDrwGYYfv59THw2QbzI/QSWZtxTUvgwF9rSdJeCO/FembWIz
	 nkGf80ayMvDQjrCqt0fSoXVGNKjQuVGDLbe+iDT4NC7uQwuihjgoxwxTYlrt62q0A6
	 o+iD7nfrHAMWHswGWyAibl3fhsDvGMGurAh7HYaOQaTpS4m5b3YrB7xZe6l7BsJxvY
	 Kka5XUl5HLOLQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c9995ca60so107605d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7l14qFAZ4KzHoAzcx3+ntOlYWBq0qfIKSZt0FZ6/EwERfOesoFAXDLnD9hkeLScaQljaX6Y1IVox1y7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m92MbQKzx+zFiCPzW6pOsFosces10vHduB2PvNFaOHpZbbMp4F
	H+Hs8WV0Dtv7m/Jl56+h8h4fSY9cA3P2JF64EUUJMiVaP9G5mRWneRnn8Ze7RGO2SL3Tcg0B8Nc
	Labb0AgUn/8NHGpRdtTiZ9tICzCspRgthqigV7X6t6w==
X-Received: by 2002:a53:acc3:0:20b0:66f:c1bc:4054 with SMTP id
 956f58d0204a3-672c2ace221mr196906d50.28.1790014255888; Mon, 21 Sep 2026
 11:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F> <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <e879ac65cb0940325736df7984c737edf1c6be94.camel@surriel.com>
 <CACePvbXThspPYD8DZkAeiJtYuMV79vGgC1SGhpMwhn4COWOtcg@mail.gmail.com> <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
In-Reply-To: <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
From: Chris Li <chrisl@kernel.org>
Date: Mon, 21 Sep 2026 08:10:44 -1000
X-Gmail-Original-Message-ID: <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
X-Gm-Features: AcwNN1Woo8T3qId4JZp_7iimts7F23BOwDAY_HBZQCCsQ8GnkQO5p6KKJ1Z6pBw
Message-ID: <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Gregory Price <gourry@gourry.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:40=E2=80=AFAM Rik van Riel <riel@surriel.com> wro=
te:
>
> On Mon, 2026-09-21 at 06:31 -1000, Chris Li wrote:
> >
> > Give me some real-world examples of people hitting this kind of
> > limit.
> > e.g. MAX(%)  > 100% and still have a usesable system. I suspect that
> > with 100% zswap usage, the system becomes unusable. Please show me a
> > real world case that proves me wrong.
> >
>
> Here's my desktop system right now. The amount
> of Zswapped is more than twice AnonPages, and
> the system stays perfectly usable.
>
> $ grep -E '(Anon|Zswap|GPU|Swap)' /proc/meminfo
> SwapCached:       252340 kB
> SwapTotal:      41523604 kB
> SwapFree:        9802088 kB
> Zswap:           8812236 kB
> Zswapped:       24927876 kB
> AnonPages:      11615760 kB
> AnonHugePages:   1402880 kB
> GPUActive:      13112428 kB
> GPUReclaim:        95980 kB
>
> This is also an example where I cannot really
> predict how much zswap space I need, because
> that depends on what AI model is loaded,
> which drives the GPUActive number, as well
> as the number of browser tabs.
>
> The system is perfectly responsive.

Great, that is getting somewhere. We are talking about actual usage. I
really appreciate that.

May I ask what the total amount of memory (RAM) in your system is?

I am not asking zswap compare to ANA memory. I want to get the % of
the total RAM.
I assume your desktop has more than 8G of RAM, right?

Chris

>
> --
> All Rights Reversed.
