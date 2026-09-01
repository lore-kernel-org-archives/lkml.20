Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18513B14B2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291510; cv=none; b=ftUE06ybJJ9cp3FBJpH8OMCr4cHDUJWWcNvX/HF+inaUelymUuoLvyfEjm5s4G6AG0uO8ozBOHqr5Tq8KEKZTMyL3yonmnhFMFksYVDUQ50n7q8qenq/xQjFd0C5q04STHILJ/OPrcbH699r29w104jpWITlG4R5kQxm0q14efc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291510; c=relaxed/simple;
	bh=8+aiwJgC8YS1D9kaD5ME1ed0Qs485oFlFuUrlvOu1Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+oMXQdr0mfK/vPmHxZQbbOyT52VRyqm3rO558ywf/t/FOKvl360asd+EvtkOvar++b/tF6bw48wu2yQHx49loBFuCHfK+45s61ctSjUzWefIb1RbS9N/4YlT7Rr+VY9JN4IhWfsyYKjTpAE1ceT+RRt5NDp3DKLSmvqRqMoaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Wcc9i12D; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=s7C1umGk; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Wcc9i12D";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="s7C1umGk"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681Ih1Zq3153625
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bpxO
	uIfVVhVb4LmRbY/n+8EtkuMrFuMNtcwsS2l3jWE=; b=Wcc9i12DA+c5Q/7rcDts
	WDV/FqfHBRRL98SbWikGktdrhAytXKDWBNwiYO4J7VLW1x1k5j9PrIKYTKi/K10q
	bw6VrNZB3wh9oaw/lMwceDXW6wPud6h6qoD83fKO+BqtY0GddwIdhp+nWEHUHM1y
	pyrOHXcRt4ixhp2MXeOFDCYDGo3ctFa/OFgY8cTsGfPkIrv/kIYTbFM4SKqT07Qh
	Ti664VIfzskwBOJpjdtWrXss0nq7yUM2dwYneVUbZmCcaWAS7FrdGudbTMFfxIde
	PZi6flXM5V1lwAK37KgUvaNUzf4yykz0N+DlgxjfynCD3gYuxjM1qteEvl319t2D
	ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gdqbu5yf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:38:21 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8472ee1eso5364936d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788291501; x=1788896301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpxOuIfVVhVb4LmRbY/n+8EtkuMrFuMNtcwsS2l3jWE=;
        b=s7C1umGk1nW11PUXMG11kzJIAlVH+JN8+1V7hI6R3e7kX7QLrMqzHjnWmGe6ahdKyU
         AJataZ9cpuYY6CT83PrbWT0/QjdANsQIWEYXoAdSoovrS/eEANmcEVh6E+FmYiptoPlK
         ZSrS29uLiMUTBGywVukAySZzn7mvIeggQCx9V0JR9Cko3g6VIkF/NkqRTp8a3ueI7I+f
         B4BsUGQ8Rb3oNh4sV5oSsa22FAxBMhJ6PTWhDf3KtZM/SRRcAS+2TXnys11SdTHrHsjw
         927EDzR7iUKJ45noiSau6jvMjEGwk0ieJW6iG7Cx7tfa27d7a/+ZFwbfmTP18Gur6fo2
         2aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291501; x=1788896301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpxOuIfVVhVb4LmRbY/n+8EtkuMrFuMNtcwsS2l3jWE=;
        b=Q4jne1dQRKBHLof9ZTrAgdDh7dVrkUkV4ZD1Gy8uCHOVCdMP5JU9RPlgPIofiZUZAP
         /BS2Dk6uT1dOXie7gOBus5b+wov+aaUo1JIr6nWiK1i0cW49C5Y2C8+E0pvTr3JlGq/t
         uC+hwvxet15RMg4Pe+4tVv0TjwpgKh7G8wA9gTXXN0WeJQ3Tkb+l4liUzjFuOUaxPIOv
         L1uHvbjiAI0hQ0cgGCC1BFDd6fczcAWIdilGptqUZsPZ+nwhdHYSYkoBsAZ0LyR2dVUN
         +s0LGlJQ1jxJ2cQ3SBFHve9sEAjFLKDFWHMFTTC/me43hkMcDLKCoZoQtxOSkjPcD2gG
         s4/w==
X-Forwarded-Encrypted: i=1; AHgh+RrS95eKi2JNFwryzczT0OS+bxxHgMqUCfgxkKWQJ0mFIHzijNfpyOjh5EHD0aETiYn8ZvkcD+5RXHUDlBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mw6qXYeTaw0v+2ufQRdxtRg2e+EboDNMlYZTvJaORyvNtAU39Q
	IQspZfeYzEg1Lfd6+OutR2gzVrsP4xPU4rZawwrCQ6S8Q/pYBKwMQYEnLdxWxBw07AAsWgBgFtS
	OvDbrqKg5u5pR/F/UoBFGhy0buN2Oi1urX/F5jnwnp3IH1+iwLKzhnhHjjfDmSg==
X-Gm-Gg: AYBFou01/YQar9kotaCVfSGzvjp/XN6bhvd0XKHs17qvpv8fY79LMFwewvKmDsriKwp
	ewagKjFZIoFv1H4Hb9dQ8C1TW3DWFJHHAwU2LIjNfL1S62E+Bp2JY5rwGnaQ3/hqchyK8gI2fZk
	M8ZHZOsm/7Ti6S0pnCt+RzFGFdMmKgq1LN5MpGsmCSL0/O+LgVpIYZpCRqGHklpdVBmtKwnbISs
	qQ00D+BllBkpC85pSHov2h572GdolmVdB9duYWh+ZNT07peswZ+3CrQt6/X69QhAWBqdSe0VmNP
	WpBycyFleumcH3L8IgL1Pcr77Qap5mpW/NJme1DlHAodciwHnzHXj6fSwhbs1He2hGF4fhdFFP9
	wOBhM5UpUBZRnKgN5oJBLwzLjfiPid9NFO7Tt6I5YGJd5b10Sy3noPg==
X-Received: by 2002:a05:6214:528f:b0:90d:255:df33 with SMTP id 6a1803df08f44-90ebafc4229mr988576d6.30.1788291500870;
        Tue, 01 Sep 2026 12:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:528f:b0:90d:255:df33 with SMTP id 6a1803df08f44-90ebafc4229mr987986d6.30.1788291500352;
        Tue, 01 Sep 2026 12:38:20 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-192.net.columbia.edu. [128.59.177.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eee72f8sm1201866d6.36.2026.09.01.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:38:20 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 01 Sep 2026 15:38:05 -0400
Subject: [PATCH v2 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mm-remove-unused-helpers-v2-2-f6474e169c23@columbia.edu>
References: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
In-Reply-To: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788291497; l=1652;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8+aiwJgC8YS1D9kaD5ME1ed0Qs485oFlFuUrlvOu1Oo=;
 b=gxQdwjFtKUMMZBtFUA2NcrSOyGL/CR7zXevIdOHQloOF0CTnFztdijopSWYpk4zCRuOuo7wDn
 S3AI/kQ2yVkA9P9jWMHhOyM22pB0J4EZeeit8PVRfS4njFpOBnCqIoY
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfX+XWJDOR+GJ/F
 wKmv+m82W2hyuAIDFKHWtuJjcfz7He8j02OM8RUvjXKVprzbAOBobEtJoilvaqwGqsGo4rdlO3n
 iS6yo/Y/frhjlQ++MCuOiOvxzEfDGgrsH1XezlW/Dxh3BBjz0DBXtKkbPWQVqVXPrFir/GSQZm3
 sOat5xc4/V17FCaK2xoRhT8YvYmRcwf0dNU4xHDDWykFb4sC12nZjYFGMP9iwj2ba0/oJpeQ7Yf
 F2dEJXuxNN08ESPFtg/lTRmG9jkUuHsp60eYg41gtbsR/OnTDU5+SLQIeIw5dLRaYrHZvc61HS8
 TVWHKquI0v8jB1jisA5exAopY8YCO4oLNZeW5VMu3ByLR+ofc9+/TgYQgjiBuz/HfJHrTFn7ztA
 vmYerK77wOV2ub99UcK+2NPh5lm6LjowVdQMjRcvZ5QI6SygJFdhoiSfd8GEFL1uWN9GnYuY3+s
 KC+zDN0rT1nLuQGKGIg==
X-Proofpoint-ORIG-GUID: RdsF5xWp--5uh2Z_m0qnxkFsASMO74-Q
X-Authority-Analysis: v=2.4 cv=ZOXnX37b c=1 sm=1 tr=0 ts=6a9729ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=l2kTeM/jHJEfm+IcnTWp2g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=ZKe_TKLu8epUeBHU9lQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: RdsF5xWp--5uh2Z_m0qnxkFsASMO74-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfX+5XYhT5qfmOh
 18azjRm06qfQJeH3Xrob9um0xNegZSAyoL5mwygfhVUeF3ZBBzo3szUnffgpEyw6nalz2G9HxSU
 vJYAPgLVSLMhi2ab6Q71sjEVhSS5Fh1FjPkk/4SeCLwP2FNPQLiF
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11893
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 bulkscore=10 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=10 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010172

totalram_pages_inc() and totalram_pages_dec() have had no callers since
commit 7fbc5e26123e ("memblock: extract page freeing from
free_reserved_area() into a helper") and commit 287b89773d81
("powerpc/pseries/cmm: Use adjust_managed_page_count() insted of
totalram_pages_*"), respectively. Remove them.

Drop the totalram_pages_inc() stub from tools mm.h too.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm.h       | 10 ----------
 tools/include/linux/mm.h |  4 ----
 2 files changed, 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e3736c42c4db..c105a3758915 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -57,16 +57,6 @@ static inline unsigned long totalram_pages(void)
 	return (unsigned long)atomic_long_read(&_totalram_pages);
 }
 
-static inline void totalram_pages_inc(void)
-{
-	atomic_long_inc(&_totalram_pages);
-}
-
-static inline void totalram_pages_dec(void)
-{
-	atomic_long_dec(&_totalram_pages);
-}
-
 static inline void totalram_pages_add(long count)
 {
 	atomic_long_add(count, &_totalram_pages);
diff --git a/tools/include/linux/mm.h b/tools/include/linux/mm.h
index 84b5954f66c3..d586a510e6e1 100644
--- a/tools/include/linux/mm.h
+++ b/tools/include/linux/mm.h
@@ -33,10 +33,6 @@ static inline phys_addr_t virt_to_phys(volatile void *address)
 	return (phys_addr_t)address;
 }
 
-static inline void totalram_pages_inc(void)
-{
-}
-
 static inline void totalram_pages_add(long count)
 {
 }

-- 
2.39.5

