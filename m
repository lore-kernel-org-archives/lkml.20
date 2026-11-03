Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705790;
	b=dhnuvGDELxJ58uzxeF4cV+CFvUs4Foxv7sMFs9EiJimfg4DEtlPv+XKPrP2Tqsn2750l
	 Fd/emppEgK3RSNdiGZzG4V9P79rX9n39vs4/g239kxmwjnCr/MDj5L0C1kwgRdYbf15ri
	 bZENy1kFq+owFtXyCkp1DBVmtsylAJQv0S6ShX24IHGkTs2GHebXsqdyh7V1iiNV0mRTH
	 KxvcPleoB8qwY38oTg1aYZqxTFBry55plId8aYurclUG3HON8L9dPA+FAJlnihwS8x8cF
	 MMV80uXk7xVxMEHa1ychTg09l8oX1x2oc+QohaOTa2G/Fj1Rvfgut9sWoGfpGFY029w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
	b=SgeVw8XHj8uJ4lBZbn/kH6Aia9diasMt8b1/boPxakjb1MSm2d+Xt2aWODTFOdqggMcf
	 IrIY+rqDu7RxAdnQZVvzjUZJMMZXwFerEVjA/rMJGOO4WIuB9Tink8+ygjmMEU1teN868
	 C866n8Gl+jjXCm1sd2bZyhNcUMWqBLuTeK1FJb1jXy8lUPt0EdtjHwEBoT3bXn8pu8Chz
	 USIRuRQOD8UdBS/V8qC9vi9RxV57xmAtBZu/etbJS9SIpB59/y9pSyh2hJ4Js4defuPjT
	 3UEGJFCRvxK9zBNprrKqLrqJcxCb+9toEu1nZ6gwagvRSMUNfumalKMgQy9xJ6WJ2kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHMplylt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LX8BspfE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9786082BFC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9786082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHMplylt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LX8BspfE
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMeU2554833
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=; b=KHMplylt4qd2nDjQ
	XOXksdjHd5gcy0dypge2wbhnRkW9tI3lPh0gz7q+5BxoJ6tsve5QpTfz/9vsD9JG
	JDjcL9M94cWFthloiMLCzyUisqxd222ClNjt4LfOmQuEQ24YnQxR+Cij0js1F3Ll
	57pZ9QMOeZ0m9FIsuNPCE27TIF3+YypbCGnpwMVDLxrDIY2h3dPJzm2F1HDKSJx6
	/5GdyroFIOruTALi6gyGIMbJY7tDfz1qivYe0/WCo/g9ow/8OrbRSnACMVJLbnEq
	b1jJQyIYHCfidwrbh478gFQY0Tc5gbDmjiciQqFvu0ZWsQ66lVYl0h7PFZlXpBkN
	sWWHJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjx8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so75476485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705788; x=1794310588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
        b=LX8BspfEjstCwuPIloY5vTF70jOiDKYaW8jew3uDui9uZ8Y5ac2LSgkiVEyQsPpWoF
         hPY78adtTfe+u+9dGTOSBlwzyGxqPEn0U5nD5L+gSiMQGCkYq0FshxAbMdLd+lb354aK
         iGRO4tDDoEY3t3f9PFC51cUKcGo5hxN8OjbebB/YzyqhhHNUng5zwhuVXzWZsJjiftAS
         gba0TLNlwb5poybpVXO6nVca0kfCuzwFAEellCo4TqzE372lhSlR+IE7UkQqaX8qSI1m
         DkSkq9msv6jJB7eLm6bwWzfbV0fx9/Ool9ZJ/p+VC6F5zrgwhJm8mV8KPZ66JEKKk3oY
         9Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705788; x=1794310588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
        b=Ao3st2qLHG81hclSUeIX8mT9uM2A2TLtccOfWVPp2T8a4EipsUb48KrKn2KZZi5wK+
         xVHfWqcmi+g23HCp1WezyBYpo1WE1ZHqq4oHv5oefBXX6ghcNA6Khn2f4hEhKOiIquB3
         OJPf+7ccY9TudmhMYwsi/22wAB15VETemSVMYxqwjIc+rbxKbRcTxOa9LRMA56uFD424
         Agu2g0j+x/4rsvIOKKVdDx/ilxXTL0Fw8CKc6u5slp8VjRj31yVuTXVEO9ij5pCJvJ0l
         OVB0U6K2xYgUfMUifDi5bkCVRI7A0r9b/VvA1wIl/puusk6e/p85aqNtArbFyznMV2va
         PY5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjD+ZTHipwLywdUtQRAn7KK7suWwmkG/ctwPK3dcCb5sBzEAmbyI/Uo0NYloJaF4ZC4BGIYnuorEzGGJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tYo/ZT8MeUMerPZw0QsfhwcI0nqCgVZ5XhMm/QAD+ppdnoEtP
	Lo9zUPmxismTrzr/CbZk/GAZyHtTXeRRd93FELS7AeyLRioYXiYOWX0Ud5Gzt89NPn2sawuXDwa
	J33W6om7u42KUixuXXpBrkjBuoGEwFAjT6LRoFdwcGIzA9CRkfRiMxS7RPs//LdOV/GA=
X-Gm-Gg: AYBFou1f5VZfSbg1uU/TLkkP2sL5rVbsFv5eDiR51mkF6r0QJQko1eTa2EtBqgWwvwm
	IEoxcMBpJC7e3Nt+xhJDHrQ4GsTLa/HqZc4IxqtsLhq8Alr3fKd4yElTz6EEN0qQOafpt7u57fM
	GO/wbwXRWt+anKFo+YUZGF29CAZ5LKwlocH2MiKZh7WelQQ2BUKCpK48JAPRM3JJrraX727dR5n
	Yi6qbnwdfie35rSNXA3cK81Nx1est47Rihf64Xa3Tzh5nuKs5Zuujflzf9OHi9yX+XGDnYNb3g5
	LcmM9L2qTITxXBugoXTx/lJTSsknq0MsJN4O9EZj5Bc1YY5XLqJ2NIeGf2oLcGN3Fbu6FDkFZbw
	cspULo6mpKcxOUd59dy+AXmUvS3JfU6fKDW7phE0FW37YGlzoqt6Y3FQB1/8HM4kqKvYLvw==
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2400377385a.2.1793705788435;
        Tue, 03 Nov 2026 03:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2400373085a.2.1793705787957;
        Tue, 03 Nov 2026 03:36:27 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf44eb1sm77475666b.59.2026.11.03.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:36:26 -0800 (PST)
Message-ID: <a7070853-1e44-4102-8593-857ddb4cfcb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:36:24 +0100
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
Subject: Re: [PATCH v3 2/4] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c73d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mlro_P0Azzi2O7fenn4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX8SL7NzcaFNHC
 P3O6oycopfmvlw97rMZ7jNgsS+fmj5zOyspEHT7gQYMiepO2LMkHJLnbpjTjZAyr3/QpQXWu9z4
 bO2JW1Lg0Z0M1dfA6cK+lVo1+857xssBnk+2J2CoI3IJQgxPaxtQZXXRfud1NywyXglmX9dDNUT
 tEPbaGxFWvryet3VyO9/agsoOEAEdq82F7qeu8f8PANuioI7stNfmyWahPI4vxFcpd4Rcqa4wBF
 oSqQhiUtXw9wtdg96aRA+0ITgTDbiO9IYCnETw+LT/ayUWwVVbeCk/uGILSKOBrSt4wp6xyb5dQ
 7Na/QPEukL8QVgXJhn5YCPEJjBd8m0hbGPioOvTEbLhsSkhsa0un+MJkPbx6RCirP8mOIDGUzA+
 Hcr2CW39hYWl+34TOM9zgZmqxqdeWRBYLNYYxOlFcBmOb0vdfcbrvm+78U0W+IxLdz50esCGPyA
 Ab8Fp4ovIRCxQlN4PAg==
X-Proofpoint-GUID: 2lJmZFzeJ_k_U1LA3M-KoBokdG8v_2Eh
X-Proofpoint-ORIG-GUID: 2lJmZFzeJ_k_U1LA3M-KoBokdG8v_2Eh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX9zhlatljjKZB
 BjCpv1ydrbeZM5hixEAF2rt/JFmIQrjGIFY/Xy+kRMVMh+UCEq16cZaEpK7cGYnacdc1ZlFzUAJ
 egnLxcJKWjDpcptpxjEGqz+oUxmVFFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046

On 11/2/26 6:19 PM, Rob Clark wrote:
> If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
> Only the VM_BIND ioctl should be used for binding objects.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
