Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F583D47AB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882531; cv=none; b=sAbQVC9lq4z8+57ONO+sasPT0+mrE+J5lvZD/r/WXhXTTRbSxQoGltlogv2gD2wInKsRkbvIefOGO6KzoPBY96dgt1UY84qo0BgUyz+pn5KVdMLrySDJrB6ntiyTi7YFgCJo8fwd/V3rHErnDMy+gbmCHC2tDoqKwvced9o51uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882531; c=relaxed/simple;
	bh=ZAyWoPFfctddUuPphDNAJoMEw4Bt+RcOIxpY2twczyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbIII7LkHSIJ+jBsBY90hLeDLvhRqg/HdFh2X9VlqWhXrvqiE5UMTh5W3C1+hv3EXSEjXKVAWUL1tUI6QRxy5yxqtbBpjsBCj1sIYvzAImnH9vuW7K6EPdTXFt/ypfSgpWnRBNAWs8niJeHQaFtHzA4/alacJVKrXf9W3bR5yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHg/k9FQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4HYEM1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHg/k9FQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4HYEM1U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xO2E3476214
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=; b=JHg/k9FQQIxL6Zme
	V+B7tpU/dSampviXP3Opg6zIBx36OSrx+MAg/0p1StyQn/W/fspLPpxPxmwsc48p
	fwlqjaaRm2atIsx47QAvuty+lZur1dnYOczN6JY4qAu6RoVFzchuKjMWRkjy7JmD
	gdArz3Qh4zBpdN05SYsmhUUPTABl7z0Ju6VnFej9ugCwm7wHG9JbO3FML/vGvqjr
	D+CcrdHKkgLgw4NDWaG9tSl1P5Q6+b9iNnFFfmrwxvfxeXJjtkyyRtgBdk9cN1LQ
	ecRiAxDH3eYAgvWcqlZXDTcLJXk9V0tb1TX6APpTMraygQUxQuv9MYg9eO6aZ5e8
	Rvb4bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j964g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:08:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so37597985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882529; x=1792487329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=d4HYEM1UrWdfPcAqNGS9KdlTQ0rXo+uwgP01kurB9LCaqP6HpwiE8dg7Np4k/WwWbK
         GwlM22zpnpmJLh29MgHeHz1axCFV1MZbe7elUQU9y8AkqnoNRFTQHxCxrFwOIdJyzoXH
         w4RyOfpQy0Dv7kEoXhmOwPxlljoatBoWKzs6MHGBCc17lXUQLhc4eAEA3wIDI1rV0qcf
         4P5ALBlzR0MdHOphY7/Epmel6u/qkJjRiub2D7mXmf8uc/NbW3vdRVd+MMC0JoJNSb9/
         AD1+a4VJGc8VU+RQeYWENInbuX3IThgYdWSY9Ymyjhcassk9jbmRHz363B0xN81RmwS1
         715A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882529; x=1792487329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=w3QMkTYjpnRJ4uS5y7BVwdTtIQKOUkqlu9hvxDzTPlbUwef01BkBblUtZEBfzWi4RV
         J1NLZ+W14ofEbvEYTokcmQtrZ0y1txKXK5cRq9hqU76q2lNxg91kBdwO66ZwqVgItrGE
         JPsEmkBY+OxyHjIVpf6Ca+cYYiviU9Zi0t86NmSc2wRo7zPZ3ls+JZuoF4gx2n+ujnGb
         fyOquofPdQzQsMsXbVJjeRx1jglx2H5Pt5kt0Xs2BDXZJbt+wc/foUxzTmtbki0/bDeh
         2NRlZeVn3d26RAzKnY2jq/B+3EoF+yuAfStB22B5cgyKtibYZSnav6BbOmn0l4k1cueI
         1PQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2KfCFkKd0eTPWoXVZy2fj0kz9vpINVN5NwK7aLkDam2Zs5gl0wUzFG3nA4xO/GQmN60fa8QBitlIoF7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzcR/X4HusPKmTgqRaYaASk3cXECe5ACZrxUqpwoWTcRb2Q/Xt
	Z9dBqy1L00IhZZkHO0oZznU6LqGwP18uFkL8eCosyIc9aij+JStExynDbwHmmZNsY+yizmJhyeg
	cxGWitIiEnfhKbtyRLEHYJ7g8Wd2+t1hzbWKTTGcnGwTsOwQze26+5yQcpCo5GICnVt8=
X-Gm-Gg: AYBFou3oQAgXUrGGoPtg1Udbp2HsvlOn68Y8UpeeFvXGOyLkXG8t/MYhgS4mznWCSI5
	oTBgN6f0GCSp9pIhJBZNH4u2of006hTVkVdDa35Ek0MhuPXBKRcJ4QNyFWgg3G/x78NqQVhViFg
	CCIkNAVtImhesnhPk/TS95NpN9vL5hJJ4PWrGkAV0lUUTvOWDOc3Q+BsZvJPZmRUdiwtssUzlpV
	As55PO+/yg6XW0PcwM9wl1+TTL4lFS8sXWXWS7+VxqP3E8JH4FwcuBJaGqfT4am6k3NXO++UBYJ
	CgroVqXIM5co7lpONlql/MKcgOxLEm2NkKsP00LtEmEdwprW4rcpf6MhllvKz7lPYXtJCRv7LHX
	ktzHKo3EH5Cjrwt4zGcfcrA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264364585a.5.1791882528834;
        Tue, 13 Oct 2026 02:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264359285a.5.1791882527992;
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1451esm268591366b.32.2026.10.13.02.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Message-ID: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TQlajybxY5B6vUP01r0kmu8re9BI9RlI
X-Proofpoint-ORIG-GUID: TQlajybxY5B6vUP01r0kmu8re9BI9RlI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX+C4d8kFzJbgB
 nvVmcM5Hmte0modbFrqhhSTsFInZulBNomFZEWMIrX8aKGDGPSVQ6F7efa8LSqUIzZJ4Nntg32G
 7dv3/aH5tSXV/yUDDI8aHI6WfI6aExI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX8EZ2MbrGlJdM
 bX5p1OPMPnvwT06pojSJEELD+eRA26jONppaEk1jWb3RqtatD5LdSjWrux5vMsgqi/L09eo3xUw
 4ptcj5Z7pdxKrcFCZA756OMzt0xr62mAQE9X5a8sQqxP9Fy7OSW+qT6WnW+kPPwlymDK0+I/iZS
 +/fOwD9xxrYIPoJNK2RrS+TdY2384VhlZn5jreDB3WShbqOb8UJJM1ykrd633H7ATW5ZJGq3odK
 VyM2Y1qa7DxmmwYOmEsMf+mfWpdDOvrEfrwf9Yx9iSB3BzZ5YG/YICo+mgnopm4kfmTVHFuaVvw
 cWcfox8N2vqdzW83KYUeCkwwk3mdWBDWt2S1FBZlGE21qMcMHWardaYzKNJSz+HTGAzECtVbSge
 j5N+lT3L6lkRB2WfpPi4iq6KLuz8oiHgMiYX1Z4DVe4cgVG1fxYvksdJ7BTggR01RXs9Wjel/Yc
 dK7OrOPim1mAeibh6Bg==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdf521 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qJe4qTQoNDkUl2DoRwIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130036

On 10/5/26 5:29 PM, Maulik Shah wrote:
> To achieve SoC low power mode like chip rail power collapse (CxPC),
> the Monaco EVK board with four PMICs requires coordinated power-down of
> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
> collapse state is reserved for system-wide suspend (s2idle).
> 
> Add the system_suspend domain idle state, mark it with system-state,
> and reference it from the system power domain.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 539c9c80a808..b2978be6823d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts

Why is this board-specific?

> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>  		};
>  	};
>  
> +	cpus {
> +		domain-idle-states {
> +			system_suspend: domain-suspend {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x4200C344>;

Please keep the hex numbers lowercase

Konrad

> +				entry-latency-us = <706562>;
> +				exit-latency-us = <706562>;
> +				min-residency-us = <709987>;
> +				system-state;
> +			};
> +		};
> +	};
> +
>  	dmic: audio-codec-0 {
>  		compatible = "dmic-codec";
>  		#sound-dai-cells = <0>;
> @@ -772,6 +785,10 @@ tpm@0 {
>  	};
>  };
>  
> +&system_pd {
> +	domain-idle-states = <&system_sleep>, <&system_suspend>;
> +};
> +
>  &tlmm {
>  	pcie0_default_state: pcie0-default-state {
>  		wake-pins {
> 
