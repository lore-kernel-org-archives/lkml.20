Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC384A4416
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438653; cv=none; b=emyFTWERhbAUqzlMrhh+qikvgkNX+2XnR40lAaMT8zA357NaXllVHSHrN37h3lbf0iE9O9EmyPloXD/sGH+Zh2uDMYmE9eIS85QpFstgjtumOTPC87DXrI9mHegIGV74/yTjv9xbtEeLDGpjoQAMb7sicQXpomvepQ8pgZrO+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438653; c=relaxed/simple;
	bh=gar+pyWL6Mih7nPkrX2CIAkXl8yBYZCdLy9F0hxvmNI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dKu8e/7WBGoqpXGp9zCcZaMa5xdY0iHHQCKT8R0rp6Ml8lGniDaaK/DOg9wEAZYQ0XMCPtY/NpRn8J7oBewdqKQnynE3ij+YH0rz6vMJS3COC2uY2Gmn8R5hEibQq6SPP3C9Ej9avK6qzKT1nDQwiSZNrujlYsktmxnF5p1lxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsWpYWcb; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsWpYWcb"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2569aa5116so153662066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788438650; x=1789043450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=444nNZztaKWrtZLx1q7kQKh1w+9LbHm/QlTHTnrzmNI=;
        b=nsWpYWcbwvv+IouFv/pZrPZX6QSkBOMALtco0Rbs229YpL9djbbNQk1neAGyqtvX6/
         uQflPbgAJhb52a3WB2e7LmeX4zoRXx9EBcJLIjmoUpAXw056VoAC4C9bVth9LYkyoLat
         S5QRqIEBrkgWNfcBWHzeN/TM+1JPBKd51Ot4LuPShOZWf3rNZRs6T9tO7RGXdonz9zF2
         9PdDkIg7iwJLXzfEnSTN0+OJ+GXUQ7aesemedElbX396L0dqyMj0wCRwVDWd9tKrbdwu
         ODPD3VP2YFgeA+D2ruxwhqwFiBqB8sud+DJ7ptmcGOzvWWWa8FcefAljNshdASh+VtPd
         E+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438650; x=1789043450;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=444nNZztaKWrtZLx1q7kQKh1w+9LbHm/QlTHTnrzmNI=;
        b=COIINuFRdypIa98pyL7+ejWMxHZOIMTKhbOq5dhqxNTKGVdmp6zwXkYBOmqgUEG9Co
         lSNK+PK6v4ma8qucxQ98VoPJbqvqLeRPPRQ+lgNycCvCOJlChiS7jHJ/fOcN4QmOegn/
         JP/XbQcOdBgeWfg9xJSYyU0UGYMya8q+IBCTjzDNPDzGHz+2rQ9pRRTmhC9qy1VcDjJq
         p+ncmQc9DgSbSMxuXZByIkOLLGXPFn/zefRsav3D0ZFdFxICqU7iQYaTujAZKQSXy4K9
         wgUVHAPGBe5PEMTsuLcpsGFjwZSmqUuwZ+9hF7AXhc401+Q03tfzi592cKe+Cq2Y9sjT
         jO5A==
X-Forwarded-Encrypted: i=1; AKwUvBzzZ2wbX6S+F/wInbisSOzgV1CVNFJMzHyRzhOF4qQjog3sly85mv/meTtBtHpJ3ggFoYW8dhxLGTg3i3w=@vger.kernel.org
X-Gm-Message-State: AFuF++n4AaQ0JLncupJPKvDWzz1c6d0lQmB7Ifx4d8KkLdSF0Lnfq8Td
	kCV08W1v/I70I3dDRsNzlyPM+m7VwYNZ2Aagnz4Ux4Ii/dVwqd00pvQC
X-Gm-Gg: AYBFou0NWJ2R68MYpiIbKVrAj1ZNb67QGucbzIXHZGbg2rnmXdq0WDJeyheG1zT/Def
	NHeZdVQWPQsXglYQcCllPc5h2pX+Nb0mZ1WgSwDSOz+SgPQwxzmopJyNpNvdmOwa4ivhGV7Q71M
	8EPDaHpsFZD8eFuF4VoaMCRTihQqRYHFcHse+fs0x9X5Ri71KSVKnVMlwzZrHWvguzLPaiSbgZH
	+fqDktnIU544Qcy5obr8HDitIhZSGke46lCiG4rsfOiwWjbE3S8YZ0i7ZWqedTyW237FMcr76Ac
	ImVXECX1P7HMW5oS1kEmxUZFue7vYUKUmy6YcEuauo+Mm4h3NmvAkVDgRUNOdihJ3ed4xQCnc8y
	NRcS3uWoCXZnPF35BUvCe6gV9omfuLU4Xo/jkikGfVzJOKPDxbXRQVmdWB23xPxGYBYc8p1mL72
	r/VS8s8lebGOGnChb9pVfUDf9todBlZv94sdvYZVhNwkjRDBmVehG+Ge4lnBvpO/rUN8gkBL7kM
	9XgY6X9f0iytu74gb1Cixo=
X-Received: by 2002:a17:907:8323:b0:c25:f7dc:2e0 with SMTP id a640c23a62f3a-c25f7dc0985mr85901366b.33.1788438650154;
        Thu, 03 Sep 2026 05:30:50 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm2265294a12.4.2026.09.03.05.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:30:49 -0700 (PDT)
Message-ID: <1d7f8806-f4a0-fda0-a361-a011460ef308@outbound.gmail.com>
Date: Thu, 3 Sep 2026 14:30:46 +0200
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
To: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
 <apgSCyj-h2xVc2ss@kernel.org>
Content-Language: en-US
In-Reply-To: <apgSCyj-h2xVc2ss@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 14:09, Mike Rapoport wrote:
>> So using vmalloc() may result in a malfunction in the data transport where
>> the __get_free_pages() would have been successful. This outweighs the
>> benefit of a somewhat higher probability of success in allocating very large
>> buffers, and surely the improved aesthetics of the kernel code.
> kmalloc() still works, just like __get_free_pages()
>   

After these few days of discussion, this is what I make of this topic.

The memory allocation in fifo_init() is somewhat ugly, but this driver 
has been out there for five years, and no complaints from users.

The vmalloc() option may be successful sometimes where the current 
allocation will not. On the other hand, there is a possibility that it 
will cause real trouble with page faults. Plus, a large allocation with 
vmalloc() may be a weak spot on a platform to which the kernel is 
partially or poorly ported.

With __get_free_pages(), there is no doubt that usable memory is 
allocated right away, and that it will work that way on every single 
esoteric platform. vmalloc() leaves us with "we're pretty sure there is 
probably no problem".

So I vote against vmalloc().

As for replacing __get_free_pages() with kmalloc(), it's a matter of 
taste. I think that if you're after a buffer that has a power-of-two 
number of pages, __get_free_pages() is the natural choice, and using it 
makes it easier for the reader to understand what you're doing. 
Replacing it with a kmalloc() is confusing in my opinion, and requires 
that the reader is aware that kmalloc() falls back to __get_free_pages() 
in this case. So we actually want __get_free_pages(), but call kmalloc() 
instead and let it fall back to __get_free_pages() so we don't have a 
cast and don't need to save the order, and assume that everyone knows 
that this is equivalent.

So I vote against the kmalloc() thing as well.

If this patch is part of a larger kernel cleanup, I suppose my votes 
don't count for much. But for the record, this is my opinion.

Thanks and regards,
    Eli
