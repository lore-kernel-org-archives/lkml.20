Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587415;
	b=oAny7ScQMtekwGpQ+TdVDgodPTmpon2Yjd9kNmmQAPNH8fCccbBBFKFxla+wXEU5h9AJ
	 ZyfgFcOKEvCzXYN0upw8kjHnvjvrnmdTgkyDg+qaH1IcNAV8rSxvQsJjimGvcw3kYHXxB
	 JX3BcPrIOE6vzgJ8zQjScqHN7z8SvdZ9yib474D+FiJvADkjN/hyvwrkrHBkqLpjUtL8v
	 5die3QuZ0GwILO/7owjkqrbgEUnChBhmCwZFNTBLjnCJT1PPAu7cOlN0uHxrtTMyAUmiu
	 xdo25LzCNQljXVf8gjkgVdcKKfclDcDBrOHoZ6bSmNjcFt00ZXTLw2mCowlOrPVzH4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
	b=nfvRMw4icEqdgrWWDmycjOad9wkZK/fffWSGS1oSstmoa5PDcGWYfQ6b9cwgd52Cd84P
	 hN+OG9PfDHG86dAQehD1QpHqDryeW/O+CidK+BihpkEvqcGRBmAIJmdwHCGtftVVJxD5d
	 LjNonyx4rn3ogQiaSgHdVdpdh9dT+3LR/88SiPUr5Xuo3dF0JJ3OY1VxRRzl7njNCczLc
	 /hXVfRsraBO+Du2AfaUP7oHp09t0ODd8jB6PPhX8pk8EcqqpI+I+Dxh9eZnGMd7sfkuBl
	 RU7TfNJQo+dccUG76cNrhumlLmGswpmt1DxwsTi6wTSUmeySuwyBDbrqbC6OFBcetwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq1MaR9S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817DA606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnH0X1v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq1MaR9S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgLpO4168133
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=; b=CFnH0X1vYTNqj+Dr
	tnTyG31yDCu5C2kNe8tE3NzeAcDgYOHqtYGUh+P5odDF+jUSuP2IYlcfYQvpCmJD
	Pazu1aTtkDWG+1z9JdTWaiNI0S8sodgXqoq4fbNpcyVy62LJPWB/MZTJctCWBoWi
	M7cj5PFPS0xXqpAVT+pI6EYr7huerP4XY5yq+71EA6Tv8I2zXUdhlbibPZ+DatQe
	si8+lgieUNfr725H54kh7LV3GwxZz0B9seWVYhftGLGA1LNsO7rMgg/1bKR+UZRo
	J0KC7cv2YLEiJY0c504iMSd0oATmOTeZJmBKZizsxqR57QBp1mkdeAnIPWSAeom+
	tWnvWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kxr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:56:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso7119685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587412; x=1793192212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=Xq1MaR9SsNT1w5grT45+tEpoPZJ29Y3nwNAmlSE/R/ykfcfWgqv6Ek9YBUVLJGp84R
         83vqLARubbS5Ln9ELNkJRxQZNKcivCFtPOE0FiWhKHSm84qeen7B7H0hU4c6IF7y55DP
         2/q/1cU6j9AH68H3jyhXSGjiBbTaVIrA7lLLwAvwiCdsI7iOChl9ph9B5FnGBBqW+2ig
         DSs9T5pBsWsb0+25J8J9KetsL7vGm3OeyIkSc5T0LDdvrK0i9vC3OW6RFaxo0k8IiSiU
         maWK9/f9QhDjb+31qhLNSWGd5qonmtb5NJdACkj7HKXshkN/RkCg0ckM4m7M1zHCXi0v
         8hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587412; x=1793192212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N2TaHMWI8j5xcPeZMdsXt0buMI8vI6KwHU5sNRNuKI=;
        b=2DrKVU9tzWhilDdbFP2CCvWMDdb7+qnjjqLtDCtXLWttl9JYTV6qkOlwq+0Bg8UZTQ
         Zr9Jj2mxFQqHSoQGwVKC1ye9Mk954tW+pUIatfWXex3Z6RX3v4eZeJZmheTv/uql+Lav
         067SMqevoazNMYsHwmN+hNeuNSOP8hPXgetOIzSDAwl3l2wePWyH9gKpoy0zj7BWArC/
         Dw586KLF4gVHksTZpcjqyrvY5mFb2luG1+8JmkbrAfOydUKK5HslpJxWseUomACAGFDY
         kJNCbccMjs27k15YCnjxv6nET1zb4v/8EPWLLK4uVaK6Do6U+JNBfPxLebq7N+SVyryx
         UHjA==
X-Forwarded-Encrypted: i=1; AKwUvBwNqRQPtFhnG/SlgCv3B8J92bAGhWmOftXyIH2dnDdffapqV/JJx4jM/HIH3QwnO+kLkag6XVS6N0MDIi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzwOb/3M7JSjYfgopcXhx+kiDk0wZW7m8llETM7zkn8tI4aN0
	mr7AlaQ30KyGTKqAbkVjtiE2iePt+a6aydDuwBEOCb0p3hV/JHFaTGlWkTOzDvXAWgLk90AuHm/
	bVSLOW98Ax2umF7UGNBXOEaV25F7Eho75eCB2AO6DmFQ6a0grMwBTjy8MH4WDCFNdOj0=
X-Gm-Gg: AYBFou3gPLnmm972+IJQNb0/x4kY9epg+hCjWsq3+HM/caxPTg6caXBmxiay/1WCKMV
	jVHO4IvhX4fhDa8qd2onAMO5SlT9ozttcFWfHRY2Eo5AC3a1aFt/vXYCi/HD/mQst7dvjvvRsoV
	1gWYwdHu3qmJ+xlE4kEqsbiQwvmfrS6zyavt5gZrGHM8GOtwnhhtDt4EedFr9BX27spqujLv0za
	lyHt4fztjLSKeWypUr2xpRXBAMc65GRBS1Gw0VS23clZKgqXytuBhYt2j15WWk5Dr4kwbddyKv7
	Zg/86CunYXi7zNo3R3HFL92wCFMfDrzjZ5kNt3+QN97OIwD857pjIzZIrVIBeoFJ7gA5z2DY9sa
	Vda5CQ6ev5R8eUhIc4muYGg==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480105185a.0.1792587412627;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr480100485a.0.1792587412035;
        Wed, 21 Oct 2026 05:56:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe6f4asm75163166b.65.2026.10.21.05.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:56:51 -0700 (PDT)
Message-ID: <9e902800-8c51-44bd-bec8-5cfbcceae64b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:56:49 +0200
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
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention
 explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX+G0Q0+EW5Ruy
 vsFTNMomVlOhhmorbzOKIHVDcTZ2lAOy5ZRyEDFBi59F8F0xNy6eMO9pE8fpIA+F5Koh3/SHO5p
 Crt2NiaX7+eq+0W7lH6pUcIL2SEOfizk+w7bePGvumng8lnyTayvYW7aJd1CjtvrEzT4GZFaUKF
 KTikPYDK9Pbqskk0Q3RIqSR8ICrBbO0hsVPB7NyapiyG3pmsmlR8Z7b0LKHy+xC4tl8wADP2J1S
 1NJO46yx5GFhYxEIPt6HGxF5AXJkS7L8iAfI1DjfodhW5t6B7FtNAz1bt0IPGi6j5NH0BXHdCpa
 azThWRMeANfG1cXklps57aOtFYsJfBf0iw5jMhZkIfLkPlFaXf0ozcbFoup83XDcdImyJvgdS8Z
 HfJkTF/CGfEBP+uqbdRJwPdqhZNoZmhUuGwycaDSYRX9ZAlC/KgaiwoNgeAsz+V2XJZ2S7YGixI
 mYpGfcMq2i+hR+pVOfQ==
X-Proofpoint-ORIG-GUID: -I9WUjrsStNodXWsv9E20o3TF89L57BI
X-Proofpoint-GUID: -I9WUjrsStNodXWsv9E20o3TF89L57BI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX59sy0CTmctdA
 hdYyG1vjXDWYOO84G6VRkUBGuRln0EtN4xfwGPLZH0WtRT7/efsUCoE+63Usry5HAI92j72xIGV
 M26Vh+kaeDqR5yQF0sVAVTj0DxvrIsE=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8b695 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oFv1cWL6vE1NE88U30gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210051

On 9/25/26 6:52 PM, Mukesh Ojha wrote:
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
> 
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This applies
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
