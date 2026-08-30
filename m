Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426743AC0DE
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086034; cv=none; b=j50eoXqCP8fNkFQ8/4zVdYmzUGsaZ5qefGEjJtfPZXCqWBOSep2n1Q2sLsyyAd/uWcg1cWJR38Fi3N9BeuRCdo7O+NRqhgGRfTIfXbLbyU2/Iuw8thJ5bh9kffcg8FB+TTFKMLdTjBqcAjtwxnGrEdcH7qNl+Ab1F+hIVg7qE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086034; c=relaxed/simple;
	bh=QUnk24a5m8yz5ZbJrqhe5QuRGQ1y8Pb73+CWqNpDSpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shkwCTeAwrcetYoid69LddhoyvbGkPL7A9EsNZBB2XrpXwtVU8tqfeM30eh1YaAqwPmkOpL5gfLUbX0dVOxB93RAF2TKp5gdZazrIrBKFh9fbgFCoch+IIR/f+nAvAJNCvSfaynxKPMS+x8cZKqJkt4Vk5DJR3KzwLyPnTk735c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WEtkyWrQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kFuQcW3T; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WEtkyWrQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kFuQcW3T"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UAS8Ue3299277
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=JCz6
	TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=; b=WEtkyWrQuMLAyQJfquvx
	k7UMw94sA32wFOf9YloYUNSyS4hQzHHb0ELsJQ5GIvapw8mZKuXQbGZz9Kx8q2Ia
	65hqikIprptymJ5GEDlBevRjNslGhFLtjnKmDlcEhSRwHx05Huct96UUzYanxApR
	+dMeH/qpAF8Z0bZc3t9xpB0jn7eeXT1P60fiFRnluk2e3IEq+N0Qp2LtgtSyJxd8
	TGWhy64E9dXzIudpWbcPrtssFIaxH5Abcxpis+8U3KcEe7V+rA7nVNboa70yUW0I
	dGNfLwGfbkzbsN2Z6ZjrbD+BJ5poFIcCbk/Hz2tDROeIfsNwpFM0giMzlDO6rXYR
	dw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbudj4n1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:51 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fbe82671dso36141301cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086030; x=1788690830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCz6TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=;
        b=kFuQcW3TM1mr11KDvF2GqBncZCC211rulcTDkvPHk1Wzbba/nBelcsUUtBo3GImu8n
         Yem29xtg6LtH9sttP1p8FSmFtxk+LYxXCDXsjAwa5fAYtQ1UD3vpUqK6x5ktL48NeY8M
         XEyLM/iNgaJM4KDitiXEa0vWUXILHTPrcV7DC3eEoCU2QPcFS5b6GihpO3HKCDsAwiqW
         Dou3wHJyQ4tfzXy0fG8qia2fwpz02n3czeQfLqdVgIf4w0hzMBz1RAi7BptOo6cdcXBs
         UqCTYYKhqlRWAaBV5g9uPPySed1PHCTEET95nSTcJydM/AhlVUBj4EUy/YIemULY4E8v
         GMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086030; x=1788690830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCz6TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=;
        b=rJDc6CMYNzvRix8XlKqThKRuH2fd5UBZ7Hm4zhuItdWWkVMQMnUN6yQG9qKn1T6Bx7
         03JoQP8avlshpkR8PYTLNcaulaXMlyASWyP9l0Pxetqlp5fHmWImEmcgbmT7/bk0XnxJ
         F0Y8I81h70NVx2oZulqbVnkiaOG/bnEOc7yv/GpGWGbOS8NX7Xw+vOln/B/qF/5/RnWJ
         cI4/PjuQu89/Z+9EJcqhTa2wVIyJr8V7/2j8XQ14EjpP7ChwLqEUK36+wpuPFMhCykfX
         a2JwgATtRvlhnvhFumf+hGffbl1EtQDdQ8OL6hW9kw8UiQV/qwS3N4CEMTJOve3YAK02
         bRXw==
X-Forwarded-Encrypted: i=1; AHgh+Rrjpv01l3pW0vMhO2/7eIHrshtrjHhUWotFuFuXIL9Y2y2o+IGkZA+nxL7z7moGUVkoVu7C8XfMP9gWkaE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHvsd21PVcqYghCudw1AIBMHh036sVeYkb8ddaBIiuHHZ5rnrZ
	qBaIcuhKbaM9CRy2Kn7oxSC25pHcrzBLrNyvYJg+Dzy16sftEisYZIvRuwOCz19H5aLJ6gsfwr9
	u6dgr2zsu1AhTMD4JGeYkKzMP++hSeuHteS+2MiFtrwcZQIGHdEAzmPWb1DMgUw==
X-Gm-Gg: AR+sD13y3PW2PthqS4JA4KKSwNkZ/K8ePujgx0UHiVXqQe3uluzUVkY28LxVmFVNKaF
	XTp+FjtFJb6Sz81vY/U7UVmNYPQYPsCMdJaYc/Nktgxnr/chRd6C2YtB3wlyrfEbIhGrpnwfgBi
	L7jPS+W5RAwAkuF8v8fiBWnSIfPqurfb4+3JZBNvccu8ft1UlqlW45S5rkh24kRGqEzRiNB0ad5
	dILAfem+2UQcT40faSlApHzSz0OIzZUpDicY5UHyUll15mtvY2HHO8HAdQ+gTJJIifafBKrh07v
	wSOdtW9T0SPA3G4Sd9z7yqlJ4x+4ocZH7hSut+49ZBiESENoz/hXb7gWQl7rDv63oWTpBCWNyvs
	cBA+JleVf2/wEAOiVEQcKWteB/qhQ4i/Hp9SOZKBleQ==
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr275725371cf.8.1788086030630;
        Sun, 30 Aug 2026 03:33:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr275721061cf.8.1788086025492;
        Sun, 30 Aug 2026 03:33:45 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:44 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:27 -0400
Subject: [PATCH 5/8] mm/swapfile: use folio_page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-5-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1012;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QUnk24a5m8yz5ZbJrqhe5QuRGQ1y8Pb73+CWqNpDSpw=;
 b=rD3bjW5VlbToPZmsPYLIPdScpwZ9iyNjv5RFx5o7TeUw25j31bQHhyFDgRRA45Wy3q+XZswAN
 z+0pSelEWUqAt2c+uOLcWNt4kpdF525CGBahVVb1EDd4i59VGMgTxN/
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX3xg5LCrbhmS/
 Ux2VVCLU4dzola9uzda+ecSmkmZ34Vq/SNyA+byj7mmXpsWJ0LttVb3Y1uaCzqiw5EIkCxZHPzN
 +Yd7PzntpQCzzXo6pRqRl5tU5EhFPpcD5shP0WuyxcvF9Fi7N4LD
X-Authority-Analysis: v=2.4 cv=Gr5yPE1C c=1 sm=1 tr=0 ts=6a94070f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=xqDBoplpeononJk8d44A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hUi4rZuYpsPLZ2zXIuMX63atpubNpfwS
X-Proofpoint-ORIG-GUID: hUi4rZuYpsPLZ2zXIuMX63atpubNpfwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX122Fs5Yot+UP
 Q6QeMnTUz85eaBx1OSk02WLhEYtRElew8lG9d2BW4aZkBeSFhnGgi5NCa/zhaigWDkdyTYThc5e
 btZs5XLyZlUR8DZQNMx6hdSWg8KF6ESXH2lGM5pzEE+knbOJYOZoVXttKSH1Ow1WVWRiJ5TmNug
 emW7X/SCtVZoN5Pa8Ixe8hVdI7Xz9NSQsNQ/j//Am3QWkNo6u6+PGyt4rNsy8xU0zSOmbJchW/r
 bGwDH1lXaoj6/Zzm6FyHy/7acSnm/VCFK3UBVb7pHJIvJROcItIn9ba2ykYRCfput1jsb1A5wpd
 N40HiJbNvlu941+W6Y7yQl+G4wIWwKSbaY9ONVUwAmu4TZS/Gdxcs+Gr6ylJJ8Nv1xbiY0DR44i
 ocnzEzmOsapdZqpeEsfJZn9L3WH0JYhectdiDDtHYsamiw0OM5HnEa2FlfospTkK8HrckFZeaCl
 xCMC3lvPbMNjyJR++nA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

folio_dup_swap() and folio_put_swap() open-code the swap entry
computation from folio->swap and folio_page_idx(). Use
folio_page_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/swapfile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 58db70424253..c7b8e69a1227 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1810,7 +1810,7 @@ int folio_dup_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 
@@ -1837,7 +1837,7 @@ void folio_put_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 

-- 
2.39.5

