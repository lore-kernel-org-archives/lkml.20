Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312022;
	b=ec/5eobh6gPn5jwYT/CpTnQ3dgWQrDk/aMI+AxRcXAJA/L7kNGLmF2UcJcz3Ph2joyys
	 /jm6be83EJ/qE3FkGCWTIjwYzpEh3orNMG2ruJVtvhfnTbSOzXNYHrjOiKE+2zPFE9ot4
	 ziILbhwuxL9SsZdkKrNPRekeIae8Ehuy9ZQ19/d4CgIgyLkiDOxiLbPsK1neY02cY2uqr
	 UPafl8prhL3Z9AefB8HETN8yyyU80mgp2jEKAndLQM69tmNkzAL1LFNzVtOQyNiPQ5VaB
	 kbHddUHLYxfP8aaYrXAfkZn3nAJKKeAdPDVJC0zhatEGhLw1LCZ9o9r3AwfmeLpbG2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
	b=PEGTeQ9o/OgqvupaTA9aHfe1uyrPIePGcfFifrt3xO4Gj8E4W9CyNfIvymzpT2zYE9W3
	 C8Q/KCZ6jNppl6nJonggDYnYHK9eCKZgpDCck30wxth2yrtV77zT/eEjnENg1k0K6PMIJ
	 Mmy7P6qbdW0btJhtMuSJWNpoF2AkaJBDPZgNbLyZxCWD1lGfh4Be2NhBTniY87D8b7Et0
	 jdAJK92Xf2EPGKsydwgvlo0oD4sdL55atQz10vG0O0Y6KnHnaihKGzRA3/f5EStfPqJDI
	 pETrnqXCHf0c7f+5J6Cq7+U57AtilvMaBbGVH+q6z/hGNo7ztcaCHpV12aIsYT7eadg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmpchzK2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68192606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68192606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmpchzK2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15722075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312021; x=1794916821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
        b=xmpchzK2ATYRBITRt7/sepYMIJFbxa9hoAXjYxMVUbIaigNRiAVUEEMT5IFFHkkbHM
         gbNUlE34vmLvq8KLJ1qEwfx4vLrgrtb9Mvybjlavt4YUucd2wNKLH6Sl7dFOtFZFz8KK
         gyuCc1aYErPCjZLM7rEVj3NCkl77A2ZcuJWb2QVF1A/a3DZcoL6UuYrTB8ibjiLfgR63
         IiWTa2o9HuRvBkXjOtMLmvfhyA9624B4smZZlTWBT1fUW0scyuGBCCr2zA41vX+jb5Hu
         X0aJMqyxqzMhlzIIW0jEHEic4sdTZ2U6/qT4Pda4FLFG7UD80VzLs0nbdTNyQt+IgGkQ
         6Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312021; x=1794916821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X3zb3VH4w0Ie2RKn7QlDBjKtcvMvn58SYuQeOEmpyc=;
        b=e7FhbgfhSyI01Ujzd2GhhbVJ2mFp1WNxr/HNr2zE/sHFkzpAFr86DynZFlQOEudmm0
         EV6ZIpelot8V/sxy6u50vdwIX42lbECyp83+RXNippDt1mNaGCcx6MFGIcKfY2Y/zbut
         xDHp5NwhXUtwUvtSuwO0Fe4nqCN31OIAeL3PF4S55Po5y9VkzuiOdPOZEwcxhTOzdCxG
         ovDRxZbQOtR0/P7Klh0hDDYW9uYAeojmfkr8hFaPrKTmkG7eq7dX4tjXa4W4G+9rOajJ
         skk2EWquSmzS35+x/jVffwGn9X3tlKFRqGXO31KLkJroEGRrp/Jj/sIIKdRHlYxW4UuX
         8wIw==
X-Forwarded-Encrypted: i=1; AL+hErErWPvVyUjky+NeVo3MqttM1ieVeZ2f8ZkpC5IFqurrDARkD6B8+yNOkD5GuW16+T5OD/5cw0Ul196lFJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U4sMTTHLuCnr77MRx31eGRROwIHbgg27Venp3XnDtRkY3yaJe
	dfs2Q2le7aBOGR5o63egsGDEzeQcUqxsIz5jJYLu8XKcAg1GTc9/Wu6K
X-Gm-Gg: AYBFou18AxEm6pVNb8Df3KlFDToEXRjmuIs/6oT9yRWUjr17uTA+SixUaF2qMPxk+uB
	U3Ani1Ul2+XVKiZcsN3/n7YbRX1GzGlkihtN7s+MLKm4I6kc0JRMYaMM+j7//Nye2Qu2RbglfG3
	27pNT+ax7FbvEbmDCnMxtw+YNU8Bkl6yHziQR6/EmTcVL5mdHOwG64vwlu4aAtl26D8prqY0kAA
	Vw/d3fL19/0Yi5bH+hoEeUI5jMlxBmG93ya/CCtpR2DCs7XVW4d8WD7+eYNK7lOTaP03hLfBFfJ
	m1GLBc1ouRcV/7qKxZPKDUjfl5fxi8bkxCU848Prv/hRvXQwwQ1pe0IS+tXuZAGSIhlRxLFn98r
	EgpTC9JDIScQFnJtTUMj9xHfw43lhk2bT0o5XpCgy1+HDGVa/Dvi8lAoJJgGBuA2gQkD2DGYWNP
	ZWEohREDw4TIgzTAt76KvIppXnJY3yvjDu+EkF1OJV9/D7Bgx3GoYS+iDCZ3ZREWtko7RMxZWHu
	+DQtNMH3THopPe03kscj2SQtN19IkHZlhd03p1cH8B9rq3HubV3hsznvhxUfY0/WO88JtiuVnwT
	IEjcNRN4A6lnyNnlxY9YseyK
X-Received: by 2002:a05:600c:3e07:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0234a8f3mr43245435e9.22.1794312020086;
        Tue, 10 Nov 2026 04:00:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm97526925e9.11.2026.11.10.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:00:19 -0800 (PST)
Message-ID: <d4bb71af-cd1f-4d42-b724-916064f4cf0f@gmail.com>
Date: Tue, 10 Nov 2026 13:00:16 +0100
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
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
 <c8dd3102-38f8-4972-ad2d-97545fd8c8d4@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <c8dd3102-38f8-4972-ad2d-97545fd8c8d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 11:38 AM, David Hildenbrand (Arm) wrote:
> On 11/7/26 23:23, David Hildenbrand (Arm) wrote:
>> Similar to mapping pagecache folios into page tables, let's reject
>> additional references when splicing folios into a pipe if the refcount
>> is at its limit, similar to how we handle it during GUP.
>>
>> This will prevent more cases of possible folio refcount overflows with
>> large pagecache folios.
>>
>> Let's keep it simple and check in the two callers of
>> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
>> progress, so do_splice_read() can fall back to copy_splice_read() when
>> read_iter is available. This keeps sendfile() and other splice users
>> working when ordinary reads would still succeed.
>>
>> Also fall back to copying in FUSE when taking another reference through
>> fuse_ref_folio() would exceed the limit.
>>
>> Also check in try_get_page() to cover pipe-buffer duplication by tee()
>> and partial pipe-to-pipe splicing.
>>
>> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
>> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
>> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  fs/fuse/dev.c      |  5 +++--
>>  fs/splice.c        |  8 +++++++-
>>  include/linux/mm.h |  9 ++++++---
>>  mm/filemap.c       | 11 ++++++++---
>>  mm/shmem.c         |  4 ++++
>>  5 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>> index 3641abb90d6bb..4f6b7b42bfd3e 100644
>> --- a/fs/fuse/dev.c
>> +++ b/fs/fuse/dev.c
>> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>  		if (cs->write && cs->pipebufs && folio) {
>>  			/*
>>  			 * Can't control lifetime of pipe buffers, so always
>> -			 * copy user pages.
>> +			 * copy user pages. Also copy folios at their refcount limit.
>>  			 */
>> -			if (cs->req->args->user_pages) {
>> +			if (cs->req->args->user_pages ||
>> +			    unlikely(folio_ref_count_over_limit(folio))) {
> 
> Linus points out off-list (thanks!), that fuse_ref_folio() should have
> really used try_get_page() right from the start.
> 
> And that we should just not fallback to a copy, in particular,
> if the refcount is invalid (<= 0).

now that is said out loud, makes sense.

> So the following is what I have for now. Once we remove the limit
> handling again, that code won't change, which is good.
> 
> I went back and forth with folio_get_checked() naming, but decided to
> not mix in the "try" as that just reminds of our speculative refcount
> handling. (folio_try_get_checked / folio_try_get_referenced)

agreed with that.

[snip]

> -			if (pipe_is_full(pipe))
> +			if (pipe_is_full(pipe) || *ppos < folio_next_pos(folio))
>  				goto out;

nice!

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
