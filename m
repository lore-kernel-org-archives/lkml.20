Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546631;
	b=taSaOoToog6YXVT98UoL9x+2L8GxfcFJq9AEG0ljxtdFVK0I55gY256VdgVEwDUIlKdu
	 tKN64/4rjzJR0DpigYh680V+0OQ3se0Bv3QPnyh2D2zhNnZCX3rcm3qFh3lO0phHDLqH+
	 a+OgvbXUL2EEuTbQvRbmwOCJ0sas4Un9UpNLIow2G5D99u1V29S7/49ugNGDOZN2JOHU4
	 Zd54JEsWBUlBsouFJc10L7HG4rqooiDCe521HL8Y4MYcwG5kfWORseoHWlEJjeEyBbovF
	 D7Xolj9YJPuodbpv8Avu7mkm5miHiMPnBh+G0/10+SNJqYIIhzqip0cv4cE8r/BpomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=mgkN7zfne8CxcStcMwaH53uuXOvKnVLzfMEVlic0so8=;
	b=NclVTf1PzWMRE8Lcp+6ZMIm+3ic31P7Girn+NpzfP81ujQyIcUCpGI0oE57QHZerzTCI
	 p8C+uI/KCtuNV9h1ZWevG4AOQ5yGQZ0UABRSpMDPoed44CGJ8A1HBkAaVU3vsB4fsix8W
	 7dz01U+iR9OYI6rJskO7G/InCnTKPVSsDlJvFXxThS+QblIlqPDvDNxb/GokVxWx3TZp6
	 mWSACs9OA9tWOWrFCparI7F/+fALQj/7xAl4fUwwy1C4CPA5oTJBLvU64Luo4CThZw5hs
	 fQAf2ObtTpbvxpehIjwAHK31lrryeYTuf9aV56pVHszwpVlr8RFg+W1x+icYvNLASlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=OIjEQYM2;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F9A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=OIjEQYM2
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f30660e69so83523185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794546630; x=1795151430; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mgkN7zfne8CxcStcMwaH53uuXOvKnVLzfMEVlic0so8=;
        b=OIjEQYM2AbvD7QM9TAR0tLg4L1oJc35+b1F4MoifxY7eXYBQ+KEPJLpPBOEANDYP5g
         kxqNKD+dVu6bAcIcU3FBv2VZxmUXB7eOLSD/Z5Qeo2WKctkL1xQ+g0Wv7nm9jP1FCDEH
         PQEgjk1nUYo1hA/DrieotJAmBd8Rat8VKIbcdOMOnxU+W3TRM9Q2TPFBlrUjJS3uofff
         gL6wsydLRY86jsPdbXHxO0sT8SWJY4iNx39eHkz5cFSKe225IdWJz9HnWUJbvRDmVe0H
         LaY/kQzdki4vuo6l2LdExbc+GG1bug0Em2JGwmzTUqICZ90ycLFTqsHNwcUJzEJwHpwo
         WDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546630; x=1795151430;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgkN7zfne8CxcStcMwaH53uuXOvKnVLzfMEVlic0so8=;
        b=LXx/PtEVW5FqlEZm/Lxu79Lo57dChJNhM1QHbJ5/EYGVrUoWxecFjJm71U+M5bqPS+
         ycgBxrpCutiLsvW62WIu82f4fLV9Y0POCkk1hY9gT2cb4CfoGUpiNf10AMeWyigg43Yv
         u4nnsTwl1ONx2JUa6i5hDz2lqohO2CV+Q8SINz4YDR5RoWzFcgLlVPbZzLsdh0XOTYxA
         KNsWw1tD9gqHuJP+MNtqWKQPRO5f7bxS3XE6tLx0V/sLyfhTGOvUX6E29FqyM6T1DeJd
         j5TWQDoUIJ9W01dZJU/zk7Mc0ZY8kMX7ROJCXVHLGN6ntN9qVo8f7DWo2Pvec77xt8rS
         a/Hw==
X-Forwarded-Encrypted: i=1; AL+hErGBYkA0jR8ewzaRZPYb7J1ewpMDA/8kD5Nfd9R3IGv9md5ehDQqAECCD7KcHlPbhsL0yKhlI8/GOmNCvro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/upoh2zK6bK/JpjRX/i30xLPUccKoatmpPavPgyUu+1FreUL0/
	rUuwETnP8GUyKln1brhsfW0pAwHCPV+ya61QoPxkY0Pq0wWrA9+wwbhwIhl0NfdvtU0=
X-Gm-Gg: AYBFou15iXt6vZCtU52nFfTYpwdDXencAKiva3r8uwOWvN6A/2S3N/GttQJbmmNFoQa
	079/2XcegwkwLKPW5/Y4XhIsn8fn3kgf+mQnQRWLbr9KrVPxIAHELmEXEmjTRJbZQkeXaDJh3Aa
	ToTXXIpdxWK4kvDHBIc6IAE7405cZnvPQ2TE/bDB08SaRq12P6zjrvhz1Rpue2ld00Fh9yOXHRA
	D0DZNxHMgWbUfj7hVXcVjgQ+CzXf9cU7DFNxk6L+UmbnCPQ1hE0vxkd6Dt9tqxgTx7PGTs5hmw/
	dbjDixGXUjaYPYr8iLxu5jFQhj8Fdaby9h18dZywvOI7N0a/nb6tbTgGigOvXphfoAVQ38s5d4F
	74Y7hbG9uEORuEcUJZj2kG8wu9OC6hyuijN8iNv0/J8Ip7/HWeqYt6SyF8sdlKcS0jzl8MbikLa
	hnmS9W/QvBaX6r0F7bVGpIhf+sjAHOfN/+gdfEIb+RLZEIFTRDorhPBiXfcUgmVHmFSLKQpNBfx
	J8CzyTzFwgWLuK/lFCxeMT9o4WlTBC4rdokmpg6PlmOKze9zkjdCWc14j6PpbTyeYDVsO7HD4p8
	2QxZVh6rPuxirH8L/2wtNWXd8bS5OA6TpyUEVR5Bc076IckgTEQZVOMmOLDfo4lsEFpkF0gwW26
	J36OjGrI=
X-Received: by 2002:a05:620a:684a:b0:945:f6b0:db0 with SMTP id af79cd13be357-9494bb3103bmr245366785a.30.1794546630191;
        Thu, 12 Nov 2026 21:10:30 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm103580385a.18.2026.11.12.21.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:10:29 -0800 (PST)
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
Subject: Re: [PATCH 05/12] fs/proc/task_mmu: write-protect device-private
 THPs in PAGEMAP_SCAN
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
In-Reply-To: <20261111-uffd-state-fixes-v1-5-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-5-00713d368976@columbia.edu>
Date: Fri, 13 Nov 2026 00:10:28 -0500
Message-Id: <179454662851.482102.356362894816988437.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects a huge PMD through
> make_uffd_wp_pmd(), which handles a present THP and a migration entry
> but does nothing for a device-private THP. The PMD never gets the uffd
> bit.
> 
> pagemap_thp_category() reports a non-present PMD without the uffd bit as
> written. A user tracking writes with async uffd-wp therefore sees every
> page of a device-private THP as written on every scan, whether it was
> written to or not. This requires a driver that migrates THPs to device
> memory.
> 
> A device-private PMD must be write-protected like any other huge PMD. To
> fix it, pass it to set_uffd_wp_swp_pmd() as well, which downgrades a
> writable entry and sets the uffd bit. When the THP migrates back,
> set_pmd_migration_entry() carries the uffd bit over to the migration
> entry, so the write protection is kept.
> 
> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

reproduced the issue by observing we fail to carry back the write
protect bit after migration.

Implementation details i'll leave to Lorenzo's feedback, i don't feel
strongly about it, it's gonna look bad either way i think :\

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

