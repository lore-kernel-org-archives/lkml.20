Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9C6459AD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388536; cv=none; b=hFUMXRZCYZjIK1Vxy72bJFs/+w7dO3sibBg9Whb3lzFtVZeHtfs1T/mPdVa1fN695R7KG8nZfmJSuCfN6atCwxB46Bc/MUsXb/a7yZG4A6EvN1sp0e1CkBDt/dC3s1PPle9G4WRssW6Rzsb37Ooy/azEYSobUy1bExXEs8bgiDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388536; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNS/Pfl3YQGovgiUB/ov/wvw4tHd5j6yQ1ifk8qZk40n5mN2wYTM5wMy6bm8qfYyLqj3r8K1ZalOwLuIpV0EqlcVwyygpAxRRpWCzSvaT1/Oc0rG85Gb8zRxa37wu3kqqtslWU8/ghj/OOrNtVj4ypcJJz5AVtef4utRpsMwyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVa4gdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STNDUwEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVa4gdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STNDUwEd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwAQ3860391
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=dVa4gdRyQPwlvKG5
	+UIyh/ogItCToVnPUkSE/evxRGDqC+Fyh0obLk9UglNDzlCfPWZ9I0lxsnoNGVhc
	EaQG2mucCqt0iiZpexSde3HhP6pW44RhIUCJ6CvlGGg2+RennqV5idTnx3ii8CET
	taeqyWAR69vWH/4QFEkLXJACqC/yNJwF5LKAbxVdA3vJvmAXBpT68zqI8vPdcc8q
	pxMADc69k6roQu7+jhgv5jTCr6oRqc0MEXiUPyX3T9DO4g7R8FXx5+/uedzObf7x
	8RMHOr48hRws/Hnmh/mfqLpQjOjytGcemF2CKEdwPub05hn9Hf/AQQF4CjZJQi94
	MDTOnA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so50041e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388531; x=1789993331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=STNDUwEdGSLp6TJN980yWMv32uwN6+fB9WWzo8Tvxb+lYxHhOF0cwCMnVXKll0ZHIr
         mlnt/zG7ZwdqafdBZIFc69RkT9mFMOFEilsXTGUBUtRQVpuaIsIVw9GEIiKG7zHUivEJ
         JQYLa2pyKc3+RIb5xEhQLAKU7LOjzqPnkXcp1xEINn+h8eY9T3roFszQaiTX4YkJrLUD
         lPP2tekek2QKE/yJpx5k9ClVHTehpqI8az6IeeylXK/DSdg6xPFOMvvfOnK+N/NhmXWr
         LAdDkwMqYvbQyGJ5UcyDcknvx+cXBLvVYSLCJssHIFCeySYdoTBWLy1f0+7E5s3VAYX/
         c6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388531; x=1789993331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=pkSr15Fi1Mqm2mS3QBkOSJA0gQVoZ9BaLE1AKzRKAPKwLDQh5WnaeygZ34LaSi/UaZ
         IS1R95fRZpbA8nK2skZQn51mNSxoOrTPenLchomDQn7HToiuyY5rXRrUl7lcA4R4VU6N
         /bl4eW3d1z+VOLCt+Eae8NvX+X/ofeiryOQ/m/557H4fq6F2SiSIH6VA13u9v1zX88wm
         OvG+btzWVMTl5dDTPPJ25Gq2BdJXIjr3bIqAEh7QGkcYHtmjxdQIFzG8lQUbMfaC/Rgg
         8LB+UmU6CLsJEapIlfMZCxIFU3Q3f7zhliZfkdsu+ZUm7DdgyJA/QNblLnxy6UQtqMT0
         8KIw==
X-Forwarded-Encrypted: i=1; AKwUvBxRpr9Zwa0BiD53RyEvqvWOrTzbwY4lGI62Ip9/No9VOEJQlLYeko4fA4M/rZQj5vq/fv5/MfglczSr+To=@vger.kernel.org
X-Gm-Message-State: AFuF++kvSntsO1xYbQZxHwY82KGDnqybT0Gp85+lKdA84gbxux+TLGvZ
	j1yXwHIUx+5r70ObTzua78ktYpaRWWxBW7wLGcqZtgC7MH5DjAxW0vjJfGpARxm90q8w9QWdRwt
	4vcTYfmPhYMnxqtSFNGvWKFMcu3S9cZUJkz2zZi7wiBy/YCef++sOaQYoQpdA4ZNxzng=
X-Gm-Gg: AYBFou2evbzSYMHZxFEOkVH4r2c3xiSMX3E++Xp3Dwwd3RaCkRvBjsg5OJ6WGZ5tKX+
	+HCE1lHCm86bpN5dzawS7CowfISZJDygA/lOmrF83t6w5Kt088mGkvBtZAhLS1OYlMJu2q0ZxYo
	S/7Z1/TLWJS3MdKWO4QQOLa2nzLoaB/T6sjAy5ZrkV2XqZF3fOGA3c5dbJwIgqQ76kmBHYPW3mt
	C9QGPTccj/g7zMa+ytFIAr6Dx1vuWHFtL/pdhG77dpTMWqMYiRXI76vZzvQr3ql8w1t9vmqPMkE
	B74fSQknPASk2MXVvvNUhi3AgF0yCAV1xJq1dWiIIYmm3tiZQq8T2tg+iNjK6gzXdMR7PO9+Krq
	tbi6rgvEAnRTexhQYPEPW7Q==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376375e0c.1.1789388531037;
        Mon, 14 Sep 2026 05:22:11 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr376367e0c.1.1789388530626;
        Mon, 14 Sep 2026 05:22:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:08 -0700 (PDT)
Message-ID: <c21c5275-db7c-4606-81c8-87832a2f8104@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/31] arm64: dts: qcom: kaanapali: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-3-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fk2mt1I_H2ETTXUO06domYdOZjx2nGPy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXxzIUSJhNn7sU
 FxKjOzwma5XQ32+vJbcNjGlhjHvruLm8Mo+OmH+Z1C8ymv4nj0IlMAhG4kFbVJaahiOlk3nfdFK
 oeTDRNKTzl409Lf7B+WnichCe5hxM9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX6t8p3jVUnH45
 +lG8JBe7OLVR1frXwhbPbAdJgPK146/2PnCG54MEYz6Xzj4gObYaIJ/5RrwMKZnhOrOd8IvtFQ9
 Uq89eAQe2m6UrgYKgBvvgokLqGoh3dhBm9Hx/Ei4brYrvQ2cV3tSl8aOA2TsBJP4oMPvoXjYSo4
 SEZDJmhKz16CoI2Yd8ipa54+TWY0hlWGNQKnrPEdm5XKyQczCs9dKMqaKeApl+8Bw8GgmLTgK2A
 p1LkzouG0A8QE+/JnxYm0XVi9JC15Q4xuq5JfvY9FbBDOJqhIkCJUtvtHpo+SkwwSg7o/tsOgp3
 M8ezb5ubynMChMdLMeQZ9YwYTBTrIREtFOs27varfphKMiG3gPbIwGLk15rvR9AJwUGtRxW5WAu
 GWu09a0vuu5yDpixatmH4Whwhb1RnsJv9viefUFL5jcaNS2afUAl/SWYIji3lWK4+O4Rfh+LG9p
 GNSjJD8J+/ziMRWAOjA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e6f3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Fk2mt1I_H2ETTXUO06domYdOZjx2nGPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
