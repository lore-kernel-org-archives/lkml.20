Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545712;
	b=PjW4HkdI/UHO5UUFHlF4JWAui3VoNjpiFC+DbjAEuGsCUUga2IrA1ZwVMBWNkJlBgxbw
	 eZP81wld+4IKXEajt1wV+rS5+dF0QAjNczybaBb63GtXlqz9J303Xrc4QoRb6btL5Jmdz
	 x9JzfGFPg7p2JHbT9BQE81zfZzacQt0wM2Vpb8ZkOdxKMBEUDaJ1XiFy105oQXS4OynEe
	 mRrdi3tKoQe2p7akmHqPOqhh4b4Hp1QwchTws7oUg993hFiSK5iO69CeqG68YI/iKzRIs
	 5J1U0FiM9PzEsxFCnf+p0IXjMLsx1xbF1J3PdGi72wljiMGrokfCLYSF1We+0p84NnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ksSqi9LFAnauiWq3VTcsn2XVnb33hHx7fgUlFBfWLfI=;
	b=jqnQA2Fy2r9w3BZ8hzJSTbQYQfVmW7hMO1YjnRq7wj7/k/djZO/eF7ZXpa/jA0O2KziI
	 5+sWDyYDeGb+kwzVqOwPHeQe32aSH6BNeYrd7a2sT9YEGm/1YuKgD6BSxQzuLbtH2bCwO
	 pEhOVObwOkUGUFJ7OmtRQvM2zljKOt1ajF6o4zf0slrLUmoSzNxY0gSUMzl+g0tWHElsR
	 T0PZM8a7yavjSq3Pz9ouZIjogasMTAycB6ErJk/0XHyQ93sHh6OaF0kM0GKFgV3zsE9f8
	 iqadgw1L/SVHQ6T5GPMiGgvEWJa8jhlwrhX/KuYSYOZit9Dh3rZQdbQ70qbjByGaycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PbTw7Bnc;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PbTw7Bnc
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c847584b8so11357366d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794545711; x=1795150511; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ksSqi9LFAnauiWq3VTcsn2XVnb33hHx7fgUlFBfWLfI=;
        b=PbTw7BncmEgkZfS1fdabmtwdiOdoSK3DY5Kq/iWkXHztCq8wDKdDT/LGGhRvXrIsRQ
         Wur01OwukhRTo/Lr836rl95gCd6cHUb4rkN4guSemnh8OyJD9+YifNFz8zDz+/UN5sYh
         pMV3G7UKf4OpgC8TY954O8r0Hg3a3OR9bSwOT/w2/5fkPtB3BdFB1ih1R8D2dja9Glbv
         yNxHvDDjtFuwFFlF4QSZfmTbKWTJqdyGU+MSLV5LXPP9ZqGlQ8zncNZ1DC0JgqEck8Qc
         LkZa6Mpu8TdfzTe11xQWCw1qKEQJ+kpIorK6TeQouCjdifujJIX6oVoNG6CeFS2fHN72
         iOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545711; x=1795150511;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksSqi9LFAnauiWq3VTcsn2XVnb33hHx7fgUlFBfWLfI=;
        b=KRPi00KgDoOb7BD16BK0LUGtcBVY05HcT2r50TLKOoveXPyMLQo5rEdgDbMrldEuXP
         bYkdTH4+J6zRk+4nwdSTmf1K7R02RSEA25e00Z00qnA6VE9+wbtrkIwzF1d4O03m3DAl
         hxG7iK1McVZOvyIV0EIy/GbSzdqCgGignE4lLhSLioKrxu3uDwuCsCy3dD9dTsmtKXh/
         g/XGj/wYMHx3viybGYWOZMWtgwJZejX4FYV5jiyNOziDoj+Qkj9D3tKp07PFmcehziqk
         qOWk1n/Phlv3w4mcHNufrL/JvtGWLSF25oatVQ2AY/D595XUkve0Cj4OAM0x4/3aPFGr
         79cQ==
X-Forwarded-Encrypted: i=1; AL+hErHunEVdU0LWUCjV20XTPyTvZTXMvl7LwN2rRXiVFK6NOS2qvOTAGvdQPmynhjSX1mnQSNDD0L1tdlB5Z1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SZxGaOJuVzuhWwhv06KxT6ObfMQNBdZIzgVX/K7ONxTPMrNTA
	TuU15KBJBbMoJBzC6VBbiBnb7Vy7fkbWWwnOTO23gxHhotIO/3VcWbqJ4OOKZi1i/CU=
X-Gm-Gg: AYBFou1DuSlUP0jhAe233hYwcOUWL7+xB7dbfedFfWpiHKp+lmKYohiJfm8QiqkqSz/
	Hdm3OMWA/zu1zG5dqQhrjQZKbObJqw4BNf51/hNTiH82VdBRVSXajGixvjF7DFNaSwtHU1OEZ2j
	X7maSeCVtWwYZvYvJI9/B8KplamWiXjXNnE5i2bOnWflhBBpT36tiQi3CLigWzw3jg9wWaa6zuR
	FuwBtGrjbQBiq0BsJen/YZKjhX+tM+NQf6ugp4qjg1k6951OCU8ReIsWd21BtijrhcNpriYogn4
	OC+bMNalsRrO3FYrhEGU+4Xe/6eoxCvEsz93UtbvN4gzOWzReZi3YrbgaKpkOirMT48qjBW5BfD
	QE5DRp4mbCgMF988yMsylPxtMUWnq08j1XO6ej9NPczkPgA29dDvfciGggsVyLfXontWOVEoJRA
	7ixI1dejqHMVYQcs8rYV2nxKvnYpoTpFzwpY+6JQe/50LSVHjHFjkRteRWr8q3/+BrPtIKW3YXZ
	uUKPdkN14BGjHK7sQCXA3DNNyMnPww5Pn5MFMPvkQWCvwa2uFH0bMZY+EztlNXkfbei74kkdr0T
	DyHx9P3MJaSlVy4Vy4Z23+pmbniWpULHhQFQTkXW80h+nP6DxpbFEpuiUpVyRETKwQ8pcfDXsHi
	pMA4lUESxx/++v8wg+pvgfLQOv5X5
X-Received: by 2002:a05:6214:5e05:b0:91f:2abb:a7ad with SMTP id 6a1803df08f44-91f2abbad77mr1153566d6.16.1794545710518;
        Thu, 12 Nov 2026 20:55:10 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm12150726d6.25.2026.11.12.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:55:10 -0800 (PST)
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
Subject: Re: [PATCH 03/12] fs/proc/task_mmu: downgrade writable migration
 entries in PAGEMAP_SCAN write-protect
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
In-Reply-To: <20261111-uffd-state-fixes-v1-3-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-3-00713d368976@columbia.edu>
Date: Thu, 12 Nov 2026 23:55:08 -0500
Message-Id: <179454570885.482102.16669231045892763097.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects pages in a VMA
> registered for async uffd-wp, and sets the uffd bit on non-present
> entries as they are. An entry with the uffd bit set must not be
> writable, so that the page is write-protected once it is mapped again.
> change_protection() therefore downgrades writable migration and
> device-private entries to readable ones first, but PAGEMAP_SCAN does
> not.
> 
> For a writable migration entry at the PTE level,
> remove_migration_pte() restores a writable PTE without the uffd bit. So
> if a page is under migration while PAGEMAP_SCAN write-protects it, the
> write protection is lost. A user tracking writes with async uffd-wp
> sees the page reported as written on the next scan although nothing
> wrote to it.
> 
> With CONFIG_PAGE_TABLE_CHECK, setting the uffd bit on a writable
> non-present PTE or PMD also triggers a warning.
> 
> To fix it, downgrade writable migration and device-private entries
> before setting the uffd bit, as change_protection() does, at the PTE,
> PMD, and hugetlb levels.
> 
> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reproduced and managed to emit a page-table-check warning and
demonstrate the lost WP during migration.

Will leave the review notes to Lorenzo, the overall idea looks sound,
if painfully verbose / special.  But then uffd appears to create
this pattern everywhere it touches something :\

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

