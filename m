Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346503;
	b=kO3HJp5yEsb+3dLFTas87ciBO1O/aSEzqK+hPtRV/vh/YW4eY8sZ2bgMhXZoisDi8sxS
	 9pkGppZclYA0ghqJiECPSSgANv3ADHo3QumcdQmT02SR16GxJ/PTUujOzA50CH+cx5xPh
	 oFdYpdyX0oBosxNCem1i2Q64iDZaeJoVVFL5L6GAspWiH78Fj2M4O3/zbEU9wJgIfDfvZ
	 3BcF+obiULivG254KNURP6b0O6LUTCqUVsQS9UE8njcVk+PGAdqU9MEAxJlKpMb3oYnvd
	 f6jzp6+zXM7l+BBQaKzUgiECFqlp0L3IoXjtzwydO43TuIzOj4R0xmwNwGwN3GObc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
	b=R/wXP1INEy3jmEUK+NI0Jax49s+Kw/N5nWwq1m2NoezuylI5Gfuh0IbdndQYN82z8J0S
	 nVI7cYXp1lYUGbOntrIuwwUQ2y3ZMH2tH/2XLLSRhcb2st0PFKUkExbr6AEE3STgIeOWf
	 VkxhzH39q90xJQJKNHhsrmjMNh8AhEjj22OkN3z1VgNVGCm9hrynzjO6Ub9/nt2OrUC0W
	 ikNedPoEqIHhOFIzDlYj9OAxRaGKYPFQvHdt550Ta5cpaOVJjXQatKKk7DV6ScveRQLZc
	 louqXSzYxTwCwQ4KvItDKkgxyPXXsBMli7q8A8vbC27rzDl6iyTNCtP/ruTrjHq2xkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQ5xwQ6H;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE31606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE31606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQ5xwQ6H
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4910b863b84so1664383f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346500; x=1794951300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
        b=cQ5xwQ6HxvcHCdVO4r6Zx1QKFnlw5WLHnAF1G9hPEgTyBn03UOrvZjE9idlHwO1Ry9
         Ua4VMMAmZ4MUqxSKUEOgOuNZ8EZlSYLFOQjjxypNvGBlSnE00SnaVz/OC3Yd/f/JKk3d
         ixozxVkn48kkO2fGlEyzbhH2W2i842magCGSlXzocmY234qZXqjWwV7fXieUZgClA0Fk
         YKBkqZje0zuORPfMlu7J2D8lQ2b+Dg4ZUacCiwBh8g9bF129dWhdYYppNulvfYEBvGbV
         0igXXgKVF8NZwyyzVntYU55XI+ye345Kd4eCvg/S9bVkz95mzJRfifF8IZHZaI69Klde
         HUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346500; x=1794951300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOqbf5f8IOrYsXobBY3T9L29gUMiYe3oysuU/ey3bJU=;
        b=B0lXk6UIn4Or5BDOtoDTFRJ6IT7EBoLPlhMqSVDR6XHxukCnftWK5y4wecxq9d6eB1
         L/9cJivg3mufQYKerkkhP+uubhHs3x+/qsrqhB8WyJ8rB7DbGLyn1hETJov8vnDlYIVq
         i2uVa3qvL7YEZa3O1aSQTA6HIXoN9KcVJKckseIv3AchwIZkwbXcmRMLwYZtO7e56tEt
         AfctnTU5LwkVQg4rEbOolPa/HSl/jmchlDkbrh+JRVO9D7AJpis3SRXgKZQHOlqamqhE
         InkpTAxnTdIxAjSaOcy4JuN8vtbwWSIc6ytsjDaqxyloqudzSFfR/JRWrHtGmIjrzi5Y
         DVog==
X-Forwarded-Encrypted: i=1; AL+hErHkoRwKy6x+hAEssFebTZDG4pCHJ6kWPVnRDTSAWiiBQJOxK0kbTIdkd1PIcB68iYKgu7+BuTzASpDbMZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xOzRw0cFB4gEogpEdNAm942B/FpmB4azr3ctGKV2kHpuMzqIb
	PgAE0KiQzsd/A3ulFmhmc51z6JSNo0u0/ot+XfZtstRlupXv1h554Gud
X-Gm-Gg: AYBFou2JW1ZgYoo0ld2Ee9IeKnVRF+YH+vY79xgH3a4rtkLzBZkWN9d6wZgM9b3wmsY
	4CMK/Cnw58BEdGNs297lbvkH2/t52YGkXu53YPyXTcYNdzIfGzm7WVrvjfYN0f4OcUl8bJkOJDD
	AhE2VjjgpQOlBha7V7gcn8WyXhfuCmsU80hu4o2DhnY6mhpEburI8QTFLjx3wFbAEQQsHyL3nt6
	GlnLOhopoOnV/KPhjR9oQQ1G3grEFagIjFvwnXb3e3fcEgFF7HLa79jp8ZHcSnus2ZA82Xq1bWv
	RMwZxJ7aMyLaVuCNtO+OXRWgMJMnYO6MjQ8g4qhC+ZNBc79wZ7P4ty0A9lCb+nf19FuCFRsJ2bb
	I3Hnse+3E0/6bhZ7MfPOI+adXEePtnw/6Lxo/kgBukWzam96fa1PvRPDfid+LpvshHcEw8pqDt8
	pof44+B55rvR9focbWt1Rscn40fAe5eD1R02cSB/7bMjJOBApQzGHXwhzua9q1be4v1Hxien/3H
	BARMnZ353PGL70/qKMOdUIPjnm4KXh3aNAIqA16npdZswU0OnO2QSZjrb4ix7VCY8i+dUc2H1x1
	iJlHS4kn/weFZgbHyNHZDp6b
X-Received: by 2002:a05:600c:364b:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4ba08e1f572mr8423245e9.16.1794346500171;
        Tue, 10 Nov 2026 13:35:00 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm7670526f8f.52.2026.11.10.13.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:34:59 -0800 (PST)
Message-ID: <cbcd04e6-b0c6-4a8b-9f89-4f57a4c50864@gmail.com>
Date: Tue, 10 Nov 2026 22:34:55 +0100
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
Subject: Re: [PATCH v3 2/9] mm: limit pagecache folio refcount when splicing
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
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org,
 stable@vger.kernel.org
References: <20261110-refcount_overflow_stable-v3-0-318625d63a98@kernel.org>
 <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261110-refcount_overflow_stable-v3-2-318625d63a98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 9:35 PM, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject
> additional references when splicing folios into a pipe if the refcount
> is at its limit, similar to how we handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Introduce folio_get_checked() for checked reference acquisition when
> the caller already holds a reference. It warns and fails on a non-positive
> refcount and rejects additional references at the limit.
> 
> Use folio_get_checked() in splice_folio_into_pipe() and
> fuse_ref_folio(), returning -EFAULT on failure, like we already do for
> pipe-buffer duplication. Similarly, make try_get_page() use it instead.
> 
> Likely try_get_page() should be renamed (or removed) later, as it doesn't
> match the folio_try_get() semantics and is confusing.
> 
> If we hit the limit after splicing some data, return the number of bytes
> already spliced. Teach the callers to handle errors, and stop
> filemap_splice_read() if we only spliced part of a folio, so we don't
> skip ahead to the next folio.
> 
> The check in try_get_page() also covers pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Note that we deliberately will not fall back to the slow path of copying
> the folio, particularly as the folio might have an invalid refcount. If
> it is ever really required, we can revisit.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM :)

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
