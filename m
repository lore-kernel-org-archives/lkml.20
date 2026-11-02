Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623623;
	b=1Jzv7RuVwOjSQ6OTNDUfTiEu9i1c8uXf3mhu7D+YtMsBykFs0fJ8UvkcE2zMokJPU6RC
	 pY6OVPi1HunZBb5Z/C3Deswbzk6A+TU0flG2IXmTHHXTvpZJH/gLFlyYPWf+RhbEROo6F
	 0WhlgjszuFXxdkMo6t7H+guLhAuY5K/oMppXq8Yaw2//OO8P/J/T0a46Hotdq5GPtSIsr
	 vLlYGS775EhAuHHZh6gkovzkdI5ka0eDwFgNX0pJ8VV8KPQG7294dFgtmewgY9QSUu9EI
	 /k/K7Br8MDvBH6cnwSmcru+eLruxt5PGGXVtsQ1N7HMDKy25jI0g1PIKrfGKNEM6Y0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
	b=EQj0WklguMY8OU0SnollPI+xU56+n82epAmy7lkjhVM2LqRoobEF71Aew3jMT4sCpWx9
	 YW1OOmwf4DXHzqGIZ4lbydirmJejZYBrNKwFmdy0kvql2BgVjH5fxPeIsCCjI9QJGNaAB
	 JylmOtf+3JMcmgmejTlQ2I5Y3UOS8lxg/TiG03pcFabVuyRAPrgGOcbCDThYYZFSv41Fj
	 yg3p7ViezQXMVolvZ6tGHxq8f8gBaVBtIkfCGi95KVZLJQ8955D2JPabII1pFejtzhaMH
	 kB81U13smXmwqZx4l1GBvqETPchA0shlchQJ7wKN7JV8BiKdzAkACR+WAqWKaqZQ/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D1F606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D1F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnzmRqkZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao0AYPIH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMsZ1821159
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=; b=cnzmRqkZOtbkKeM/
	GYWcgwpVIqDdqsQp88AO8H61KrXRo08UJjICqFbhm/trFV+hgXGHkRWyeg/heM/u
	5omLInZrkBB7YGGnHVC48MmnlTtGUzI8UeRIqhtsrKuPd558WuUGOhumnXPN68Fu
	4YhF4kRjnpLKlPtHcHquSkGOdRppWlXXYrV/v7+rVGU3JF/d7avydvADMAqQlCJd
	siR7Nn4Z3Hj0odovVhMHC7qlBESugrHOkLF3XFVCjaSL/1b60reim3mKXWoQio8A
	N2IPEv/OI6Za9y7cvY1xiOki9zXqopPJeQhAgghsryaEsFlDusOq/BmIg+6Z6zTd
	DWFJcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hq75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6912701cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623621; x=1794228421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=ao0AYPIHgnPm801+52YtfreEZc8KcuKBrXdt8ArBI8AE0CoGPAkdKmMeqDs1nFkFyo
         XY2YtxiA5ByshLNWOkV3lKNVb+2x/s2S3svtZuT4G8dVLFtxIX5lQSibBrtPYGYqxbbh
         BDR0yO5gpwu6MbR+gN73f3VolaKUXdS1MLdBiMo6JOfvikQ6JC5+5L42lkKXr+zpcInz
         IVpJZDFXw1JzKypXZRuNEymcfNF1oI7QNot2+IN9cEmvoQvHAgwuUPQFPJAgc7WtnJ/v
         OCed/DNyIWu7AI/As0Q6aJbHz/ZMA1wSvuCD0v2opmvrCLoEQP9EjNV2CIcKUX/zLmqs
         exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623621; x=1794228421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcVN0VfboVi6VrY9yl+dHujm6iBJUTIYiZ/2tcPIgp4=;
        b=YR0XNxao5x8dKSskx1uO6Cz9XCThqacd/nzKnBgyjjWt4V4qgXwnx3u64RskojdoSP
         QHE3jKuh/8glrlVBwLsBF6cEXktMOPAABLT9LZFFuxZjQ5DIHEqe/PNUVyx2I57szeuI
         WoaxW1iVwAn2TCBmY1SX4UIk5QG5EA34N3qf/Ym5uoXvimOizqrDjM6RUXh0OGxYq1ux
         6+PEly5EQiZOEQFBQ01Y2+NY0HU8t0koFb08FX7xEhquqgUGIg/fnMLUAlPDF/dzHdZF
         IxjpZTNXxhr5z82NY8p/LNAN69P/95Uaueecx5ubcBW/xq5YKrmlPuHs1Jlfk/bkD9Fe
         rMdA==
X-Forwarded-Encrypted: i=1; AKwUvByY6qlqfxz3KSOUjiT10WBb6Ti1IfTvyGKGItFKgK2Zd0CuF9FXaZ913IoahdWqvvP38DukuLtaIbVi2NY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP+sP/zFlfxWIxARqY/5IjxkmysX7gkjYDTedqpw0DAbrm09hY
	4BZr1Hn8IWLqQlvSeAluYyJ6aNFZL83TE3sG0Qu+ok02c5rqDwTYWJErZubE/0KQs/YSr3paZQ8
	tkAlBPcJjGKU1kaBMJTbA1sz2jhqzmBdyAjCRqw8nx9muUI+P3w2D4eQdd6JoI9GU7nI=
X-Gm-Gg: AYBFou3hM25Ev/J5mBuhEOUWU7F9BWUkYq5yv2/soN8txF4rk+57fR8iEFPv4osjUpO
	LPwRQyIfSOPYWTkli1f2KRHjWIhAUFSf+R/WKzAi3+suMztPVKLLugRX76+eo3Kx0hdt66Etyi2
	/eX+YixS3hx8sXPMbDyWwED5jC3uN4AvuPNdl6QY0YZVqd+b3/QS1Xwv7MSP7kFeVAcoiGfKG+9
	LAnzm6+koLKPMkQNL07QJqD9ntZA/nnSSUZnuoHoMcK3tzwVlfgLUtsayGGinMka5WbzTMcWizq
	eEwuXZVYvlvdnM1nDyrtbzNMnt2VKF6PaREfqReOuCQjl1ksreUC8d+Ot5fReaBju+kRimCwjj4
	UcHdfRRL6UZglkAkVHflS/LAuE7LpJrQpfT16uBnHQVOHNxbAMK99VeSWAiehevQYIKbYk34=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632534785a.1.1793623620874;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr1632529985a.1.1793623620444;
        Mon, 02 Nov 2026 04:47:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3452213a12.26.2026.11.02.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:46:59 -0800 (PST)
Message-ID: <30265695-c3a7-4440-a0ff-7fd80fc721e3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:46:55 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9k4vL6KmKja11CjHHKZsX1FJKFRVLPOt
X-Proofpoint-GUID: 9k4vL6KmKja11CjHHKZsX1FJKFRVLPOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX+A5cxk2HsP4C
 tZyrqAvKec6UdW+V6mwVZirrGbj8RceS+d0hQvJnPCzuZ0ZH/ZGH9MN2f/6K/0wqGB++H8baRGS
 baZjKo0Ey4xzdOmNW0nl/GhjqdpRVT8=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae88645 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqUuZ-GaD-BuahIUHWQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX5PqpknFBzDuj
 iGz2CfjhB5UNqyd0V5DCX+0jslnG1VR9vwUxTNO9QQYQViaieulBS8ltWXTbxjLsSDKR28uQmNj
 /s39fqAYkcTVoZ4RvMsXwq2IuFYRASGFarKWQ2Supm/z/DWv69gESSDFY6bl5VYw1gPWUNIWBqB
 8HEDraVvteVwbAEtDtmS3K6ywzy5mlUaZ7oXiR4AYeYZQxuSxFM8bf9eUYg14/S4bkFCALXLI5T
 VxlUof4wNDLBxIxa1mOQkR/tyKpKw/X+2cumeEweEE/1HWUzwTEJC3KFc3NSRHbc8xrcLcHHbq7
 X2/VNBnEAa6/1fg5HGSFlMGdifzsrtVzrJWyexk+JvdZcBIstq/pNLz0qDFgWPis5wytVW8GkT1
 a17souAuP9Lt88NI/SLoNVMtMASs0qia5hBqQbxwWDjmdeqn+tQ7pXl6ar0vHRM6YK9mBErSFVS
 WWW7N7VxOE+poSOh9rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 3:41 PM, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
