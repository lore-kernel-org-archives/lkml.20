Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876E49EC5D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880625; cv=none; b=Q257XJ6Bl/jObB+ZB5a1XlQrXnpcmnpIq8x3gPLU4mQ2WIqfKv8mMx1K9OBW1pdsIijmMksSK2fnEC+eyg2rZEJ8pML7PfXKUskrbL+3lIPGLgaRHTa0/WyBHetdUVSQluHCI6Ar53rz+zKD7VC1E/RhNt06rF1N48Rrs5g66kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880625; c=relaxed/simple;
	bh=8AYImtP77V28QZu+QpRL/jO+FL03+XtzE9Z7zsh/mng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eShTsNJwb78mxGmHa3nmrf4QP5sUCF+kOVBwZriM0nat/mlja/uNekv2SP2I6DgE3qIFfWjzqnctGynsQbWB5maDUo08u3YAnm6BfKUSo1WosziHuZSrNm6pz4rDVCUUcBSYqGrXetIwtrrnslhoR+zXs6uvh3rMZCL28S7b0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F8qfU00k; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=bWd8nsk2; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F8qfU00k";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="bWd8nsk2"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYrEu981989
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KEW5
	6JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=; b=F8qfU00kTiWnanrMZoAc
	tW1rVxmHitpXEcM2pkmXaG5hQprmnRz8Ac5IJORFDzuSnPavZH2qXEH52m7PTJHU
	P8X9fx+lxEm3WTd2RdpHFoyTxloqoYOG1G/p4IO64Wfv5PK1WO9hGt0yQH3OpYda
	wu+pY0o3l6ePb378loqGUu+h79QeS47gefSsfnwi90uK1O2GAztZ5N/KsBqz89JR
	04OhuRwYtDCceQHgwbSkbZ8kkJedXjmzxXL1PephgK5BUMJcn9GdijLCDgofz7St
	uSrgfIg3K2wmszc8wA/AblhEVBqSoWwSyjO82SMYIfVoJNqzZbjjn3GNWodmDps9
	PQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j5326-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:48 -0400 (EDT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66fa3714f3eso8257361d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880607; x=1789485407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEW56JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=;
        b=bWd8nsk2ZZ7EabcR4ipiFhV9LvlmY5AUzuP18J9Ig0V4De45DkfEVgBPEcdLCBRsiH
         kG4MiMS3bLIQC49BP7cZkUFDT4Vie8My9yskwdiHfToHXNPK3f3e5y7dwGHWW321KYMU
         EgSp6x7eia9GZXQBArKRZbH82nN4YGEg2pg+WRpkpgbzEmTWBBiOtcE6I53YJunD08fQ
         AlHTNgpRBhRCSjKLDbeRipspnfwyrK5naQXmLTKLtWVKQr5fObiZSDLo0ZlH5Alabnl/
         U5j2T4tHk/BTm83wC03Iz13mOq0t/cRJd/5Wgdn4QTud3JGs7d4N8A8OE5iOtPuG1s1F
         DXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880607; x=1789485407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEW56JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=;
        b=rRqdDvCjRcPrAt6QlEdsAYkh2FanJeeSqrayloN0qI7BO+279exX7nyjp4zCmPXMZg
         xLDkNJ8vCWmJh7hrp7t8VVqteLP/k03cW09x8IZys4lecqXlJAdXJQUYcrphGHc+Wl82
         0l/QWmTvCMxDAUbDxeRYTmwABA3CQMMUP7WwB109BACYr1dtPBTufgteUw2QJd1f/plA
         rbfCh4SgUjf3T2AJ5gwHHeQmC434WxqWNtvso5CaH5hGPNMzbyprAie75ffzysWEPQEV
         OME1tz/GV5F7Yp8qADY1PWl4HpP87Ove6ZyC+wKApnYNLuoC9kDhBC/KH6AElLhJloOu
         4dIw==
X-Forwarded-Encrypted: i=1; AKwUvBx0VGNV4LwYfw8FFsKyJkIvsjnMOAvd+RcYQKSEM/ZsQ6a28Yoe0n++tz7oBb22o/UXJky29kVQJe6zD94=@vger.kernel.org
X-Gm-Message-State: AFuF++kknABtI2YfjorRqAEhf9k0HEk/lDKoFZm9DSXKfpSJ6WX7b3Jo
	zfFsm0x5fqDPZe0BCp8puJwM+iadbkrM7+DNs7HLaRP31VT3GG9TE7MM6E077VOSo2YkAkKpS16
	ZyLmXWTv08FcXH5cUlc6gIaV8SvREQPxq8Oz9XYX+Hedh7CtNH+YfhfU45MPxvQ==
X-Gm-Gg: AYBFou3BpIe2KZY0kf6WAUqZAKcoSfCMUKqK7abm1laUbCIZ16ZY/+C5GEtTMfRGUuA
	cMQRPEYklXAMpD1Kj27W8VUiW1xfdoIjezxMb9mSdgVpPsYaq8dGMIFzBkEIeQgstanWs/hdndb
	rjzyGeqZibZ654xjYO1Jo801RiEiIk43vKJsaag6Z07RsXY3Rs6zHekcB44pvvj/ezzh/Ra+p7D
	nMtw7Y5Nb1/wPzcPfIVFvtTs0kxypGLB442scP49pgsjkoqazksMPzB2lQ8tQyK4mt/zEFDOOyx
	3rpYVo2ndVLa00HTO9YK02L+j7Ew8uyJyp+gsZE+j9qGoKyi2SL0wtPT9zuU8fma17YXN1MxPUK
	kEiZ5y3IEond9mBv14fMY4s2y+YZTfXDZP2T1gmnMcK5vBfBDvPm2kw==
X-Received: by 2002:a53:ac8b:0:b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-66fb5a6d869mr8592461d50.40.1788880607515;
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:a53:ac8b:0:b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-66fb5a6d869mr8592383d50.40.1788880607058;
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:46 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:34 -0400
Subject: [PATCH v2 4/8] mm/zswap: use folio_swap_entry() in
 zswap_store_page()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-4-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=809;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8AYImtP77V28QZu+QpRL/jO+FL03+XtzE9Z7zsh/mng=;
 b=uZ2zEOx+HX0JY5Ju3hCDh0SXAKTVBbrmKJa0Tzb/jbmsxqOFRFGF7tBeIaRnkWDnl5W+MmFsd
 OWzWdJ95vWBCHcciSRV07CPafJrAmEMk5d6veCOX6VowyFC+1bVmoTb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX+ZHihq5GnhK3
 euKllqC7pMfyH774XmX5gf4uyozDsy4mdO5SfUx4W+mtWY9l9My5HPwkIdF+lqzpjddl6IcCQCf
 me+cC83gbKfJAi4xRicKQ9Sr2kD9637xGkbSaY2RqiIrJGX1AawhDf7qPZNMxZ2tgihsHVeipzI
 mhCXXg85FE500VnVcUiCAnktzx4Q62QnMhbNVdgb4uroo9DQlW7NOvgderQyLwtsUQabNIoS9la
 UQGhgOdgUScVGD9cDBfxOr6swgqlmuolX91Rdtsly9PP8iHY1sc2cfGafabHoyek/0rev/TCSSM
 CME2tJp8cy262Glr/Mf6tnmMIjBbb69NhNpnDepbm2RpgfLQuNofwkJKOIymiQnI1NQA6mxEp4o
 Wd4eZctem9W5qlbn2DmOV2yEkl2YipPeCmdtwWZ8nSwtAJJnt1resdxLvz72dh2Q+sqZrS/hp0x
 ePST0ZJ5AwUCHCCaRXQ==
X-Proofpoint-ORIG-GUID: SQqmadtAL57XMYlPyvBSc8dARixBZ3DQ
X-Proofpoint-GUID: SQqmadtAL57XMYlPyvBSc8dARixBZ3DQ
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa026e0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=Y3A6ZkbiG78JemsH3QIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX5rrSEhelCBLg
 2745J6R4lN8LhNhJ4bfTWc7czU8bbWj1lw4CMtCx78Cn3RHgQfL/bJC7FdC/TC3RShD8YtDg+3Z
 FJ5OwvyNwsemmbhk/uXofv+s6aC4hiQtiz6dZEZ/gtfQiCCH9bO7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

zswap_store_page() open-codes the swap entry computation from
folio->swap and the page index. Use folio_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/zswap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 5d0d8bd72193..c27e22d067e3 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1398,8 +1398,7 @@ static bool zswap_store_page(struct folio *folio, long index,
 			     struct obj_cgroup *objcg,
 			     struct zswap_pool *pool)
 {
-	swp_entry_t page_swpentry = swp_entry(swp_type(folio->swap),
-					      swp_offset(folio->swap) + index);
+	swp_entry_t page_swpentry = folio_swap_entry(folio, index);
 	struct zswap_entry *entry, *old;
 
 	/* allocate entry */

-- 
2.39.5

