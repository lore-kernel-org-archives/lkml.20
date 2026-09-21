Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C974582D4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984162; cv=none; b=rfABE9IaIxWGl/fVkJ7EtrizBahOTcDbAILBLlROfcuxM8s03dGk8VzjPcUDnaOeKN6hAZRrt8wWxfgEPZQzGS2n1ffo99B9wI7U+b9xiUTDbO37KJudgV8wGcC4SKB7T5fmOCrgJ0BOfTz3NOHBv0WkGlEJrHxhuquOJ6LsNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984162; c=relaxed/simple;
	bh=RFiZzF2ElB0O7/pZu8dBVKeJi6fv0kAHLxB/68b5kK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7hdmwbMkxuJIyfU14yAbj8Fj4KzaAilzfs90fmuLAewKxr3pYdAtyDd5YSpI3HJfui6hGGJwiryB7vIVKbAWnkqTqitSqMtGCibTPePAWLXwZ7eGCe3+5/3UfbgTswNp8mQenpgctZJ1tgo3UDjnZcH7TxUfLyeA0BoSZLihTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+x153h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYTapqGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+x153h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYTapqGf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7Ajec371688
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=; b=n+x153h5p7YMtISI
	ngKfcrj2YibnqTzb3BTzUHRWdRrhdAAMcYciV5hIicV3VSw6+DiH1tzreYD5behH
	zuDtvReAkXNMvDL8QaprF9Nup8hZUYrzXBqPh9IfZgWa7ifywhxEQ0fEoXm2MfWy
	EYdkWICJpUUWfVFdGrslJay1wngk4Dhbmbr88piHgWQcJCvdPnGi/H2/xg3hxFkC
	gHCVE0gzwfq1ko1RvWuIeLZ7fYwraHqE6TEABt6hgD2ZgbraoFuHhUbh4TgaP/3c
	A65h8DNI4xS6Xnix64+r/MmJ1Pbzyi4ggIpS+VjogV8ffMu6dd3XmaAbMH7Avq3Y
	1wU2Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h6rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so57578085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984158; x=1790588958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=FYTapqGfNawKXB00fDDa8Bckx3mrl23e1voc3nnZMeg1so7h6Z3ZMIqosAhp+ea5GL
         pEU07jjBLL+joOAMeNdMzbpFQNph2Jb2WzFQXG5qqzOF/TqbLZIcKOPXHbFDr5It+pb8
         pc6VyeEj9wRyz9/TbPT0ZmHrNFrOtfxl1rWhCmvQlbIBL21GIt2Hqq79lMrqsyeOJnmr
         +LZLOou6iWxi/gAf8XMTkK3MKa778951lZ4OaLsJTXFZxlLcqaG1qZsqQ5nYojqJuv9L
         4YkzZnclRHCbcJnaPqCXtVwjH1cz0QOYIDmDpnTe7khuehPFvjoun+xD4bRancTllplo
         lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984158; x=1790588958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=rpBAkoD6M6XwZGJaRoyDSqeohmhysvA5ws6j0ja2XPSZTUr8NJ2Xyw4IV9MlDDwgHA
         p4+zCuZQqfIWP+d9P4JRRkUNAfk5yudAEtAHU1ZBhELW6/vnxQRkPCeHMef0ZXW2TWD8
         vKM7wRQyCRapIB92VzSbO196A7yrBWjCACPQsc+u38KO673tVv+bEtYQzEM3ccFFSgT8
         s/aJe74n64/y6t0r26+aXGidovpfQjg0RSex987l5W/KITutn2SSA3M2aqtV7cLn4RJ/
         U1VmEQ6+12xPzZ5ObDWvIBjniotu6qSvnviGe6LTiHYuBS+mcufi6F8zWCxqaZwoPzuO
         hMEA==
X-Forwarded-Encrypted: i=1; AKwUvBzABSrYcPiANMj9pj5zhZNYMaRT8FA2PxiQe8RCzh8Z8Yp8VGgx2hEZVWp1fMAxl9OAM2kGkDOm+Hrlzdk=@vger.kernel.org
X-Gm-Message-State: AFuF++lHkfisM7LgnTVNIhxxoI7wqCH5J5uwyXjvsDhsISt4N85NeopD
	Jvt/ejbk29e/ZxrfhFZexgQOEk/Eoy2yqIjXv8cXKkRarwIhqHuq2UpsGoq3OX2l1iJhUW4zCg3
	6EjZC0mXcmVNXNT0zIBpIci+rTqSzh7ZcwCBvVWnY331OuNjzxFCApZy6ObzwCKtQa2w=
X-Gm-Gg: AYBFou3slWBZXWq1R8k/3Rz/VieyxjCI83miJa6WaNz4dyhC5E30hHXe8BeaiXzF/Y3
	HBu+eRPA/ghIiEJDD7Nz5kxVZcKZKhluYJcQHl1xJoq5bFHrB7CzYD/GIBoT1+6yOiMoFyNCMc9
	VYwVxNHc6CJQwB4uHSfc3tEFsvUKDuNbJU/4cazOX73uGP7+gjGbxsu2aKQRuZbBJDNY3EVsTle
	f6P0hdJT8znadpI2kJZdpGPgdNezRqsxqtY8u/Jovpxi9mLbBD+T54MEfm9U+u/FceWUcqlcEOR
	vErnSEo0YKmhbCo7drWXJ7u/qt/iGm1dhgoqLAm+Jn0eWG8vbehLLYVOdZKY3f4I3H7LhYQmwfh
	7vNZF1en/lkbH6PuvccvAZw==
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895927385a.5.1789984158619;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895924785a.5.1789984158287;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eb33bsm288228466b.15.2026.09.21.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:49:17 -0700 (PDT)
Message-ID: <36fab4e6-ca34-49a9-a8ec-d2a6607171c4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0fd9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22wPqFrHPIZlpLYNf30A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: lQ0CbYl-tf0qLRbmRD-8mvPRi4x5lpzL
X-Proofpoint-ORIG-GUID: lQ0CbYl-tf0qLRbmRD-8mvPRi4x5lpzL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX+zzgrnflhNiw
 pAyRpan8SprncAuhcPTV+UbNz2+Po4ln2nDJEdSJ4YevXEMrGGeAvfAJcD8ErsPv7xEArnMRByR
 owEnORV2mEXnBJHlo+rZkaVA0T6UBbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXyv4o2Nw7XrhW
 Cl27dnONRc/tyAW3aFHDYlKc0nhcmOxCfLR3bbLAVGSMmhLoFxURvIlyDtMey4au4MUUioOQlWm
 K6taIoxj2B6pKTlsaehXHzq82mh9seLwl8Wwt1dqoSFKnsCymOfldI6zRTVxn+s0Jb2dRbdlSX5
 jgueYdDWKClIbaHSxUkWmEQdHFAV3LnvgR+4HcsbiuuV0hZFAo8NDP7VAVnuA2eqJv9YIdXLbh1
 MDgSUmlDSIGxFB/QfSYpclOdfcStQ3uunvLd8q7yQeEfCBXnD2m6hpkJB+fYQ1KywyG8I9YX9sW
 kBzxvZMkGU+HkTtPWRe307z+PxSAVKLLhUSoQ7AjSiohWJW1lV0RcW6eE5K8VJy8b15RsYj2bpM
 D6qkKXLF4b97kILEWVWA0MNN4GVzL81GuOrqcqKV+hUTJRlaOaaLCm+g5B2z3dJaXZ1YIu87NC6
 NwiH/fXHU1sCkzJt2Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210141

On 9/15/26 10:44 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_CX binding
> constant, which is the correct power domain in this case.
> 
> Fixes: 876644c76034 ("arm64: dts: qcom: sm8150: Add support for SDC2")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
