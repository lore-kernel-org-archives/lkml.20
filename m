Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382029;
	b=jZ+J1rtTNvqW+rFD3vKMaItWklkL7PUGiQJwhYvyM1t83iQpBVTnkcwXAIqFZKgFJIGu
	 e6pSrJM8JVy5xZFhqRegJEdPZa1oxFkCt1RDnN/mKgWm2Rjcopj0JisyFO4Z3praZfz2a
	 xgiRNde3lNqOvaEMNKsVCORE07pWWUXBorYO/pjUzfwuh9OVFQkyRzuYaa1PolC2+RPXL
	 XSjti4SA+ZyPl+d4vG5TqdQ4BOC4pFzchlMfUBQeuAom973l1oow8rE6969s05D8WDqj8
	 XSOD0rmX/H56FquHEdVnNpUJrJuPTSgg0fqd0/YRJZUTInyXHp8XY41AyTeXmpk7GgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
	b=HgyltkENnHe5QbWeOA9uFGXQgjzBqdBrJ/HPQLPQSys5T81cnftGtXAFs8DRj7JGVzRg
	 7jtVXuG4gEeXttrjfRKMNzbROCx03H8QbVrK4lm1FJbE68IRCLn7U7l3v+FZqivhzJl09
	 wEVXm8sPRBwznEfqIpg1jWwYYWn+mCyvKC3SAdaDjac1M5l5O6Ak/xHLSCRai73eMO2RI
	 wBrjrLEPHskRkjYSmGy0UIYJjx16S40XrIXuYrz0eb5ixe780btdtA1qdcaVWIXz/vrnc
	 9RnEf+Kt+YWN4CTgfB9G0B7BdkvkJZz821RKMUNss3xthtbrIDLvW8g0qRhUoV2wLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFGIcN54;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF096606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF096606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFGIcN54
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9f6a16afcso2045ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793382028; x=1793986828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
        b=hFGIcN54HxCRWLwn+m1Xl4QEQDE5/cl5x+KQSXQJyEMT7wiQkby7aqDXSx488THYoh
         f5kvplnhqeV9H0k5RQGHt7kvJo1UxJbeygdqm1NlxybFI+IKbH5B7sosuiPbjK5SSmUx
         wfmzHB3MKh0KJszVevX1LoLIVaWH1EN5bVX41aH4OURNcHbwHQxwGDqCkdH3LymLeTv5
         wfhlyhEtPWyaNF3C5seBSdczetIWvRQsxsEp97tep86ff1DRBcxuV80CfWJKgoaMWYjs
         TksrH2ngp09wtcLUCyFJnya0jRB+MDR/3mR4e3RHUskJbg9rjzdXrJ5mEBF4fwPsGYs2
         gUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382028; x=1793986828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
        b=vnp2vKGbRVgHqnxzCgFGmNot3sbrSs8gPBjFDn3irWZD+D5xgt1u6zSQhCdbAdiQVQ
         Ji7arMMT93I2K7FWhWZhW0M4CEaWrXXngJmTy2WMuECnJ/osKkOKqV5RS244jQj+8Mob
         6/M7C0tocd671KqJkk3ZUNO0aUnJc3PjCddY7u+IHcXYiKT6PSkVAmhEvDDFMBqdrcOj
         CPqHSzjC+IAQ2VOq41xGo8zJikooXdhBntxKrfIrcNFisat7KCZRmGptbNbNijiqpJXe
         3oTzGeld0dIVoaUlZ9pZ8mCEVVEuRHyvTp+t30rh1apc+tmsPWtDSy8fTh0ftAl4suXl
         uGSA==
X-Forwarded-Encrypted: i=1; AKwUvBxLYdcDDr+SrsOTZfZYsAfFoWRsF7xqYlXDkisJ6rypWgmIeFwa72DbxfY69C0Ge1nCW+AiunbW3LH5Ae4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx94nNsDSlabo51K+IwHFn3LLI85odltdJtuCLm3LZfyAE/NOi
	0dOmEwhxwPrcuDjQxixn3ZrCQYw5mO7SA0Rc+mJK++QYIdCzkna3Uoww9LtoTnXCPytBCbW2oCm
	uvz2ds66L
X-Gm-Gg: AYBFou2QbF6IXdfxFW58Bt7xMhrAdb3U7OUrZCsMdAgmBhCyJXHojW+1afZIs+OLuMs
	w9ovyQZRfTkYYRiDsKAYaGH5EKMq/5aidv2pOTXjc9o53AinQwYgmh74epftto38OPkEjCUpG6z
	d09M6/eNNTIizZFh0xd0qewAM6J776aU74eu51mTSbzl0riXJbV1RfYYz0hbBJxBUuWMFJDAgJ8
	L01SMHnLR96hovlMecF0Efqy61fafR2Zsb4IYVr4fjTMKNNjKwkd1xKjRGEtgsEQFDt9z6p2T2y
	Y0q6gdDn5yNvQkXczlDElaXfZFa0wIQTX3yLBdjh9gVitgZUdx9vymZ8OHZQlFygq9qAUB6/KXf
	zkQJXoKM4Kqm9hwfyA5PjLKxG9A7/1S9xySHJk1UYMNhrokrEfZOTGhr55u2X++NJBXBr47IQdh
	WtMh4VJGOiw+b5VE9THXFmoWeiPtixHUbh19/GSUXhemlTbkiecQptZA1WD9H2gBpn11ZninLOw
	YS6gLhmkMv3otsk5Ph4oog0rurMHt9uez9h+Ni4Pz0CG+7/uX4SpJ+J9MBBgUCOM0cbxM4JkTek
	FVxGpVj13WCGjXauwOeoaL7rsTfucNO+TyPyp12foMukw4V7J5lygaEjyVoi+iXClGte0VmDS3h
	80au3vPrAdKtUGXrOY+FwYQ==
X-Received: by 2002:a17:902:dad1:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2eb1b6c6ae5mr11320655ad.2.1793382027347;
        Fri, 30 Oct 2026 10:40:27 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aadecsm286624b3a.48.2026.10.30.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:40:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:40:22 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auTR9SnDLsLVmnJ7@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
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
In-Reply-To: <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>

On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
>On 10/30/26 13:11, Jason Gunthorpe wrote:
>> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
>>> On 10/26/26 23:05, Samiullah Khawaja wrote:
>>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
>>>> holes from being punched into a shmem or hugetlbfs memfd while leaving
>>>> the file fully writable.
>>>>
>>>> Background
>>>> ==========
>>>>
>>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
>>>> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
>>>> device for DMA. Pinning keeps those folios allocated, but it does not
>>>> keep them in the file. If userspace later calls
>>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
>>>> the folios are dropped from the page cache while the device continues
>>>> to use them. The pin holder is never notified, and from that point on
>>>> the device and the file silently diverge.
>>>
>>> We have the exact same situation when userspace maps anonymous folios into vfio
>>> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
>>> used for such purposes.
>>>
>>> User space must not zap/punch things that might be pinned elsewhere.
>>>
>>> That's not specific to memfd, udmabuf, iommufd or anything else.
>>>
>>> I don't see a reason to make userspace (that should not shoot itself into the
>>> foot) a kernel feature it must activate itself to not shoot itself into the foot.

Agreed, for normal use this is userspace's problem. The seal was meant
for the kernel to cheaply verify at preserve time that nothing was
punched.

>>
>> The issue is live update doesn't preserve those background punched
>> folios and now we have created an UAF attack on the kernel across
>> kexec if you don't do something about it.
>>
>> There was some notion here that with the right sealing flags we could
>> tell if everything was 'live update compatible' and then know that
>> these attacks are impossible.
>Just remember that there was any hole punch and refuse to live update this instance.
>
>We could likely implement "we saw hole punch on a pinned folio" as well, but I
>don't think that's required initially.

If I understand correctly, you mean recording on the memfd that a hole
punch happened, and refusing the live update if it did? That would work
and is much cheaper than what we do today, where iommufd walks all the
mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
is enough or I can record that also on the memfd. I will send patches
for this.

>
>No need for more shaky seals.
>
>-- 
>Cheers,
>
>David

Thanks for the feedback,
Sami
