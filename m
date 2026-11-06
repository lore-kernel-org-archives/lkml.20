Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973963;
	b=UklapGLSk0jh6B6AQl5pEtlOUGfJPaz1O8t1YsczjNt381Ubh+D/q4dhQiuFcFUIoySl
	 9kgWnDoUPlVem8SlEgJNForJj1obLhNstmriDq7psLyVhP5eZSQaJ4SKoA6lZau+8NhGd
	 0GlEosdaoaxTTEbmrLEHpyKZpQxWAGz4cwlmEGRLvIxtppKlGtAghRBIGIL0s6uNp457H
	 V2MAim/tUH/wF0B5s9C+uw+EI1YsN7CJBN9Ee5Wy0nOFT27XmGFfjmFva3mBxUyhEiTb6
	 OmQZG2S6uq0ceaqeO5hd1XW9XXk2ymYSZIJk0J8jlLsDKzL2f3j2fVLrod1FF6tACQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973963;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PuZSxoPIfBuBWYT5kGfR/wiii4e+fymaeZzVU1jtsaI=;
	b=ukcJMfzFiiSdjIsTYIzEjkpn6TxZFCI1yyqfsRXETz9Nbhe3O3JNtru3Tv9QOA5yj2aA
	 1jLfkX1OcHulW34E9Scgk7kdlGU5ec8kQ93nXt0awMjw7Wti1EDxP158Uy5IJiPALJuyJ
	 cFT1pscXUfmdCBZpZdltdTUvVyl3yE5kq3hRdfaizJ/D96cdh5Y70/9oBHkRvrJ6Bbvrl
	 jOOI2w/cN10t9iV136344N7GW5ueL2e73aGQZj6ZBdE532wawHysU9OpX/JkwjyFLC5Ho
	 iACsmVpac/pmXVkLNmwEca8pzA1OuUIvBnpbiz2pm6lWw2r7QNfLkK1GOiNdWsEXmKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LVdL5OTg;
	arc=none smtp.remote-ip=95.215.58.228
Received: from mta1.migadu.com (out-228.mta1.migadu.com [95.215.58.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF4606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCF4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LVdL5OTg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KdFDOOwfZpllsNIG61lzpXhrUDjzYe3zHf7j2d/rM0w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793973959; v=1; x=1794578759;
 b=LVdL5OTgDLMIMrDfJNp3W6jbpvLzebf6/nHzDbVsgTI0/F2WoQhDR4vMHHY/shEStctNJS22
 dd7IxwlftsFazxu7/U6NZrUo2Y07ny27+rcGp8oRXvl5hSd/nIpV9I9I0S59iRX/LC+xgzdwdnv
 ibgHVLBtX3zy2134lTvrWdOs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5b86ef43620373c7;
	Fri, 06 Nov 2026 14:05:59 +0000
X-Mizu-Trace-ID: 5b86ef43620373c7
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	jbohac@suse.cz,
	david@kernel.org,
	hbathini@linux.ibm.com,
	leitao@debian.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH] crash: keep crashkernel CMA pages reserved if activation fails
Date: Fri,  6 Nov 2026 06:05:54 -0800
Message-ID: <20261106140556.1667159-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0a3c64d1-2b8f-4e0b-87ca-5397d1aaa3ee@linux.ibm.com>
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

On Fri, 6 Nov 2026 12:21:12 +0100 Mikhail Zaslonko <zaslonko@linux.ibm.com> wrote:

> 
> 
> On 04-Nov-26 15:56, Usama Arif wrote:
> > reserve_crashkernel_cma() adds each crashkernel CMA area to
> > crashk_cma_ranges[] as soon as it is declared. If the area later fails
> > activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
> > inside it, cma_activate_area() releases the pages to the buddy allocator
> > as ordinary memory. The range is still handed to the crash kernel and
> > excluded from the vmcore, so kernel data that lands there is overwritten
> > by the crash kernel and missing from the dump.
> > 
> > Mark the areas with cma_reserve_pages_on_error(), so that a failed
> > activation leaves the pages reserved: lost to the first kernel, but safe
> > for the crash kernel to use.
> > 
> > Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> s390 hits this without movablecore= (adding the s390 maintainers and
> linux-s390) since ZONE_DMA ends at 2G here.
> CMA tries to reserve areas above 4G first, but falls back to lower
> memory when it doesn't fit, so a cma area can end up across the 2G boundary.
> I ran into this while adding crashkernel=,cma support for s390, which I
> will post soon, and came up with the same fix.
> 
> About dropping the range instead, as you offered for v2: I'd keep this
> version. With the range dropped, the kdump kernel gets less memory than
> configured, and that only shows at crash time. With this patch, the
> the first kernel 'loses' the memory as with a regular crashkernel= reservation
> of the same size.

Yes, I do agree with this. Losing memory in first kernel is preferrable
and it will then force someone to fix whatever is broken rather than
finding out when their kernel crashes.

> 
> There is a second problem in the same loop: all areas are named
> "crashkernel", which breaks the CMA sysfs and debugfs entries when
> there are several. I've sent a separate fix for that:
> 
> https://lore.kernel.org/r/20261106104309.3669583-1-zaslonko@linux.ibm.com
> 

Thanks! I reviewed this now.

> Reviewed-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> Tested-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> 

Thanks for testing and reviewing!

Usama
