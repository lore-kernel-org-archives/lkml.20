Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620750;
	b=nBReCQmyMPuCDM+BBaD0tyf+rnmJK/YBh9MoI7owi/VFg/ZwP9Z+ulrqmhogQ1fSUBEi
	 yI9FYNFUa5GOFnvJgwz7fwp6MLF4U3pzG8+WD+5Ai/EWwva7m15+WcY7RVYPUHk3xcbyP
	 AJHFdvfBOa2G2A/X1sqS5ENUxpq+15iqYGVzVSBU/FNsnQS6N8szXWUXUE04NK5YfGtbj
	 eI1uUH8Z8V/QEO0fpg69syybbWHjoIsONmld4RmVcKG3WdxblWcbaiCLu/s8my6zRWXo2
	 SJFRzQAsqUU1CcvC5j0QvdDDfG44OLYY2O/8Mxj0762+p6ENOexHJbpo7wSPpL+UqDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
	b=rsQpYmf4fqgmS92j+yhtCCMpL+gXZQhwd6JDZcxezC2VfQqlNMFNDoxOm8tWIduFMNLj
	 +TRm1LDk6PUbx7quX6045jfrqTZgOchAkNzkFVgqxx5GbY0Ei0WwgV7juTEXbRluoyXSO
	 FSUhJO2wikJwKlul3oDpRWWRL4/tIqmE1I/0jcRBhvkbjM8RiEF/1dZmEDMo3Wl92XlM2
	 vaYaQsedDc3tb4bo0eaY2V+rtox7B6RjxdMQUbdV9FJJGiuG2rIqg9PIVY1unTp37hchJ
	 i5maNbjZ2K8VECtn2Wp9SAeOrtOC1D2S8fVmU3e+zJrgtD0WDMk5w+WS6WKp+OISKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TJaXw/rM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C7606B175
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73C7606B175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJaXw/rM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29Atsv3431819
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=; b=Y8oQ2vyCnVpJLAoV
	Led4OW3bjQvC1mj2Qu2bSWaQpBQdXQKp3KzJ3heOvu8tyByCf21b1XEZiakNeCAE
	UEmDXpvrblhGfOfVO6AzcMOWjwsA3PEXZJei2M6RDV9iR3b4diFzWPkfBQZKfHcq
	iGJ1vKqhnF4fEC3DbagpVJ0hmLN8KERLnKhPifWCI0MweDvJ/HLo4GCFPtuws4pB
	tRDK6w2BfJL2iYEPEaVXpaU0Tq/aLe/jgneSLiXO8rBFgjnY248zHiC6dU7yDNcO
	fLKVb6IxcpKzTVB3mlBaUTZCfQPO1IMSC25jc2XcyaPgAtYRXLnS8Pvo1XK75sVt
	mC7VmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmes554-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:59:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20441196d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620748; x=1794225548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=TJaXw/rM8ByzZWujiZNoAEf8tdZKi6QXE/T6FddaY9cB4VwxGoLmiKwaYSryjLRSbG
         ookcoHWZjLopwUzGW9Amf3429aTCTkWSElKvTfRuqCzCgJmreAS9wlYptoJHuEaDZY5P
         lDYMZVOA/ECELe8eYMz4ZqghWocndBJPt4rcvEsMYcUs1wOFO/MRbIUEP4u1BvkQ6HBM
         WihpPQDOOzyT6ejqAPGijmIO3LCk25M4O9PTZ0D5gQLjciFfF6+EKVC2AO23qox2/h4j
         07iWkmxyYvs6MqHE3vojwfEggzYEn3b20cuZDYyK2TMNNutTJ1XIGvYF2oWYwFQAgVfW
         OILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620748; x=1794225548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=rdFGDX5OMO4ZKmIkqHCuxz96xRs/tpOZy2bEN4QWk7vZvR/cHWaoXIDn8U1b3+cC2D
         MQpjxDZupTuRuV1Dr34g/rJ7DilHbhV/AjLQ8anoSZW8pfW1AIES1R1kCZf7VIN+D3sA
         LHWxVPmZgTsmasLJnJnP5zMiYRgywLRb4Gt0R5tHoYx3nYpSI35O/e1DVAPgW8FgDNOJ
         eqCHxrHTJsUXeqKp0Nu/z+VMgSTbx8GeYgbnHc64nf83h83IiQ+yMKcShC2bb2dNCoC6
         eNbN0iakvVKSjeOO/evATqHwZogyZHRaYsD5j3WWO5aEqEbiOyzFoFlM/zFEm/r2kOY2
         SdOA==
X-Gm-Message-State: AFq9FYIR5wY/he+ANcYhB7+eekovA8e7say+ifu8ie3baeqe9ot/HK7M
	nJiMzNfCR+VuNvuQYBkRv+6mlTII/7tccjj216w/YMmWiOPsOFOwTYd3Cv6ryHVbNsE8XYGLjBL
	4ism2kRILMKodGeXaHiksA6aEaUG/AepRCGc3aX+8SyV8JXtLXGI1tp0v6kLz2mCx7t4=
X-Gm-Gg: AYBFou3VzqUtp5XZ332H+BI2PqUdwk76nIMQv90R2rlkoBwvI5ET3FuDZdQmh263nUx
	h8Ube3NJtZOy7ntsd/KDE6EH3rqmMQxEXpq6mQWdR5XKQE0GkvJ0i/7MoCIhQLBr+sN/KSMPsbB
	HErCpiaWyLf56VJNQhzUNimPgnotnS3QbQoroK3UbPTBMhdFUAOxGtxJwSCXSCiOf7YKBe1fbnC
	zmgUMS0zTcL8BpCPgKIsaUBlcuaN7RWdcBIc0knBHiqkmodNaBmp7hVoVHOFpKelPbnH1X2kAE1
	5kVqRb5VYDa/xQdFu2LSm9TqGwmpZY5PtC6/Bnf5G0XUfMIsKD0p+xQ2Faj/RJgpvujAaBbZqv/
	c2ainQ1zWXWPrdpNWncNQMm3Cfdajv59pwgrAPjy7He9G0NgIJ+HaOXc/30dlR7KegXXyjYo=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610769685a.1.1793620747828;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610762585a.1.1793620747264;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm379723366b.20.2026.11.02.03.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:06 -0800 (PST)
Message-ID: <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:03 +0100
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae87b0c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=yd_p4N631o0H4GjTUx4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX+DWdGrdXvQeS
 twBPUDu309t7qPXYCNHxoPozIVEII11jsHTKzYQ9Na0A0gz/pTrVZ4zpEdy2FjxALM270gnKTKW
 TODzSPbhROWOyAFVfF9K2fqLvPEST1THizNlLzBZ+e9LG8Mf9y9Rb2fBBePd88tI+baKPsD45dR
 pef0b6Ov5oK/fUUAOOnOdARqI6RyWpsPakFGgpnE/ZvdWhKtQ2uuDvFyS4GAUwEpbehdLB7iYCS
 0C0GvXY2b1cvepsn4gn7QGpUv1OM/lfZgboY53DuvLQLyh8AcPEuy18xHwGlL/Pb3DvjLZGlWrw
 JB5NMBQqqPJY/Q1F1LhBmQ7VReTg4wtG4gxB33BYEdKvFYM7iFSsdzOnycnsFyPCRrwjEVQtMLQ
 Af0yWwLDunP6dVLGJYKsWOQa9hh6iPy5VdrCmQipIyBkHRikZq2bm+2pats6633QFbkjetGPA6g
 B5LmhMZIbefn2BME7Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX09bopGLoh6DG
 ZIUszADvy4UVvuMWCB6AaTWn7MeyYyOPjOS8ruO3NA3aVP+LBBSeinHJn2yJ32C5hQaV/Et5KTV
 sCon5cCZZ05T156nXLbHPj68JueIMh4=
X-Proofpoint-ORIG-GUID: 7m3dI9n8TIa5HpXH6j5hFrqLKyWOJNcU
X-Proofpoint-GUID: 7m3dI9n8TIa5HpXH6j5hFrqLKyWOJNcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 1e89c9798edf8..ce351a3fa8727 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -77,6 +77,12 @@ memory@fe901000 {
>  	};
>  };
>  
> +&adsp {
> +	firmware-name = "qcom/sm6350/sony/pdx213/adsp.mbn";

FWIW all other devices have an uppercase 'S' for Sony here, I'd
like to keep that consistent

Konrad
