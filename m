Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F44A99D2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440818; cv=none; b=cRoatOJ+8j22Bsq67vYtfX4ROu+wAP9uIjsYblHkZzcQaPLNdOTsNzquelFcH57grB/NKvQhmAJP+DHllqqP/SIkWF4ZRAGpBhDi3tVv/k0FGaVoLi2rQ6ZBga3JcRFBbjc+MYMvslwotePM68TX5MEa8yxMby7cpEPE5kv+4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440818; c=relaxed/simple;
	bh=uC5pdAlea6LMnedwQM0PGV+JAkluCoB5iEpR2eQXpZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ79OXitIXulQg6hlLx7MNC6PIffqBifGSOoznE08ezSGf3iF1vvOJoibBMobfpXR6Ko4rP3xP9pvTJq4K7K7/7pmTmcKNkqFgntPjCOA2g470zS6VwlaA/KhlgT55urfQD4NHWyDqpUw1WHD9mMTJ49uOcN96h7L9tiw8FGTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRUwjl2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQh3slqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRUwjl2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQh3slqi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683B0A5V752518
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=; b=oRUwjl2SEK+mHr3E
	1TXajAMLofOfaDwYYs/WYpX/pLre2StPysibiKYKi7DxlCYronRzN3jPKd7tIjkq
	2BBAGVOh+PF5It0dtHIaIlBqfkXNbM3UDYTPfj1PVbAU5ZkAex/5BRSLPJDhpAu6
	numPAlvY2qkVXW36geDJRex6X5SDRV/czdbAJrYosgEGm5dSt8IOPE/hhlXnHdQ+
	HrrsGqzycw8vC9tgA2v8l9egk1mlh8T4VoeIQjKOjyDoP79n/2HhtJJwrodk4SR2
	34c7lOiDTdvAIWKdrP+pRTf+2xIUHQnVVusJ59rFDupIu5arDfeb4l24EYSPLymR
	ktm+zw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hvak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:06:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfc08e95ebso108525e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440798; x=1789045598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=jQh3slqiCNnGXYE+D0K5mzkcsJ+VIGsY69fwZKJqf3bFrUAdNRQEUbUckH4Juglqs+
         1GmVCCbHRie67oE4bVn2VGteZLtOFwU7Cf+wS3juNTCfZV/m3sMaZ6H31vZUUZn7JI1t
         VvW/oA+0WbDv7dtyFH8qa4tof2M5icTa6tbHj46ADmfyhbIEksrgC0CkpiIfGw/ZS9kW
         UVQvBR2v/NNjPoVMcOLjJ0Ennyti2D3nc998P2J8jiV3I7YMq/GvIPZGAokPg1MPVumB
         clJ7uQ/z7zBIO93S3oNDchJNHW+4MYU1/b0x6gQgGpF9kt9yUOF73t216QMlWloi0GlT
         WJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440798; x=1789045598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7FTCZ/aByMpjCgQDlXO7TQNA6LL4vCUqNXUxyjwvow=;
        b=Ill+m7yCJwUZNYLTRBYdU0W63sKXrk7m0wRq1qmLpbInd7SteVgptXe7t0IeOJSPiS
         ta5UyIilB913Y0jeszyxm4lPdYA28mfMpyxK0jxDhP1EqdR77zyHxhXZKYzlV8NV2TVf
         /KAbMwZJoi5T3VcKlWmVNLBVcH+POijfSOczzjMaswHzkH2p2Gh7xVTi2REmfp37Bp5D
         fmmb2N9j18qbDdBbduyTUYxO0Hp8Db25lhTX5nVW6GqPeYiWs7FTigGEww2bY6ZfnxWG
         NHtuN4aF/KK8rNYpgfiF/8r8AjnDHMQu8BRVNP7uMIr0EMZGQqYY3YVlhMr+f7lG7Ibw
         P6Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzdhjdp/10Crvha9i7MQ0eSZCub0DBYRbF1TCQqxZ0W67LBOA/r6CemgrQg4s8hOY8dMr/GKu4CgD5BJxU=@vger.kernel.org
X-Gm-Message-State: AFuF++lrdB4p3NjDcLHhuRQ4BD4vQWEtWw/nVAqh0uFWiZmzzezcxQhL
	CIuDYuvsqWjdn5u9uVgcA2Celxfzs90LgSkyA6YSZW0TOF2UWkbyHVJmYD3iG+OVeN19LLIZ/Tb
	gh7LhoeS7K0Kta3NMYui27of111RD3Bg6L4Dbu9PY6Wp+GHInVfGy4RmrmQq1aUcjxvs=
X-Gm-Gg: AYBFou1wwkpjNnpYnur0W0vuif5YCfQb7zfG5+G1renKQRrKulaMsIQqw3H8+tgEvnb
	oUKGX1yw3mjzcIcIDjgUnwgpxJFXupBOnkAl5Hk00PgJuswjAivMD/USPfDT94BFbd2/9z20hVc
	db3WRrcXkYOHC+vcGITucqEQr9HKX1JWQb1th5y8d8xprTtKIs2FvWZaFCtDWqX3Ov/OtkBxFw3
	9or7mfguRupaLNmWnUATMNtKO2OPw6vjBKuUqdzRX1mT0UYoQWaTEXVQiQ9OJx7bo71LqMtzZDq
	b5jj7s0YPeRUgAkMugK55YuZgfFRNZMJc1mAuxItOTLWAfgP/aGWefAn4Y9nPK3rJO/54ahv4yC
	xlwc80LBgtsNYv/CibGyCbg==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904418137.1.1788440797714;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr1904386137.1.1788440797263;
        Thu, 03 Sep 2026 06:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b53edsm2193707a12.10.2026.09.03.06.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:36 -0700 (PDT)
Message-ID: <bac552e0-8d21-490c-b628-8da860cb9371@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9970de cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DIbA0zq13t_FKQmREx0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: hWD3vhz7EmIqVsB2JsuF__IxD7hnfb5E
X-Proofpoint-ORIG-GUID: hWD3vhz7EmIqVsB2JsuF__IxD7hnfb5E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX/x1DXQb0Ai2o
 It4P/usgvhVzTPLEOcsSF7POFon01qE+92rXbV7ylMfTLL4UwZK/Gs4G852tpfqbfGM+dQZkyuE
 9htNrwnmwKEwXBuGozqWC17ETYNBOjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX3ynCbdOuIyJc
 xKkWgxmtNL/EwnIcufr3377sfwiXSWoXWsp9ZCJDVLmJCme5TsOauML9AGXlqQDSUHfmIqKbwo1
 iTRx8s9WcRYsr5fp07HVt7h8pHnoLj7FIVlsjmPlDHAQu2cvhljr2t99hryE/6cO9HWBve7tZi2
 tRa2BRC/qft2ait9ORHxJXf74hKyGvH1xIHLrrgKkyBH1fJ4geY+FigLXo9ccZAmXeVuHlgOKhp
 QXckwld9Y6j+2tTG4I2asZKqlSF98QHaGB7NVNT0HFP+Lfhc0lGzhRtOJMXQIOpgx2EInXDrrHo
 Kib5qKj8UbumlY1mapAN+UM96cguSWVB5km6fpnOYovqRuDlns7HH5UD/vqwRJNu51Hg2DrRCyR
 m4iVJJl6EaFtUzXv37riKIbbbo7cFbaNVeBuk9gnqK/nMCGWgJXq59dqEnrJXZuwRgYz3YWoHyu
 INzjaKzKoisdOdkSqDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Monaco-EVK mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_l5a.
> 
> The overlay is built as a composite DTB combining the base
> monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

Same comments as patch 1 for patches 2 and 3

Konrad
