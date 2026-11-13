Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606577;
	b=Hv9HSAFW4yc3IewlBV79H58qvrl0PvjvPXVPjZW/EbiY9nODWQuF1YJYq6q3spNt1SI6
	 SJMRRyo1nXwHeiWwbbyiLBhfqgoF5I20TC8BZd/tNew+2F28hYpR34ukTR9ZFcfHsUwxn
	 s4cL6U+ySUQWAVLXzXytnCiHjxZFgi+zDBajxEayLRdOz7l/FbxeEvwhWIRdA6ZDLnPTc
	 GFoLlpNId6rmyhUnEkL4PUF+MGvMgq17rNnjzOt4/MsMFIttMozfqAGuKjZtp5bxDqq0C
	 m2YOi7Tt1vls066SI5CdofVvR+7Oukpdo/TvDWIL6Er4pP7YTlXiPgFQ15j1jg52jNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
	b=qdXni5jzOBcWoY4qhgQfb05GkmSrNtzhcCJRR3pnLDKMQEt1/nriZMGFDvABVszoDm84
	 T8Aw0JNJpmuL1DG9CZ1T+B0KXV64y8hdKM0LQIPeYSNAZxjZPm8Ob47NQ5VAWuIpIr6uK
	 cyBSgQ/BjZm0xYX6yyMYjc9PvlRJpbGx+GeTQzw0ogsagb8kcbJxsunm/aOKBiLsnzRSf
	 6kFfbHrYiNlbghr/q44e/bXM0jrFvmjooZ+1rri9rlruGkKaWYH/cF+H5adR4KdXzx6Kn
	 4ws2e9RZFtxYVocAuOB+9EKCZ/PN9BzvsTuYFsO2p6ACD/drdU9fVPWZzJhod4fIfuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ghqIEHNU;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63D60A263C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC63D60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ghqIEHNU
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso33065466d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794606575; x=1795211375; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
        b=ghqIEHNUTk/Egmeku5ypK1Wz5tcQukr5e5ExNt3NiqCSADJ0H6FB6nWIAfBthKyuz7
         4Xqameh7l18qWPZ3TNz1BUzTHaARTohdL3Zd7gjqrhsDglIKqLef65F8kUYnxrTHB4Zl
         bo90KaR3amttm01kClcxvL8wxycMxohW0EzetFpZWf0eNdqqGIY93nDUjCPEnaGY27q9
         4xOOCpH14vnboktINgLxJ3nanxglA8VyNnVQlMIBaWnV4hH39CJiaU9+ZSZ7HQqRjie5
         Fkc9v66buLfQpspMAvkyrwDNPEy3EEqInyN3YC/kybPSgnrLKdkX7kyCs/WKaMEkqq8k
         2TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606575; x=1795211375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qcsr62uFOhvdCv1Z4CFJXXaONdJiHRFO6Btz2367L0=;
        b=gtoYfz2d6XM182+60rw6Kbh3jZl6fg6uWNlvvhIV6g5HPnmfhTudpaQCbY9IRtKeQG
         cTXh+D1cnbDMddd+MZxyKEBvUJ7zNnbGBRyD/7bzK7DX70/r1TxVu9hviBTqCW6JDpcq
         DBCfgmqJN/TP0vZ8RR+QcJwIqnRpOxwPd67s6B0I8ZhH54ApAeoinue0oliFWjM8U/A4
         aVQ8Q9jpB1gSK3bNCFvnnYMSjhvtruZVSFxNa8yD1G0nYJ02NjG0G/aSEiF0qDH9bXDT
         yCrn3cfsd9RgAamNdly1WHmZi7RhObRM5ddkc3PtVZAVeZULR0Q6nkJdTbWUI4+5mKWX
         TJXw==
X-Forwarded-Encrypted: i=1; AL+hErEuctQywMc2gFPLwQZrbRfMar7yM1nisttI4WEClfUaz3aiPv5o+D/yQtwuSzj34kCSsi9aSuvdubKhWEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F34lwSQm0Wmpm9MQM7/NNtiSBBDxT8ibn75OfTbC+agnViXqt
	FqutcTz8cocQi3QFLbDrX5RfKhC8JtOzgYS4UllP2n5Mu0ijm+vP9FdOMrLyYvo67LM=
X-Gm-Gg: AYBFou3QqtGVLjcoy9i7OPs/tRWLdzCTPWwLI4WP9fCIk0mhYgz52qPYU6vBn5sVqS7
	AbQ63Xiw/rBmalvYkfNc6lBO8xJAiIsxXtbuFLgVoXt3A8B//L7jrEmej+W4MDy+IRI0jorrott
	BA2MPjlCw02OozFiaYW8L4a3m4/3Tyyu1Zm/JHauooKmycyLguA8vwNrQa1MdOFpD1qBh1RfhQa
	4Zm4MYDBzJJZL79KQn636SXpjqEekBo0/C+G+ksMWvIsG3sZYAJ9IMeyLxJrcOF2xp0VQq0SoRd
	lUMlphi64b6UnOzgtxtB6AV75aYA3MVkuvc8XAaNeohBBatsf0kQfh/Isyb2QYeesf/Rp/xpou+
	118IMs3gvwJnMzr08J/XGlZcqduyLrIh/pbZNN9m5iIW/lxTnadI1QTb/Tbxp3723o07sQy5wjh
	/5tvnIPyUihFckeKY6E0HFgbIi7mL6ovUs2JnOkFT0U1otlroGeqVHWcKqGmvaXsS/ZjOZNd9n1
	5M909Cmi3rH4V7FVKhTLsIagunLaQSC02q3fGhiBj9ONlLGvkCx+U5G/9Wp6gusk91Z9L9jJBNF
	oqDm03UOa0yFIogLRQ4MeDPOIQJENGGTUPmyhoZwU9FwBQxkGZO4/m0LF2wBXZS6RQaSASpi54f
	Qdr9nJGE=
X-Received: by 2002:a05:6214:5784:b0:91e:9437:95a6 with SMTP id 6a1803df08f44-91f24222b57mr56835466d6.47.1794606574483;
        Fri, 13 Nov 2026 13:49:34 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d459c6sm29868656d6.14.2026.11.13.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:49:34 -0800 (PST)
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
Subject: Re: [PATCH 11/15] hugetlbfs: do not grow a sealed file in mmap()
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
In-Reply-To: <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
Date: Fri, 13 Nov 2026 16:49:32 -0500
Message-Id: <179460657279.482102.3328777708780344971.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> hugetlbfs_file_mmap() grows a file when a writable mapping extends beyond
> EOF. We are missing seal checks similar to hugetlbfs_setattr() and
> hugetlbfs_fallocate(), allowing a user to grow a file that has F_SEAL_GROW
> set.
> 
> To fix it, skip the resize when F_SEAL_GROW is set; mmap() still succeeds
> without growing the file.
> 
> We currently also allow CoW mappings to grow a file. Disallowing this,
> maybe even only for read-only file descriptors, could break existing
> userspace, so we have to be more careful. QEMU's file backend is an
> example user that might rely on such things, and would suddenly start
> getting SIGBUS when faulting in memory outside EOF.
> 
> So be careful and focus on F_SEAL_GROW for now.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: ff62a3421044 ("hugetlb: implement memfd sealing")
> Cc: stable@kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: drop comment; simplify+extend description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced by growing a sealed memfd length from 0 to 2MB.
With the patch, we stay at length 0.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

