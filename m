Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547146;
	b=2w+5LYZX6Ex0+RZqxwgHsrKIw4XW3dMkORZUWehqOF0Vh86oSZxuJ2YrefFZUoTSYkN8
	 WKKlIKJkEkPf8qY/dcHsYEkC8wwQh+VX0ATCuvc+sUXWBpYNdbnpFNCaPNkcXNj+sEIw5
	 8n4AmvZ+xMJeJkJ8IKobUH2VC6OjLbzOaM/Q6x8Oh2a1ECgy5Wc3lk5Bsa1YLJtRgfz0h
	 KGDAOjcFkJJzbMHwPsY0vP3fPsoVvZgLY5KReD6Qogry5rE05K/m58gWjMnFdxe3Cj9zL
	 tXKxY2nC/EIYgV6TIAWfBFGWQ4k200DfIkjC7WHpzlZPVhhhAETbN37CwVe8SEvRcsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=SZ/WoExpnJ8hrgM/hl6NJJrxD86AhGkO6OAXDjbXUhM=;
	b=KBG8vkfFpGBD7D8hQZHXzMftc7lxaK9RJK+9ztZ6GJ9t0w3MOyKLqEzBUtB2BKc3gSr3
	 s1bTZMcxVvbvSVStCIWY6fsJRrBhlQ0wZhksQToINFZCry2PL7Mda0BFIq/IUN7iORXmf
	 mXvkyOWFiILz3MtJDxHjsAlHiZ8luLneluT10omyVPv30lRh62rXFA6w+FAIJHQy8jEVv
	 hN8/4WGrUTXE8FYvR4NO6dgy5UVgp16aW9ahV3n/gDh+2R7/WM5iz3eJOap331j5Uu+AZ
	 4Bqqsc26E/72tzEDznGd+l/AK1/WByGJxUGY0ERlk/2EmBXHeWELc4IcASIbcoyxNMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EmDt9IgY;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80461606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80461606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EmDt9IgY
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c1f548f87so11136266d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794547144; x=1795151944; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZ/WoExpnJ8hrgM/hl6NJJrxD86AhGkO6OAXDjbXUhM=;
        b=EmDt9IgYiZiLNjvWSV+IAK+VJTXs4hMTZg5NFCXaQX8h2/IzPDuscZQ4Non8MU01Xx
         eo21TqkqMDN2DKSqYsyiXZH40khVAsbr09nKuKeUZ+YfYLlvTyU5dmm4mXQCC2OicICq
         +WBbgzEkMZzfdz9lZL2WJQuJm+kRfmWApuAz0BO4odG18lX64PqtoZPIOSMTXa7qtWvC
         iFJSmZxtEs1GS9ds62eUUV9IpBP5NwH64gURgK697+GOZue+3wYrm1Q4z4N+C0tSC48P
         PcibbF65Bq8SiEVUp3lm6JxVA/r40lxFCgyZczt13RA3b3Cb0tFwQx80N9FA2A6LWEGv
         ygSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547144; x=1795151944;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZ/WoExpnJ8hrgM/hl6NJJrxD86AhGkO6OAXDjbXUhM=;
        b=Ftv1pPjfPipCiPKZhRTTok7gcyip1jNPDupS+oBMDOJZXnE1boLEtny4FITSOwdgIa
         gCcAp/yTehDkaq8iltLncPt9TZaxT2oEXZB2+NyKN9ivWolAgur17WtbLvFf7QUsXo31
         ylImNxbDNtQwR1VG/+XDV18OGfSsuU6DKYmN/Wg6zhMqJTqME+YJOiXaza0zzS3hvLXf
         vGMc8v1ABJgsVsO69v09fHkksJTvxXwownvf0wB308JBulhXx+UEcsqDVcixn/18Juug
         TW3H09dDf5igsjWbJIERh3ED8f6GI+ABhAXSb4RQlcY7CqMH5isr6LMizrt5FFigEjXt
         zS9g==
X-Forwarded-Encrypted: i=1; AL+hErFy0mtnm1GVcfGDenUcTx4e4ybOmuZaUJzhtTMFSOWvznucxcXBLcWc7/6Y1ZztCPP8cOqkrAwa0yjgiI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99sgNYEk5oNVZLSVsMAnRSGKM8DTUjctT/5wMZSHPTQL7wd3JN
	Hfl2y39Yjf3UmXsXY3RTwfUZG+5Oozg54/m4ehCUs4rqLxcbrRAEc1zQEC3a2n3RIb0=
X-Gm-Gg: AYBFou3BdgQZkt6cXqRAS42KapBC33DE3RHZ9Jfu0AsGcehGVWvrlmp7WK02qt0MoTF
	m57/2453groCTdZjzw4HSgPZCjlczmVDo+7e8+z662QJ1iunkXuRo2A5pkanvX2jMH+WzV+st4r
	VaoHIaSSzGojW9hnIkjdGbfe4jQNJe1CG5Q0gPDCykQPSgzsfp+GfbHq5JIkTkki++papukikZH
	FrEyqevrBRAAIgg2dhUF5wOLf4hOW9iEkj7fm49qlET4fNJwalbOKI38ha08Rq3fYkwiR6OcFr6
	xT+8Pwc6chxUKQshTFDAb30DL+pRhFsSbS+IBH4/0PrjS7LPG9sTfX6wHi7rYMODkRnjotwJNxx
	vfhEbuofcUoqfSyz9ieeZ70WooKDt0GTfsnKVp2SoW7O31mc38gTYdz66ell0EGcgxyKcxuAhST
	hqo6G0PxHSlFnY7hs5f4jMOhlhA646GZvP6r4Q/cYO6uGn+l7UQsJtXjPmW5xzozcH1/sKjQRIR
	XwlTmv/vz957ip4cEAru/YowLyA7tj9QGaBpTEDGIWwcQaM2aFT6Mg9w+7YswqOzyfL/RO6juOX
	7XsiH2VE48b7766nA/mbncfZMy/PEXikYyyCHIYEr8KrmaWZ1Y5I5JqphSHhZdsV8fTNGd1cGuf
	AB29/Aoo=
X-Received: by 2002:a05:620a:4713:b0:93e:646c:9133 with SMTP id af79cd13be357-9494bc53dd7mr281919185a.64.1794547144420;
        Thu, 12 Nov 2026 21:19:04 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm106509685a.5.2026.11.12.21.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:19:04 -0800 (PST)
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
Subject: Re: [PATCH 06/12] mm/huge_memory: build the moved huge zero PMD
 from the destination VMA
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
In-Reply-To: <20261111-uffd-state-fixes-v1-6-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-6-00713d368976@columbia.edu>
Date: Fri, 13 Nov 2026 00:19:02 -0500
Message-Id: <179454714288.482102.7776276516691241493.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> move_pages_huge_pmd() builds the destination PMD for the huge zero page
> by copying the source PMD and clearing its uffd bit, so the destination
> keeps the protection of the source.
> 
> A source VMA registered for RWP can map the huge zero page with a
> PAGE_NONE PMD, and UFFDIO_MOVE does not check how the source is
> registered. The destination then gets a PAGE_NONE PMD without the uffd
> bit, although nothing asked for that in the destination VMA.
> 
> The next access fixes it up through the NUMA hinting fault path. Until
> then, the first access to the destination takes a spurious fault and GUP
> has to take the fault path. The impact on userspace is small.
> 
> The moved entry must have the protection of the destination VMA. To fix
> it, build the entry from the vm_page_prot of the destination VMA, as
> move_zeropage_pte() does for the small zero page, and keep marking it
> soft-dirty. A destination VMA registered for RWP still gets its PMD
> re-armed afterwards.
> 
> Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reproduced the spurious fault.  Change looks reasonable.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

