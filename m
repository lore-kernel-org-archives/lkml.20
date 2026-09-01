Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06038DC7D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252268; cv=none; b=RsTYcnle1Bq77qax+2SY616fs0jfm1l4WJoOBZIf/Sk869hmOK8oC9Px543y+uCYzMd7YjcZDcmPntZ35sguA6XPqvdJL079pnNTYZ02BfJXPj42Y/2ZeKp8meQ34NHXtDkaD16evPIvBjwF2b0SSQbkAcu1vMFyyVSzMy6FC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252268; c=relaxed/simple;
	bh=DhPdDQt2s+ehRWy5phyOU+QWi+Oe2q8DoIjQFF4h8aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgs/3MLUO5eXgtWYRARsmKOthPLz52balkTp4rUx482SKW4qQH6DXIaQyzCUb5W6ObcoXIAFkk3GsquPZWr8RGLob+QgoTcaoskH837OG2UcSXtS/qdt/cI1hCxCcQ0GgfnMQVRKee4zC7G/jy7jyFuS8yg/XALUbhwSoTRkjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dS9l5E3O; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dS9l5E3O"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso733089366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252263; x=1788857063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfkumJrDF1tZTAVRjvzgDO3hMk1gGG9KZ2g7tgv7l7Y=;
        b=dS9l5E3OnG6TQGvQpZYMLEM4mI+XpeRVIK9fQMMyDRNRkGmIhkF5NAMfTqhBODW5Mc
         ifiQP6GRCy6Ehq1Wi1sB3VoNGwUdDAHhpjEgnHBeOxddZc7yaIghx69iHvUNMKlhDLsw
         zJGRXlLkwnfvYa0EVXkTP3NyKIFH5EDvizHEVTP7VMPOGe7KaiTzPejBr5f1dlf3DpUL
         W2oKWHifpZsjh04Q8dgERWsFnA0AsMM2pUhQIy02WHLX41ArFCVr0/RAQSQa4dmQFsk+
         toJO8t1FB7d7E78uDqqHgdY0JCY7QFTrFoGsXzEmJdtYNVRTa7SKLBy9qHN3aThI5ciC
         ixVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252263; x=1788857063;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfkumJrDF1tZTAVRjvzgDO3hMk1gGG9KZ2g7tgv7l7Y=;
        b=RHK0Wnvz/WM1gdroZQMOpyRmMo9bKM36fASn8rMp772sHBek7lmqo/8rXW/FyGQx5Z
         9ir6X4Gjbm+WLb9KWEiabfLAVKKMsoORra9pwv7MW28Ukk+SyZBfAb6C9a8agIkYDo75
         zJfCgOujLIB5Pg9mm746sjDNxryk8AiAso+cDzHlAqNIx+F4Ro+IofUdoU+x3bCuaLQ9
         inQuceeXyJdnKUkByz+8Tzl9SI80XvzGzJ0yjH3mylxUy+7JHr4qqRFsfSL4KEtMbaa3
         RFcXiwknlb6/w5/tnxXyt03TQG2sI7nYQ2qeet9IfVjViIJbqWY7mGlA7EhSngeJbmY3
         0bCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9unFYmdtfd0ZjHZo/UdKHWMwL4Yw8joPsccpb/WjyZKfUVZ4tGm/AVvCbg7NKV3/or5C135DUXHn6xVE=@vger.kernel.org
X-Gm-Message-State: AFuF++kSuL6IU2iQXyVGTh33Wn6i5A4wju47bPO5kuRaNyz0cNB3uTO8
	7DhfsD/Ift+fhE+Pe8RhwiyeKZ+7W2VTcnJUeNEWBjrA9pr7a69/qmsx
X-Gm-Gg: AR+sD13GP7+JeJkidMyfv6rtWrv/hY5brEtOojao3S+y6Br73NZus8ZDKjNqM3tbnTC
	/0AwW0ZJJ4QYsByLEMAv6NuSxKA/v4zscsa6GE+HcRza2InQpYgXRUQOCd6i/Uq6h6dZwCTJRbf
	EOnrTXt9ofqXZ7gFMODgH3wEFb2czj/hHoxcEl0i0Ue1Mc5Za06PhmHOA8eXkpD2lejn6755fyC
	MR8sJ6yrLWKZkPtQsOGonlJZMilRLs4DoRjj1dYgupRwxGHCOZzmspH5Tvcw+8bw1GDVi2RvEqF
	Znj8qMl8pnvW9T+thF/hxtfq9gLa4V0kgSGrjiqzkzaILkNC0WbZtnvLsAQTqJH1Yuwpi7NZyoW
	LsFS1O7aAbppRK2Pl1EDmUoYt0FLyJ6cg3LPzgnJhrMEDjBUxuR6sJCvTi5mACqjJEfcQOiH8F1
	wupf3CEla38qxfKcqQT8Rv6NuURnqhuFNjwiVTT2A5ddrDSzBuMyDo8Krzn/UhYJB80D8IJDQ5P
	RWT03kKkmivGSrskRs7bfk=
X-Received: by 2002:a17:906:f582:b0:c24:c22c:6372 with SMTP id a640c23a62f3a-c25b3affecdmr382949666b.5.1788252262902;
        Tue, 01 Sep 2026 01:44:22 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm527267366b.0.2026.09.01.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:44:22 -0700 (PDT)
Message-ID: <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
Date: Tue, 1 Sep 2026 10:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin> <apaF1HUtJnstuUN4@kernel.org>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <apaF1HUtJnstuUN4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2026 9:59, Mike Rapoport wrote:
>> Would it really make sense to allocate the four buffers separately?
>> And/or use vmalloc().
> My understanding is that the buffers don't need to be physically
> contiguous and vmalloc()ing the entire fifo->mem in one go should work.

vmalloc() is an interesting point.

fifo_init(), fifo_write(), fifo_read() and fifo_mem_release() implement 
a FIFO in software that the XillyUSB driver uses internally.

The memory for this FIFO is allocated in fifo_init() by calling 
__get_free_pages() with requests for up to 64 kiB. With the maximal 
total buffer size of 256 MiB, we have a possibility of 4096 allocations 
into an array of buffers. And if __get_free_pages() fails, the size of 
each buffer is halved in the following attempt, which tries to allocate 
8192 buffers, each 32 kiB, in this example. And so on.

This mechanism with an array of buffers complicates the implementation 
of the other functions as well.

So why not replace this with a single call to vmalloc(), possibly asking 
for 256 MiB in one call? That would mean simplifying all four functions.

When I wrote this driver back in 2020, I avoided vmalloc() because Linus 
wrote "vmalloc() is NOT SOMETHING YOU SHOULD EVER USE!". (See [1]). He 
also noted that vmalloc() is a restricted resource. But that's from 
2003, so maybe things have changed since?

Questions that arise in this context:

* Does vmalloc() guarantee that non-pageable physical RAM is allocated 
when it returns?
* Can copy_to/from_user() be used with memory allocated with vmalloc().
* Is vmalloc() guaranteed to successfully allocate memory in the same 
situation that __get_free_pages() could have been used to obtain the 
same amount of memory (in smaller chunks, as with fifo_init() )? Maybe 
they allocate memory from separate memory pools?

And most important: In what way, if at all, is memory obtained with 
vmalloc() practically different from memory allocated by 
__get_free_pages(), if it's never used for DMA?

Does the API offer clear answers to these questions?

Thanks in advance,
    Eli

[1] https://lwn.net/Articles/57804/
