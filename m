Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91378C9C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826864; cv=none; b=OnXvkOttQtVmCvjvIAip2vbFGbVEWRdrO6LeoXFSf2leSTWOU6DlnsHIIy0cWCXzoLZu8NT7Q2ptIyBuC8q1imDD38WlPbamKPOQE1H9kosWgAZLqoIhFzS/nEkHcOZcPnvw/ynN9nt9C7j0959zmlvcgMflvzab8dQdQa+NLpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826864; c=relaxed/simple;
	bh=1RJtSmGkDzOhRF7zExD6eG4nMnJW5Es9Ic7XyY94Oj4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Rrc7i07crR540GpcpTAKep4+NRQiUqFh+tKO0i8/snkf+eKlyJg8BA4utZeMu5XRZ53udnNXue5y29mvxWRAwBKJk65c9idy7lVbBcAbeUiTvIPzO+wRyZo0roEec0Au4/T9oZ5caXECLEl8AHm328FuVeH5OmahU+L1x5myWec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mqt6FUuX; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mqt6FUuX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1RJtSmGkDzOhRF7zExD6eG4nMnJW5Es9Ic7XyY94Oj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789826860; v=1; x=1790431660;
 b=mqt6FUuXMFr5TEmLd/Q/Yc7UnGrkFFt7cnv558YaEsU6Vh8n7PyA8OR+ru3pS1o5JvD957Yk
 +b3PDUY6awRtFAZWYIo+vVXFm5eURkdXn6ow9TQg96V92kPVGoWdAUTtvB9B3qysIv8E+t14uye
 rg662j5uUpj680cmtR7g5Ql4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id b0b09ee52edac098;
	Sat, 19 Sep 2026 14:07:40 +0000
X-Mizu-Trace-ID: b0b09ee52edac098
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <186ee2ba-daf3-4120-a3e3-101cac1ff5a1@linux.dev>
Date: Sat, 19 Sep 2026 22:07:19 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4AA6C66B-0FD8-49F3-8447-959A3E438FC2@linux.dev>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-2-songmuchun@bytedance.com>
 <186ee2ba-daf3-4120-a3e3-101cac1ff5a1@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 19, 2026, at 22:01, Qi Zheng <qi.zheng@linux.dev> wrote:
> On 9/13/26 4:37 PM, Muchun Song wrote:
>> VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population =
in two
>> places: it keeps allocations on the normal path and takes a reference =
when
>> a backing page is supplied for reuse.
>> After Device DAX switched to the common per-zone shared tail page, =
both
>> conditions can be determined locally. DAX supplies ptpfn for every =
shared
>> tail mapping and requests an allocation only for compound head =
mappings,
>> whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() =
alone
>> selects the correct allocation path.
>> When ptpfn is supplied, the caller is reusing an existing backing =
page.
>> Once the slab allocator is available, take a reference for each =
reused
>=20
> Does the availability of slab mean the buddy allocator is already =
being
> used? Could there be a window where the buddy allocator is functional
> but slab hasn't become available yet?

Yes, because the slab allocator is based on buddy allocator. But I want =
to know
what's your concern here?=
