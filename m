Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810192;
	b=BWIgwWMbOxKXQ641wH0eP7Kr/z09ULD+LxcyaqnugcvrVHhQMds+fkLV2hh8zmmhYkvg
	 uJaUmFnOur2MfTPYMg24XQggoQINbjT23mLcUq1ls6VY6condvk/lpn6NIpPtevI3cPFW
	 +enK2+aVsEZxwVQ8tRG2ZelcAT1CsuggqfzZxsD8IlkazTqSiFAAac1jIRhEU2+BqR92t
	 OTr9j8sfVhSDWqeXaYQ/eLKumBnvreaiXYYjXK/PRNqR4YMxKejUdPXWYp1qDGZvEnqza
	 fRw2qpVhNHJYkVYTc/juC65Ll+23RjITTlxayvIIlwrSfeUseEUs35vjU8iUSVnhNIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
	b=qjY4JvaCom6u1EXQNugR/nhYzG5VVCu9+3rdwRPlWnXcivMyLsIqUvhFuzs7d8mO+oLg
	 dAyO8kbEScAcTspUhVQyr8fsSpg/hdGYc7e4CmgTlvImShIKpXBirJjzKPI5lgRi09UU2
	 5CtlxfR3l/bj5Y+KeM+Bm3/NGBLyxBfoIHt3B8PlGEs4AXjmrXQW8FMSwEwLHGukbt+lL
	 G1jY1ydW6ZQf6s8T6dN36bUDOVgSTdgedyVuyk5brBm4+fxVlLvf6w1rtNgOzvindyGRn
	 ZxKnIvCqojuBXwTCo6gkTxRIqotAGzH6MpFDZv5yf3+PhSB45fO/oF1tr2N3M+PuwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaFouKCE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz7ArjA3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72F606D82D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A72F606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaFouKCE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz7ArjA3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj96o1692579
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=; b=UaFouKCEuHtwzAXj
	sN0G1e/I+rzJKlQkK6bE/o4YDrLnHB0rxFW/PzMlQjFYECBAArIQgMtOJH15suU0
	3QUgHfusOb2vXi1XnfCijlUMMOEdbiZTWdiXmTR8swCJnbiC+o/HP9C7J/coW1Cb
	/sJMK9UPBqbJhvslygFMUPMkeJolISD1b3XJZoYIH59Q6p1aTrT4joN+YJ3Z1RP/
	jiS+3RlU9aPudJOYFVeRnZstsdlFxqtcs3yaZnSoYMjZLUpzjfMUicII57Z1sxuA
	b2fZ1gMkcj7unw2TzpGPAECp3122JBrzTMN+lHrgN1oe6nhdGBYtmhpFwgvNgA+k
	/fhHaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so182574185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810190; x=1794414990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=Pz7ArjA3+ku+KFqOONdjbwKwrnTrwikUgV0xepJwPpan+Am+L+eulxgwPLgwA/uhRN
         JdZJopETIu/RtcQ2KSqd4ySBUmi//Zm+t0ZTrIiR3uiWv6ExK2g6rLmo9ul8o9WKZzjD
         jF50L+tdQUwTb6dJJfhPnDQRNKYMhMXNSvqif5KQyp1JiCzEzUqHWRVvmQOLfkvkaKw8
         oTyn5jg+mP3W/AXRL4HZ6Q5n3FxOU9Z/4CmtMUsDRtXTWCgdN219FTg09EWs1PxYoy/8
         YjRYtNUgGztQMqvpaTj94fCmmnElRhMtffsmFbqwfgFE8OAT9ijFF9Sl7w4I+CLCX9qn
         x/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810190; x=1794414990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=O1PAdPQa/eRubroW124myErb64cxTdh2gd0B27Cqierv50IHdCWMe2vCrsjDT/BphP
         hxQ1aiBTN9EP3bnH9ZW9juDgc4iIfwWCN+WUctdN1XUP6jbBoFOfBUnr8JcPlvoR+Odv
         bmotV9XzlOgc2Z7YPsH5gcc5qkdkJWJ1VxEtvfWj/rb0HFhWfx32ZL6dXUcqMVy3dUrb
         pMqoSahAB+pJQpBhy3sZtZo/5RXMiQ2mmM20KOV1GrZcAZ6t6VubEsB786/bQluTmwFY
         gg53lhPPhiFeGXMQkDExT1e0WnLos/wX8VIrP0s5HVlfok0QiyEyQl6KZdNnFC1CPaDZ
         As3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzW/QCtclq0kxzrQ5t5zlwMhhgzLrKN6btuE/7/L3xipfTHbj+aVktQSGbhwVEWxy+1f6zUQSUrINvakZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fHuuwtpUsQHEvUpyp4mYN+xQQFFqQultNeORPhBw0zYcPw4do
	DHrbWOblMwH84kLkk//TBeLAmESVx8fpNm4DIRj0L6fzPXYT19q+kA0c70WWQLxqDHvNxOxTXy7
	E8lf0gP+Ogt8723VyFBupDgYbBC/wdHcpR8tt08+qAu6AtU8iWh1OO6T9PqDiy8FokOs=
X-Gm-Gg: AYBFou0g9xH5CKICYcQNPA0HxGe9MhGy7TsFnAW+fTyVaGxfVodLGj87EAUOC+hwt6B
	Tj+wBezkUL16LJuqkjcuvGtfLueA8c3g+8vdXQx0PKCX0S/UYSXaXwov4TAu31P58Roc+ICHZ8w
	SVfs0js2Nl4lP5CAp6XuAMAC9g3jSAy+BkXjFO9TuWNzUhXw0vAXJc+jPNW4YukzOnjwFn8QBX1
	p8ggmme2V/mXFSApuiiXCLMdRdmGy5RVz9iK7YBplLl1viQICAdYh9CxLBZTc6BkWkKkqqrb/UM
	PVOGoMPtJ6hzJ6/KNUniZy0/9oOfIwCP/IxTVtxA9MheWHxUlsWK37lTgsQwXdav5jKQFU459IB
	N4QKiZi9Spm0v52/8ecEDj5cn/6w4c/jXH6s17DSbHvkhmeWQl72dj5Qq+nOyGN8VVTc+4qxjLH
	gYqWxOVJ0vUAHvFx+MKI2Kbg4xUhbDGSZ/NOQJHatpM2fddJCASfXTxlkCTkvC/g==
X-Received: by 2002:a05:620a:640d:b0:93e:9934:d179 with SMTP id af79cd13be357-944216da4abmr2556843485a.56.1793810189894;
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:640d:b0:93e:9934:d179 with SMTP id af79cd13be357-944216da4abmr2556836785a.56.1793810189373;
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:05 +0200
Subject: [PATCH 1/7] drm/msm/dpu: fix the comment on the RGB UBWC plane
 count
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
Message-Id: <20261104-ubwc-format-docs-v1-1-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CAHkr5CD33DFJQjC5hRRncFTgq+EH4OMdHJOIvKkuI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq6178730VYiuN89SBhOeHfmoweO7VJXOnWg74p
 yHNRo6XObWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute/AAKCRCLPIo+Aiko
 1XJBB/9i9TOmM0jSVpjdOHJFEnirGeiyzwiBomZwJrKi5YlcfKcYF3qP2f7QgUMTyErS3BYXwxo
 4vLyVIIk+pmjBQGTjAB7yK+kNna/NaW7I/Jxww3cN/T6+y+7ZyP+HJjHXZqX1OtrPo4q8pYeTNj
 rLkKI8yhrGp/ZRnV+fIn+FIeS/3H5LrT1JU6taU+YqWiRpUeB+1g5T6XsJnJJpyjlhxIC/v74qc
 OEOPJZ/gwbanUJc1Hn+wMObYEVTflKWAArFq79lsBIhGCnNrMtFCcRoShoMzPuxZMx8uakoQWeq
 RmC1Vis+2s2sGzbGTjKfisl0MqmwsaSk4n2HSKVVQ4fRgVSI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX+0Iehh/y3e9e
 3+ELUjnlsz+gFof7m1DzSw2hgwFQsY9LVIwOPqpawa8h+vOFfYVA3PPGPnGmebzcE8XSPIHbCXz
 ER2O9oQxfxTJEiUj7LXnp81pou9bepHceG6Tby4BnucxyKTQ5gPByidbVkxzhRaOdV82TI411OB
 s3l/dDsRDEd1+H6iFXnLf+V2HgXpQ/Mks5unLo0+EJjROu5TIzFN3j7+mmFlqboNN9mHGfVYnIZ
 WVSs1vA6P5+JlnZdf3BYYljtds5PeJSxjCPet8vlBf+yKGWDYgMKSorTEnxV7R4uiPuiOnBC5cn
 sl4syHtb/97KT3R5HvEt4E+Xr7/v7pgFMJD98CN36JYNOcYv+4TMNCRS4yjeViU0iVzYDsTlcyI
 Neg8SonitUxvtadJL5ASDZCMgx0Adi0HcNqn8jR+4m5o9FvULUqEFIiVAreqs4BT4ynVXwfxbiH
 L3xfpRDu1GC+L8AP3MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX7wdPsBzoxqqY
 nQn/5DrNrAeo5mehCDtj77ou3q1Njglj9/uk4e/Y8Ck+BCPXvOc3R9bgeeOSjpG9PBEADb0A/Ky
 shM9mDmI5LnhU31c35wD32NPo2IzIQk=
X-Proofpoint-GUID: nf6azINbf47jgtY0RbkI_OxPQNnlslF2
X-Proofpoint-ORIG-GUID: nf6azINbf47jgtY0RbkI_OxPQNnlslF2
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=53nbmNL_gIBj0mvaGlgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The comment above the num_planes adjustment for RGB UBWC formats says
that the uAPI leaves plane[1] empty, but the uAPI has nothing to do with
it: an RGB UBWC framebuffer has a single plane, with the metadata in
front of the data. The empty slot is in the DPU layout, which follows
the SSPP SRC0-3 address registers. The RGB metadata is fetched through
SRC2 and SRC1 is not used, so num_planes has to cover slot 2. Say so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 590922c4f69b..a8e9a69834af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -126,7 +126,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
 		layout->num_planes += 1;
 
 		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);

-- 
2.47.3

