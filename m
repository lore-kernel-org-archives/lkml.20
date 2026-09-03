Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA431E848
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427423; cv=none; b=GcZFQBHRpDWzyAnM8/1u5/T2mmHEe8UAamV9XVZ1frXlXTfD7q+Oao6SbGJYidrtoO8/QHHHDRge8fFyrWbaWka6sMw8CMyauvbggdaakwig7aQ7XctFdqcJ5IDTtlH3GS978cA2XlV4GvFtAJKEBxWO3LCv3edHn0avZn4Ik0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427423; c=relaxed/simple;
	bh=jPGxyZaN47OWHEnJ1Qeo4cbJKb/i6RtVzZlvRGOu2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAZXVhxfR/SDHm1ayPrhyNu1LyaT729dXVXt9srek6+3mH0XsdlWD6EA76ZMJRjlfs0e2SwwyDYBxQ1m27++hWDFJ17x71/sWoDbANKsncNlP7UDWJ0W6sp9VwJVHWe42+FcOiMWB03mhdaMfLZOSh8h0gohwvGZqB12b9Sm3+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUGke+/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaDuYsw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUGke+/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaDuYsw4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683921de3682315
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=; b=NUGke+/cmxlgZYfR
	sbe3UJhvHNCcNDelA+O9xetBiJm49p6v5XyUbQC9/7rI2QEL61gIu6euxFT05QPX
	jN4vxsrGjE9Xjbe2Qo0BWZmLyD0K3Jw+AzSL/Hu+jLP49dby8AWbxZ5AmMMAPq0Y
	QI2kpZ5YuNvzeTF0o22cPxkjVOWeA9ar1sBDbGH8vfgy8VoaY/LUbbBLKjW5Mdvc
	LZgB4QRZboSIsuP0Tj7AP2nKfQlLBqg8kFe5P17r16QAF+NKxaBppc9Qofa8pq6W
	/oCuTribxfqoCqE+mUnzUiMpto05INmZAmxGLOj82zIzQktmnYHpvKTwIDF4aV83
	PhggGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0b37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:23:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso46361585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427408; x=1789032208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=NaDuYsw4Pt7tb1+ekRIfRZHbbkOf/24kw34ENnOI+zaN9L2xkJk1902qNWvCkwXyFO
         G/r1MRuh7MUv/PU3dpcbwX0s40aZUNTyWc/NB8sO0rEJyt0iUDC9VC2pVwpstFD2xZvE
         H5h/2WPC5B0S9TLmFXz7Py+XWxUQdUTnQ2xmAJ0nhkZjRoVrfKcz86uyqb2WNfC9H9s9
         0jjfVdIWH59EYdvU28lK78nUQUmGbBLUXCCXxbWNFaoHRN65JolOLI88t5PejhBqCE8I
         0Qf8LApYqgsVFKCK45XeBBRK5c7AR3fQgKJSTOcKjg1gbsO3z+y1M+hPyWFk8LdP8OmT
         bnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427408; x=1789032208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+WhN6t5YMVHt+2IsTxJpVEHgtlM1K+u7N828IZhaaY=;
        b=ErLMKVRcfxClvZP72pFpjE8tJHq+6OkpXqqEoYwCIOx+niydI9vRhGrBDYtAiys4IA
         qqIA9MxVkGOICRyTR2U4s2hUOZc67k7/ncepFEC8bcBXbd3nc3gp00T0carrWnY9gUqT
         jHQdtbu/YXBuekAJadDF8XHGgdA0d96YjwF6PzMsuAm98UIcmxjJwh608zZJpCGyiwZJ
         OP+/FQU1UJk6SQl8JzvSlsPvSpMOs7WOAG+1YbGNK1th0Q8hqYUcnO4h6ARmeYtGqiAh
         C57jU6b9i9Nq40SvUntToeog+BiDFJ4b5BfydVO8nw8uefztlXOF4zfNWVK7537sqYc4
         nVLA==
X-Forwarded-Encrypted: i=1; AKwUvBxZxZNodRUr+vrKwQc4RxiBRUkV3kTZpCkOp7dr3+V1acP7v4ArLnSW4zmmRTyfLCERumSKI8lUJe8RmBg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9CwP7eZ8Y3amjWU8xsKx5350uMYYUUWEtGh8KPfKQemtT9PDe
	Wf2lGpOdeA3oCwUxrjfdJbOFvjPtyfvs+uMq8KrOzUNosj8uffN1TT1bSxdRZLueekamJEH7QmO
	u6DmVZ09MxTJlAxwWFHiTIlJj4fD3dh3WbdWl7Z636imgEzpNeufOi7LMVVHLXmsE3Mw=
X-Gm-Gg: AYBFou1KSnRTr/nRPMbOfYdH+/t8+w+5uYPaLZdhSDQ6pESazic5cEztuNKv4haET0w
	R1r0qB6W15c9qQy3GSVfYq9Nh6NKZ9XpOw9gSYjoRyxxoqXE9ykhhQ5M1wI9HX/YhA1kgnHBMD/
	6wu9bR3FtOogjL40gZQqjXVT+pWrfKt9eer3gobWcDWvC9HZU1jfDpjEbBQG4CFWUtLsZOXs5ga
	40R3l8ZGYScgt0pzZ3uH5MXBgBDEJ2+zi053NqdhS+wAfqBtuEeDJGc8TQw+IZXah/MwXfOedHN
	8CRpIZvK+g7WX7bD3LwWWyJJBZXMGtXF2suGLePm6cxrawslZT/vLUIKcC1d5avB0fMdsV7QllY
	WYZCRq7PlZZIrX9hg/qgo4g==
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808295485a.4.1788427408615;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-93960fd4f22mr808293285a.4.1788427408155;
        Thu, 03 Sep 2026 02:23:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm70787166b.60.2026.09.03.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:23:27 -0700 (PDT)
Message-ID: <92d30223-26cf-4b92-b7ed-11fbc5bd6d65@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:23:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-3-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QTESyvFxXX5pa4BeNBPMdLW04__n9s53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXy1n0kPUbvmcZ
 cZVqiYpUYD3M/4gI9FsONtXGYbqNhD8YElaTYJLb1UCuubzYvhf+XWDl433xpSLNvB053wLr2uX
 gL1D71GBCELfdouirzjK3Yj1I9nMsZXMFEi53R+MdxGGnF6FY/f9sLqZwW6cn5mdL3S4bUdBujG
 fY4BzSqiE+zkJZoF64VCIebW1hdvY4JBdc6rqoX+vlPsRGJsd/fKoF4wDmTFJW8l8kesH0meahS
 PGhOBSMzpnjuznogFVyJQh1iAn02oAuvGqt5iNQOmyQp1nj4ShaWyZXi8B6BfKcTWBQTZnWoQr/
 FX5pmGeSkEXD6y9GSHd9z0YvF/hjYIY3kBJwOzNiapOaRkvhj5JclTBPWZPp5+rxi9oYyqCft+y
 PXrislfYJWdZyZDfQh40XJYVudb1VYpq0AmNoQi9LZvj4tkb3FYLedQjIoDOFCZmnUC0Ud6FcfS
 aQVkiNqQyFDH1C47Iug==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a993c91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6d4l0p3RcBnI2BkWs0gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX7JDXTcf9ldNY
 qkGMJ3CTKkCGkTBDB/fQLKQ+i11fBuY18Mm2xzeOmaLq4Z3xgeTUmozgtWS36KZC5UgFCSOKUFP
 fBYuJTEr4wNkerEveBagSTQ1m5X02/s=
X-Proofpoint-ORIG-GUID: QTESyvFxXX5pa4BeNBPMdLW04__n9s53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.
> 
> This is based on the support by ROCKNIX, however their history does not
> show who the original author was, so direct attribution cannot be given.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
