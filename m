Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540040;
	b=nVe3dDMr7odPCP/dTOEf8RZi+o1wo3WilDvvwmGxxo2ZNbitCMWopnjiTE2BQksVuUEf
	 httKiVz7m35v7NGPPsCLyJpccbarkmRrKARatLSCqbmKFbIY1LKmU8aeAxsOQFykziKRO
	 kz5gLPSg40e9sbQLTnTfv1XoA/BLwqz60iMDGOEx47sIWFGuzeyxaTKoO0Lvx+XY4rkGk
	 EeF+zKCQpbjcY2Wo8i8gVeoQNEdXC3Lgk3W3l4b6EYUeBNET6nnUMIcWOAlT8ej7T1N0l
	 qDUAz927JKV5HT5CvYPnkLnVKza674GVLTSwshXeTWaJz4N8mtRS6Xjk8ltK2CTx0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540040;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8A2vMb2kidVxxepbgIC9HX3GXSZalF1YRLxBoNXtIqk=;
	b=0hJ7CrcSb4AFxtuhqKGojghBomiV1trL4btkkNecjglJsiUcFHO5/Si48g7taWRLGrEe
	 QrcoSe4lg/F/dysyJaQSSwXe8jCY5M4dk88ErX29ITi2WGM69F5uJh1QjZHhfo8PvMv8N
	 +MgCh9fo+dWnqjPsonJlqt9Wpifq3Bh/5akGWAJKS77BQ19Kprksn9f9W2RgyA7KVXKtt
	 bMg5RoEQxhc9KZrreTjoxb5eZQbMXZO3Hr5k1c0EHsBYD8Ofok4M+Ol0hxCFVT07vzcuS
	 ufLhBKlmr+6398hCQzUIp8jC7PfkDMsccFyiVIEVbawdVLYFb6ghC4ZVBLArP5QQlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=V20xcavw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=V20xcavw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CD91F000C9;
	Tue, 20 Oct 2026 23:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792540039;
	bh=8A2vMb2kidVxxepbgIC9HX3GXSZalF1YRLxBoNXtIqk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V20xcavwH1fqcK9SSgsVtFQhUNOj+/hnoEuFSVhwaz8OlhyzfzmifNT4ZY38/nxEM
	 akGiNYF2vhnAxVk5ZoMGFWPFLmHE71TO6qLMFb8uJhATBjoEOICMKK+8RF1R8fls66
	 gqmIUHwdtYb+EHT97CHm6YynQAUUyGOksSvAP0Z8=
Date: Tue, 20 Oct 2026 16:47:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Barry Song <baohua@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Johannes
 Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, Muchun
 Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, Usama
 Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>, Hugh
 Dickins <hughd@google.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec
 lock
Message-Id: <20261020164718.91017a58befc7940397ecd05@linux-foundation.org>
In-Reply-To: <CAGsJ_4wq8jii0HozMonGej+2O5k90DB4ii07WaBHoOQOKQDokg@mail.gmail.com>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
	<20261020153648.52636815691868735e9699be@linux-foundation.org>
	<CAGsJ_4wq8jii0HozMonGej+2O5k90DB4ii07WaBHoOQOKQDokg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 06:40:23 +0800 Barry Song <baohua@kernel.org> wrote:

> > This is a speedup and not a correctness thing, yes?  Let's make it a
> > 7.4-rcX thing, for the 7.5 merge window.
> >
> > I'll park it in the mm-new branch for now.
> >
> > If people think the speedup is sufficiently worthwhile then I can add a
> > cc:stable to it, if clear justification is included in the changelog.
> 
> This isn't even a speedup at the moment, as no users have
> adopted it yet.
> 
> mTHP folios aren't currently added to the deferred split
> queue. Joanne is about to add >=2MB mTHP folios to the
> deferred split queue again, but even then, contention on
> the queue shouldn't be an issue.
> 
> It may become a problem someday when we add smaller large
> folios, such as 16KB folios, to the deferred split queue.
> So this patch is more about future-proofing.

Oh.  This:

: This came out of the discussion on v2 of the mTHP shrinker series [1],
: where queueing small mTHP folios on the deferred split queue was found
: to regress Barry's fault microbenchmark. With [1] applied and
: khugepaged/max_ptes_none=0 so that every folio is queued, perf lock
: contention showed that the extra cost came from waiting on the lruvec
: lock in the free path.

made it sound like an unquantified speedup.

Joanne, please clarify the expected impact (always) in the
changelogging if there are reasons for a v4.
