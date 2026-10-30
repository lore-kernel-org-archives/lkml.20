Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364711;
	b=zG9euZo8VUFgpCI8fHPaOCbf7WoBZaamw89V04WnXrmpmC1N5hcq9sZ9Z7orSVPs3A1e
	 F1j+51YZZGKQ2pEkOdkBhC5VL5gWgYzjA8zde4XNo9t6oIaeIIqM0PZJeLdMrl3vnCp8Z
	 v2/luSnj+VjgpBux2FqybjjXB69mp1cF+U1hdCOyPfZK4TX8/VqWDUsDcqXMWVZdoOo8J
	 zUR4a7o0S9SgA7cgQs8suOJvUlmFAYtBB94VY/SY8kdct2lp1sBqIbEh3GFlsviW/M6pR
	 pTysHdsBERdu/haW0jBmIGVZQDVhPkHCwRN+fNpdeA0uoDwe7ezr8HgK29mNVoNXmHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
	b=WktJBDGfyWZoFFVlIYFLEhuRo/W9L1e0sj2R1D2JJFEpxOnFljfiLZ5IHuZx6O+gPls+
	 E7i62CqPtq32RuFoXELfCdE2WcNugmNxxPH7iozI+Nj91Hd14GHBcwgc4PxEkJM85NXfr
	 6x6lyX7znrO+ONZi9cfoTE+d1PObxAE+OnvyYP4/ZRhcTyxJC3vEyzwJvJ3qBCNlXaq0j
	 V+ZnCVK5YUWZXJf0aUuUm5HFwXNuGDN+M2IA7RbLApjGYbkp+HK3wqsaSLgFIzK94Wfuc
	 iE5Cl6LQhttgwp4xcMjZqITDOFo2L/OgI/HQDVBfSzjRVeYFT8z47KjcZ373DVFLKFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cke04Sh/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883CA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cke04Sh/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG0v62169618
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=; b=Blypgrft/wyyMJSq
	mYY375W75c1+9WXq1BojubqxmfWXwPIf3SR4gHD/uaL4/xp/MXz+lnekH3dUu3f2
	QUk6CGan9obk+Ym1fNLrY/SUlajSzJ08omubYyIhKk+m0UkQTDB/zuFkxaYnCLL5
	PqV+OzdYYMVIaYIpWFx3VEISRxMwdMagcVooY+JAb2xA/AgCE7ckL4JY89SxKuAU
	eMwM7AFzX8vcIjOmpfQ1bcTV3eAboUZ/YG8shW/R6OgQgVHs1cIQns0t9Xyj+Vzm
	eOVhi5BvHQjUZLsgC2j9u8oYePm8hXL7jJLvdaN7mu6tr2+CkaaCPU9yE8Dg0K7X
	OvUPvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb35s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso14860585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364709; x=1793969509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=cke04Sh/EDrAj1++jkj6IXelNAT3Z/h/Mw//P5fHf2ZJR1WDQ9RNtMFl/2F82a1ZYD
         ZXxfugK5a9R10lMdb1QZmtNvXFy1bSztjQtSsS9AsBOo2Ei5X0lyDkVPr3cNIB2N3Ucz
         76f94O1PV0XKc0VTEBu50tHdIpHCsaOwKwEZYvT/IXbmvySbUSrmysW9SqGGqgIT9wjM
         5bWCiqdo6qyyuvNsZr9PubSb5KIuytUTmglJ6t5QF4sr6Z4FHesnKiYTkC8KZrEneXXU
         6neGciSz4Ddv6jkNEHr28a4j129/RuWbjUlCuT1fBIktq2gZyprT51NPZS0y1Uu86uKN
         2czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364709; x=1793969509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=I7eZEVKZ7mh0uLw2MNimL5090MQEh2HMIR8Bqf7FtySIxT0v6nl9cj4BJPE+4tpxMu
         BNr2Y8j6dsVwXiAXCuagQDcjETaq0b00uKQzuQcnGBizWLt9WJKexGGtznyv6/p4Mp+Z
         elvhGGa0CCUAK27wlpKD0YDFW16nNnoRULB/xlYBoli/J7HN/myJnkKA5hvfstVUBRvt
         w3D2dwBTdquKe5MYzhObJprSUXAG22cnZ3qY9Y3z7upE87CKCD8rdY1trjM1koU8NGfO
         eONJ0Yn8SGe9HAer9TDXYkdJGTwpGGgkZbhIn+o8a/KQdJqrJ26BzUQ18ngpUy9K/wIF
         re5g==
X-Forwarded-Encrypted: i=1; AKwUvBymwpOA24yLdKbtPpt06aCTJiEtQCEFUxB72vzQLV8dzHYcB/DtguZRSWJQb6i/hbc+1vBBtCjgNlIGbYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsRBqpDqrz3iU1Hf0twXyElrlrHu19wk1GAWUvst25YxMq8FgT
	nGZYksjcpMtSYBha53RgJvBbWIOYinCU8nhRbFz8QXSJDwPgL/RxRcgsZYnTyS+WuubCcP0mxet
	vzrHsVOPhX2ArwwQOg/x6bxnj/Tm7dINQVoejC9PIH6vmbNX3eUSqFx3BIKSlXyzp/ls=
X-Gm-Gg: AYBFou1L44/SoevqxknGeqCJxH8HICUuZ1R6rA6UHq7wW3XUQ+TXTX3C4a28vC9aSN8
	+y/DvoCVq2o55pLLk4H3PVu1Byb6Z2qjU3YiHu2mxCA/EcDH3zZe3jvK8a/HWdFfoliN54Ks/AA
	Qz2wxFw4hTFJPdW/eNYPcTHb/B9BW5BlRk7O9mIOZdWb8Pq7EGB/eSI4IGyWROFCn3+6KQ5vdSA
	8uULbqjhagSF8XNL0fMUbdBf8rdCQEy8Tqejmms2fysX3Elp0SPJXdRTMsn7UXNXvqCYmIXuIYH
	aqsW1iy5UttEZ4CNwCbPdrrqO/+6EZovXk31ODjmC+D5A++kWIh0GM7BIEm6WsYqIxDZfojyq3L
	e0WdxlUf4xk9FDKBf0TqWS2iUU4KPVW5xbZWViPYq+ZNTp4feUj72LbHWhu5m6MivKDGe15o=
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334118785a.5.1793364708785;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334113685a.5.1793364708087;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdb92sm62678466b.13.2026.10.30.05.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:47 -0700 (PDT)
Message-ID: <f0a6aff5-1293-4d18-8c8b-52f06a4050f5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:45 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX67vb/xWtpD3k
 mgxiBNnE5r+TwuVjQXyKc5JVsFTKtT0bbkTSkruf6XCIounHbzgpBtSUifKXuzabBvSo97l9rvb
 qjhIp0IH2e60rV8xWa+N0NxAovEprcxJG27yA4DERwJHmPGqPGjE38krxw8MLQc2XiP7Eww6D3q
 bIWU4oTESs+fDH9W7RGK5smTCHA0zyp3/TQZjYSYTGtoQWaDC8nkMgZUc/VnIenlgbGaZNOhEo1
 g04+9MKxj+noz/yfxRsmGEoKLofo/u+wq+ay9IyVS9t6Jqp/JgVEHuTefqcLMKrnpSXL7QJRoTA
 DcFV/KkOd0CXJR/WVvEbPynF1wNs+bc1v7Y/1NZAMKEJJGBIDynRVDxqj3FTXXSS7u6l/+2hLA1
 2MOyePH3dtNkUT/ekXLBmLTT860QPlD21/Bgf6AGIr5EjsQid7jNm9ihXEGqIdcdgEqlQj5ENZD
 FQO2tCUnvha/zSRfk3A==
X-Proofpoint-GUID: uhG5-h2NX7f5tVq17MqPekFrxa6Ry64H
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae492e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2vvDfV54RvwmZ0zWTFIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uhG5-h2NX7f5tVq17MqPekFrxa6Ry64H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9XX47+dl7/kk
 Y7olHoEpPEFSyohiQh2X4bj0DMN3kmd3+SccqJT9ZjgcJM03b019r/i+T67CHdL6uOLHQVEhWvD
 roYyH1duSJ7MjYmkogTdeLIAb54AP+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7d8afe8e95d5..af115295a20d 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -880,6 +880,15 @@ fsa4480_sbu_mux: endpoint {
>  	};
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/milos/nothing/asteroids/ipa_fws.mbn";
> +	memory-region = <&ipa_fw_mem>;
> +
> +	qcom,gsi-loader = "self";
> +
> +	status = "okay";
> +};

Actually please move gsi-loader and memory region to the SoC DTSI

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com/

Konrad
