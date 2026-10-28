Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193085;
	b=sjKVDCwrn2n8DROBXpOBW7/mlXWy1fI6VWCSAlwHixjYOssrWDS4VCzxQ5OV6CDzkNlT
	 hTEHmMpa17qOf8A8eYNKOFXqAi3rkDJ4jXSm57R65cjzuSSF4fRUWT49WjKZ/P9aSiKDq
	 XSmYwcpWdUkByzuxz3F7109VaSRpzct7G2i1SxBr9ZbfhXxCZ4eee+4XeTHkGnQaYx5ZD
	 L8IxGjAWIv0HYMU51PLUVRVhEPnu2/v5nX7VO5qwXWdFMgcUD+KyzZvTkSlEQPde1ptMr
	 wradpBQqCiy/Mbb2pi1MXV5/VgfWpTWrdVH5fL2Lhp7r6h9FnN76dw8Xcph37A8q/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
	b=Nvcajcwumem7mQE44KeyL7cuj4umQRxHB1Sdrk5uJhr5z0ur2lCfl44+LF72vWWK94og
	 UJW9hCnl0IlqPjS7d3FpTYn8/2WGPglERTDHmwS8KVr5AjrOezzVQam7Y8/4AwTz3nkkn
	 qRBTjogz90WShzqkktUiau+tDU9DnWP7twPJlxwb7ISDq4cuYsyhZQ33QVYWeahU618Xp
	 YVGVpdcktEXeGKJPp0AMROC/VSwst54J3966UYQccPvJuOi7eDXhAq6NAZ5jNt/TZN0tl
	 6xR89zhcVGl+KaMn2HU6OB2377DqTZTXm05L0dzD76ss5rdmhXbnjiPz0DYt6KKMFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDs/SelQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C53606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C53606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDs/SelQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdv9G2082338
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=; b=A4KU+NdrY5SWcHMH
	AXdRRFZ8KYnGZdgJm/3Ak9itR5CUTDWPK7Q/T5779I1OfCGJoUIQUutrJYU5ChC+
	xGw/OOvy2MtG8ehXdN5ARNhAYnDqxXV5ZgAz2oFacTqj4tGv+98RKqwnCsaPeNwM
	+1dnkwpZ4pa13I4k/BXc2MpknB//bSGRZ28XcVB8pKolM8BlaBm+HD7Z3mNPIGhH
	MA7H7GFMI0/NrJ1uxcMlrKsQsWYm4xajrF8xO9IQC54zpDWm1Gvz8D8mUy3mPsRU
	5Lv97QuJDyCuI3JE0rb2H8EabK0/Vz9mMycAdTKQ3QgsYnAiNKJ21c86UONjMwHr
	4IeOrw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv48w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad898904so51236e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193083; x=1793797883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=JDs/SelQPxnsIF6VYKq/R2bGxs7amcNTNX2a26zG3WU3oGFGe0VUZI/g7OfsYDRKxg
         mdkeMt3IMkpPWZvAcQCmIMAgaZg2E7a8Gxw5Rg/2vCG3z+bQKpK8WerDRaMgwU/FvXzO
         wAWM/SY9oYIiwiH5a76mbPqE4jhHonShuKdxIvZjaCsgPkbmVAvoPqGlBNwgPbAgyXS4
         U/7LfEh3A4iPW9jLG3f5qDD/9gWGoNEnD4KrSJBUKCqllLNjqUvBt0EfINcz/ywgutG9
         4dh6NnJXAD9wp7kkk3KT9LZ718wKq6AVdG6zKdkpxttcZjnf7mKrXqZUYu2lzsQ4dSgC
         lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193083; x=1793797883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=v526FghpXK98uPc0xUQg8ZXD1qviD2sf8qH21Llxgq1MMwt2yOqfk9dxJOVWTj8AJ7
         pc/aO57O1tdREfAdnrC8wF6s6c2hB8q7vbMLJWNKpa2IFyeB4zMVYnZCKs8svFbggFPS
         9Q73yBMKuKYF9erQ9XQg9pvYW61pzyibrSwca5TnMokGed0BuC5KpiKDDcpsVOfxpld1
         9qLKsBTrDfQO4WOT3hyJ9V9cR4aGogiczvfYjyQdq9e+4gLyidu5qXJIQGnddAimALAL
         budnNtNBEB2dvVHMMKlhwqKYVIK4QNGS784T60JENLaKrTFO95WtyZttYyNLY9dYiT6V
         sVFg==
X-Forwarded-Encrypted: i=1; AKwUvBwGhJNWCcd7/WHzEdruZ6KlpR9RYd5Pug7JQeu5Jf+4T2rtZ1SDVN9kNg2p6eOva9imKiXlE+/lox1DomM=@vger.kernel.org
X-Gm-Message-State: AFq9FYITSqPabNQ5ZYefBd9QqaeoQgBdnG6IT+BaMfoOdI4TrTgN2SHn
	NpL+FRntVHo9Gf7FwMjTL1bYsfAi7pBxByx7pUwCTIpBVU4hD8ur06bQYf4mgH2Ktrq8hHaxjW2
	/ap5Z2OF1z6vIHkODeqAd9gJvJsjOoPL94r/GTF2odgSoMcVptUuOMqFXtdZFkpGyXqk=
X-Gm-Gg: AYBFou3aS9z9ZIuD0VwyLPtX9DJN8DAsUFWR1C1JHMpAcR8AvRysp4ibVS4IoTLTHfE
	5EdrVM0UzNXV1yibINixZ3TnXb8w7jBJc3/gUhYu+xeMsJn+HyjwGGkY82jZnvyYZZTk5NT4Q+K
	CHLOSUkSXilGRtXzoRuZXgeUzSEFC5IAFNF4CcvwAJ6plpuYAWwzGfCETjDzFFUbF/T9J2Pxtch
	yt3OTvj7sZijTs/emR22D67juujT5qP0dJlWihY7GZUbS8g5t9TLKLPsuKIjp9ziWD4IRDa6eb/
	E5y7NuVPqtOkeUupxwTTKQrt77BBLmeTzCn1qbgI39WuBoTSEOaWvBuUpqG/RDcAJ/cy2JyMtmB
	jpI/C/o/nvH0NdhNhK/9PGSgcbCG6Jr5B8ZqcEuusdw77bdZKhUbR8+swMrI0WlbTdWInvYY=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840671e0c.1.1793193082826;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840624e0c.1.1793193082038;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7ac041sm596435066b.82.2026.10.28.06.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:11:21 -0700 (PDT)
Message-ID: <cebc3404-1f9b-49d8-b459-0e31d648d989@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:11:19 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX3MW7+lDIjNLY
 XQMIyjWidX9tKEGjQ9GGogGUCeDQTUvWZzAz1VucNdsbrf/qSkuBHABoia/EXC7MhwEiel9+YxV
 26o2XaUMQ2lkGx41iPl+D6OhpMXjkY3p2d/aGMfDHMEbu0710y39f7geeftyFwBFvRMdpfUnkpI
 ktPNVlt0bm14KQFLLmx40+uPKhh3xdc1ytwFwSFTatwpeMQy+ktmyRk0FbOSUcFDD1UsTdJKSh7
 z6T9R380ykhrusc57GXjde31kJHddr19tqFPGV+MGnXVoqRCm0dWfaI2nMMh/SS6xf90DNw8s8P
 Pp5XoarQXoHf4diBaoKsXcSGb/IvJkri4CizHUmOnGS67XDOAKxRX5L+q+NFJHoj2ZaOZE7WH2N
 YqGQ/P12PxueLcMX9WWeFEHp+wMRbv+VfWYTleEYgfq6KqgAWDjYrSl/AUaCycGpie1XtA/Y6QD
 JQh80+TWtoeyPuz8dEg==
X-Proofpoint-ORIG-GUID: ZkibcwMbPBVriwgnyDdN-gLo1gxbNvAI
X-Proofpoint-GUID: ZkibcwMbPBVriwgnyDdN-gLo1gxbNvAI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX1R6OKB6erapJ
 M1FjoG0QgIjwFk2kA05oz+jfyHmIXI4zJAzh/uK0qiByqsZGb545fpRWfzeY3PfzQIaKG5/su46
 2fZeHWVP+UUpjYvDGLpKhGPM8MyZYdo=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f47c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lYDSAuwiKccqTb-b3IIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 1:01 PM, Anup Vishwakarma wrote:
> The proxy supply tables of msm8974, msm8226 and msm8926 list two
> regulators (pll and mx), but proxy_regs[] has room for one. The second
> entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].
> 
> On msm8974 with a device tree that has no cx power domain, the
> fallback table then overwrites that entry with cx, so mx is never
> enabled and cx is enabled twice.
> 
> Make proxy_regs[] large enough for the largest proxy supply table.
> 
> Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
