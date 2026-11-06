Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964970;
	b=1F7Bc7LY2kWl9eKxLrEzndI27q/hvbgRmpqMAxuRZHjh9nkDKpt+qf7TiM/CxSICwuqT
	 0bJlsxyfRC2ME3dCoRnORPmBsny09CpP59KpdPJ2kULoIIGaEIfsKJitr6BdXlzAf9aP9
	 XyqzRljS97bFW7Wj5qd1uKgEDgZB4MOaN6cUaP4zGs5e8MW4i3OK9IwQlVvRw/p5phpKn
	 Kdg/+Wb3RyH7uZE2PtJLcdpYfi7Ami96Brb5RzjetnNb//T/l0SHtoIDBhWHse+kCACXt
	 9DWLWEiwPE+nGtfQlw83o2EA/rNyW3J0HOY1bM8l7sqaCAIt8J5rNVITAj3SweNcIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R1fgwrt/J2JYxCxSGOKH3dANX3eXUBpSh/LEwH4Q6no=;
	b=3frtKKef7SFPGfqDXxD01Xfu4l6U5Bo5vT2S+DSb/LJR+HU0jFLsrMO7FWjeXeSyCCFo
	 Jpd8M5SlVMieKnqzy3nNYsD/2Ki+Jxf3Dro52juycDR8MIb7q+5xO0OXsnQfw0WgEzrd/
	 0/J/I5HDfTmla3ERLKx+7JOoBU25oDgqHwAUPo4S7j2mLLU+YVFpYD1qz/MlZqpG0Am4D
	 4EFkJPjM8NCqproERfR0O5ooCEz9VFnTwKE6UOl70XpiExZ3SFYOrB23WlrR7ifBmwchD
	 4Chld7mPgHtVfCydVOGxDklNLiSR/rtJmME7v37K09iSvx/nY7ebXOP9sEcYp+9FJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXeWgUVX;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10560A260F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A10560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXeWgUVX
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so627047a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964969; x=1794569769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1fgwrt/J2JYxCxSGOKH3dANX3eXUBpSh/LEwH4Q6no=;
        b=vXeWgUVXCX1z83xkLBImjwxeEZ+/oy0hXtB4qBbyT7TOupGYjBIgrWZf3XE7Ew8xnS
         LTWciAqFhcO0hL+ROYEyXVlla17tgmlwpzOpKEOnTsN82RRR9scxap6V2dq/wbNh6Nas
         HXKHUavdKTnwj4OSUMGUtUDCa2qlIl2WfVZCG3QuL2ou2l9hBwXqnofxflCKqnEpBwCs
         +V4Huv+kLbW2cNzr1wl+hSlV9oLoXFhhEdeyInEfnXlttSY9k1ioMOQNOAdm7AFZn5IE
         Z1zZeCB30LRA+q90OOBgYtNBSW1Ahzgl55PNW064pKRsiwm87kBbvoU5PlRx5AZc53Tu
         Z9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964969; x=1794569769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1fgwrt/J2JYxCxSGOKH3dANX3eXUBpSh/LEwH4Q6no=;
        b=tQREgTroATElTRo4J4V55sgcbY6CAifI5+dOofYhThbCDw7vQ0Wj7Kvx3fyINy2KiQ
         FB8ssXeTbZEmejbnVhAbYS78KBm4lKXh1LzKFrkpZxQsXQG70PaUB9/pqSFzsXw8fF9N
         BJHK3ruvlRZSZE6OxyobzzsZGAR9AayiWJtn39XsEeqpJS5zSNgES2Ui9JwHCo+7YW2i
         H5XWL+2c3Cw3Ylj9MgBVz3yiAvRcGn+/ODFIEf1ZiQTIKptnJ8rgpn4agC1pRWdPOUC/
         GJlOrvSv8k7b1C5C5xMmPDkXi6NcMkit77nXlzzsq+GOl79QICAd55uTgo0e2NWVZQvA
         SHcw==
X-Forwarded-Encrypted: i=1; AKwUvByV7IH0vBhciTZAWqhYZ12lHKXN773d71kIzNmtkmyPm7k3vzLYPnvcyBjE1/NnuXWQBSJfGptZoLJi4Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+skrhSpnEuYnYjVQwwIrgkUeJXBgdvW+avHjyyiHpjYrP7vvw5
	qwz9UDvOmWrQJRLPUgJOWR5JcQ/R+jPy/YU8MM1j+8QLQKfTU6udbB3E
X-Gm-Gg: AYBFou0xjFWFvXkH7kNeF/UXBz4hnsz73ZS04gfiCd4g3UxUHuDb4qnf/AHldYeokub
	PxwI3YHQ9SU9g/2qPu0YE7TInJwPeqGQCG5xX+a34K4jhNrUsCcyzhVI8zXVZrqSRtmU7y837xF
	3QcnaADpI5tbdWuSo6DsdErtP8u3zBxup150WWIlGHVMRAC8GMRsuIGlHe+djhQNV4amZVA5cYU
	KQPKJ03qk3Dkj/nPUuelzyafMMf4VTJy/+pz9sh03PPiANSm8dHGp+cNKyVBVzTX9yKPhroAQHJ
	+xvnjaG0p+M3Seeui97LNIWvXl9s+NJdHztCoZAyTvajDFsg7PNFxMTL7V/sifHdYCyDIdlcARN
	rV8fSobSnFGoCmei1xIRSVWNWQNQNwsmpepjSGvYcDkYnoFSpRhfI7NSYXOtqx7Pv/WFJeqRWSP
	CNujuQxsMJST4sKESRkmtZ1gruuBGzhsA8Wmc7hISnPYuHi26UTJ2/R5RxfezZ7Qvb0R3ivzzh4
	+Wopg2WoVVJL4kLI7lgZ0TP3phbiJDDobqNQG4N0KuGyCYCwoOlldMiuDcr54R/lK6d0gj16RK8
	mxoUVGCnWSmjuniWoAPdEqNlxxCmSta650sDtO2gE0nHQvTNVo5ifKTIZxOkRMe7oJNF2GUY6rd
	e1HXRycTtlPr8UblLC5g/eK0AOB6XOsTsoFnucTieysPJJndLLyyAYneVfvCyThPGi1ZmSP0LM3
	/GkXLHcNMrCJyM0/RV9gBZyv++Gv2fhb33BLslNb+W5sW2Qtr++LCbh0E7lV4CmbM=
X-Received: by 2002:a05:6402:2b91:b0:6b4:602d:f1f7 with SMTP id 4fb4d7f45d1cf-6b597816109mr1452325a12.20.1793964968944;
        Fri, 06 Nov 2026 03:36:08 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ae5692sm615592a12.17.2026.11.06.03.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:36:08 -0800 (PST)
Message-ID: <4284c2d3-75cb-4e41-aa45-f7311e60ab4a@gmail.com>
Date: Fri, 6 Nov 2026 12:36:05 +0100
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
Subject: Re: [PATCH v2] mm/filemap: stop fault-around when the walk steps back
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>,
 Pedro Falcato <pfalcato@suse.de>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-jf-mm-filemap-map-pages-lower-bound-v2-1-21029744e589@linux.dev>
 <aunPI5eOUOAEUa8d@pedro-suse.tail5790ac.ts.net>
 <20261104-jf-filemap-v2-pedro-reply-r2-74c87c6fbcf@linux.dev>
 <auxvLCiljPhy0n_q@pedro-suse.tail5790ac.ts.net> <au0GBdGqu6cv5PMy@linux.dev>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <au0GBdGqu6cv5PMy@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 23:43, Jose Fernandez (Anthropic) wrote:
> On Thu, 5 Nov 2026 12:19:13 +0000, Pedro Falcato wrote:
>> Thank you. So, if I'm not mistaken, this is the race:
>> First, you map/see this:
>> 	[folio pgoff 4, length 4]
>> Then, at some point in time, someone punches the hole:
>> 	[no folios here]
>> Then, at some point in time, someone faults another folio in the range:
>> 	[folio pgoff 0, length 8]
>> so you step backwards. Is this correct? Or am I misunderstanding this?
> 
> Not quite. In my test a large folio goes away and a small one comes back
> below where the walk started. If that happens during the walk's first
> lookup, the walk can step back. Krystian's fix doesn't cover that
> lookup.
> 
Right. My patch only covers the case where the walk has already
returned an entry. The first lookup, and every lookup after xas_retry(),
starts in the XAS_RESTART branch. My patch does not change that branch.

There, xas_load() can read the sibling slot of the start index before
a concurrent erase, and the canonical slot after it. In that case it
returns NULL, but xa_offset still points to the canonical slot.
xas_find() then moves on to the slot after the canonical slot. That
slot can be below the start index.

I tested this in the userspace XArray harness. I wrote that state into
a node and called xas_find() from XAS_RESTART. It returned an index
below the start, with and without my patch.

Andrew, Jose's Tested-by for the xarray patch is on the filemap patch
in mm-hotfixes-unstable.
-- 
Krystian Kaniewski
