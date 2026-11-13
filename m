Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545955;
	b=LteheU9+axfFCGwvoyojJoSvOmc+SJAdXSO02ybjdFyaX5ICekGsktNYQjMCGNMOqAtf
	 INNAQ5q6yCbzxhrTujLBg/4c96MoPx92fEr8MZbktaqgBbvuEMZElPloVKu/STHfQIRP8
	 ey0XwMWwiQ/Xevm/wg95nsr2pZRXqFJShgMh8XGIcP0ih6Zt8LJRxA0n1O3ss47ydPfq3
	 A8Td5zlecSsNNFs0mnHNW30VLTQVA4dqUmiMbK5UKBUniJsFHdqCK0EE2l7GP1lnC9b7E
	 +vA1YbmPQBDQNdkJuyXX7MQb6VRb7ekZP9D5ySA01Y3/3PCzTH6apUA6FaWjilvrt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=GLmBItbP4RM0lDvur+G85T4jZR5s6nwsiM+d+TbTnSA=;
	b=erVuyBxefcqoUEMgnbzZw8n+RfIyrNVm7UD7w01uNR8fa2z+tFeXc/XuOKJRQKcyMf+k
	 t7JwcrT7NmrFtOoiAQPSstoH4GhNeW3uBe6SwOCYznIKEs/DlSgMyWeuWpJXzas6Nnyb2
	 4TaS7HbjSLPmKmhbcR/E1tgf4BHvH8nv5E92swX8n99jzafGgYbTbZLuuaZ8+ZLQMcKoI
	 LUYAYh3JsvwpnS8IwbZWWUqhNMRtJ40vzTfNSbD0YmwP8HFOhY5aRtZuv1eNgcLcLoStv
	 IT29YiQ/Hg4/M1UEvEF3utUB7+yEHc5V1q1A9Zoi1zOfT5HRQvopxNz5MiTeanMJx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tnfZGlWz;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C410606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C410606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tnfZGlWz
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e55db58cfso87037785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794545953; x=1795150753; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GLmBItbP4RM0lDvur+G85T4jZR5s6nwsiM+d+TbTnSA=;
        b=tnfZGlWzxioprCRdjuAKRWzS6D9IN7pCucql/WHA5lr5Tq0Rm+7X+9F7G4y2TM6jOs
         Ug+3fEkZL0bSjmPq/qbO43xAlX713n7HD3wl23BeTefeYLAuMrO+LE3/kkZt8pXhOY8c
         Na2n859dwYAT58wtReG3ezj4Rdj5Qrpc/FFUIyE7qkAp51VVVIgXUr24UYcFJfDUc290
         7BvMCMtuu/y8kJpBba+91o8N17trisyvTa3/t/WmvFYxJ/X3KM3IDqzqBhYO0FQ3ewKv
         RzT9wSxTTHgmuOUUN9+4HA65by90CHcdXrQZdbZAKDa9EIZ67tg3sKOW1SueXKlYR8Lw
         Ts4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545953; x=1795150753;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLmBItbP4RM0lDvur+G85T4jZR5s6nwsiM+d+TbTnSA=;
        b=m1woGyKlXXqJDSee3EU5E1ysR6usRUKr0kUFFb6Be7sgN0OKkrxfOJxBhLk14PcHRJ
         mQF6XFJcqQgzKnU/BvT5k8XT3SpOzYGyv1tAg4JbSV8/A6dsRFNw9q6/cElJCvzuxX4y
         1uEtlzYbBbGPcDvBrv626sKyZsL3PMDwARH1SKX5cR2mGDsWKg8uw8hb5cExJGT2Vph2
         EoQFew6Wg97mSb4Ncd3v9rZSdeIjj6z6kXDJA75j0/Vn3QWpJZP14m47cdVBTEjaB0ik
         twMnYFwzY66dMib5nY6JQK3XC3fwnKq/tVZPRJen+F0L0wyoB3fmIRLmTep8FN/bPLDf
         xyKQ==
X-Forwarded-Encrypted: i=1; AL+hErGkiTFOfpZwyMA7CF7Os81UEPdQWn2Ovt2DNEsvjNICzh+tELxMG4W0/LIClrXhT4MhrKrZwffOTLlHSlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hCs3NgIqTzxDAllk2ioqok1q7lEXk+TLkitsMOkBkWUdly0Cq
	iYfcg1qBOY7M6C65PH25WL6ue3yK1DEhxgSHnjyjVUKdzEau23Jxh2SIjfnQUTGQru0=
X-Gm-Gg: AYBFou0j0VDjfetEjUAW8fbBpEkJI+Q6hchrRQFA45I2NwkctCvbADndONP+4JbkvR/
	HINb33v66377BhchljerQLiBWpuPI3/XPlp6ZISGDvVkrZh/M3AXaFnmPFo+rUJI6/59y+xwpwb
	pQ6pAVYdwxiQsnZ43Kxhe7lEA3nZ/gE0Q3Sf8sViBrCSOhJmZr2bJX6gqxtMZj1m2rOFjFNANsB
	RK6Wnyo1+11geRZMFVR95ppHaRvI+2ZPB7mS9K118DUV3Vm3cCWauQhds3E5TS2VOZ4JS1lViPy
	F1xb6CZZqHC1yJEQ+/2fnFVIRYX/jJky/ZWTnVBQsLvRuqykzwixfL+kroeiV8QdbcShz4tpemp
	nlKxQKF9hud7+kGVAaiQzuqzdK93CGstS7IU/W2Sf8BORnQTMzWBlMUostqLYEEUbKglHia02/v
	c9oopTYb+x2+Y9pqaxjgT+Sgq7tmH2g+Lbd8fRxEyJZ4badry6mnKkw7/oRfx4rELA9LsSDAYdP
	FO0D46hk4DrV3nu5pO5sbW3kWTIL/cDmoIKKbzFwQ99y8fNK5M9DVfBP0KhkJYlAI7ONeDw9RES
	pKWcrxDK+PhOW8+SE8A1QEDkeuvkgfJV3Ca5HFNXupUWgiIH+ZSWMIJPEFwTOhhKcuEYs8mu8la
	5vRsq9N4=
X-Received: by 2002:a05:620a:1729:b0:93f:33a8:8e84 with SMTP id af79cd13be357-9494bca3482mr231345485a.56.1794545953581;
        Thu, 12 Nov 2026 20:59:13 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8399f7sm102246085a.24.2026.11.12.20.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:59:13 -0800 (PST)
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
Subject: Re: [PATCH 04/12] mm/migrate: keep the uffd bit when restoring a
 writable migration entry
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
 James Houghton <jthoughton@google.com>, 
 Andrea Arcangeli <aarcange@redhat.com>, 
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Andrei Vagin <avagin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Arnd Bergmann <arnd@arndb.de>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>, 
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org
In-Reply-To: <20261111-uffd-state-fixes-v1-4-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-4-00713d368976@columbia.edu>
Date: Thu, 12 Nov 2026 23:59:12 -0500
Message-Id: <179454595216.482102.14752706183169554544.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> remove_migration_pte() makes the restored PTE writable for a writable
> migration entry, and only looks at the uffd bit of the entry otherwise.
> A writable migration entry that has the uffd bit set is therefore
> restored as a writable PTE without the uffd bit, and the page is no
> longer write-protected.
> 
> An entry with the uffd bit set must be restored write-protected, whether
> the entry is writable or not. remove_migration_pmd() gets this right: it
> makes the PMD writable and sets the uffd bit as two independent steps,
> and pmd_mkuffd() write-protects the result. To fix it, do the same at
> the PTE level, where pte_mkuffd() write-protects the PTE as well.
> 
> The only known path that created such entries is PAGEMAP_SCAN. Now that
> PAGEMAP_SCAN downgrades them like change_protection() does, we should no
> longer see them, so this change alone should not be visible to
> userspace. If another path ever creates a writable migration entry with
> the uffd bit set, the page now stays write-protected instead of losing
> the uffd bit.
> 
> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

yeesh, agreed with Lorenzo, this is painful.

I wonder if we can fix this abstraction somehow or if we're stuck with
it forever.  The nuance here suggests we're going to find more of these
corner conditions over time.

I reproduced the issue and showed this patch also closed the problem by
itself (without the prior patch).

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

