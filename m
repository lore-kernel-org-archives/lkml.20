Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676931;
	b=xlDgIMRiX+Ca0eVNPD7yKLm7/DGmFQyzgAdCQ0t0eVDPV/1/YYoXPg3pZZPxEL3ktoMG
	 sbTBThomb7Ssbe29VLtvAnPf8YBclGPqGmVy0I/k1KGQT1QXq31S4VZLk7vcV88IQFw8R
	 tUBiqukSiqmsSXyuYWDF1A2tgF2cjJ3JQkcEuEwOh/qvZUCWlmahZKv8auGaw25cOApJ6
	 EyrdDvj8ULQCJ2kAW22UwBo1Z9BO4Rna3JNz3l9IvY7T+ruGq4RlQ1ugldkmyrJWB3LKX
	 oZlP2w8znGMwTbSgukItzP/dpLU6fVfm5QUDzSm44JH0byx6aO8YCRZYP5zg1J8EbEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
	b=IETcccQXZc0a/mimvUfZcJiZTlVHT+NCBA2nx7KS3BvMndeZ+nvZam1dWq6syvG6OAVG
	 ORpzRu0D4DujSt5hn5ti2pIVdJ7NLAaUg0GLvvimQjbg4MgKc9Pgd2QUU8JC3it4r8MN+
	 LqikLVlBwBY5UfK/U37FRmNvhq4dM7JsqTav6XMPRCWI/e7S55GMkmevpN3oxmWb4gjb7
	 L7SJpqAk7Sy38WCHsKyYcMX3evgOJvdZbbZf5oNdOcDcTc3eBYA1PehKUqTPv3cazNrh+
	 KJH3aapPoanh+z77CDrTs4a7azaKKSBnwuP7JsPcUUzw5UCcc72BFlu567iUBvlWVoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M3dO9xIM;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61285606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61285606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M3dO9xIM
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91f332a4b2eso9323386d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794676930; x=1795281730; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
        b=M3dO9xIMIoKOnSnY2bPPCeRzDdaqWK0koUHopx51iQpTcL5qZDdVMjrpau4qXjCHZx
         0aqVEF7JmZwgkfZ1M/1iegCnfNHx8yU5lqQw1LEdQ3LTGmmxSCdgVXCuHbuHlbAO91wc
         CkKhJY2D9fg65YvvUmXNRAaPm1a/DfRrFiyjaQzSZOlRb62XcaTxkeILljWSoLP+ZyqT
         vo0F3rbVU6rDmpNA/DIZn7r1b2RlPg6T3JDYWQPnFAXpVYelQC76bmqaz3Ld9cuDboJj
         8QYZBb/STklP5hQ/c1TlXQ4QjluIGkqOnx3IPF4S3E630p8juWmdCNrQB8L7mMQ6sp6O
         N68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676930; x=1795281730;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rHSD3+ZQwKzYQnxgJEPwedfPYdnuIPpqgShWvy752w=;
        b=SapvZGD5EquhK91YToHL8Wdz3/I6V89/BPogxIom/I3emsCeqEbOjc32xC+b01N3FH
         GzR720h/UKr7oyipCCNdGSAltrG3Y/Sxfqq3NJkbMeNqRcxkq1HgMg+Krip6nrOzPkbM
         VoDDqf4cgnCIzPChC07mYbiSky7OsNteP4EmJEhPJu0J7xOFNQ3L/E9GgoZ4StQP4VVL
         h8kCuciKQyAO808A1jMF6L8JB0EotuyiJGsOcqxJ01iQmM5ZLpbY7fZhPB+Qw3Ikn1S/
         wrKG8uBziQ6tbtlZsDnaFE4s0cmE6xo4FDP+G/K+5DZfkh2h9Vvc3+Y5PqdpKOe8aLqw
         w7Sg==
X-Forwarded-Encrypted: i=1; AL+hErGv2yohABAy/dfYKYCiKpbiIgaGsJg1PszjI8gfGmgosuYTqkVJMGVOtz5cm7x3uvmiH0Tgabn2SCQgsPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qsGtedR0S+2smDhwxs+6Spn1GQvddPVrLsaBPEiQS3jFfEo79
	Be95RRj+gDHqD+Whnp4N98kXME2MqRQJg2Ea1j3i1MXgslnMGQJs6s55Px4wX4hhdOI=
X-Gm-Gg: AYBFou0e1JxT7nzbm8r0Bxc1HRSzp5x53LnSpaol4ox1zpE2Ap/r1M2gj0pjUyEHc+y
	VBAAgQrZZqpUF3qK1vLPbtZE0wu7h2F+Hnvjb0NiEKbf98wsiii59FZSf0z498EbTSQDE/+xHN4
	32pMo0XxatieGIR6KvtVvvltHGtCp+ScHToLDXBUonRMHaIU2WKYgjwX/Xti4b/OhDaRO6UHUxv
	/yB69MlE2yjQI/oAm+o4XKhVEOsOtGqNWNP3e46v8nFgJieM6v1eS1+iCW2Akg8HVasXuhOW5lF
	s9YVcEH3dy6ZqsfLcht7gSYGs23ZoDcQK80UoeYDgJGBi8S4NUub9FB5ZmJ19IQ+RJpcJ59xObk
	9EXwgK44lmXE5FYXWs5fe7Jo0VKxAxsYKz2FirepUYaFwq4D35xqLGYhhFtbuk/ndoz+56eQRhG
	PFbt+lfVx57jLzxPWYtZR5DGJmCyfDI9eTZlj7Qp8VXBcE8vmAvfBOw6tAMc2zNPuB01zMAK0nd
	4fNOdnk2uTH8RduLDFhPtlmQXGpplX6ic1Lh1CJhbQ5qoSq6o19nIRfzhQTjHmpHKH8qiIohksx
	in4iaqd7PYlI/ZTxIS/vZW8IXt9Jlhti/PCqGAg6RQ8FBUI0T20U4oWAJ3ry99EF7/zJNZoJ18f
	7PWOeSGU=
X-Received: by 2002:ad4:5ce8:0:b0:91f:2e4a:7993 with SMTP id 6a1803df08f44-91f2e4a79e8mr70102936d6.14.1794676930211;
        Sat, 14 Nov 2026 09:22:10 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm47177926d6.19.2026.11.14.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:22:09 -0800 (PST)
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
Subject: Re: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
Date: Sat, 14 Nov 2026 12:22:08 -0500
Message-Id: <179467692882.482102.17918264505505182751.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 22:36 +0100, David Hildenbrand (Arm) wrote:
> Shared policies can retain separate tree nodes for adjacent ranges with
> identical policies. This can create unnecessary policy ranges especially
> when individual VMAs cover individual file ranges, and user space sets
> the policy on these VMAs independently.
> 
> Extend the existing replacement handling to merge ranges with equal policy
> at either boundary. The existing replacement loop will then remove the old
> nodes and installs a single node for the combined range. This also avoids
> splitting an existing node when setting the same policy on a subrange.
> 
> Extending either boundary rules out splitting an existing node, so the
> allocation retry can only occur with the originally requested range.
> 
> This change will make it easier to cap the number of shared policy
> ranges per inode.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced some bad effects by setting a policy on every other page
shm policy across millions of pages - then setting a bunch of pages
individually to the same policy.

Base: merge never occurs, 1 range per page.
Patch: They all collapse back to a single range.

I was also able to reproduce a "BUG: soft lockup" when a file is freed
after creating millions of shm policies (absolutely not realistic).

I think this commit is probably fine to backport, but I agree it
doesn't seem worth it.

Have some thoughts about the limit in patch 2, but otherwise

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

