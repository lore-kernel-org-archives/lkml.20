Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794683702;
	b=Wc1nHLwf3CTx2W1MPYInA6m4G5OlaRxDGdwcVps7jvqlNxqf1vhzr3ELjau8gliw/d+a
	 Fy6mC1kxpk1DNXF2qOkxzQRH7ED1rQkKf4oy9PbFnYGU3uX21DnS0HLjkYVKuAGdH+0vl
	 amUSeJ67y30O1tiFnKFZG8KQxAYtCSmNp/Jd8cQvAGIAR9AhV/1dc+B/HuziYE5lkpwQ1
	 PaXEc2K2kX8LzWL38fDki8Nz8yi9Uq/D5+dW8Ooc2/BGU/HGX2S5kpZitkcokkEzI2Mpi
	 YTjQeVYuuLrdgssgdp4R9njmfC7sG0O6+qfR4aVPn7m8RRMBlJgjIlm2vaefTdn+zIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683702;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CxIGxW5mj4AmLJ2XSq7JP5/ux91S+vD9k4XlY+cOKHY=;
	b=csPwginqtNULd4bD236+JHX7vNjHRmq7Cq6aDAagIrAZaUvjkxHNFA+abZWJwTZe3j2b
	 c00toV03SaLusOSgYyl+/kojeELaO5OPd8iUPWXzZ7WcMrmKLHRaOZj0tgB4asvupwfKr
	 GwqyT8bhFYSNJTYMrv5Esrypzek88QuwUACFe9GJ+hO99QChgrMXgXHR1Ax/6WnTNc89x
	 44WS87vULpWpYlZm24uWkg4ZohL0xXg9f71lLctjPvx4jRxRWJRi+1FcUKS7ozy6qgkvd
	 DaW3s1NaF94uH73SG5etOM9C7EF2+DxoDg6eyqWgrtoGo7U0TysQ9dZsbBWpbdLFMPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFAi7a1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB8A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFAi7a1Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0091F000C4;
	Sat, 14 Nov 2026 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794683701;
	bh=CxIGxW5mj4AmLJ2XSq7JP5/ux91S+vD9k4XlY+cOKHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mFAi7a1ZIpLa2CEvrTYh3I3O5I1TIHTIjjd0teQAm2AmtminmHpEFJ93Qsiz6UOGs
	 yoFFnNjmaH2Zojqx40I407yGLpWJv2+e8JFVAbW8Ew9QP57tKnMyxeLpi4BvttATT8
	 056bWkSqKSkSZALWEEFuKc/RndyWB8lUwHU8sffNQtMVDMEk5gRDExyUSRwGdO8Q9n
	 k126jyGSWGOqy1D3WfHipNroDgHU6EwzyuRV4BmTkoECcUEHym3wMN7g/8AGcNRKks
	 OZf9HC1bB33Z9kek0NAgJPlb1qHJxf3bD+0soLtHkhrnxe/+Cs4lLbwtnZN+y+tOZw
	 749qtvnOpRBGA==
Date: Sat, 14 Nov 2026 19:14:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Oscar Alejandro =?utf-8?Q?S=C3=A1nchez?= Lucero <aleszlucero@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/pagewalk: document missing struct members
Message-ID: <aviy0N13YR5R-60T@gremlin>
References: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>

On Thu, Nov 12, 2026 at 06:44:07PM -0600, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc entries for @walk_lock in struct mm_walk_ops, and
> for @ptep, @pudp, @pmdp, and @vma in struct folio_walk. Also fix @pte,
> @pud, and @pmd descriptions to state they hold entry values, not pointers.
>
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Looks sensible to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/pagewalk.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index b41d7265c01b..978714d5e32f 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -63,6 +63,8 @@ enum page_walk_lock {
>   *                      install. If allocations fail, the walk is aborted. This
>   *                      operation is only available for userland memory. Not
>   *                      usable for hugetlb ranges.
> + * @walk_lock:          locking requirement during the page walk (see
> + *                      enum page_walk_lock).
>   *
>   * p?d_entry callbacks are called even if those levels are folded on a
>   * particular architecture/configuration.
> @@ -161,10 +163,14 @@ enum folio_walk_level {
>   * struct folio_walk - folio_walk_start() / folio_walk_end() data
>   * @page:	exact folio page referenced (if applicable)
>   * @level:	page table level identifying the entry type
> - * @pte:	pointer to the page table entry (FW_LEVEL_PTE).
> - * @pmd:	pointer to the page table entry (FW_LEVEL_PMD).
> - * @pud:	pointer to the page table entry (FW_LEVEL_PUD).
> - * @ptl:	pointer to the page table lock.
> + * @ptep:	pointer to the page table entry (FW_LEVEL_PTE).
> + * @pudp:	pointer to the page table entry (FW_LEVEL_PUD).
> + * @pmdp:	pointer to the page table entry (FW_LEVEL_PMD).
> + * @pte:	page table entry value (FW_LEVEL_PTE).
> + * @pud:	page table entry value (FW_LEVEL_PUD).
> + * @pmd:	page table entry value (FW_LEVEL_PMD).
> + * @vma:	pointer to the VMA (for internal use only).
> + * @ptl:	pointer to the page table lock (for internal use only).
>   *
>   * (see folio_walk_start() documentation for more details)
>   */
>
> ---
> base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
> change-id: 20261112-pagewalk-doc-d4f0de5c03c2
>
> Best regards,
> --
> Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
>

--
Cheers, Lorenzo
