Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660085;
	b=IBSXOR+ibBG/1v073y8gg81m0Pgy6LK/i6zcSkuZyl54cyUZ49GleJrwg8iHe+o4QmGU
	 NJsu8j6fUs5kWwNsRhXgkKPK0XzR4pzk3dWsIUG5Aq3yK51Zze08gXbEYU7TVexQGbSub
	 teF7PjUhlCr3qapCvGXwM+5eFLFDKVNq4u0QQgOH8JRfOHfURHXz4Sg4aBsKvemiy3kvU
	 ifVFcLM1Xg/9a3AnYyen0C8fkTuAOISEbfvoxQ9Waw3avDv9l+L3wxIDNDFY+MhHAly5V
	 Smh4bN3LuubDV0XcyoidN7XDrT/L/0uN0NX2w/Hx0a9HCH3E75Aaax1J483ngF0Hlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9mApYXyVMf8wWl3gldeOyYhwrTicSkRy7tZqqnYd04o=;
	b=ouNbFbdw2fnvaww1Ri/xRYXX5Av2Gne0BSQZvrTt03ifSgstJEWaAYEOzKtRuzRVJxce
	 LVpx42nakucQsCrZ72k8UayxUXDkI9Gf8Sajh+lPM0+dPFsbDeZU0jvIS/KE5klh2sV37
	 pu37VDN6T2at2SxfVm+tLqsZRDplrhRB/I2isSE9tw+MGqxniGu84ljcH3TOUU+rxGCVJ
	 G3nvDr03LTyWEW7lgVfSz42jFo4m1kkpW1V1kUdgN+urYWWZLeEM+0e4G7VWk6YBg+COF
	 kZxrCCj0m60/+SRkdLYGU8Au7q9X1hZ+zowzmKtmeEvVrW0VT6RSe2QWM3t2SFQ2SDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=egR8AAPu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cxKIvwTf;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8FA606D801
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8FA606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=egR8AAPu;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cxKIvwTf
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LYHSa3313887
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=9mAp
	YXyVMf8wWl3gldeOyYhwrTicSkRy7tZqqnYd04o=; b=egR8AAPup/lxUzDssFWL
	AyVFd1kfHwPxMkMi2GuVuHfDsRFEIKaLkYEXjyGf4Dmghr8ngZbT10w9Z70F6JYv
	roiTL+gXlO9tZg7hZU57Xv7DtXNxcaQs8mSMTIYrT7jXk1uH3Svie7U7ydnnpKKV
	0Qz2VixSdqSORAzH2hTOclwtFadEPdsuSsVaFA7KC3umQM7yBgY7HsmreyGpnW8W
	pIar7yjBsROX7T6rXOSrZnzorbW2MRsB7mnhO4bMRmjhyWEuScjMuyev7LAWBvzN
	mBYnenRZSXCrOBS22/91raI7v1xaub4yhVMGojZqFPJdwaBuqtFxUpexdkxaTGIQ
	/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hpx3v38pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:44 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so430540285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660083; x=1794264883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mApYXyVMf8wWl3gldeOyYhwrTicSkRy7tZqqnYd04o=;
        b=cxKIvwTfbioiZw23IAfVVrFCw9RQ+F9mgsXnpNw6/gXLC0fiZ/5HJfVa9hThGC0h8V
         DImQSYpiqSurToQelxguJqa0/1vxmTIzIy/YwqK0FLI8jtCMWv6WTugY1tCLJ1ksYRuh
         dSDu7OTmMaGgVVUZMERIDU2XNVe2RXQueOEJIsuwFPwJQVg3caUUTjl+OMMXCRtEN0Xv
         CLWNOCCMNCKLVJKWtHoTQ7cuTxIcmDp0MHtfAzDNwYc/eBU626cZNavJ8QxOl/C7pj3E
         P0zc7ItsDhUqKXsQHV/XeyJ3zPqoPFe+iHe+TO2+PFatcJyHiMUegMKkRxwNy1kol9+W
         RRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660083; x=1794264883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mApYXyVMf8wWl3gldeOyYhwrTicSkRy7tZqqnYd04o=;
        b=xCKGwJqA91KBSuu/I06NJg78fqpm+VjyhLxusPNP3G+smmia07M8IcA2bID4pZohmD
         eOqcJBUVfoczzdw2iJtIvUvXkl1UduJlA3GPEnrMyGLyjZZpP76zQQeahef80hZCkeHC
         u8sBGGhXXzcj1sPeiF2XD5kKH0Z0tdVijo5+Nj/sQ0xzXlE1tjGmPV6kF/KxFpexccJo
         kMxBrMgxiepy3oIm4Jb/Qnf26XEHAkwC/rRLy5+zfOUP62dlWTLWxtJz1s7HeQp1X3Ay
         o6yTYjkaxyzl+CGxlNrO1EGMmHg3RDbcB1t3b1FgSxJC32iEOpUikU7jHZdq1VsdmS53
         oQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBypt7/wOTgKLu0rkceuSuJAAYk8Z03+316BmiCDIW9WF/PEtPJr0pzQnT9HlDEG6CtIynzdO7LoEaALgYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AQiVqXhI5c358xHEh7abTrYEz+OyXM0KoKnGukL/RiG/2b5k7
	CM4dfEoUtd72nXB0ayyvhOBsgeEIbzejODs5mA5w9W8qnt0AUM8+BJQKs67ekjH11g1QHHTx1kj
	I1cG7/Yxsu3g34yNOZhPPLFreKqjlcxIoqkROyjxQwfkOqIQE5PhoAlZF1bC5Og==
X-Gm-Gg: AYBFou3priJAdN/QQnWMYm6dwXRdnw5DYhdBqXcBqqeeyHGDuEZEn+WmEUkWWs6K07J
	6E2+UkPvi823rU8RwZ4/NAe4fYz7qoCSX9ZhsTLLMsLdDvsng/MehavCnSWG5QfrHwkIoDH9Ikp
	U+rMx8zlLKykid9HQPXusKFzC+X8r1Gty+5NliAUYaALJVU9+5NjJuhCJ1cetUQlgPNaeP7gSld
	nhPzA6nnPUKP3QgAOlpkenMqsGcFKvGBqEYktFrxepqHbiKeBfi8wMHuLqguMyZm1k5qUGPXU3h
	+Fl5c3TvaT4bR8h0swydlNDsIT9ZXrTJ3HYo7t3q6BpYYGaRfmITRpvPz3gDNKQn+AH+7IWnlBA
	Xj0kXWYBapg/eiynkK1hrJr984Ooar79SWV9H67VuoVnFddCCCIVGagi5fuc=
X-Received: by 2002:a05:620a:4612:b0:944:14f9:8ef5 with SMTP id af79cd13be357-944216f1f37mr2015909385a.59.1793660083412;
        Mon, 02 Nov 2026 14:54:43 -0800 (PST)
X-Received: by 2002:a05:620a:4612:b0:944:14f9:8ef5 with SMTP id af79cd13be357-944216f1f37mr2015905585a.59.1793660082956;
        Mon, 02 Nov 2026 14:54:42 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:42 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:11 -0500
Subject: [PATCH 6/8] mm: remove find_lock_page()
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
Message-Id: <20261102-page-wrappers-v1-6-e7280bdb31f6@columbia.edu>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
In-Reply-To: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=1351;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=WnZiaoLf1fsKtQgiDJZzhQv/Ag7bXfwRtEW2BWXMMlQ=;
 b=grLgHIiUTLhVj/AOEt/zWlW7iXhFRri7nXn13M7PaWaw/v/JlVsyYfny63+C2WfvSqYvj7nNe
 A30CPFguwkACa96UKMPYxAYi1hmuInopEbrf8htf8EJMU92e3oURAqY
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: kIsSxpBf8st3-MGClz-2Oj-z3QJlaXeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX4pgpTZN3eR10
 QdAptmuN2BckVLlugpDCS+dAB41tIQgfV9p8wSz3oz4/YnZ6BzQD5WskDOuINQ6NTHw+zsttPVf
 iElFdjZoQP9r2opxqBXtUnuWELP0/WxIw+nshFG6gWlv0NKB+AWC4PXd3upKID1WVAAFqyzjhJb
 vmMTU9EihvXmkl2sDrBxHcS9ZQiIDKTpi7JtQfJ4Wm1xt2FyF71ermRNPaRQIo38da2AhX3prrt
 fkwW6qhlaggQFxpLcD+PCgmAqfsScAJLjy3525K7IsGMpBF+SIFFveUQzuezno77y00PDuNN2Gi
 abNdxf1vry2z+dPLFjNgP79XyISHM4m4XYCR9dKSeUCQCqzoDz4W1CaL8se1xf0UA3DQoPryYTV
 WJx+wDPKzFyv6vCmfzjyxt8iMwvXpCBOfdx1R1UZKAqkiU9IssXwDuvGzzmy3aDk+k+Y+YwXUet
 qOKGpGVkbpUKjtF08ow==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6ae914b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=S2mxmGJpX7xwPQT3_3AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX0mqp26C1y5bn
 QbyKRG/sUFGRXPlTb7P9LCFdjfXCXaK0mIuruT7vcefX/tFUj1xW9K5HinRBF/97xZ7chrPeYET
 Q6Z2hDfpatV6QtKQj+01z6NgSQzVVSecLLZcFIzxHODe0809xPVb
X-Proofpoint-ORIG-GUID: kIsSxpBf8st3-MGClz-2Oj-z3QJlaXeK
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=10
 suspectscore=0 clxscore=1015 impostorscore=10 malwarescore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left. Remove it. The name still appears in a
sample function graph trace in Documentation/trace/ftrace.rst, which
is recorded output and is left as it is.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 00e32f96b459..a92329805acd 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -846,25 +846,6 @@ static inline struct page *find_get_page(struct address_space *mapping,
 	return pagecache_get_page(mapping, offset, 0, 0);
 }
 
-/**
- * find_lock_page - locate, pin and lock a pagecache page
- * @mapping: the address_space to search
- * @index: the page index
- *
- * Looks up the page cache entry at @mapping & @index.  If there is a
- * page cache page, it is returned locked and with an increased
- * refcount.
- *
- * Context: May sleep.
- * Return: A struct page or %NULL if there is no page in the cache for this
- * index.
- */
-static inline struct page *find_lock_page(struct address_space *mapping,
-					pgoff_t index)
-{
-	return pagecache_get_page(mapping, index, FGP_LOCK, 0);
-}
-
 /**
  * find_or_create_page - locate or add a pagecache page
  * @mapping: the page's address_space

-- 
2.39.5

