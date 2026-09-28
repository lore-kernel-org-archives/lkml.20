Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39D2D3733
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596796; cv=none; b=qqiYYzghonnHV88L0x1v8RYEox2YcdNJiVRiHwzWMHIpKoOqcIasrTg9ynFZyZ8fEXFsQi5pJ9msxjY5++y0tgbKE5bGys5ZvwHz84kltgHjA0KuCUrMUJ+GF/oqpmfm7F4lMaYgpYo6ws2p0mjhSjKZI7wynA/b0/3acFF9OD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596796; c=relaxed/simple;
	bh=ONXWuGJSEhtdkBjLPYaEyIyjxeJJHaxGYoxwqBSS2gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3pBpyMzAU2xjq79lbjZS/nxCsz+1c8PkzR8hL0nbaVItvNgIZIVavcmwXtFVFwppSMfF3VIHLgf4FLP+sFhlJowpRCw4nimOMbCwwlR1EM9Cxh42vbY/wyy7KYndoHpVtHzAdK+qxP57FraYSNMbbP7t5NqYgXNB/oAPjKPlQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF+dytpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF+dytpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A5A1F000FF;
	Mon, 28 Sep 2026 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596794;
	bh=4ubrCI8w3ULvr+Wy09kxqTTxIzrAZwKTgk0GvfF5I+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dF+dytpedS8KF5VBOfaLwmweRWPyyB2yUP/FU4ARxQTSZ4wof0/uc3jPh/GWMyzRP
	 +ygCwX5AHG6drGme6nPQ+Fh6dc7Sv120IAEYYBoQ38X/FVNR5ik5gPBvXQiJtLfUmv
	 iIC784eQhwnZNYNoO6RFtg6HiwaHONlXgjWQYf5rSk0+DVMnxb4N2LFORK8C3KYGM+
	 07PhIU4G+EwdqFZFehWixioe4APhhqEQAjfRZEu9sPx2mpYger/suHTL+UNVb5thRI
	 1LhCH6YrFiDV8i6uGitd/mxWUaPJwbqw9f+pVrhJ33SdqNto7D8NVsDa00mzQHD7Ke
	 Q6c+corn9bKuA==
Message-ID: <f78d2f52-1135-425c-a3e8-460a6e80e19b@kernel.org>
Date: Mon, 28 Sep 2026 13:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <lance.yang@linux.dev>,
 syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
 <9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
 <20260924195826.70a87d6fb78d754bc73892cd@linux-foundation.org>
 <95e91b4a-ca16-49a3-9a1a-5b38afa6f08d@kernel.org> <arYnXJHW-Rh4eNzt@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <arYnXJHW-Rh4eNzt@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> It then becomes a question about how to get readonly memory.
> 
>>
>> We can
>>
>> a) Disallow allocating an anon_vma and fail gracefully. So only a shared
>>    zeropage could ever get mapped there. Might break the s390x
>>    mm_forbids_zeropage(). But given that's only used in hypervisors like QEMU,
>>    unlikely.
> 
> Something like:
> 
> 	/* about to maybe prep anon_vma */
> 
> 	if (!vma_cow_mapping(vma) && vma_test(vma, VMA_MAYSHARE_BIT)) {
> 		/* don't prep anon give zero page */
> 	}
> 
> ?

Something like that, but really just failing directly from anon-vma preparation
in a !vma_cow_mapping(vma), maybe using a special error code.

But the less we have to hack around this special case, the better.

> 
> I think though it's surely the only case (I hope!) where you can possibly be
> both anon (as in missing vm_ops) and !CoW? I hope? :)
> 
> So it feels better to fix it at the source.
> 
> OTOH maybe it's worth special-casing so we don't allocate on read.
> 
> But that brings me to c)...
> 
> 
>>
>> b) Do what Lorenzo proposes. This will allocate real memory. Someone decided to
>>    use MAP_SHARED, for unknown reasons, so I'd assume it's unlikely that
>>    something breaks, but you have a point.
> 
> I would say this patch is the right fix for the moment to fix the assert, and we
> can chase up with other approaches afterwards.

It will get backported, so we better be careful.

IIUC, the real change is only for /dev/zero users that

fd = open("/dev/zero", O_RDONLY);
mmap(fd, MAP_SHARED, PROT_READ);

Which is rather something odd to do indeed.

Letting AI do some digging ... it says there are not known users (I don't trust
it, but I suspect at least there are no prominent users, which makes sense ...).


Getting shared memory when requesting MAP_SHARED does sound like the right thing
to do ...

So let's try this:

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
