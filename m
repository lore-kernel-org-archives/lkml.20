Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606153;
	b=WS7TAwA1VXP/CtYvc9gIHCy/g5qIfpP/VDUANJxLcNAY/iu6M/tPuaFAB+fBZ2DEysPJ
	 dPa5SkXRbgWJRQ3GNWe1/6eM/O6akVYgLa22fcJKdPin6H7pwUagBldHTdBp4FOjm8Xy1
	 du33FZtFABer4HZF5Z1BVjPuGeBkZjft8VI5TbTTSCvTkC4k9NXA3K/X4/pZIEC/4E1KY
	 0UCNUbBSdQ3a4qrui6vLxRmqgiNUdDLSXeIPr4TO0NGrk9IbNdZlb1kMzNxwSEZcOrKtq
	 V3WUiAdraNrhiGPDwQlpcuZUTJKhfPYW3KNWTq4pE9GOQliszZ92AwePOoPSQsFj9lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
	b=2wgTKgT6H2frR4jqPwA5PTL1NwWgoLvgaUqyuH0id/81gyVHnv9EIhhGfWZOT0noBFi/
	 t5GMbNtDhH4WgAq2NVJ1OPRR8MujKGMMAI87dfAqLofeGUCA0x6drxxqEQw1qaK8m7biI
	 i1P/5uphii4QSJehnbKJvN2aV4amiA/43SrwqNlXNpVKmnheLPCkipW5qexkaqczjvd1x
	 4/Dx8mN0vVciL4y2QsSTLr7+eChBF4PcFfo1qdR5Ia4+016CJSIWqzGKSyef0tg9mtZGI
	 DMdUzJyDCIbmiwPAx1WcfJqA75cOPAms/9osik9CFHz/PmgQZjconHivK6QV1W6jsIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKNhbxkk;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A85606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A85606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EKNhbxkk
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365d725440so21963381cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794606152; x=1795210952; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
        b=EKNhbxkkQMORETffHCHxv+E20muavs46wHH6TSQgkwOKnkMBWgo3BRqE9adDNYWjJy
         zQvDt0u803Js/yQ/xoqMXeSOKFrPFOOfSJoo4mM3wToNSHCQYLMW01UMv2NrALxHTu5h
         1BKsWm9UIk97Oq6GlYqwEE9cIn2GNrup/GEMawiM0oNLiEcTbAAlcoNRt+Y3u+jnhl7q
         Ff+CjlTIZlIH6YG34N3i7rGeKp+IjYW/FeYl20DzdxfeXsbexBmN7BiSt5uKr6EoNKuM
         /dW15GIGFRQ4M8aVHf6ioFgdIR2GphR1luRLbU/sLdpNwfOidADbdAlqrJzVjjLlQ4ap
         SzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606152; x=1795210952;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwPRyHP2zyVmejGR1uh4JtlvqhjIfEODs3w+QBRfcJQ=;
        b=VjQJuJTFj06rUIyl0LW/vc8Fw8Hswn0KvXcUK7DGKA5f/fC3Am0n6ASkFtVnW2Poww
         93j7ZOj+j309tWmniZmeHh7dcSHU/Glq+KBiCPkt+0EYqVmZRpJ10BQBWkTuRiz0A+bg
         ZASRrykV1vnN4esuicA/lQmFDSeW9phzyJf6P9WseMyGy4NNy6q+N5Ww7uKL4wTMqwWO
         c3cIciiKuHgsPu+N4TjsGqikoxHNFl1NtljfzOrg4gXXP9ZlQ1cMOYQ4IjLWmEDzt/Lw
         0gedmnffbSCO9c/BGXFHXCkgKYA4kZHs9i/xOwziBXOkfpSZIfJ4NGARsTDS3ON0Cejn
         P/rg==
X-Forwarded-Encrypted: i=1; AL+hErEzFTH98I1uLbEt4+SLX6+Gr1rzIfpgbwlTk+GnN6OH+a2+R3s3E1cyPAz0bIaVeGUubBMAsASEGinmC+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjvKlFVT4jtZwpXwDRSTo8xXM1zs9nC4fgVT1wDIfe3STef9j
	aQInR+xlwruJfs8nlx7UhKQW6y4Q8JCpZa2ra7OrvUql/CxFkaH+zr0LVgA/0CA7r3I=
X-Gm-Gg: AYBFou0UdaOAFFN7zjo1aEIXtWDMG0YcgLbtw/xmDT3C/OOm2S9ipcl+59pjNh+9J8t
	eekdg/6ihTWckWvFD6h4liohnoNX4TbDwtBOyzAOrM3eCnAzssAxl/7V4NkuWCHsbwELmZb1Amh
	tOdr5iGqaxwBcrc68doPODLDI0KjM4556TJtNPINMrkP+uFHFCyAFswrVOLLJYLGlFeElx/saLI
	ZKyZuu30gWLJYTZX4Gq/fKo0kpJeI8sLRiAUej9fLQ+GvJW83XLVwZ7KD/5rcwG/FeoIJqiEvzP
	Azdvcf3eImPpoE/JQU2AzLS7BVA9EtDYHtc3VmD+0eASd1kwSs4+IIgkrkO28OkJzNBRhz8Htsz
	BrB7RU/FtHKs3MV9eVvPf63rI3ytq4gQwuRNc3FmXjgPJwUlmKH8OrKTAP2bnxOqODfczpnYoB7
	ReAWfT2tGFxC9Z3+yPgD8hrRic7Nt1W265StZPyS5vBffyD7Qszc71fi3ejTRAOnHMZKFwkwgnl
	Nlb+46VINBXSwn78YsWPoBbOWjy2hyB0oXcKy08oafdwCEhpC/6nxeDwYb2X3kKhd4ObjvSK9Wu
	872cJzSRBDq3RAXhAj9NoJx+48+rUlAonV8LrEgGxxoLosAPogrZIxbUB9Puq71s9zIhk6k7g71
	9DZYdkBE=
X-Received: by 2002:a05:622a:598e:b0:536:566e:6b52 with SMTP id d75a77b69052e-55ac7564a85mr62222541cf.27.1794606152109;
        Fri, 13 Nov 2026 13:42:32 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0349423sm27363181cf.7.2026.11.13.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:42:31 -0800 (PST)
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
Subject: Re: [PATCH 01/15] hugetlbfs: fix integer overflow in fallocate()
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
 luojiajun <luojiajun3@huawei.com>, Josef Bacik <josef@toxicpanda.com>, 
 stable@kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
Date: Fri, 13 Nov 2026 16:42:30 -0500
Message-Id: <179460615000.482102.14809359037930927808.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
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

Reproduced the BUG_ON() and validated the fix.  LGTM

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

