Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664608;
	b=Jk5oDnvvAwSEVL0M+rnPXTsx7PHSB2QXRmtg9oaDxu6PRxuS804fx/Ldt9TFWkJMOejL
	 1RxUJz1eL9NGyQpHmS2nfojp4WlMhJleGQ6tkNwKz3Vp6l1xWt5OLw4ZpONQVSY4fRJ4h
	 bpPno+nPCtQ3mtSw8aU7BmJU641gr6H4YKTdEl0+HWmCEXrjGjbMfryuABeMMy7Wfrm/G
	 ga9R4sELmnlcEDGjHKOGgEqfFazhBI3zGccnJDTn/0kCFiPlXq5FAT6fQqq9BnaSpioV1
	 u9SgPhzeJzYge+oJGx+chqoGpVZ2NVjk4jLCA+n/xIuK2Ny4m2EENSexkOhZl9wdOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
	b=lX+rANsLEaHjiajQU95Aq0nFswcgSYmYfXZsQsqVb5d508ckRgLUyL3nN0nbPcKvWiB3
	 AU0gBQMMpk9bVqWjebnHliXKBykv1IXpMyYdWsg628F1lW1wZrynqH3/4yi9QPdeqxfk5
	 +QwFAPNpdhRSSopEs3Xc3OHylT2v9900HGBx3016SkQRNSkNs4ebBz6FtVyRGKeza0H9p
	 oh2bFA9z5BLJT5xKuqbR0xvSE9YtdYpnb2Z/h9q6shSfPsD3arKVriMcjMMR3XJ3x7XNK
	 O/QTnmojyJpwMTZwTaBkvvFps79Sac3iY3yV6Rkq26lCoe0/R+DUiCPDjEhfu2sx8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XH6n3qga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ez/CnMcx";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4186606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4186606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XH6n3qga;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ez/CnMcx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA07BD3115681
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGYyhXlCEL/PBQH/J17c0m66
	WKJUFcjV6wWzb2IXuNw=; b=XH6n3qga0xg+T4SdAix78S4uUpN6hQSXVdbepVWk
	L9bspiit0w2wWah/iTmVG6PD50N1zy4ccjnrH8roTwIceDI1+M+D8hZrPMhFTci5
	CmEzWh1C/j1xRqK+f+EOhMfclim4WT5wD0pBZaO/ubHutwPK2hy/wO9uMfuassWz
	z1hCrlN+0JYQdRjqfFphmb1JueLWJ/Lu28QBpft63QEIhMAYOPy9xMNs+YHJE2Y1
	JLux/5iS42fxKV/orkCUAQxpFhS+0sOcezTMABWKyyTkHfGGbhFt0hYymf0Cdmsy
	VEcVQgjL8bK85w4YKHyMh2ZnErbLArDEPJ8eKHQ5Arkfbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsyc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:23:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso408513985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664606; x=1793269406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
        b=ez/CnMcx9kZiHkVs1YM439nOhFPTw2RckIB1NRNOeIX9sRUIJSgHa8kRQobizylCWF
         Lu53Yetu53wAIIMMtDIWShgiCkIIKiNrob8mOWjckx8E7xGHe3INh9xf8oBfrixXWLiw
         tmWvPbJ8GzL4VL7CTQfc0Nzj16UKH9iBZbVmJf9xIhQYyAJUrRLO+O8ygwme0L2EpGi8
         MwiSCBSGF7RD6s6oMnLFD/lf+SdBy7f1KUfH7q7U4YiRq3LU2UeSE+DzmuhjyZ9tIkX9
         hQheNx2F/aUsrQZlBR4bkSgNM/x9JafgkvyVNkWtEu2hYbkvEo+xVbWDL708OH+gI18P
         Eemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664606; x=1793269406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGYyhXlCEL/PBQH/J17c0m66WKJUFcjV6wWzb2IXuNw=;
        b=M0UGRrzF5UdTEZoS1C0bktgfQmGx7nF9OGUsebPvbV909WqdycHmtKpMAF04XnV+Ps
         LqiDtgBfIflUOmi9/hsWaEKzFg5LggIBuYToTdmrcsf0VRzSOriKoq30ytuxO76Xwt+2
         YabVdwd7UvRCTj8t5l/AzX709eyTcNtNPtS73MrDDdsyo5UkaT+tGMGuGXwz0bLQ8BrV
         u//D1zawlYXql0yGQc8gm95SS7RrdlwhtQm32LffDHtgQAIKJudOj7xD8WundBBK6hcj
         Kx9DifoqYZJE16goS2zl1SX92ZWt3ONcoBN51wl8LEPeFfwvWrGBJXWpx17WJ3vSXJ2P
         F/JQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcJ5tPTE6XjQZSPcU8B+WOohBPdJE3VOkhxMV+SbaeV/Uw/uQ7sC58g3loMz1lEfC5H9SICwF4qR3lFg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYvzaIHf0r8SGVsOP73xjK+lJEtJRkq+vOiPrDCZG4NkuNE0IT
	b72Y8NwkeR1kJdbL/JYgpXZ9tOg9vSfTdsbJlq0jJAbZVAj71aV+CwO7oSYOd/axgE74zYqzhxK
	go5B8TGqSHJ/u/vN45o0GBsIyp2mYPlYb8VeR8KaYz3r0U+WcFqvfA/ksRkVCxsyeA84=
X-Gm-Gg: AYBFou3zFBJoddLVvaywRIuO07t7jf5phQKMXQ7xjgA+0G4w+t87zWM3PgAFQsBe+60
	/D7PvxSXGdz4uzgDAz+DrtlzI3irK4JJepoT6GNuR9TT9UbBs3rvRrSPlYttfE/bBVlC9YQifoy
	xwObYYdPm8JboQHGXViwlttcVIEsALIrW/DQ/NG/kzXXvjbtWnsEChYWHuWUxHazxS6ohKDmKRH
	O8paGfT7v+6SsP2uyjzTcGitL6TFISxSU3f+hPaF6KzRLrcR5Yp8ASKlpS/sfev01gvpckeQaVa
	7HnVoTDTzszM/88MsYK7XHBO8J/V8+wOcDzzzND1TTSTSu4MIppI+4F2Q3NK8bFmDsyWhWz3b1R
	O+fv/4Km1j3braFf77pAdcaqbyRe0WUl7kfkqR/nPnmEWiVxScY/zQXnoVySpOTW8jzkSsxEIqT
	i4zErQlKMxR5ZB
X-Received: by 2002:a05:620a:3704:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-93f57e65970mr877493585a.5.1792664606182;
        Thu, 22 Oct 2026 03:23:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-93f57e65970mr877490085a.5.1792664605646;
        Thu, 22 Oct 2026 03:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm600274e87.7.2026.10.22.03.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:23:23 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Message-ID: <33hfl4oebtpyefi76pidrjvf37gszukkoj6xkgbm5rb764fzwp@3agawgosevoc>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Proofpoint-GUID: 99iYc3spxO4ndkHFnMsDarqmlLc_GbPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX/qvZNd/CTYa5
 p4rTXxCn8/9n1IILt+Ldk56CfLgOFf6vkdisGHO2PGWOFGO5ThsZ5s/9Esyh2gesBSZq/mMp67U
 WlcNXBnXWUl7Ug4ZCZ3VLPlJAh9L98g9NO//YVOIuZwdqswdIROKgB5gDG1Z6WuRNrmZwmujtOC
 V3eLqqWaJMzJWoLwqkD/TIG/55tiBRElpfBEsMltJUUN4rAcQsmZP55ATJOhS6itFw89m1FHijs
 FYv1yhAjITwaEN8omkUqvmtN+ZQXvLX4N0mKPFhzFk6hLe5tpNNXZuRN3o2u5zRe3Q5ky1m6V2m
 wIccQQWiRoyfXFE6e7oHWIs8/TxZMU0P3Ff9PgsuRM3hw60a8ly/bRSHDueJJwuOaYpUVU6hMaK
 7Ic0yhAo0h772HQAM7cirfCS02IeZL+VPK8WN0+RaGhzUl7A1nVqjtLhE66gRXvyXw4D+6PZq/X
 0QzQ5RIfSlUqW5cEEPA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e41e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX1VVK1Cn8apQO
 lNEXL26Es7oOfU8M2mwCmSLMpeG8U/U5ZMs20+cSWy1CGqMgOJsEit8cqmaxd3y3D5wu5HG4Duc
 l5w0May+cMvn5X5Hzh8us+5ym7E5rqY=
X-Proofpoint-ORIG-GUID: 99iYc3spxO4ndkHFnMsDarqmlLc_GbPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:16:57AM +0200, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
