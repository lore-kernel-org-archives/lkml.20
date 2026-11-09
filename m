Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218843;
	b=Fl4GcZWx6xeull0fGGAAteqrxQ2WGWjFaovTqZ/flFGB6I32hLyf76EI+sXsmQJqydk6
	 RFxcVjFI4m1F/2yAjquqlqokwAI6MBGjm9KlW8Y474VjD+tRHlP8+UN1TfGe5OEQ1mLKF
	 WfniJrNT0QwUpwTB9qdIOXHKNpOn67/ctzRAl/2nvKWFceVOFfjV9zUBNKyNHUuIgFki2
	 Vxe6aUa0i2jcxhvrHHHEh/bPi/WZH0bma6m7aVYxLXGmKhNDvFMTd9lWDY1P6v2tRsXbB
	 0I9IJPA+oHRo2iA0SZ/fLRYps+y3m2sE8vzS8X/MlIQWGUjs7YDLT/PSdZJ0kIGowcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
	b=3ONTUNK1ydHkkUZvzTUlpvgRiJ2mxLIw0PlsuPvnlNR/h0w9eLMAv5hbV/wIYOGX0twH
	 j4s/+tKAmnjdwqJserL0NO0om29v0wSXsFqeP/yJpvJOZ1MeM20ItH8f2ErtyLBOeTHXr
	 JSxeuRM8hNNqNHH/x52cvtbEoD++owY/wA4+83qfA/J5nVMjwFDc5TwWbMqJIq8obo3Gq
	 GpKhxoEHNsS6ghPeMVtofgbJ25AY2axOguY4c+hyY45AOaBgFIcDNalMMrzJ90wtocDiK
	 KttBzzfbSb6IiIvsOvYhEXUHtslnQCF1PgOCwAH7eqx00PdlyD3ztXxTrasUabW0ICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjgaEr7m;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6179606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6179606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjgaEr7m
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso7181585e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218841; x=1794823641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
        b=cjgaEr7mn0aEP7wTMLCAEdgMC8qpGXxO/avg+exKuuXYvTm9BSGOPuOPzkRJFHA9yL
         cKZctyNtqWTiWhjEief30FaL9nmIkwMYN3umzN9RM3GrS2tv+Ime7tZoSW76EJ9ohMWS
         zrJhCXISjUxM6Wc15ZCTWRBXpy5LpKLxTajxvgnV/k+KZrJXwev+pd9YGFeUhJj3vNZz
         5xnWSFxqURGCXJbT6N83tpbyfT0Q1n/l2c/O4xWlU7mfTerHS74v6W3tUVxMhvf/IPI8
         94/wWztpRVgJLYvCD4MMbWUQAG4JoI31Kyd+YVyxBROLkSb831+CQJ+94166oBa5pnSz
         BSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218841; x=1794823641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
        b=1XjuanxzFigV1sRR9TflIowoRjgHxa36cS01jWeNGYuWdTviuZS5jV32zZBmRI/6qc
         y5FaRfG9HqxW2YVLk+HCshnszOGAkaeW0UPf2wbMKaqtyPY2jNIUeHRyEZGA7GFX0GOL
         9Hg0eDqcIZw18wSE3gwtKoYSbVPnMahOg24XHplJp0+uNXWZ1rQyVdw2ZQ+bk3gXFgZ7
         ugKwyAKAGgg9v9sukMBg6nLkSu2UjrDvzAXv5FrQ48/Lpjrfjo4WRaVS3XaDqBzeEP+i
         3hxMi8GXCUGZcZaJV/6T+0uyeI2Cg3CiwU2CWoVmkp0Al5RkEuj3hvdgUnXaX66SJ016
         ZAhQ==
X-Forwarded-Encrypted: i=1; AL+hErFXpM70cKRpKPs+Ya569eD+QeiZYndNxBcSMrMeMpLfza5U7D0Ens7KuKplNiGH0ru+UU7j7SKZ/FlNBHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GXn8ldbYQ0iAwUTCJC6FkXo/VnfOsHLoyu1t69AOGuz7lgEDP
	piST/orxoaH4HZbyouRinImed3lLkW+Z6INkL8Kv+XnV/obgzU8hThZA
X-Gm-Gg: AYBFou1bl7Lf30QAALld4/Im5AY2z+taac0ad1+sgoXalxuffKUVRp1V6tL+5/E9bL+
	m0aiJQWt8nV6QaWOSFIIUvqciTerin7ZCFQeYuwx2pVnbYgllB28Msi7JYkloPeTItrJDmRA6Ek
	zHsOj1a4OG8X5W6B5ytbh9qUXnWXU4/M3L3eBnGg8rkQf2h/1TeLXik/p921mV/UaZ/U/m/E/52
	IJBdDp/gfU3MDkyzphjjAvI93P/CF7MfQuCIKuGgdQLDXB8QMsclU0/3BlXVkKm/paT3TdFmvQz
	rp5YPT1H8hkJzjQ5WXh2WOepbNTsvG74qw0eIele84kcTtYZ/ljXGrPBI+LpdCml7ds4aBUQMRV
	H/yWDeju4sMdWaC8RDkHrcCq4ofpmbPN5nbh3dW6jmqczHihdolISC7L0KApmJhzMhFfZg9/wOU
	hYPluq69yFX7WhZ/VwhMQH8S1uVDO1ScuWBapRMZD9kXinQmJ99L+oC27gWAlol27V5KrL/iB8T
	kbHPfkuSlQf5mt42lKV5N2Wa1spVG48JCUl5FUIykR0r6mMqqSf24/gYKdl+AysUF4pAl6vlb84
	hroqYbItq3+zbL/lF8Is7G0=
X-Received: by 2002:a05:600c:46cb:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4b94d762ec2mr69628225e9.1.1794218840912;
        Mon, 09 Nov 2026 02:07:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783f1d6sm8829668f8f.46.2026.11.09.02.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:07:20 -0800 (PST)
Message-ID: <bb6fa14e-0a98-4b31-899d-0b1c883d0608@gmail.com>
Date: Mon, 9 Nov 2026 11:07:17 +0100
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
Subject: Re: [PATCH v2 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
 <a9fb2d3c-d518-49d3-9479-a25fa2cfc5b3@gmail.com>
 <8d23b1eb-72aa-479d-9486-dbfd86d8414c@kernel.org>
 <43fc45ff-8636-4961-a80a-29844c15d7a1@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <43fc45ff-8636-4961-a80a-29844c15d7a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 10:49 AM, David Hildenbrand (Arm) wrote:
> On 11/9/26 10:30, David Hildenbrand (Arm) wrote:
>> On 11/9/26 09:57, Jose A. Perez de Azpillaga wrote:
>>> On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
>>>> Similar to mapping pagecache folios into page tables, let's reject
>>>> additional references when splicing folios into a pipe if the refcount
>>>> is at its limit, similar to how we handle it during GUP.
>>>>
>>>> This will prevent more cases of possible folio refcount overflows with
>>>> large pagecache folios.
>>>>
>>>> Let's keep it simple and check in the two callers of
>>>> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
>>>> progress, so do_splice_read() can fall back to copy_splice_read() when
>>>> read_iter is available. This keeps sendfile() and other splice users
>>>> working when ordinary reads would still succeed.
>>>>
>>>> Also fall back to copying in FUSE when taking another reference through
>>>> fuse_ref_folio() would exceed the limit.
>>>>
>>>> Also check in try_get_page() to cover pipe-buffer duplication by tee()
>>>> and partial pipe-to-pipe splicing.
>>>>
>>>> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
>>>> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
>>>> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>>> ---
>>>>  fs/fuse/dev.c      |  5 +++--
>>>>  fs/splice.c        |  8 +++++++-
>>>>  include/linux/mm.h |  9 ++++++---
>>>>  mm/filemap.c       | 11 ++++++++---
>>>>  mm/shmem.c         |  4 ++++
>>>>  5 files changed, 28 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>>> index 3641abb90d6bb..4f6b7b42bfd3e 100644
>>>> --- a/fs/fuse/dev.c
>>>> +++ b/fs/fuse/dev.c
>>>> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>>>  		if (cs->write && cs->pipebufs && folio) {
>>>>  			/*
>>>>  			 * Can't control lifetime of pipe buffers, so always
>>>> -			 * copy user pages.
>>>> +			 * copy user pages. Also copy folios at their refcount limit.
>>>>  			 */
>>>> -			if (cs->req->args->user_pages) {
>>>> +			if (cs->req->args->user_pages ||
>>>> +			    unlikely(folio_ref_count_over_limit(folio))) {
>>>>  				err = fuse_copy_fill(cs);
>>>>  				if (err)
>>>>  					return err;
>>>> diff --git a/fs/splice.c b/fs/splice.c
>>>> index e6d43329ed3f0..df73a4e65118b 100644
>>>> --- a/fs/splice.c
>>>> +++ b/fs/splice.c
>>>> @@ -956,6 +956,7 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>>>>  			      unsigned int flags)
>>>>  {
>>>>  	unsigned int p_space;
>>>> +	ssize_t ret;
>>>>  
>>>>  	if (unlikely(!(in->f_mode & FMODE_READ)))
>>>>  		return -EBADF;
>>>> @@ -977,7 +978,12 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>>>>  	 */
>>>>  	if ((in->f_flags & O_DIRECT) || IS_DAX(in->f_mapping->host))
>>>>  		return copy_splice_read(in, ppos, pipe, len, flags);
>>>> -	return in->f_op->splice_read(in, ppos, pipe, len, flags);
>>>> +	ret = in->f_op->splice_read(in, ppos, pipe, len, flags);
>>>> +
>>>> +	/* Fallback to copying when hitting folio refcount limits. */
>>>> +	if (unlikely(ret == -EOVERFLOW) && in->f_op->read_iter)
>>>> +		ret = copy_splice_read(in, ppos, pipe, len, flags);
>>>
>>> here it can't tell where the -EOVERFLOW came from, if another file
>>> returns -EOVERFLOW (i.e. tty_fops uses copy_splice_read, and
>>> n_hdlc_tty_read() returns -EOVERFLOW after dropping the frame), it now
>>> gets a second read.
>>
>>
>> That's what claude told me during review, and when asked whether that actually
>> happened in practice it said no ;)
>>
>> So is that actually a problem?
> 
> Double checked, claude managed to confuse itself.
> 
> n_hdlc_tty_read() can indeed return -EOVERFLOW.
> 
> I should just have let splice keep failing, dealing with copy fallback starts to
> get annoying.
> 
> I guess switching to -ETOOMANYREFS should work (and might be a better fitting error)

I agree with that :)

-- 
cheers,
jose a. p-a
