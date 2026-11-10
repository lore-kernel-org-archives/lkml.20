Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323744;
	b=0dxXPrhCNH8q0mpWik0H0HkrRAPgILb5qG/KWiK1Az2N89hhcXkiTtXF3jEWEuY1y4oj
	 CjbryMyKZwb8bUSMn6E2PbCqwLD4op/Fu/kWD9udaoxqKSnlKPtq0BPWWIWBWu2HLz/qh
	 mq1Bpxdxke2boYOdVgVNsSgGqbQD0EJ1ya2XfdspojZF72G+0x7y+InT90GEZEpOr6Nul
	 6o3HTkRPO6I+u5/UpeH0JrXtxzZnlTHsMMiWpWHbIo+6JSc9X52V8SBDew2LB6hnXRzeF
	 kCv8i3uvF/T6zbVcuXdIrHoEqxUYfiQuo/rh4vC3V4yrIst4jnqbYlD0DzbXuG8hyng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=;
	b=EQAzCAw6w6TY/xeMMnxhCBQadLTGrx76vRNq5SB4ttA/djkmY01Z2NqLvBYBZqcRLGWm
	 sdNoQe252u6TGq5Pg73JQmkY89s4qzRiLZijWuy9e1APLpWKpWt3i0mLMHnqjkRBmp/y9
	 A5VaUYE/JEF80ALNWy1i7XjpFZQ5DDosCHKCZluB/aRBAkPnSpVVBzX8AuK74A0wEYXEy
	 DHr24SLEa8yDuQSBUXBDFWR/7RXFtHXSZrGMdyw/4k/Q+S2QM+JEL/eUZR4G/WKzas0TX
	 GxrZ97pUcK764cFCemRj1rtbCxJvEaiVvXpAXJB8IdifeWpvWHCAF6GnPznQS5sm32Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ag+rVwYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A495B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ag+rVwYC
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAEpVE24047775
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSF
	LmlaQeYQsbPiSE8=; b=Ag+rVwYCVCl+dxG/6YaoTME2XZXFS8Ml4qOb5f5aN/hY
	w199uroagCaME1+uFLtNnFAevh6nIaE7N6SdxyuIqPEzsihdyilq3gNfj2tLvc7Y
	CwYj6nK1ulB7O+qsUFlu9eTGa9OE4EZDnpGW9oR9oYd2+Q9yQYSZ5XcW4W857xKA
	of3asewuVr5iy+bt2jXG31R5/GDJr+Vz1z1+UgMLv/Hc7J8rfM+SQQ9IUcqk7BWj
	vJML5QoEszM31qN/FHzndOZWlx779vHX8lUU2K/Thr3qouWvsQZDW/VwOSz3Po6q
	WqcqXl2ynbAcO3IooCiB8n/wp5vBX0I8u7TArYoJRQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hv4xkrhn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:15:42 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-88322409239so31658517b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323742; cv=none;
        d=google.com; s=arc-20260327;
        b=BJen17+nkzJ7yTVqi9PtgWYcuxwnhHr7kqYdwJ6o48XyLVIKNSTe3GGIylggeKU7dP
         P7E9VXlaoVjviFZi/DqJS2FATpJVwOQRsF3Qt2G5djlkawm+l8PdGUFkmB3Up/EmWTBz
         Q4/m9NOI4GHpKwi5jhxKZydKb1O+qKO8BFVssurCN30ld7VZnhlaz/EghTpi4BLdmHUZ
         B3ZpixKvJVDTPOn0aXPk2MbLUAY94+WBj44103RwUWNrwVDIY+a1E5dCCH7Nk93JaUAU
         kWlBsgFginTibtDMYoEKplS0fAs2ttBtK33auaRY0Vd/2bBdGXPHbX71nkRS0uK23QZZ
         IM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=;
        fh=HE9lQEnwr3n7EQUBwDmy54sk+XGEG0DRPBpeyN/6bUA=;
        b=ZerhQV8do//9FNDqb3TSPCMRvmceSdBbdjwVsrYxmy3/WqfmUB4j2MlpdzMhUtexzv
         HTZjdZaBTFMFtH7is1SIOWqnrodUXGND/Mj9DXK8L93LITy1fUI2XwdMIHgCzcJ/zAm0
         6LsJlgq/Sr8dFtrG8OtwRRnb0ek3XfNfNHo7Z5b1zuXyQbJRcladR6LeTfVsEHOxhXYh
         CDYQ7ovbLKL4sUglhN01ZZBuYYt40aLNIgS/0NXNU3vDtYUn+nVz4i8m0nIPKEMlS3au
         wH0ZUgnzSREmX9E4uCUN7zjE9xG8cs+FRWRIvMC5nVA8c7vVWCEchcpF5P1WdkdxJEqE
         m7aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323742; x=1794928542;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9fJQ8pE56HbkX1ZUYrhxVkU34TSFLmlaQeYQsbPiSE8=;
        b=2xeUyNqIUYqADb001p0XNp60JcS8Xf+O1B+uvp8wBvnnB0Q69OwHmI61MscXDKagAi
         E1cSsowGt8CzTkV1msJ2mxxHDgk14hdtKOFQ4+yaq6H9aUvA7agmHUlE81yG3Cn2dnLf
         hBywvis0aGDrembn7dSV90A70s8hShazBHaG3vIAMXDa5gkqhzM4ExYDSGfRFdiM0TF9
         Y31Z2yyV8/umq8btsDd2jwDwH0Gkd/IMPficSzXK1b1KXwbRXAdRQxNmzeifDNuicISG
         BJUF4OSE3yYZLZ6DgBxPyAMzaBDyhpmJeeGD8KmNOOQkj8MPxn7JTg3fAx/9DqfF1gDC
         z0Rw==
X-Forwarded-Encrypted: i=1; AL+hErErwCeI2aBTvmj4cdDEci84f+hVa1GxEkTuS96+5daEPEx5GHjEFM2d4tPIa5iL+gN704GgVUbrvgWI46w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RHNXuWaXv2iooADVQRWIAwyrCE2MzedDryWIyhDQAeJogAJrI
	H5nu0WAWXerBgh+s7DsTqGGNuMe1fXcDCN7NZmHDDXm2BwcCdO/2LimEgcm1tnKFBy8d3wZdAj4
	IJHX/bxQaPtAA8jv929WP39AP4N941cp+N72In0GTlgi4rarbLKs1A2kwG1adjtpYOzcQtxG0Ap
	TnBt9OioOtmBmIksi5Is+URzht5uySG5kKyozi
X-Gm-Gg: AYBFou3+yjFXjckydW96XXm+9KoPqYPCw+fBzNg4uHgnezm/bEiHtMmcpG1nQBtyf0g
	Vt8qx7T7YLe2g7vs/eQMkGpe+BA5kMV2XlQMymA6WXFra8Ge/Nf2pouOPxW4c0cmKmsPVIuQ6MU
	PkaEg0Mxa88AckUM5tMQm45j2vx8VTVuakRgcZgUXTHOTbb4qYCZrg7/3/5AdkKu91VSV31uBIP
	OsI95gY2OdaJc/luXMezFumFXXZN9cRCnbvALLLHrDKFXUAtykiYYE9F7Eglipn5BToMKa8EvT8
	BbNApJrASeaee3iVJhXpVCHzzHIoTT7ICQ==
X-Received: by 2002:a05:690e:4846:b0:67c:1aa:2030 with SMTP id 956f58d0204a3-67c567efb25mr1187118d50.67.1794323741911;
        Tue, 10 Nov 2026 07:15:41 -0800 (PST)
X-Received: by 2002:a05:690e:4846:b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67c567efb25mr1187109d50.67.1794323741481; Tue, 10 Nov 2026
 07:15:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-smmu-l1std-cfgi-v1-1-65e5203a6516@cs.columbia.edu> <avMxDbv6JE0dg93E@google.com>
In-Reply-To: <avMxDbv6JE0dg93E@google.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Tue, 10 Nov 2026 15:15:30 +0000
X-Gm-Features: AclHuK8DUCRIoYG_4OUqBuLRYwkfdAVKQUExB3-Zc9tH9YZI_6jnEOtLYF7fci4
Message-ID: <CAPOPQMAThQLj8Q8bMx7oyCTHehV2KTugeLNpdUrHQ2roPw1TZA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Invalidate a new level-1 stream table descriptor
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: JQDsM2Vqh4cnhka-SxdyHejfXpNWO-hB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX7TOQ0CRG5ILA
 7M5nW/C7q3FU4Y9AXP1r8BsQTmLu66gHSDFuXXyuAeyRqe5CLgTidUMAb5l134D1gDq1egNQiMc
 EsNdgd3cfCd4vaaAImfMXRs+dogS8ssolLvWMYQ9y5bCPy9wZusLznnli2dNUIny6xTvL2svOYD
 0bgGrtnU+Cfm/DhonCYI7Y1lMwwfHmxYVrBt1xwPfA5caVEkZ8XqAjyEEm54X/CIhpSzCJku+ij
 kmvQ5LgFH0wq9STNkClO4mISLpZSmqydO7lcpFVMsSOYQ/xPXCF36do+fD+ZzILb3rR6nxolXJ4
 dtp7EWDvnaS3srH5baSTJMmG/AvJLlalrpQw0vQoR75IM3WcCsStbhhPZOSOqTCXvlb4rPaURDY
 S7VboKyLVEAs/CoOlVxqxXX3sRZj7ITt7i9fYEdtEZn+YhSt/I7Qf0n9zKsVQiXPbqxG0vyQkyw
 a3NU4r67+Xdsspga/oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX/dRRQYvRKPVA
 C0NFVbfZWZcI/zvDw+g365gF1p3TRWS/fEN7/XBhXcUCM2OUT9tQOk37QVbbe151MhSEHknk0Hd
 yUojlF0eg9BfuuM69xu+ZtCCwCB8jIPy2tp52Y2vDph3+K0txDJG
X-Proofpoint-GUID: JQDsM2Vqh4cnhka-SxdyHejfXpNWO-hB
X-Authority-Analysis: v=2.4 cv=Uf7E26SN c=1 sm=1 tr=0 ts=6af3351e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=FlFfRw3deazO6x7WvR0A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 impostorscore=10
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=10 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100060

On Tue, Nov 10, 2026 at 02:58:21PM +0000, Mostafa Saleh wrote:
> Which checks out. However, I am curious why this was not seen for
> over 10 years with the current behaviour as I doubt any existing
> implementation will do negative caching. Is that something that was
> observed or found by inspection?

Thanks, Mostafa. Found by inspection against the spec, not observed on
hardware; we don't know whether any current implementation caches an
invalid L1STD. Either way, the driver should follow 5.1.1 as the L1CD
path already does. v2 will take both comment nits and your R-b.

Thanks,
Xuheng
