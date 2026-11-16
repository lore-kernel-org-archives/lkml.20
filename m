Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837578;
	b=2Jai3Xf41EVm1tVRcNUfFmmt7ashig8Nr2xfI6fMT1B3kLctXyyXE4diyvwo7WspN9t0
	 oeUkC1mPJ5r16eUI5Zoe/mIOpFEKx5n6j1zNZ/gKLFcTuL601PtoDtOM7ivehk4jB2KYr
	 RMhSH4Vs3iNoeq+RwhVlcSwPQlvWLT7gQW8dvE1IQ06couKapmL95DmfK/HLhnRpmhEie
	 LVYrCXSN2jK1vg2F+hivSpzNzv/TQzPw2+0HkjaSwC1IorEghe0wNOleyzG0l2hpaZ3Ij
	 2KTUBmyU28y6fitAXOOdOwrFkqXatqFKnUS8pphyx1mroCPT8e6FIBybAftfJOJMhzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837578;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+0F/BYp4W2Rhn1Nomgj2rP/Jj1y5yUU++uEAdL1QZkk=;
	b=BrglKSJ/+qYFbB9Kc4qxd2ACInUDZk79TYmxBYJUWVCR63/oqF4k41MzQr49n7Fp3V/c
	 fcc1MWJPpUppTvrFHurZc/o4NBkHJTb/jSg1lHvijQ+G5iwyka6F6wKFd9vyUNMy6N3NA
	 k6dYGfle2s/DCyMmgCP8O/goTE5e94Cw2SJoZyCGqrcO80GT3smtgs37QsngfWrmyxS15
	 WihVGXmV5OHoiw7mezJKVzzDVY3QPidgyBg0Y5dWl/W4RFDHNUcsxyMRmXdWKWkBbvTeY
	 MnEvQwlY45GxSI+vsDhxOV3yOfSEiSWCVx2rmlBOMR2ssbRhjZdyv9vVAJBMEupvLQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kpn603/2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E7606A32F;
	Mon, 16 Nov 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kpn603/2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75A41F000C4;
	Mon, 16 Nov 2026 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837577;
	bh=+0F/BYp4W2Rhn1Nomgj2rP/Jj1y5yUU++uEAdL1QZkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kpn603/27RkRxVRhQ2GPbhKABaIfZqjKTwCtns8ztXQ0jE/KbpVLGlLBT/foBR3Zj
	 yxdFYkNgKX2LOwUM9MOeiEMTCH2JDsgSMkXKtVIJuzdy5nUpi0bD0cODM3lRG3wONG
	 doQKlDNwF4+nao1Wdp1ZVAdIgldCugYkGbWWjUh3waSUMeeQt98GnXQST9kLOl70hE
	 yN1Bw+Zi6ULCeHYPlpj6mRoWdZH5x+w6BJt0ZfXNN7j0bYBt+qQtQLskREvRY8s2wt
	 gihMMKJ310+1fqoOuqwp6S50rqxEWvJjhCKo9PMOwK6vWI6n6+YRT6J058ZpQoOtbj
	 UN9YKIs/0alNg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 39564198004A;
	Mon, 16 Nov 2026 08:59:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 16 Nov 2026 08:59:35 -0500
X-ME-Sender: <xms:QQz7aqj1qeMiPG-z-Dgb1cG-n7hCkX50jw3cTnX1khXuV-tvPJ7u3g>
    <xme:QQz7airZTcMK3nJvnmcrfLb8eDJIqIzjj_rdu3AkWA3TybTsQbroaSapMunU3ocP7
    v4p2BTTeaYv5_mOijVpsuNfRdo-viWHof7_n-FoMDNRr6dblbh_qTY3>
X-ME-Received: <xmr:QQz7apdBVAiNyAF_et2VScCAMJZA0xxSw6C2vOqEILECRiZShYaN2tlxNLY>
X-ME-Proxy-Cause: dmFkZTGw7Ek27OkttPtA0Uz12TIRY+fdCmOBGTdrDghB0eLcttPx19DupuImOjFBtxaU6o
    JpeXLrgoMfTu/lRKHCIbMj8TzWKHmfHCUY1G1XUscv97+KfE4ZgUv3URbsjMgtUtdZeyxZ
    SgpYcwu9pXmzrr5EJzFIwQG92uYZOBq7pK07CTnxZhIOY2LLT1RQ4TYNmjWVB5mI/QlLrd
    lgMB1n608lO6GGOFzonO3YCxKtuKcIqa2yW4weia5Qzv8gyUD2hS5o7CzQGTr7cuwDbUa0
    lJoWxHsuV1AHsxtoMgIcDdVvIbsfeBRmZr2ToyOJqhisBH0S/Tg40BJ9RANd8a+DCyuOEi
    hn098RuATgD8qEKVgtdPugOq0uT6bGPyrMOntKLKkq+ZkA01R44yfH+YH0c9YDbYmzrQIA
    Iopzse1Ct7eMKJwAWqXgcNivcm0iyHT2OhWNgV+VWC0Q82FfCdXJRs/ieaQi7IDVGGntxr
    2IHkGaGTAT12B8bkGtjQix6jaqugDGh3lm423/jNh60ZAHjmjuCDYvMBwXk5+ytJbrwnWB
    7dMtlkUuY/1t0syakAczXa7L80fTrhVuFAPUFWNIqdlWtI7V0N8u5qe93gMfQIbb2CGwXy
    M0D8RdnYRzDAUCTOKXcrl+5HZfFQvkzD95yUO5jtbnlC2gt1X6l6UfYs85/A
X-ME-Proxy: <xmx:QQz7atyEKDj06BUWZSenI9BcQjUGATvIgsIXq027hGWgFApDfXXGkg>
    <xmx:QQz7avTOcYMA16LqFIE-4PZjPp6l7Sfra25M7fhVcGDr_O5nYkk8sQ>
    <xmx:QQz7arlAtzq6xhRodDWJnvXKtlxZGt6D7-GsazYmLfD-SWfZxg7NNQ>
    <xmx:QQz7aqeKOk5ehpHc2ZTy-jLZG_fiZ1OP4vKyP4CZ9R_qovBM46JmsQ>
    <xmx:QQz7ajyqGivGQB206Ld8BHvW9UTez-MXUa_VwzqnnC6fvXEdvu6kRNI0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 08:59:28 -0500 (EST)
Date: Mon, 16 Nov 2026 13:59:27 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/userfaultfd: prevent poison marker loss
Message-ID: <avsLuMTVBFfDwfsw@shutemov.name>
References: <20261107-b4-uffd_marker_loss-v1-0-82926b22704c@kernel.org>
 <20261107-b4-uffd_marker_loss-v1-1-82926b22704c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-b4-uffd_marker_loss-v1-1-82926b22704c@kernel.org>

On Sat, Nov 07, 2026 at 12:51:05AM +0100, David Hildenbrand (Arm) wrote:
> Unregistering userfaultfd leaves poison markers in the page tables.
> However, once unregistered, hugetlb PMD tables can be shared again.
> 
> Further, shmem page-table retraction can discard poison markers even
> while registered in missing mode, and fork() can skip copying page
> tables containing poison markers.
> 
> To fix it, add VM_MAYBE_UFFD_POISON and set it before installing poison
> markers. Preserve it across unregistration, splits, merges and fork(),
> just like we do with guard markers.
> 
> Use the new atomic VMA flag to disable PMD sharing and page-table
> retraction, and to force page-table copying during fork().
> 
> Move VM_UFFD_WP to bit 44 and make HAVE_ARCH_USERFAULTFD_WP depend on
> 64BIT, freeing bit 12 for the new flag on both 32-bit and 64-bit systems.
> Expose the flag as "up" in smaps.
> 
> Losing poison markers, while unpleasant, is not really fatal, and the
> use case is rather a niche thing. In addition, we rely on the atomic
> VMA flags infrastructure ... so let's not CC stable.
> 
> Fixes: fc71884a5f59 ("mm: userfaultfd: add new UFFDIO_POISON ioctl")
> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  Documentation/filesystems/proc.rst |  1 +
>  fs/proc/task_mmu.c                 |  3 +++
>  include/linux/mm.h                 | 45 ++++++++++++++++++++++++--------------
>  include/linux/userfaultfd_k.h      |  7 ++++--
>  include/trace/events/mmflags.h     |  9 +++++++-
>  mm/Kconfig                         |  1 +
>  mm/khugepaged.c                    |  9 ++++----
>  mm/userfaultfd.c                   |  3 +++
>  tools/testing/vma/include/dup.h    | 20 ++++++++++++-----
>  9 files changed, 70 insertions(+), 28 deletions(-)

Oh, that's a lot of boilerplate for what it worth...

Anyways,

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
