Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ABF3A784F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460022; cv=none; b=JfN11nQZBAeGRj50tqj3UFL6Xa8HGfO7SLWZdTqZnzbMSqYXUJYjO7NsPMeZBNLplsKgr/3ZY3NfaKrZ20vwqKgTBOzTtVzq0sZ0dPAe5t9VbLVBFHsxr7VZdIMQhrXFwHBPls+v1XqvfX4gDu9oF4ezUSTRs7LFZJcPE2xFSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460022; c=relaxed/simple;
	bh=kyzw2pH+VqkjszrenFOZLwTMsFd+ulYHLHoNklEOK1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jj2tnEEtFrjm+YDyHps/NWy3TjpXVSLuLxf5pHMB6e1BKAXmxIay559UYFbQRVwCGrlJRl8ZWWJh7zHwLPgLwJ6dCOTagSFpN5W3l4kD0knTZDz3AYKb6DLL7NPJ7hN2TnwLPBMaV8S2bMPAotOH3Eurvkt5RJXpf8SSMmZ82Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYKEnq8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hN1OJFs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYKEnq8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hN1OJFs4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z8do2892414
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=; b=MYKEnq8qsSb8jyZ/
	m+RIQGaG5uRKIpXF0XBkYCtDdI5EWTacZYfR3arU74fXrfPwFgHlVkOeUwl3Vu7s
	A2V3+qmSpk2IfSOocU7I0fWXbgo+7kh0EdpDVXRWvaB6QcZq1DXGtOvlwmUFh64Y
	bM+aNgIqFAFyQIsIr+G7odSOrO2V9/t+4RLgSEDizU4+hozmN1yNH5mb0tM0ZOYI
	ntaYP5ZjtAdZclyhFXo4JAv8v/fjL/EW065z7owamN35XSIqErGi9HZ4xtlJsJsg
	N2WVIccXKEZwWsSCkdbsHxlazBKDEwItlWD/8aK4h1Z7QnAjmbAN9Jkk72vWOsGY
	H4CPew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kvg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:13:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f4002c1aso60691385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789460019; x=1790064819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=hN1OJFs4kvRZu+To7wGSCK6Rpe7LX29htP+33iII6GuW/eaOwEu2nd6x9WWvTbTGkf
         G+p//enxCF5Au4ukjzHpQVNTEXXOKAngj4d0ZYbaPjz/kcV1hPfUqACQOjGg2X++4FaN
         er8SNGLaJNHTbGFCrRq0J0IIAS7hrOJzT2+HaksWtKf/MUBiAjfLntFiFgTXeyhYWtOc
         ezlYYUc5D6Qfm1SjdJOAHFk4P2WKzZuipAuTntcdoGTWfrCAkOqyeQtlVKVFMYRtXuaK
         s6C94j+L3Gms5hA86ZqOjghx19gUas3geOka07yWaRqwyb6uYO9JKjSfNj62r3A7SBeg
         Bk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460019; x=1790064819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=S1k6hveU8qzNT1LJE98xJBdyeMLGcosFR3bSXd2PRwjZ/h11YooRY1BgGYga5FsZrg
         y4U9DyN6mjZBm/PbNxojDx0WQbDC+l70wETH+hs6rdOd19j+cwZLBZhqRV6h31eW/wgb
         TINc95KY0WmFO7rr3fUUsSQS6KhG3N9uQ0nEB8obVr4XrfamhGmpAldMIqUkSlo2Umys
         q5CFti9EEfxzWbqlHuigEWhH/jj6CAjxvvXVmk1/FSXM3Kv09QBLByA30oyEjqikDDcs
         JEpqwJs8HbHEqPog4mkJtSRMoghNeESIEXDDimWSLi8PvYzbQ6LxCofAoKb/d64eyLTp
         DwwA==
X-Forwarded-Encrypted: i=1; AKwUvBxh+aSe5ElpF948BbmUqKtGFKQishG3fYyV+Tk2Xi80LiY9BMr24UoR7E0q76zyUA+IsZTy58V6/vOBSjs=@vger.kernel.org
X-Gm-Message-State: AFuF++ndkG8C3itMXnwaBcCOo1ax//J9wWrl7uwwkGXAXCWnfswNTosX
	mJX5E+qlpJw6duX7FsaXEqSbAoPK1xq18xuddiDSzzz8dTG1w8eoXhEl6GF9kS6KqEz/GmtmCxz
	8LzlH5q8cb8739JpMhsIZ1mXaSyfKF4pUbx56zJy2q4Vg4lyW/4At1QtaOQ4RtO6+9RU=
X-Gm-Gg: AYBFou2RQRP7vfjMlxcbjRfOuqmXvA1T7oRF/TkxFr/3bXcdW1ab25TR2N4HXVbRSjG
	p6UfbCaY2ng7E1blB2FsD1Jm2fjU3BzD3LVnsXDFojYj+RyzJUwiX8kuJaAokAkuxqclxxX1T9X
	Wz0h5LxnmDN6KZAjDdvLBP34KaKYH3DnlasmJaa6ndfK7axuhuDRHkxj09MQZ5V86MFZ8DsP5Kk
	rvYDjvuRUmW9J6xuXL8GuIGUSCG5+YfZEC6HQQxct6uKm2aWAgq4DyE+IwpDQUNS8vIALAW38la
	xrpq9YK5ychmWmXm5AGBSZUB4mAQ39u3ikf1UO4Zzdb65apgmuHTH31foOemhtulzeYvlfKRMMh
	akgDgcrPUTENJdEjKjT+MSQ==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754972485a.5.1789460019671;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754970385a.5.1789460019294;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b76sm38701966b.29.2026.09.15.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:13:38 -0700 (PDT)
Message-ID: <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NBXqjiiwSU9OaokzK49xa6t0XUAW2eNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXzaSXJjIXsZMw
 8SgS4xOvqHy+a2LdtlBECxfqb1ttM7mm7UzkxHrsT4kILwjgvOCaRAXjXFp1ZzVMxRNcCQ5NWzB
 FTO2OWv7G+2acPlu6SlfigTqcHGHjIqzTjbUgb1LZvpg5+w4OPyNZjOd1x0Ls2FH6zuXi0rfuql
 en7Wh4TTBiLDMh+ilKGvrKgYyr4n1BHr8B1Icimh/oWy0+dD10rxjp5vynswMKou658rMaQFjlB
 hW5ybB0idsPJN5iLy1PehDF4/2XxH8ledvDWyPksBeWv/Yw3WfSbbx7lcs2aqpJi2T3exK4U5YX
 Y/YslFfC7uNKOM4eJwTWLyyPc1kxO0PxiHpXFPFvA7sVnW/2g/WAkFywt/SDb368RQrHpOXg6zA
 8z37vSnFbqwIk+OxKzf1jRhRDKPolf8kWVpZZfp5BspCEYmz/EW4HtsyR77m7lR1qclHx8OKGr8
 S8VmL174FFsWC+IlHHw==
X-Proofpoint-GUID: NBXqjiiwSU9OaokzK49xa6t0XUAW2eNL
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8fe34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eAciQRwPYnktzpsGUZ4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX7JwTbVyy4q/t
 JJyKLG8jgIR0tVvaAkXwJ9P5/U/uMlVdpfug7LgvOUiQimRJ+UGRCk6+GyHvujG1L/xVpDEWeqS
 1WhdW3EM7hYcizuRz8kER4uCKEgx7CE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

On 9/15/26 10:02 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
> constant. This documents the selected RPMh power domain and avoids using
> a magic value.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

MSS is the modem power supply, this should be CX

Konrad
