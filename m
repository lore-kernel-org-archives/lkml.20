Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49951A135
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030150; cv=none; b=hJlYv1+YUvFSXiRZvzQT/v0mOrWCSNj1bTcmX93ChAfLRTrp5PX8ZLW8RP28s1xA5NlXL7RcoEU2h/W7lG7H3s69ROdt54yevkEE0GKycJvsBaZ3iSafuqHLGr1zLVaApUae68OvTI3G9oIomXVCOgXQpt3V7/cra3y4yGyKPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030150; c=relaxed/simple;
	bh=UvcbGc822koLaOALFi/wSkQju9rQju2KghdVJzDbQUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkfICZCfjEBDC7CSU9wzYsq4Sq/C4wmdVi64W23yYLcxJblZc7Z6Z5PSNnXcrqJCL4QUFQ+btbqp6jHwOAJwX0PDRWrqcb4f8UEyZkc4FRWE6PZkKdzL7pTlDf1MUNmeP7gq9FihcVnq2vziFNeZJ6KmjBVjWgB0P/1Sn4GK/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qph1jtCk; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qph1jtCk"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c0766cbe64so1875178b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790030148; x=1790634948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNGCiFvjZR5zDf6Moy6F7fBM805r8TOBg7DYawpb12s=;
        b=Qph1jtCkDmMdp1QpBpOZa5D7rpEJv9xvRktWT3YXf1ItQlS/4FMQiBkitEO6QgAVPK
         4e6V3ND8uNe+KMdVJW3A+pTYfwJfOiNPtNBu47J0Ug6NCABpQECFo574qS9yazY64Mm1
         EAz3uyF2BRH6L22WO42SjWoLfnUAYuOIKk/yi6lIExowKeBbrC07Du0gy8fJwNMMMIUg
         15DeM4KRNnxn1sdwn0ugepOT43XezA4CVx5V3CK2SktvzHA/ObeEV5cVM6mDdIGfu4Y/
         3Qnj0Cn86s7aztaT0cqBgrocaQd4FHLQ8npRcv6GGeU3J/9cK7v+b/xQAXmsmPeYiKmh
         eoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790030148; x=1790634948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNGCiFvjZR5zDf6Moy6F7fBM805r8TOBg7DYawpb12s=;
        b=NbDbb6ywJ1JIhXQRvs7HBHbZNsVc2QVAnafnUZqCk+6l6qCEy8t+c1oj0r83271FQZ
         VzqwKe6dSJNuN5YdldtJowPv/2+EN+qYyAMaMAHysfbmfqYn+up4M09aZug2qqI564Hi
         Hpiu0CXgb8LD9lF2a0cpiUPvNY9lQFaYhzkvWOZXUQHBSuE+QwR41hPnNnWAXpmLbCDl
         0UXdtN4uVsZKf1stf9JBShL5Cxxl5EgXAegUqT7wWbHDQdlR0/i5JliUXsTtESWaHRnj
         a5oRRR+rSmPuk0doParwilqXoFetx5NOGO9Ne55eDNQhoEWojB3Z+p0SCBTpG8zRy8Z5
         u18Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYmu4wVJ1HZjkDwxKE2miLrP6IsEmNx36XIuTX6IwvbD4awEeE02nH+UeyYV1XnjZ4g2OLP7rdIm+IX5w=@vger.kernel.org
X-Gm-Message-State: AFuF++mO9dco9/CQCAdiGfIYc9Kd2peiqy3tHJMSLKRAyJ4GpGfAFk69
	naTfjTAalSiQqRkMvpIFVGh1AEnAg3aszFWkyDNY9J3STp5kK6C+aJ27
X-Gm-Gg: AYBFou0D2ulH0MQSV8JAf0hMNEIzH9W92BPCjMJD46pkRY0fXgOntHHPzuIg+IoNEHi
	ZPHqGIUt6O1MNu6vKpiaRp2T1/m2bpKCPCZ+yoG/BpQkrFj7CuTuW01lH6orOGUCysXUX6N9enm
	BWJSIukWU4ssN0ww/2if6SaxAbjZGALEoPOUMnQSsAAg4cKEBd2aqsxvTsRwEIK8WXQiiWGTJvE
	bA+nFCvJYAMLcRBAdLCHOAZCUDWj29t96OOHz3/Lzba2xmvJ3Ds+1l5LxzdcqbZBxn2LhlWEpoE
	caPEiNRcDyIyOn47ysXwDugiTLUrl+tPI2pO+hhrt34bCC1Fw7L3kbjdiXGjxl80CvivdQt9Ume
	8A8K6dRg0bI3FlKq2ZbGZETVngyy/e/sq4IDPUxl22/Oyv0Z9ZJPN38ELzB1avrF9az2SO9IIL/
	MsFdvADAa4EFrdR13I8/ZtINwCaRd/uZ7x/N7Khm2GsYGLibF8HanPlaJIq0snoHiFAQAze4XR4
	RdbaYX04KJ5gzm2kOvk9nbtlrgsTA==
X-Received: by 2002:a05:6808:1185:b0:4cb:f21c:a799 with SMTP id 5614622812f47-4ccf9366320mr12128261b6e.33.1790030147780;
        Mon, 21 Sep 2026 15:35:47 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:16::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e649352bsm93244a34.19.2026.09.21.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:35:47 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/hugetlb: account migration target folio in per-node NR_HUGETLB vmstat
Date: Mon, 21 Sep 2026 15:35:44 -0700
Message-ID: <20260921223544.2401052-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-for-hugetlb_state-v1-1-8a6eec92661f@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:12:34 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

Hi Hongfu,

Thanks for this fix. From the cover letter I was frowning because I was
thinking to myself "surely there's no way hugetlb accounting is this
broken..." but it seems like indeed it is. 

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> The NR_HUGETLB vmstat counter is maintained per folio's node: incremented
> when a huge page is handed to a user via hugetlb_alloc_folio() and
> decremented when it is returned to the pool via free_huge_folio().
> 
> A folio obtained by alloc_hugetlb_folio_nodemask() never goes through
> hugetlb_alloc_folio(), so it is never accounted, while its free always
> is.

That's pretty scary! Glad that you caught it here.

> For a migration target this means the target node gets no matching
> increment for the decrement on the old node, so the global nr_hugetlb in
> /proc/vmstat drops by nr_pages for each migration. The same asymmetry
> affects the failed migration path, which frees the target again right
> away, and the temporary folio hugetlb_mfill_atomic_pte() takes from the
> same helper.
> 
> alloc_hugetlb_folio_reserve(), used to preallocate the memfd page cache
> folios, has the same asymmetry: the folio is handed to a user without
> being accounted, while its free is accounted through free_huge_folio().
> 
> Account the folio where it is obtained, in alloc_hugetlb_folio_nodemask()
> and alloc_hugetlb_folio_reserve(), so that the increment pairs with the
> decrement in free_huge_folio(): a successful migration hands the folio
> to a user, a failed one frees it again.

The changes look good to me, and I was able to reproduce the issue on
my host and confirm that after this change, the missing charge is
fully accounted for.
Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Again, I'm super surprised that a problem this big has gone unnoticed
for so long. Thanks again for working on this fix!

I hope you have a great day : -)
Joshua

> Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
