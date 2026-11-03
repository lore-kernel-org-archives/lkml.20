Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699065;
	b=a7CvtDVfTDGC5bwYuZAR1knsdW/eaLSjTnjSEYo8dicXHeIHs3nYalZoGvWV8Gw0UWRo
	 BlxwBRjX4zWxuMgj9Y0070fnDRexdGquF4LrvqL0wtDZh99TgWo9EUsRJbI8GN3YL7YHL
	 LEV6AkeBNk9AT4JaLR1nWmHsFZnumm1VZrfF3RiBXoxKVfqcLlf6ANIpW1QFbd/03RhUM
	 hs8BcYzxflPd00FFDYhPJ8gx3CIyKzWK5Q1lVVXgOJUDR2+dP0k1PCdjTmoupjCnYwrpx
	 2MU6NVWBa4APr6e3vAPY3O8prBl4+9Extn2EgnSfSUJxHc5WmaJNJwfvPCgc+cUf60g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699065;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SYguy4w1YM/41pc0M9vIj3VvmIP455ki3qTLrxyk+EI=;
	b=pkaRr8ToO2Hk3T9IPCj7TYck4DoTq83aGfkttFXHKIFMNyMgcEuKwr91HnHMHwoLOJGO
	 aluIC66QSR7Kp7kv2eJA5VUtkXR3784othy2HonxqWpByarz6luIhpyRjJemnfVj7mx4l
	 6tcJ6Cp/wA5A7zs4yiBFW0jmCn+6RxqSEMdY37gm7Kba4P9Tln+SRoaIQIRBBP1oTj+3/
	 Z459bFKqxbdSs8+UDQ+20x6mja9eqJ3mM5fVXwlK+7LNgU71E4q+G4Icyhee0w/TU2ehA
	 lv9riNuTZ+Zea1EXvMCYAUGzBEdGfNM5exbG3MtUGcU34puN3+5XBzm8bTVMQEjj1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="BmFNg/1V";
	arc=none smtp.remote-ip=95.215.58.148
Received: from mta1.migadu.com (out-148.mta1.migadu.com [95.215.58.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FC606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65FC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BmFNg/1V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ytP1FYc4mLUgzvNlPS6MBB0Sb8vEqTbsbrXFac19CKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793699062; v=1; x=1794303862;
 b=BmFNg/1Vfge10nj+Wh9lYq5C/9PkGB0qDq3YYr5sdNjpljWdlY0j4DwQnMwLfGmieJ6B0lBF
 S9F4e0aUUhu7IXV0Yx3QB8prhHsAeDzOfbMJuaR1DyOOLEHw9NP0+3XnPM1+jI+tg/nZYtoehJ6
 DECA8Fa37anyRzIw/yYdBGdE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4fced7d92f6bec66;
	Tue, 03 Nov 2026 09:44:21 +0000
X-Mizu-Trace-ID: 4fced7d92f6bec66
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 17:44:13 +0800
From: Hao Li <hao.li@linux.dev>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/slub: Genericize x86-specific cmpxchg16b comment
Message-ID: <aumssHCOA4D_BFm1@fedora>
References: <20261102082730.12430-1-yangtiezhu@loongson.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102082730.12430-1-yangtiezhu@loongson.cn>

On Mon, Nov 02, 2026 at 04:27:30PM +0800, Tiezhu Yang wrote:
> The kmalloc_nolock() infrastructure relies on slab caches with double-word
> atomic cmpxchg capabilities (__CMPXCHG_DOUBLE). The current inline comment
> in __kmalloc_nolock_noprof() uses 'cmpxchg16b' as the prerequisite hardware
> capability.
> 
> However, "cmpxchg16b" is an x86-specific instruction mnemonic (CX16). On
> modern architectures supported by the Linux kernel, this 128-bit atomic
> primitive is satisfied by different hardware implementations:
>   - arm64: satisfies it via LSE atomics ('casp' instruction)
>   - s390: satisfies it via native 'cdsg' instruction
>   - riscv: satisfies it via ZACAS extension ('amocas.q' instruction)
>   - loongarch: satisfies it via SCQ extension (using an 'll.d'/'sc.q' loop)
> 
> Update the comment to refer to "128-bit atomic cmpxchg" to accurately
> describe the cross-platform hardware invariant needed by the lockless
> allocator, and to avoid misleading developers of non-x86 archs.

Personally, I feel the commit message is a bit lengthy for a simple
comment-only patch. It might be better to keep it concise and just directly
state the purpose of the change.

-- 
Thanks,
Hao
