Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC03C4176;
	Fri, 11 Sep 2026 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126354; cv=none; b=jjC8G8GrQJHy/e0tsiGGN88lTiEmi33EYaTwY2fhEXjIG7u1HrIVgsXG3hl43LBY36j2AoAHmvRoHWyu8/hlcC786ykRd3bQRXUwUf15wwOQFnnWHSSFaLuL57JN2R8P61/3pl9DmUr1RUT+5Mz7Qe7WhUdQDZv8TnJqm+wU6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126354; c=relaxed/simple;
	bh=mcwyVbWOJ/TfKmQoQX0l+SJ37BAG5DpRv7tbIYppDXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYV3WwEmAo3S2CadhuuSR6U+4bRiFC0OnbXigGBQcESWAwKWwvMTIoZTcgpNcHbj8m2q/Y+ZSIdm07fi+YTXDVH1DY8DwyMKWmdZ18SUnSjkSqS3/P5I8u/3nWW8cnIERTTgXOXGk+7VvQ+jdHZaQq72D5Df0lcChzS+BK1v8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngM6IP5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngM6IP5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC751F000FF;
	Fri, 11 Sep 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789126336;
	bh=mcwyVbWOJ/TfKmQoQX0l+SJ37BAG5DpRv7tbIYppDXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ngM6IP5Ips1PcyuAaKQbkTNILTCi2yDow4kz88XMamK6hQFrzuA/ESPzyS15dRNbw
	 FdmWJsmFkS9jr6N08h2gs/F3PaZPuZy17cbKN9gZCCvBPtGmHPOR5WqHGMbM1iAcUZ
	 NQ4r3k53OB3+Q+fPnQK9UrYKubf3EN+9cILPUQ7k9qlBmQ/s64uSpA/sp/ohSiVFPZ
	 wdrRH6e0np+Db0X33f+GJ39tvmT/ogqM8iLLHiV4P509K2Qdx6kxH1uMTifIVjkvs5
	 p1e3ZDZ+YAuHokDI60IrEgub3Letiv6f3QEpSVAuPRbmp6ESv9FuSTlyEydhvTspWD
	 jhxYV0ocEITcw==
Date: Fri, 11 Sep 2026 12:32:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "zhen.ni" <zhen.ni@easystack.cn>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Message-ID: <aqPmlw8WYW9HSzIV@gremlin>
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
 <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
 <d8d34e16-57fa-48b7-93a9-afbf4b950ce6@easystack.cn>
 <98ca914b-4722-448d-b5a4-7f095d0ca433@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98ca914b-4722-448d-b5a4-7f095d0ca433@kernel.org>

On Fri, Sep 11, 2026 at 01:06:46PM +0200, David Hildenbrand (Arm) wrote:
> On 9/11/26 09:58, zhen.ni wrote:
> >
> >
> > 在 2026/9/9 23:54, Zi Yan 写道:
> >> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
> >>
> >>>
> >>> Because it results in less kernel code  :)
> >>>
> >>> And less kernel code is good. Unless unavoidable.
> >>
> >> An alternative is to add BPF hooks like bpf_iter to do the filtering
> >> and by default, when no BPF program is attached, everything is printed.
> >>
> >>
> >
> > I’ve also thought about a similar approach—perhaps a new bpf_iter type
> > that could iterate over all pages by PFN. The advantage would be that
> > you can fully customize what you want to print and what you want to
> > filter. However, doing so would require refactoring the entire
> > page_owner, and I’m not sure whether it’s worth pursuing in this
> > direction.I’d also like to hear everyone’s thoughts on this.
>
> Certainly better than having more and more manual filters added to the code base.

Agreed.

bpf seems the ideal fit here I think?

Means that those who want this information can get it and those who don't are
unaffected.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
