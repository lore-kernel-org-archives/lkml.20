Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549889;
	b=OPXesOsm0LmxR7GWeQpDGV9F5IBknfYz/1v+SSLJndTeYBXTQRIxB+ncA6E6EvOAK+lT
	 7X31XWi3H6RjHv2lwwgzTMulpFUTZlKKEWj6CAXfgG7L3U/u/Za7hAZdtiAZ0AIgIhozU
	 OZtC36KUn7qLpYdlSvtq7lTaDUAl+Ieag80Y1bVsXe1/q7ypwATZk1Y5NFdll74LOjK79
	 7re/Wvxuua470k+9iLDQUG7Hqcgnja6HOXJBmWfSFDXSZDm3ShZXll7+mmtqay++ZGQFe
	 7Jp0OSw4NHAgLnoFps8xsFmNe0AkVnfk9pj9aX5W6UJz/+5zbqF5/A91m457j+tospQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=7xFaxwfpj5KbqoBFMnfOTbn14r38Tg3ox9XxMLJZOVU=;
	b=Zj+zIJ35jsbNhej5ipwjEVbst4TL0I2OV4iHPOBCUqrcMeQ9IxYMbKNA1DknFioe3VDb
	 J3srsvvItkOignHzoLt6eCy3/re9VeG3Y9tEBa8NMbhRZczGzRc3V2jo3chzz8MuWZBKZ
	 ZYDmq9hyI/q+3Fl2UADlKdZAoezx4AhVPnCKur3RP34xuI5hLUCssKBUDYxzOd38MWDP+
	 ogNzJo3Jm4K4QTtN/VwtMALv1W3/dRLZM6wCQ99sOsvaccveGgsvqDaQ//bdbBxyW/lkz
	 6JSl3+3iP2ruAPj1gytliS076pqdBm1zB+3bvgACjNbcNGTcVh5Bdhz9v/HdRyC9obA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="fJwB/xFG";
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C02606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fJwB/xFG
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91f0274f88cso9511826d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794549887; x=1795154687; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7xFaxwfpj5KbqoBFMnfOTbn14r38Tg3ox9XxMLJZOVU=;
        b=fJwB/xFGCSUa1c4sQ0nFcTBxPUDm0vEK4o6+MJileOdSFdDCEI2Wr7/g242Ygl+kT9
         Lxq4nTF8fe5GG5jbyMUmH0KJWyXOf3As3tBnq0G7axZBe9Pz0DoIXUk2lv3O39uQz4Ik
         ec7QwCs28s4Zzx1mG2qV8l5NMwEvL/xrxfIEn9JcVYBEJqVgSgzSHQpd1F8KjEvlMx0e
         TTv01NljTV6NpwN9WCB6mGrZn2WePa4GrVt2gkrszeM08caPpJiVublWEhjQJGFhstvy
         3hj4UpgRgUSehRDwuhfIh90pbVNzoBYBfYUn8V1l8jv9xGBw+qCGO0QvEZpJfEpjiW1i
         bugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549887; x=1795154687;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xFaxwfpj5KbqoBFMnfOTbn14r38Tg3ox9XxMLJZOVU=;
        b=wStrGUMYyb8sL02CSLW35HkU3TYZX5EqFPMa+Exef9Qaih4V7KRvmMTG59dgZJQAaW
         j3C2IVJDFsJyFHKlXaA8AabInJx6hozAhxYwjWUjs62AXr5xv3WqE/a2iwOLDoUZWl8r
         OxJMB1+adP/bLqN8wJJoEKsuSgTlIAUQo8oiFzDOZldfoRt3Q79jTdDbzjy0fLx3IwHR
         sh63clTrEYfx1Z4n3JYU7W/m3NYSpUBjl+4ZVkQPR56RreRIEZ2PlKVggjfTfEsyHVD/
         Pk4GVkHhiEPtBYrNPn92Y1L7XBRAvsp8QKG0M2un9VxVR0snThLmHd1dlTow6OPVaPJ7
         OKig==
X-Forwarded-Encrypted: i=1; AL+hErGzKqI84x+MX38/Z/MwJJGhxE/mkkAetr3EOZgqeVjU38WHXTTIlWmh5akWVd12Zju7NBZMw2DxTv9IRjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJjiObnQzbDeMoFGJ6oHc3xzB0IqafZW6tNMZgqFjb2O7BHxp
	AYkRAc1XVPEGM4U5m2/6npg9O9QRMbKMviUaKwEy0ke9EzL5/+e6gyYQJDWztoczOQY=
X-Gm-Gg: AYBFou2Ky0S8HoaccIlwhyVQzWtfAOSJ2/JMc8fy+VPiQ5aGwB8BQIOniWKAcYpagSX
	w9LlNRIny/2jaBwc/i3XbEeliibHRdt4y1ad5wjaErE3frNcoxpmd9Fbd9d83AmVMmSeo4tgbJ+
	KyV0d8De3Q0kdyMk0rkhOsQp6UexNG4lLNy4M4zre7zZP3TENVedl8QSPEVKlimmdam414qkrza
	vGfa5rAFEPvZ5QOwHGMxFmvbzhEx5vi3oGrn9tRiKZsng0/mHdC70QTtqbxR3/bIcN9mmnKUIiZ
	3PQvka/UIp0x/Kpx9ES4pnpMsiuVIolz6y3D6iigQjKTqOUr5hJbKjaTwOsLlW8Qv6BjCMrDhGF
	bcHyST7B1UtxKe70o3ANK/mheZ7ol4HATgTh3c/APSlGnYkyimsBNaffOod5kakwzb0CvxL4gRA
	pla7GMqUW5wuw75D4a1OeY2rLZMcvEUbDSFy2TIjfafMv5rrdp7qnc91CnJk7963Gb8pXHnRVR7
	oHX2fhpHYhttc5lvNnAbMUA+BVk7iuJbmLwFM1YCteZ/mfjXLcLouZn8El8rR+Y48CTSRWDDA49
	oLpZS9hhlg56PrQEptzZbCyPJoxw6dvdw/8gNEZnXuOMa2PmMaURdxyYSfNo2HJ+HWETS2c7frj
	MV+0l7lM=
X-Received: by 2002:a05:6214:3f81:b0:91c:6d83:60ed with SMTP id 6a1803df08f44-91f2424ace7mr21809446d6.55.1794549887409;
        Thu, 12 Nov 2026 22:04:47 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ade7sm13257376d6.5.2026.11.12.22.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:04:47 -0800 (PST)
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
Subject: Re: [PATCH 08/12] mm/migrate_device: do not migrate a
 uffd-protected zero page
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
In-Reply-To: <20261111-uffd-state-fixes-v1-8-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-8-00713d368976@columbia.edu>
Date: Fri, 13 Nov 2026 01:04:45 -0500
Message-Id: <179454988585.482102.2051616940227067987.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 12:55 -0500, Tal Zussman wrote:
> migrate_vma_setup() installs a migration entry for each page it
> collects, which carries the uffd bit over to the new PTE. However, a PTE
> that maps the zero page is left in place without a migration entry.
> migrate_vma_insert_page() later overwrites it with a new PTE that is
> built only from the VMA flags, so the uffd-wp bit or the RWP PAGE_NONE
> protection of the old PTE is lost. The same applies to the huge zero
> PMD.
> 
> Once a driver has migrated such a zero page, writes and accesses to it
> no longer fault into userfaultfd, so the manager misses them. With async
> tracking, PAGEMAP_SCAN unconditionally reports the page as written or
> accessed.
> 
> This requires a driver that migrates memory to a device.
> 
> To fix it, do not mark a zero page for migration if its entry has the
> uffd bit set in a VMA registered for WP or RWP. The driver sees an
> address that was not migrated, which drivers already have to deal with.
> 
> The uffd bit can also be set after the zero page was collected, as
> write-protecting only takes the mmap lock for read. So check again under
> the page table lock in migrate_vma_insert_page() and
> migrate_vma_insert_huge_pmd_page().
> 

Similar to last patch, this changelog could be improved.  My best
attempt at summarizing:

"""
Device migration replaces a zero-page mapping with a fresh entry,
losing its userfaultfd WP or RWP protection.

Don't migrate the uffd-protected zero pages.

Skip protected zero pages during collection. Check again under the
page-table lock before insertion, because another thread can apply
protection after collection finishes.

The alternative ...
"""

I have concerns with this:

> The alternative would be to carry the uffd state over in
> migrate_vma_insert_page() and migrate_vma_insert_huge_pmd_page(). Not
> migrating the zero page is simpler, and a zero page that is protected by
> userfaultfd in a range that a driver migrates should be rare.

This basically force-fails a migration of a uffd protected zero page.

Wouldn't we expect this to cause drivers to fail to make progress if
they require that page to be resident on the device?  Not sure we want
to force drivers to try to handle this special case (if they even can).

We'll need some input from the migrate_device/GPU folks.

-- 
~Gregory

