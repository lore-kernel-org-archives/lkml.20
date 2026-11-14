Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678305;
	b=nZr/9Q8d75seSFAdObxvKiRxNOgxv/yWH5ECH0kfZJtoSN0TDnzbo7dXAESHZvXdF7vB
	 NzBAwynZYP9j9kl7jvbbrm9m+wzfnlOswvoaZ8D5BIXKJhJHvC6HqdqIAr2T34pJTToeY
	 q7mBjglvfX6Ivq1oG4Dkq2eyK6oAXJeTsz/zxhqLyX/586VzlBkknGrLFn8WWnecIluZt
	 CE0qf8C+bPUAh+f/CzXxmP/2Isg0YoLrKeoMXtIcIYbwRKGUdmv3PSQUIbTJXLCYsjsUF
	 XCjKUws2MMSEGJfUl6UcBhC7obGrF+0I5ZKJDAdWQIpMgv5BzuuW9txNoA9EsWnUzbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ZNcZMolhjI9akx8wnIcso6bAnFZ7LtMgZRZy+seyfFc=;
	b=G4YuKMwrUQPtfnAIRLIcblV/a1vdFNNDUwKE4Np0E07b3eEd4WjzGO1vGUsoqn8MkgIy
	 ArZI4QziQ0D4BFdLeO+4l07ru5usArvblqvYmjRk/N+NE+yBSY+/SU0Jr9qkRJQn6ivRm
	 JebZSeS4Pw5uCSNuRaAOCPlI4jw8w05z1rWCBwTmJOmDDGNJS5EQaWUCQDnshBdz6ij/y
	 etXDRYH+xSqrqWdsyy6zQC14ozgadZnEoSH4eF8ENnz5JOzyNwWrBY6O2I2E7gGuMgMy5
	 +IeXjwqGW08pJhCbZUhjEFI+fVs0ET5lzZNjSgTIjR7M0tzvHOPDjPEgQR7DMc6nBSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="MmWE3/tW";
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8194606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8194606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=MmWE3/tW
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f0ab17747so32447296d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794678304; x=1795283104; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZNcZMolhjI9akx8wnIcso6bAnFZ7LtMgZRZy+seyfFc=;
        b=MmWE3/tWVbBtF8EcqqHy+PVeL5SSlcJKpP6VzS0tSTNZ2fAANN/mjeb2XKUMnYOGnt
         fS7SPnLre/soNOeedBOj6usNp+QZWktQVRGGddD5xas5spd/gD61hYWBXaHU1f7LSdPo
         bK8uKTvij0ptR88ShH5mhzY9iqEzp+SHQCjXzVtKMzPH8bnKh3tKLARb3tJTj5Xk84j+
         57zNzCJH2LXVTRHwrBigzqWgZ2tlkMTHXah/csAHOyHHZ2Qpn/t9n7Prea0qhwuAyV70
         tipj7gdjHgvDatjTm9WXPyj2RnA2biRVYdIFA6vArHMeWI3Lk1QNJoRZo1702R+InuiG
         Pc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678304; x=1795283104;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNcZMolhjI9akx8wnIcso6bAnFZ7LtMgZRZy+seyfFc=;
        b=CQQERKCgJFRVU0wvi2zOcteatdOcxM5S2wQ+ERKApmxgyCFLbra5feJ9Te+cQjTXQr
         mjwwBk4MgKTjNhLo8uNons5RnHgJV3+iGXtgCS75eh7LPCZ2vFxlSJ2jJMlcmmDW3TP3
         XxVJSDM+W10cdQGkdrJ0acpiU9GuyA+B6/ZHqEomfUPVAt/yRniOvNz6UXsvsrQHvTM5
         WchpPfaYtOFdXleF0V/CeIaRmcOVX3zXj45dqDvxq/IwbNgk7TD3uL9ir/nUk07DwbSY
         68rjbfi0Y81ZOcgIisolUZVYT0uYSm7eR3XbXJQ+QrH5HtdMbSE3TiYwMD1zYc8Ri+4s
         WMjw==
X-Forwarded-Encrypted: i=1; AL+hErEHwo+rbxjcSvURaOEUsIMF8jkjbHzNJsNUCEhqls2P2bT4JyGe5uN7iKDvmo6+HyQUekXnoREHpLJtC6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P6I/qc2TD9V0u0mqYXXlSWWm9viItRrYuaEcZWkJFW4rFC1LY
	7XKlWs2MTEKN9GRb/zrb5xCWh/QpHytD8ITlY9tD769qwHC68cGu24++PIHFPde1uFg=
X-Gm-Gg: AYBFou1Y2nadZ6nPlghnAuCRZSg7aCeAGGpB3ek4NWnDx4eh/a53MDETAsUqy0Of5Cc
	Ri8U4Ihf317SCP1cO6PhW8cqDBx/kBGvtzlcHSxjNju4Z331gmKDZ0KN5IBUHHOr3eUFGhp84dx
	jAVq8sa3N1JHpdTqaF+23wS6OP9w7vIIa4u6KXsuWahRAMbXOgV0gTlZi/5E8lq8zhM/liicJ5q
	VhJKZZHjFR+Pztuv+dgeFwiFA+e660MX/S0N4I1NkrUgk7LaXR5vPcrqVr12yAVn1n3STBs9+Iq
	4GnNGCFsB+YI3MEprGep8RFBwnfSwAK1kfI0CueSe5vbIZEJ8qW/+2xFqCvoHak+QRP9cZVgWqx
	uvOY76b3wu04rcFHL/GVPNRRgnPfy6QRZPVI/ymQeuRhjj6dZsC7/sFYL9FOR6b1eUHWMx4Tqi+
	PxOkQP9wkZKfwg/yKxWgXf39kHQEynZ2C0/aHBpOiDD6xi3Gbt+f0T5c3UqmV0JB8xexuTRDCnQ
	gFsNmINdN+q82mwHiINoWJt4j8nF/I1CdAmguCI0/BAuzjFstGSVhZmZZqxlhOCRDudhLtcx01t
	RpxslC32fvy5vUAnE3UpHx0LfutlfxxbhEWBbtQNXHPGf5y8ej7FApHsxmjwgGc23vTrGfPPHq1
	zwkObh3s=
X-Received: by 2002:a0c:f409:0:b0:91e:747c:f833 with SMTP id 6a1803df08f44-91f2424b367mr92045736d6.46.1794678303872;
        Sat, 14 Nov 2026 09:45:03 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73258sm47539586d6.24.2026.11.14.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:45:03 -0800 (PST)
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
Subject: Re: [PATCH 12/15] mm/hugetlb: keep surplus folios that are
 reserved
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 Chris Mason <mason@kernel.org>, stable@kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-12-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-12-a0a033db180f@kernel.org>
Date: Sat, 14 Nov 2026 12:45:02 -0500
Message-Id: <179467830214.482102.2328406932805572650.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> free_huge_folio() may restore a reservation, but still returns the folio
> to the page allocator if its node has surplus huge pages.
> 
> For example, start with no hugetlb folios and allow one surplus 2 MiB
> folio:
> 
>   1. Mount hugetlbfs with pagesize=2M,min_size=2M. This allocates and
>      reserves one surplus folio: free=1, reserved=1.
>   2. Create a 2 MiB file and write to a shared mapping of it. The fault
>      consumes the folio and its reservation: free=0, reserved=0.
>   3. Unmap the file and truncate it to zero. The mount's reservation is
>      restored, but the surplus folio is freed: free=0, reserved=1.
> 
> Besides losing a hugetlb folio that is required for a reservation, this
> can also make available_huge_pages() underflow and cause other issues.
> 
> Keep the folio in the pool if it is needed to cover reservations,
> including any reservation we just restored.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 07443a85ad90 ("mm, hugetlb: return a reserved page to a reserved pool if failed")
> Cc: stable@kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify comment and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Was able to reproduce the issue and demonstrate the patch resolves it.

LGTM

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

