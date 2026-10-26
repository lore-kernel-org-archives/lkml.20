Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016536;
	b=4gFNKz8bdFbMGhbuE8p5WlspT7/pFx5khUDbF42APKb0zwYZ5RvWe5VNJI8zH2C4qhOl
	 inYh+obPLfGlo72lEAkxspcWdUGdFARgnyk9TYMKuxNA5uDwrOChNe1dnqVoEyphxSjoe
	 YXYh6Ik5XnBptFzOiiQe2b4RtvkEAk2v/38tNzAycVOhqR3FUy1ZAdWa++Moxk0PPenZH
	 Sdl/KnRs7Y86UfkWO9MbJp9wVof0O3whzy/yvXpvOu/SYsGDyT0DTMb4nerNcUsrnHHJ7
	 AC4xb3kwGveiouLapww9epVUitXZZuPk4+xmetEhRHrObV+y8sM8LFxHLjfly5oeHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
	b=yga/FdZhiDzzybzKgLFTEpwmHOYHSYstSLDK9uR8T5ltJpFt/5mfEf5iVtNUlTgA9Imp
	 o6cNEOlgeiGTKuCrcakw00jnq90N/kuGxAfuUGgGULZmN80RgAm9bZthuQvMNbj7EFVRh
	 iYPx3jJzZM2JFEueWbPbQNNfIUFZ3r39MNq+2+Gx/oY1OSyE1LlctWMHgIRjGXPe7vZq2
	 MdVab+X9U3K9wcq13uCQWYV0ak3QgKe/37KVcxfQ1av7dckiH3EyOAjLuioC0gKezmmXj
	 jNUGoH3E/p8rl+HWSwwq6LKbqI5PywAR0OpWhK8/002yicJpkXpS+/cd2QFm8bqZdWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQjh6u7s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCrUNl4v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D393606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D393606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQjh6u7s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCrUNl4v
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtD072734116
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=; b=DQjh6u7ses5PHOUh
	/jynA5DQqOX/wdpP8HGWs+EuFDkOoXc2RRD7bivH5oj2kThoKCzGBjeaf4IaKUiC
	iWSuIJ//5bhq3MlqjoGYXIOLUQ15qobPfqECuD8FQYWh1y8hLzRdg3lLBWyJ6F3D
	Cuh9Fi2O1Y7sYNkRI3T/VgkU5lngwem8vGIp8xfpIr450Sgx24pID9u5UF8UrfBv
	0W3XIxkZHZo5LooqjQMqcVSxMdjjWZBXa3kRdoNNqsmGOBM9iXjO2s19rA/u7me5
	5a0C4rfw9O/zb4lL6Ptdd+FDXNY0bkF/4yiU+ZuaR/iTNUtoeLC/vhE5q0lw9wzv
	cAvuHA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8htw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:08:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso58135e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016530; x=1793621330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
        b=MCrUNl4vwp5R5DFyVd76+ZQ0pr9OV12aKYrJT7rGlXDzl4r0VKOcjaGETHWH40yo4X
         PjysM/Fa/dc0gmaiDpUPg4bJj7/6O6BZQwoyyDWOF5SpuMhIkuPZwVXL1ptfdbyspLSR
         hEGCQHei1YT3MAdo5wQjnQpicMNeeja3tNPfL80+3WkFnOONNK8t7ws6R/yYwmBDwOGX
         xRY8F6Vf4I3S7fUzLkcP4waJBB48zsIp0gEUYI8fue1H5NZGizclhnVq0yXTpeyrKSA3
         WTrSwFJPLapx8KgQB83O3azEuJDFRLIYCiLEGzSER1gdeAtzzkXM3FuMpswkitxXo97Q
         B/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016530; x=1793621330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtJQf2VZGFLMhiJ3YFKF5xOzKvNswmAE4W5BOc9iUE0=;
        b=gJhUPGMT/4FloN2NpOYM8pnwMgXNzqykKzj6lQxJmABaBslEdBu9m0b62CrRYBE0Cb
         zSH0mv/oCIp+ISO+wmTt+8xHf7+w75qFUltDVEofIpG9dhdjzPQlP8DuvZGCMQiUW3FV
         yyJzajLi20PcLZrxm08edlFfS3YB/NfIX6FzbKmVOPWXncSz1BX6gFD3tjlFjZLNlo/F
         p0Qy8PDH5ETgN4kSh7cLIt6TwOwro/ge6fmqhBEOQ2aDmdSqkxnLvWZAxqw9VvI0notL
         5DGqPZFKEFtFhTSxdFmyz9xQr2ru3bumnALA5UEh1tn8+ZaZUEttFfIaGa5r0HcRPiwe
         U5yA==
X-Forwarded-Encrypted: i=1; AKwUvBxrWaUkRVDg7/PjFu9P3V5FvTktxN+eAu3+fX2rXD93btQZmvk6hrBQFaGfrIy/2dpp7nP7HNT+gCuLuaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO4QokM11YmF247YhfCaVwgsip6PlcqFk2+2yjH0j2dDlSuRra
	TEv+XEzu3v2xhYLr6ydaYaYyRdTUup4sxhpriKzztRX1eZibRrmVJFbSbIvnS4NQfWiVcKwCmmd
	MZda6FfGsPbuvdpjyXEmqQ7UnB7jQEfMiiU9YkW0C0mspKqX+mo4+Hjbl31PbPCw7irM=
X-Gm-Gg: AYBFou35Gcg0d3VL1f+Buk/wxqFHDltQP536AbTQ3ARin1J6dgufeCgK6oE1uddIBCh
	S/8JcScAM5x4+PXRvCWHXPcwXiZ7xeLupHPTD8TCVyK0cYzl8LRV5wqC5a27mFQ8GxrVZEc3vVT
	6P1/WS9FVjqfUXsO5ARMGmPQx8P8Ybn4XldwtXTsZHUB93JYnCIyUzVC0T686aUfThHODOs0y6K
	1YsIzMoi+y2RgwMd11x38MXOxEFAcOnE1bD5mm2D6lHjUnu8wotyKYuIHbLYZbVkw2WDcIsRfqs
	rZYxQjCjf2CjBZTYjS4gtrio2R2oqhnpyZ/KpdDtaVpet/Ivr4zRvNSOr3XI/UakibhFEyoTZaW
	/APZP/TM+RdZVRvcvqh027A==
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1485264e0c.5.1793016530471;
        Mon, 26 Oct 2026 05:08:50 -0700 (PDT)
X-Received: by 2002:a05:6123:5ce:20b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec232b5a4amr1485236e0c.5.1793016530072;
        Mon, 26 Oct 2026 05:08:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm312729266b.49.2026.10.26.05.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:08:49 -0700 (PDT)
Message-ID: <b4b2c7fb-1c80-4101-b643-7a7f619f604d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:08:47 +0100
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8996: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-7-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX3e6kLqepv6U6
 PnOnHB2gYzo6Tprfbfth27QDxxzZpAfrgS1uNQXDq/troBrRyYZUR1zN3k92haEBUV4GvaYl/jb
 5FHVRG6EAV0elX+9q7nHl1ebMuJu4Nevsbc0k9OTgb5nOWS8zHuBbKkJXBKt/5u44i4Hwp2zK5s
 CENfY61S/NuQJMCgMczam0pM8/lL/b+NA+FJN4HUwHtPplMDWABeNQDvc1ZjuZcqPuPG0ts/e+u
 EQsMg0MiejwRZII8PLvk8URX9Ev+NDwy/IAt7kFh9Jrg1dqvqKNu0jRZBvpA93HbxrQujXWnkK5
 sUoq27/x/crnz1AheovJWPjPQd4D+TUXdbWb2r14Y8SZwaiwcXkxwFNCrfGmmRLnit15w+ju4R3
 5MhcnD/wLfKba8Wvf/0fYnq/yXjdZoIISaaAucQLEx3XYSAEujnXPVXrhnIOdb9N5EYbv7TPAF+
 2YVjFLbEuhkrU41JG7w==
X-Proofpoint-GUID: V4NPL38qBaLnTq5sp534MleOnlJRep06
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OCBTYWx0ZWRfX+80pk8gjaG0T
 SbAjFdeYXlAnl8vHWZ+7SMzGnf6GxWfcgWT/eVy62+qBr2vgDm4F0dB+FZbteike0rR74NIMMFd
 +tO7CIUMZmcESRrgPxylrAtQ+hkWWos=
X-Proofpoint-ORIG-GUID: V4NPL38qBaLnTq5sp534MleOnlJRep06
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf42d7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HmQ7WK16ZiDfZ1s1pZYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260048

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from msm8996 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 1b80b83f893d ("arm64: dts: qcom: msm8996: add fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 818e5660df91..51ef306c1ce0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3701,12 +3701,6 @@ cb@8 {
>  						iommus = <&lpass_q6_smmu 8>;
>  					};
>  
> -					cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&lpass_q6_smmu 9>;
> -					};

The docs I managed to find suggest the protected SIDs are
2 and 3 on msm8996

Konrad
