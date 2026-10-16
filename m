Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67C49BB4A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175499; cv=none; b=ZKGKYYwzXK5x35Qu7pgB00OAIXYiGwEUVsRsQWtYcgSfrwjeCKFcY5RO17KyNEbf07V3UVWSQLXeTabtBg05quwCKmqm5E8ICfB/jawCFEoPWATcwRA52rEqmpJa6X2FufLnjO7w8wtsbHH7KnMTbcJUmVwj2XQnHcEhiqwX/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175499; c=relaxed/simple;
	bh=Pl4jFV0oI10sTfDRlHbpVbxgnVtGO/n4/eOZHFWufC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B5E6vjT9aYxn1s/PxegzSyjSq9VKxLkM0g73oZTofJeLtBa8Sz6SjvMbmb2wYNYdT8UqgRT54eS24qT4EDB5ermNz+sAjzPPyynVIZTa1KIcUk7fK6xz8Tnyy5XmkhcI3gmPWxeJN7u873fyiI/9PO9Yidc3YYHcSICRgePrb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YwPZANlC; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=h18aUlVO; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YwPZANlC";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="h18aUlVO"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GGXwAE590965
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=ynKUazWiRiEGIxsFkc/QlWuKlm
	A0yVlUnEKK45d/P1k=; b=YwPZANlCJqZenq835F3SEQgidSDozA5vUUeLeyTcNz
	HmFz5Fg+TtcyWssW8fWe0TVFsRjihFiUMWS4X65b0EwnfSf8pbSl0lqRvQbOFyZv
	nLIeyZRi5rIF302EtpZKXmoBmk/vttD0F95DUHX2zpwxeLcHvGzqdvLk/6QzqYwl
	ndMiSz59dJukvZit6HzKoxlhteWmwD85H5CIkG0PJCQhomom/iHbi0pRMzA/1+ZZ
	gGMsV5L9MhVMWfxOLS4EtoeINwy+DjxSozAnfrpy4GXSq/GzGcOXa5nNxrFZCLMC
	yplbPEMH05JRnc9wWle/6MTRlcc6qkLbd72q+u/RKl0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbhuav13g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:36 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so5382796d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792175496; x=1792780296; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ynKUazWiRiEGIxsFkc/QlWuKlmA0yVlUnEKK45d/P1k=;
        b=h18aUlVO6f0nbr5lxOLZXN3nPB2iFgS2V4jC13G+JNKR/YBG9x1koxjgEpslVxitBa
         NITjnyQflHKXIM1pCiLTXcJBwQ3vl1ylDE9Od7na2uyc9l0+I+C9yEDl90pBAi7fG7Nu
         ssQU/ihedcMCKNrEK2/Fe8wIbdVnr+P6NMlz4O9oSlRvEKo8w5/HQLbVyfSqLDF3eYD9
         qdinCC3gXaeIzNPW1wln/pO0BLf67qcgGrwE798IH5rXTTazAMCp6F6OklIIrKssw4hU
         K9wuz3j9ju7y6fZb6o8zPitTsYj518aj6W7NjMMQrEM+P6m599XS9/2DiAYw8ARRtbok
         S6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175496; x=1792780296;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynKUazWiRiEGIxsFkc/QlWuKlmA0yVlUnEKK45d/P1k=;
        b=x0TvqjM0pbaduy/GVoYTRAeWOPJTBvTQ6AmRq/n39gjdRZxoVbyxHXmk7yd/6mNPyO
         VqfNYSw0dnh9PM1C+uOjNsyazSq+uzJ98ilt73iQbDnrgSwv2Bx9oiH2KxGEYWAP9sUQ
         RtRaeSR/F2j4LYSvIkGuwvUgsRejPdGcJLGGXJi1HHl1eNUmwcxmGpMr2IgmVDKLXqTM
         v9C3R3fUe8OoyW05/NLIjM5acTw1su15aP8gLeG5soQDbY86nxJsUjINab/NVShXXDVQ
         ghcmxbASG0IZI/Th6HQxJqH0GlpN7NrwSKVlUabRYor36LrqFLbe0ehUAiMZr7YOvAqc
         3uog==
X-Forwarded-Encrypted: i=1; AKwUvBwGK8iYRUdiX71ODpCS+znr3GzRXy3TT5vEAElxgnD1tKyQWYrVuliukBoi+IhXXLew9jKodzMwJ9IY+6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaWHPkD5dT1GgfHNwAV1AgwcmRc5PTYda9fevy2CbqVvq4mdan
	4a2AgsBgUSijhhJ/eB+TdqGR0IlwzTATGI5iO2zY5uRiEYYERWrrDLygW7h4byAT8ySZSqzIe+n
	qloUnsYuw0L2RgNWxvI9eG+fvPLK2r78B6XUbeEWpogoS8AG0Sz23E/UGY6BjPQ==
X-Gm-Gg: AYBFou13yNUHRwnllk3TIt0nOKbmgRj2OHBkqKGjcuMkVVHMI3Wic0gZ4zbgDaW9yMo
	g5a8SBWcMfwDSGQrthsAU+U5XkBMA85PkKPlE3OyRTaJGRFHvrKUPtL4+QFXvZ/DtKeI6SegchY
	jxdZkmanbr3reV7bQzwJHoPrs+QYZl43kh3ii3jS6yyWqTygXDTR2tJJBLgk/OayFL5BqFLV1/H
	9wo0FLgXBErz6RZ9aEp6U2/GfOkUlw5zTbqWuKEdE1u7BISxHxXl3H8MHJlYs3lK3GQd6ipW8No
	IsaMHPUhzuD7EHnKDP0gouhvirxwb9mFHgnB8z/+cCN9RaROPZ4OE7t7LQ+So57L9KakFewrqSs
	rfa5e9nc8kE/xFH72JMEUmQxbwhtCU55VQOkJk/ioQNw2lmY=
X-Received: by 2002:a05:6214:29ce:b0:917:98b6:bd02 with SMTP id 6a1803df08f44-91bdec2965bmr16630256d6.1.1792175495891;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:917:98b6:bd02 with SMTP id 6a1803df08f44-91bdec2965bmr16629376d6.1.1792175495046;
        Fri, 16 Oct 2026 11:31:35 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb30509sm29187696d6.36.2026.10.16.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:31:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
Date: Fri, 16 Oct 2026 14:31:18 -0400
Message-Id: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZt0moC/1WNQQ6CMBBFr0JmbQ0tjRRX3sOwKDCVMdKaDjQaw
 t0FjAuXL3n//RkYIyHDOZshYiKm4FdQhwza3vobCupWBpWrk8ylEt76jmkQPjgWxhUWK6OkkQj
 r5BnR0WvPXesv89TcsR23xmb0xGOI7/0vyc37pfV/OkmRC12irlxRYmHKSxse09CQPWI3Qb0sy
 wcg1uz9vQAAAA==
X-Change-ID: 20261012-nandsim-nofs-8f3ae982181e
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792175493; l=1238;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Pl4jFV0oI10sTfDRlHbpVbxgnVtGO/n4/eOZHFWufC0=;
 b=VFjhlvO3jaWZgUBtJeB7KsRugx0lkxuVy4/37WJUIBV6XR0/E0r9LbZs6Besut+nWI/cZFogf
 m5VPtSqyOJcCXdHOmdjY7I4kfySXvBDdXy4g5a+9V/LZmCrifQ6YhPW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: tGQ-OyUbcL5DPS9-sn3J8J85Xq2BeTel
X-Authority-Analysis: v=2.4 cv=LbSpeTfi c=1 sm=1 tr=0 ts=6ad26d88 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=bC-a23v3AAAA:8 a=Qi7WR6Ei4ccS7xMmyJIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX2c7RfBbVXs/U
 Makje7/AJYu7zWsLqQJm8eZuTMVBwKgbKX+Xn1N2yMUHuEr/NLNjg62U1jv4x97+odiMcRvmOBy
 ezCZAvMSN+1/Arm/c3Be7O0pLuhmSWt2Ps1rKyveOZuyjy/5bnrs
X-Proofpoint-GUID: tGQ-OyUbcL5DPS9-sn3J8J85Xq2BeTel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX9jIlBYKTb9rQ
 ZPoAW6/Ym/QXVmI+7kY9erq8y2aQ+py4WtYHPRsDCBSp8mBbRYjdjyyQzQSbWr9yFW7Qyo3U5mc
 mp8A2HZ3cFbyyFcV60H40+KI6LI2g+QdbXmjaWeDXqJ9Yh2k19lQmcisdrXEiP4HmlxNYiiF3Vn
 J2xYEy9iliGvFd4Oa81/ANWlEMtqPm9+irtEA1X4/vLD17H6F1x4yx2ByMM3zir+Z6jYTErRRLx
 YTQ/1no8g+9gNBNrg1uUsomlLr54/jYJlBFa8kV02P5HkeCCEzkj1YPsj4NXdC7fZCydJHpsiyM
 f81rAsNLh9thb+bQHPRWHhxozmKnLlqsQxUXwbJsg0dpJz1bivHAcl5ZPf9pAW38PJXYB41FFt+
 mv03WEbacpYqIvJ8/6s/SbC+CTLi4cSI6rUUM1qFEvYTK0gY7cV21jesYMmQ7rsSIP/+ash8rmk
 7aAlhxQJHRZr6W3PVww==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160073

nandsim runs its cache file I/O under PF_MEMALLOC and pre-populates the
page cache before each access, both to keep reclaim from coming back
into the MTD during kernel_read() and kernel_write(). Use
memalloc_noio_save() for that instead and remove the pre-population. The
pre-population is the driver's only struct page usage and one of the
last users of find_get_page() and find_or_create_page().

Tested on KVM using the MTD test modules, nandtest, and fsx/fsstress on
UBIFS over a nandsim cache file, with no errors and a 6-13% speedup in
mtd_speedtest.

---
Changes in v2:
- Patch 1: Use memalloc_noio_save() instead of memalloc_nofs_save(), per
  Sashiko.
- Link to v1: https://patch.msgid.link/20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu

---
Tal Zussman (2):
      mtd: rawnand: nandsim: use a NOIO scope for cache file I/O
      mtd: rawnand: nandsim: stop pre-populating the cache file's page cache

 drivers/mtd/nand/raw/nandsim.c | 85 +++++++-----------------------------------
 1 file changed, 14 insertions(+), 71 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261012-nandsim-nofs-8f3ae982181e

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

