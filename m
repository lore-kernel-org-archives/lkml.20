Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBE3655CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518806; cv=none; b=F1eSKA3MJ3DS4xvzrgxU1oJdkejKacdTf1xoBHNMcIrfFW3CjBv4aNDEvyNuyaRz7q4L4CJBemqLpWZSS4RVrZ4pJ8WokrQUW/NAcwrqIdiAg9CEnoDry4QbI67MRxhNtGs7Ocqo+KiMwk74OZQ8Z49RRoN1eHmy06pJciNxafo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518806; c=relaxed/simple;
	bh=XYtARoZqnpRp6pWQ0mD1w7dfGhDCmU8MYzR08TpKVbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJvda6L51X/N6Vddqufv0mVCIWxFW0R+Ci/PLVIa8rZVBR0PV8H4HusOU9XAI6S7QCQZCx8PzkRO9SdDQ3UypXsHGL8AbgeTQdNEwlm7GLx3L4DAZanZ+09eTsUME1oIzI1qg7KPXmnE0H2WVMOwGRf0yVw4J7HqaI0SbXIs4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeyisCkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fawYiSfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeyisCkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fawYiSfO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIcL564672
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=; b=EeyisCkwjoTDBjeR
	Cy/Fv43vFxWHfYx/BO5fBnjabBJ8IYLWTqnhKJEfBJRZYV1+DHZz1U7ctUxJ2nNq
	aV8A0HhvqpQq9L7vijg8S7kKX32s72dG7Sgj0YitoFtD7Jik/gZDbymPU7bQtMK6
	1cPEuRCyY8KAIkB/td8vrtB3Z91Zq+v/bh+mpB9K71isE+uByJcPbxLfkA+0y0OA
	iCHPMvDPqtBvDTZ8E7F3l6je5N+pUp+j3Vjqm1/LPy3ISkziZ6PzN1Sky3Xah518
	OyGgQDWU6Xw/QecxjFLcv2LA6SyOcY0+iG9NxGQNLF19Y6PRuRdMa8zCPJWoxiqz
	9lNsig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk9qc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:06:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so865464a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791518799; x=1792123599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=;
        b=fawYiSfO9UJRRoV/8Lttyt9jCPq1FJwy+I1LW5B4FUXDh4Fjty8xBBG9g3oWwfYLoW
         L+LTMJ6ixzYEsKrWupbeq82omo1HF2NNIdMhnWOoe9qthV1kUCZjeD2zwBtMtiKiTGDn
         M2iUtUYakxEU1FvGlSsYB/WuthMQRfeRAeiKf+NYJMKbe/2/Wx+TcAh4JCUpjPHCwuzS
         3ne8RQvNYEfq5j5T/ZHQaG8cc/R9lwRbFF3ukuT+ShM6pchPlUyaa/KvDadc/+zwd1lJ
         EOeEI+2YYQdcv/G+JVqa9+xRyiGF1vRUe1Qr4Oq6My+VVtVKVAogr+eBWvKcAyFagqLZ
         HKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791518799; x=1792123599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0LWV9Ad6BmiCjtUVa4F5rZTvC987knzXRnL2tmi8kc=;
        b=hWZi2AZ5E95o3l3mNSct7g6mdCkAJ5OWas7ECoRvPsyd42XSQIxbk7/UPK77bWJDay
         LE1BwKabjn1pMX66qqwuFA+5WYD2/aqbXzssp2nrwEmaNX6eHr2VXGpu9+4YuayqT7Qn
         ZE17XLzs+REPt+OFpQmBiygQwMkjFioMhf+WLlFqensdFL8ZVU0EdViKp63chiSLAYgq
         b/UtmBFrmHE/1jCgruIPdzv/qgczhtV7bW4gFdkTPr825oO+9q+XuxjN6PlVxZAvnSbA
         RmHlF601DAUWOUUUwQlWLdw2/af8Qg6ALIj+3LqdogDGaqzJE/nOnHvV4eu9Y+XufU+f
         UEkA==
X-Forwarded-Encrypted: i=1; AKwUvBy8XC6GuR7ai7X8AF2Z/oKIW37yjjuTuZkDzrKh9sc1tH3AA/vKfQXo1JeXi/MW8xPciyEekXzovKgQjMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLom8NXtqQb4T+lVkHFUYKYc5yHWRcJ1ZLZvrxhxuLxU1dMwgw/
	ufSa51nqDcCJDV1yeMzT6J6jj5/gIrGc4szXkSZY9VM2R7+pgI4RdjQ03dMh5GpqZyVCU5qnzvF
	FDRcLEB0pJyjUikDzo9MqfMIGr/g+4AK9hm56isL/a2OhjSxe9460n5CQ10xG8VwrL34=
X-Gm-Gg: AYBFou3SKZNfRn1nvaNyDVUr+GiODz5ZtlVhW2N7Cr7M95o1i8p90VuTUA6oIVQi7p5
	6jgOUr5Vbdmv+vOSFjHTXLQJiysXq/0TY6PR4geqTdcljqNzN6jIbRNbFwD4uNA3Wmu5wc6jQWe
	JIkhdPHPRoL/auh/tGjGf7EOTACNyMIp3iBKXJ9KRpAvESzrMlezj7g7FRG30cvlnhi3hXtldaQ
	vXIWN3VMy8DaRFXqrfAM74q/I5BgS6agx/OUSklygjsP3WtJ2SBhyUYdiHG/rMNdO1bD/KraDar
	YL4SHWfBLvCm7/oLmk8jE5YbznvuE1RzFiMhW1COQIvYIBvf6Zasz86Pui8WLxAQuLUuRT2t3bY
	4aPXBOoQOJeDkBDAS+0Zuu/ylaQZi/FGu6Uf/aq498jugz31eewHxIGEMVrs5WNA=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr662424a91.6.1791518798870;
        Thu, 08 Oct 2026 21:06:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr662396a91.6.1791518798366;
        Thu, 08 Oct 2026 21:06:38 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm1611384a91.13.2026.10.08.21.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:06:37 -0700 (PDT)
Message-ID: <d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:06:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/12] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-11-b2c583ef50e0@oss.qualcomm.com>
 <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1Voqn3yFse5t82UOX7MVafkhL466BkEDSLVRH8OK132g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JzW7tWVYrsG4jgNBuAlibq05jsqt_Adm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfX23llfh8ToniQ
 WAKoSuq8Rut9TbbUSjFU8CsTue2wpheDwHmMO7iDfwzP2yD7bb8G+mLLjzxTSq+DKHu0T8cnLbD
 boi6AgNqXukTt52jYR8+5nl1jShorgE=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac86850 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GUC6nXMZ9ruFzsaAOnwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNiBTYWx0ZWRfXxaq5pSZQ4dFx
 Lkf0qMCE/4JTW6HCNFehwaJ2vkK7bXXeCLfVdL/kwmDgt4NzyBS0yDB3oglJMTsuIQfJkYdxcAY
 1R3sM9m5bbx9QOHNTyONEkE56Iz/+dizTgQv3hsYpu5P0ScVrpZ3kckecSiglgRCAW4aDfq9Son
 VXKsVNfrUNSwWmcapDNP5hZpgdTB9a8aYyWpPssIAy8hc37I5yACpVpIgekbSR1uk5VAQXCd/Q4
 0q/DKFbNc3kvhLXVwRb+us2p97EtwEHplFgMKVHzTOE9pzfcS0XTaLJKeB+vKSE/pOlOnd6h1yO
 niU7p7JSJaJPPo9GIRAzMEgL0AEfCq5Us7piEsDTWhsg6ZiHerlY3nAzD4OJ9ppCVlznZw62CDM
 c7rqPlriF64+VCxrtSwKKJojG9BSRCZFs2p2eMcRs3+1xKpBon3Eg4brMvWvDOmGwIUrHp42sgP
 ANgxJ3CcNG4jQbWgtlg==
X-Proofpoint-ORIG-GUID: JzW7tWVYrsG4jgNBuAlibq05jsqt_Adm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090016

On 10/9/2026 12:16 AM, Loic Poulain wrote:
> On Thu, Oct 8, 2026 at 9:14 AM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
>>
>> The first bus has two CCI bus master pinouts:
>> cci_i2c_sda0 = gpio109
>> cci_i2c_scl0 = gpio110
>>
>> cci_i2c_sda1 = gpio111
>> cci_i2c_scl1 = gpio112
>>
>> The second bus has two CCI bus master pinouts:
>> cci_i2c_sda3 = gpio113
>> cci_i2c_scl3 = gpio114
>>
>> cci_i2c_sda4 = gpio107
>> cci_i2c_scl4 = gpio160
>>
>> The third bus has two CCI bus master pinouts:
>> cci_i2c_sda5 = gpio108
>> cci_i2c_scl5 = gpio149
>>
>> cci_i2c_sda6 = gpio115
>> cci_i2c_scl6 = gpio116
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
>>   1 file changed, 303 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 7e5106865e7e..710af0597aaa 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3749,6 +3749,117 @@ port@5 {
>>                          };
>>                  };
>>
>> +               cci0: cci@941b000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941b000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_0_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
>> +                       pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci0_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci0_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>> +               cci1: cci@941c000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941c000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_1_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
>> +                       pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci1_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci1_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>> +               cci2: cci@941d000 {
>> +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
>> +                       reg = <0x0 0x0941d000 0x0 0x1000>;
>> +
>> +                       interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
>> +
>> +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                                <&camcc CAM_CC_CCI_2_CLK>;
>> +                       clock-names = "ahb",
>> +                                     "cci";
>> +
>> +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +                       pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
>> +                       pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
>> +                       pinctrl-names = "default", "sleep";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       cci2_i2c0: i2c-bus@0 {
>> +                               reg = <0>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +
>> +                       cci2_i2c1: i2c-bus@1 {
>> +                               reg = <1>;
>> +                               clock-frequency = <1000000>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                       };
>> +               };
>> +
>>                  csiphy0: phy@9523000 {
>>                          compatible = "qcom,kaanapali-csi2-phy";
>>                          reg = <0x0 0x09523000 0x0 0x2000>;
>> @@ -4459,6 +4570,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells = <2>;
>>                          wakeup-parent = <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-pull-up;
> 
> A general comment on the CCI DTS patches: why are the pull-ups enabled
> here (for SCL/SDA)? Do we expect boards to lack the external pull-ups
> required by I²C? If not, enabling the internal pull-ups seems
> unnecessary. Also, what is their effective resistance on these
> platforms? Aren't they typically too weak to meet the rise-time
> requirements of most I²C modes anyway?
> 

Thanks for pointing this out. The CCI buses are expected to have the
required external pull-up resistors on the board. In fact, the above 
properties follow the established Qualcomm CCI pinctrl configuration 
used by other chipsets and platforms, as well as the downstream 
Kaanapali DTS.

I checked the Kaanapali pinctrl driver. Its CCI GPIO groups do not 
define an i2c_pull_bit, so bias-pull-up would silently fall back to the
normal weak pull-up.

I will therefore change the CCI default states to bias-disable instead 
of relying on the internal pull-up. The required I2C pull-ups should be 
provided at board level; the existing sleep-state pull-down 
configuration will remain unchanged.

---
Best Regards,
Hangxiang

