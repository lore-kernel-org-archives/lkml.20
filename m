Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543932;
	b=IAqOe+SYu39Yx7p+9JVK5htDMxMPwYl1UcMDBgOKZUIK8ec58Rm3QhlzzLQiANc67WcO
	 m38YuJKN3qjh+M/SEZBOq6+fIWducUgPrg1FA+glNMOI9ME6zfDkPQ1Bx84egd0EKM5D9
	 ZTvLnl17db/kFgYe7uscjT6HLXpV6rAnDEQuyOGRLqP4WFp2tu3qVZpsDOPPlwS5ZyIVJ
	 971Y5VzuPZfE9SXBeiLS3oSHSjDgT7ufQvoE98hAWezmLbRY9NFKzmP5T6gNXfRlhSpEo
	 khQnjcHFD5FygLyk+V0GoZ3kMwdXzss6VrT3B+dnYOjyND8vmsbHQaCRGiFBkyArhgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=IkIvwF8HYTYAvXNQ1Vf3vJhW/UWoUX7BTMENFsGTE9A=;
	b=wDLjalqba7E4lPpG/gj/P+D9Zm2nkUVY5M81vhC/12gnSmdQNkBMU8h7lTss9wX7iFt9
	 efIuNlUqCwgQjrw6ij1DnWcFXb3ogtRmetjdRLNrkMI8AI+IS3fo2Nh8wOYXgMQuYkAqQ
	 JRUUYng7HugiVK+QP+YP6dPOi5ZzdN8sXcvBfqDFunvL8X/RPNBjkTfsofUmh0sLSBiEP
	 kd/Qm09yvo7sFqo1ovVUM/ICahUG3zue+5MQ3aptHv0PvI+KXhfk7c5SSsEslkEL16/H3
	 /0EIFfVLQXmUakN+eSY9/1hbnXRte3SSMJR7vcC2GlYRIucH6gcN9r2FVon5u3XU0eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=B1OG4Hxl;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0924B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=B1OG4Hxl
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91f0c4f7a8fso9788096d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794543931; x=1795148731; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IkIvwF8HYTYAvXNQ1Vf3vJhW/UWoUX7BTMENFsGTE9A=;
        b=B1OG4Hxl38/BpIuzCGtNlDw2GD8mt487C5mv8lJQX4OTX2am2+Kkp3gfikdgAb9+Y/
         1ZKgPsiJivd+Mba4vOf3m0igPUUMTO9YSAf+1VyppPpn8UV7aBmsZIq3W4kAW8gz3K7/
         5Mr7o9YZnWVNQygQQz84uL2CrfsS90hiLVrtWRpFy2JFFR+NjpM+SJ+5EaWwydv8oM5b
         ZNFPctnZSkYg5hOeV7uqrbFp9XhRVKpyZRLM7m11rvzFi8eXGfOI/h+0ipyI0SyEFkvR
         LBqQAeJnZOg0CRLQx952LGQyQImcTolSqD9OoZTTcrVpdr55SSk2Y836a5aWfgqgM5KE
         wUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543931; x=1795148731;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkIvwF8HYTYAvXNQ1Vf3vJhW/UWoUX7BTMENFsGTE9A=;
        b=ppkIk5on5M5wClevkC+N9jQeECjMXQ4fk8EdCThBBErpUWs9fw04cGESGFD3MabbSP
         pU9+O7ZmXDEix0rOIJMlsoeO1f2/Eponjo8K36oOYNOmkBKq7rECOPRb1fAWHmWTWdOr
         eiiojRvdId2dmiHV5zn9G3bfwpLFvvvA5vHMkP6e90NqXPxNoWWErY9nrK55a/MuxWMD
         kVDAFky7jnJEIZ//pkmaok79fBnY3mS954RiuWEjiMvmCgTGlSIeNFFQderPImEl03e8
         KkTxd26MZN5RtkHg0EjKJVM//56MxEI7h1jjQAttObVVMVnYGf2GTuCmtSabO0QwHBcK
         w7Og==
X-Forwarded-Encrypted: i=1; AL+hErG5zJl31orihVbgCkCW6KyOqZvixHwbXKCYe7zHTrX0g6SgJVMyAvydqGZo3IoCjiqsItFx2biaSSc1BEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TjcsnwMX2BeW64jppMVBo5qib99jKtPSl2YHIWawUcsjz3a8M
	kTGvDhBJsVb1W3HjsTQ5MTCruOEoERQinRW2WwgzHQoZEUed10S8/BtYdMasWqlAZFw=
X-Gm-Gg: AYBFou23N5TLFzoOGdIpffUP2NVzdRI4P6L4l1ge+6GbUUP+ekaiwBAUnqtda+rR+qA
	/okK66bkFGhM/k8PGX9EPsIxf11HsLualvrApV8n339YrI66TdUjomUawbT4EiW379nguvgtZms
	UTHnh4fcTHAfJj5MORHL3wm579vvV15nIScA+27wTqp/aqZX3O2gY900nfp/yk80RqzgCpJaV7L
	FH1wcYfbKKqr1LhlmBaGNxjtF27OzP/L3lf9a3avnK6u7RhTqxvhZJpdxfH5IzaE0gpVHlZhNWF
	J/nGpd8tTOy0ZrQs2dsjatSUMgshBDlan2ZjgZuIsHGWdCTfVwwjzOgB4TmctSlmjXgqEXPBv2q
	ExrCgks3lscNFBvnol+X8UyQKqJMHYLYzaY+J3c+yqRk+gKbA9T8rVWBUEBZZz9PM3t9g3br6kY
	iOAOiU5SsZAilNP/3zrdRKgq9oQXJihPpGWen78fmGklXDI5CDw1Xk8Qt2Pdq2FVnFJPtYsXdOh
	yUbMEAJZK+7QhI/dT91CKuH4P1gJULuQ5xEOI8+zxBIBK7j87lvua6AMqHuL75H3JcRN5bAXZCT
	/58bFJvM9Hch3oupFkY3JLQ6J5QmaSCW/29RlEHIj3rsjodwuiFiGx/+QUvebLPn6W+TfQfzhOj
	2qpLTp6k=
X-Received: by 2002:a05:6214:2f03:b0:91c:aadc:5725 with SMTP id 6a1803df08f44-91f241e0e43mr23498046d6.34.1794543930772;
        Thu, 12 Nov 2026 20:25:30 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d458fdsm11668876d6.9.2026.11.12.20.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:25:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/12] userfaultfd: refuse UFFDIO_MOVE into a
 non-present huge destination PMD
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
 James Houghton <jthoughton@google.com>, 
 Andrea Arcangeli <aarcange@redhat.com>, 
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Andrei Vagin <avagin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Arnd Bergmann <arnd@arndb.de>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>, 
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261111-uffd-state-fixes-v1-2-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-2-00713d368976@columbia.edu>
Date: Thu, 12 Nov 2026 23:25:28 -0500
Message-Id: <179454392848.482102.8479698323718468757.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> move_pages() refuses to move into a destination PMD that already maps a
> THP, but checks for that with pmd_trans_huge(), which is only true for a
> present THP. A device-private THP or a THP under migration is a
> non-present huge PMD leaf and is not refused.
> 
> The destination PMD is then treated as if it pointed to a PTE table. It
> is not empty, so pte_alloc() leaves it alone, and move_pages_ptes()
> fails to map a PTE table from it and returns -EAGAIN. move_pages()
> retries on -EAGAIN, with both VMA read locks held. If the source is a
> THP, it is split first for nothing.
> 
> For a THP under migration, the loop ends once the migration finishes.
> A device-private THP can remain in device memory indefinitely, so the
> caller of UFFDIO_MOVE hangs until it receives a fatal signal, and
> anything in the mm that needs to write-lock one of the VMAs blocks along
> with it. This requires a driver that migrates THPs to device memory.
> 
> To fix it, check the destination with pmd_is_huge(), which is true for
> any huge leaf, present or not. UFFDIO_MOVE now fails with -EEXIST in
> these cases, as it already does for a present THP.
> 
> Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

