Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA04DA9B1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062544; cv=none; b=AHUsHk6e+D5uvPs+V1qH6Z3bGFATcA+PhkhkBEKJhrWV64Qxf33689v9FIs8IjkQLdGEh9FtRuRVdxVOAlkkOMhOilR4lL2bXp4SutSIY242DEtpDdf4RdTtK5sH3mcFkFcXu0GVrh/dpxfWJ/SwqphONEwR4LenZjF1SMpuvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062544; c=relaxed/simple;
	bh=Yy1yxhSUVWU2+uolQRV7bI9vT9WCcyZySLCh7NYfJTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DkzJHlBqUBfIcdvFvLrKb3DDka0W5QRxg/wHB590KG7k4wQ87xoqe6Y9Fv67zHL1CDw8lPxpYQxlBYh6AAseZliGC+4JQyMzUjClQ9kmyc0jWndPft0igXIC6+P44BSkaYJLTzuu3CgxllNlfWWkKC4jcCODYhpUOXhswOpS9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2jp9z9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2jp9z9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6491F000C4;
	Thu, 15 Oct 2026 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062542;
	bh=bIfes0VmGz93Q/D7qKVAipk4bYqd8Rm8ZLiZKuFMUfw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=i2jp9z9RcjWmzfTFdI2o0RKgNd5lHBSExqJbfVUWMOO3Hqtg8Ocr3XnH8AjA1rE+8
	 4JOg3mOL71xU17oyCOVQS5D3nzPIUBu7SzLxVt96CbTNjdvz6IUMxyGYg8frUbyE62
	 Ms9bTFfLVQPNoq4JbZ9vTDdpJB8/5/biHLFU9tXDLucmpQc5I05+e4jZru9aTEpCn4
	 DjPR2z/M8mfvz1R/8ekpZy+0etF37VzorR8WK8iwKd0M7AftHzPSuvsJHmIJ0WEj3F
	 5AqSWH/YNaidOXVDE7d+knZY7phLDP9/OtWpltqn9ir8Xnwjns3+7I71a2hISoySxd
	 SICGxvBZK0p1g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Alexander Graf <graf@amazon.com>,
  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Bing Jiao <bingjiao@google.com>
Subject: Re: [PATCH] kho: do not reserve empty per-node bootmem areas
In-Reply-To: <atCQqghin0KOyx63@kernel.org> (Mike Rapoport's message of "Thu,
	15 Oct 2026 11:36:58 +0300")
References: <20261014131547.259138-1-pratyush@kernel.org>
	<atCQqghin0KOyx63@kernel.org>
Date: Thu, 15 Oct 2026 13:08:59 +0200
Message-ID: <2vxz8q3zi5kk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 15 2026, Mike Rapoport wrote:

> On Wed, Oct 14, 2026 at 03:15:44PM +0200, Pratyush Yadav wrote:
>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>> 
>> Some nodes do not allocate any early boot memory. An example is
>> hotpluggable nodes with movable_node enabled. So the scratch size for
>
>                           Let's use the new naming please ^ ;-)

Argh, muscle memory...

>
> I'll fix it up when applying.

Thanks!

>
>> them ends up being zero. Zero size allocations normally don't play well
>> with memblock. Memblock returns an address, but then doesn't actually
>> reserve anything. This address ends up being recorded in kho_bootmem
>> with a size of 0. In case of hotpluggable nodes with movable_nodes, the
>> allocation on the node actually fails because memblock refuses to
>> allocate there, and so KHO fails to initialize.
>> 
>> Skip bootmem reservation for such nodes entirely.
>> 
>> To keep the code more robust, avoid overloading kho_bootmem_cnt. use
>> max_nr_bootmem to store the size of kho_bootmem array. This ensures that
>> the location of kho_bootmem_cnt assignment does not affect the cleanup
>> paths.
[...]

-- 
Regards,
Pratyush Yadav
