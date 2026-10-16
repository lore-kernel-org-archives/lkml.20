Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B33E558F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143821; cv=none; b=QxkU6KsoX5EmmHUH3uHgvZNwDCgCiRpX55Jqf/Z+cbO3nl2TXPMr2RMTyWm8tTOVVpRdP5UPMlFjFSYHkFEDN+r1armoBDPANA9XR0iWuhc9T9T458ytkckv5TLX7QeQ/yfbWCWP8SEk7H58+17wUjvG/Wu9g0vyZDI0jFSvcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143821; c=relaxed/simple;
	bh=1D9mv5SGRa+IFU3D7tfHuRGEPhtf1iQMl2p+LrBh6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZzYg5b16AyUAnSPi187YxXJqAVtPVZyxSGpbt++21N1hBI2fkNESlt/F+LISaJMvpoXmWLgGaRt2Ik9UctcrWxNyf2cKuNy0vmLgi0I8MgB9Sx8XIQofAbnsd7cdhHD+KuZFCiVN+Nzc1eMLYkSbRCTzUFfA8RpL+yw1e1ONKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGZVjZyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCD7zrLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGZVjZyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCD7zrLp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m6u4760433
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=; b=aGZVjZyPSSM+5Mqw
	RL6BjGYpsGD/b5no9qmxy1EyFLcq1WqcF82/4OV6zv0NrYXAV7XUuYV+QV832/2Q
	Rd/zA4mvzEkR2aZC3QCydUYJSqg3XNQBDilVKDz6Sud3EpNnTK8r8VA5p/DUGnXY
	0jdXEEBgGJLH0UVM6Q/gljkCz1tIJwDvnO9DS+HkgHLOOBCbU+4ISQC8gQeAgnLd
	84JHfTfOL0kjwHDjRXfygtxYJZD6Bi9nuw+73i5pujuO9uyWkwWt3qOQHhF0RYSQ
	K4MlV7PIPCPipT8b0lQmQ4kZOx52vV5qFZZDjBA+Ku9Sr1Xqp/HxamUrr+EKsHUc
	YeZ5JA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbug1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:43:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533758f24f4so16017591cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143818; x=1792748618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=kCD7zrLpoyqFxEIFmAOyqDBILoxvmBvZ1Ku3YHvHzRG+roAibqOwlWGVwcrkaxvl4Y
         O4ztF+1CiLQM7x1gag9BY/Vv042vbi8vns8qVF3AdXEUJT4MCFLeDiObKFuCtcIj1N+9
         tLOJpBxymw1XSw5JM36hiRep11b+payg71wmEW0w1jGW9Bb37KuXKafxC0efUTNmFZai
         Jss3HLNO+zkSp4JeupUv7WNj5bEhmTxIxkrWA5ytPbioVFezyXWriPbokPRcu2U8NdlK
         Orq1Vou/S/JH/cjYnTD48IcNqqEOjrdbQD+TGAyHIpbykRFIzFPRx34QgikQygcMk2J5
         JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143818; x=1792748618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=pABr+KIGZkyIWUkREbPB6UNE7C8u/X2K622GZSilPOFt6zXqcLN2OQ1ninH9CzrD2z
         7pAZmKWpXg6p8huTSQbGsu4DYECrfA0A3U5iPfMXWA2XFJb0hdAxN32+CNliH/dsVJ+C
         XbM0Nr2aXV+ZW3Kg/KztV66lKv/AwVNPZUoFwxBf8+A5wGLSKwWwSSxLsHhH4jel75e8
         MWk53PS1UM7DaGUdTwvFjOxZYlgHSfEQbQ/8iP0h1RWmRJohdWKS8Qg9dGfd5N8D2zCA
         j/U97lZthPiIaKS9E4qmuMWbmGMft1ENXKWlMHPjpIQ39UXRoZ0YzY2BEgueWsEr574y
         vUuA==
X-Forwarded-Encrypted: i=1; AKwUvBxmieSjZxq6P4W/Jx3WeNQV8XqcFEWl/egZR+/OLDs6m02SwcMnFaowFR5fHUBBI+IbDdkIALx2/JJ/pd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+i7PgdUZFU5NfWupZSZFw76PA82bw619HdyZfccNhdYXHRQs+
	q9X7+F+/CrSSil3booQZoSsQUB8NsfQ61axKxgN3gzawBH7Pf/D7jmkAoTgH2/y5ban4midAAaj
	v2EnWYO2Y2mdpoSJBZR8ktD2J730UZ+P9GODly16POH/GF02H59cwPOB9PA3X/fH5UEE=
X-Gm-Gg: AYBFou0cac+CvUaumPJqKegRGHdgzvlC7lD8FbEardnnPGRdfmx4DOiKN5eXlcMrXxW
	/5z06L2onSpeyb5x4Mk92bl1hQpLVwNCJPQ0DhVEtCQcHVaSUN7ESU4mLrshmC9XdcOcMWsMJh9
	DMXxqHPv59L+kL4Oxk0eU8rBT7e9bdprsHczpZU2ztEjHjitSaZCk7jat8C0/M9mL2YpTDgqoNY
	aOdWz6w9OkoLn49fLM+855DeOs9fJ4MEIinBsVGM8QmXfsN02zOYUjDm2Ug4cNd5MEBX4FR0Hr4
	xZuGK+Zvyhsc4hC+p2ic983RgxxTj9nOEMaM8NvUN11fL2YI45Q/UpEXydGqapm9KW/OepI4p6v
	Pza7xappCrWHXxMNKeMVa6A==
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000561cf.1.1792143818123;
        Fri, 16 Oct 2026 02:43:38 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000231cf.1.1792143817558;
        Fri, 16 Oct 2026 02:43:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm56418266b.33.2026.10.16.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:43:36 -0700 (PDT)
Message-ID: <ec92875d-2ce5-464e-bcf1-8596ce0a769c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lb3SlPPjk4oXmsuDjyN42YwXQ1pbzRMp
X-Proofpoint-ORIG-GUID: lb3SlPPjk4oXmsuDjyN42YwXQ1pbzRMp
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1f1ca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g9NP2d8Y7Qd1zHIpgpYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX/O8s1BiIIFZk
 GkLmEdDA29QzEGrw0V+O+ejJCwasabLVAhdR3qqMMaqlCeNBI6W1QeT5JxtitgmMd3tVVH+/dlv
 7wtbmFQNCowtd7Mjeg4a50bmEssvDPP+11WFSoNEpk6qIy5OAwgbVDz7idP/7cDD2zu5P8XLhFQ
 tgyS1cQ5OQhk5+HuFUkZz2w9NPEzsLV5I/kDJ+fwRJgsK28h2Ux8WlMvPZ4O81ENaHvjl/dyPfC
 Uxoz/kZK1DxqPARLoZ4a+cgLILLjoh9Pia1KK4TpxCKtncwDzjkrDcxwc3+DbLgCITrai9HMnEn
 FV60fvPr3F7gUimjNthObjiGGL81bdLg0eF+J9cqt8P22OXczw6cLBLKEhTKGyvDF1TfnEOe5bT
 Gne2f0Jp/GhA/haG/7XEZIed/KDvLUBx8LIYm1RzxwCuilP88sFkld6WiCE1KM5YfA/jpotzSbG
 eeok70KlE6uf3wJEFkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX01XK9clseJXQ
 lNNjjRkycoR8Gvaq3f3RDbLRXU+LTKEusv8kEV42iYAefx5QEZQvIW09VVsEH4uV/CPVm4n5Cup
 UKFz5XcO4kknmkbJp3TThO/dDpNnJqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
> 
> This was somehow compenseated in DT reg property which got it working so
> far.
> 
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
> 
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
