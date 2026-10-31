Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793415808;
	b=34INrVt2bf+zT8M8B9OiP/ERpnVqam1tFTqdH04DwKnY9pr8W7apGVK7e51UlrYOnLkc
	 LmjaqKKinVsnVIMxr7kUSFs2FgatQzj3kCPCP0x9VBbBDrPK9anzfFAFpXUdglgee3MqC
	 zZDM3uBiBGnnKpX1RYUZul/7/hwYM34T5yVb6nwA6rI8sU3a7kVxdAuYpn/Zpqbc9lVZX
	 1Eg9ZqyRxD0WXcYA9RrjMGNtHp3Dus7lApvEF6boUUpKruiPOKVj6KF5Tda++eX2bZCSG
	 vDGznRS8W7BLmYxAwJHCjssIIcadi6mf/BgYNXn/eJE38WhBWFHufV8/Xg/fIk2Hd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793415808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
	b=nplGp6b7PcHTpDJ0Pb4oer5khDq3ECOftiCSL1uwQlszCKCauaHVAW4qIuR4V9jUW+tf
	 mSBNehhdFNsJ5K1vNh82STlB/d5rc8QriCBOfeNFsNXeF8l6Fwn88T+t+jipT3JtraWex
	 mInpZ1PefWZlXVPwH3MMeobzkmFpDmmUs4nPWriZ9/dcLuo7SqaInzCnQCvCXKwC8xFa1
	 qsf5trdMIGI+s0wLWAduqcTlS/AwolwQwrdpxozxSmdN4KCU1o4SKsLZqCzzHBZQkoEli
	 ZBiVKxe3wKNEvsqXSNvTO4QPd1nbC4F6kA1JAH5KOcVP9ynyfniWlTgK9VH4zVVqEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fbY/DWFs";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fbY/DWFs
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9f6a16afcso18045ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793415808; x=1794020608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
        b=fbY/DWFshOR+Qk4YSa5bnbgsLqeA3wOLvaoB1liz0pQjjyiEZ63rEoNXs/eFRxMnWW
         eG0Wy8C+OetD4ESLbiKc8xstEQJiutXddJ5NW3M+3bZKwwgXPaH9cSBM83QZ9qG5FJBg
         jtEo+DKCysGkRP8fGCN5eDNRSgnhW/WRmEFik7C8RbrQpPb58+DFg+2bOTxFvwICCbOM
         KZW3J1UyAKzEZKQtEzLk607Wkpa0VjJWO2IqFP4ecNxrX7hSlSl7eay3qwypxG08F3Nx
         CfPz2ZP7dol0pk7QkkLkCV4gNQ27TNRWFA5JfshSvQxT0QnSPBpIpHDB80O+xj7cipSv
         kwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793415808; x=1794020608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CykDRQmyupGap9MJ8JD7H5K9Ycd/s3V7wlgI2ffH55o=;
        b=2YSNc409k55LboX3XIQx/UQSFaqgFKCFmEZT4/7Ej1G4dx8xzgIU0Ow7QM2+mn3g3b
         fBA5zGnbo1Ib9ULefz+qM6Y/GVYHeh8spRSD6XGrVWMQg9p1TlS8TEljGTUgYrmz3v2z
         ++oR8NeJEGatp2BvEHCCaEsVMm96df0vrZOobHDg5s1+Rnl00Bl9srBUg+zNKuSbNvcf
         GFRoHyOd5otATLNu4/JJEJOVuUDLL2NqxLBtVTWBDxXmj6ymIFlwImFFwiH5Sq5g+rK4
         YiAQPMUvyKMLRqmzj+4gyVSTszrw9Gj5bBNUJPKjVFoMt9fg4e3q7DDeodmm1ala4oKR
         ZvKg==
X-Forwarded-Encrypted: i=1; AKwUvBx9nNvb1noeMUzOGhnxE9r1PGIxj6UzHrD4qKp4rSVFECKO6RTe+KjaS9DQCo0J59qc4RUVUYUAyWg8pI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC4gx4M1RDrStgK5cYt9nQ45umnfYj39ifiOS0/ejUOlNbKk0u
	tvTh+S209VeErAenqTXvlxUSMAlyUbcPKlMqWzOM/KW9XJg1KOFvj58yFqkOTrTjgg==
X-Gm-Gg: AYBFou2BkT/IP2euvlj0RyrRPm0cMxV+oEoC9v1wKoNk5F72FTaLoGgbcsjWgaK2zaT
	6IL5S8mUtNHqP2Ga7b1WrQQ5JdWIFuC1wr+b4GMa6YExYM+wi0V2EGLWF5cVno8udOdhd159QrN
	RwDlSqV/mkcCYoq7ypC+advCKwNtOx4+wQHPEILSJcJXzDPc239MBW2jaSQNU7H+MLUIZgAleH6
	kXKwJdb1zAKWlmTAnd0swEn57oP0IMgbj8Bm9t+9d49RmMtG+kTC7QT5n+0RXrfctLoNjopjCSQ
	mOCb4pWVFjkuyoUWMkFz3D0TVY3xLboj2yOUyc6qfGD4jug+hVLE6kk2u1AkrMboHqEjdEFeFAK
	R0vMz2Li4OPD0cMsDNFqs9PHJLySAZON85Z8Nzn27dyecFT9tRH5nsGqTugUqcP9fj5aeSx7uUX
	1HXKQYsjUxgwwFxhjwGcQhOuFJfvpkGKCB0ML4ZGgxptocNxI6JqVo6KLFmQ+4dffjw3poK58i2
	4Eb1EBH0j9dUEY7EnDKofM3oE7868qvjsDeLZezrGBb83XugiEM3EstBxptZZQbguq1XGkQBMMd
	aX5Jk7aS46DSV+MKzplePgLTsoJaiK+i7VbTQqftDbtQbJS+nzqAJIj9Jq0sHHsnwmNx1gq/LQj
	yibrcFtAP+IGl8EROFKugtImRxPvg5qzEV/T79fYVzjc=
X-Received: by 2002:a17:903:2c04:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2eb1b8c1cddmr13716365ad.6.1793415806880;
        Fri, 30 Oct 2026 20:03:26 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm5927972a91.6.2026.10.30.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:03:25 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:03:21 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auVRLPmbWYvMnly-@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
 <auTR9SnDLsLVmnJ7@google.com>
 <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALCETrV5eqg6d9=+BQhCpRwBNe3aCQiut8vxPBs8b7PToqjaHg@mail.gmail.com>

On Fri, Oct 30, 2026 at 03:43:53PM -0700, Andy Lutomirski wrote:
>On Fri, Oct 30, 2026 at 10:40 AM Samiullah Khawaja <skhawaja@google.com> wrote:
>>
>> On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
>> >On 10/30/26 13:11, Jason Gunthorpe wrote:
>> >> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
>> >>> On 10/26/26 23:05, Samiullah Khawaja wrote:
>> >>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
>> >>>> holes from being punched into a shmem or hugetlbfs memfd while leaving
>> >>>> the file fully writable.
>> >>>>
>> >>>> Background
>> >>>> ==========
>> >>>>
>> >>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
>> >>>> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
>> >>>> device for DMA. Pinning keeps those folios allocated, but it does not
>> >>>> keep them in the file. If userspace later calls
>> >>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
>> >>>> the folios are dropped from the page cache while the device continues
>> >>>> to use them. The pin holder is never notified, and from that point on
>> >>>> the device and the file silently diverge.
>> >>>
>> >>> We have the exact same situation when userspace maps anonymous folios into vfio
>> >>> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
>> >>> used for such purposes.
>> >>>
>> >>> User space must not zap/punch things that might be pinned elsewhere.
>> >>>
>> >>> That's not specific to memfd, udmabuf, iommufd or anything else.
>> >>>
>> >>> I don't see a reason to make userspace (that should not shoot itself into the
>> >>> foot) a kernel feature it must activate itself to not shoot itself into the foot.
>>
>> Agreed, for normal use this is userspace's problem. The seal was meant
>> for the kernel to cheaply verify at preserve time that nothing was
>> punched.
>>
>> >>
>> >> The issue is live update doesn't preserve those background punched
>> >> folios and now we have created an UAF attack on the kernel across
>> >> kexec if you don't do something about it.
>> >>
>> >> There was some notion here that with the right sealing flags we could
>> >> tell if everything was 'live update compatible' and then know that
>> >> these attacks are impossible.
>> >Just remember that there was any hole punch and refuse to live update this instance.
>> >
>> >We could likely implement "we saw hole punch on a pinned folio" as well, but I
>> >don't think that's required initially.
>>
>> If I understand correctly, you mean recording on the memfd that a hole
>> punch happened, and refusing the live update if it did? That would work
>> and is much cheaper than what we do today, where iommufd walks all the
>> mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
>> is enough or I can record that also on the memfd. I will send patches
>> for this.
>
>This entire situation continues to give me the willies.  After much
>prodding and contemplating (in my own brain), I got a friendly LLM to
>report:
>
>--- begin AI output ---
>
>IOMMU_IOAS_MAP_FILE uses memfd_pin_folios(). Collapse [MADV_COLLAPSE
>or khugepaged] checks the old folio’s reference count, so a pin
>acquired before that check makes collapse fail.
>
>  The problematic interleaving is:
>
>  1. collapse_file() locks and unmaps the old folio, then passes its
>reference-count check (mm/khugepaged.c:2446).
>  2. memfd_pin_folios() (mm/gup.c:3483) obtains the old folio from the
>file’s XArray and pins it, without taking the folio lock.
>  3. Collapse copies the contents and replaces the old cache entries
>with the new huge folio. It does not repeat the reference check or
>freeze the old count.
>  4. IOAS retains the old physical pages; accesses through the file
>use the new folio.
>
>--- end AI output ---
>
>Is this correct?  I haven't personally verified it.  But this whole

Yes, I think this is correct. memfd_pin_folios() pins the folios
directly without taking the folio lock. Other page cache lookups lock
the folio and recheck folio->mapping, e.g. shmem_get_folio_gfp(). Only
memfd_pin_folios() misses it.

This scenario is different from punch hole or MADV_DONTNEED where the
user decides to remove the pinned memory. Here the kernel is removing
the pinned page without the user knowing. Collapse already checks the
refcount to avoid this.

The recent fix [1] by Chris already takes the folio lock for !uptodate
folios. I think we can take the lock unconditionally and recheck
folio->mapping, that should fix this. I can send a patch for this fix,
if folks agree.

[1] https://lore.kernel.org/all/20261029-fixes_core-v2-20-a64ce7f83abb@kernel.org/

Thanks,
Sami
