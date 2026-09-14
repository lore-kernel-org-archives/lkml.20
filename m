Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7642D76A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383989; cv=none; b=gdcRdgW5Y/4SHclUp8QhhwZsPjN0LUZhBgA3cL8OYSP3uD6K7S+O5425EqPz2gUAMzeYg2yQGaApXqdFPT+5pBOQpw5LY4fbEY28tVaUVFWniDHaQ+2t9OXzTT6WX9H7Uj3ibLFcsN4BW+r2t83I5HjgkmDZ1CJb3Gd5N3uoZz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383989; c=relaxed/simple;
	bh=IQcctOlp+ZBNyk+MWt9pjtBT+n2ACcBUvj8zTzblXDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sw0+90OZDRpwqBm2Bd0u+qvmEAtA4rFaaKtHPb6BpUX+iYZl/szFj9Lc0/6PVx3cJ/1poBihd3Tr9AwZNCEVRYxSH4guAfOUHNSEPjsaZ41cPpG5jCq9HB583vNd0O8VVCIzrEDv895Jh0aekD4415SYyOcAMcK+dkXblEdmKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEaniymq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDcI0bMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEaniymq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDcI0bMy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1xR901856
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=; b=WEaniymqpGs7X1a1
	YXKHEC/bDwWWQU4ynDdBe+ExsVgbOrk8zK2zpesiiUJMlv/6dPxDjWvWp2/dQJ3y
	8U1MDOU65vpZdnK+lHMxSVEl3tNF3/a2/sNa5AHQx15aZaIV2QHggenwhl+Ze4I8
	2RMnI4/KGgHoJW59O09HJomooPMcZ/vltZEAgg6bdE7Y9CX/FdRnYG6C1N/Vgbq6
	tp6SYKfA/3uMfmKl+IvmdQbRoYxyWDzk6xnjYxoUE6d9t3iHPmSday/s480Wqn/y
	GA3/cxRX14EhTF6JsjgSdzMnbDPwHKWHYBt5TQL11xIfmn0+ZNXGYs5CJHWYTod9
	Dc3gCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrjm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:06:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so48621385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383862; x=1789988662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=CDcI0bMyPsJX9m8FPiFmBGdKDPHAU/Ld3xadTBVhN2o4LCF4ohgxoyyqxuAnZOI0KL
         mNNlFqODWKqv8GND9Z29C17VeI2OiZEH1Y4wJf+RlAIypkVww1ptL9Z6Qt/vHOCWyTr7
         w4nRP3xPnt7K74G6WE99qZbsk4E+gN7OnqDPSf9N6APNboT2OnizVkxAxaluqaKuLab6
         3LCs9AMt4Wn2SpGjQENnrwQxgc9iP3cf71os/A44f5x7+GzmPeC0cI5wtbXoRvI3rQBT
         5+fbK0sWRY5JASmzUxrOEnpiMQxG+Pwa3XdkJwvRhbyrboqGUfnc4PfcJMnwwkDaSbHO
         y3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383862; x=1789988662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=tHVhbld/72eTQarF+nbKuS9hQ3/mQnQ8WZHpyYbjsXwuRWUEfB0tM4ZXPnTq7uqQYq
         /OCbI/wruxyX01brIT4wnL+tLoiCAJW+wgCn6o3nmn8UIxS9GQ0vrFQinXvVD0/eNMY/
         Sm8an2hyfAfKKDB7VlJTncG9WxtuijtI/vCn6Tm7/Qe5fQkaKqEHb4nVAwxAJB+dotR4
         VHoguSe6aEtb/6bw5Ie+axxAiIulBZoILOGx1RC7d5ZfDe2JyTBwJazLv1CMmyh8CBHk
         C4E84gZq8+dTv2hcAPQC3kzYFUtVwntZMFCzjob+MakqaxgtOTTqHxG84/hB/yyu0IO7
         6j/A==
X-Forwarded-Encrypted: i=1; AKwUvBxhs9S6nPnkDUgghy4hLFcrzZo+tKyvBiaRWZZFjLXXiEnuSsBC+/6OSXMxljq1VjK13jJnrc0eRKLEldI=@vger.kernel.org
X-Gm-Message-State: AFuF++lVtzW4lEUtJ5Xn8W6v5gi4iYlL/KtBDeub9XJqf4sLg6sVxuR4
	d33mzJfOvs/uWSsi2zJmmFireOpUIXP/EVT1Pg00GAakCxhAJzNUXFoHl2zQyIcv7p5O414dKro
	dyt46gjKTbcm6gnsInNQGOSOyAn/HButDHfSbsj69ghwuoUbu420GPub6DN8sSnlE/xGX63XurA
	s=
X-Gm-Gg: AYBFou3bfWJighSsP0OKSrUq4g08JxWa7xFzPcQ8ACJtTuVLK8LG76sy+yzx543Jy5u
	NeHofXbpCrUPhAaAcwMHb5xHqmJJyi68bxLUQ4miaAVDh1/cAleVjav/hdHzktUBQfqROufA8z1
	4/0WoUqfwgB8Xj7+OeSp6RxZHTeEOoF/IxV0C472DdRZqGaxyS/uNds0eOSAms/Ly6kp6syZpFD
	xI9J6WUTSc7jer4H44qzZilXyxR+c1GQysRyxrtmujm9SngV2eJVsWrwMTlGN+vsCbDYNkY6dSP
	PplN0YiIVqF1w86ZFqOnEMRlStINiqkEg/LHWcSRAHPnzg7ulgTovZ/Hqs+0L05qe6KpI5wmtPU
	d2BjmFOBe78eUe7YubDs+3g==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203889585a.5.1789383856927;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203881985a.5.1789383856403;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c7e82cc1sm3020828a12.0.2026.09.14.04.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:04:15 -0700 (PDT)
Message-ID: <f0409205-b5bf-481c-bcbc-45e56d9b9bc5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kOKesX83B01y7SFNuje-neZGp2geMusp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX//QjKOn6dOZ+
 Rkxv7ODNOb80GkXP2mh34TJxYuCZmwgm2RvR76U/epVrlgnHa+nyEkZW6W1mNR15Pg6pYtRsLqc
 4vUYD7yM+opA2UCzzG7QRYka7ulQoNw=
X-Proofpoint-GUID: kOKesX83B01y7SFNuje-neZGp2geMusp
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d532 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX232Ojgk6fhnK
 vcI8BycRLbmokoLqoqJEPO5+yNr6aiN1XNY+zB8NdORHCgZCa6NeEOc8RWDj2YuF2otoUuI/8tW
 AlnBVcpMddOItaB5QjPwpsCXatVQAn1EPhRRdLqEWKYo77Hmjbok7RUpSdtlCaFXinofaaNVGl9
 fRxoU5aUYJLbaJSh7fW1PlkQnhE+JLNTqUbAFYCrhUHus1HSRng/AhK226UFcJwEz4HMKcqlplp
 0jklmzVW7M9zPfCJSifJQHABLdkUp8Zgh91BVqh6FvJOXzkkMD+IACquhrTApg2ly3Z12am1/1C
 8XMkQlA22kROy5c5byOxAoqKmiYF3mkjSOFfCKb7GQVXT8UEZe4KQuSm4Ta2mVr/FIBv3Lbutl/
 PzsZOYTxhGYZSqyodHR9heZbszSrm8eEqyPFocEIcjApQoEUyrzv99kybQeTMWOpjgGmOWjppvD
 WGaQbc+3yOm9QlBXNyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140157

On 9/9/26 12:50 PM, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and bail out on failure, unwinding any
> previously voted proxy PDs via the existing unroll path. A proxy
> performance state failure indicates that the requested OPP is not
> supported by the underlying power domain; continuing would leave
> the remoteproc running with an unconfigured voltage/frequency
> vote, so treat it as fatal.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
