Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915309;
	b=XW5m0aFRKZ3Md044qpWUIwSz64SsI00wYND6ilZMANidswET2u00TrXgMphmxsDyROyI
	 m/wMevpbiI3860UHqsbDr2ony/eSn/W4UH5YoCpT4fgr1OiIPKGJjavKc1An7pQTDgOOx
	 LMU2yu2XJfEzomhTkO+cxPbiyGY9MZ2yIP5A3Oh4GHaQWisDsXQ+8xZJeNiykw3AktDK2
	 r/q6LyXRml+8ToTFcdJZ3mzhuZDuEBn7pP8pqgN7MSV5fhfrtN7C/zopkYsDJjBjtCNgN
	 UCY4ZyDirwhOyL4RnUxuoBzalQqNeSBHCTxHy8gbmMMe/kwwLclrBobV3SCXCfUlu4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=U2pRTFJav8ucjqvUufNHSrzwm+2Gj95TGBH4a3gdM5M=;
	b=jk6u7F0OOXnv2RHGN74DANWVheB2u0+zH5jyjoORnAW/tbtTLDJ3R0WSiomYddclcqG/
	 m0prPHa5DGYDEi0Qzc0PlqnBvFy4wl/yL/nI/pTd2LsEitEq0GDjEdFFa2OprEkLb7XBI
	 0ZAln0YOp8+olKjGbwjA45qF+WGj7ZaXaBvUzXqt6Y+27/3Rq47Wkp6mDJ6tA3veAH8nj
	 D01vRcqTrLvUFcH79cvyP69MtBQlBLGFD9FZFHC8Ej7oiQz1CR/XMC6GrKISMLMmKmeIm
	 rW7m4gQ7ZydwnAm30humb61Su/hQ4VGNXNZg9UiszBxLq8LVeW5/1duSs4A/SkRBI4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JdbkmDH7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D8606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JdbkmDH7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20575e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793915307; x=1794520107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2pRTFJav8ucjqvUufNHSrzwm+2Gj95TGBH4a3gdM5M=;
        b=JdbkmDH7CEq2h6arWC4uEi6AP52p34Jhi1Tgdkdo4hUGZOpX9DSF/kpyKfykAyHi3y
         1TnlGiISrwO3OJpRTJEp6kh+Bn1N6GM+rblntujH304E0AKxdg4uALlFjI7lXbeEMH6/
         4L2yaYPirJxGNewPKR6kp/do8pFhq1Oty06MuGUgVhqerCJH92sEwUB8/gx5UDmkJDlU
         LXz5X8UQsyjbLfFLyeXeX3aVEGGwqPFOUyU/a7qRyjbODw6zTMOezwH2INPiybewWDW7
         5q5er9JeZOR3kXIi2ONxTG8R7dKziYycxqyY7LZ0oB+m7lPfj93a0rerpd5gOT0Yh2cH
         wdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915307; x=1794520107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2pRTFJav8ucjqvUufNHSrzwm+2Gj95TGBH4a3gdM5M=;
        b=WmhESUvNnIv4JhdwGkQIfg21Yuwy4+ZNysU+yFNsCfd55/Wjsgs+aTKfMK0y87EjRj
         7BD5aXP5KY04d7M6TUb0fm0lm8W9QLDsWNZJXzCZhXUZZ9RN/jdetPGkTZYd6/pELG0R
         z23HbfC97flPDIK50SxzImUwgRqPwxhnRynPMUL1coWQeNcaoPSToK/ffzyP9UNAoMjt
         BR2dqEW5QHc5cMiarHygbNLtPJgknBc2eAfYZT8aqG/SUWLmD7w9Hmfi1r5uMh+gT5ZM
         Le4EWYQbsfO8V0HtKCUmE1Eum/paaU3ylfkIWjOrTvBKloqICFwZCqcfpttuE5jlcBRb
         gCcA==
X-Forwarded-Encrypted: i=1; AKwUvBzD6UvVL7mTKmJ3gmYGgfISyhXDjXKB93tdCg/p8Kz5D4WGO6QMbrZi34wOs6xUB6v7TRqTKCzHwK4aM2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JwKj/1k89JZIEaZFseQ7FNivHnTsfK5NDCea2v9QCzfSRG94M
	2doWT0lkzmiT4TOYkn78vHK78YXjgHsR/ORTgc0Xb5TFoz5/5Yubh/wY
X-Gm-Gg: AYBFou2jG2uveFQ54Asyur0ZkO15gBoQ6aVmac/CMHsAG8a431RLXv+jLPTjmbygDHN
	8v8trknXOT4x5z50M8ARlDVOgbUxa/ADtU4tpS3hSjHGL+CKQnaDU3Unh7Zc2RczNOyylfJcri4
	HLVfVzpGon7ZjeXYGKtStGryvfFlYR+TDIOoA4yin8dMuhoFeXKwHoWAV66BCLopEq2/q7bZ3ey
	Jr9XzyYlfpdxLSTwV7rFV1XJM+jLuCM5uoyIk4xNLc82fzNPeYBCD7W8213ez6oUjSp61HRNVZd
	fAcGkj56q4bjESZfxFhJte1FgM26A9EnR7UhQ89/cbD6ZVZaz/Nd2gR5Go099uBGVIJeqYnMGIZ
	ObkmTEwGy6qTsLftrozeXwtOABbutSPdgNfYxNoQXcNNiAN9rvs05HsfvvTAnV4FJmqOoUI5ExG
	KbpLG58WYLompuRMrkjLE2565yt/fMucyDAL79m5xqSbp8C62ncI1yhovRRcG9JcBnioX60Ndgn
	HLkFXDcEmxxBS+41f5ZsKmrF2q22epb8IBxxr8ZjZBqOYTJpi4beNlXFL4uzOO2NggqM5I+iSxJ
	KmNNb96gIUAdJIH3FEA6HYE=
X-Received: by 2002:a05:600c:8b23:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4b6dea6984emr6969745e9.9.1793915306776;
        Thu, 05 Nov 2026 13:48:26 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm87112035e9.3.2026.11.05.13.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:48:26 -0800 (PST)
Message-ID: <51c5b442-7a81-4357-a1af-75cf552f05f8@gmail.com>
Date: Thu, 5 Nov 2026 22:48:24 +0100
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
Subject: Re: [PATCH v2 2/3] mm/khugepaged: scan mm's more efficiently under
 mmap_lock contention
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-2-4384bbfe4606@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-2-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 9:57 PM, Lorenzo Stoakes (ARM) wrote:
> khugepaged scans VMAs in collapse_scan_mm_slot() in the same mm until it is
> about to be torn down, prctl(PR_SET_THP_DISABLE) disables THP for it,
> mm->mmap_lock contention occurs, or all its VMAs have been scanned.
> 
> When lock contention causes the function to bail out, khugepaged doesn't
> keep track of where it left off, so when the mm is next scanned, it starts
> from address 0 again.
> 
> If there's a lot of mmap_lock contention this can significantly slow down
> collapse later in the mm, since the /sys/.../pages_to_scan budget can run
> out before the end of the mm is reached.
> 
> The budget is incremented (as tracked in cc->progress) at a rate of 1 page
> per ineligible VMA, but the budget is only checked once eligible VMAs are
> encountered.
> 
> Then, it only takes the combined total of ineligible VMAs and eligible but
> non-collapsible pages to exceed the /sys/.../pages_to_scan budget for the
> rest of the mm to be skipped.
> 
> For a system with 4 KiB page size and default sysctl settings this only
> requires 4096 ineligible VMAs/uncollapsible pages to be skipped before this
> happens.
> 
> Resolve the issue by simply tracking the last examined address in the
> khugepaged_mm_slot object, so when the mm is resumed, the scan starts from
> where it left off.
> 
> Additionally, skip to the next candidate if a VMA cannot be collapsed.
> 
> This issue was noticed during some work in which an mm was instantiated
> with a large number of small VMAs under significant mmap_lock contention,
> during which collapse was observed to take 10.8s. With this patch applied
> it took 3.6s to collapse the same mm.
> 
> Also, while here, update a couple VM_BUG_ON()'s to VM_WARN_ON_ONCE()'s.
> 
> This patch is also a prerequisite for the next patch in the series.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
