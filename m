Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668785;
	b=tz2AO8z5anTF4LgNcfaSs9QUn4hWX0twiCpS9HUf1ds0d1YFUTfxzcItiwveKCW0iU8h
	 wE9jf56AXfzXh3LkSoaD5DaCCzzDxIz61oxCZOkzZxj7CL4ZAK3dF6Lt4hVaehQ5ZYKuU
	 rxSO1KjYOxj/olWuaq9SmymjNk1VrSikUmpVVeqDDzlfTY6ax+mmwWmRVKJxvuBLh/JKK
	 GAwSS/NQDg5viNDzHDqfJhjcNjE2fymDHKYhGIsD41AOBpvVHLiNwDH6iM5yVEsDs3QX2
	 ncl/GNaACXFZvAUyffUUZIzQczgQ6tDjcMV3n3Wz2eUtq8hExJ+9aWkoeuE335EHRAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668785;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gPlumqmMy/TS1Z79coN07+eLGMuUh+Q2c2xpM92oPK0=;
	b=20hzwxFxJp3RalUwWVWbWapiJftlrLaGvu1h/oJ0vRoTIDvdG4dAXbbFc5kvpzjezX2T
	 AYrOikYVDT2/5maP6N7mIdHTx4Y8GNkUavSCzp65/xC4dlnZOoRhBY5M/3XhNVGHf2n7H
	 mJ8GlEfutHKzp3gLRVikgID0mPouwEeidQW26115nnihjwUc6tCZanhNemUKfPyrfb8mg
	 DehQKBKtN1h6vQwOZvAL5zudyAQJI9V1T1YP06YmiwkAhPiEck5UhjV0EGZV0+cRz5X6+
	 k891RIAhZ8ZBW+QIZyW9mnnZNPU4/Lu74PvLHQs/h4UYZcLEdh5Id1881AzODcYH+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Is9jPV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B157F606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0Is9jPV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6AD1F000C4;
	Sat, 14 Nov 2026 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794668785;
	bh=gPlumqmMy/TS1Z79coN07+eLGMuUh+Q2c2xpM92oPK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P0Is9jPV8V7EDDghiT7VHrcFj3kSnB2meK+9wfamwMFQSt9LC1mUTxr5pIy4aCWjl
	 pUfToTL5MPmVsnD3O+F7PPlzn8jMCoGMZJIumApN1DSrXX/QfvlXXAcKCOTGhphiCJ
	 gz7m5t5dJPvSdi0pAeGOuCZ+CEr6MssBiKI7mJZtn6ke7VIQFVo1496Mzl80WprPrx
	 up4FYVNdJpTDA7k9o96nSoiAwrF4+sI2jAC5aUq4n4s8NjKJXcQhbitYc3umOlG/9Q
	 Gp/DgP2lI2Q5BuTlnfBssN8YNcekQlJ3iZ++tGmeU5bUmVUmGC4FzSv06zKhN24mUc
	 lBOGKo6oysySA==
Message-ID: <7c6e733e-a464-404d-8b69-607eaede0c5c@kernel.org>
Date: Sat, 14 Nov 2026 16:06:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pagewalk: document missing struct members
To: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 01:44, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc entries for @walk_lock in struct mm_walk_ops, and
> for @ptep, @pudp, @pmdp, and @vma in struct folio_walk. Also fix @pte,
> @pud, and @pmd descriptions to state they hold entry values, not pointers.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
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

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
