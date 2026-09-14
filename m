Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3502EB0F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344221; cv=none; b=h9w2+81RFC9lonyPvkjo199ZwLBYx1drLb6/I20C6OikJyIDJYaIYF8Ox3TKWL/7QqAzs5vjp6pZ+AbKZXI7gQyfqUV67Gx4NwKrDirb20laXRvT7yyM3L1y9qAj6rWW3Dph95yPhGAwkDUDZ64RELwGHdVtiazuxYgGP5QOBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344221; c=relaxed/simple;
	bh=p1jlM65ZxQ3So+BBCB1oyi/3+0R55NP/llbG6qT1Q1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fG02sRiojnkpzUSTmf7bbfrQwY8WyPrJNFbvDQHUjKwqDFBOk+hMGTPLn5McDCpVW8VrKpWk8x8KiVVW/uLuo/VM5po1atFaZwBZUKYYtn/s6RGWrdOTjx7ibQoQ2CYOFDN4Q7gTjA3jpNVXapmJj8+DfZiCoSiY9UbY+5Tl7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=d6s+UU0I; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=H6zUoCBp; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="d6s+UU0I";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="H6zUoCBp"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DMZAd31948228
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rNlN
	N2Xh3Jh7xF4dZNSpw4lMXaF92rKdytyUcFoqXGw=; b=d6s+UU0IHeiSa/yRknjU
	SFeg4aV6In/eAxDDB5pufHfJUaBUJv/ro+wf0UmGfon7QCeFCjhdfSM44umvMaeV
	jV5Pj+G3kiJO0B1PDFkcDXGkRo6+cjHQmXvt3/2DxCUaKejWRusO0m9gRGx6Fte0
	cGrUPxy4UEynGUs44FM30URYVWmfTwhZwUiuK8d06e00cE8/osDXep2sP8BoOV2H
	NNHmIXtQYyv+7IWLbT0wyHimsyOwrdkuFwgyfdjvF6Q0GDiDIOkAlUdJfDAIx4Vv
	E2gb5Fzzew334xqnvO5FloXvr5pLDoEiuMfFiIrEDEf6YnE9AWoQHYlndaBPN66j
	GQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gp1d1h2m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:03:38 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8dd8be81so35380336d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789344218; x=1789949018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNlNN2Xh3Jh7xF4dZNSpw4lMXaF92rKdytyUcFoqXGw=;
        b=H6zUoCBpmrI6PU22CTTYCXG06xN1wwMW4PQhGV+RJDSjAuO0q9KEJBQhGXbONfXOe+
         tAXVgaj5UlHIQhurHR21yldSSOBiR07XRQ//IdBwIdxv84QcoAV0il3vt1bCEpAnxVyg
         lg0IC+XCu7txSqiktM9nv0XJOtykOQztY1mpCBAP6MLEg9rZCulOwPtEQ6LzfpGNbSIp
         b735EkW8wTUgZfi4auiBqxOdUv/WlN54IbI38hvJ0hLiYvv7Wm99vLAMkILd3hV3SZDL
         Ay0jj05MyrJQchn0MO1xJ85x/aTTfwua7Y6F0Uk17X4T0GIWVIOcuCvMdAvRczvCXNHQ
         tgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344218; x=1789949018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNlNN2Xh3Jh7xF4dZNSpw4lMXaF92rKdytyUcFoqXGw=;
        b=gb+CXeIQ+/1p9b2Z5Ex//JFi51e9QbdAdXTQ+6xBX7nFpDf0HvnjdokBvN+4xbr4ID
         xp3FOG4JDAFMSVWZmt7hCozC9Lg4TP9DtbT1oghx7WzXTS4iSbrnb/QVzBquegfZhKDz
         lYFWmKZaeLzFUNNP8884SpY0ZQ6+gURShA5aMV2ACgkcM+rZwyE+skGZPMt002WXHg+i
         muS6/w9dEn9RUKpPWqB0gVpN883QHCGEgkHqqGMONzIrFUlyEG50GmP/aHhr51KoC9WZ
         +OtR7sesD807e53q7uSUwZE+rK9RJ7L+LfYc9aNYqc1uJCt9CiWmm2p3lpYTWMJYY8Zh
         +tUA==
X-Forwarded-Encrypted: i=1; AKwUvBwG3fq85/4E4d7r++FFctbf3/UhPLUnWbPZiocjXQXmmosqb7+zU0XzkhoSLUmJqNuHaW7OieQywjVjbGY=@vger.kernel.org
X-Gm-Message-State: AFuF++kaEZZraIMuvk4YUM2HTRkzU8jw6W0uD1N5dntHZD+3L03PCBxc
	+jJlPayYGZwb63vlE4IsQsJ4fdm6TMIYVH39auVqorh7eEGqMGFlvQcxwMNNLDtxEb/GjNcACnw
	MUQrDEuC4mqZFLAra/IHYWoNOB7zQKRtUKm9YDDgJ2J2m7K1AljZwaWA+l3jGD/+L2FBZ0NbU
X-Gm-Gg: AYBFou2a8BKap8/yxIF4NCYU+QZFF501vFquWHXc5UK77b0CZp4rvfm9CXE6kXivoRM
	jqtnCmFL6E7nw/jsaKJiZ9iEYtcFzXaovyceS7riRozu/fJ/8LJCB+eNv9ZA6hIyrCV66T9wWxs
	vNbvVJgfTHI6g7hL4QTKM3Vavpp/XQwP7GD8K9iG8UDfrJrcddhHG+tOlkOtjMBLK6vVb4jAYBG
	h+3fZhWV+Uu9jBMoKQGJPUhSvACIy5pXEBRHKbpzpHRpJi4wJTVaQ40Xvwgq0A1+ArkUlfQA88J
	GUyhfdNwVvCQzDHsfBsmeVx9vh4RGJ5v6ju2tSkv9D8FRkZ8mYaViJOvF4HsfXCEaDxAJHA83s4
	bhoK542la7synUCbCPmlH/AZz5W1Cjl0ewEVG77TBFheoj22sF5kVmw==
X-Received: by 2002:a05:620a:3721:b0:939:6de7:8768 with SMTP id af79cd13be357-93a29bfc96bmr50310085a.47.1789344217708;
        Sun, 13 Sep 2026 17:03:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3721:b0:939:6de7:8768 with SMTP id af79cd13be357-93a29bfc96bmr50305385a.47.1789344217275;
        Sun, 13 Sep 2026 17:03:37 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f19291sm872250985a.10.2026.09.13.17.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:03:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 20:03:05 -0400
Subject: [PATCH 1/2] libceph: use alloc_page() in ceph_alloc_page_vector()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-ceph-alloc-page-v1-1-c436f2f4c068@columbia.edu>
References: <20260913-ceph-alloc-page-v1-0-c436f2f4c068@columbia.edu>
In-Reply-To: <20260913-ceph-alloc-page-v1-0-c436f2f4c068@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789344215; l=878;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=p1jlM65ZxQ3So+BBCB1oyi/3+0R55NP/llbG6qT1Q1I=;
 b=92+fJ4gu5ndZNLo3q69o9FyuWlR4s6e8LAL9DwyXxXEdfrj1byabHcaO5+agpdQzqTksB52vQ
 t2IOKqGQgX9AMUj1imGTWnV1+LP7s7aOgu4Y4DChU7LtkuwWjD3L86w
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: tgsR9Crf7LhRHZ2Prp0lhfJRdULYS2FJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NSBTYWx0ZWRfX5RHjfQotlD1S
 YYWdkpu4ENhVsAoj9F2sGEzWEZ4DFQumIpmm791ym34eU2Mw8VHGbeKG8OpptG8PxdAMVqHtYqB
 ws89WadAmofoa02nwBCLtQRq180boZVwjWoAryl2iT7FsSljOI+vH21SUYztzDOgnJEPTdyyA4G
 S0a3uB1onI800+bfOQFrIXqhQkzC6FNRqUXiap+6XMTS6LkX+Opky2lHHYKhCxKVRJYgceSvzIU
 AOdjaa8TbYYE42tIRtSKsaCs995t1NpfaVHKAKldjLnjSJnrcMF5GO6pNaLvtLt0qwdc4Eb/Gdq
 MhYeIPHNmp6p61NGr7LxNayppnVgqTm1dQywuRzlQhCp1lWa6Id97f8FXPiKKiPjgaqeRZ7mssq
 ORkPsiXq88wgiaKbZ7MNh2qPLd55ukcHu1hmM83FoF5KVBgHa/cJGmb7glrNkU0tibagScsKNDH
 7/BLwo6CS0sxRtbcARg==
X-Authority-Analysis: v=2.4 cv=PZxqFShd c=1 sm=1 tr=0 ts=6aa739da cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=DGrGr6oAPidr8uhfY7EA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tgsR9Crf7LhRHZ2Prp0lhfJRdULYS2FJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NSBTYWx0ZWRfXxyhQ/qyfd0j3
 U+9Kwo2eUWh7/wuXM4ZXPM4PbG0qP9FOUzFnKVI3HjmiZFrNN7KsiKUn2azw6RsSlLLIyAt40ZY
 cY8EN09O7GGCQfnnAMOcjxpcXJcKLBtzvcnqE7ftIutQF/nupeFO
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=10 phishscore=0
 impostorscore=10 priorityscore=1501 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130345

ceph_alloc_page_vector() allocates its pages with __page_cache_alloc().
However, the pages are never inserted into an address_space and do not
need the cpuset memory spread policy __page_cache_alloc() provides. Use
alloc_page() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 net/ceph/pagevec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ceph/pagevec.c b/net/ceph/pagevec.c
index a6aa5b3b7a1e..885e58c2d129 100644
--- a/net/ceph/pagevec.c
+++ b/net/ceph/pagevec.c
@@ -32,7 +32,7 @@ struct page **ceph_alloc_page_vector(int num_pages, gfp_t flags)
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 	for (i = 0; i < num_pages; i++) {
-		pages[i] = __page_cache_alloc(flags);
+		pages[i] = alloc_page(flags);
 		if (pages[i] == NULL) {
 			ceph_release_page_vector(pages, i);
 			return ERR_PTR(-ENOMEM);

-- 
2.39.5

