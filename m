Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93B4FDA49
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897047; cv=none; b=SOqo1yfVbC9+as9INrYvTaIlp9ccMuhVhXNKxQNYytUWEeF8Yfhv7quvFTcO2Eu1c3X7jyzHL+sdMA1tTCEACgTjbW3hC8WqlRWdpKUsO4bUKckVr8HSzmFmLzXIZseYs/pAb7JCbCxCDyzuXpBDWPVCM+jV3G22PEKCOYXC2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897047; c=relaxed/simple;
	bh=bsRO/iTejdthPjBoqHU5n/YPihT/szZz4iV8OFYt/U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNg32pPYuySBRn04Ixq4qO2zgIUMvW/eoUZHzOL56XvBbYfpZU0cm7lfjknDpJYc4hTWi00mdcu4cZ6fYFBaZTo/ws1dUpfBazrMGxt2D9kukcouL3EJufFSvegcm/r+2hGaMfq7eFjasTIC+3gM29kyMcY4VguRe/wDK69K9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTA33Mcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwMYlyMq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTA33Mcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwMYlyMq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D86AhJ302840
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=; b=fTA33Mczwo7uqbLa
	LH3dsq6Lsyq6TDBA1GXQowwDnxi06n3gvcjrwKMIMX+B/rnk48eRtq4Jf+gf62Rq
	lBgnGJOc8pCNZrK6+8qzbl1IFg/mn4jMqXdUTEEQC17d1PF9rKf0frcj3eoa40eZ
	SgOkBRtDtzuVvyhqNYw8AuE3NRqRoYcpTLKdkuJ+8RBJS+MqTWwPUn5FLAFRL6Wr
	ikBLkJySenp69k0LfSP0kLMWJ2S1gzT939m3YHlHI9NZ47xPG4Y4xUtD3RHZ2JWt
	NBTRCawxFyY+seJh8PCd8fs4YU8lGXNOJm5qvoIIHl3mQNfYbfS7ks1MsZn7AUGt
	x6YSYg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqb1eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:10:44 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b04ea2d440so33304207b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897044; x=1792501844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=;
        b=bwMYlyMqodTUcQGE3/xN3gryXPMlwqizy6anyjJDUod0tPnWk7sdqHIbFf2WjUd+sh
         2h1aMFIGM/SdEy7lPCyGoXuEcZPii3qRQ2zKYLubDm6+Nukln+W2JqzSTO2EEf29NyiH
         pTAs/8DE+nbiDARFIi/D7BNZzT5GA3ol2WNJDoXQ3tlpD0VBqbCipqxRVVtdNJLOh+wU
         dN3F9b/6yfETHNPGD+T2vfwYOFTz2SNeXsuaeKhB7Ute+AVJsBL2TMMZpAIBmu5Drtyo
         8vsrulebPYF1QTBp4umileApCqJ4UGcBHuV41wccgX3ys2HR7FEcoEPNjD/vUOoSssoe
         lY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897044; x=1792501844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USyrGF8Nhnu1MYzPEZbObCNEl7rw6nWzZFLMaiV8C68=;
        b=LUFzz3yxZ4bfzm0CQ+FNP36d/f1iv32RlhIPNhI1qBJOr8jpYXbevzkb3+sRZmo38G
         V86qhKuHUZSnS5VUhMHcD15RLL/sMoz2/8FvVzgG8Tr+ukJ8Gdpw6cHdwsaGLaP4cKOu
         SmFFQbaaXIgNuVNynTG5aAu9CJpOMEeu+HqkS+AIlHtJw1uHZ+UDfq56DDhUUTS9TxoP
         qBMG8BzEKepsdOMmKafKGsfLvcp6k2UbAgdpevygraYVv7H5ioBQ3gPVJtuNne4p+LmZ
         kdct7MpUg6ild1K4Fs7px85O4ONZ8L1uH2J4w57kPEVifvi8Gm+WAEHEO5VJADOeSPhE
         8Cow==
X-Forwarded-Encrypted: i=1; AKwUvBz0/LRJJhRBD0GA1a2P0zk3k/ASWs9UPY+vxibe1voaaOcRFmMBmd2Hlg/xc2lC8JDuIY0HAB9i71wUA4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvYUDj8MSZbDXlFXgJ1wTs+cFW1ZovWcKfdvZOfTBnRPrNBaqE
	NXuTzCNYlWTKeCkjTyzZNYI08l0AGwspAlpLDOP7B3fTk4cXYU7z83EfqU00or78Ut0T7qDMfdA
	W3NkHfk8kRmeCVih+Kh+lhjnJJAI2fNANmUFhmogfkSf0qGHkLECc/VZ0FuX5dEqh/FA=
X-Gm-Gg: AYBFou0Evn9m7TTEobSvyx9q5l4bsXJf9+QnjtDbPchf80jZTdFzx6wclo0fm7uWNY2
	3L2CgYn+TFfNqTNBvlCQ0GykCLIqejhj/p/L+3hJNpyQUT4b8weS6ZT0fvpd2UuMlJR9TWh72TJ
	dn7+i0sQZ71elWdIPZgBsujbkQ5vIHcVFbYmeIJ0OQ9ztWwYeYMwDToJCB6Qyp/qJ/dGCsLNW00
	H7NjBQnQ1OzLP7fKtbpvbccSki/1JfGNm0rXiYmvOqp8bQc0bdOFKg85rAer0RClyvSIhRgROiO
	AZjxZ1N102/dAeH4sFduJqVG85lP/2/S+vhW790D+Ox6yILmk49uF4cLb9L8V1U8UJGoH8IVT/7
	7pWbJU0zv9VCyTHk01RDQB/1l4tbSFA2MnsvOQP2FKis=
X-Received: by 2002:a05:690c:6603:b0:8a7:d419:e275 with SMTP id 00721157ae682-8b07eded800mr38592967b3.26.1791897044203;
        Tue, 13 Oct 2026 06:10:44 -0700 (PDT)
X-Received: by 2002:a05:690c:6603:b0:8a7:d419:e275 with SMTP id 00721157ae682-8b07eded800mr38592897b3.26.1791897043515;
        Tue, 13 Oct 2026 06:10:43 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f22c8d5sm43613047b3.33.2026.10.13.06.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:10:42 -0700 (PDT)
Message-ID: <f916924d-a1a2-4d58-b5e1-ffeba9fd0b5d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:40:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXxi6jfOpreadH
 XNwACUoct8tOjtz2O7xhHsELEx0a45g52IC89QVQNStmgXoGK05i0NK+0Hhv3PoiSAOevc6SZfv
 LZ9KI9/KeV51mopOwLMjSe2SEJp0qXfQIspvDQuVfiUguVTfrd1UVaGG817b6J0tbQC3uYKtVGm
 R+LEDs1C98ZH1M3lsG+amDAmJIa1cdvHFu+pgWDa0LDDzjusE+4b557uErgijazphISWo+lM8pl
 Rz1kDGddjfVrizJpjSmgPxr04hffloI9x+6NlvsxGHakbohTomsDuKH/ifPpTSz3EQzxFAs3V7Y
 +R22KCHgByQf7C8dQzB2aNSo7RH3QCn6/5dluIpXzZ1JNxSeAszwFfFJTEsQcml8xNIxN3h7v8o
 NUQ6h4vMXhX88N6ZMh7fcT/L2HbXprwlNIRpR2YbLzb3HC7mHQUKakMN5WaJiqia54pzwIaleYA
 e1TT0dnZWGd1c1qShPg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace2dd4 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Yv4T5JIdxMWIWJiGo94A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXzhQTJI9BKn7d
 y5xOxYFGVg4Er+KzKpP9j2daW2NdNVBp48+DnmzFvX8yUHuNYKf5Tthx7ByJQQbUz9sV1jOnBGR
 9NNddoIBiSy0yQovqGkPxsoEhn82dLM=
X-Proofpoint-ORIG-GUID: REtU8fFzl_BfLfWwLV_EEdg4omB98s5W
X-Proofpoint-GUID: REtU8fFzl_BfLfWwLV_EEdg4omB98s5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052


On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
> Add SPI node definition for the QUP SPI blocks present in IPQ5210.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index fdfeedcf5618..cf1c9898ddb8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -418,6 +418,19 @@ qupv3: geniqup@1ac0000 {
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   
> +			spi0: spi@1a80000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0x01a80000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				assigned-clock-rates = <50000000>;

opp-table here as well.

> +				status = "disabled";
> +			};
> +
>   			uart1: serial@1a84000 {
>   				compatible = "qcom,geni-debug-uart";
>   				reg = <0x0 0x01a84000 0x0 0x4000>;
> @@ -456,6 +469,19 @@ i2c1: i2c@1a8c000 {
>   				status = "disabled";
>   			};
>   
> +			spi1: spi@1a90000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0x0 0x01a90000 0x0 0x4000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
> +				assigned-clock-rates = <50000000>;
> +				status = "disabled";
> +			};
> +
>   			i2c2: i2c@1a94000 {
>   				compatible = "qcom,geni-i2c";
>   				reg = <0x0 0x01a94000 0x0 0x4000>;
>
