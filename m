Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895535;
	b=X2F7GRchSmwxxr3HO0AILjy5hb12aNBCN/afvsl8lMQhdA98ECQmNIGCpR6awRxEwAVp
	 MBYOW/lBlda08f5hpG7PBaEE/TtfOiKeBuC9m8PB90vdGeAk8XyvMSjsZfIMsLncY+H0T
	 uIEJT+uwa5pLuw9NFo0i4V9bjok4fHx0F3keJUSkBU1Hy/umbGFyBEf4uHO2bLePOP/pW
	 lukhDGSvIeBqJt4wefNBm0kQ92TR4Onlrv/Wg4VNWqKyuUwvfcnLjKK/PtX10u5BiireK
	 x6AsUcc6TV7x5aykpgUGXfGE1Kuq14jREKnnRqnpVZfj6vs3bD0xFf0BK+gOVNaJpyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895535;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5KFUwb7S38PDGJnYKL636C5VeONl95jXTsgqB82LNu4=;
	b=FVavkzTSEVb3drfxnQY/OS+AodZp5gB49tKnkAxb32GwmxRbMqAVwbDG+TvZz51nz9Qf
	 P97mgN8fGaDXblSUkl5MRuTjjjfRadmTAudUwRfdtEoJW42mdFcG1cdxLjIZSQe2JPP/G
	 9NFMF9pB/0sGrXZw55jYb/pLyJDfvWVipAxZEpDZmukMYeEcl2r11+5HTs5YW9HBChuEc
	 NDRiHAjZkabuitK2vgsOvB0dCPpq1KWiPdwmnqG6R0nisGZrqSg86U7FCepCClN01L9En
	 UitaaxFFYRDRaC2dnmGxNPvPpg/vizvu3U8jWq7oRFEFRI/vt96X6Xg2cz7bEXCoGQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dtQ3W2NP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807AB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dtQ3W2NP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA551682;
	Mon, 16 Nov 2026 22:05:31 -0800 (PST)
Received: from [10.163.156.60] (unknown [10.163.156.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949E13F763;
	Mon, 16 Nov 2026 22:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794895534; bh=9u1GHEq8hMnaJQY05Ky1xgqDtbgYPoZC4iyaip7LWL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dtQ3W2NP24PUe63hKoX4bbI8JEiTSsSWWQu9D7DyMy/pHZNUmqrIFmfAnGaZ8kXON
	 89dH4GviqDm13Qaqsx+/h2/y6OdcvX3TjsDcl8TDib3gTh9PbrGtda/fRVDobnGWO/
	 /vF0mbRpZFiOxKGkNycP1YCeYW4+Xb8SRDAd2Wqw=
Message-ID: <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>
Date: Tue, 17 Nov 2026 11:35:24 +0530
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
Subject: Re: [PATCH v5 04/11] mm/vmalloc: reject an unaligned range in
 __vunmap_range_noflush()
To: Hao Ge <hao.ge@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-5-hao.ge@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261116071325.263682-5-hao.ge@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/11/26 12:43 pm, Hao Ge wrote:
> The PTE loop stops only at addr == end. An unaligned end is never
> reached, so the loop keeps clearing past the range. An unaligned
> start clears the page below the range first. Both are caller bugs,
> and the damage is hard to attribute afterwards.
> 
> vmap only installs page aligned mappings, so an unaligned unmap
> request is never a legitimate teardown. Warn and bail out at the
> entry of __vunmap_range_noflush(), before any PTE is cleared.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a168f6f20f4f..e2b63cb1592b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -523,6 +523,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end,
>  	pgtbl_mod_mask mask = 0;
>  
>  	BUG_ON(addr >= end);

Nit: It is usually a practice to change the existing BUG_ON's to
WARN_ON's too, if you are changing around that part.


> +	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> +		return;

Reviewed-by: Dev Jain <dev.jain@arm.com>

> +
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);

