Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D413ACF0F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161450; cv=none; b=SWg/vgBet6vqdXXV1e7cAHTn+cIyd/JAIZpDcFJ1qUTnftBs4c9/sM3ZIl2PZQHYF5VRQu3VwyBFBkgr5wjFBNQ9K7PyAii6cG470EvF37PaXz9fvu9JEzdJSqM4va5PnUlzRQKCkOCgK3kyd9zOTznx0rFLlue3vlQD6COYZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161450; c=relaxed/simple;
	bh=sYzfFNiHLOFe7rtHuV62LOf39HE9HO6aDIV2YjmJrn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpuSkSdOL8sEy+nIYc9V0m+Hicxz6Zo4dvUYLrFks8tG+YVzXc62bkgyH+pAALgFSBD47To84H9Su4E2ZnEjoFeibGNYC4U4YLXqusAmzv1+WOh74icj6XSxSizjPw8SwsHDrt8+IerUv+FVpuB3G3IuIP+5d/UXZjO231NLasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNcyjGPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8SNfd5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNcyjGPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8SNfd5x"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7L0jR2374156
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=; b=CNcyjGPLSL3XwoLV
	LmYBVIT5YYGKzTf1I1o2Q15WSPWJaK76S/z8zPqm++OhVQ5oA+ImLH5SIizWY6wU
	Cw3hjEpiGJHNfhYOUGyrk6V/NFhsPY0TKs/RKXHyuXeHZezyDw9XhxAUtEKTX2EN
	+f/U6wlmoU/Ri+kAIMxRn6Fwq5P1qON4Z8NNTK1+cJAnGTUBmvOcqQnTnnDsh4dB
	4G8FMgczP9OYTIN4wIlwSwbtPAIejIaa68d8MXMU6f6L7Sk11Go6gY6BpiVWtHGU
	sqSZQOax8B68gKWOl5SX+5yf0AZMqurPfBoOZA/qBS3F4D3CdFjhlv0tcOlqWdWf
	AMQbhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r17a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:30:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so13698281cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161448; x=1788766248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=U8SNfd5xMM+waE73YpIJaQOyl4N23Fvk4p20N9JwV8RcEdJ9ZmbiZaddc3z7KKhJE+
         1SQMzRz3jsyTcMUeTAivb+t7V6xgDgkBtfTY4ws+kr98ppsE8SajfuxjzQgo+eMxWIZn
         LfsnoPuyaJGVQzseWL6BqoDUa+sRYL8ovw14jhh+mFnN1bbx7NzwJMi8FOPuGa6Valti
         efEtox1sqeKGrnrxXlUZ/xW28kaqGt1JG6jyAjDJO57OdqQ0j/LK6sEOhL8N1KD/lMq1
         xoyyQSDSqXFo/19vGM7oDgtbv7Fi1YTdlrIx7bodeIWIYlG6m7scnx/6c3bJLfo443cJ
         cVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161448; x=1788766248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=NAZK4hSjqudZ/E0leHFeiKx6HYNlzXN3mB3BbzM1zmphspE+/QlXZg51uaD9fnUm4l
         NK991DxYobJ3mhOXKp2GtxpzWKvsxMyjttQlE/zBP1+wMcZg/Zb7YahpxRvea8DzJoKG
         /tWq6HIPQVaOL3uZm/qhIvN0adtZ3N/S9twoiOoig+wXfefodZG5sj1lfyeRq/oIEPVt
         dzQevfBw8ImsNBj6pPPKpfzRzfsXhuZIu0k9+Ip5XZOd31BDwT0Kg1I40/hCoosxbBqp
         bSDbEM+qR8p+zhyGfKY/coixDO2dRDPYpiUWELd/Dk/93G33gfhw5jPm6WY5pqlJiOpg
         N7dA==
X-Forwarded-Encrypted: i=1; AHgh+RqPspfY+QBE3rL2OaTKDlt6LsF6SxRTrC6hL0HyBY8+4qhcevHMvr2fHNHbrzeAIt9idgKKpIXN0dGaW6M=@vger.kernel.org
X-Gm-Message-State: AFuF++mH+7H3yBqdFRdVhFpJcnEAHwQoov3PWDq9Vzz9eMJH2TsucYrk
	GaZrGE5uE3td37FrJmRJTnPyMsWrETEoebOuXydY514agg10kVJoS1KkDei9VmJADwpAetpQQqs
	LTvEIzksaWuiOlCjg1L2R4spKpFlgwPo4b3XdKacLlOtvgpla9YIlgdS3F0UW77WYzfg=
X-Gm-Gg: AR+sD108HS+VmbXOdDKgJ5lXhtjkKfmdyCQEvp9i1OB/A8RO+qD969+mEulMxCX3Bk8
	y+oOwJv6OmNSioA/Q1YlZXJw7NLeVS49twpzvAO56RmgvP05O4KU4njrgO3UWCp7YrG+boJwGtF
	zVPEGa+2Bd6Mdb3M6AVsoPD3p54KVzonFC+uldwfFeDkaVSQtjqPsAd27+COaccuHX5UdXnmRpA
	cKAJCoDie5lXxyqgs3Y6o6q+rreqp7sIIFra+Oxah+RMNN99QvWYlwuCg6uRCPgtruvbkGyDQwX
	Q5vfcINf4oiO2yKQIOEjAnJe9rJ65pYlUuBFTpj6wAnTDFj/OCfzHD4cOyZkqGM1WUen6YTm+AW
	5hdEATO3z95XRng7npIZ2Hg==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545561cf.0.1788161447753;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545001cf.0.1788161447226;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c4a7sm3209414a12.3.2026.08.31.00.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:30:46 -0700 (PDT)
Message-ID: <c751ed46-03ee-49c1-ac73-06bf32963b0d@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch
 overlay
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX1ZqV+9n+x05q
 oP9+OXyILooI9g1/ZMThW6hgDJEj7c6m1c01FoS650Z/ASBZobAVv2LlSF+g5jAZJ6OujBQnZzD
 SDEKzbeswrtCoupR5EzIXl2CxhU6mSw=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a952da8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=7_uUrrCgaLEmoTQF1WEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Yc607PK4d6T_jMjp4e5niE8a7kwQJ3T3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX+tJfiCcwbYQI
 Mtb36ixvuEEPveWHx56DUcPB78Jbw7qf7KSoYGbqQpnXICUvLFjAWESIPzR3DQZBDXkjiQxzUwM
 7EwA4Z+E5ANDvOvab9NytVD8/FFlC3gy1I7kgENvbgBreEDQW+VFkxYxAVHGiUms77/THwgopiT
 ITmz88ow6AxDqSE5Pef9PUsiaRT07Q5rrg5o56cGLjTU0XtHBGCgMrApD16YKZhUUzNTXOF8yxf
 po/7fBSEcoRhV4olhmkWsKeYdnZtwTuejqwSZ25jU7De++5jiOdvYsSzLWcR8aGG/3sfcA315vr
 BXOUPl3jC05KEyXLcbirGHfFxMAqYLEOURUdCm7SLtX5zS7CySliwAi4ExifdqRTj5I8c30htoV
 lUB/DDxaAhhDOdiz6KFe8R3d77K7ry/SrAbAMuAIP1V8b9jkFiJp4YEDtdwrVH3JcGTPtVWwO6Q
 OVJJdDD0/qLupbJVizQ==
X-Proofpoint-GUID: Yc607PK4d6T_jMjp4e5niE8a7kwQJ3T3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

On 8/27/26 10:58 AM, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
> ---
> This single-patch series adds support for the Raspberry Pi Touch
> Display 2 5-inch panel on the Qualcomm IQ615/QCS615 Talos EVK.
> 
> The overlay describes the ILI9881C-based panel, Goodix GT911
> touchscreen, display controller, power supplies, and backlight.
> It also disables the ADV7511 bridge to avoid a conflicting device
> on DSI virtual channel 0.

Copy-pasting the commit message yet again doesn't add value to the
email

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Let's uniformly keep an \n before 'status', file-wide> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hdmi_bridge: bridge@3d {
> +		reg = <0x3d>;
> +		status = "disabled";
> +	};

And let's not define new nodes with hopes that it will resolve to an existing
one. Let's just do:

&hdmi_bridge {
	status = "disabled";
};

Konrad
