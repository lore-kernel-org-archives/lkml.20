Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904306;
	b=Sq5ZBvHo1zYEO+KkO2QFmDfejum1C3d7j28J3sASuXFaIDiqiI8H1JGwdONUcNXCioQq
	 hHZhcL5usk/D0Hnu/gVz3ZasTHSDnMFnm22uT7VaVrCTO4HFyHFcEs7BFf74LOJrgVPva
	 zzsYoIgvWs5jJ7wqTgTAhVgZBwxrHuMqKqjs8EqozJq+dI6SjHcRuPLZfh4x/JXSSAvcE
	 KRNVEnCqx4KAX9fGowK74lPplRefcnpf+7fQA9JlX7L7WH2ZvjnsUFPmNq21dpsQmDEy8
	 xxUlTd7j2m6XriXogOiAiLMdg5R4O9cO3Rl9D/ijKJotSAbKU/3hiaq+QB43yoZQiUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
	b=jENyaU0do/qB7qaBynYVIK4OfbHQ5uMBODFtgeA8Hos5Fme+eEw9jHAX/tHEuYnKuAGx
	 d0/ciyHCGf4676KMmcBak2wj32E/qXk1rVInTY9qm/SYhTsovu0Yii3A4wcJQ1VfPTcoL
	 4g34802iKYNEipH0wlApsgwRItLczEU/zKP/i3/3urYzMPtJMERNMsFFYZl9NshTQdYvj
	 Wbiro6VJEpP3SCyKI+2uyLlvv842wMvmSyTzx44UOWh+diKk/COm809zqYHFasUTYwcc/
	 m5cx5wS8XW/LHQWtOccYnE7wzleHDgl6eprrjJKWdDBVG+dTxBASeU4i3RRiIPlTWnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ourL8s16;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C9606A895
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37C9606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ourL8s16
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365f9a04c5so71688391cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904305; x=1795509105; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
        b=ourL8s16qvV/ByzrXiQnYSg2kF1A4uqN/AnfqBVQNPBbatZm3DUHQ8Aj5mDYNeanQ5
         MJwxDSueO/GwOBcCYIaM2431ceTkAtIwsRppYKovBOwmv3uilo2gi3HtSlXrxM41UOrR
         nIwd/WnpWNv0lDvrSo4gxjlev3eVFrvzyvPT32/reHLN8c1iROWdTpDcqLiwSDVszKTk
         tI9wm2+3jBJNt+T7vJIMKCVa+vkQ2GH6b803gnwQfkS8l1Bx4WBOwUeysmA7sm5XbKP6
         WiMR5/pZsgjQZYxksMerIC0S6h9yq2gpH5rpRHE1RZmPl0Btw+pchgk0cibqsJOcA4N+
         ka0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904305; x=1795509105;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
        b=JnLUWE2qtDnsXAqeRKHcYJwt80f3kGPLoAgAiyIYq3nX6iwYb9nzOX1iVg10+Sexcz
         vpVP73l0GftmdOXYH1efvCXif+cs6W1gM+OZL0gRmvPgHgX7uEPuk1uzS9TaI7663KiA
         BHeCplsnskL3CIxYxvcISGvbpDpJ7+MFE7eR/UyfYXqJM8KtrrEPrgjYZ9W6KgHWWdDV
         g6FBjC5V6jtkQSi1pR+IO2sEHA7ID6vB9GV/doQxdjJyf292rj2WmWGV99Ay1QAZ1Tcl
         SX2p/io+qIfUhAFJTLoPR1ZzB3SLlBPtPyTojVWBRZmtIBkUEE4kzT2tUZ3AK5TDlZ5i
         wpRw==
X-Forwarded-Encrypted: i=1; AL+hErFEoqVidqinZsLp7Eky2xXUSaNYwZRO6fNZpKT6WE27WNJXcpNYrzg9GLoRcvvEvMZg7gW17ONVjPenf/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fAxJppCQd7ZqiTviHi8IZXo1ku76A/PIhPO45a6XprJqlGgJY
	PpnpPyT3jIJo+d8Nc43y8fQIDIYAJCTZT84PC0E4TxA+HAZwtc31v5zVTqRCW2k1Ddo=
X-Gm-Gg: AYBFou2pVQ402zdyjQ/jwxydi3zjFja9cCIlYX6fqlBAlED9bjU+FHl4y60OlGhdAQa
	dh8uuMsogms7SWtOyfKBU5nr+HyZTOoPr33XaDdTcSVRIJylu4J96YC9u0bvatb3KWYmN0Td09t
	HBijCnhAs8Q8v8vyErbFdgwcseF/jAid1rQQji4r8OFLnuAn8IiyTvjk8nKMt8eq/0g7ssxatXI
	F3ATq0Zgyh6OacD/3q1Si3KVyV2WA/0BnfA94XqyIh9Jda52JzJUdK4qwr1Vmwlu5Mo93woU74J
	HSgY1q6xfMGutIxCrfnz1fmStnIJ8L8Ac6+rmytojdiLTbWdhwZeuN/+rKGqCPxn9hvCgVCVNnv
	gGih7RU/GyXDQZ51Uy5t056VyIkA+BVHewxUHs3MJ1E/VSscZUGvaIP+R05PHe6vURONRfowG2V
	4amyyZw4/UDkI8485ul5/wmwLt1u2tjEFAHWcxXaLr12GyP/xaUrBKgntfx6F3ClOpWE6QCXobT
	9HLdHwmRFHGyQ26pPftH7+3Em2gjBaxb0z360bn74pGQgqkst5BAoUOYwBZivcsgIxP0wQ41MDs
	jYTrO28qSwOpTf+3NDxzybQWXlEkf29IpU9McxvjaJuPva4Q0wpL9v5EeMZiOm1PNdw4kySth6R
	ndKcRHuffjfSJ+nSeyOfVC05xwVagyw==
X-Received: by 2002:a05:622a:258a:b0:55d:30e6:8d8f with SMTP id d75a77b69052e-55d30e6a736mr108004181cf.59.1794904304803;
        Tue, 17 Nov 2026 00:31:44 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm99694361cf.10.2026.11.17.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:31:44 -0800 (PST)
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
Subject: Re: [PATCH v2 07/15] hugetlbfs: fix unmapping folios from private
 VMAs
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
 Josef Bacik <josef@toxicpanda.com>, stable@kernel.org, 
 Daehyeon Ko <4ncienth@gmail.com>
In-Reply-To: <20261116-fixes_hugetlb-v2-7-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-7-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:31:43 -0500
Message-Id: <179490430300.482102.17633361840450824485.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> hugetlb_unmap_file_folio() assumes vm_private_data points to a struct
> hugetlb_vma_lock when hugetlb_vma_trylock_write() fails. Since hugetlb VMA
> locking was extended to private VMAs, this can also happen when
> vm_private_data contains a resv_map pointer; treating it as a
> hugetlb_vma_lock corrupts memory and can cause crashes or hangs.
> 
> Only take the VMA lock when a shareable lock exists, as additional locking
> is only needed for PMD table sharing. The fault mutex and i_mmap_rwsem
> already provide the required protection for private VMAs.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
> Cc: stable@kernel.org
> Tested-by: Daehyeon Ko <4ncienth@gmail.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: simplify description and comment ]
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Was able to reproduce a hang / RCU lockup pretty handily and verified
this resolves it.  Have not seen the relevant crash.

Regardless:

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

