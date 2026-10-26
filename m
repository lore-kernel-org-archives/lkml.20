Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015949;
	b=325T6uwNTFOSjmRdelTaGt/GRiJqbw9qLK7FND73D+PZpUDbJFG59H/JGO01oT4FYpbx
	 bDZvL2A5e6hNOOkh+xUnJO4Ml/ABC4tO2CWo/zXaePqy1F4gG0RYZNb5ayHpdE29inXug
	 78bQteCvXCeMNcuXlU2k7FzaBmb6Bf2yJWdHg4/7/pzmUeq48q0UC/ZArZYEKZU+Bug2l
	 anmnJA3CocbnT45GTuWpdAfZgIkhvqrNdbPiFAp6npBO5oBxdgtlPoChsFjb2sHq8Eb2m
	 g9TQn+759X0YVlRjms6CGuvlKfJsvbJQiFzmT9j+vxFJHEaH3yUUaAEnBBqrQ7Nut2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
	b=Aa4buX3dPsd9vt2RjSBEj9Qq+iwRuMbUEJ3MD/NS/EdgYZ1aRZMG18BtsVnFH3WWr+qb
	 5+jTVpCm2sM7zdb20fTJMXZlasS7mUb//ZuRS32x0a6o+PKwoXS7wWtsSHhYfp8ZtMFV5
	 TBQ99B0LLH1IawchCydqJyCEzvP2Jjf1Qks2yJuaf4iDq32fAV22WIbXhPsbO1Kd1EKqi
	 w7Epga9jq46zi9ixZt3U+loO2Md8maCnd3B2XDW15qg4eY9H83Jndd5MT76ScSwVZl2CT
	 Eht8UU/suLfSw6o3ScBRxXGgNlw2fTXztgaiSdjD03jCSNbRI3tAzFRwzl8O7hbS5Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLLvVPar;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2UIo95c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D805606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D805606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLLvVPar;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2UIo95c
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAswQ73033791
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=; b=DLLvVParQf6/HTmo
	xMkJAaRYx/CNErg3qP5d373mfmkRMlG66TUm7dlT8HzFBnWBcTukab/whPunc1lA
	K0rVIjvllc85JiD1ZVo+TuCsCBUTtwtEdBM9GggqIJq0ujL2InfRQzN7LFO0qEa9
	8Ezy6s6QNxkgyn+hrW/ZH/jry7Qb/4fqMICpV8/EbF7XtpDMbbeEayFc6N3a6/PW
	e2A2nqFoTBOHdTW2cLXfE80Q8+SKh5pRhBkViLKswYyMKihZUhtwyqRirCnfIl7s
	voy8liL+X5m7hHXxY9k6lYNGdMGklZqe+9F+xpUL9B40C3+Ttwc1Vk3bebjBfuQe
	t5E1iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y08wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so31815185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015946; x=1793620746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
        b=f2UIo95cr8WCBxV4Nxt1/O7LnBls+f7NXgETkmWDCjDlwoKgHGpeJO8vg9++u0L/0S
         VWbcxJxr5SxdxW5TWcwvJ93tnUL+pSaAj4CTvVnxKwvqETc9u4mZLZLLmpzY1TqVkStk
         ylIVUswJLCqe3m5xWgA4CH1aWVm9xX/3EJ4r9iYI5i/AnF7HqxvCaXO1Z5trwSX63mGy
         0F5K4gzDSpExgqyoUUaxO9yKs7fqcQ0GSDEoSwBF7d0HwCIn9ySPk7ohgd9ScLpbH9/o
         XgBB0esC0Fv4T4xev8v1GLAhXMRHwL02UVAnZkCLlKCO31iS3zQbnBluBpsohfV8StnC
         2WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015946; x=1793620746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
        b=oTK/L7ktDklbh9XpBToFYJ+RPlBXR30vgkdaEkEZISZ29FMPSpLGQIlZd4zHiQZq5k
         r0g9Z/vrbffmzC4sSUPkh1SJ2R6OvBrZQyeqY6Y23Nxhfyq9yrZ5lQl93pJbVEVzyLsK
         muKvDSEfbDIlF1fxim2zvWBNSNO8b7dfDaxICtzrjm633J3KtCEnbblJxw9NvEXN9HrW
         QCrAQwFay/XUaCuHaxB9eO8O33BURc5+Uil2oS3ikFrtHxPFIP8CpDfLy1ckSGa50A+2
         AVsTQOUnutnc/sHV5i9rqk4g+2v9EKsVGCumclNHjopuFiro/pkHXuSMHU4dtjbVzA1u
         1gbg==
X-Forwarded-Encrypted: i=1; AKwUvBy2XemfU9CwRwf7/DiRG8SZFU9lKj0hJenOIjjhjUXMHoOZX/ZLFJPMZ5jcKyuqIiY5oWir0zN2bC2jNVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+dQTiYaEAkU+i3BSfN54dMzHUJADJC9wYnMKiyWP4c4OJUtUB
	/+eSr+rCGlcu5FvMKfq3vogu2uxnNcwQfclMBeH/c1mCahjeKXCD/MOkCRYd4VdXn8tcEQuqc1e
	HVKiac6ysSwTk8I5hWl5fyTYFs0fevjKcJl+uY1sN7Q/A0wGSkIwg9gVH3ppRgAY4SNwj/Bun5p
	M=
X-Gm-Gg: AYBFou03uvxqTsvILKq9wasQJfTPUZCEHo04AF5wHruGmCzak9TguSRl/+NyM2n4spW
	nzp+AIiwRVKPB2udDV4iUd31tyIIj1D8Jd1THqUIHbk8KwTjcTOZpbP8tVR8aoQC1GHiyjECvWj
	FARS6srvBxnIGn50YdN9K53QBVvdkfDfE6ufgpOG85GuIzuThcyx2P9ccG9wbslTjRJrR/3cDNZ
	N0Z8LN3XZz5MQWOYcc5LczjOktqIxNoMrwvTaPDGqZuvb4oJ4ZdLWe8sYjRDZJWsMhgm9sneG2W
	w+m4jzn5fCyuDU5TEjX8uXe7IkwB0894AKwleWrfMtTdL5y2S8ZdQpak0goRpG5vV/zUqFkEFvI
	S4LTwBZwpOv5qVLg5IRofaA==
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-940ef951f4dmr1003735085a.6.1793015946257;
        Mon, 26 Oct 2026 04:59:06 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-940ef951f4dmr1003732885a.6.1793015945868;
        Mon, 26 Oct 2026 04:59:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm310666466b.40.2026.10.26.04.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:59:04 -0700 (PDT)
Message-ID: <f0bd8179-f211-4d2e-bb0f-a419744de2ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:59:03 +0100
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX8uTsGy3kHfDK
 /Z4+kCTcDNNt4wA5Y1bSDQPyYgpDWNSe+PyYY9cFqHo1g7ELIqCIQi6TXAjdCo9ynHtDNuF6tPY
 9abMdjfJgmS+u3bKrHqAHgwd+q3gQFI=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf408a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=khcIRSTurGpjo1Y0ADwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfXw/YWMsuLPeJr
 D5k7cJdOhM++9IfF0AQb8BSVuBtYuMfHOGa1k0pxwLQe34s3rgTExnvqfBV0gRjHaA3UEjcu2Q9
 f6dd5OAut1Msdtl0IeGFrIuSHAuu4BLL6g+thoZNF5Ddsw8gwfV3E1Ks+iV+HdqNoS9komCnkmK
 bHg21lIaunki0LkOsr4QKj/hG7RmSf5Pt6HUsIf9C87W9InICmqxMDqmEwSfLjHO2756tuwApPx
 mEQDdjA7deokMjLGhNMsA7SKlKbX4P5CBufy688IDZAhV4aKVundkwlP/PmSxQBTSK5E9tr1c60
 39MAUV3gMYg/UvIJcc9ACCV7ePMwMbtwuRnRh73pLvNshTfxtXeo3SkPV+y9YcOacqzKi6+2xGK
 boSoytILAKJvQKGxttvsipJx8V3xYP1FtZF0mSQaecpRozFGjDg/0bOGUUuptRnIlckzYryhGNe
 mB6fPspUsv4DidJiecQ==
X-Proofpoint-GUID: Zceqiec7o57DzkugxgqxRHnLaPey3lbq
X-Proofpoint-ORIG-GUID: Zceqiec7o57DzkugxgqxRHnLaPey3lbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sc8280xp device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
