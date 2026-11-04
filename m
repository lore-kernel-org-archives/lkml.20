Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829169;
	b=CKQ/hS6sf+WbP0BW3CqnYWOyWFpczg4DsXlHG0RWlaVRhNd+82OlNjwyZNuDLGO19ZXB
	 BGT3eoCC8ncHvmDPwWKrg0bkPunfY3EiMs3Pa3WmMIJdBaNmhNyMKyLmraXuYAlewSDRi
	 0i74q+vCaKbGG5HO7fHzvn/1hZ1jh9aYnT1qVSRE2oimmIAsIVF7UlkcMuIxpo4nAVGML
	 Uoi1itUApwQA6ARd4WF+/EGvDuRhwiOtdA3TI/d5XeMiDHWMctIP6GhJVjJXQKmSbXvTo
	 p4LlCRUHxvdgGVw5ZGc3n5lzjxizyYMS35HBl4UffEZYfsvkR7WTfmQK959zXInzzVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829169;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EOQecW951XnrbiS/Up+TYLD26Kqi5K026ERWTR9xkgQ=;
	b=H8tTcwkdElgVPuBDGOAg6vLWRoqET9T5OSZPg70mIlccquQQysSsdgUIsRarL7xxc1PT
	 ODwYQtae5uKK52en8g7RvTNSaeomPNa48uzywTXadJmrX2kktGO0n4CdBgJiJRA9pRJTz
	 ktzDgx+jig+lZUPnEX+CoV7KeFr4hxSSCXnWexcTjJ0aUYq58Zrp0+1c6Cl/95DfluZBg
	 LhUuSChRiQ4VvS3QDIrJ/9oRu+WpqKOhh2g18qd6G8SjEGikrh2x9tEP+rSQYWiY6GHL0
	 BRbiCk0CsSAQ6w726ThPa8IDGXeduLpF/nWnav1aTEmWGvQ6HYLrZ62XO2DpDVhzpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OF81ZidU;
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49975607031A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49975607031A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OF81ZidU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M0FIOF1DLHsXObG+kd/KQNs8mRLPiwWKZte8OxN1x/M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793829165; v=1; x=1794433965;
 b=OF81ZidU2OazYJbzq3ROQpcsIgzV2oGcgeat8EWG+HD53tZTNHiDcmJdrQUGflewUyYgRHz4
 1R8BabrS2n7vbRKru/nGRGVi5rptQU+plgxy2D+xfcX22cHaLBQ/szWS012nTzjQjvnqzrD7t+x
 rQCzw3Vpuu+uz3SzRusEMJ+Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a0a1d10de7c52127;
	Wed, 04 Nov 2026 21:52:44 +0000
X-Mizu-Trace-ID: a0a1d10de7c52127
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Bradley Morgan <brads@mainlining.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	david@kernel.org,
	hannes@cmpxchg.org,
	hbathini@linux.ibm.com,
	jbohac@suse.cz,
	kas@kernel.org,
	kernel-team@meta.com,
	kexec@lists.infradead.org,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	riel@surriel.com,
	rppt@kernel.org,
	ruirui.yang@linux.dev,
	shakeel.butt@linux.dev
Subject: Re: [PATCH] crash: keep crashkernel C =?US-ASCII?Q?MA_pages_reserved_if_activation_fails?=
Date: Wed,  4 Nov 2026 13:52:36 -0800
Message-ID: <20261104215237.203332-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <661AFDEC-B8DF-4A5B-8C58-1D39F518F068@mainlining.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 04 Nov 2026 19:16:42 +0000 Bradley Morgan <brads@mainlining.org> wrote:

> On 4 November 2026 14:56:00 GMT, Usama Arif <usama.arif@linux.dev> wrote:
> >reserve_crashkernel_cma() adds each crashkernel CMA area to
> >crashk_cma_ranges[] as soon as it is declared. If the area later fails
> >activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
> >inside it, cma_activate_area() releases the pages to the buddy allocator
> >as ordinary memory. The range is still handed to the crash kernel and
> >excluded from the vmcore, so kernel data that lands there is overwritten
> >by the crash kernel and missing from the dump.
> >
> >Mark the areas with cma_reserve_pages_on_error(), so that a failed
> >activation leaves the pages reserved: lost to the first kernel, but safe
> >for the crash kernel to use.
> >
> >Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
> >Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >---
> > kernel/crash_reserve.c | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> >index a03f0a4305a4e..a4b616ed49482 100644
> >--- a/kernel/crash_reserve.c
> >+++ b/kernel/crash_reserve.c
> >@@ -498,6 +498,7 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
> > 			continue;
> > 		}
> > 
> >+		cma_reserve_pages_on_error(res);
> 
> You do know that this will activate under every bitmap_zalloc() failure,
> right? Is that accounted for?

Yes, that's intended. By the time cma_activate_area() runs, the range is
already in crashk_cma_ranges[], so the crash kernel will use it no matter
why activation failed. Keeping the pages reserved is the only way to make
sure the first kernel has nothing there that gets overwritten or goes
missing from the vmcore; the area then behaves like a regular
crashkernel= reservation of the same size.

fadump made the same choice; it is what cma_reserve_pages_on_error() was
added for in commit 27d121d0ec6d ("mm/cma: provide option to opt out
from exposing pages on activation failure").

The bitmap is one bit per page (32 KiB per GiB with 4K pages) and is
allocated at core_initcall, so a failure there is very unlikely.

The alternative is to give the memory back and to drop the
range from crashk_cma_ranges[] when activation fails, leaving the crash
kernel with less memory than requested. I do think that is acceptable as
well. But we do need either whats done in this patch or give the memory
back. Happy to send the alternative as v2 is everyone thinks that the
better way forward.

> 
> > 		crashk_cma_ranges[crashk_cma_cnt].start = cma_get_base(res);
> > 		crashk_cma_ranges[crashk_cma_cnt].end =
> > 			crashk_cma_ranges[crashk_cma_cnt].start +
> >
> 
> --- Thanks!
> 
