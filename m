Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D23B7770
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258246; cv=none; b=OxhO7lgZby8+izUZgi4flPRlylTKB1Htb2wGgsAF0ozsrtVH08BJmfMFgU0rko5ooW30bHyqWoqMFr1K1455N0gEScPDcS0Lbh16byF4npFwVvF31M2RBdDbDOdDwqiez2bAVONqFagcj3vkaS41AmR0gWYmD85PH97FW65yICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258246; c=relaxed/simple;
	bh=WPWzgn8BzSTLXjT9VD+9lO6sjFQsNwDPrAH6pqJv6LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9YFs4L+oJlJqPczOJK3gZ4WnAo+ucSwNJfYnlfd9cso3/HpDjOHQ+cPXJVVGhisjFE3+TBKxfO4yFIGpKcqUvgobl8VuGlw51T3S8ekJey6ylvIkL6pU+y1zLYv8yBCaaHtiU0BBxNxYHqG7wmAkOXMCVbASFvlt4GohBXXSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAe/ryk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDLqt/L8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAe/ryk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDLqt/L8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9sSX1179112
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=; b=nAe/ryk8u5B3FWhP
	/jbFnH6FSU+jOiUiBTd4v9U7O8WAwx3cVeZl2PhWAQVpS38MayEzG2nyiWtPI8Vp
	PoWdgbaNo3l9Rt/pWLDyEKj+SUAu2Mk7vqJADZLjGOLJxYzKc5D8LLSKYrVusGZ2
	8kJ46fkuUwxU7EAkcM4KsBN+hKFVtqiZsDxZkTSkYX6GJmw48p15uEn72+JbN87w
	1yUaILTBN20xlhJ4Fx+U4BMQzv7WYjP6ZH8CmetaO0PHCrnu1fhBSN6FJAg1yyAM
	LwuMoTVZn8wfZXPb+oRZZSHS1AqF6m30Frqm/Odjf9AWy7qrfan8rQmtA0NuP0Sg
	rTEnXA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bghh2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:30:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so3918948c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792258243; x=1792863043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=YDLqt/L8nw0wPr8PVb30pmDZGu4eJjIHho6xk13GahsvGvYbOyU070cPBaS6z/Xnhk
         fpHhrIjedF2uSMDI/uLSe+fnuXCRlYxFUM8l5mdTXzH6+tys0TDJUzB5nFEm6OtwydVu
         Skl++q0rFoUIENBTv9nvEiFKsP/nJAizkhlJJkJSnM7y41VZlKsJusGFrt/CiEDHfN6L
         xbYnQJfURjnifQh8ESLYeMZUYmu8Bfgz0+a9+pNL2SXQ6j5S5+6G0mw8wVQ3wxohEis9
         uytt0JVCbn8YyTZ3j8NHvlrNHREUf0PtRg6CHaY5BVdaCvMyxD6aYWy3O01GusHB3RBy
         /9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258243; x=1792863043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=elOEINlY9Lvb9srgrAnQrM6ZZGAIOXeWgDTBVF4EUVd112dOcjPtyjRMt4y+07Nh66
         3DoxFC/5GyLLklJWZa1tJokU0vbSAL4Jh0UVLs+ITeoz2zlmbst8up3S5HroS9PdmVhG
         RkAueGISSx3ePKcSV4xgQDpkD5JKBydTSkNEunboE8/GJzSQwebO9I3wityk8GIgmGBv
         KzxN50b2nmVZpYNIarI0ZaJqxrzvGmtZXhaxkTzbgTVrRXpzs3OEo1QQidRWcmuKL44f
         4AE/zC1bKKHgEgvfX9PzDkN3LP92bfozsP7r9H7IYDnZhWOy6RygSS6NTVfEKGM+1SD9
         Y2Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxCpHc6rr5DGR32jAKyWbreh6fKPeHv82aYKbTYdXn7mTe4ou08PtmDh/aqm+Qp/YGPFDkw/Zki3jQABqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWvrG4XmBh4U2nHlzGe+32gQm3IJzhgX0jGzvdMQOeT33FUnA
	QxIetapfNxR0dBRl86UwOxrZ8HWHc1Dm8xakgPwtcANEgAK66SorzYL4NZU1fnuG1eYckGqw85Z
	A28Lkq172SHLCK/FHHUbamrcfpdV9543SRstWB7eVkf3QOVEnKhSVOl/Q6SvCdhqBsJA=
X-Gm-Gg: AYBFou0DvU9oGtLGCqDKYZujsCMQDJWt9BsKRvJtybsYfzRznNegrPhbQUN5h1iy82O
	rKr7RTMM0UxQQoocB7mburxMGBAWEwsty4ORWes2h0unXBsCRuk3WF52E8Y0zo0ytdowLRNDy6k
	M57uhX8VIxZWr14rBuHnUlFuTGmkJwvdSIyGUiPsTQh6W8UQhHH91g1OBPpED5dAHq9ECRncRTY
	jkQ9RbMUPeGxtrBb/yJzNS9bck1OA9NErrso6p2/nb0/fdUH3f7kTR18i0jNl5mKB9kYsNL5iA/
	tQUuvuMO/mfhaUnSB4hjm1UeVFeHAy063kUBab247S4v+1Db+wd63on5x4lX+FCDS1uVKLCOJT8
	+QRzbzj0R+W2Gh2SMfmm8ECg0Uw==
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379107c88.30.1792258242793;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379078c88.30.1792258242242;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm17247527eec.10.2026.10.17.10.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:30:41 -0700 (PDT)
Message-ID: <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:00:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX/Kab9ejsdqJP
 e8qZ7BYMpgGveLuMIaMK29S5b/RlRw9nbxq6iG/AMghz4E/wjS4j30E4OM+joN+cGcbtTykp4Y0
 Us3FbYbagegbOYKunGKwND43XSleYDU=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad3b0c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CCQDo4VjHF3mKuCWjr4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX8lS+HtqBM2wT
 dypmEshXtM8aPn0KymzZoSGE/2+MwSDdF2gSOELD+K+R7U5jrDJQYjka8Zz6Wkveyw87OnN+I+I
 tVuaA5g4k+tVbCcCpNvN8vaAsAeQXgum8emZetDnridOKk+DPe47vh1/Y7tKSsZJwBvjrf0ikka
 J4lrnslXtwgRqCX+sKX5FN6HCX7RX3JYzjo/kqAoC1/teE7bqo5SijTfJ8mkWZRa3zAkuDsiER6
 EsnGL4Frg+/1U5EjQoguTjZK5J0RbZODWN3yz1GgLi+mhOMtA8WLANje8FlU89OUm0BeDOVefxI
 NAU/NrszYIgzi+qnN2Pse6/z1w8eixZvjoEM3XDLe9EUbQAGPYlyl46CFn4NlF+bFceDObKXJ7G
 N1H62BX/FkD8CWf0ef6nZ9XnrMHaSgka3Eay6IcnBB/7iMwkGfvdos6/p0XvkLsZNoE4LH7MhRa
 Fu0xf++2SM9gy/G3l5Q==
X-Proofpoint-ORIG-GUID: qvfDlQoyHEg5KK-5w72668D8vitSD8ur
X-Proofpoint-GUID: qvfDlQoyHEg5KK-5w72668D8vitSD8ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170069



On 17-10-2026 09:22, Anusha Arun Nandi wrote:
> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

This Depends-on is in the wrong series. 
The driver should not depend on the DTS.
-- 
Regards,
Nihal Kumar Gupta

