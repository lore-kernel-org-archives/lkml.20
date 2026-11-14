Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640227;
	b=JMRb9f5hYrBPwicZjWKgQKemuVc569ayZE+RrMJzzvEM1F39OdqpUi1ToeKVYIXZaA4a
	 AULaRp3T5ZihlGtpZjGHjjp8VCDikjM7lX7NMtZ6d+/tpBU46hrlpOwF76P9EpoLUC847
	 a0Egq+Ehpc0cdgXiQ6qJoCx92A+QTlI5qIN+8x1TrwIZKq7pBTxUA6qKK8PH4hiVe3zdT
	 hRlu97nHJjKTrBhjPPK1Mnp7U3M4hJiv96UfVaPnnCYRKH9zaLjZH/ht7UkVzEUH8+Ve3
	 oj1OD6VV45yUJHXTgPEyy9q0XUZOBNu+Xlv9z6OxIMBUumAI0jzuj6qb5JVDnKIU4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
	b=2XDYhfX05qWM9EyJkfAzPYsrDPn0XeK049lp8kOmGPKzXpM6CEUs7pWfErMhP9Bhsxcm
	 NrRftwglMoF/KpEpnpyWJWcKjLB6plW11q0JtRwYiitQ05CkXhteYnwRbw+rWkR95Kb85
	 af3RwUQDvxESOjB87I639Q/GldAB5xgzg1Gnv+V6lywvDustvfr5ctRI4iNJN9Y5OYZsi
	 tm5K4RNTSQ8K3nSv6od4l2eUPE8Axc+kQlzYNl6qAaliJGifs11jXaQ6mttZWXp70tHiW
	 /qBpNerHquJCCbfYYauxKUuXbGgvp2BKh8NiADtKbY1S6ybn+g8TsHCYqIeXFfQ9MuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Wak6pwPF;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517B60A5BE2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A517B60A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Wak6pwPF
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91e7af9a67fso11101306d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640226; x=1795245026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=Wak6pwPFiUkKyhQgMf4rS7ScgYnhLHPu/BQFbJsFq7WKKXSUOmiu+EsQFsjVZ8zFDO
         FDrlS7y+5O55UEGv/kTSaX8dffsOnEXEa6/2U/GCtWcFwv0S/O1x4yRSmj13AtftFa/d
         2LHhZ1Xzh9y1vx57sBVWmEQqxXZeF/gRFDaivKFbqeTHuyd1MOWBIFDDx6qnA+nzwI3j
         f0FWi5bqe5XptEAAFE0ZLXHTalZ4ObmYUba1bTQ7a5ucsWoZ5b9b8qD9ay1zcLACOuUw
         HN4jHEZ3DD/E9fTfoTkj/qDM3H/u15Vo16V1SDswP6q5IvcI5vpIGBny10cK9BBE6q/X
         KPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640226; x=1795245026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=uJ56ixRorKqRI8RRHquhb518PAI1wRXVVDhrgdwfRvsfSuEbgR0jdaje3RHPLo6h7s
         vgTzPnqQ3Kb99OjzIoB0oZL4a3NQyYlyb3QcR7yefDQJvIabwD4/htPJFapR87mhXozC
         FYelX7FTNGbFqzU2o/sHxQnynt+SiBQZwSGjaYF2E0pSFQ6h9jYb1mcHabhp/6zzaxgi
         Yrvs//9nrwydbzv4FBE/RybpNaIsgjHAU6bf8ERI/oOI7WwSdbEZL1kV5n3c2i9HjbO/
         q8wC266gsmCfMUPWqDKY6BlS/5XVJHKEghoVEaSef0cUJ/ujxDIrzyJlZWJxMAlkru3d
         aYoA==
X-Gm-Message-State: APuU4Z9ih67uJosxlKSF5NqGa9DQbXOg4+wXq+6qx2HHFHOqfxhNFl5t
	muj/6kykeW+uN+pdnehHgauwPfREEy4Aj8YZmeUkzYshuQFwdWl1ev+RyacI+RMFSng=
X-Gm-Gg: AYBFou3nAvlDDHEOPyGwEKI66JKzaoyoZDFzUsW6hkpL92ZCc+mdmej2hztvIPvbz4s
	T+ludW1pMEHL2xPz/Zz+VgDxs82ZW7EShOKu4VQMxHkITAbsM9TYW1+owPL77AQFT05rZOesSKy
	HKhyNX6PUXb7jQcq7YPaE6/wGlJnTIlXpd2gqZsGlT3U0PHgp2QxvEoREX4sqgzxNvA3rCuC3Yh
	VMww+lX6ffyjgR/MRPlTMTjjdt48ae/vE3qOxe0u1EYR0IQ7HT8oCgkVNUPBGcBsHpe2XC28bIo
	LKssYTftHou0vERMFlpEp4XYck0y5c5OgyjUOvT4MnDvIq3ED+JXWBiFqF8RMiFHw1s8F5gujM4
	vRn7NwNDlmJY+8N7gm90ICc+wtm0jV1JxnIospzwNUPD/85+UNVC+eJOLFElxsh9qfnNxe29QZi
	WzzrwGn4URs5h91opSORqa6eBTR75xlY5PuwdhcMxTsd/9rtOA9Yy8BGR866ZMXF5An7Z3dkPA+
	QVn4+6hcEBp9B7m8eZqOmMGz3bWCq2Fd+U6FXu9Kr2NhauyPDBA3We8MjL0+krqTansy/ObM1v6
	LzdCD/P1E7cGQ5eNdGcb7NoUEtVdyhZBPnm3GWu2RSgHumHXarc2OLI6avMpbO9sQh+8ozEu1vw
	71vPSoReOxCYoAMc=
X-Received: by 2002:a05:6214:e8a:b0:91e:7bb7:fd65 with SMTP id 6a1803df08f44-91f24292699mr81332616d6.56.1794640225203;
        Fri, 13 Nov 2026 23:10:25 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:24 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 10/22] mm/khugepaged: restrict collapse to common memory
Date: Sat, 14 Nov 2026 02:09:47 -0500
Message-ID: <20261114070959.3490008-11-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

Collapse is an opportunistic MM service and should operate only on
common memory. The anonymous scan and isolation paths already filter
zone device for the same reason.

Replace the zone_device check with page_is_common_memory().

collapse_scan_file() gains a folio_is_common_memory() check. Page-cache
folios are never ZONE_DEVICE, so there it only filters memory outside
N_MEMORY_COMMON.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4bbe319ef86fa..b4bd29f25c145 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -628,7 +628,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1673,7 +1673,7 @@ static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -2741,6 +2741,12 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 			break;
 		}
 
+		if (unlikely(!folio_is_common_memory(folio))) {
+			result = SCAN_PAGE_NULL;
+			failed_pfn = folio_pfn(folio);
+			folio_put(folio);
+			break;
+		}
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
-- 
2.53.1-Meta

