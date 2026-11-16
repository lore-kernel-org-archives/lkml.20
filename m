Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866111;
	b=osbop+sDbHZMoOTKRfjvWrDcMzKOwK3xjhuH3ooQzLAtAT0wvj74sqdGhadwO8o/MdFx
	 uhBOhSiRnJ/XzQF/G7qKBuLEB4Gqy/YsgUKrzdcKMDbClT04s7Y/dTC3H8M192KgwX/1o
	 8Yk2B6mkqK6xw2PSuxHrJA08DHMeiWDJO0ab5EJ2/mk66N2lJozBgwJpbImtW55Yhs+Wu
	 7fcaf9pOHgQ+BfE6KeR/K6jZOMqFXT4LOg09gwXAxkylGAlXw6XWGCW+o4fYicxTRrnk5
	 VkwdEIi6kCLG9XNqh2Fubx4HavTl5c+p3f/3ISBwUrfdfqrPzs265IHzCMKYl7KwkyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
	b=xfzfgFXadAfHl7MJKyU4uHYCX3OxyOnaPmxStQJg3lJRFMDwYUZGNC7GqESFGOLWHfnF
	 EPRA7vvKpVyOSz2KdUQ7ClG69YVmDFt6R2x7QoD9gp1TiJkHyKHj8GoIX2/WrSm4+fOl9
	 2+87OLiPsEvSvQE5dI2AAbgPsiDjPHqZyBA+18mUvDfEf0A5gLHi7l93EIngLAaXPh5qY
	 suiRiMAulh8rUjTm8T3yTO1P5dom+1MnsCjMofNwCxts4NJgCbRQkXWU+H1IVqtKj9q4o
	 8kEjawHewvXZNmRqJAxCBujx0Rik0C6crsAZbPwu12pC+i3UUELFaJLLyPLa6m6l9kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuIsnhT;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19640606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19640606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuIsnhT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21278085e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866109; x=1795470909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
        b=SEuIsnhTIa0FHktjysnma68HfFiWhJjXoAtls/Psz/C/g288mSMcR3KF2eqIyUZCPv
         T9F7rL6omnVBvjcxOdV4wm/cpwzKqsUJNUQWou81N9X0EryPVuy3+iaQW9AlF0+HR5tC
         f/cvZ1jHSPnGS/yj3M9/ecmn/z+/9b8lkN+asobbZB1I0xTlkh6OI4Z2fcxWJg9aZ5k+
         ZhWocnLfZmmOP0Eb+R2Fz0TeHSgQE83AGmHyrQ/s74Xze9RbRkw8ciXiYWd3dlTQRcl8
         0chPpDGPIC0N6BEe10DckkkmJYA+ApFowC7BY46ajLpD3uCMkV1wyzJkQ17ywRCfoTr4
         BvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866109; x=1795470909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8vq/8+11uEzF73ROpgv5xIjXzTVcQX1lcqgJ4otboU=;
        b=fATehc41sBqVpNEOd57SdOFjIHkJEP3LwalKBbzF209wGzPua1gcMmOE9aZhB7Rlep
         I0Ux6X5YU67s8HKYSEDJBP2KhVXxZtl8J4HGVZZbRO1k/iU6/uvs53aSzHFxUQEx7vv2
         VN2FNk8U/wT+80+SuKkAZYrvdbs2H1weh0LByY0vWp3OYvtjE10YBYkIFz34QD1rUHE1
         eJ+OzSTC2Un4PvQ6u1YwP+oo9eFeNTqddDdRddZWi4Mwox5S85Slc6Yt/iYn7Vpyzlvl
         S+bIlNhLzV0pQlce8NbNpBDHGNX9CXjYU6O6iox4utFWJjioGO6sP7c/NQR1LsQc8jMT
         dt8Q==
X-Forwarded-Encrypted: i=1; AL+hErFtLWQCZYGkWadABakVEN1HGu3YqgB0i3Ca6xZ/mHnUVU51lccYqQeed5LijHC6z4xwQK2HWpF2xw77TVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dcaIoYks8DrL5ICE/qUZZzf1G3bVhDF1qpBXH1kchm8Tomf+q
	ye9A5kTYAdYOfT3Wug16JQd+DKeY6+tfS2TT1nYCuuY1M51VZjxypd4B
X-Gm-Gg: AYBFou3CxgPe1DOrOeNDOHN+L2QvQeuv/mDkT4pSE4GPI2hTkbTrjnSik+iKwLUClML
	dlbeqI9WIz/0+ymveRFwaFCud/6Vg/KInUMo/+2tnBjTVfHwz+zq1Jcw4x5VB2pwsSiINExucI+
	+d+fjXQf3mhjquqjCNAzpu0f68VZDELwPI6VsaIA/J1EmXlo25s38dJgEX58VxXh209WUOeFwiA
	0+rxCf++bR23LamGpg5Rh5zQ+HQuY6SpGBUTCNi4xPgHerQa63i+AQX9eNA6QKV8pLRdXrnkxrG
	YCkftZi21kwMHSuxkNt1k82bT0MUzpv90qBl9D8XqO+xC8lJIcywjA6VmqLSOjZqhF80j110HVn
	/QRHmX8EXyI73q3NoG5dq+mfK0gcSdrUhH1MyL/SO8Is/7jrWeVuopFsZMytbHBJklUjJNOy1II
	sul4I6bdFZhAmJCMNUXwR+dY8lNq/9BDgR5ltkhjGuVuos5Z2m9+oYaf1aLohoQUSrhRFoOjvzt
	o9EHL8m7UBzzj8GbOfo5pJA3cRZjzqXs79ZvtBtOIcwf/FH6BgELJRlkdrEQzVEHJkDffrO3I76
	LgvP+0j47pFyvi9qdsxxF4LV
X-Received: by 2002:a05:600c:1f96:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4bb55a4eb97mr252720535e9.12.1794866109317;
        Mon, 16 Nov 2026 13:55:09 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm17391425e9.0.2026.11.16.13.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:55:08 -0800 (PST)
Message-ID: <08c0c631-64d6-4703-adbc-88fa1dfbe3c5@gmail.com>
Date: Mon, 16 Nov 2026 22:55:07 +0100
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
Subject: Re: [PATCH v2] Documentation/userfaultfd: document RWP behavior when
 the PTE is dropped
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20261116101004.15322-1-azpijr@gmail.com>
 <avsu-yTSPKtZn_Ez@shutemov.name>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <avsu-yTSPKtZn_Ez@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 5:28 PM, Kiryl Shutsemau (Meta) wrote:
> On Mon, Nov 16, 2026 at 11:09:56AM +0100, Jose A. Perez de Azpillaga wrote:
>> +The registration is fixed, but the tracking mode is not: a context that
>> +switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below does,
>> +needs the sync registration. This has a cost in async mode, because minor
>> +faults are always synchronous: an access that takes a minor fault blocks
>> +until the handler resolves it, even while RWP faults are resolved by the
>> +kernel.
> 
> Nitpick, and my fault: I said in v1 that the registration is fixed. It
> is not. UFFDIO_REGISTER on an already registered range with the same
> context can add or drop MISSING and MINOR; only dropping WP or RWP needs
> an unregister first. So the cost in async mode is optional: the VMM can
> add MINOR before it switches to sync and drop it after it switches back.
> 
> Maybe something like:
> 
>   The registration does not follow the tracking mode: a context that
>   switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below
>   does, needs ``UFFDIO_REGISTER_MODE_MINOR`` while it is in sync mode.
>   Minor faults are always synchronous, so keeping it registered makes
>   them block in async mode as well. Re-registering the range to add
>   ``UFFDIO_REGISTER_MODE_MINOR`` before switching to sync, and to drop
>   it after switching back, avoids that.
> 
> The example can stay as it is.
> 
> Otherwise:
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 

thanks :)

will change that. anyway, I'll give some time for the others in case
they want to share something ;)

-- 
cheers,
jose a. p-a
