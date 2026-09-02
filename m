Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524934AA00E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364451; cv=none; b=LNu3+g5atzzGFS5stpgHGZb/Y3d4buzs1qnjRrtHslrZ8en0j6fJptRNirWIXS1I1It4xsqS/Jr/T3D0QCxFopbtXh2+Sbf9YQXRiTUJodDsop35ejLLzH2LqfhijJuQPmB6KObNR934kxR4H4Tada0InRIg64m8VYgpgMoVaTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364451; c=relaxed/simple;
	bh=8XkQR69hwEkdBWOnNWghUOPQrJvnLIbWTv55zF3ayPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSm86Ct8ybJpxeqrKJvz4+/DO2vlcMHODLffd38Qra1kXpjKIaICl9YnR1gV2eR6x9fnU/XrMg66e+zP749c1iCn3JSa8Oas1gsnGdWDRKszyBZNkRJs6QQTz7Rt9Pc4cxnwCtpvCW4pZGA61rZxUp6XYCzBgg7821dGCOsjlu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtnzeBaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C377y4xU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtnzeBaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C377y4xU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ23Z1284657
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=; b=BtnzeBaSF68f8XQ5
	jO6LUojPP2V3cqVTdgMMh2jPUGKkADB8gn6nbfb+tFSyawg5Sl2MBapSli6c7DN3
	oRP91xdTc53Fe9QQYDrOlkiT1L7FP0BkEfWzKBhkgB3G1WpVXOwG5Ce9p/gSS6RZ
	W6YypX+jCP+YDt8CG5xdufXzot7MioZDzyE7d4zWyypqFAfnsyhH9s646qlVmwAv
	00zwuin5CIa7tC/ykBCkl9M9I39ma+YQ/GWAHXffgZVMfWoK3lnKZUrWdU04QMzq
	KC/j8bResmK1xq6v5UR/fv/3/L0HG3yXndLGD6q2D51kz426DGuv5vNmPHefPV7F
	RAaObA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb00nf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:54:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so33415585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364447; x=1788969247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=C377y4xUNMeyceeYhoPmxdhKfzrPtLFTS9yzIAewJ0JkycwrH2rE1+kZ9Q5SFTxQnA
         yK5zWWZ/sMHQnnvA62iMCeysNr4HKu/oBReRYmInoc2QZlaQZgNFSt33LU9zlF7YhX+W
         GVXmg4alC64VUQFku77ctVZdXkJSXikPFjcNRfkb7UhP+obgwfe7DQmcDozVvc3ZgjLK
         ogqgIkur6mNtS7K+dNh6noVfn8e+ln0DVSRDUhnJPqTRdsGYDYR/Ky/0MMu+PTt42bXO
         w+Ur04b+c/ZFGvtojO9b2cdKyPfnG1ESl+mjNBu1TALzymqKwR6CkXo70t8dY+prVdhg
         A9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364447; x=1788969247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=kddM9OkgEPk6YprfyX/l5K9BT/TUW0fc2ERZ3wAKhR5QMlxYTG1WtCakhyN4c14JtH
         NF1+Lzaam4zU5oq8dmiXLALDi2TRUflJ2g0dU2UW2mR5RjsEllHfjxfZY7si5rm9wDHw
         r5chrd6jRVCaY/Edg/nZTEuQSFvvEk+2JbndLNHsbTYyueDlCrQMRGcSxUqjHd0R3Pp/
         lnLWJHbGng0Cqn1Bu+01wRIxDq9YbJFzDiCF+k0MKu+lOUkAw+wvNwr3fHDCRZtiZV1/
         l3GVdcxkLy2WT32K5LVUeuvPyUfAc3QI3sMq7l/706by82MWR2RpulcZMC4CBjC/tXim
         597A==
X-Forwarded-Encrypted: i=1; AHgh+RoZWUX2GoPH4LzmLPlCd7ks4YwUZkp4tTuJC2kOFUHsGW8toAGveWYFas8mcCZCz8ZMFmc1I0WZr3wQJC4=@vger.kernel.org
X-Gm-Message-State: AFuF++k6ua5n8gM9SzU2sFS103q2xSbmDY9Ly1cfxz/c0VyP1Tm50vkj
	Ci5AveP++RL0YkOfUcjvDr3xGnkPaQ8yU8YTVirwNjUeiXlT179XYw+xLiQd4N/JPa8QO7q6Mh1
	cXtMpDPlfd+1odkYKAYxFtxwXY61czLBqQJRcCvGoxeKxkfkpCNCb+17wiTtmjjwzLSw=
X-Gm-Gg: AR+sD10PG1ViSKQWsgaXk+g3yLKlpa9j27xzjnGHNTW8QxpVgLg9Io/PcB79flsigy7
	H17FjTZgp13qe6izsIw+R5iVXkf8bT6e8jn1LPx3TB2BywKFSoEn9kxeiVWk5OfEWA3iUh7eB6l
	G7MOYCiQTc70Ir2DHsYqhNtAiGyjRCvoZfsfrFa/nPWi+dIfOVC/1yOfVLSwaZN0oauLmr4Qq0a
	BYvmCEMhFOq8oToN/5WhvEHf38npUquO93dG1FBrOoSu3G++3oQ+ZqhiJckT5/vxlTNZ2ZC5uFl
	tdr4rRxVtl+XYaHcMAJpXgFGSiJXfZRZZWHwkLxKGEa3jcE9cdrJhqq/zIt2ZhdZJ81MKsRmu/H
	mW5Oq2q4OsJh/cg1oZpIvUA==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421119185a.4.1788364446582;
        Wed, 02 Sep 2026 08:54:06 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421112485a.4.1788364445998;
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70easm158636066b.3.2026.09.02.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Message-ID: <85f9ef02-e33f-4d61-9e9f-33d213a0c5e3@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] arm64: dts: qcom: x1-microsoft-denali: Mark the
 EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VokfHHiU5KLKMG7fUFyhyqZCtXO8UFUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX++xqLhhJCECe
 SdFBTNKnL54Aewrka28pC0XvttFFvjNkbSjwzPYUyk0O1dEkNHVyEgu6/ejCFtmYsyk9OcPQwvY
 qkzYoB1Kr3OhGaqgxBzw68f3xT2eAfFcJWNXp6ovSKzyAKQa0kYl0TlNSLjAMkejKTX5m6u9fOg
 DIKhTqGicS30RVZTvgPXRWeKqmDQQIj8ennbn8DE/T52PBK9OtFtI9jFbZeipl4u407BBi14eT8
 v30dCFXYcYlVvst5uoKFsC0GXit+cznmIkx+vt4N0S0GV0Q2eIEPm96meLUWCnBQtwmVMI1tI/7
 4JmlMhA05T65nxPZy84se88oCgQl7Oi1p4d8tkczSxOYHOuiu3rTGDIFnR3fH6Jm/Cm/pvI+TL5
 iUCZETgwzDLEoxYbGMBXhdutuSisSPTmzHdPd0BvNaZyxpV6WjubvapAd69mFuGx7IZIlKNferZ
 uo8V16M+XDA65DX8+dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX8VlzcSYkJmv2
 oq+qbB5AlVeGYNGJSXLgG6ygaR3kOd4FvcenD4yK8TUW7fye9o1rz8RQAJESBKJAeDFljpWyCrH
 ml2SG62DUoBjyObOdzWSvSFr8HoWzWE=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a98469f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9b4qEoD23obgxP77xDAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VokfHHiU5KLKMG7fUFyhyqZCtXO8UFUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> index ce7d958ca687..ef2684e23a09 100644
> --- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> @@ -1109,6 +1109,7 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */

Because it uses the same EC as Romulus, I would guesstimate this
isn't right for this device too

Konrad
