Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7427939EF20
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820946; cv=none; b=IO55HyGmD+ChM66olKl8iAlPWbfz4V865R2XuJlgz80H3ZB9TnsAUEe+txV6dfutaBlJXj0lq62qHHdmmARBFvAZBW2E400xil6DYz1PD0kXbr5Qjcc/zQ0gxMyfituZKSUM5PhtA/sRi6RT24lyGCM3VztuWM3yR141RR3rkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820946; c=relaxed/simple;
	bh=8CAIVnvJ/rPVzHy5yeUahkVZQrOPcNAKX1mzVBJ3LXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwJL1kHXYsuxHVEsj0hFAmlSQB/DRFc/1+RSxPbHUlMNzr7p6UqMDg/Liq3O3+Vxv2H6R/dWeQQdxdV0Uk2MWuUqoVXGhCPEnEP5HmRBFSsTyn+48Azl9eermnmLqLQ1V1yop7AUF5RGxOS7nECPpW6+pOgqcDkxqcUCJeP/of0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr0FKQ3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUjvswAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gr0FKQ3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUjvswAN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf4Jh1895687
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=; b=gr0FKQ3DyCs6RxEU
	YQfBCLKqIkZRp7ceAUtX4hqD7nfSvOB8cgs1LI0wi6LAaheUE9u1SXsHnllG++G+
	bb3+B2lqp1vcjYZ6Bbv1vcbf1hOrIhYg4MBkogty+lzjTKqPfgBAB8c0E4K1RJ1Z
	mZclxaLAbLs+OyOUCj7aPuH9Fd/t8ob87HGhRBddmT22jRvxT0dY0QgNhK7/7dsY
	Gq0dMgeOqkCXlkKZKxOvTwAFQBsYxZCF0CilSEX3aJaInQBdu4IsBIpPPB525E63
	ZIX8NTtIKDjVEf9Pv7f/xpL5vacqH8+Rp3EFHYmX3+c67c7JV7JGbKeYRrWSI/b8
	3i6Pwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ksy67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:02:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so27865485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820944; x=1792425744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=BUjvswANOpIMSAcQiaaZADshbLdgU6446I5nZGBnS5FibtPQxCTclbXdPm6gtD3ESl
         CyIACOcRUUKhsFIIrfGv4+ccEK8DJLOw/HkQFvqdO1pnCvGCPActTqP9LQat1rKnT4UO
         vMpwgQxKsQyZtuziJ6tXOAGqsP94dxIgUiFky3c/qGgmLuwIv3snuDABQ16hPbWlGb0u
         YIMn+rE0DK4YRw5eI/Og9uItSiK1mchNZxj4ezQxZZVQ4opD6Acez0WU4igzvR0GrygY
         oIevBZH5WZhSZ6K5EVYgkfGcJNSjxigK+OM9NlxJrqTUNziRTO6926HlA7XZdtCLBXHs
         5Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820944; x=1792425744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=RdG/5PXPQ6soOE6S0UggzB7ZNFQcoaL79f4HGR1IkIe3YlGnpl6Zp5mAAaxDvoxEcy
         uE7pis7JRz1j1NPG8rEaS83WEP967iOoTBXzxppE7i/tZbVoupNdO0zFLxEHOOvy4ZcU
         WdsGu5OUUeOoSLxjtIh8MNxm+LQlr7a/T0fMmaVOXG6O1tQFrSY3TXEX/IQzc71xM4yY
         Jsmzx7bgHZ61wkm9yq3TCXZfj9jkaro5YXNz+Axdq9BUe2aaK48oXCuSg54J4bs7yGsT
         66+3jpyg5BVsGkXERsx0GdwZW3PK6D6u1yzrE9W8kBuRZSTlluaut/P94QrCBhDQ7/eH
         7UAg==
X-Forwarded-Encrypted: i=1; AKwUvBzCHqHfD54GBKdo6nL4jFWiQ0vpWr1PkTsHzTq7njkiBcLjUPuOO90de+lDQnPAUwAXrfjzw0Suz54Jgi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmOc3DfpBctoRKPDJZG/ObcRFOtexJ/oWYm98rI/pKN3mFwx1a
	4chm80YRkclcjVFG5fn+PrY8p9CiaVGU5Nxk6IDhHNJExFxEMQSYjTSVaBVHP284VqaXU1ngxcn
	fNLsXyjEQdIC2PFf4LKfi4lYp4FyygQw44R6b6z43h96/RlNtfE6Fdh1R/ZmrJu4SZi4=
X-Gm-Gg: AYBFou18FGvkscApybuDPPYyAKJQ1Blbt3DW5zDuhVbS+Si08/F7prVV8H2XQEuoEbe
	L4Avn1XVt4GPDIBydep0WUhN/ug/JOjdi0FY4kVN6M6S4e+7Z5bycKwGyo9dnLj/XVArSl02e2R
	4ubTh9PLU1KOas+alN1hIbEuGcFu0eHmnxmT8CCrv52T8BoNLHeScithqF/hiLyupI2LVUjf9t7
	wahyCEl1cHoqO5wjQqwmIss5nX0s0im8QDVvARYVdfVxYJFB2dyeIfexYaPcD70GUJZb5VVlljy
	uocfWmvrR+jboopk5MQVbx00ZEfd0R7M2zmFBHDKDoRReiLRN7X+XcEJXtPjHdv9QX3bKJNDaDx
	2E8y990J2aPLFvK2s211SmQ==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035466485a.3.1791820943727;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035460985a.3.1791820943171;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1bbb3fbc6sm1758143a12.29.2026.10.12.09.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:02:21 -0700 (PDT)
Message-ID: <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        danielt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-4-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012152408.3729237-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXwuebs0jT9DYE
 AKMVpOFvTpA57Gj0WYBrm6KcexA4+0z+7UaR1ztJDa6ebpV2Bhj2tSoJomH2WhYdOQaf5omQfeW
 ykPlTGP/LI/cQo/M/qAPNEielf9yRexnUgo1dcQcZwanq5AgXTVCziv5wdEDS2HIx8uwdV5CotQ
 ic0q05ke1U5JClEFOV332emzFdGwMK67Ygckz5imKXJPjYmcPo53L/Zdh7DShBZZvWpqG30Fy+M
 SPEA4ZVVSXrhwo3RNo+DUdsMbyeG7gA8IlAEqdWG0gAMQ7aGDyRw353LqgYinDYXKvmiuA8Rkt+
 7lxBMDED7UpwV0VExjw8jzVFMRC6rLu1BcMVSJ/hUPjUbdFhbk9m50UaCVz7OzR8AmkrFsP4gLm
 eizZPOvlCn8T+pUqdi6nwKr0OjZ86JyTSVQ1H55s5gOGiCIAjYjsGZgT8PFDrU1VMeHC46FXNp2
 mw/ZObZEGvKNvCqJyOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXyEEPOUArzXjF
 iSRhQ4N3jmOXat4STJHHdyG1HxPK/BeVP87hXNannNil892DSGv8OJyvawamS8cIIr/lMj/+BW0
 i9sbDC4KL9nJ8hfEBwaDz7ZF2xjrU6c=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd0490 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ee_2aqc6AAAA:8 a=kRlCQ1XAc8RtWyVnr9gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: I3OtzjqlLjHIUdO24pF21v2HR5h4PDHo
X-Proofpoint-ORIG-GUID: I3OtzjqlLjHIUdO24pF21v2HR5h4PDHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120063

On 10/12/26 5:24 PM, Alex Elder wrote:
> The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
> to the definition associated with the chip.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - New patch in this version of the series
> 
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..b8d290eed2f38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -891,6 +891,12 @@ pcie@0,0 {
>  		pinctrl-0 = <&tc9563_resx_n>;
>  		pinctrl-names = "default";
>  
> +		clock-25000000 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};

This and patch 4 should be squashed

Konrad
