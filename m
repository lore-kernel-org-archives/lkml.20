Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90632490BE4;
	Mon, 12 Oct 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815389; cv=none; b=PVDI5ZsXgspMGohgLzAi93Ar3LW5hqMuWFZ4c/Lx1Zc61dYsfkh21I4ACq1pQ5/psLC/PMw+xg8KtXglevngrwAtZ6ucFfEmdz5q9F4CuUqOHnPiFAY58ACBOVZ986Mhaca8DZDvsVzzJ1apCRI8ZodrFJcplRC5i4ZTQ7/kMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815389; c=relaxed/simple;
	bh=YLmmVuE5dI78DA8HL3NCLa8pwQsFwKZK13zRhAr40uQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AKnpr+mvBFtuFq+0Q/wcQowdd5oOl3MCJ4/+FBqqoo2vXcvPaFiyexmv30lQJX0a89Gtt+WZd1vABijeut2S5TLspaCc91TLNwBhKlfCWIpsivHTXKPp0pV9x2jo5wA5gNfzK9ONDFBLLT3/sPaGjKHfyoN9+cOrA3eYQpYGB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI6gTog1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI6gTog1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A51F0089B;
	Mon, 12 Oct 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791815388;
	bh=Fs86nx7DgyVnSBfy/DK7HhtDy7sQIgzaO1k1Aqo8MdI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dI6gTog1/e7lxLkuzaWRj4dLKabZOmM7G2HPGnauNdZHj+lrKZIe5ySQUnz5W6BOV
	 qkd2RDbVPVXdmgKWWiz8F6899oJcg5mivGA/98O2o8INY7kD24laYKlCZMAJNiyLcf
	 du+c6BYPhPc264mBtcxss3zAI4xvjv14X9nBmo7qUqrWLXNbEug/0+l9mldKsjZzpc
	 At1uL4NR1ZytDdXmXiob+9TX80bev/WWYw5DOLqxLriBzMi0tbv7ANpKBZ0WpdkYaL
	 m1Dx7SqB6+Vzyx9oc3vw4v5NMryF2lIAk+6vsvyAr6+tPLstOtCU9yHaQAvd+Krvg2
	 5d6Pr7E3Ztqqg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: sashiko-reviews@lists.linux.dev,  Aditya Gupta <adityag@linux.ibm.com>,
  Baoquan He <baoquan.he@linux.dev>,  Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Pratyush Yadav <pratyush@kernel.org>,
  kexec@lists.infradead.org,  "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,  Mahesh Salgaonkar <mahesh@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Hari Bathini <hbathini@linux.ibm.com>,
  Mike Rapoport <rppt@kernel.org>,  linux-kernel@vger.kernel.org,  Pasha
 Tatashin <pasha.tatashin@soleen.com>,  linuxppc-dev@lists.ozlabs.org,
  Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Shrikanth Hegde <sshegde@linux.ibm.com>,  Shivang
 Upadhyay <shivangu@linux.ibm.com>,  Nicholas Piggin <npiggin@gmail.com>,
  "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v1 1/2] kho: check scratch vs CMA alignment at runtime
In-Reply-To: <0b918888-502d-4388-ab54-2c7ae9f4ccbb@linux.ibm.com> (Sourabh
	Jain's message of "Thu, 1 Oct 2026 09:00:42 +0530")
References: <20260928083226.107807-1-sourabhjain@linux.ibm.com>
	<20260928083226.107807-2-sourabhjain@linux.ibm.com>
	<20260928084152.B52D21F000FF@smtp.kernel.org>
	<0b918888-502d-4388-ab54-2c7ae9f4ccbb@linux.ibm.com>
Date: Mon, 12 Oct 2026 16:29:43 +0200
Message-ID: <2vxzjynnj8ko.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01 2026, Sourabh Jain wrote:

> On 28/09/26 14:11, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] kho: bypassed scratch alignment check during resume causes memo=
ry corruption
>> --
>>
>> commit cbd7cb7f008e704b389d8dfe3306e1e83e49e8a8
>> Author: Sourabh Jain <sourabhjain@linux.ibm.com>
>>
>> kho: check scratch vs CMA alignment at runtime
>>
>> KHO requires the scratch alignment to be at least CMA_MIN_ALIGNMENT_BYTE=
S,
>> which was previously enforced with a static_assert(). This commit replac=
es
>> the static_assert() with a runtime check in kho_reserve_scratch() to all=
ow
>> KHO on configurations where the minimum alignment is not a constant.
>>
>>> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kex=
ec_handover.c
>>> index 7c4d86daf86d5..dc76dd6b74da7 100644
>>> --- a/kernel/liveupdate/kexec_handover.c
>>> +++ b/kernel/liveupdate/kexec_handover.c
>> [ ... ]
>>
>>> @@ -836,6 +828,21 @@ static void __init kho_reserve_scratch(void)
>>>   	if (!kho_enable)
>>>   		return;
>>>   +	/*
>>> +	 * This is the minimal alignment required by deferred struct page ini=
t.
>>> +	 * deferred_init_memmap_chunk frees memory to the buddy allocator, wh=
ich looks
>>> +	 * at the neighboring pages (up to MAX_PAGE_ORDER) to merge them.
>>> +	 * If KHO scratch is not aligned to that value, buddy can access unin=
itialized
>>> +	 * struct pages, which can cause a crash.
>>> +	 */
>>> +	if (WARN_ON_ONCE(SCRATCH_ALIGNMENT_BYTES < CMA_MIN_ALIGNMENT_BYTES)) {
>>> +		pr_err("scratch alignment %lu < CMA minimum %lu, disabling\n",
>>> +		       (unsigned long)SCRATCH_ALIGNMENT_BYTES,
>>> +		       (unsigned long)CMA_MIN_ALIGNMENT_BYTES);
>>> +		kho_enable =3D false;
>>> +		return;
>>> +	}
>>> +
>> [Severity: High]
>> Does this new runtime check get bypassed during a KHO resume?
>>
>> During a KHO resume, kho_memory_init() skips kho_reserve_scratch():
>>
>> kernel/liveupdate/kexec_handover.c:kho_memory_init() {
>> 	if (kho_in.scratch_phys)
>> 		kho_mem_retrieve();
>> 	else
>> 		kho_reserve_scratch();
>> }
>>
>> If a predecessor kernel passes a scratch region with a smaller alignment,
>> and the successor kernel has a larger pageblock_order, bypassing this ch=
eck
>> means kho_init() will iterate over the provided scratch memory using the
>> successor kernel's larger pageblock_nr_pages:
>>
>> kernel/liveupdate/kexec_handover.c:kho_init() {
>> 		for (pfn =3D base_pfn; pfn < base_pfn + count;
>> 		     pfn +=3D pageblock_nr_pages)
>> 			init_cma_reserved_pageblock(pfn_to_page(pfn));
>> }
>> Can this lead to init_cma_reserved_pageblock() overwriting state for pag=
es
>> outside the actual scratch region bounds, or cause a crash in the buddy
>> allocator if __free_pages() is called on an unaligned PFN?
>
> Yes, if the kexeced kernel has a higher pageblock_order than the
> kernel that initiated the kexec with KHO, this can cause problems when
> the code above hands scratch-memory pages back to the buddy allocator
> in the kexeced kernel.
>
> Would it make sense to handle this by keeping only the unaligned pages
> reserved and handing the remaining pages back to the buddy?
>
> Something like this:
>
> diff --git a/kernel/liveupdate/kexec_handover.c
> b/kernel/liveupdate/kexec_handover.c
> index 2e3a36054851..dea6e7790972 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1928,7 +1928,8 @@ static __init int kho_init(void)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i < kho_scratch_cnt; i++) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long bas=
e_pfn =3D PHYS_PFN(kho_scratch[i].addr);
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long cou=
nt =3D kho_scratch[i].size >> PAGE_SHIFT;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long count =3D=
 ALIGN_DOWN(kho_scratch[i].size >>
> PAGE_SHIFT,
> + pageblock_nr_pages);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long pfn;

This code only runs on cold boot. So it will never run for kexec-ed
kernel. See the if (fdt) check above. It is very subtle and easy to
miss.

For kexeced kernels, the migrate type is set via
kho_scratch_migratetype() (see its callers). The logic it uses is that
if any page in the whole page block overlaps with scratch, mark it as
MIGRATE_CMA. So I think it already works with variable pageblock sizes.

>

Also, off-topic nit: your email client seems to like sending
"non-breaking space" (0xC2 0xA0 in UTF-8). For example, for indentation
in the diff above, it uses non-breaking space, and makes the diff hard
to apply. Perhaps tinker with the settings and see if you can avoid it?

--=20
Regards,
Pratyush Yadav
