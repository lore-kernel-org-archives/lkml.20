Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279453;
	b=izISeCBE1FNB3tpXttRcOzlx07d3BKCb1l0HfpMiujlRNFBIJlGky5S2q3fajaimE/4u
	 y/wm6dP8AjlNjSS6Uvm876zOYyXHvHXzNBeXDCO9SepDCTjVCqf0U9x2svOdoCkEKQlGx
	 T4GWHaKkLKNFvMnr01SlbeyjYGFsM868Yc5GeT87EV5fghuk0jJsdcGJVTK4degfFNRNj
	 0iLdTjCb1i+DZHCPil5uWXcLM9TGcIg0AURVT1J8HvEWZiISPloqwwX8KJb4ci4Hjrnya
	 B5wRP0+K0cEMBZa2P0KxPqbpApDeicGFgvEhUIbyNJGRISYXzNv/pk4FcjPh1xAbpdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279453;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cQABe9fyxw+SMMiPxA4Zn4DFjwVkHWXWcEdmXA+dMis=;
	b=giGkl9rKgXW2hQIoQigCYFseZtR/OAmC3R+ywRSffSABal4EOGx+PDZb77qrAM2gXqoH
	 Q2AuNiJy/JcgBu42l5jSrf2ASVrI0R67WPiLVHykbB+si820ibXYGkL2PsUzfs58dOkgM
	 1yzmpDnhjhHAWeRLDpDVral0DdEc+5ixQrHXPEkhIGT/kx3SeqOzZNXzDYkmWf6YMEUfK
	 now2J8aOOvnB4Gns+xt9QOklwcGoHxwpWWLBPvX524B50HG7EsWL87XxbGMzMgNODUt/c
	 PfQ50f7qLfRAsgiQs1aJpL+3PgVkCclACIU84qqKGN89YoNKSEk21rXjuz7SKFCPLcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qiiz6ATw;
	arc=none smtp.remote-ip=95.215.58.235
Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qiiz6ATw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V5f+oq/M9eVDqi0oCP3GLKbRuxjAC1+FXXgoVyH9cpY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793279450; v=1; x=1793884250;
 b=qiiz6ATwkImFuwdZbU42HEebsGQZwDmQAaNXY5giwPr/R9ehLlEM6xJi4Sf9fYQXb+Bi5NtO
 N7HAkTeabP8LBKbcxMzTcrLYrtW8oZVzc+yKmCHBVe334LbYcaVBO9v1MuHD4y1WKdgA45b6+2r
 1bMj21madWjIC6v6abQBhqr4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d29fc1ab4caede27;
	Thu, 29 Oct 2026 13:10:50 +0000
X-Mizu-Trace-ID: d29fc1ab4caede27
X-Migadu-Flow: FLOW_OUT
Message-ID: <d36cb3c9-a2dc-4826-920a-994c773dffd2@linux.dev>
Date: Thu, 29 Oct 2026 21:10:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base
 page systems
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
 <bbdf1f71-6b86-4951-b5b7-e1fcbe672476@arm.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <bbdf1f71-6b86-4951-b5b7-e1fcbe672476@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sarthak,

On 10/12/26 2:13 PM, Sarthak Sharma wrote:
> Hi Zenghui!
> 
> On 10/11/26 10:05 PM, Zenghui Yu wrote:
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> >
> > uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
> > chunks of chunk_size and moves them one by one.  On arm64 with 64K base
> > pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
> > the whole 32MB (UFFD_TEST_MEM_SIZE) test area:
> >
> >   step_count = nr_pages / (chunk_size / page_size) == 0
> >
> > Because chunk_size > page_size, the test then aligns both areas up to
> > 512MB, which points far outside of the 32MB mappings, and decrements
> > step_count, which underflows to ULONG_MAX.  The verification loop then
> > runs away and the first dereference of area_src faults with a SIGSEGV.
> >
> > Skip the test when a single chunk cannot fit into the test area.
> >
> > Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
> > Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> > ---
> 
> I run the test on a 64k kernel. Before the patch, a segmentation fault
> occurred, which was fixed by the patch. So:
> 
> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

Thanks a lot!

> Though Sashiko has a few nits [1] you might take a look at.
> 
> [1]
> https://sashiko.dev/#/patchset/20261011163527.95988-1-zenghui.yu%40linux.dev

I think both of these comments are valid and worth fixing, but I don't have
much bandwidth to work on them in the next few days. If you are interested,
please feel free to fix them up and post the follow-up. I'm happy to review
and test it.

Thanks again,
Zenghui
