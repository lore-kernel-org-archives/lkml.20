Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179044B2CA6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948628; cv=none; b=tIg9jLR9axpXYIbjNb6qO2dG5xaOjkprzf8TENxwrJNnxXfDvFstOEtOGdqyc2F41gtjbt5j9o/YJ/Pd3dwpLywRiNe9DWa+nhY7K56Un5G1YhUIfcWsSOlADIMFwd7w4a5vOIeT2SLn7QzQzLQlQNlTWps6hDcRNAzkMcmPIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948628; c=relaxed/simple;
	bh=1gndqcwixIf69ERl83wZ/ahlq6SVahr40TbASWBQcgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YhuT+A42l+U+pzQ9Agycxj+T9KLYoiiIBWk0VEtyzCvCoYvAR5qISp5dZ2bH7lXj4D6YaQMjZq504VaS7++bXVT41UMyFO6jaG2KjDPiBYFj5yPBXhP+I5D2GppXkQHqQiHevnjI52GeymSSPLahYlZXhjlvTyXBW2ByemMomVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bgff6UGd; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bgff6UGd"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so6947908d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788948625; x=1789553425; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsHaeoqxnMhy2GB3rUAu2bzr8hj8izpjrzp8bJJzBnk=;
        b=Bgff6UGd6F/BxFyng4Kl/LyCtan7qCWYfurAm16dHjBKg/yW/+EtIiHOldFnUPsRy9
         LaK3d/O6kMKriCN/VVi/dvv+tdmDyzQJdGzAk+Jue4tQkTS3ABctBnM8dev21qLBxlev
         UliqiGTMuPygDF7R613arm5jJYiO4tVpEoUWk2V1CSrw94a8RFIqnhttpr4AflIQbk/Z
         NoGUgHHTEoDXU4DAU7Y81b6VuqZnehJY5C1AIOlh3KQseylO9XxUIpZvO1RpgvWw2TEV
         qiIrxuhxLDHpL5q+jGjTFzLrMdInp6PfYEz2zvvhYvsDoZ+vtg3xKiP+amY+WOI3s0BC
         pwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948625; x=1789553425;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsHaeoqxnMhy2GB3rUAu2bzr8hj8izpjrzp8bJJzBnk=;
        b=dAf9+6iCMQSu+GYWK/K5eUi/t/GkTsfrwGO05COKulQeZNSKFnqq6c+bPGpuMm+HMF
         0As7OepEy/8wRTmPpVd3lI4hJ1o5EDZ4/eDNLnEYw3eROp37dz6E8vK0wsP+a4122S8h
         o3U1VfL+2x6Y5Yy7LZyY5+NExcyuwnUmxpRfe+ziUP+8oyOxaqaqZocwhicV8Evfk0+6
         4gqpYSnCtT6GJ/cssqGtL+mTmOh/aTbToGJK4gHRrj6Q5X/hbJ6vKheIelqQEQjg8SZ2
         GK/eeur2qqliHSfMDNOMOMzvDBSLiReCFX9v0PCWrVmKHw28h11NceaXJ5CkLwuKG7wF
         YEfA==
X-Forwarded-Encrypted: i=1; AKwUvBzr+bt3eIi3vmEucl2bfYJ9Qt6YJkMaHggQEuJuypcL/Yjeij1krHeCRqrC5AsZctYxSHiu9qVV/sDXLVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nsjE5MwH7/DthmOMYPO0qRODWzl4XxxIx5ecx5n3Bf9JC25Yut
	JveOHr5QehiQHJIgDLk+ciYPl84C9MeCGfS2uxFiypbUTq9uondGgMrnAejVuG/CQQ==
X-Gm-Gg: AYBFou1sSU1+yvJrbY6p+LVxNzYxXYSmUJjbyvc1ZJ3FrnZPxZHg5aSM4mjzvxKdJHI
	YKM0EWV1An93hodT57rrREWyEOQ9KXmCkPtm7mo8TGNoWrS6ACjyGmdvl05Gtv+5yHPK5AvkIkj
	OTwyyFD3cke8n5Np+aAwgAllIKkiizkA87U8fU4ZvsBxnOuf+sGVTWPAjB8K/6B/nlLUihefAfL
	mx7ZBExlcosEUbpFzJ/srOfnF74IPVyIcYlGihIE9o9VStfEMsWWjnfHh97JhFasR1nofa1eLr8
	v4OaYGbedyUs9VymSwk6NcZToQQj3xUiCIl+s+BXDATpFF15BEWtOP4kEq6RlHVjXpfIHe5Olwz
	ZZND01a6OIOUTYXvl96NrGMWpE3K4QCrWBnYL+4Nj4nY6DvXAU4oTRj9qDlTotYPwOdhP4AscMH
	7nOe/uQ/BeZ26Iy7LqVRAXMvJQg5Vg9jshBNYzc/+OPI0pkPIrLzFT2aYRWLi34N49zGiKlgrS4
	hFf5yhQyQ+dymJTSsW0jqKDYbhiL1SBo498Be7Gw7IKoJg1LvTYPWZTt68=
X-Received: by 2002:a53:ad49:0:b0:66f:c1bc:4095 with SMTP id 956f58d0204a3-66fc1bc4852mr7414444d50.88.1788948624105;
        Wed, 09 Sep 2026 03:10:24 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48b374bsm12096623d50.3.2026.09.09.03.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:10:22 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:10:17 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 14/26] mm/fbatch: no lru_add_drain() nor _all() for
 memfd_wait_for_pins()
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <5b393933-b097-9d70-be09-2d00c8d62f6b@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

memfd_tag_pins() used lru_add_drain(), memfd_wait_for_pins() then used
lru_add_drain_all(): remove those calls, no longer useful now that the
per-cpu fbatch references are gone.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/memfd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index c708d92533f4..064f24dcddaa 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -40,8 +40,6 @@ static void memfd_tag_pins(struct xa_state *xas)
 	struct folio *folio;
 	int latency = 0;
 
-	lru_add_drain();
-
 	xas_lock_irq(xas);
 	xas_for_each(xas, folio, ULONG_MAX) {
 		if (!xa_is_value(folio) && memfd_folio_has_extra_refs(folio))
@@ -168,9 +166,7 @@ static int memfd_wait_for_pins(struct address_space *mapping)
 		if (!xas_marked(&xas, MEMFD_TAG_PINNED))
 			break;
 
-		if (!scan)
-			lru_add_drain_all();
-		else if (schedule_timeout_killable((HZ << scan) / 200))
+		if (scan && schedule_timeout_killable((HZ << scan) / 200))
 			scan = LAST_SCAN;
 
 		xas_set(&xas, 0);
-- 
2.51.0

