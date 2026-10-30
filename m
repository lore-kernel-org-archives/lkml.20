Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344478;
	b=P83Rysq52bAKh78TKlFT7hj4V8IfnqwI69BuDbQv8gG07e35QQ0dxzjUYuQfgJBht7ky
	 AQEe0xBZnbWWO7iqT0BM8HPJ6wbBNyqavsbzcKdR09fFryM2q8CKVyBojAtE2zJAzAERS
	 GuXtH0qeF9bjL1nfI328b0Z+ICCbJd8zqAbN8LCUMdcZLsCchnQwDfUeUU3BsULiipcBy
	 Wp44MNZ3jAArnhI11NVcCsd1m44QPQuP+tnjd7GMK1Nc0XPrmknNluMmQw1v5/YmvOg9q
	 cdPolIv2jRv9Xna7WOvPkJC2wq+hV0N+Y7xl3A+pgScZXwBfM9oz11OZL0cCV6s6/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344478;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X2nwqEX6uVZ+D8u1+rxu1eIxt49K0H72sg6V9JucXvs=;
	b=uaN5Kn/XSdJWFnXYtAL9vYLb1V2BjWxkMJQpRO0a9qVneLMCM3g9tXvYn/MEnmwlaPO0
	 xQC/0Y6mOris1v+m4OUMZB2qQk5b2QZgewKu0cmEPbo6YR7bto++8xvojNtoYpyGjlVx6
	 Hy2ogXPfe50cL6u04LXITpXXhmaUBdWJBZWiQ/Q3H9YUwixumMZCCu8/TY6H3vm0pe8My
	 P14YbegMa+kehZKLiZbgg0jvJ74DH0mYzwtD8FZhwKj+huTxXqKBenyyJTA/fLLf7QTrS
	 269KsN4oYiHTDcAXrJ228nk//bDXa/bKzMDA2WOgfWbBl7NkKix5y2NmD5cpRZiqWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+jtgdTX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E494606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E494606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P+jtgdTX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1101615A1;
	Fri, 30 Oct 2026 00:14:33 -0700 (PDT)
Received: from [10.163.152.232] (unknown [10.163.152.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0273F7B4;
	Fri, 30 Oct 2026 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793344476; bh=Jp/eodRxYkJLNGQk8olzS9xG6qObIMTBg1q6BMVZmBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+jtgdTX69sEy90NVnhYUwff1Df/OdYgDe+/Oll2oU0iv4SgMtAerOkfvpkn4fqBX
	 bHrTkw2g7dShto71IFHPDpjzFhRFcDPHxQhkGP7LbYYciMVEjNypabXr9lGoDG0b9P
	 Dl6AC3L9oAHxYeXPdZCnniBAcCySVpa1QB2Dy4po=
Message-ID: <99f529e8-06f7-4a20-a60b-0330c5d3d91c@arm.com>
Date: Fri, 30 Oct 2026 12:44:26 +0530
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
Subject: Re: [PATCH v3 03/10] mm/vmalloc: clamp an unaligned range in
 vunmap_pte_range()
To: Hao Ge <hao.ge@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Uladzislau Rezki <urezki@gmail.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261026080329.140244-1-hao.ge@linux.dev>
 <20261026080329.140244-4-hao.ge@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261026080329.140244-4-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/10/26 1:33 pm, Hao Ge wrote:
> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
> size is not a multiple of PAGE_SIZE. That loop steps in page

Why are we checking the alignment so late into vmap_pte_range? Why not
simply do

if (!IS_ALIGNED(addr, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
	return; (or return -EINVAL);

at the start of vmap_range_noflush and vunmap_range_noflush?


> multiples and stops only at addr == end; with an unaligned size addr
> never lands on end, so the loop cannot terminate and walks off the
> end of the page table.
> 
> vunmap_pte_range() has the same loop without any guard, so an
> unaligned range would clear PTEs past end without ever stopping,
> walking off the end of the page table.
> 
> Add the check there too. The range is clamped down to the last full
> page rather than dropped, and the loop is skipped when nothing is
> left, so a buggy caller still gets its PTEs cleared as far as they
> go.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 44e0eb32708f..7131f60d1a8e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -393,6 +393,11 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte_t ptent;
>  	unsigned long size = PAGE_SIZE;
>  
> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> +		end = addr + PAGE_ALIGN_DOWN(end - addr);
> +	if (end == addr)
> +		return;
> +
>  	pte = pte_offset_kernel(pmd, addr);
>  	lazy_mmu_mode_enable();
>  

