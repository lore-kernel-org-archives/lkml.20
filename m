Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D663769E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848673; cv=none; b=eyeh7wwa8iRg3XannuEqjoEYcylTZrDSdqibwJGiDHpOHWyWSKdWvgDjgqWzYW7+24SB8xjfcCxNWQc4HdlYdPWiDbZLtyYkJvNsZb1mlcdId2LdOzmsckct+cq2e+aBzOvqWVFeyrcafWPyj/e7Zss2ydI1W2w4n+/PTpBjl6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848673; c=relaxed/simple;
	bh=MBn0CE7Kymrqbq8YOgG9n11MvQW9GyGybawOGCVLhd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1/gvGnxb3vbyCRjeX+4lPD2vXK5PH8j0crW3hINh4d3ccVDxQm91wyT7UT32UEsIFW6LmZ8gcaANCUci5Z/AkX9pRXegy2/1ESTUEAKgJUNWJjRC0+r7yVp9GLLl2qe7HoYlBtzturr3Nw8u5QQRGSJ1taRo5zJtYa01DEtYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=oo2/bx5o; arc=none smtp.client-ip=91.218.175.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="oo2/bx5o"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MBn0CE7Kymrqbq8YOgG9n11MvQW9GyGybawOGCVLhd0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788848669; v=1; x=1789453469;
 b=oo2/bx5oy1TuGPea6IYvFjuewfguuRCCJm5w1kFDgemAn+fd3O8eUODhW9G5CLUafkxTgsmf
 jeI+s3AEkIly0uWxYwJFuaSLyeUAzjySJqN11OIe63fRXvlaPoE6thtXkZpR0Am7VYGttLIa82P
 rwcf8RD0q3fKMjm76tsDNF7L25iP0uMXc2ed2ury8GGgzQCJSaHypo98O1TMzIFKAAPa5uRQZ3E
 /sTVxef8G/OfHPPznGsxtV4W++mq7TxTx9CGLg3zkKD6UbIaVZk+hOxy85ZaiEiOfilKvqENyap
 9HpZlCcWvFlMePbi0TSFAFP4mGFI0ZuonDWIRldx2ASAw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e408994e9e537c8c;
	Tue, 08 Sep 2026 06:24:29 +0000
X-Mizu-Trace-ID: e408994e9e537c8c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 8 Sep 2026 14:24:13 +0800
From: Weijie Yuan <wy@wyuan.org>
To: "zhen.ni" <zhen.ni@easystack.cn>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Message-ID: <ap-qDThi-NQgVXVD@wyuan.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
 <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
 <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6744bcdb-3456-4ba2-95a0-a58c354bfbfa@easystack.cn>

From an outsider..

On Tue, Sep 08, 2026 at 10:41:23AM +0800, zhen.ni wrote:
> > 
> > Sorry but your whole reply reads like a LLM slop. It took a lot of
> > mental effor to actually try and engage with it.
> > 
> 
> This reply was written by me, and its viewpoints are not simply copied
> directly from an LLM. The LLM only assists with the wording.

So that's probably the reason. Your previous replies was indeed very
much like the output of an LLM. Even if the idea is your own, after
being "polished" by LLM, it's hard to read. I know English is not our
first language, and it's not that easy to speak like a native speaker.
But may I ask you did you read it before sending them out? I really
found this bunch of overly formal content a little painful to read.

So I suspect the LLM may have taken too much liberty in polishing your
text, to the point that your replies no longer read like something a
person would naturally write.

The "Summary and Plan" in your reply in v1, both in its formatting and
wording, looks quite similar to LLM-generated text to me. So I can
understand why Lorenzo asked whether you had used an LLM. Come on, we
all know what LLM writing looks like.

That said, I do not know exactly how you used the LLM on your original
text, so please forgive me if I have this wrong.

Thanks.
