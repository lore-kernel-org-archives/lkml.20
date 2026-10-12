Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB19443C08
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791824; cv=none; b=rVIjUuKmQQE/vCGUXFIc4+aeeE7IfAjq3dNhRuQ22j3gRXpqhPlU5dMn3+JxhvO5DI7tuO+C91n0/ImgLUi4pRyp+31lz/mv4B6y3V4+GmQMoR1by6iGzidJoShb1urytTeuVMcqmOHqRWtWRxxIukh68T0dxLOcDJNTWwCnrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791824; c=relaxed/simple;
	bh=Ux9y4FURPjiPXdKEGUNQKnMgS7prAKTKqzlVFy5n2HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeJj1fn/Sd0fGKqQWk22BnBBv/4//v3vLnyzfw2rbzcux9l/rxO4SAMnloUwhiYcco0Jeer4pPHrdoQa7oOJWg/d+shQ5/7lH1y6l28F+ZYR+AzxPU7XCVPnrh8MVLIutOHTbvW/1xgoQdgfeeK7eXN8IJPURrdSsmQ1C8UpHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCp5AN6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCp5AN6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FAF1F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791791822;
	bh=gowwe8axss2+O2HwBq41jmehPF78rOiKV0GKeG6qTnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YCp5AN6kOS191mseGl+KnE26nqDGIc9TCMHWBCPFSyVGzakxThxu4+h00m6+H2ojT
	 MgK2QQ0lp+fmB1vcsEHNGXS+9GbTjxYbCFK/7GZMU6BFuX75T4a2LSbkG7TSI+ytPE
	 QL+kb7P1BMJcWiR507Tnh/jg69j16hzJql3GOuBodlFPk7Mk+4JNyhTQHQhgiDje/A
	 hsWAzV4aEWPFZ81cMF2g4H4WQZf/GoCUX2Za6al45NJr3lOictWLvr2KNIHKc5k5Mw
	 vnejxbBp8aPdy040DJqX3YgaNH1VIleZJnEWONXv+hq7RPgHdeKUsH5PB1dMaXEKgf
	 EttyiwdA9w0KA==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso32893316d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:57:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/fLJGSoBbjpTzYZc2M9hINYGJwvW60xbIFMTR+eMckt+9gkr6MIWLzdiNym8Kwuf5yHk9SpIohSJFl2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK70T3k9/MHvFAPHiJtliwJWM3Iqd2bEIfW+AoKWmx+v4i7n0T0
	3OFLHz4Pqt6X2r3ju4czxpdwgEEcD0gwySV4Z/QzOCsK1xoziyuRjC//YTd9dKLvhzJ9Yo+0xSB
	Cw0HQna120IwCjnV40DIc81VXM3z1JkE=
X-Received: by 2002:a05:620a:2b8b:b0:93e:c12c:fbb6 with SMTP id
 af79cd13be357-93ec12d082emr1367857085a.67.1791791821896; Mon, 12 Oct 2026
 00:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAO9r8zMHKmAQT8WBAd+kkQEjETVvyHhfbESzKHpXXPQJUB9nVw@mail.gmail.com>
In-Reply-To: <CAO9r8zMHKmAQT8WBAd+kkQEjETVvyHhfbESzKHpXXPQJUB9nVw@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 15:56:49 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x3JL9JW2cBXPo0j_8-2d6XQQGSpBAkSf-8Hw9N=0o=6Q@mail.gmail.com>
X-Gm-Features: AclHuK8gJTkY2DRBIX9AcRDZ89iXtxeakHxULzQhlgHDZmLjl5T6JH2Ua3dDbhA
Message-ID: <CAGsJ_4x3JL9JW2cBXPo0j_8-2d6XQQGSpBAkSf-8Hw9N=0o=6Q@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Yosry Ahmed <yosry@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Kairui Song <kasong@tencent.com>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, nphamcs@gmail.com, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ryncsn@gmail.com, 
	chrisl@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:37=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
> >
> > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronou=
s
> > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahea=
d.
> >
> > zswap is the same kind of in-memory, synchronous backend as zram, not a
> > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > swapin_readahead().
> >
> > Here are the results from bypassing readahead for zswap too: it was
> > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shri=
nker
> > off, on Sapphire Rapids and 3 iterations.
> >
> >   768M memcg (sustained swap thrash):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          405.0       341.7    -15.6%
> >     zswap-in (GB)            79.5        53.0     -33%
> >     zswap-out (GB)          144.8       115.6     -20%
> >     swap readahead (pages)  6.79M       0.45M     -93%
> >     swap_ra hit (%)          72.1        89.9     +18pp
> >
> >   1G memcg (light pressure, build not memory-bound):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          177.7       176.0    ~same (no regression)
> >     zswap-in (GB)            10.2         7.5     -26%
> >     zswap-out (GB)           27.7        25.1      -9%
> >     swap readahead (pages)  1.07M       0.08M     -93%
> >     swap_ra hit (%)          68.6        87.2     +19pp
> >
> > Similar gains were observed on an AMD EPYC 7D13 host.
> >
> > The gain is from no longer prefetching pages that are pointless for an
> > in-memory backend: readahead inflates anon residency and thrashes the
> > page cache (file pages get evicted and re-read), lengthens each fault b=
y
> > synchronously (de)compressing a cluster of neighbours, and adds
> > compression traffic when those extra pages are reclaimed.
> >
> > Bypassing swap readahead for zswap therefore makes sense.
>
> No objection here, I am just thinking about Kairui's LPC presentation
> about how compressed swap can (in theory at least) still benefit from
> readahead: https://lpc.events/event/20/contributions/2421/attachments/211=
6/4689/Better%20Anon%20(Swap)%20Readahead%20(2).pdf.
>
> Seems like a big portion of the fault cost is still outside of
> decompression and can benefit from readahead, but that isn't the case
> today. I assume any future improvements to readahead and re-enabling
> for zram would also cover zswap?
>

In that case, if we can develop an accurate readahead algorithm with a
high hit rate for readahead folios, we will probably also need to map
them at the same time, as proposed in [1]. For example, if we readahead
4 folios, we should map them all together in `do_swap_page()`.
Otherwise, the cost of future minor faults can still be comparable to
the decompression cost. Readahead alone would therefore increase the
total work, which can be quite significant for synchronous I/O.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4xM=3DWnFO-OuwVude-DQ_UkaCi_zF_b=
XBP9Li5+ZPNy0VQ@mail.gmail.com/

Best Regards
Barry
