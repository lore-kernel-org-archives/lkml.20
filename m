Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D22F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034718; cv=none; b=ibL0lizKaCwIXd3MIipvlCrfuKnGi4lB1467xpOxbDw2MHcq14ZtTjqIFptTYrWzGZk1PJwCpU/SY47yK8c+mjWCuQ1yObXwKrZAl9jvR1JhnUif38X8HVobJh9At19FaCrPdRK6CTl50qca+uaSMWhG+oTQuOXctZV1viEGLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034718; c=relaxed/simple;
	bh=mCX7cB8PIi2qoYnlIpRswvtRTocND5Vrde2KwI39tKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T/ctJ4hxnbTFO8741vPzgpH2y5ik+qVYiQm3jQXLlQCDabWBg+9b8+HAi2IbuK4XawcE29uG9uEdAfgKLhgELf3AS7/DDqCDpofgL5v3JiTkOfwpB74K+E8y6qb2+qL5Y3tzJ3oTnr+5XaBR/QuazN9qFx7l+YwT0vrNmzqKBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BUUdKgyV; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sL79yRDp; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BUUdKgyV";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sL79yRDp"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2aKs7466500
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=lPkP1qL/sgYi5P1+hcjzd3Wr99
	AUsW3QdnQ2mlsImRo=; b=BUUdKgyV0+T/4nz9jx4mWFWRrPXfvoWXRisdK0qh1n
	cXEzFtx1tY6Ba+X+gdO2jZ0Uqi0OA1Oh5wHeUQgPVHrBYrtnJP2FZrC6YuRgy43Z
	eZSFKuAnjMr3vTM/BGP882GQuMJTL19UIPgZxacXtrg5etd9Qkx9O7e0HnfMpr0u
	Vpvfzg9cEpmElQLLghQ8izVLuz2ccsCJDWsbTr1yacpLg3gaKWZzqvouO8FdeYAO
	TfOTZzKXZb/icndxlMV2MXcHdgmo3BHW/BchNhHQtTtkl/KzYU/Tu3i+aAeil5cg
	YwN0LzPGVQlEpfoUMcfAdZQXR8z7lYreSR2Yuz7VUUOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hafnsjse6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:15 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a7fffbe0so109954186d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034714; x=1792639514; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPkP1qL/sgYi5P1+hcjzd3Wr99AUsW3QdnQ2mlsImRo=;
        b=sL79yRDpkxTWGe9gbE3ZPZMw8AX4U2l0YGSqJECb+6FFqFMrQaWYcjPoGZUyLEW6jB
         JX6IbRWDtyD4UxkAO+MHhdzSvzP2jr4CO6Dd3riIagSKa6E1ZAzN0gVbJwm5au7lDPHB
         gldCbCDRQDy1Rbaxwa1rJO6Maypu3lIAtKU6rucedGl6yiqjT2yR6Qr/FDIgWsE9oYrS
         nsnv7E/8T7E+M/TtefyVmf/YhSBHxbqsW/smgQAWFvr5a4ozYK6I1N7PagmxyMxtuSOI
         zfJJJPpTOHdPkfgBzmm4YvJKER+yFx9SgP34w8tcnLzOsNbdFlg/QUfxxdsxlbnwYSMC
         v2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034714; x=1792639514;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPkP1qL/sgYi5P1+hcjzd3Wr99AUsW3QdnQ2mlsImRo=;
        b=O9DVJ3Y3Di+w17GOX8emwHZPXz2fRrKi3D3kIK3HrE5xKysLKNbbvRDxobB0w2FdG5
         kISK9j5+1zbREglJSIGllYcEZ+NVJzvw+eq0XeIhURuhGh/lSFJzZojkmSwbTZF49SJn
         ukIX1ApJxfRzh0YmGfBtm7YZD6CcfXaEjFHs8HEH/1+2XIy17XLxRHrCteGacQxJ4d2X
         k1hPBMwEgj4Mq6oZJDLU4X9qcE8fmrN+udSw8IPo3EtzTrBiT/Akc5mUadOgQ860TpF6
         IdhrGgXcCV18O+RGbgfYD3vCpB+GzXd5ZbSyUUhyRfZOxALWStDh8ImJP2kZhdX4NY3C
         qd9w==
X-Forwarded-Encrypted: i=1; AKwUvBxnVfoybtwst/KyWWPDhdD9gDYjlKC0SMEcgOIhHDTPj0HKenPymoCNZlywGCbujyYDatRSborobZmXBT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWGTr29ShrUVKNsT1LojbnlFgO3e+I/Xlf9JslV30ljg3vJuJG
	8BH8JDNJcHmwwKtRlukZLPOoLXYWgsl51njqyjvEGGKfsBGyn0xDyYBmHoo8eGCtIrjf7AssFXP
	vpJdaCwTmn9qGbuf0vjz/3190OvvmXtlySEVoP0Fm9GgcLyYoWeaTF9qbiFyK7KEJHoSHOg==
X-Gm-Gg: AYBFou1aiyf6nGBmcRFL0of2PoS0zjzN8wbSP8k4jQrVCYJOxZet/E/SK+PtuF6li7y
	CUa/aCi0mkOSggxqg/KWHxO49IGpKwTcijQgNBtNQHEOy0bCCigwxhObHAhZXctR82wlE5ILl0K
	6gWw9xCFMEhEBLF1xej2z/bWrn08T5hrm+me9vhxnqtWy3JUljYLwIBsXF8IVVuglJY88quFh5b
	lLn4UVumYBdD6hETn/nZqwbyyaeGjuqmYlrq2nTrpXraC8IVtrELsI/ysg5i+2gtSjRie7UerMb
	8vfcEiGRVXwMDBLV4yJRLGQym0MmoCDBTtT2Wskt2je5Dtfmrx/ulrJ2Y+cZDRPCmZM8c/230qx
	YK17Ki39zYv7eOj7BrERnwWBVC4ufYxkJrfj77kdQ+bwG
X-Received: by 2002:a05:622a:38a:b0:535:872a:a0a5 with SMTP id d75a77b69052e-5359f498f34mr299181651cf.2.1792034714133;
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
X-Received: by 2002:a05:622a:38a:b0:535:872a:a0a5 with SMTP id d75a77b69052e-5359f498f34mr299181421cf.2.1792034713757;
        Wed, 14 Oct 2026 20:25:13 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:13 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] mtd: rawnand: nandsim: stop pre-populating the cache
 file's page cache
Date: Wed, 14 Oct 2026 23:24:57 -0400
Message-Id: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlH0GoC/yXMQQqEMAxA0atI1hZMB4bqVcRF1VQjGKVRGRDvb
 nWWb/H/CUqRSaHKToh0sPIiCZhn0I1eBjLcJ4Mt7BcLtEa89MqzkSWoceHjqXQWHRKkZI0U+Pf
 u6uZv3duJuu15wHXddrGCSHAAAAA=
X-Change-ID: 20261012-nandsim-nofs-8f3ae982181e
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=1013;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=mCX7cB8PIi2qoYnlIpRswvtRTocND5Vrde2KwI39tKs=;
 b=a5U9wLXoay/mnQWMpScbE2Jn+l88Sha1NKRIcmO62pPqgbTwuTWwYg6trXqfOMp9+bp/RRVLH
 sREi3yJPFitAGb6CuY5p95XMwNjup5y2g6v0KgwduxwctJ6dnQYAhs1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfXw/JRyBku+2VU
 VfBJaGDevHPvIaUcEMof/Ah/AYtTpWTifr0pLc5aH5gpV7nA3zx4T0KBsqfIj78Iou50SWWARfp
 CJUFOpZyX0NMsCLLSG4mPTfnT8vQ5ITgX/VU88RWkxbtLJ+sGaxrzBr3YbTRQcynfgn94uqQu2H
 JwrqzgW4Wn1VN9Ey6QS+51zkuefw12Yb9gXN8O25DTaUnIJZWzh6bJAmPcbafQpzDL0uY4ZgBjH
 DyfUGNwXOoF9z0gV1A6ZVHQpimvs3m7oHQy4etHbnDgN8y3NMTnUu1FgOgKuuDPE+qfmurLaYX2
 Ei9zFdWERWhgpdPYAIvSqt/Vw99pBrk+mURaQN6pS5q19ev2U3a1Xfmaw1DGAcPxBiV/W4ALwha
 Hl1mTAlvWbYkDZ67skqHgjqqeiGlYo8khKxZN5LgB2yFXPLDyU61qzium1SqARuqCika8zoY9TS
 kd3yomDISBtuziQ2coA==
X-Authority-Analysis: v=2.4 cv=Mr3HeGae c=1 sm=1 tr=0 ts=6ad0479b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=fsQuAqkoyy6rfPB4ug8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfXzRlBajVJtANC
 WbQKyJcLtMsJbE8KVm6X8MzjWfXIhX4Ih2iVBgS+sPcsWzlhaycfayCyhlMjmht65liWohvWb8Q
 JZP6R/eq0Owf2WBJBl+qUGz0secdJjclXoUv3JSy4u3FKHBjFkLj
X-Proofpoint-ORIG-GUID: pSquNP9qwlnJVeF892noOqOcPul9Tq1k
X-Proofpoint-GUID: pSquNP9qwlnJVeF892noOqOcPul9Tq1k
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=10 lowpriorityscore=10 spamscore=0 bulkscore=10 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150013

nandsim runs its cache file I/O under PF_MEMALLOC and pre-populates
the page cache before each access, both to get NOFS allocation out of
kernel_read() and kernel_write(). Use memalloc_nofs_save() for that
instead and remove the pre-population. The pre-population is the
driver's only struct page usage and one of the last users of
find_get_page() and find_or_create_page().

Tested on KVM using the MTD test modules, nandtest, and fsx/fsstress on
UBIFS over a nandsim cache file, with no errors and a 6-13% speedup in
mtd_speedtest.

---
Tal Zussman (2):
      mtd: rawnand: nandsim: use a NOFS scope for cache file I/O
      mtd: rawnand: nandsim: stop pre-populating the cache file's page cache

 drivers/mtd/nand/raw/nandsim.c | 85 +++++++-----------------------------------
 1 file changed, 14 insertions(+), 71 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261012-nandsim-nofs-8f3ae982181e

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

