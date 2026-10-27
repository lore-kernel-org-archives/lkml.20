Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074945;
	b=bCs2XK8URdz2PDPzeMZ7I5zCw7TSudTmgRJU/MS7mVb0ios8MCzs3v6G7X3pYSnYP192
	 eZHaVV621vOCiBStvqrMFLE8NS0ktkVDHwa5kzsrMvkKQI1WNtz+jKU15s67WTI0ZsVAd
	 vBsRTuYisxwnTZ4aw9JdPXm0faNDH3PuCf9Wyg9UYD34rSJl1/HDptQZA1Ze089yYSMxJ
	 tkPOhgmJk0NDt3Xjk4dNv7HnPSc8DmFrkj80g3BccmnwC2g3AGqxIRv5PZYHbFWTCdXCZ
	 Zv231Who99907jd8+9f1isB1ysH7K+5qaLxHaLD61QlDtkpgZ9moerPW4HA3e5nd2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O/I0LmBFR7uBLBrLDEFm/yc+s/I6APM2Icy/EDbK9iQ=;
	b=alMMIwIQW8Tuu25mKIDsrbWMdiErzkcP5KzB4B3t3DZsGeBJloMtf3xkfDBqycyTXNZK
	 FR/zpjfLZ1CQqTaQbbau9U1FRGkY7+8TOaYz6WceIE/UVygubJ/ukHONXxE5+53swjRkB
	 sCxpazmgLdWYhf/KaN3URMV1Vd13mX1x7segumsFC2e6O0LeHZRp53HJyzV2lMh4880+C
	 z7zb+fjXBE7Kq+fl2gkoBuVoA2ZQRiChNpL50Infj/BbmWH5FJphIrX08mIQslhx8fTTp
	 ob46y9uoOJO+4lxKoGv5hw7CEVAQ73AVJ/2MXQrTgBthEkGHDcll3WStVgiw0V47+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Uh1dDRxG;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BB606A336
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219BB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Uh1dDRxG
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91791ec1b83so29567096d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793074944; x=1793679744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/I0LmBFR7uBLBrLDEFm/yc+s/I6APM2Icy/EDbK9iQ=;
        b=Uh1dDRxG255t8FsdHTDn6DBOQan/CFITNS+SJISOlJdP3PwYjGv3T8ELkvvXQqFNGl
         xnHyMYbjZ6K+jnitvhsJoeGAbAT3fzxUgjR+gVXxz7uBoEYQi78NHoXaFlWZJIC5+ntl
         AGRIr/A6FGmmCBDilwfZ9rn8hCkAXnsmtoHnZ4Tfmw/e231yLueV38JEGEi892tHROMY
         AcLHbdyRJ7MBMSEWYiYmU0fRZs8UvG8+24vw9eLjyYth0iQAeBptkJochELEdv/7Nnki
         CkWWBOU+GiTtCb7wc341KP45BJwnYweMQKBAH2lSkGS0Bf9sONRg6PIQ1WNgNercipnk
         hBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074944; x=1793679744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/I0LmBFR7uBLBrLDEFm/yc+s/I6APM2Icy/EDbK9iQ=;
        b=qNODqueAMlhfTzyUXrNrarjW/eu8TTq262QMvHyra7A4myx1K9AWPjlv1loeJA2YqV
         slYA81Xtr6sL63Ymm1XfYCRjP0l8yLfjlR5W9i03+AbyX08tEh/s7boJacV+td9e7qBi
         QCzAgla9T/DuS+0l3DRw8BpQcVhY2kmc87FroYPCiMbt4eznNLdo6HXUEbhfFOGmz2mI
         R8XYCR2X18a7apCSYBPVR+4+g0fm4x5jYmBtXlG1z1Vmwr99uyaU9bdsyra8Ed2Cx6WC
         xcFuLIuRC5I94hOn3GydVZYk5+36RqR6YpLh0bb0yynJYmPxS5SuJ/mZXFnkP90GOFZv
         a4DA==
X-Gm-Message-State: AFq9FYLn55k045k8G7dhgdKgK1tYABmxLkM/ZHdJjrbTXUgWA4havaPK
	L3G5dAMIZMw7mDSlV8QBfCFsIzm4Go2C0AATE1Ybk4F+qS2M544T/C1PUniXto1Z4Oo=
X-Gm-Gg: AYBFou14hn8o6SpE1epDU3WiJ5AQYr+D45QJYRditpmnxGtKRqekkonbW68Td33+jkD
	8DqdHSTM3/pmh0pd9hpGltlFcGAUc7tcwvIyy1HSuF3wHQuZGisY0XFr6eOw33dZuEf6oKN3zYb
	Dt0MMn3vJzbP6TxasHJ62xxJ4Mo34RgEyCq5hSmrOncORy2WmY9CM736TZ8MozIeTRSKLOnBytQ
	TXQILak8jzFbLLxu7j9loZHA2E4vl7exen8Lh3PjZI7d5XKVEs5gzlD3VINAfUjMkzbtdXzfskJ
	271ns0Wnj5iicl8TqHaM8C+bR4gvc3N9KoRg18N42/9RJRkobbJcNxyKD+sbQ9BnK6JUvIrz4f1
	gyEbSnIEzA72I2pI6OK6LldNHniZE3AmyVlTfpNsbYwCW738Q5qtJoNHf/bxukHwEy0LYj2cIcw
	qbRh1crQbhUM4D0//65K/hUhfGDVP6UlT52bx1fE+SZ9QvFgflxm9fBfvq/uo4+/C4GmpCsjJfl
	l8LXCXFjAe8oefI/j6wDPHwP7wYpa1pyVv2ED9k+lgjjVsopNf/3M2ITKaDjKrFkb58ZRkaxtEx
	cSKoPCZPKVN34jDyAIHoy8mEkAiz+KEAcE6ybWkXIg==
X-Received: by 2002:a05:6214:800a:b0:91c:60e8:a8aa with SMTP id 6a1803df08f44-91c60e8a8c1mr69350086d6.49.1793074944062;
        Mon, 26 Oct 2026 21:22:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd01cdsm91139676d6.7.2026.10.26.21.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:22:22 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	osalvador@suse.de,
	muchun.song@linux.dev,
	iamjoonsoo.kim@lge.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH 4/6] mm/page_alloc: don't undo another isolation in alloc_contig_range
Date: Tue, 27 Oct 2026 00:22:02 -0400
Message-ID: <20261027042204.3741307-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027042204.3741307-1-gourry@gourry.net>
References: <20261027042204.3741307-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An alloc_contig_range() that overlaps a block going offline can leave
the offline spinning until it gets a signal, holding the device hotplug
lock.  When isolation fails, alloc_contig_frozen_range() undoes it over
the whole range, clearing the offline's MIGRATE_ISOLATE too:

  CPU 1 (offline_pages)               CPU 2 (alloc_contig_range)
  start_isolate_page_range()
    blocks are MIGRATE_ISOLATE
                                      start_isolate_page_range()
                                        -EBUSY on CPU 1's blocks
                                      undo_isolate_page_range()
                                        blocks are MIGRATE_MOVABLE
  test_pages_isolated()
    never succeeds again

start_isolate_page_range() fails only on a block someone else isolated,
after undoing its own, so this undo only ever clears another caller's.
Return directly, as before alloc_contig_range() went pageblock granular.

With offline_pages() parked after isolating a DIMM block and a 1G
hugetlb allocation made over it, the offline on base still loops 30s
later in 4 of 4 runs:

  offline_pages+0x5b2/0x1570
  memory_subsys_offline+0x17e/0x470
  device_offline+0x250/0x340
  state_store+0x88/0x110

With this patch the allocation still fails, and the offline completes in
3 of 3 runs.

Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 55d3fc4b307f5..bb3c7e95f2ed4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7396,9 +7396,13 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
+	/*
+	 * On failure this has undone its own isolation, and any other
+	 * isolated blocks in the range belong to someone else, e.g. offline.
+	 */
 	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
-		goto done;
+		return ret;
 
 	drain_all_pages(cc.zone);
 
-- 
2.53.0-Meta

