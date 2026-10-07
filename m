Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5123F12CB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356143; cv=none; b=EpfX9y8Rv/sX7MaBJDvBtbP+EdR+kfkT1Q1vIXeb1DgxBF/1iX9lbXLod1zUCjSJmvJBHN4SI+WrNbWK2FdUCSbYgBpRXi8JH/hMilEEjXLuo2QuDYs3RSf2wsVLYH178AbiaXThqaRH16YTZF2LqLj9wev/BpAcpEybLh/WZ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356143; c=relaxed/simple;
	bh=ToKfNOVp2qvFnEYXZ6nvsN9uzB66hA/JPYJkqLxPvZs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ZJCZPYhXxPjIzhvI9VKmMFb0S0sBAr1G75hJ5df2zMlWmPKjWqm5/kTI7aZStbeCun69zCYvOa56ERhCeaEO1/EK2MCqGb0YhB1Qf8PXen9m/whghweZEIVYDxmBSf08ddybC+31GfROVbRqYexHvvvQ2ha/q4FKQK8NrspQCQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XYw3Tigv; arc=none smtp.client-ip=95.215.58.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XYw3Tigv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ToKfNOVp2qvFnEYXZ6nvsN9uzB66hA/JPYJkqLxPvZs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791356139; v=1; x=1791960939;
 b=XYw3TigvdOx8wVHJEKfZXpqpLo7zJwTuoc+d/IiHe41BRtmNe490cVXm4RypQKV07D18uxRC
 VtS6XDhWTzjymBkYIOX+jPed6CeF3BYSwqHEi+NLm16+qudHdxIYdpo7JXTleZctdJ3vUPHvhDc
 CgmNtI2lK6y2rCHVdCqfVzaA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id af8f4c7b60dce85b;
	Wed, 07 Oct 2026 05:10:41 +0000
X-Mizu-Trace-ID: af8f4c7b60dce85b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] mm/hugetlb: use kvmalloc_objs for hugetlb_fault_mutex_table
Date: Wed, 7 Oct 2026 07:10:08 +0200
Message-Id: <5714BF9B-9FE3-41DC-A215-EEAAEBD7F9D3@linux.dev>
References: <20261006160128.31447-1-dheerajkumar.srivastava@amd.com>
Cc: osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 davidlohr@hp.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vasant.Hegde@amd.com, bharata@amd.com, dheerajkumar.srivastava@amd.com
In-Reply-To: <20261006160128.31447-1-dheerajkumar.srivastava@amd.com>
To: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
X-Mailer: iPhone Mail (24A446)



> On Oct 6, 2026, at 18:02, Dheeraj Kumar Srivastava <dheerajkumar.srivastav=
a@amd.com> wrote:
>=20
> =EF=BB=BFOn systems/VMs with a large number of CPUs (e.g. 4096), hugetlb_i=
nit()
> computes num_fault_mutexes =3D roundup_pow_of_two(8 * num_possible_cpus())=

> =3D 32768.  The subsequent kmalloc for the mutex table can exceed
> MAX_PAGE_ORDER when struct mutex is enlarged by debug options like
> CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC, resulting in:
>=20
>  WARNING: at __alloc_frozen_pages_noprof (order > MAX_PAGE_ORDER)
>  kernel BUG at mm/hugetlb.c (BUG_ON(!hugetlb_fault_mutex_table))
>  Kernel panic - not syncing: Fatal exception
>=20
> Switch to kvmalloc_objs() so the allocation falls back to vmalloc when
> the contiguous physical allocation is too large.  The table is only
> accessed by index, so virtual contiguity is sufficient.
>=20
> Fixes: 8382d914ebf7 ("mm, hugetlb: improve page-fault scalability")
> Signed-off-by: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>

Thanks for your fix.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks=20=
