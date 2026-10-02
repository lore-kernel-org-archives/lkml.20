Received: from mta0.migadu.com (out-4.mta0.migadu.com [91.218.175.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAB3624CC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938352; cv=none; b=Geu0rRSVxf9SaVplRDAxNZMHzn8KY/5XFPZGfg49A/yr/LTBQ2k0K5ZrWA0YZUAOGD4Jvyu9JTR8UiM3p5OgC0DPuy96c1HIkch0Y2IRu0dp62/rtaf3A27zQeeMoI+MJliH+PIWwwjodoYrBK3loQZcORF1Sw/lSjHAkEpnJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938352; c=relaxed/simple;
	bh=2D44/9zUPSKPVqBDTTqQTwAsiNBVg+7q3Q67Op/M820=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KhWjfb+r+10q3sMWyfqgIJaCtstWYxWRQaS+dj4fZrrxNd0CX/rHZout2V/rzFFGQ8/rmUNX0jm0sVHW63las9jAj9TGfenCxheeAPpfZcNxAxFG24zPZFr8ZIHVOJG8Ofo6ksUykOWNCO3uuiBQEkbqrBXisr6NPk0MR0ohZj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QtbFyhaq; arc=none smtp.client-ip=91.218.175.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QtbFyhaq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2D44/9zUPSKPVqBDTTqQTwAsiNBVg+7q3Q67Op/M820=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790938348; v=1; x=1791543148;
 b=QtbFyhaq6lpw2b/wi358vHULtBCIvXBb2moEhnglY0kwC6Okmr+W8ObtW8mKmR24uyBQRV7E
 Os8ufvOpLzKBrhnaFHn4REPK/WvcD1jY4y88K6dtG7B0O6qJUa8kZfBkl9uBtvGIdBBOWU0j8b8
 umnyub5z3hntPwoL0ALKIFr0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff74b3509b06fa11;
	Fri, 02 Oct 2026 10:52:28 +0000
X-Mizu-Trace-ID: ff74b3509b06fa11
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:52:22 +0100
Message-Id: <DLUANOHBUP9C.14W0G57BHYIMF@linux.dev>
Cc: <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <hannes@cmpxchg.org>, <ziy@nvidia.com>,
 <david@kernel.org>, <ljs@kernel.org>, <liam@infradead.org>,
 <rppt@kernel.org>, <baolin.wang@linux.alibaba.com>, <nico.pache@linux.dev>,
 <ryan.roberts@arm.com>, <dev.jain@arm.com>, <baohua@kernel.org>,
 <lance.yang@linux.dev>, <usama.arif@linux.dev>, <kas@kernel.org>,
 <matthew.brost@intel.com>, <joshua.hahnjy@gmail.com>, <rakie.kim@sk.com>,
 <byungchul@sk.com>, <ying.huang@linux.alibaba.com>, <apopple@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Gregory Price" <gourry@gourry.net>, <linux-mm@kvack.org>,
 <brendan.jackman@linux.dev>
X-Mailer: aerc 0.21.0
References: <20260914155115.439742-1-gourry@gourry.net>
 <aqgjUJWVUS_nx20i@gourry-fedora-PF4VCD3F>
In-Reply-To: <aqgjUJWVUS_nx20i@gourry-fedora-PF4VCD3F>

On Mon Sep 14, 2026 at 5:54 PM BST, Gregory Price wrote:
> On Mon, Sep 14, 2026 at 11:51:14AM -0400, Gregory Price wrote:
>> __alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
>> folio entry points do not, so callers cannot select allocator behaviour
>> (e.g. an alternate zonelist) through them.
>>=20
>> Thread alloc_flags through both, matching __alloc_pages_noprof(), and
>> keep the flag-carrying primitives mm-internal (page_alloc.h) so the
>> public gfp.h wrappers stay flag-free:
>>=20
>>  - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
>>    alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT
>>=20
>>  - give __folio_alloc_noprof() an alloc_flags parameter and moves
>>    __folio_alloc_node_noprof() moves into page_alloc.h
>>    __folio_alloc_noprof() is no longer exported
>>=20
>> No functional change: every caller passes ALLOC_DEFAULT.
>>=20
>> Cc: Brendan Jackman <brendan.jackman@linux.dev>
>> Signed-off-by: Gregory Price <gourry@gourry.net>
>> ---
>>=20
>> Brendan this will conflict mildly with your ALLOC_UNMAPPED work,
>> because you add an init_alloc_flags call in alloc_pages_bulk_noprof :
>> https://lore.kernel.org/linux-mm/20260726-page_alloc-unmapped-v3-20-6f57=
29aa9832@google.com/
>>=20
>> I wanted to pull this out ahead to try to deal with the conflict.
>>=20
>
> Sashiko pointed out some issues that arise from rebasing on the recent
> ALLOC_NOLOCK work, and in a quick review I found a similar slow-path
> fallback issue with the NOBLOCK patch separate of this patch.
>
> Brendan, if you're alright with it, can I pull the NOBLOCK patch out
> ahead into a 2-commit series and I'll add the small fixups?

Hey, sorry about the silence I let LKML pile up rather badly, it's been
quite a month..

Yes I am totally alright with this (glad to see you went ahead).
