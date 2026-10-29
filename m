Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281090;
	b=Q2UD9GwQwDU0RnBvk2f95EcZ1QIC4dcWcqD/PJV5O85vRTD/rA7+SWCUtcF2+hhV3NsM
	 +R3nOjgsh8Utdri5ZfnkA49riGo36EuWez7vgjxSTZxC81dNtSdXDyV0NO+migx1rh6ZB
	 lhd3W03yHquzHvxFilDbbOzVtmBxdkMlzOMpGwXbjIct9MforG0CASv+Mj6kS4kZm7BL3
	 fLb9ozTuBxTQ+p5ju5Y2wYWIZKdr65fJ/PC3AJasG3+ezeQ6FnXGzizAZHCAEuK2Z9h2r
	 44hUjM38n+Ns9Qs0AQ+a2o/y3IR8ANjD2rHTG2borUDS0tbSyrqRQU798S53OnxKN3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281090;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pyqAO/uWU5yVFQr+UTpxevk8bBFR60Op4CruyZ1Yw1c=;
	b=QBJuyVv5IlYpZDBxe9vHBrLjG/TCEPbwvUpBG/vRNyLRI5885C5ov/eCWSCjRuUwJK7G
	 6IPoetE1Fye2/35UTLHoDbUoasVszEOuIdaLT47mq+p5LUIKyuHW3X6xdrhb8wN4ROuO6
	 8ecfIGs4hE/0Uo2DtPEPhQDcuwDbKlpKxako0jnxZMAj3hGd6WYdnYbbgEj+OfmiJ+dpP
	 tSMn91C+jQD7xuZyyVmqW8/Obxsus4h1NcPxQL3SFmTI2koXDgKGZpGSA+/p5S1MuKeyi
	 2mrrn1aMPx0GwqWIB2F57dSvPBnGGXU9jfOTwvs3S7yMyinauedfCBl8XLUrhOCjDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AcnqFvq6;
	arc=none smtp.remote-ip=95.215.58.111
Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40151606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40151606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AcnqFvq6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UkLfq2AiCr37WjjegzJiymqxIyI9DVtkKBDdhIlx4rA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793281087; v=1; x=1793885887;
 b=AcnqFvq6grjWGiixwLNrFUbCAe3FMNFxYBXdET61Ks57+qWvMENKyvD9y6ste8M2nPu38g9g
 LBfbtJjVGg93vAO0no6Xy7d59rpMOLEH2vkNMt7tzB2L18IDKL6VkaoMc+O5/eYk62y5aijwxpv
 f7tBWziYdLKrJBirq30IQAeI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 909f986a67bd46f8;
	Thu, 29 Oct 2026 13:38:07 +0000
X-Mizu-Trace-ID: 909f986a67bd46f8
X-Migadu-Flow: FLOW_OUT
Message-ID: <2162e5c9-58f4-427f-984d-0099d9b515fc@linux.dev>
Date: Thu, 29 Oct 2026 21:37:58 +0800
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
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, surenb@google.com,
 mhocko@suse.com
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
 <67c30e4c-3576-4ded-a71f-b49075ed42e3@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <67c30e4c-3576-4ded-a71f-b49075ed42e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 10/13/26 3:39 PM, David Hildenbrand (Arm) wrote:
> On 10/11/26 18:35, Zenghui Yu wrote:
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
> 
> That leaves 64k untested, though? Why not adjust the chunk size accordingly?

Right. Apparently this has never been tested on 64k :)

I agree that scaling the chunk size is the better approach -- it gives us
actual test coverage on such configuration, instead of bailing out early.

If anyone is interested in it, please feel free to send a patch. Otherwise
I'll work on it when I get some spare time.

Thanks,
Zenghui
