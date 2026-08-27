Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94653D6479
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843850; cv=none; b=tQHN3aq4AWeT2xX4HuBmlJhRvxg5SsUpMXgXu26GxIQjtXJlFlzkDSu9qn6XeBRF+za/t2D1oC0I2RkVTTfAl1qfkL2ataC16YdNckMdCyLJ/IAWJF7T2sSSs0uviE76iCwXZdC8bLj7zgPnPemg+XhmY48w0Sd6B2sLJmXeSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843850; c=relaxed/simple;
	bh=g99OLAAAnjbXW5zwa+srzNjASgOnpSbteUzkGHrKJBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imbzkpDOkhl/cgJJNZtDmUQ1FcZ9ArfDttdjhr7MKGHF/ISEpDVDtNE3m0ozil38tMd1kiXGp7O6sUDuIqI3jwN4JRS02M7+haFocC9Jn7fE5zSJud5cconcdY66nRE+zXlj1FbpiYJqo+fZ+KKHYzCns8zDFVzEvyF77C5c9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gZKJXRsS; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gZKJXRsS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g99OLAAAnjbXW5zwa+srzNjASgOnpSbteUzkGHrKJBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787843843; v=1; x=1788448643;
 b=gZKJXRsS8rFdNHW+7kqCS5eyT9kFSoaeRg9PGcCQt4ygNXhb0V3TDmr7+AsspphK6ftfRBks
 63yYN3YfWXDH0VmsgXe/uWEGhGqPCZ/bGp2fI36aB2xprjJm2pFVwYqIIgiD/vixdrtybpOdHt2
 z2H45bx3o0svINibNNBNUtrU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 95c7913dc38281fa;
	Thu, 27 Aug 2026 15:17:23 +0000
X-Mizu-Trace-ID: 95c7913dc38281fa
X-Migadu-Flow: FLOW_OUT
Message-ID: <05f7cf39-b133-4cc9-8082-40b081b7f908@linux.dev>
Date: Thu, 27 Aug 2026 16:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin> <054cf257-f5d6-4041-8c83-902af87c736d@linux.dev>
 <apBG3YnZcHhlvU3m@gremlin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <apBG3YnZcHhlvU3m@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/08/2026 15:25, Lorenzo Stoakes (ARM) wrote:
> On Thu, Aug 27, 2026 at 03:15:47PM +0100, Usama Arif wrote:
>>
>>
>> On 26/08/2026 12:31, Lorenzo Stoakes (ARM) wrote:
>>> Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
>>>
>>> 	~107,000 words of review across 948 emails (in 279 distinct
>>> 	threads), counting only prose you actually wrote — quoted text,
>>> 	signatures and attribution lines stripped. That's a full novel's
>>> 	worth of review commentary.
>>>
>>> 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
>>> 	and your longest single review was 2,404 words (mTHP collapse
>>> 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
>>> 	of your top-10 longest reviews).
>>>
>>> 	Estimated review time: roughly 300–500 hours, centred around ~400
>>> 	(i.e. ~7 hours/week for 14 months).
>>>
>>> 	1,615 THP-related emails in the window: 948 reviews of others'
>>> 	work, 278 replies on your own THP-touching series threads (~31k
>>> 	more words responding to review), 382 patch emails, and a handful
>>> 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
>>> 	emails), June 2026 (113), August 2026 (111); quietest was December
>>> 	2025 (5).
>>>
>>> Think I can be happy with that!
>>>
>> Ah so sorry to see you step down, you made THP genuinely better!
>>
>> The numbers show the amount of effort you have put in, but they don't capture
>> how consistently useful and detailed your reviews are, with the aim of
>> always trying to make the patches and THP better!
>>
>> Thanks for being an awesome maintainer and hopefully you will consider
>> coming back soon!
> 
> Thanks Usama! :) I know we started off with some fireworks on review 😅 but
> you've always been fantastic to work with and it's been great to see you
> develop as a contributor.
> 
> BTW, I did want to say but never got around to it - I love how you've
> approached the PUD THP stuff - i.e. getting the huge swap stuff sorted
> first, gradually building things up, etc.!
> 
> You've always given interesting sessions + input at LSF and have had great
> insights on how stuff interacts with the Meta fleet also! :)
> 
> It was especially interesting to hear that 512 MiB huge pages have actually
> resulted in far less memory usage than you might expect :)
> 
> I will still be busy upstream with the 4 other maintainerships to keep me
> busy, along with series both in kvmarm and core mm so don't worry I'm not
> going anywhere :)
> 
> And as I said to David and others, always feel free to cc- me or ping me
> off-list etc. if I can be of use for THP stuff, even though I'm taking a
> break from the maintainership side!
> 

Thanks for the kind words! It has been awesome working with you and discussing
different topics at conferences and the mailing list! I am sure we will continue to
in the future!

>>
>> Thanks,
>> Usama
> 
> --
> Cheers, Lorenzo

