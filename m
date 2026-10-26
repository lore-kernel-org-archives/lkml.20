Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008530;
	b=N26szwOtJbPYtn+DlR/VWoSouEOs/SuSLZaa2J0+QBN0J5eCllAnBtqFZ6cKBJOGDajo
	 zQI0GcIjpAKXvAINeiIzAc+sed4g7t3VgTfCNKWC9cw+ZNXYTq++xACrVYaym4vFDSLSn
	 jb7wvX2PMFUhefQC9EwDr8sjeQz4u+ZBOlazs3/Pyx2i0yDPocuk6uncbY/qIJ478x8m6
	 GX5eAPVYOzCXrUXxX8UN7AoCDEymlE2hmB02apHS01Gqxk8jlLBL3PSj0E5enJmEKC6E7
	 x+FPtQ5JcwcBARTzk4pp375RBcTW/JSwneiXAQuhtAiuuk1hNT+Ljeomho+mw3W1uuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
	b=Y2uxw8qp5PDEVrj6UG8Lg0Xq9Y6wBiiOkJ9keNthaAk8P3+W1MEMODiZ9fG1rSbZxn4U
	 z+CRzd6XRRIzdy6m8IPtMSH7bEeh7xYfM9B4VwHUdAPmZDG6hkEE52T0Enw0zF9a37a1K
	 fCJWru/lGZed+lLC6qqlo83YkjZdEuym0wHqigDULK5Ho0AlQRm6VAbwA/zrpm3gmZcNI
	 aA1HgszV34UbOCKmYAlz7qePZzVngl7/jqVPErskXZlokskVUDX43VvTIMwJnfCNQ148E
	 EwRnBtgX5ig6zlSMUdVLAaLGE4HUc3O4RQHQD06voDSlJ3uI0464E3o5C2ovvPlS2fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWT5cY73;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeMWEZRN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077A606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7077A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWT5cY73;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeMWEZRN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avjA2727079
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=; b=FWT5cY73LYPpV905
	WS4jiollJ/3aJTO/WUKXZt/iLngIwbjcfcRg6kOIMoYR0kTxcZykNFSDQJpBSIHJ
	2yc6nJjSoJDYRP0WPNjgB06MGCpLw6kOFQbNmo0OaYF9upCihH0ar70EPjRbOTT0
	oZeW+FYFyOvMPbVUy50KfRLzkEErDj3Rwd2C0BrE1H8USfmph4yl0DmzLHLJBdMc
	IWy608I7ORG4R1VnMsvh0esdRTaBsC/8bmaDEiHnvAl0wffuzGArg9+D+IaQaL/n
	c1LpyNAdGQhw7sQnVn7Rh8gs28uxsTDiO0Uy3SqKpmSfuYlXwpOuJJ6lcfcYEqbT
	lDWWCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nxb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:55:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so8850251cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008529; x=1793613329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
        b=aeMWEZRNkhNEau4Sdeundt/0BSG5SNXkVjhi2hH6wALJk1k6N6KHK67ggS4bcZiuNJ
         co9CFSA+i9u0iz0aYL/c/SpkBZwiebS/nZeC4PVCYr9xoIHeSCpJJjOc3Y/gteUykj5l
         Sq2nEiq/FbwCJpwsF5fbyeyK657xPzY+uq2OP22FjT5woSp1WyQwAY1hf6LpNOaWWFMm
         c7nPud3Apk1BRAxdOqL7Fbacl/ZY2cKAUKOP5USpDLZTGkw/tobfnMqKxTLftey/EiVU
         QNrmo+ZbQLJi3W+oX96vxF2wAwhaga67kVJJPtSmWNEQZEZgXYnH7cXwgLA6U4p0KtoG
         PunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008529; x=1793613329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
        b=0U1sW+3/beE8g4SJUTRlSSf6QI9t/e72fr8EW14AYnwqDAGYg2P15b0XzlBBHK+D4P
         rZ6u9SxqPlBfi96H/2qHekork8nuDP4TLAs9CHN/VL+vOuQEk7/ENDIEJmFoaPYLOEnF
         59zHGpH8NArA0QoiPJdV6QXmzbW8KUv7bbzpVsP4cB2V3elQFHyKKEJ4ZHQjOZmCoKLU
         ZSvqlq6x88poMBQNqmVCJV8kHRW3gG6juKJir5uxuLkSeDrHOHC6NIU3e3zlmrZY8k/W
         JQgS5Z2znL0T3hKr0UzDvr9T642OsbIC4ySTFcVk9DyIWNAAALzvLnfc/AdFdzCYCsnE
         BPVw==
X-Forwarded-Encrypted: i=1; AKwUvBwjaxaMJX9iewgcF/yPWpUuv9JH2z+EydcCSQNRHgW38TM9N5x/sUSsVoHp74ToMuWIcazauY//jVO0h3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnObT6bxeGwGUDynLQ3Bz0ctccQXhBVBEThq661jUEL92vjKp5
	DQcqhjE9DoX68ng/UZPl6aZQ5IcwHB0an+s29SLwYMlX1jxh59ckR9Bv6rMlCoHihaxUVqMQ4fs
	p2cnKznqXNqDwUwltoBY7eZlNRHyKobXkUSGPLRh+TGdR05syR4lbYPtsxPr2wNdhlmY=
X-Gm-Gg: AYBFou39/CMA708mlJfP69GZN13gLzfYUYoCxBd+GDlZcrElEf1x26oW468OuxLRv7j
	0tShIpRVqNYod/56llDuJ604BH/LjSBjAPYX4JKmP7nR8XAlmqJ6zbO0R4tIqLzb5x6xnnWHGMV
	Bc62MUc4FCTh6AY6o5Ki2xn38JEk1ZjKcMGmYx+qxdoP3Zd4QHc+Pvn0qq/gR/+0RFTMBcw2Up5
	AKF8pn+rCPx6BmqtZcwf3BppdPxCrAeXbHtnMBKcxxgWaqKFWLR4Lk9bu5p4eP1gKKbDrRWXs28
	kMV6VLIFbnWu5I03+ZdeSwNxoxy9kggvdc7X5wuedd6JIzbwcAGh5nG6vr7oH4VouaqwMpVT2YV
	XUhKM9YxRo+QmdFn4dKM5BA==
X-Received: by 2002:a05:622a:e2d3:20b0:535:1a83:1251 with SMTP id d75a77b69052e-5383b5b88c4mr95942051cf.4.1793008528654;
        Mon, 26 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:622a:e2d3:20b0:535:1a83:1251 with SMTP id d75a77b69052e-5383b5b88c4mr95941781cf.4.1793008528118;
        Mon, 26 Oct 2026 02:55:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d5f3sm3471088a12.10.2026.10.26.02.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:55:27 -0700 (PDT)
Message-ID: <188545e7-c317-4f7a-b4d7-27eb3a4cbd07@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:55:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9Ytb1XSV6JSOUFNePevtlsIZgdDJ5270
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX9ffwuKUU5Raq
 Qr59m4Q37qpXuCLrSAQAdDVz3S95y+cKJ5eF8i3Apes9xzIW+L5FJTi30F9cbG/9ghheFJxBCV9
 M6yNdwZk2zUiFeblX4TkN1OieSW3iiI=
X-Proofpoint-GUID: 9Ytb1XSV6JSOUFNePevtlsIZgdDJ5270
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf2391 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nkdzZAihEXyvZ3FekmAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXxjHy5QeFXNMr
 TwbLtCfGGQR5PGWgbg3OHgBnMzh5gExMV59KgFmf9YbW4CEGbpR8r6Jd2qHV8zejOqUCKnhVjmp
 jtoNhkpysLU0JwdYiPbSyFmwWJp52aK3S/x7rzXso7X6rHoFEu1mY4YXk8v5Be+5mWNRGteav2V
 WeErsXxncVX6OSRHDeEmpLJ2tkbU38YnGatB1ryBA4zkDTWmMkmaWS+FzJwl9itOG+Fh7L5o3QA
 JFz9OsSLdh5EeI3j1dBDuGiKItSazvfBmeUcL9cHuiTv1RMDblymxeXIrGwzbs2yKBXCy/mcXU3
 o80VIsfWzcw5noXJRtGLY1dtYMNSv3r25j6CZULc/LDw6h8/cyE8vgxp/1Z/tbBAz/yxc5TzzZI
 BILKg0kQn5RAgPsUEKsdynX7yJV+C+etM1d4kPso7+azDeTKLDacigxgOuV6jU/N76ptYpscA6B
 KXdGTw1TX9nvwCuYHPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> Update the catalog to add AQE firmware to the Adreno X2-90 GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
