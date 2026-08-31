Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F43BED2D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171194; cv=none; b=fK+JDSEnn+6K8OOHGdrEyYZt02uY1fcYPWdm0tbDzEwbd3O2275Ff+QiBPE5ZRtjroB97gRelIUV9014HivpPvqdYywxR4XPvAUqvGA5HKjg6kcUAux0mYuFwL6KZG5gWRZAv+oqbXQzXBgi8Fa850N6k55D4TQ1DTjqqi/w1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171194; c=relaxed/simple;
	bh=a+mF+4DNcJoAkhbxx0tCvatH9wMVAiaD4FrL8xvpAvk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T6p9YnNQj0tyMz/B0EAR+Vka5advqY6KwgigJZamwGMeptzJniUO58DYls5q37JtK5VnitnX2UAPwOHA3W1uiZ13KgothozmZKb5OZTU1/E4XlSy8nI6LrwqE8SnkjOZywiTTxpI787lCVcPwl1xQB7IshdRyMUsZhedwmGH0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsDrdF+h; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsDrdF+h"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2531f453eeso500414266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171191; x=1788775991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=67t2MAwM/CJHQTc19wvE+OmwIIUNA6nz2MWrmdq+rUg=;
        b=qsDrdF+hs/zPpqfsxrUJTTaH/d3jMBrtQdgQs/wAYnZGdlLFOwReszA7cBTEN/B4yp
         2dOBJUTTR8W5Y4boKN8L+MwpdTwhCTAf3XXdwYyGybn4ZxhjGP+Y8uTQML5h0sV9KmiX
         FyhQHZtFWphZgT2Wu3atZlkEATfMbmAEMh9YVO4TejOwRg42w/tMm5iURyrGBjjQ9IC3
         lU0dx66A0eNxwrmybdCbO4WhMsCz68ZS78dgHZt0qaUZWr+wOLFi4TmQ+5MrbUQqVOX5
         +kOcSvScV0YZiBjbQU/dHxrfL/c5yKOAKR2mfUKYBpsCu6VJTMLM4Dbx9F4PXfFvL2+6
         ICEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171191; x=1788775991;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67t2MAwM/CJHQTc19wvE+OmwIIUNA6nz2MWrmdq+rUg=;
        b=V2NM8CSQgEIjQnE8bCHmVqKqdBgx2ltYbMAvOruEdfCkPV0A0qFPFyZ1iaAm4CNMfE
         KQkAeoh+v+7u/RtSES32Lgrvhdmpgl2pjL3FwvizRlWGZJtfOMH/BOU/gwCB3DfHzZ9l
         hEOt+DvWVkeATgyJnKTm1Ycbu1fz5jQW+KFanaxW/mLrhdfG8ZS8VN4stuus1uQtnI0D
         4DXwn/cc34eeOW9pc8PXk/gt8KPQHqdEN2ZysU0+mzdRvD/2ewKwVpWCGQemN83h/EOX
         MyJZoQsEKRxv2JaNszlalV8VdufSzpIy9q1YSaZgiDEhTpUaqaYjOSeUPVtl497FfaxX
         0OxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNvdDwsIuKOhIhLC6sCzAjGZ+IdjcyZ/7c+4d13DvK8qEc6C0Z6CFsaCr/GtHjH5KbpqyLcIhNEMktyc4=@vger.kernel.org
X-Gm-Message-State: AFuF++n6lG0b7HgNZrL5dk0zCTotyuJFnfaTG6kbKrtiqlSH6NnJ3pL4
	d2sShUXBnzutNZSYls/CjIlUyyVxn2fhYFgi+HK0lQAMz72lQgHWJpX+
X-Gm-Gg: AR+sD139CYagZ524qsxEDWFdI00jx7Q/q7/dLYRQ98au9n68rVlFvaYTDfbkgtHJw9O
	fhE3g/c8v/UUwdSOpswlNAERF9qBnlKHZ7yhXrS9//1gcSFGoFMzhcnCb6wKN5DufbC0APV3Met
	4aIJpkYzlU1b/g19LNaqg+r3ewMAgRy2b4gu+1DCd0e+k101+0+fhblOge7k/jKZY83kUeE5FgB
	a39JBbLR7kJcN3T6u4STGuhrStegWCoMpEXXzWgmm+N3c98xEc2MChKc8i1HpxiIi6fQIJ/Rlln
	8yxRmYDsf2tvlnfKEoDHGb8zLl98m1SCoKQobP5Z2Zyr1Bea37dalGSahAtt9HCJzp3fZ3/WQE4
	+4TW4Z621eHeSs8Dbn0nIqGfaKdk5994lLIQLlXxv8w92ujU3Rzs1UYdwfFDxI0HHin5xQBCmaT
	Ih8TU4fRHZuCTRCA2WOYeN7Ecr7xQPjCC03hWRw793lzrXk8uFTtsQ6vwj55z5q/remTzqXx6/v
	HOs5kiJd5fHzCQUdlRgVDu+
X-Received: by 2002:a17:906:1013:10b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c25aee558cfmr69135566b.11.1788171190678;
        Mon, 31 Aug 2026 03:13:10 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28f6sm385832566b.39.2026.08.31.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:13:10 -0700 (PDT)
Message-ID: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
Date: Mon, 31 Aug 2026 12:13:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
Content-Language: en-US
In-Reply-To: <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> fifo_init() allocates the buffers backing the software FIFO and
> endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> 
> These buffers can be allocated with kmalloc() as there's nothing special
> about them to go directly to the page allocator.

Except that they are a bit large.

fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
This memory resource is split into an array of buffers (fifo->mem[i]), 
each 64 kiB (or less, if there's trouble obtaining segments of this size).

Citing Documentation/core-api/memory-allocation.rst:

"The maximal size of a chunk that can be allocated with `kmalloc` is 
limited. The actual limit depends on the hardware and the kernel 
configuration, but it is a good practice to use `kmalloc` for objects 
smaller than page size."

Regards,
    Eli
