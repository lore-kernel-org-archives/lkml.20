Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A02D0C63
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570071; cv=none; b=mw9spNzLMg2KHYfURS9w8qlt01v6hSPgc9M+XnAZSvHkrQPErS10QWBp2VtnTNDJ4jmiDkveFTug5/kZghVvowVLnynaMAZ5wq/VmFiXS3ECouQ5J67Koj1l28PIHNzenlRYieRh7wKb1M0/6YexSl1Cd/PzsddA0SQfnVMhuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570071; c=relaxed/simple;
	bh=sQ50U5hG6HmcHZDgDwkl+QovBgi45b8ooFB/jG/eEbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9iTNhfXdfbk42AJM4tRr4pP3LyU4eV3/PINPEoGTHIP2NSzxJ+BiLpgf1/q+91vFnzQjMXfIcpB9GPl6E0UBfPUEzvMndKXViBRo6ldCZVuQfwr75T/4vw0HM69L0fcxXIQ+vfYIMgty7wsBvGrHRbzGNgI6Y9JumK9RGPZy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFx5mQD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFx5mQD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903A01F00898;
	Wed, 16 Sep 2026 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570069;
	bh=gl4re9AZZCiPdVjnIeC4v7l47zff3YDvqfCdzOAEhGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFx5mQD4OSRwigVj8M/0oFaSBQafvaIHGHyV0nDBPtehlEpmcLoG6cfiRyAAiTEx8
	 GLD24JKUgmNrTvkLf28kJacrKaNvcv2YUHvxEry4FMTcR4J0kCJ06JcKcJsx8+LieT
	 Qp+eXjOXikm77e8NHRIvgdeT8z73gUYnJGyfN3DkLXWlLmzmQ1bz2m+T+ec1TK30XC
	 w2fnCiE1JH/JueWRQPlcaKjx8i3M2D+R9H1fBrDHGF+EtNpq5F2JFQDXXshfcUnHla
	 c+UhVI9uXOc+bwxLHx6a0+w1427EU0XAIxjWO97se2mqKinwnJfz+4gHPVTXmwPAQu
	 BknqaJD1G/oeA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 297CC198003A;
	Wed, 16 Sep 2026 10:47:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 16 Sep 2026 10:47:46 -0400
X-ME-Sender: <xms:DKyqasa45ePXpRyDAq_1ciz1qNCGdo3viJpOPVtPy2XmBvmYyU-7IQ>
    <xme:DKyqapsmvCMzYv1uXxPQFfqhjixOwJk9jCSRbjghuBD67sa_PwUCmsuWO5yiMm9xC
    jM1kiTKMr84DEr3XuGTGQB5LMA6cwQRJ9EQK5Q-h_H8moIHHxofVxfy>
X-ME-Received: <xmr:DKyqalvZWm82WkmTlq3JVxBb9wzTdr6doDb7PzhnwB1l0FaQl3Vtt7Z2aRI>
X-ME-Proxy-Cause: dmFkZTFgIaX24LlpWvrRi+CAf3rAxyB4BVJLvQSzXwbm9QB7G2ul3gOgiWZ8mmfK0lkB5Y
    X9GgrARNQUZn6UZfxgckgXQKKvS83EE++7ckt0xfQeneldKbJWX1REo347pMEy8Dlwgqpk
    WjCKBgB5aQS+1KBYETF9AVPw2rKZWKfAXQP3vReZAB5OuzByXoqzNzTu7YQGVN9dPMBD8S
    c8kJDdZ5x5bD2Xyg1t5Wb1DEuc1UMDsmC9L+5+sCQaV7qp4rb9jMRP/qAv2t+TUq55rozz
    90iTbDsbvufAmS24tgqjzL2p8O3Ys1JmTWhIkTNEyvIFpHLXO3WedF8SxNl4MoX7mY6fjV
    KpfwwR1MpKWl88rhaltuf56a3susWKj60T35eqQPYJklVlAaVR13WS/gpzH2SCSqAQFIl1
    t+/lxY7yVJlcFsfEu3ENTeQ3+MO1DgudlycIAGVK5dg4krcrw3ILgC4f2ynx7QqDDbtLnV
    pPNfmLK8xMEs8IUGVJydPhbQDKK4Nd2NCe1lwftj4wZL/WZ0NSRyF/q0WTCGeZLmV538gb
    5hoeJeeEtMTrZMl7enPOyorgGCs2cflU1eQsiAOlicvdXQAlQZlWtLhzx7tzR/GdE/qIcd
    A21UdV9oXiuduAuMyHctQfRwQWVfGI3KSx4pqs9sQwPsE0nFiHtSRzSSgBAw
X-ME-Proxy: <xmx:DKyqag26aVxGLb_msG0LfsAoQmfzdG0Ko1YwIZF1VUkLu56nG86BTg>
    <xmx:DKyqaqMgs-gNx803Voks0sGKGVKdzaA4UxwB-y9zF1bTgDiE33BPEQ>
    <xmx:DKyqat5pWW4OyaoBStvVNvskyrqhiEmD3sPHVIdFfK65O3UTW1W9WA>
    <xmx:DKyqapaa2weevb5_TdY9h290L8sc9MN--_jRU0OgtiQvIvPzip1NRg>
    <xmx:DKyqarILZYWUlUZZfrkj1O_gOd3jM2MoWuDiTvppqp3QPcdZqyJhenJc>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 10:47:39 -0400 (EDT)
Date: Wed, 16 Sep 2026 15:47:38 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, 
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, 
	lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com, 
	kernel-team@meta.com
Subject: Re: [RESEND v7 08/29] mm: recognize PMD swap entries in the softleaf
 layer
Message-ID: <aqqrH_Hf1KedPDw8@thinkstation>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-9-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-9-usama.arif@linux.dev>

On Mon, Sep 14, 2026 at 05:27:58AM -0700, Usama Arif wrote:
> Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
> before unmapping it, so an ordinary swap entry has never had to appear in a
> PMD. Later patches install one there instead, and the softleaf layer is
> where every consumer decodes non-present PMDs.
> 
> Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
> A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
> return NULL rather than interpret a swap offset as a page frame number.
> 
> Unlike migration and device-private entries, a PMD swap entry can also
> carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
> before decoding. Strip all three overlays unconditionally while we are
> here: each clear is a plain bit clear, so testing first only buys a branch.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
