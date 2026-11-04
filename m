Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801131;
	b=bkXrjVWoOcMnNFYLAhfTh5ma4jdfLeYi4w13AUG3c8LM61R4dIDEwFBz5DGhY2EE7lkc
	 I1UgfFlErgTAcz/Pp6cYZthPwdAwETpLtVrXaeZul1i5eAAUJ0r3dlUmIT8Q26u2EHCdR
	 zHgTheTUWApZJ91amRzzq9WUiTQ75yiZI40BfJLPzMiZd4TOLMsIK1qUMaAtJyj5Ieqnw
	 TcRd3BId62YPIUlWn7YB4B6lQEeKivb82rflFKboMo78xPoont+ooS+I4iS0BXvMNqbcW
	 B5XThjAVu6FJnipaoMdUDlxY/VvHInP4+RiED37ho1vEoGWCySdQ5miZiCs1nQkCkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801131;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Up1WvFcZa4ISjsaDjGoGZlp4zlpSSU3LCupRRG9iwRA=;
	b=48+m2A0hctdS5bRBoWe9aOA1ZNn2pUUDQjMjujC+PGSklmU2xIxwkDGcZENVIT4e8Evp
	 SZyWWex4OmUTGdxDh6PXg8pIwRJqdhc/TUqvZNJl5sgqP82AR1GZXIibFOZm+JQrp4bft
	 5hmtn0Rl+nYcXBgVnmPNIFXk5IeGW6n+PNzGfDonSNo7pOVgtdlKtVV/zgtVM+43wTxY6
	 ZKQRVBweBt/3EkQvVY73l8fjtYasZzof/T4LuUrw+UmFF0TWpMb1w2vHERms9xZo02tVB
	 ok4MphUUJpz4EMfk+gh25hRrV4iua3V3UsQwmOLUlCKSpGhNv0zZkioIvCGrg7cNpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLPjdDQI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0644606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLPjdDQI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C5D1F000C1;
	Wed,  4 Nov 2026 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801130;
	bh=Up1WvFcZa4ISjsaDjGoGZlp4zlpSSU3LCupRRG9iwRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JLPjdDQIMP4n+xCwg8tYUf6LJu+yGSNfFU3RtCKaQrwqfjC3syhfDl6P50iV00Ndf
	 FOQdlXNhVNsCRDBOxOyzrWW6Vm72Aq6/vsGy6PdSc0z+miRbW/XwFYFvKOBc8IyKlx
	 eBsBX1m62nfaXFSKfhtNpUI7r8XOMAnqvnwC6q23D3uHVezhK0eNUUJNTUfe9Pnkr2
	 FgWbUbft5zCMl2mTUJv+N1UWA4pFtr1knkj8OfcvRBtlduARQWF5KQWIPsvVKX9Em5
	 tEzpk79b0T/5x3co0qDplfPOQeqySduGLvCE0mRQI0SJYxhuNWr5J64an5a2NdrwVM
	 W52ygJCeRuGRw==
Message-ID: <05ecbb76-3496-4985-ac3c-af2185de6f0d@kernel.org>
Date: Wed, 4 Nov 2026 15:05:23 +0100
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
Subject: Re: [PATCH] shmem: skip empty unmap ranges when punching holes
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261027171753.1485-1-dennylin0707@gmail.com>
 <1bf7784c-49ee-4f18-b1fb-205dc064f40f@kernel.org>
 <CAGEkeHcwUEQ0tAXZ5npAhPp1OPMqkmZcNPTU1OnRuNTrwkDJMQ@mail.gmail.com>
 <675cfc9a-48ab-446d-9fd0-a1937dfeb0f4@kernel.org>
 <CAGEkeHey0fjkgqbrxyW=9JNX1KuD+OWzzEUwi-37ehD+07SR=w@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAGEkeHey0fjkgqbrxyW=9JNX1KuD+OWzzEUwi-37ehD+07SR=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 21:00, Hungyu Lin wrote:
>> To be clear, I was asking whether we could do
>>
>>         if ((u64)(unmap_end) >= (u64)unmap_start)
> 
> Sorry, I misunderstood your suggestion.
> 
> With offset = 0 and len = 1, unmap_end is -1 and unmap_start is 0.
> Casting -1 to u64 makes this comparison true, so it still passes
> a zero length to unmap_mapping_range(), meaning unmap to EOF.

loff_t unmap_end = round_down(offset + len, PAGE_SIZE) - 1;

Yes, that will give us -1. with offset+len == 1.

Makes sense, although it all looks more confusing than it should be :)

I'm fine with the fix, but I do wonder whether we could make unmap_end an
exclusive end instead of an inclusive end ... something for the future.

-- 
Cheers,

David
