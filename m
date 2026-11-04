Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819846;
	b=P8oQjbKHiUBhOKht9XVqpolQemhHHfETuT/AqfXml5s9Uet6n8Gl4X5yD2t1iEkHKUS8
	 BPhV7vgLKlJwjlf+t9mnzwhN+bHte1QLL6417E9vuxXBldlywTI9R/GAYlGOzbKBBHPIa
	 3dClz1wqGdM4XnLfNzMvqGmKny2W3pO5WEjvOJXNiOfUPKeoLrjx/sQOYD2CHVt2KOCKO
	 t8a/9J1YLXKcKppaPnOb/OkY1rw9JWzN305ZVpzMdBkqIBXB9TlRmU5eHi4L6nb1fKeMn
	 LrrMzBTRL37Yt07Xn6Okhvyi47fkGERwXmd7sE0MrWr3GItGR4Zh1er0QbCI+VQ+4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819846;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q9RBWwFn63CofyiYGd/4lZu+7oEXCckEZxKnFr8wcCE=;
	b=Xhuj90e0GV3Y/Equzcdpn49N/Xbq2DzKP0hV8AjimhauHKDJwKgAFlcp0ug6fXeEpr9F
	 sshd87enOHCr//hr1H/FtQPInuLfPrh/mBnLDSd5s8kiBrTY/Pa2wyKioH8wH25iS2cF1
	 5P4aFBqrXqXy9RJqZz1UV9q7NiSk24uAFaqPtDfyle7HRn5SC3BYaNpClYs5EyF5KR3Ro
	 aKCdEK+K/bGsiKgvDGFnQkakIT1I7W4foZ33yU6Aq/Ev2koqpsMcxj5aIcm4h9YTJjVbF
	 QcHEaESIEInGitYTr4Tci/ROBYyor6K81FE0lOF0DtaRJarCZGbNKC8opPKQBfGIdaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=gzTXmkeW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vj1HCCKS;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51079608362D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51079608362D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=gzTXmkeW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vj1HCCKS
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793819801; bh=q9RBWwFn63CofyiYGd/4lZu
	+7oEXCckEZxKnFr8wcCE=; b=gzTXmkeWedj7jRMbeoQJEsmjhBNYW0Lz0whmZZ73mqb7xJZGUK
	Pe3GeqEi0YHA8IMGoQjJ6VQ9UKvEL4/euRcCjSWuqeS/jTZ7JIhiFfebuUdX9Un2iagtAm68SZt
	g7ZhuBIynlrhXulbo9J3JRKsx9wxWsYU2x2BPzgdTE7MCCK6YCDWhgQ920TUXS6NRsOiNvdButH
	WgYg8ppX9lCVITHtxFrJ1HqUx3Dpy4To8lAiVPJ3qLIb++DPgaNIj2jhB8RUpLAl2tl2RpRTkbK
	8rDrIqoPH2r4wAGVZ7MjTghGFhAfoGgFd9BVRTBklEbCN2TikRBZ6m/m/dTgkHFODqA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793819801; bh=q9RBWwFn63CofyiYGd/4lZu
	+7oEXCckEZxKnFr8wcCE=; b=vj1HCCKSlnZcl02DJs+dAIAwPBQk/jfbwXDewIbV+HhF7idwxm
	6+RapBxR5/PdGjgGbwAAC8XvAfJkeOLtMbBA==;
Date: Wed, 04 Nov 2026 19:16:42 +0000
From: Bradley Morgan <brads@mainlining.org>
To: usama.arif@linux.dev
CC: akpm@linux-foundation.org, baoquan.he@linux.dev, david@kernel.org,
 hannes@cmpxchg.org, hbathini@linux.ibm.com, jbohac@suse.cz, kas@kernel.org,
 kernel-team@meta.com, kexec@lists.infradead.org, leitao@debian.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, pasha.tatashin@soleen.com,
 pratyush@kernel.org, riel@surriel.com, rppt@kernel.org,
 ruirui.yang@linux.dev, shakeel.butt@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_crash=3A_keep_crashkernel_C?=
 =?US-ASCII?Q?MA_pages_reserved_if_activation_fails?=
In-Reply-To: <20261104145600.3708886-1-usama.arif@linux.dev>
Message-ID: <661AFDEC-B8DF-4A5B-8C58-1D39F518F068@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 November 2026 14:56:00 GMT, Usama Arif <usama.arif@linux.dev> wrote:
>reserve_crashkernel_cma() adds each crashkernel CMA area to
>crashk_cma_ranges[] as soon as it is declared. If the area later fails
>activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
>inside it, cma_activate_area() releases the pages to the buddy allocator
>as ordinary memory. The range is still handed to the crash kernel and
>excluded from the vmcore, so kernel data that lands there is overwritten
>by the crash kernel and missing from the dump.
>
>Mark the areas with cma_reserve_pages_on_error(), so that a failed
>activation leaves the pages reserved: lost to the first kernel, but safe
>for the crash kernel to use.
>
>Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
>Signed-off-by: Usama Arif <usama.arif@linux.dev>
>---
> kernel/crash_reserve.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
>index a03f0a4305a4e..a4b616ed49482 100644
>--- a/kernel/crash_reserve.c
>+++ b/kernel/crash_reserve.c
>@@ -498,6 +498,7 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
> 			continue;
> 		}
> 
>+		cma_reserve_pages_on_error(res);

You do know that this will activate under every bitmap_zalloc() failure,
right? Is that accounted for?

> 		crashk_cma_ranges[crashk_cma_cnt].start = cma_get_base(res);
> 		crashk_cma_ranges[crashk_cma_cnt].end =
> 			crashk_cma_ranges[crashk_cma_cnt].start +
>

--- Thanks!
