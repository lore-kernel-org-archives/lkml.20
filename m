Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327794;
	b=qX+eEkTToZYhH1C7jYGdMMgNXRvHoOGAJSAzAbvFMK0R2j0uwBt1KONFZCzuVAcFjJDr
	 +XpnlcYk1LuUhHVjQ6FG6Q8pFkEes8yuJS9xBjUYDp/iUtj6XGBCl8n0LFSqVR4wz4Qxw
	 JBeFTjv6WPOnaMLd1QxmTJguQL1FjaKXoXeNUER1QksD3lp09GzdRNEwZ8hdCv+ZC2mni
	 0iTK1NPaninGUhh2uG6tNWXd/7b4rhWQm8RPaZQRXGt6+z5Nqyh5zI2pbr8dzhP6KG1xU
	 x5gblEGc0LeoUMX7CUYE1wl0gVOMuJbuirN6mWaP9c1+Rl6H4IHgFONj70NqflFC2ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327794;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9YuRkRGnxp0vWQ1dHMpnKuM8tkA2uFdXTQzJ8jzW5DI=;
	b=Ii+G9d2f5T4QIJ9mGK781KcuF5feUDVSszBz+bjaS/oH+s0vjAD1dIdmA57aJL4wSRsV
	 AWppHBnGW5sGUxuY0ziE7hM2aXF12S3ElTmydMfKaf91uvVKstwFfDK2cl2ChoSzUXVKr
	 YOffNwNPrNd6HkTu0SOCZ5BpIDmKFg0TRvD2g1+GxbHG3Nowh/RFnwLohzowJkRbyTpIq
	 8ZbsUz0pNxoG7fFYDlbZI6GArOQSG4sFTNuvObuv0rJn01OA8IBg3NycL+OlaHJthcuyy
	 RRT69NkqZAGJUZZxxxNMSU660RqrHr+6zODd/k0hF3w5klGvPONvynZdfcugBs79ljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09B1606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09B1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b354d27917so19142587b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327793; x=1794932593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YuRkRGnxp0vWQ1dHMpnKuM8tkA2uFdXTQzJ8jzW5DI=;
        b=vE7u2VMZPH54YfsWR9IeU5D6SESKORiR/vSb2GGNRVO9iH+3nvy7ZR1qSXrQkT/fQT
         2eljmSiv9ya6KvEHNPFAWN/zE6OGvmo9Q+m+LzbPg/w2HjdexzzSSrbDlhT3BYMeYAtI
         NWUKkqKHJQRCsxVIPz/mnqfcnypJjMJoI9IsijGEsty48LY9edJXxMvC/rOKHDQp1dHb
         MFy/x/0H4kSo122DoodZP6fvi+wNrdxGrZxbPZs42KydQnfOVws02+Ur181WiAz/+5hY
         ueEIqaovUUCnB2GA1PTqgqnQcjU29sJPXJZyI1PylsVxpPgR5NphGQe7HWHr5JrMZG8f
         MycQ==
X-Forwarded-Encrypted: i=1; AL+hErGU6VsvnuG6f8PPvOfN59UEhz+TkHBVFjhFOYajwJN9kHYhnuQaNxinlZl3ZkF5TUdTydrVQXjPYyS4/6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rcUYyjYou3g3WtVchIFaf0izekQbKoGuTt6DuFw2Acr6a2Bem
	EG0Fi03AyA08mwWf3FwixSt1DAx5qKTqTj7Yqj02AVRE2NM7eb2Ljurc
X-Gm-Gg: AYBFou08OUcITGvwUJmMrlxZM55pAYrzv/cdV+inHhVIVIx9CrFTYghrJZ1CeFbs4Hb
	ec6l2mwLwczuZpvTHkwXZbXl2yCJWJwJ/TZlhJ7vfhJJTT1p+0wPLsH2v32M0bWL5IqdgLMbPyG
	3NehfPWFRh2OjrG1RRbb+5UCeqhuGUjAV1xzeoi4hJg9b079P/KBqIHzHDjarZP41C7/WaUUv83
	nGht41ZPHB9eEZoHPR5hljM75D05dAGKm6Bd3wcgYKtAr0MDr9KEWsJXBHJqbsSikJhkIZa8iT9
	q/WpvUM42OHrxA5W3zlboeyt/kptxK/1818V6zi2RRNpv1+rWtm/sq2Hc2TpGlmRz1P7ycvyjFe
	ZqJ8XvKI3+JQBLGL//4lSciy/1JSEJwIahv5uZpjC4CCX8F85KT2fK46LqQM2VNO84bP9f7w9F5
	etckFW3SXoz9Siab7S8rvWRcwYfaMhYJpsrn2GR4AV8/Xer/EHVZhDyxGWCVKrLHWp1w2C3iIop
	5AEBj1C7uaCo+mOjXQFn/JMVTs6lJvvpW5FpzW6aSOtcuOQKyavr574PgpIXXGbLn31VG7RRrrg
	E7U0PFUW3zda/jyLgHM=
X-Received: by 2002:a05:690c:6607:b0:8b1:901:b9ee with SMTP id 00721157ae682-8b392a58fdcmr20600847b3.13.1794327792882;
        Tue, 10 Nov 2026 08:23:12 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:6::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bbf5sm22932117b3.1.2026.11.10.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:23:12 -0800 (PST)
Date: Tue, 10 Nov 2026 08:23:11 -0800
From: Breno Leitao <leitao@debian.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	Sashiko AI review <sashiko-bot@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/6] fs/proc/task_mmu: fix make_uffd_wp_huge_pte()
 prot-update race
Message-ID: <avNEgmvYdoukt6MS@gmail.com>
References: <20260529172331.356655-1-kas@kernel.org>
 <20260529172331.356655-2-kas@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529172331.356655-2-kas@kernel.org>

Hello Kiryl,

On Fri, May 29, 2026 at 06:23:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> The non-hugetlb sibling make_uffd_wp_pte() does this correctly via
> ptep_modify_prot_start() / ptep_modify_prot_commit(). Mirror that
> pattern for the present-PTE branch. The migration case stays as-is --
> migration entries are non-present, so there's no hardware update to
> race against.

I am  seeing this on next-20261109 (arm64, PAGE_TABLE_CHECK) while the
pagemap_ioctl kselftest runs next to a workload that migrates pages:

    WARNING: mm/page_table_check.c:206 at __page_table_check_ptes_set+0x168/0x178, CPU#21: pagemap_ioctl/894691
    Call trace:
     __page_table_check_ptes_set+0x168/0x178 (P)
     __set_ptes_anysz+0x50/0x240
     make_uffd_wp_pte+0x104/0x1c8
     pagemap_scan_pmd_entry+0x1b98/0x1df8
     walk_pgd_range+0x7b4/0xd00
     __walk_page_range+0x108/0x510
     walk_page_range_mm_unsafe+0x150/0x3e8
     do_pagemap_cmd+0x418/0x7d0
     __arm64_sys_ioctl+0xc08/0x1338

given you've touched this recently, I am wondering if you've seen it.

--breno
