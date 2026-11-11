Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385008;
	b=4/UhsR5My3ArQyZcG9kIaMMzuc8+IyGcbTna2bAhg+I7WhI/cyt2Amwone09ZwnZVMZB
	 14FdfA8V0tJeeXnzsz9vv1HvR0JsHQqzK9t25jGd1p0BTcUoag1WLhO+D3SSmRe2da80m
	 N4gnQ2kyQBGOD3LZZu1yuYXgQSuUihAMcpg53W1oY3nNMCCeR7noWg4av2ArueZxu0I80
	 d/jT9ZlLXFFs4vxY3nQqWh+2JTEOLBtc0Qc7V/XlILnY4BfmkkPtJUAfMvIZv0mrycEe7
	 6sc8auuyQk3iqhOoxCV7GeOYfij2Mfi7V//a9qsPhzw5Oolr2wBqdfpNgTvFkyHvJJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qOHVTuC5hHIVI7UZZ0LVQbOrU8lnvBC2EJDORqtQwNI=;
	b=SZmCuNalhEfzrmhxiStpwKNtOODR7qMY8Ay8TiSKJ7WZNNhkmp64tgxO32NExijoXhqF
	 IYvL+d9c6U42DQX5tx6GsTrXy8Sq94lRECHdOm7oioweZpncW6O8XFY7yBdszTWF3yKU3
	 trCjCpzb+hXKIEFBoAW3uT1TzFj9zm3DGY8DCAPWgafSK6ZzOIXugaqaeUSP8u4EQHUSN
	 g4qNeY9nlBGN76AsSzrlmj/TM9rJufxSXdJ48PW9UUjE0dHxxNVg8hOIy5b29fO/wMYgP
	 VUEcpkK/dcAwyjcACeiRrLZMX/3U5lmH8V/WsDkVPf4fl+RtIB3qd08zVy2ohWQNo1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VKcfi9ah;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB4606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DB4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VKcfi9ah
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1832114a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794385008; x=1794989808; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qOHVTuC5hHIVI7UZZ0LVQbOrU8lnvBC2EJDORqtQwNI=;
        b=VKcfi9ah0kr6Kj+OVTtVuQzfE4COHIIRcE5T242BZCy+/rc/U2WH8Ko5S0o0Vxg/t7
         UdZKPQLjRCu+4pUpn+x0Oa/o/E3Ptho5jNRlLpcjOFyx12BY4Ss3yiD9zIfIM8ujNGt6
         zgS6idjvWrIwOkQP3WGHRpaykqdUMkYes2Lj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385008; x=1794989808;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOHVTuC5hHIVI7UZZ0LVQbOrU8lnvBC2EJDORqtQwNI=;
        b=oBR4FTpnrMDtCIcXF01odsegidHMskP2A28MYdo8luR/qG+fbaevP7r3hgaUDC4d3l
         h9QMEGFSrQEx8T8c/ts37ENMklG2Rddckx0oKGTRygq+Jdf5j7S9h1XFRZrZbrGenNEG
         Hvw+tsgBhGVoOjVq4EPJxYd9EXtTlgp8Y1HwOoxKZwc3EWHqKDDdFUn7/ud3qVn3UQRc
         QYQh4fojDgnRaFmT4zpmznE8w/Rd2M7Aucok+eb6rdlNPKcyp/afjC6cxTLSokWR7mnj
         oS+NagTCxkzXG/RihmDhSVXq0cnpNGfzJGLIq+UzqSlLiSGlT4A2Z5M3rE3wN7jNk88A
         krMg==
X-Forwarded-Encrypted: i=1; AL+hErG49mYgCt6Fpg6cEm2Lq3OQ5J9jFGfHvuLzO3tijjJTwrsfms5nv8mju4SkYyqLuWa0rF+RN1vtH8k7S+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IlKFkJP1DkHkdOci1i2q356FcMR5wAXofMbB5x21YVs8wY3A3
	XBmku10T1Qm3wqYn6QT1vB8wqVeaTo+ss9WJwS38fKhOhlrFs6a4qQ9txAfqdyco/by8sjeZR/I
	qqcbQr1RnOxwxdEg=
X-Gm-Gg: AYBFou2LFFIuEeHccb971z6l5phqoflnTR9QalatymRpgKS7H7oVmJRJJ8kSLq1DVX4
	Vc2N4cOvCkJrD4qvgzpLW6RNGl7ZVq0gYdl/Qa10ZqvRB0GPSJXgjMDEOF6iyIO8NiGUAnSnz+X
	yElSqilvioKGnMICdVc6jlY5e7DNrHfbRPsVp+oohzxc1NTtILUB4u2G+XMwNcyUQcOkZ/JpPcf
	9v5OdxJSYvcKm+C6AdZYikRpDJRPdd6lBCqAi9i8afrTb+Az0xNzlJaiywf6s/6rq02l0WjcNQ+
	31IRtL+w7pPHgc0UoLoP/SXVZvXz9yR8luX/7NJn4EYYNv5ghATWWqEhRrmClRGvjP0FL6J79Ru
	T1aYmBFjTEtdnvqT0FPyO3GDSMHaov+0x1Gm1NwEn8vuEalkDXKOEaRHkdd+8IftNcIyWnEoxXJ
	BrBE425mFxo8H4Ecfob5tFoV6WYwK6LuhtB2HefsnCxBxLsQV4u8PaGd5vrw5VQs3HJ0QAJkYuQ
	3ifFK+R/QpREUF0x9HNT+p5VwTUCBaP2zK1aKhfBTgNZYj9BdJRoBlZ5opzxBWpTiucWR/H/Zgk
	JLVhSQBhfyO6gVmxHZjNl6Aynr55Qa/ep7coFGqmNhjjeJjlVS9QAivSApJj/jZejYh7eRIIQqt
	Wgk5Fv2NxP5KllyodL4wPMa71uEZz8ouSSe6JpG1ujxgCRUcxTmWiQx45JQwU1X/CqP9rafgpXK
	WeCQbrqn57+XnTH4b+OZgG025KC4zvuBXnRTtD+Q5g2/7jXUk0f39i
X-Received: by 2002:a17:90b:4985:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3b182f3801cmr1550647a91.67.1794385007677;
        Wed, 11 Nov 2026 00:16:47 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181fc804csm1360430a91.1.2026.11.11.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:16:47 -0800 (PST)
Date: Wed, 11 Nov 2026 00:16:43 -0800
From: Chris Down <chris@chrisdown.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kho: Prevent reuse of preserved pages after a
 reservation failure
Message-ID: <avQka0wY-EdLkspv@chrisdown.name>
References: <avQUquBK6cO6tUUI@chrisdown.name>
 <avQg0_jFY3get3wG@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <avQg0_jFY3get3wG@kernel.org>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Mike,

Mike Rapoport writes:
>On Tue, Nov 10, 2026 at 11:09:30PM -0800, Chris Down wrote:
>> kho_preserved_memory_reserve() reserves each range of preserved memory
>> in memblock and marks it noinit, but ignores both return values. Either
>> can fail when memblock has to grow its reserved array and can't find
>> room, which at this point in boot it may only take from KHO bootmem.
>
>Is it an LLM analysis or you seen this happen?

Are those the only two options nowadays! :-) In this case it's just eyeballs.

I happened to notice this while preparing my KHO/LUO observability patchset and 
thought it made sense to send as a separate patch, since it doesn't depend on 
anything there.

It's probably realistically quite unlikely, I would think it would require a 
lot of fragmentation or a very small kho_bootmem=.

>> Dropping the handover at this point isn't safe either. reserve_mem=
>> revives its regions from the handover before mm_core_init(), and
>> relies on this walk to reserve them.
>
>reserve_mem_kho_revive() can memblock_reserve() its memory itself and we
>can carry on, can't we?

Thanks, that's better. I had thought carryong on wasn't possible because 
reserve_mem has already reserved its regions by the time we get to the walk, 
but actually you're right that there's no reason reserve_mem_kho_revive() can't 
just do it itself...

Looking at the code one thing we would likely trip over then is that 
kho_mem_retrieve()'s error path only clears fdt_phys, but not bootmem_phys.  
kho_init() then thinks that it's a cold boot and runs 
init_cma_reserved_pageblock() over the inherited bootmem which has already been 
handed to the buddy allocator, so this would need adjustment first.

So then, let me send v2 with reserve_mem_kho_revive() sorting out its own 
range, and making kho_init() skip the bootmem setup when the bootmem was 
inherited, if that sounds good?

Thanks!

Chris
