Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D141737F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030571; cv=none; b=K1ToytN0Cyicqh9b+mYDP0H+X6C4iVoGW6CeaULZwDafCZ+hy9Fp6E33UurtxgnmQiZoWOu2h7RlSTW+8J5A7aPByK82e/dyFk4F3rbjzPApNo8LRER2IDblNz7hkaWAjgwJD5nwV5pjtLRG+0l5GyaedwHTkpOY1mMTuQKyb0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030571; c=relaxed/simple;
	bh=3mETznkI5OH7f+YXwonxhIQNBhySzPV2vF7gnTTFy6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkifsAv5uLw71UiBV67wuva/Fto9LnJ45dwajNrS2x+l9vHwn3Fk0RA+K2YJKDDSFJsRn1Lfwl4UVV6oQapdZIRZ5rqflVi1dDXtZJHwZv0RkX/MD8o+aFfLdfB1KdJer5coeSRaOcZAruePlRBw9J4B9HOs5VZosiVXT4gfsjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=q78TxGpU; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=v5vbEQ8x; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="q78TxGpU";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="v5vbEQ8x"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZHLe2638518
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Qd8c
	ecCELFD5bdWPS8BkzXqz+Y6D30q+8Og+jFoSTy4=; b=q78TxGpUNktCCwYYDZWa
	B6x739MK/D/w2tDFAhYlffntu1bm0LIrUXNEgo5ieW/SRpnx60Zbb+L031/dldzc
	uuFph98K+q9OPb1UqpecJZKQxKzIJlLPMLRDodSUtovneH6CKtX/LuhA3fsqnsCt
	fhPbOJYsxs5rwhjScQcZ4ml51hwBxDOoUrqPRnnNP8CFFOShS91075NSkboyBPo6
	B1NsQ9DqpuIrs656RgEPv/FeCOu5dFNXdv5QJOEQk7CnMBhkIdqhdg8V2or+GrWR
	s5rpFyukAdoQJ9vPZKdq53dCsTE0ks5e/slVyRkMuxykIeJGEmGPqoGCnNG6BJNZ
	7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbree35av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:29 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fb2a46cb5so54120691cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030568; x=1788635368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd8cecCELFD5bdWPS8BkzXqz+Y6D30q+8Og+jFoSTy4=;
        b=v5vbEQ8xWoWAB6J6Ped3NHKhZnEXPpI58TxqTjsvTlxlyWGrlqm2HreSoniNc/fvyE
         n9fX9JbOGbnNbIgSoDTf2imKLXkxgQRamp+d4mUyQIafDyX98nnEIGaMXezdWeXpLdfM
         vihdLAVJRxyvDhOSnWRekq4KbIJagPU9biaRzP8d0u8fr48qWD0orFgZ12xsQcoNg6N1
         VBOSkljxvVaOcQ6vhhWu1HT+AzFFaRYFfMgtiNIzmDiuM5dK1O8GN/+Asl41/INtc17K
         xNHEP7ZLs2DscQT5PR6LYrjjFKVxLrLlV99Z++Y/61rXvJq2ogkKUt+nXTVIGfeRl6SV
         LKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030568; x=1788635368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qd8cecCELFD5bdWPS8BkzXqz+Y6D30q+8Og+jFoSTy4=;
        b=g6EOIdF6RPqmvjh2KQod3T08je1RMZZ8esza1Ff0frOZbO1GoLEpzbxiLgrP+2FZ7k
         G1JyOS3cfn1My7NVPF2G83LS4xdhh+kkYb+dE76SMR1UwUsTMUAYmqfq1O07o05oB1Nq
         8LctNqlPr9xXGRt8+ylHaJrsxt1+pKJ8O8CreWenJx/X8LqFp0TseWQMhQY/oDYsk0OI
         EgSq1VFDPSl3VuIPI3G2LBVeSN/Os/0OcDY6w9ay0HjBTPaEazjyVU5cRP3lrQu7kCUl
         YlXU4VnAykoj1iaJdU51G0mTYTQXNffm/kB9E+WS+ze/BcxUIE23E2JjnBCMtD6xVOZq
         Qegw==
X-Forwarded-Encrypted: i=1; AHgh+RoM40j+yZ5OpKBWrgtqGBy8tmwjwq7rw/vy2wR9nCYnXtm/2Z3IzHB6mR9YFySIVgWBQYrQrWQfCZFpcoc=@vger.kernel.org
X-Gm-Message-State: AFuF++k4wxfNOsZLEXotT/3QWMf4C/tZXbbPy7fMybA+Efdmt4ECM2b4
	9tRs7IsehaOB+9eSzkoip8xHydh4a02D6YwZTSpmwdz2H/Ac7KD0GBwG/pBhWpOMA1lQe2SuFvV
	OMfbOCGDfFrASvBSsm8SqmZ6zuy99jF7ZRAUA/4RdXW0BX3rCEOZCWBzWpIzLBA==
X-Gm-Gg: AR+sD13CQJCsTBcAa0D0QSZOsodJQSJ4VKlkXgaLpMyZzgmOFaN7lwaVZMbY7CBEwor
	UzYqh5sBE3Waeb/tiritR5rJm5NPG3AIaDoCQVPrD/H8IoTWP/UWMJ/rq0F8tG/wTQt1o5yaM46
	9VoSSyPobaHtmvIEvjZGO9hq2A4IZmhjgjjcwRYKj9VELMdeGqbjtYj/n6vsk9jhnQ2yVBINXbn
	8NpupBQQ4xQS21NlHz0f8yp4k6BbFMREKmInK8CV5U8tevRBLysVBLpmRPv1AMPK05G3t/MTKGE
	W6uYyxbs+2ZkxaJLUysJZW90oUhF8avP2NOZRDaC3FbCshb+4pykdbAk+Brhtz8m7urlNfYasvl
	WYyX4pI8I2zac3l6rleuUeoVlEIhg/pw96Hn8vLAkGA==
X-Received: by 2002:a05:622a:60d:b0:527:43a:2f31 with SMTP id d75a77b69052e-52fb9406840mr173558821cf.15.1788030568257;
        Sat, 29 Aug 2026 12:09:28 -0700 (PDT)
X-Received: by 2002:a05:622a:60d:b0:527:43a:2f31 with SMTP id d75a77b69052e-52fb9406840mr173558331cf.15.1788030567802;
        Sat, 29 Aug 2026 12:09:27 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:02 -0400
Subject: [PATCH v2 3/6] mm/page_io: use swap entries directly in zeromap
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-3-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=1980;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=3mETznkI5OH7f+YXwonxhIQNBhySzPV2vF7gnTTFy6I=;
 b=qT2xa4TBuFq785SRkjS6czWfdHiCo+8CrJ5OYkcXFJOK+hO5vVuW7nLuEhFRSMSTgJZRv7qa7
 SjUMIiZXOi/B8ZL0k3knMQ5cuM36lRhwSnNOk1JHm7uSWhvBn0N5zlL
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX7EGOvPga3GaH
 M4zkS7BtRzFC/9LdRZcP7xSlPKHQnFELUXns96m/UvxpYYde0JouDs5V6NT5yiPC0FeUvG4Akrl
 L1PdH4/051RySPkPui+EMkXFfTj/o4/RpgJbqkhJI0iFBEuP3YHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX56e/0Zbo1ZI9
 0Jhmw63p6tjTcqqfBfIOHMeJZ1y76VK8wWoqa6M7cBLJE1WabDKz/4Xy9FitjXUWngY9J7RKv1i
 sd0Ekq359vuDseDPrmKa9bydLpUC4Hqt5Q7V1FEYYpMf7em3HhMFxkg5qLGgpEANH1vGpPpKO4E
 XmXYUiAtp+LZvTN8hF1yA7EegN0+cVziHceoGH1YS0y1b7d2mPbpPvsmPO00+ENxBHggbfiIai0
 byp4iJVs/iLh91kyRstCOI0fLX56ae44xgOVG61MeXtLK5to6LHewUcFZm0OVLshB2bui0LneFS
 UEMOoqUoTJgNdpCnIArCBdw2zY1LtemGNqDe7IBVGbjjjpVoEAsxpey9GFyv1LWiZBfPoC/1NNN
 xOMrw24/HStTuNOgCM+qG5y94RRVmA3P1pWjxvwhMHG7tkyyR8362QJhte40/pap+nYGGVqEd7L
 tO1Bp20q8CvXnMBSeQg==
X-Proofpoint-ORIG-GUID: ecXJIxE4BRD3h6S3FNQiylj70FeEIOT4
X-Proofpoint-GUID: ecXJIxE4BRD3h6S3FNQiylj70FeEIOT4
X-Authority-Analysis: v=2.4 cv=JtHBas4C c=1 sm=1 tr=0 ts=6a932e69 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=HViwNVsgdNRDn9LUnL8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

Increment swp_entry_t::val directly instead of recomputing each entry
with page_swap_entry(). This removes the last struct page usage in
page_io.c and saves one call to compound_head() per page.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index fbcf58ff292d..dd95cdb0cd7a 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -160,7 +160,7 @@ static void swap_zeromap_folio_set(struct folio *folio)
 	struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
 	int nr_pages = folio_nr_pages(folio);
 	struct swap_cluster_info *ci;
-	swp_entry_t entry;
+	swp_entry_t entry = folio->swap;
 	unsigned int i;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_swapcache(folio), folio);
@@ -168,8 +168,8 @@ static void swap_zeromap_folio_set(struct folio *folio)
 
 	ci = swap_cluster_get_and_lock(folio);
 	for (i = 0; i < folio_nr_pages(folio); i++) {
-		entry = page_swap_entry(folio_page(folio, i));
 		__swap_table_set_zero(ci, swp_cluster_offset(entry));
+		entry.val++;
 	}
 	swap_cluster_unlock(ci);
 
@@ -183,7 +183,7 @@ static void swap_zeromap_folio_set(struct folio *folio)
 static void swap_zeromap_folio_clear(struct folio *folio)
 {
 	struct swap_cluster_info *ci;
-	swp_entry_t entry;
+	swp_entry_t entry = folio->swap;
 	unsigned int i;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_swapcache(folio), folio);
@@ -191,8 +191,8 @@ static void swap_zeromap_folio_clear(struct folio *folio)
 
 	ci = swap_cluster_get_and_lock(folio);
 	for (i = 0; i < folio_nr_pages(folio); i++) {
-		entry = page_swap_entry(folio_page(folio, i));
 		__swap_table_clear_zero(ci, swp_cluster_offset(entry));
+		entry.val++;
 	}
 	swap_cluster_unlock(ci);
 }

-- 
2.39.5

