Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610320;
	b=kPKRUooMuTWeVMbjBJl9BkcVHBNc3n/Gnk4mdyXk1QzTCEIX4t1A6I0880fq8qiLV++o
	 7bvXZGo+GXW35L0pRwe5/v9FW2IrwBXeRB7O4Loc+OFm+XnDpFUqWW5c/1KUebMbRqeWx
	 cIVUnWW3e7k23y1aKDH7jOd2BTr+v8HD2jJhIa+pj4tVTbLe65fHkkKq2RuJ/6mEGKm2e
	 6GSPSwVk8gLjAZ4cEyfjjA/thPWHWFfhg/yut/T2mAbeAuNnAgpVi58uf43kG8kfdyB+1
	 FBzw6qtHVC9OeNptj+KmPn+2QM6wSljGUm4ADPylc8c6G8BiBhOYbkpwYUzSh85U+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
	b=Gjc2eLYp2UXuu7ISoFBL/2i76WMtLPo//xciTWHCqjSjP5C7X7Q1D97J9OyBgMhFz0uN
	 sY4jsRRsnQ6lgw0axCska5kUSejcLTMfTdaH9FcHbyJBrADK0BUrhNsqG8OMYIbUGGbze
	 VSDvHvBroxMBgGSoizdAQ3K2+u4aNx1DU148DR3Gt443l3QmykCwZQPq+dO7i/j0ju0dM
	 q5lDJDiFL18DeC51gEk3xT/mNwSrMVukV+2ehf4Gle3ddG5lR/J6cqFvRmmGKLi3ph6OL
	 0Q0NfGpFzOpw5nH/4crk0iCA8BkYx4id6+RCP4N30XTZXCjVh7qC/ZnNOi5hHuiyGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JOgZyrX3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvZn5LCc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E7606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JOgZyrX3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvZn5LCc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vC4w3768749
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=; b=JOgZyrX3kdzENdnY
	09o1M+edz1ifIjHAGM8YozU8LJoaf3KblK/ncsGi3cyVN1DXFREWyq5akJRnsHRQ
	v0pqhYXVzdWUjMYSUigDfL9o6xg5XpvCfBZkt/+jbP0J2MG1SM+qPn9sUh90oARQ
	JbPqa7KkWtQ89UqDSwoc1JGhr3wUU7qhm4IZFG3mUkwb/KV9JgnDMKfjuf41at/r
	SirCjG+EaOLKJu2w+q4C10odpUtsurUQglFCfqAZgp6X5SLmpGMq79fFJd6u24LW
	UQkyDElsOw9YJKDuUSTwWW4wDXZa3R8IYDd+yOTFHnahd8CEj2yonTVvK2gqQhvN
	+QXArw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rx6hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:05:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so2539222241.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610318; x=1794215118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
        b=VvZn5LCcoAuw5MJVsn+hgrEXTumM0BJkppJfKAdIulwE4eYrO5A5Ssdw2jBo9nKmfR
         y96Azy3vKF/hikZTK+LvQdfSQ6h7KpoIRo+9VAl0SVmpDRQpqW46Aq0xyctXnaY5Xvr5
         zpARz2m+Hph8PAE5Croi5TkZGk2vSJ6GGgDT78dDkEVyUY8cqhY5JzUobCysmjBs5xTh
         BUYng9mde0gMm/Xv7Tu4D8n2pNv84ic5DN5JkLKh5TTtdvzrXynl8YdARYQO3OQ2wJwQ
         pOGK92J5WG1jbkiRTdr8DSI2QS9pf49cjwjF5sf97jU4tWWjAL58zj7pa8DDDTbWcA84
         WhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610318; x=1794215118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
        b=zI6Fu0T/phUZjOYqhh8Kb802KmRKdHBtzhVxGbRVNP9qPzhWQGvQgGuBWxpfZTMxMo
         OwCQI6Wr8CB6YpYuBYei4qcVFawbv4Om2AzghbkakkZOrpF139QeAUu//OA5qKihG33B
         LXOqfmksRvCtTBs0ex0lU75UDAhROfvmjCWlWPB81NV/YMwijLp4hg0gqewHCyHvJPhH
         GXLG/s+PrK7ASgQRHdefbCB60TLWOmEqf8Lx72Q4NJzRGxOFxeyUCVrJKCHfi3v5BS1U
         IwVL1TSzhc4PbPXjcLo7k+ww7zm4tFmH8lJNZOWDATeiX/A6dOOf0CA/SB3a/nAdSy88
         HdUw==
X-Forwarded-Encrypted: i=1; AKwUvBxXycF36caz7zq7rnJPtamkJ/NyeERDsP7CebWMsO19+qrjWCaMxdbxZntPkK7pIvfdBUCc2YLKywgUZ1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Ar/XtzhT+dZSQ46mJQtVVWM0Lo8VoWs9w2E0mhYC9JzHQHvT
	1x18l1cZlAPbReIFxNHbU7s8JkV6clMCNQi8IK/gnX2ivgLesaXiidPJgWHSB/M6ZAQsaOKmucg
	NJVHZKhrtqiqk7dSbiSee4Mi2k6/rZ25pXyFrytzB9D4IMh0b6G9k9NXNZp1jg1CGAUY=
X-Gm-Gg: AYBFou0MMNrwzXpBWZimkwYDqzc2FUzb6HlKMExbVQBRzoIJ4HbtuHxzcelr1SgLXcq
	WmLZGavH3zT0+gZTdS7HglVabAW4E1OEoCKIiRrPa3kwxpkwPBCaE7Ue5T4qMdcGDWXOIt31IJ3
	CoYJ/nQGygZkcZm14TJbGSlOqb3e++LBx+DZHmhBHHPn2HsDWWiFQlaYCFRxESxKyN1Y+iM+wRa
	j/blbqNXwfvWkjVso960UCyzrPpQis1nZ+VuBpY/jOY1yw3ebzTEfVJEePtFlcb87pdCnRmpdQ7
	wXR5byxfEcdNTs2t+9FG/04cMwVPvFsKpShBgZ3Q5Qmo0Va5mwRTpDjijoCL2eJdVAHDT/IFuQa
	xt76vVRvic/qdNpDynQBFzjzr1B2R9bNNBMF/zs3AaGAr+i+3t4oM7D+DK1gBzEI+CoQP3YOH2v
	XT
X-Received: by 2002:a05:6102:809e:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d07269b132mr4235197137.18.1793610318024;
        Mon, 02 Nov 2026 01:05:18 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d07269b132mr4235190137.18.1793610317584;
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:11 +0100
Message-ID: <179361030997.39187.2222619455151380219.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HbAEVcwtLjmajVcZafQeyrTRcCv_a1ay
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae8524f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wRwPfHjqSs-fDICwijwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXxVD72YffnS5t
 HUPnAU19bhVTNE2koF4laJ/j5ZkdiGUM8Uiymfs+6LBoW/XJgH4bPPBZQQIpEqCST3cZ9PUy08a
 ZrxC/I3gLOjT1lakwYOGd0O/P3cicBQ=
X-Proofpoint-GUID: HbAEVcwtLjmajVcZafQeyrTRcCv_a1ay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX1FYB1Kfpo58V
 sNyQHSu/4gTFtlANcOOyHw9eXH+81Xb6JAk7be6SsHtzfOBYlRdQneFowJPgLiKKBfJe8xcoaAW
 tUcnXDjVk89YlPiltE22Gat+RtcP3TBP17NnqFFpYLartoMzAICpjJR1DtQtqNz6o0wbK8d7Ku4
 CCZ+JNgbOaNOdM6sk2+Xb4x5ma8CNCsa8WGsfanP3aMO5BHVo4KSuNm+Om8M2Pl46qXxhgaEdsw
 DruSSBWCwp5QpOiigV/BftPg1qaIpO2so8VDNxOWeKy3bTG2YJHehVfODUQa8mXANcGrAIgTmp1
 1OKpBjL8qD6gDcPUxo7PPRT8iOEC3m+vxwDnWBb7EymcaBm++0pg/p6voGN1UvemKe+d7zuiUqS
 IPD6IiL32h5AGu8WThobW8S4p7j/rwVdg15skCNEoXPBcnrOjKqq1FsNMermnrLmX4dyYENWldA
 C106pDp1bSyLqhIBb7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036


On Wed, 21 Oct 2026 14:31:41 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/5d82da6d3b86301de5b13d7ab4edd9f0a1f6dc5f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
