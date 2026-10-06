Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3435957
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295880; cv=none; b=PNLDpEr4xZUbSbFLscpGIeZKJLx9FqVFr6+NAD8IG2KQ2n4F2Y3JrtVQLkjmnMtMwJ+BfHbrmuDU6Js8fqkvVMxWdBuLuvfLxGyayo4lk44Tum87USOZxyrAcRfEGYtwl3f+a55nbEBwsVQUhBOvWGCj9ktWw6PRtC9+8wtFP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295880; c=relaxed/simple;
	bh=fjCunfX9sDKQD5QYOaP2NzWehuR0nrD8qG2e5t5JFzI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MW24+J9yqClfM/quPGq+Zmws9mgcEFFAn4H2ZqUmflMJhPT6ZVuwBQtJrcsXRrAdhv6dT+A9FIseNK+A2XZeD3MR0rMCqeYKgrnfMLaIbqp9mcZeX0hAFdCzo3ilCKX1P4vDl+JhTSbK4xoNgw/X8V4cudu39VQ2R8/p6bGZIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ufa5h43O; arc=none smtp.client-ip=95.215.58.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ufa5h43O"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fjCunfX9sDKQD5QYOaP2NzWehuR0nrD8qG2e5t5JFzI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791295876; v=1; x=1791900676;
 b=ufa5h43Or4Em8nOnSMkm4YHB0+B2tPUYvA7iur82l6PnQeLzYX2UaOXmmwCgoNTrWSDNJRB+
 AwUHPaO/ct0AN04kppAzwct/co3koYF4S1DhUaJYWT7aWtnhrGaafLsNl80jPpX7A7DMquvebMG
 YDQgLhzG9lzilB5YMktod5bM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 23a085b5514e6df1;
	Tue, 06 Oct 2026 14:11:16 +0000
X-Mizu-Trace-ID: 23a085b5514e6df1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH] mm/hugetlb: use kvmalloc_array for
 hugetlb_fault_mutex_table
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261006140226.11684-1-dheerajkumar.srivastava@amd.com>
Date: Tue, 6 Oct 2026 16:11:01 +0200
Cc: osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 davidlohr@hp.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Vasant.Hegde@amd.com,
 bharata@amd.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB1A3722-E7F2-4E54-A0E4-940BEB15EBC9@linux.dev>
References: <20261006140226.11684-1-dheerajkumar.srivastava@amd.com>
To: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 6, 2026, at 16:02, Dheeraj Kumar Srivastava =
<dheerajkumar.srivastava@amd.com> wrote:
>=20
> On systems/VMs with a large number of CPUs (e.g. 4096), hugetlb_init()
> computes num_fault_mutexes =3D roundup_pow_of_two(8 * =
num_possible_cpus())
> =3D 32768.  The subsequent kmalloc for the mutex table can exceed
> MAX_PAGE_ORDER when struct mutex is enlarged by debug options like
> CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC, resulting in:
>=20
>  WARNING: at __alloc_frozen_pages_noprof (order > MAX_PAGE_ORDER)
>  kernel BUG at mm/hugetlb.c (BUG_ON(!hugetlb_fault_mutex_table))
>  Kernel panic - not syncing: Fatal exception
>=20
> Switch to kvmalloc_array() so the allocation falls back to vmalloc =
when
> the contiguous physical allocation is too large.  The table is only
> accessed by index, so virtual contiguity is sufficient.
>=20
> Fixes: 8382d914ebf7 ("mm, hugetlb: improve page-fault scalability")
> Signed-off-by: Dheeraj Kumar Srivastava =
<dheerajkumar.srivastava@amd.com>
> ---
> mm/hugetlb.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cea25773a6c9..f1b982595151 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4177,7 +4177,8 @@ static int __init hugetlb_init(void)
> 	num_fault_mutexes =3D 1;
> #endif
> 	hugetlb_fault_mutex_table =3D
> - 		kmalloc_objs(struct mutex, num_fault_mutexes);
> + 		kvmalloc_array(num_fault_mutexes,
> +			       sizeof(*hugetlb_fault_mutex_table), =
GFP_KERNEL);

Why not use kvmalloc_objs instead? A little simple.

Thanks

> 	BUG_ON(!hugetlb_fault_mutex_table);
>=20
> 	for (i =3D 0; i < num_fault_mutexes; i++)
> --=20
> 2.25.1
>=20

