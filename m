Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9C4AE8BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555318; cv=none; b=Z7T7zzVqy+JwpjZQhqL++9CuBFJcSWvxTadg4inytJogsb2XYckwS5l0fwl6LG2uhWzdWEPS5asQdj9BIUZWMfpavFlIdsh4eiIZrhvF0r8fDnJFaG2NEW7Sv3mfTRuXjdMTRhvLMeS+3FG+GerkB6DzFVSmkzQrSvfmX+PJ+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555318; c=relaxed/simple;
	bh=D7hfrm3qIlI4+AhECxlB2fjvQpfx6eid9hhS+USFrjU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ng0RAyh5cy6g2nITD8C3jPF6IDCAV+fRAocVWkN/19kNXAatVeV2BHriB1OPeRmQdlBhAKT8KXwKLE4eXR3syH7W9BttKG14xHQxYdT7up74BGP22LvvV+nWncxl3JtwdXI9sX5eB0U8R6Dpys4nSYlvNvil7zPfcAzVL+jGRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KUBvukLq; arc=none smtp.client-ip=95.215.58.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KUBvukLq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D7hfrm3qIlI4+AhECxlB2fjvQpfx6eid9hhS+USFrjU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791555310; v=1; x=1792160110;
 b=KUBvukLqk8SJPv4WQHPjNe/TAVM0BaleRolIPO2rqaVafEaayfaEGjZke/DG0Wrdki71szO3
 qYDBSlJFnnksL6hJDk7dDCgfbxMxuStMO7PvENWphkOWQegPW3QhM86jrSuLWeP8RCHCqw5yAfe
 Nx5B6MUyur7Gc2PpG6YdyB+0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5fd037bf9b86533;
	Fri, 09 Oct 2026 14:15:05 +0000
X-Mizu-Trace-ID: d5fd037bf9b86533
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
Date: Fri, 9 Oct 2026 22:14:40 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 david@kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E3A4E15-38DA-400D-95F2-01FFBB36304B@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-3-songmuchun@bytedance.com>
 <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 9, 2026, at 14:09, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =
wrote:
>=20
> Muchun Song <songmuchun@bytedance.com> writes:
>=20
>> RISC-V uses the same memory-hotplug teardown code for the linear map =
and
>> vmemmap, although their page-table pages are not always allocated in =
the
>> same way. Late linear-map allocations run page-table constructors, =
while
>> vmemmap and early allocations may provide constructor-free pages.
>>=20
>> The PTE path unconditionally runs the destructor, which is wrong for
>> constructor-free vmemmap tables. The PMD path avoids that problem by
>> using is_vmemmap as a proxy for constructor state, but that =
assumption
>> will no longer hold once runtime vmemmap allocations use the normal
>> pgalloc helpers.
>>=20
>> Page-table constructors record their state in PG_table. Centralize
>> page-table freeing and use PageTable() to decide whether the =
destructor
>> is required. Keep reserved and constructor-free pages on their =
existing
>> freeing paths.
>>=20
>> Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> arch/riscv/mm/init.c | 29 ++++++++++++++---------------
>> 1 file changed, 14 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 857f9a55039c..429a0b015ec1 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -1486,10 +1486,19 @@ struct execmem_info __init =
*execmem_arch_setup(void)
>> #endif /* CONFIG_EXECMEM */
>>=20
>> #ifdef CONFIG_MEMORY_HOTPLUG
>> +static void __meminit free_pagetable(struct page *page)
>> +{
>> + 	if (PageReserved(page))
>> + 		free_reserved_page(page);
>> + 	else if (PageTable(page))
>> + 		pagetable_dtor_free(page_ptdesc(page));
>> + 	else
>> + 		pagetable_free(page_ptdesc(page));
>> +}
>=20
> Is PageReserved() enought to determine if there's no dtor to run? On

Yes.

> rv64 your code is correct, but maybe for robustness?
>=20
>  | if (PageTable(page))
>  |         pagetable_dtor(page_ptdesc(page));
>  |=20
>  | if (PageReserved(page))
>  |         free_reserved_page(page);
>  | else
>  |         pagetable_free(page_ptdesc(page));

his looks good to me as well. I'll change it in the next version. =
Thanks!

Muchun

>=20
>=20
> Bj=C3=B6rn

