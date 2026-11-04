Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835810;
	b=uZ7Bk78K5VmZA0s2h0aeHhCggHXlHyOozl9PumJvddr9R0OsZ52sAglY2T2EllWmUjT7
	 qTrv3tiDAhtgNbjzI9cPEo4Indw5zMDzI+cuZvuC1JOKsQzjZAhtVNNeAWPhBXJTcXMzk
	 P3SNIsr61/zk6AN9nDaJ6PeLr/3EdMRP+9hVpBr8vqwaO5o/XRIYsPm/HsrBaWKVfz+w5
	 S/3MkAI4BLRuQgsCx3OEUdJjWokESn0TAnrdcpVafLE9sg/4nXgZdbLAinvK48j1QFN81
	 WGovqkhxCVwqXC/lbalaj04vCnyQ613riovdJ/yrAOB9Nl1IXO06DMhO6MtzN5tHKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835810;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yXrtMh8cggIlOAb8hgX0MxUrZKo24LH39nkcwcdme8g=;
	b=IaLNVU1XaIXPt+rpesssE8bjF2LGxKuLDdQV/k2gwsT7NnAze0r5jFYSInOX7gntrM0M
	 1OtJj3ihdGBRqRqDTWvOCFqjyuP6MBDbdaaKi4ZgFpao2ANZ0DGVWYv21I0t9LrAFDQyU
	 WKvyWcHHKwz818Sb7S8yZRNRIImD0c/h2g/pONTIz/+8cY5oZf7r8arMn6yGhGj4cMYb3
	 Ms2lYGSHfZHp3GylFhHKPQcL6T4ZohmUHSi64HQqEP8FS+RLFQeIbHgWfqGt+qeQY84mi
	 6Hqd2vRJRM8kVLQ5WukyDv7NyoYCGJRnZDnyyUWelHbZ0idy2cEEXeMsIeChoW0FeFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="p/6u85hd";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=9RoHZ0kd;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=p/6u85hd;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=9RoHZ0kd
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793835739; bh=yXrtMh8cggIlOAb8hgX0MxU
	rZKo24LH39nkcwcdme8g=; b=p/6u85hdrWtekdU7mgQOVIvJ84m6HGiJOGOPpM30JTL9duDyXY
	s3N6D23lLoDuK2werlgVmmy5DafQgZfVrAbuPFhEtISTBFuOSbGT+NPbUBwEAnTtxGr73QLYzj6
	gLcsuehbtjGo3qmJ1AZtumDHUwTUU/RqwevdV59ne5WLzAThNOQtKm9uxh+hUj/2Wta5yjzY9un
	9AyNptyyeTqhJQgnFk+C7NSeFP3qZ53aOG5lh0IyrTdbBdZJS75mjq8rr+gUSe4oVVpsoqBkENL
	HOAeqiO4WrHU+AfUokUHy8kCGkHlevxcf/IIMWxmam/m4Bdb46gmPhzrqALh1p35Jzg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793835739; bh=yXrtMh8cggIlOAb8hgX0MxU
	rZKo24LH39nkcwcdme8g=; b=9RoHZ0kd27RUfOtE3ySUdGyUxa7lO3h/m3UGEN1CekByN0+Zr7
	S56PnF2QldWG6mhN3D+J3Y08iXmLP3j3GzDw==;
Date: Wed, 04 Nov 2026 23:42:20 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Usama Arif <usama.arif@linux.dev>
CC: akpm@linux-foundation.org, baoquan.he@linux.dev, david@kernel.org,
 hannes@cmpxchg.org, hbathini@linux.ibm.com, jbohac@suse.cz, kas@kernel.org,
 kernel-team@meta.com, kexec@lists.infradead.org, leitao@debian.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, pasha.tatashin@soleen.com,
 pratyush@kernel.org, riel@surriel.com, rppt@kernel.org,
 ruirui.yang@linux.dev, shakeel.butt@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_crash=3A_keep_crashkernel_C?=
 =?US-ASCII?Q?_MA_pages_reserved_if_activation_fails?=
In-Reply-To: <20261104215237.203332-1-usama.arif@linux.dev>
References:  <20261104215237.203332-1-usama.arif@linux.dev>
Message-ID: <415B6D73-FB20-41A7-AB8D-E5F548003290@mainlining.org>
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

On 4 November 2026 21:52:36 GMT, Usama Arif <usama.arif@linux.dev> wrote:
>On Wed, 04 Nov 2026 19:16:42 +0000 Bradley Morgan <brads@mainlining.org>
>wrote:
>
>> On 4 November 2026 14:56:00 GMT, Usama Arif <usama.arif@linux.dev>
>wrote:
>> >reserve_crashkernel_cma() adds each crashkernel CMA area to
>> >crashk_cma_ranges[] as soon as it is declared. If the area later fails
>> >activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
>> >inside it, cma_activate_area() releases the pages to the buddy
>allocator
>> >as ordinary memory. The range is still handed to the crash kernel and
>> >excluded from the vmcore, so kernel data that lands there is
>overwritten
>> >by the crash kernel and missing from the dump.
>> >
>> >Mark the areas with cma_reserve_pages_on_error(), so that a failed
>> >activation leaves the pages reserved: lost to the first kernel, but
>safe
>> >for the crash kernel to use.
>> >
>> >Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
>> >Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> >---
>> > kernel/crash_reserve.c | 1 +
>> > 1 file changed, 1 insertion(+)
>> >
>> >diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
>> >index a03f0a4305a4e..a4b616ed49482 100644
>> >--- a/kernel/crash_reserve.c
>> >+++ b/kernel/crash_reserve.c
>> >@@ -498,6 +498,7 @@ void __init reserve_crashkernel_cma(unsigned long
>long cma_size)
>> > 			continue;
>> > 		}
>> > 
>> >+		cma_reserve_pages_on_error(res);
>> 
>> You do know that this will activate under every bitmap_zalloc() failure,
>> right? Is that accounted for?
>
>Yes, that's intended. By the time cma_activate_area() runs, the range is
>already in crashk_cma_ranges[], so the crash kernel will use it no matter
>why activation failed. Keeping the pages reserved is the only way to make
>sure the first kernel has nothing there that gets overwritten or goes
>missing from the vmcore; the area then behaves like a regular
>crashkernel= reservation of the same size.
>
>fadump made the same choice; it is what cma_reserve_pages_on_error() was
>added for in commit 27d121d0ec6d ("mm/cma: provide option to opt out
>from exposing pages on activation failure").
>
>The bitmap is one bit per page (32 KiB per GiB with 4K pages) and is
>allocated at core_initcall, so a failure there is very unlikely.
>
>The alternative is to give the memory back and to drop the
>range from crashk_cma_ranges[] when activation fails, leaving the crash
>kernel with less memory than requested. I do think that is acceptable as
>well. But we do need either whats done in this patch or give the memory
>back. Happy to send the alternative as v2 is everyone thinks that the
>better way forward.

Hmm. No approach at the moment is the "perfect" approach so far.

>
>> 
>> > 		crashk_cma_ranges[crashk_cma_cnt].start = cma_get_base(res);
>> > 		crashk_cma_ranges[crashk_cma_cnt].end =
>> > 			crashk_cma_ranges[crashk_cma_cnt].start +
>> >
>> 
>> --- Thanks!
>> 

--- Thanks!
