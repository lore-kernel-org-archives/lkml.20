Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC610381EBD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858592; cv=none; b=dgTa8hl1Yhx6MwSvd/dIGjVp9VcW6opE8PVKGgNG5vkcPR2rY+HCfNqHFuOs3SaG5jAeUbnsY0C3FwMqi9Ynx0vJkT27isHvFL3tJK75s1QDT8r3aD2PEc2wEfbQeS52tlCjv1pMZyzSOe2le+80p2G5vfPMK4OUJa5mYVFPz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858592; c=relaxed/simple;
	bh=i6TQZ4m9lz/Je3kUM1sbKNIbTsrPwfkMcWQizHsEuFA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eL20pnZnwC5kg9HCXfieKZklVC/XOOqgF9SHCxDVHFOhXXSHlDssOfjsggNQvarWw+dRn5pvaj3Ao1jp34KFGMvcfj/l1z2y1npbtmJxgxoRgu/2o2GfkDxZxOuaCmnBa83QV+ml8zY7wmOM0Er1gMgSf9GA6xInsScq1NaPmWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hUeLtLAr; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hUeLtLAr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i6TQZ4m9lz/Je3kUM1sbKNIbTsrPwfkMcWQizHsEuFA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791858587; v=1; x=1792463387;
 b=hUeLtLAr50UKn66sRMCb9eg3xg0xJ/P6t9FAxCLZmZqxUsEeGs43+MZuXI2ouCvei9bHt4Ys
 FiY9i/x9F3HBHtei53zEtOUv7JpTGy//Q3L1DsJzEoeqR+2BmJpfYhTBdCWac9B6o+MnmJDdAu0
 JuHwdhMbtxSCllUXRNDvxVsc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 62449cffcc214895;
	Tue, 13 Oct 2026 02:29:46 +0000
X-Mizu-Trace-ID: 62449cffcc214895
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: linux-next: manual merge of the risc-v tree with the mm tree
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261012190137.9734b57074f35e540733b9e3@linux-foundation.org>
Date: Tue, 13 Oct 2026 10:29:33 +0800
Cc: Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>,
 David Hildenbrand <david@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <EBC162D4-5574-4FDC-B0CE-B510BBC0C452@linux.dev>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
 <20261012190137.9734b57074f35e540733b9e3@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 13, 2026, at 10:01, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Mon, 12 Oct 2026 16:59:22 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
>> Hi all,
>> 
>> Today's linux-next merge of the risc-v tree got a conflict in:
>> 
>>  arch/riscv/mm/init.c
>> 
>> between commit:
>> 
>>  f02f1d1437449 ("riscv/mm: fix hotplug page-table destructor handling")
>> 
>> from the mm tree and commit:
>> 
>>  79113093e9dc3 ("riscv: convert pgtable_l4|l5_enabled to inline function")
>> 
>> from the risc-v tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thanks.
> 
>> diff --combined arch/riscv/mm/init.c
>> index 6f6b04795bb23,e2b738ca90cf3..0000000000000
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
> 
> Well that's ugly.
> 
> I'll disable "riscv/mm: fix hotplug page-table destructor handling" for
> now to make this go away.
> 
> A decent approach would be to add that patch via the riscv tree.  Muchun,
> please confirm that this has no dependencies on anything else?

Hi Andrew,

Unfortunately, this fix depends on the first patch. So they should go through
MM tree together.

> 
> Otherwise I'll leave it disabled and revisit after -rc1.

I think this is OK.

Thanks.


