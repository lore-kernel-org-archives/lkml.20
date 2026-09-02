Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC3361954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365513; cv=none; b=foSy1U4K9YTYNPE8kVPnH7FwaBQa/e9Q/YrVQkXQFYyOmpRCTAdnR+2wEfd+CKXcQkwE3MbYnSUiLLRkgynkmNNxci/LGnPoCDjQ7Qq6thxnxF+ohuZLzh5GXyW6y9Dtu623HxZDwOTX69tS/bvyuJoDWxrDoxYlTh3eNoen+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365513; c=relaxed/simple;
	bh=eEBEQRS44uRWq+68HnHuSJkJWcepL1mJ0SSpfrhNU80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A34NQsDF+DDkSM6LW0CGoDl24VHNjjTs6OnyjNlJjkKPLan3+lawoXdCit/Be0UahvNQ4epj5GHeNSFGt+HIZvDzwl55Q08M1r2Rsm3UzVD70pLuxuG/QUK9PMlvRF3SvZZXNsEwP1xEbPl/UyhBDNR1SKNF6eDeTwld+o5Jtc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=jLpjPwl9; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nInfNnwD; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="jLpjPwl9";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nInfNnwD"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPl1E901352
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=aLyb
	lFTyCRkRNvHlbjBlieXQYnfG93Mvps8LThXIpPg=; b=jLpjPwl9inGsFVON+6si
	Rvlv6W+osuwovYo+i6o2//h/omnPHCpk/J9eE9/WhrJMApbtyoeghxdYBo6+nr4s
	FHPm6lNf2H5L8c39yR1bKkVFB3Fz1GXUUUfQ0oGq3O2FtvV/AqyTQXIOUqsmed1f
	D4mM9CQBIfAIEwDXppfGv/5JyFDnwL3G0erAopbRh6USzvIGYlQvf+wKzFKeogJa
	SO4AX2L8JWJUFb19o06OS6178SfVlv5/bcF7HKCpgVGKsszWOmPCbcnMWiZa6ULB
	+2UCtaSpPHnwXi2AtlxzOgnge7eU6MVT/9mpeS2FkDFItNXIgewgtvnyaxCTYjgq
	8Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gegv7tytp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:48 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e98e74535so24653566d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365507; x=1788970307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLyblFTyCRkRNvHlbjBlieXQYnfG93Mvps8LThXIpPg=;
        b=nInfNnwDJ8t4WIbxkDROyZsLrGg6xN5PjhjnDmDwK2SqJE7VjsVOg/bk9Bs1qDd72e
         9Q6M9ObrrkyabbnEgUm+6fuANHaL4YYqEvQ4VHlyzQyFS4rCNAiV4pBzr4ZNTg1ZkLQb
         iUI/E2tv1P5T3N3skG2WUzMGddQdRyVInrL0tyPg9UtYOmVF2UxY1zuv9xR5iSuSdYTY
         YW8mOvUlpRHUvgnJEpDkjoI/yB1S34gL4IMhRKdYYH5C+qVgtPCT6iZRedHGBEyyiEFu
         O9fmKZIDU2ikzksYWTtGpK9GC56CTcklprmw7x8yQLoAOA9bmnQv+zwalnEr0e1kbqlW
         OC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365507; x=1788970307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLyblFTyCRkRNvHlbjBlieXQYnfG93Mvps8LThXIpPg=;
        b=hvtMXIMCBJ/tiwDE80UPOdsnaNBzxWP2fxKv7GSQfYz5djJ10wkj46nJ94rDC6QdQX
         AnyFP71qqEzHAXa63h5PPKxwwFzQf+jS/L1/QZiYEsQ2WGhkLP4muGxNtv6kNNyyQjIr
         YUNx0OB6+aidlL910+cZdWOGE1hPV5FyMUH4Lw+tNmpaI0DxwfI4whcJthOw27MuEFtB
         tD9teFaIR+pAtNUti1qy5GP1aaBipubaTCZyHEN5URyyw6PEmOee3Dsi6QlyRx5zrjTi
         a2HKkUnSiLPa2VW9wL+npqFTck7wKt9KRS+cTKItDAsm4RTFp5D792MJ0CdlU6djyUic
         927A==
X-Forwarded-Encrypted: i=1; AHgh+Rrr70LHhtfDsVQilS2DmPPevTzI+/CfDxz5zmuf4/1Bzy7XbjJy0ZvuCZgdA3G0LnKRJGOqPlwdLsvqFHg=@vger.kernel.org
X-Gm-Message-State: AFuF++kDPcm6EO2BJ6K7Y+muOFZ8XGIrfFGG4VMCm1n+x56VNuC73Pa9
	Zd2iqdGZeZRv9nnczHuWV5MW6tHUNPTeMN1e4teoebBWCzoznnIHMUgswYZEVyIPcfdbHCVom+w
	eoGdhoFZKmvXGndAQ4MC7AWTrsRBgWUdm4lINgaOH4HMuToPNaFDNgZTRWzhRhg==
X-Gm-Gg: AR+sD10eoLfaXqRCv1Jrll2ugf3972I3jK+HvlW/1g1Wk/pO9EupXqZ2byWElf0a3xP
	txFxKsEnNunO8d5M58RsnBZJ/bDnoExyfMbkaKaoY0G2voWowPIC/MBhL/Q1o1mloD12x5nUg3e
	w0nls/hMfcmBMET4rj9PDRySmjjklU2xvkBvrUuRuFLRpXFA/lUA3H26j/HK6PFvK7xqjDtPPKh
	qwpROO66On2zN/m7AODoIb2I5Au3Cm/OPrmOjuBUQsuqs3ts/6JlTQr7qiaphRbxP9BYxFeGuUn
	AV0SvQQDDaZwQIT2RCRse2aH9W4coVlC0HDTrMPFBrpgqqo2IJ1BuLhXwOcBhjHg4iC7jvxLQqo
	HSeOOO675fJiwmrHla75zx/bcCbOdeoZoPKY4INwtRr3uciMx3Ezkwg==
X-Received: by 2002:ac8:5c93:0:b0:528:38b1:b547 with SMTP id d75a77b69052e-53036b4f832mr79145601cf.8.1788365507418;
        Wed, 02 Sep 2026 09:11:47 -0700 (PDT)
X-Received: by 2002:ac8:5c93:0:b0:528:38b1:b547 with SMTP id d75a77b69052e-53036b4f832mr79144511cf.8.1788365506821;
        Wed, 02 Sep 2026 09:11:46 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:46 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:33 -0400
Subject: [PATCH v5 09/10] ceph: remove ceph_fscrypt_pagecache_page() and
 ceph_fscrypt_page_offset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-9-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=1581;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=eEBEQRS44uRWq+68HnHuSJkJWcepL1mJ0SSpfrhNU80=;
 b=mhLl4P2uOVP0FkK73qk2YAGJAverCm+Y2gZfCWO42rTWySDxx3ye0TRAxoQYAV+wZ+pD3G6sH
 jnAzG298txyCAl7izlSoLKF6eTnU0e67S3qvIIIOKiWtLiMtrpJFa47
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Fiq9MR2uKzfnxCb6nl6Zvry-kODLXQLI
X-Proofpoint-GUID: Fiq9MR2uKzfnxCb6nl6Zvry-kODLXQLI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX/1G0QaPXEuDQ
 FYImPAbBkp4agMSwWs8j1FfKk4Pl353vhYbXXFPMsRX+4G+yn5kYe5g9Rqv9psjKKzCkerXwNLq
 sPjiNFAT9yx1R+791k6OAu/xhVGyfv8VBaJm4k9vSiPCuQ6kAAbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX+tbSDjyBcS1Q
 rnmX53/TDdae/YjdEmU9CKbBPYkIyPhfHEpxks6kjXF3VU4aTa+AVklStf3aEmMddj8LPC33lrm
 n4uexyHOm6gGgZUKbRghXW0212jIOrYoVtGkjrBRn5ycbVwpzXSugVnjjhC1zLbZNBa7nU+WbAv
 /G1yT7HwHJu9MVLMbg6O4MoWkOkna4T27Si56d3QSW5yRFxLlrcOBKSo3hZd5HuLhbvCmhD/rjT
 07I7QWb3nT/LeOpKygOyuis4ajafEDPzq+g6kAobNiHfYg9G5Jl/Oqeb6KUWuAh7k3r56v/meO2
 yA69dTIwU+ZFV786nk4nIbtleQaH2ShooCRopBiu9thWDzskpiGDlmRzlVKrGQTHvVKvIqUiHr7
 KdMJjO41PlK1GmDXndw0AP52f7Eo3yALCESf0ldzlVcUxx+33MigYFx3d5NoRjoSz1DXv+yQgM0
 pfG9y9g2Kf9YTXx8yAw==
X-Authority-Analysis: v=2.4 cv=JcCMa0KV c=1 sm=1 tr=0 ts=6a984ac4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=jfg2DRd2ap2c96lsYj8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 adultscore=0 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

All callers have been converted to the folio equivalents, so remove
these unused helpers. This also removes a use of page_offset().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/crypto.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/ceph/crypto.h b/fs/ceph/crypto.h
index 948c8b5dca06..d199dc8410fe 100644
--- a/fs/ceph/crypto.h
+++ b/fs/ceph/crypto.h
@@ -157,11 +157,6 @@ int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
 int ceph_fscrypt_encrypt_pages(struct inode *inode, struct page **page, u64 off,
 			       int len);
 
-static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
-{
-	return fscrypt_is_bounce_page(page) ? fscrypt_pagecache_page(page) : page;
-}
-
 static inline struct folio *ceph_fscrypt_pagecache_folio(struct folio *folio)
 {
 	return fscrypt_is_bounce_folio(folio) ? fscrypt_pagecache_folio(folio) : folio;
@@ -263,22 +258,12 @@ static inline int ceph_fscrypt_encrypt_pages(struct inode *inode,
 	return 0;
 }
 
-static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
-{
-	return page;
-}
-
 static inline struct folio *ceph_fscrypt_pagecache_folio(struct folio *folio)
 {
 	return folio;
 }
 #endif /* CONFIG_FS_ENCRYPTION */
 
-static inline loff_t ceph_fscrypt_page_offset(struct page *page)
-{
-	return page_offset(ceph_fscrypt_pagecache_page(page));
-}
-
 static inline loff_t ceph_fscrypt_folio_offset(struct folio *folio)
 {
 	return folio_pos(ceph_fscrypt_pagecache_folio(folio));

-- 
2.39.5

