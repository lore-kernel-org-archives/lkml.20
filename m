Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779427;
	b=3yp0Wh+2+x3Sf4NmbKtqCJoqtgWjmxdhAYdlrHbwGNZ9KboIFs9sDQd2Are2a3QMbxir
	 EHzM4go9EaC+HRrWYfklQl5oloCeC34y0ZYcAvBQC6pZsuuLQDNsdzgE2sR6D9OiQbYrL
	 +OK+MsKmQEG27rdsDgk4aSq3Iu/Go/c27jb/i/FdGfFEKC8COSQ0K9J1EbXmY2ya/5TNr
	 gljoov/+AUo7TkxcNBTB+N6B0zXFZ+cz9OAk+gm0ytThnGzHGI6w7fYLKNYVW/dp4nvWK
	 jmoPNuJ5/3SsysLLQGHtcqnKB9qC+YFas1JPOlWfH1lCByZSbBhQKh7B1gicy00hwoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779427;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1THp/OIN/zpNWmU48vsr3ZYeiyjQo4uPof3S/m8ebdU=;
	b=D3RHYieFcY3HKTEIlZmL3Q7t5c9ROmLajoEp43iyw29xtLpeRNTguVopnZJfmHLaTTEy
	 XTle8/dkYSIIj3ukF+AyC2enmqQfB/SS9xe+g9rptHV9PELC1PP74pYaq7bsEKuM+8chf
	 7njledMxEWyQ7Ayzavj8T4+xUjC/uC7VkYpGxgWf2CMmpp7VezDjbql21gnz6S3h2eVj3
	 T/wCc7H5KEqLYQs9GUN65QVg/CaK9hFXjacPhxGSqv10pFvZbWrzm/y4yiv97WcgE4N6q
	 ukxKBxliV/pD/ohgjYe1Ge97uC9AZ21lugaO9sqKFX5QFtm7Sa58D2SZY8i33YZ1SsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIby+CaR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C84606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIby+CaR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792779425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1THp/OIN/zpNWmU48vsr3ZYeiyjQo4uPof3S/m8ebdU=;
	b=jIby+CaR3UMtb/OEnH6jXRLP0aZnNBPbRIRTaHlOfrLsOySy/xOdhBR6n95p1biDSI7ENU
	d/f8Abiv2CRaf0K19HJop2Me2XyhlTG24L7SS3wAl+vxH/XrtfiYm++UFzhudOBGaNr896
	x2bE9kSAiBRNhG1BS+AKMNUfrxdcS2U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-sitUJ21aOGaMSOAyOnD7Uw-1; Fri, 23 Oct 2026 14:16:58 -0400
X-MC-Unique: sitUJ21aOGaMSOAyOnD7Uw-1
X-Mimecast-MFC-AGG-ID: sitUJ21aOGaMSOAyOnD7Uw_1792779417
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so15927985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779417; x=1793384217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1THp/OIN/zpNWmU48vsr3ZYeiyjQo4uPof3S/m8ebdU=;
        b=qvpsYX9MhVVAfAKZmYKJttJlCQHsX0F73Xa35r5HOG4vvtctQMs2bC1aKFeHgXXP4Q
         qurnxVUj50tV7u0+HzNgIsIcgi5GdXLFFvOniUhpHmstEz3RHyHsoUi0XtEO2zvF4yUR
         dLF2TzoNNgj3iPGl52uKWM4Cb8PaGalcJ9nyRcH5piBAUSAHypTNrWAXwHm83xZDm7bJ
         dQPi+VyfJwr1e/PbPfWK9ijFJf7CvphhbAbGx/qEU9fPLu+M+IQtG3Yc4gu2R7zXjyBY
         +MtxzH2xViHUfOTuUG2jJJgEycKCiM8WatNRA1m/esPi4Zt0aUr/InPfDwJgQdueOfBo
         xS5Q==
X-Forwarded-Encrypted: i=1; AKwUvByBZQn53eLAETOWmWiewzAw00G6fYq38Vrr35s+rTUSUkecwragMw2g40vxYwhwNBxieojXHH3+UkyS1GM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+d/YlSeB61941YjzM/matLA0MhNgmrE7g8AIwzr7zAqi5osCg
	JEczZXhOcdsocDn+dj1JqYO0xmLQlyjLIaOCpLrnxDHwf38hBO//+PaoLIGltcIgHrpUrGHKLrZ
	9lY+yexcW+Yavu02rbNKj+9BrNu9DyRTxQYZxDr/8WmLAEaAm0h1tPeJ8QbVP/vzY0g==
X-Gm-Gg: AYBFou0CFR1l5EG88ZaceKfb/lBPYtwLbHUByAwqXdCcAMeX/frNRidlw+4Y7RTlMHK
	6gUhGcjHVKnTe7VzXyfVFLwVZyGhNoCe0uTLSueMjmYjxROQ80OKEsuu05ykTttQgEKPVwz9ZYH
	EGbJCbLQDgGrvF/mBGktoo6M9KiI8ebqMtW2EmsJRaZBqeDzc8KepSwhKOzdwOm8OjE7/HuX7ND
	soNHHZ4lewrqpuOeOpCAxBkVN2D7/cpWPF+zyNBFzPs0SNGF0UmB0hnD2NaPXz5z6+/LqFfFpP6
	9XMpwsmwQJw66uAqk1/r5neKK6ni958zdWVWpSHUqCq/7HLSBVnEfxhEXufbPw0STMToUdARvxZ
	JIvo=
X-Received: by 2002:a05:620a:260d:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f6f91dbe0mr566893285a.28.1792779417400;
        Fri, 23 Oct 2026 11:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:260d:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f6f91dbe0mr566890085a.28.1792779416972;
        Fri, 23 Oct 2026 11:16:56 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b2ab0asm81343485a.31.2026.10.23.11.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 11:16:56 -0700 (PDT)
Message-ID: <f49c5d8f-b83a-4b1f-ba91-07eabd0ed46e@redhat.com>
Date: Fri, 23 Oct 2026 14:16:55 -0400
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
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Jann Horn <jannh@google.com>, David Hildenbrand <david@kernel.org>,
 Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261023023106.515365-1-luizcap@redhat.com>
 <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
 <9544f4ce-f5d1-498b-91ed-906b37122e31@redhat.com>
 <attZIKD7GfoNeqbg@pedro-suse.tail5790ac.ts.net>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <attZIKD7GfoNeqbg@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/26 9:00 AM, Pedro Falcato wrote:
> On Fri, Oct 23, 2026 at 08:13:56AM -0400, Luiz Capitulino wrote:
>>
>>
>> On 10/23/26 3:16 AM, Vlastimil Babka (SUSE) wrote:
>>> On 10/23/26 04:31, Luiz Capitulino wrote:
>>>> Growing a VM_MIXEDMAP VMA with mremap(), with or without MREMAP_MAYMOVE, fails
>>>> with -ENOMEM when the address range after the VMA is free.
>>>>
>>>> This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
>>>> after mremap resize"). This commit changed mremap() to use vma_merge() instead
>>>> of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
>>>> a VMA that has any of the VM_SPECIAL flags set.
>>>
>>> Hi,
>>>
>>> 6.1 was a rather long time ago. How was it discovered just now? I.e. what
>>> use case broke by the change and prompted creating the reproducer?
>>
>> The use-case that broke was an application running on an older kernel
>> and accessing a GPFS volume/FS. I was told that GPFS sets VM_MIXEDMAP on
> 
> So the application is growing a file VMA with mremap?

To be honest, I don't know because I don't have access to the
application/production environment that reproduced this. I got a
detailed report with debugging information that allowed me to identify
the regression.

I can try to get this information if it's important for what you're
proposing below.

>> a VMA because it inserts pages in the process address space with
>> vm_insert_page(). I then asked an LLM to check if there was anything in
> 
> FWIW this is really odd for a filesystem to do. I see we have two filesystems
> upstream (at least in 7.3) that do this; that is, cramfs and FUSE DAX. This is
> arguably weird and should be fixed. Perhaps the VM side isn't giving
> filesystems the right flag here.
> 

