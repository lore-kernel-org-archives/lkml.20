Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659922;
	b=F7KfSh2cDDU0X9DVoz9/gIVgvIZIn4Rz/2R8MmE90+YKAW84IP4/FKVR7guVFUzmTZ19
	 72o4uaX1h+2IuSdbED8FIieSk+ySyMwmuIdo0Lk4JbaeEI2rZSbJRcz5+dO6SAFZdf5uU
	 8oZGaCHlpv8GnXsqtVCbGTFKhNuRGLqCrCkDPCZdBrlqPqkIHtbqcBWHwdLeVqIaRfR4p
	 8ll/nFiSfJUKSMFhanYUXUjYrosAKjUjkQZ4NyWUnzO9GBZKw1ztyjRYOEqXug3UT/oGB
	 6Jl+Xj1r132h2PQLYTpmhoQeVnTyxLLlLw542rgq0zh+i0cDGFJfSYMK1VwIU0ISR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iYTz++wjFMvqtqXyscp+99eRXfkEkYxGMNfxByS7fDA=;
	b=Pa1g0dN/nK6YZe30kc7iq2/TMnlH8mNbLfA8FLWoiCOBZGxI75lmmkyObBl0pRfdUedv
	 zc88YL3pvTGtfBIVwEWs4UfuRLqDLmdiH8sinUgHmVkAeTxHbwS65jFygq9PJ7J1mUACd
	 RibMpNzLup0NYe2714I3wfGRjRVJ4I49nSrYLK0VE48Saa3BvUTQZc49mVQXupm+teXaQ
	 6exjukB7D6GwGno647ggOYq8tKU14ebdpacU0N44CZiUzFtXb2peGLZB5o4jdIW9Y71Ua
	 xSWMalz9+av5yV0O2R7BF6oy1fa5t7E+4ZLsFszRbUQnux+jXsbUdrPCr8rrWvZ2HTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MyuqCkCr;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C42606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MyuqCkCr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1df146015so12438255e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659921; x=1793264721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYTz++wjFMvqtqXyscp+99eRXfkEkYxGMNfxByS7fDA=;
        b=MyuqCkCrzH1+6IK0/NBmEGyLgG5m/fSq7NRAgmfoTBcLLmPuSCQTvmVy2KtrLolo5G
         Wak5IBwseSRqJM0LatBcLhWRqNmNjE00gn5o2gHLN1jlDuPbvMyjGE7tmBAaZvtJU+xF
         Jb+BPPfkD+rTZFVZjWycbnghhjAdi22blpVKLQLVwpIcJw+wBkOnlee4BFPbTsMUuxFO
         zPEN9UMtDCUqZehwtXEfsZuAPDuvRRnhg13zqEmCJ/ajlyydZu++WREQ997JDVfAkRVj
         RYtTG6T5EM7neKangbhJB2MmmfGiqLelyx5TacxrWbKsH+wiR0iQ4wkdVd+EOTetXPp9
         ZDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659921; x=1793264721;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYTz++wjFMvqtqXyscp+99eRXfkEkYxGMNfxByS7fDA=;
        b=bkzygqXbJktXzesEjIqpl6k4LJFrckYmmh+vvJk3Q/3hlNlzowia9afvo/kU1XxI9h
         iWHl6rz6DzdXVbh8vhscJvBmkQh8gbeZo/r8WwMBzuidRGio201PNYkL83C6sukx9RFS
         d8AXF8pvLxy9zu6pmO78N1GIUvD0aHRmbvK3C90a8DBpzhYfwapybmONGHRpe+uah0T5
         bcxMIuionX6oSzfYQ7QqXHvmqrPUM7YSd4M/oU04kRyd+AakR5BfWv2XzZyHFNyZaQGR
         UXI93ISzNkJ5vovnQ2SpAKK1EStpcXf3WRMbvItOoERX7fvq6yQ8952A/kn60z7KzsjX
         QLWg==
X-Forwarded-Encrypted: i=1; AKwUvBx8i/aut7oTmknwbC1JwcD6qXkXB8Uzaga+3H9bdKu/hG1sHJ5K4COOjas9yh7Nj3VksgaOFAvf3cdHFOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGG9lDUY5u4E8QfY1j+bTLMxFGqyV+kT+zrQbIzM73iRaBNnkX
	RBMwfdNfGJvrE7iEOmB0l3XnSbWVgs2zJ99/anVJuuCm4i0HWqsaASGr
X-Gm-Gg: AYBFou2SHwPYK/TAqkM5CCAeeMC7KyKciQEiIyNUEqfh2enHktHdBXLNvYlU6YlBrTI
	sfBVLkH092L4W1bHJDiF3Fj2Lvur2+d2Q41mXoo+VqWUemNx37UG9oeTWKG2qSqIbf10R4x0ovn
	osn1xJL+/SK2/bV+8ngS5VN+FsxpD8wdvTh9jdatmyRb4b/oNg14XBlpmfJmAtopTlT95HDYm3o
	TkpHr3UXcfc4G/pjJ7ofV+zXeiUZeSopnNtVhpdjkHvmBdbZ56Wlpuc7dYX9OO7MnxcTdFouraY
	wWACB+sNEL3WY4ONVIrF6LDa3FemG4x5ACRSiBQdSrsfrGXp1WVmaib+yaOXOvEmqKUkuIKM2uP
	Vu3aO++xUvALCo8JPUfSZOyB2RH6iIMo1hZ7/Sdh9E+bDwRmX11La4mMusrHRN121Fz0EvftJ8h
	5fUmW/OZC5EYCSdJAcXV/LzPqV760AfAD4J8AUoT5e1g+Pqb6EsUoNGsbjSTTjvy8boXmqoNDit
	33/OwJKiF19Xeg9B3qY4NakDBGh6wor0+YInpYHYnxMczgWE4c=
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr92757395e9.22.1792659920208;
        Thu, 22 Oct 2026 02:05:20 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a4fec8sm57925135e9.13.2026.10.22.02.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:05:19 -0700 (PDT)
Message-ID: <f5db959b-3744-4f7d-9837-e8a4aed70ab9@gmail.com>
Date: Thu, 22 Oct 2026 11:05:18 +0200
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
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v2 5/5] mm: hugetlb: enable CMA allocation for PMD-sized
 pages
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, david@kernel.org,
 osalvador@suse.de, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, lance.yang@linux.dev
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <5edd1dc82bd3b0b09005c0b36cafa2f7baea6d3d.1792651104.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <5edd1dc82bd3b0b09005c0b36cafa2f7baea6d3d.1792651104.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 9:31 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Allow hugetlb_cma=<capacity>@<page-size> to select the architecture's PMD
> size in addition to its existing CMA size. PMD pages are 2M on x86-64 and
> 2M, 32M or 512M on arm64 with 4K, 16K or 64K base pages.
> 
> Give PMD pages their own pool while preserving the existing sharing among
> gigantic sizes. Unsuffixed arguments and an explicit default size continue
> to configure the default pool. Gigantic PMD sizes retain access to that
> pool when no PMD pool is reserved. Apply this mapping consistently to
> allocation, CMA-only policy and boot-time accounting.
> 
> Try buddy allocation first for non-gigantic PMD pages, with CMA as a
> fallback, to reduce CMA migration and leave CMA capacity for later
> allocations. Preserve CMA-only policy and CMA-first allocation for
> gigantic pages.

on v1 you told Lance [1]:

> The same missing PF_MEMALLOC_PIN check also affects 1 GiB CMA
> allocations, so I had planned to fix it separately.

why did v2 go out before the fix then? 1G CMA pins fail with -ENOMEM
today, so it's this patch that makes it hang.

[1]
https://lore.kernel.org/all/04c89538-28c8-4d03-92c1-08d854a46ac4@linux.dev/

-- 
cheers,
jose a. p-a
