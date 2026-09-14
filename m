Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08943F8C8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384696; cv=none; b=cK9MsWGBH4fG23TFuuTlLfOYcM4TRiuG+ZD7ImPvQTTuC4AEpN0LXaSDEuZwKIH6HoETAtwT1TR3J7Fg2GKyQq2mC8jJ4BXGeh2X919tcLR5UiaUY9T0C5oRnFnr0yDON5WY7zjS5T3Imkfehs5mb9K7OLXje2G1bX7EefbH3UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384696; c=relaxed/simple;
	bh=qyo572r093/Wuuigpug703R2+cl/gSCazJtTr3U4JHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMidFQvDVrKK2qj0wzwU2kpFWtxGerq8z/YIIhy9Uh6W9UvkAjgQCrhwwqOZX2InAsIF6FpYYJbBNhBQr0KwjLHTXDnMiAvIlYRyOjM7kgfYM4gSyM/9a7ocruelnLo5C5MAT+VQXbFqrRyIkf+Xjpf398ElQWt73Si74wAur3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p74lKPfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ79rSlO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p74lKPfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZ79rSlO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7Ue3793328
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=; b=p74lKPfGoxBk3sgk
	Nv7jbyh+PyzNnEZXmPSeygceSiRc+hzxKGqPe8gSasJEoh9jI28KkTBcCvBuJBBC
	WzTOXA5JvbzXDVBVkTe8WhQNutMRPF9it0XS3DkwhDoWGJi87AXJ0+RlvEDct+CO
	FpWCASMm55uop92Bmk6T/9dn+zzxgMzrOQIb0RYNCmSme9cM+opFd9GTGy6LqdXv
	WLobHlPt1oeF94En8pYt/HsObrlB/40wMNOpvIJbiUxfXCT87bg3586GtWX2lorZ
	K+KSP/tphg2ZnwVCfvi3/hoL58VYSv1yosERpux0u3wiqzMpl+SntE0EUvlmh42G
	6L58/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0uyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:18:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso55069885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384693; x=1789989493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=KZ79rSlOZeUcaJNrMl5cTB1+irNR//UP0GlXgByAzI5ynmZyayjp9an/J04oM49wJS
         jJt2my9eVFcX+UkQ+VIwOo1BI8zh7vZlFPjefzxwBAUaoUQgDwLhhYeGeIHbzBXrnntM
         dHn/G+cWw5lG6P/xUGwbmk2nrnqQo7TlWj39J6VwB3bFRp2v7pzuXGFtdB3BWoP4L1cw
         sgmHoa8MchNAWEqk5EHGEhxEIRBDnyzkiDqgTc+uC9EepCUcwOwcJQSj6FmQx4H+L9qu
         XKALmLcfopvaEzaj7TijgGBLpzH+64f1cpdzHJoK9BMpm8Qgpe3nXNS00X6SLotu4ByT
         q1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384693; x=1789989493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=hpMIQKXyeJyoUeGlYqMMg38Jn9Xp06Z96q8lRB+fzd/6raRjghEWf6aCu3YhGLdQCq
         sezqS+I2f72e9IRfjF91USnapHOqZoyo42EUk2NbUecta1UuZzD9rlk2koTfNlX83uI1
         ecQbljAZoNa2ZuG0JxZS+sywqrmVJ/e409Z51vDJo3xSeS63KLJcq+BTqVe0RRxXvjDQ
         0IrmQxWAMCFkJkWQOSCK9BOm2YskQl2TNCgLveQvwXE4mZrWR6o/sYeWzqQOFLZ0u6zj
         aiwHa9pRvwWhy5hpYAFylwE1gAVHq0OavTZSda638TJTGPytGHo+wYBL9dp3JN7jgUu2
         mADA==
X-Forwarded-Encrypted: i=1; AKwUvByRxztNdX86cQLN6183h0C1s0r0g63fiJXfTrfE/OakdpWHmYuqViTiJ6X+EiEoUatp+3grYlLYMtDn33k=@vger.kernel.org
X-Gm-Message-State: AFuF++myS4YjQ06ZQOH5yGbhwcOInvN89WRxTrBj0BxuGMV8YxBnnnlb
	6JhWJXWUbar3ZzN8jT/dzZP7EWCQLOJaFGNI4zpHt5Wzn1HHPH4t8ORTdsDxqD3dTDz1N2uKdkr
	lsrqtgH9W6XBuTtV+MaGOybr4qdHGIGAZuExIV9o4ZxgONgrouZpHXhysE+wsLho+QIY=
X-Gm-Gg: AYBFou03tEl/9ieeUCex46pcuAqkTV/opzBUYQ07yr1g3rvazlYplsdcN+ns38+ESlG
	lVEb6Ovhy3Q+lXOXeR/6nHNUjaf6i5AyllEALYD6gXNOi/du+x+91oQtS1FqGoyLFhCmf6+4RLl
	2OAJCIGLPIx8/RPQx2cnlZQpwvNUsNEjQyTWtSP+0ZK1w3yLxW7ReO1VWk5vTD56byC1pKEQlqF
	wuGZISGAbyLh5BduJtWAdmLEVG6UgElvm+z82SUDFQoio0r5BMW5jWkRyZ2+Kofy88g/sPpFy54
	5TRJVGZXW2Dma4N9CkNFjjYadCYkV64c8DTcDipGBuPMxyPTg+huLbWeOgoLRuLIUj/O23aClc0
	0EsjPs+b6CpVArHlHy7ApZw==
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216467585a.2.1789384688253;
        Mon, 14 Sep 2026 04:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216464885a.2.1789384687844;
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b593d7dbsm4143990a12.22.2026.09.14.04.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Message-ID: <21722931-0a6c-444a-b23c-59b47dd82430@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:18:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/20] clk: qcom: smd-rpm: Add clocks for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7d7f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=lCfP1g0v9f8vL_Xsk8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: kpepxaWjbtlyujodCQKmCcvlpZaZMoZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfX7cgykLRFEykL
 C3mF1d7r/2DH/kCMBGIO0CdS7Ww2SK+GxJvRI8DqQ4fb615NMNGLnPx8/31KLZwmvhw0lbYx5C5
 3RqDZ0nsY4Ef6UcVzNb12etMBbNEAv4=
X-Proofpoint-GUID: kpepxaWjbtlyujodCQKmCcvlpZaZMoZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfX7Epip1FqgWf9
 0rAKouyPBt1gS/18CmDVpXpFsr/7l9ccC3k9LM1DSX+F3cGGRgBP4ITnIBVmHbD8oeILC9O7cC2
 ST5ubKisXxUJj8oqElvXJvLMCFHvDKcND5KlYmTOOBEMBJkOpL/YnRQ8PrH4DKPH+hSO9iuIb06
 hFMK3ZQpxvZwRA4fFjNIsr6x6VRdhDKmJSj2VkRNne87OFbys+F9JT/sgKJYEsiGeUGCl9XJD23
 +2pZyRCHA8CxNiQzcGU7QCRAiXHaba0P7eg0D1PO5aJzKJzirsgUfnyvq1Ky3OukTEaGwxobRZI
 cu9L/Fn02TI8NStCHwY6X4IzmJzRylpMnfqZ5/eDLGYXnST5yyfK21zPhKnJCzwnNSEDAfSrU10
 1z9g9dZfk6A6o0fW8xL4ykmFdM0on2l7XmTT4Vzxg4KFbDTc8CjqUu5mxxlw9LdihtYdKs3c1Ih
 eWuzm51EceKSp1my5rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140160

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same clocks with MSM8976 and MSM8940.

Let's reuse the compatible then - add an entry to dt-bindings
where we have a 8952-specific compatible in case we ever need to
act on it specifically and a fallback to 8976, so that we don't need
to modify the driver needlessly.

Your DT then would look like:

compatible = "qcom,rpmcc-msm8952",
	     "qcom,rpmcc-msm8976";

Konrad
