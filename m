Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A255C30E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880689; cv=none; b=t1jeiqjWadVw6IvCfloHVzsl8lR9KA2paFhADauYim+7k4eBQ8536IpnarROI+tf8LDiTlLxr645gt4wKfOnn48c5wxmElfA3gV514f+7DJ+HNFTDJs1w74LBTcJjw3F+62S+NjHCJq7rzYxfm7WTuF0n5c9nKGsOIVh5NRlgN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880689; c=relaxed/simple;
	bh=ZPpWiroN8+dfkDk+6ugPwvpymxVXdRh5sW8dF89F4jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1RsQPyES3F4icnS5qh2a9GgEhmZ1TAGG2EqpjJcpFRPvlRedtSGDooLcgPQ/wEjxXoAmElFq0fJcGoDhsTRt7lUV/xp/RID9VBD/m4mZc5o9s8LTqQTaQuv+5OCrUjqTp87+yUWZJxV4ej24PeiAqDgTn/uI/O3sDGb3kWpIwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EE81F00A3E;
	Tue,  8 Sep 2026 15:17:45 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.ams.internal (Postfix) with ESMTP id D6DF8198003A;
	Tue,  8 Sep 2026 11:17:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 08 Sep 2026 11:17:14 -0400
X-ME-Sender: <xms:9SagajXg1RB4nxgW4qnXDcoKsra7V2dptsNBql8bDISIv-4-DKur9g>
    <xme:9SagauofoQANoc9VQYWNOS7gmmDlKj9Xyy0f8_qwvrLtjoJi8MYf3gac-U5jR4wL-
    h6PDQWbIfVkYbFkzrjoKuIGPN0QjdenGGPgLWCDZASZs3Eq89f4_IPd>
X-ME-Received: <xmr:9Sagatf2GlJg66_djQc5uurRk_Bb8gb1xzkZjG7avsSX7knEkDbkOueB6B4>
X-ME-Proxy-Cause: dmFkZTFEY+hQ++eX1WT0d18QISpjnqopgTIkTc197fr/D4AEUM/kc9KqJeyRYSclrYcP1c
    XykK6bKruHR9a9Af6TdSDfsRwaG0kuuiFTdbIQxK0fk3sJWTHJ1nfw8FEUmTzotknj71xz
    ml+JfT9VDf5Irx3HsqSaHqWmzJSSZjIFodSXvbmHW47PYVrsUSdZxAvW8G8hgFc6dAjgGg
    hIuIT7YGTr8AEqqpO7ulwGdMeSUijanAbRo6eMC5Bb0mGAR86bsnPNFSQegPUIUlnM/FpD
    e1MjPa5kV1P/j+qJjlVxnW9QC60gKJfVmkd2WdkLUiylOJgEzLMW8q4uD/mz/iHHpkhnkK
    oGS2xZxH+SJdDuw+HJrIlfx1ASD7Li7KrXQlauJuQjpv8nzZs/8GaOEfZk6QRR6CzdnbYq
    slR4AO/Tak030cDixEegZCJtBAn0qwU4u4woTew08cZKE0ioMqC4aLSlTTc3uoL0ECwTXm
    M3jjbkKo7NQRgK9nRF1t6gPwMEJVc2MRxcCbVy2636MonWJ7opVvqy1q/DuZGHL9m2ctCw
    3ew29fDEF2dlS9jG9U55sWrILzyeO/VLxPwn2PNvX1iLvBRZIK1VTtpzCQhhackpig/06h
    TB+rpncREgHvPy7+mR2mghL8eO14/k4SSKR9iziB2m8/dBF+ChENHxJTxL8A
X-ME-Proxy: <xmx:9SagahyEvNX02bBCrGheIE6-kFIGZCXlIAQuY22KDBx4kdWXXpW4aA>
    <xmx:9SagajuUTuOakc1CAB_HY9rMxpwX4utANbMf1334Yp9T0XbpFEQ8Qw>
    <xmx:9SagapAAOz-z1mLcYXrvHV7IJ2t58G_E3VqPvjDKGoKEZNLkK3xF6Q>
    <xmx:9SagaiqOR8ooOREIhyv9zVoxPchDstdzbCBdlmjl_2-a2vymCax4ng>
    <xmx:9Sagau5zXbyaqImztS9EjNCScpYqM2T8u0zP_HXzW2kseOqFMAlYr-6f>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:17:08 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:17:07 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 09/17] mm/huge_memory: rename remap_page() to
 remap_folio()
Message-ID: <aqAmezgS34JdeTVX@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-9-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-9-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:13AM +0800, Kairui Song via B4 Relay wrote:
> @@ -3636,10 +3636,17 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>  	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>  
> -static void remap_page(struct folio *folio, unsigned long nr, int flags)
> +static void remap_folio(struct folio *folio, unsigned long nr, int flags)

You opted out of indicating that the function target anon pages as David
suggested? remap_anon_folio() seems to be fitting better.

But I don't care too much:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
