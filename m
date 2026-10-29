Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793307227;
	b=iag19jeRuDSAqYcS6GmYnC/Hg77LdU4z0TDOzG11hm3ZtTbHCa7VwOBDksTYDNIsQ4xL
	 T44n9CKS5pPKRSxDWtjbeE9HWuuAeH5vWziiFJcT+YfyTrw4SZZylf+xK/id38cuFWMtR
	 j6LG1NLANQTp03NT2PbdrMOxyctFtvgc6KlogpFnLBwLxGU23zrOB8Ysf9/hXqlxCVAPz
	 aYg7h/k34Y0wuNjjQYzSpFhlK6u9yQM94yLYVenTaHFKxUiXOisp6YAgOT8Rv0qP4t7ZF
	 ELZTM6nCEdcKyP6A0cM9LbSyI52AY9MFzsp/Gennzc+6xYTGgzRHOwGZMSFMlu5DteQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
	b=gbWArIQjooPNhnPchx7ei5NzAyzq71pPtct+y6FNcfWu7gRJHA6gZU16lJ7JWfEKTaCk
	 t6S43MTtevOfOpQjFq01ZghjDiOjHcYZeOD/u3fauisucyzZqGhO2HowL4Z/t2PAuq8cH
	 h13KuE6ETRTws5wDIOWXImVHL29dloNHa+Z/pMZP2Tetqwv4OkS/V/e2ssxmX9/bZOvL1
	 lsryrMthu+2oJpP6tAyiXzDPlBePLnGT4Cv101ClwU6zqnuaTWGlfF6WBklWZENIG7amR
	 0TSfCqVJVWPuJxQhxVjhvUIX47D+7NHDK3YnOWVVmbPv6PmRArX+Kwqt7DqgEpIFY8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X4ncqWDH;
	arc=fail smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2560A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D2560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X4ncqWDH
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso23935eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793307226; cv=none;
        d=google.com; s=arc-20260327;
        b=h4KqhXdXsYE025Pun4MqiOUG2sVpNPef1TAIRTf3O8hW3KeCVoVFrHhtU0/KsValzu
         1FN68fsH901URpQnKswrVu4SUE9M/gIIgfLxK/ML8sQMrh3u6oADjpNQmOxirfqp+24C
         SAnsTvFkZFaXXs6jqXF2yZQJwkOOt6kxD2ploxuBSL+L2jjPv9V57EsVdxpTGQyp8n11
         IHVl3TuntF6EjDrLhtLDH+nbHsskUPPCU3dlZG4wvAqXFFqIznrwlGZdCL/LViMhXlha
         EaOjKE16nyATlfe3VfHtQnRpb1Gx42P+Pb8Bb0/uRH9c4F0Zx6RMlXEEFQY0cdyC6CP+
         riXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        fh=0cQZCTO5KdiJoJ5gyVQbgM552bemCKLFvH3AHLPi1wY=;
        b=R/4RahR3ENdtVJDQVyvn+foyVusQu03xHzNfV1FOZPkg9Va1yFOWEHTU64HGaam5t2
         fzsdJ577ftMbG9phP7Q7/ut0PCQ9j8ov2QWRclRNPVjyhSFoUTdkqRragvbd4zJsd+aD
         F9PlyHY5OJGHtpGMT7tBWQR9K2jp3o3rwv3Cfy5w1vZpngCn1lLyk7IjdKDIG9juFjkL
         VV9bmTI89CoiQSnD/LVB0FL1b1UWEdCc23k6rv55tTGZDnG/xq1lRdykg4anor/ECU68
         sQdfX9uFJH+E8Eb6SbmaQCkQyqhamCKIJwKg8ULEH3bPYYjc12HGn+cHFzqFiX7/55jS
         rrzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793307226; x=1793912026; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        b=X4ncqWDHObARExJNzFicTAgGNShnnQyxHKRK/cw0fjeWbrVpO9dqNdFUtJLaHpfPe3
         3pQCYs5wPDyyeDRmHh6ZqxApAZowXImXkA1IiV80Wa+vN63OrMv6zHZ38w2Artqhj0kC
         TU5uAZwV8krucDNHMSBMsftqEv1zyLHEc4T7kkfonRf1QyhSc0K9tIEDxDosPnvHYJtU
         xrApcK1DGEJ0jC9G46yDslykO/UkCOdwNhIENzzsS6m5+HzjfiU4CekIHstdVmcDr6+w
         qoB3o1FiEmAOoeBr6eS4J+v8S4/RWAMAqqL+riJw8IsTfV7R0fo/ywFH88iTB5PhjqF0
         soEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307226; x=1793912026;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        b=0SA5FP2HW9iXaKU1URiXqyEO+9nZZdJzQAMj6Q7zuEOAB25qb8gVB3cdrEUHCcan0d
         lO7sQvpa58Q3VjBGuSrmVGwO/ETe4NKveOplxVqVYryXNXRKDDO9M0+q3ipc87A/03Lh
         onUjufsw++QSeqYv4SHOf5W3559TDpIhB0hIeQnbidFVMfeenxtD/oNnQixPQQFZMRJO
         vqBDCbStNF66Zjh/B1QBzdTjpeNGDDkiP3sP+dX8IxoiY3m17Xqt0P4HKJYxVZW0fGEB
         shqtLkVNzX5Lydvq2tzu2FHfqlWLFlawKKO2/8+YB5dKUbOw+RBuc1jlcOJtuSag+v08
         n0gw==
X-Forwarded-Encrypted: i=1; AKwUvByyVT6wn/DSWKqiBFiSjbFbc9G9yiFW94shMhiXxt5FcPv59I7UyQaV9eVEMnOERLjd0Go0qOYyylPlFPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYImlS1lwqyc6fwgA4hrYLxgdE7STLXZqgScB1Qw+Q+PvP2YL7R1
	Ii26gqFMKtKUlgpo6OOZwygYvVKzgPJpBVUCWQaIChv/oFmNUG+GsXtmfCrovXvo+G65bbzYQIG
	7xz9zhplj/nxzALBHUwdw5spTsuzfUBGGhtzo/kvy
X-Gm-Gg: AYBFou2d7DZlZ/R422YDt7uBv5ui0xvxyu2Nr8rRpdooMufqU7rY57aKBQLb9qDY+O8
	V1tCQzR2D81OqBOBv6Kdgkx8TwVLKvPPKSDq1ZSbojmhkiT7p6f0qJQf1SCX+FNS/xad9JBWBnH
	Pm/aqzU4Wl0lrNgiDpXp41Kxi2GWfTaOVcRW0bu7in4TTboVzw8CLbCAEe92XcybdWJQVl9JvT7
	4YdgC7dMHOUUwJwOE45RzAhVfOHiOc9jtnYzJSrM62fgaWR1b5FK4REpet5JHRCE8f3/z4UWCL+
	nR0Ya4PBP4vPJWF3zqTIGjyJWe4qiwI2EB2gMyMRIUoniShquhwWhC5UYZx2NeU8rmswQ/HFGqV
	CdOtwyhLOjSuWr+98TjDmNPvTo968G2Jip6hqxvqIxEA68HPPE54bNXzT3Yr1XIg90bYCpLyZ0l
	0KLbE+r5EuvTqfLDjXRmD9hJ0=
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id
 a92af1059eb24-1ac5bbb4b85mr358477c88.9.1793307224406; Thu, 29 Oct 2026
 13:53:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 13:53:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org> <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 13:53:42 -0700
X-Gm-Features: AclHuK_vfygndkmig7dtJT75402KjRWCrBeo-qQvow0jlIneeAJCjzWqgPCqOeQ
Message-ID: <CAEvNRgEY1uNs7F+ZPpcbx4Tgg=9r+f6nYpPsnm7em0+2YMq6cQ@mail.gmail.com>
Subject: Re: [PATCH 01/15] hugetlbfs: fix integer overflow in fallocate()
To: "David Hildenbrand (Arm)" <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
	Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
	Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-s390@vger.kernel.org, luojiajun <luojiajun3@huawei.com>, 
	Josef Bacik <josef@toxicpanda.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> hugetlbfs_fallocate() rounds the range end up by adding hpage_size - 1
> to offset + len. vfs_fallocate()'s existing overflow check only makes
> sure that offset + len does not overflow.
>
> Once we overflow for valid endpoints near LLONG_MAX, we can get a
> negative temporary result that is then converted to a very large
> huge page index.
>
> A one-byte allocation ending at LLONG_MAX can therefore consume all
> available huge pages. Pages added beyond LLONG_MAX are skipped during
> inode eviction, leaking them and triggering the BUG_ON() in clear_inode().
>
> To fix it, calculate the end index in a simpler way that cannot
> overflow. This also fixes the signed overflow reported by luojiajun in
> 2019.
>
> Backporting notes: without commit a08c7193e4f18 ("mm/filemap: remove
> hugetlb special casing in filemap.c"), remove_inode_hugepages() must
> include the final huge page during truncate and eviction.
>
> Reported-by: luojiajun <luojiajun3@huawei.com>
> Closes: https://lore.kernel.org/all/1554775226-67213-1-git-send-email-luojiajun3@huawei.com/
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Fixes: 70c3547e36f5 ("hugetlbfs: add hugetlbfs_fallocate()")
> Cc: stable@kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/hugetlbfs/inode.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 01c4d6f44ebe..5592cfc6cc8b 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -721,11 +721,13 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>
>  	/*
>  	 * Default preallocate case.
> -	 * For this range, start is rounded down and end is rounded up
> -	 * as well as being converted to page offsets.
> +	 * vfs_fallocate() guarantees that offset + len is positive and does
> +	 * not overflow. Avoid overflows when calculating the end huge page
> +	 * index: set it to one past the index of the huge page containing the
> +	 * last byte.
>  	 */
>  	start = offset >> hpage_shift;
> -	end = (offset + len + hpage_size - 1) >> hpage_shift;
> +	end = ((offset + len - 1) >> hpage_shift) + 1;

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
>  	inode_lock(inode);
>
>
> --
> 2.43.0
