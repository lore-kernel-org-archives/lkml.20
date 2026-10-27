Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074102;
	b=OafA9qa2s9CbLNDh81X+cTOSrkoU/hpv+DLuQK62CUSyzZkljo3UKKlf4sXn8bnR9KAY
	 YFxzppPtpfI73AE/GfAXcHlt204ZQ7cwCVoyus7H6xCsidwzfBs2PHskrj5booXRV0JNx
	 srWbVhYm+Wxs4H/GUbd+kEglebXN5CzKIA3lp1i71GcFhYb7OS9uXUkUtueCP2e28qhzs
	 DUhCQKHzJqtyxG9383lG9Bwpwf19KwthzG9uDbak2jTQh4RZnQA2/fG4o7YHReqmL6XGO
	 95QOkC0RVQSwiRy931rSBk5ubYr8BvGegOtgmZwbKdTf0kI3GAVOFoDUtIAwiXoXSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
	b=WSQXr6VY5rI4Ck+9iDNEhH9Cd75IqN5pA4keoI+tiG9bIs++EW0R6ZhiirDCBm3JueJi
	 Jn1eWpbRoBOgkWJG/3kN5audvZKfCxL242JeG/ALjOYBrKZBk3onQ1L6gHHQH+0y9fhja
	 Bp5iqYigSei0gz1h70qtQws+5NKENQnFgfPNqS2/xuE1yqfb9meTFQnmjAfXiQ34qd90P
	 uMswc7CmVX8KXX5cg1AjErFScnHcos0s32iPlEE+W88zNYW/79t7C0OoyjvocV9pxjdIL
	 dvqrEXnVku+iJvmqUZIMyKkaUjeeEN7Vd2IGZhMTbdteYSmcOPSYQNNS4xxGZBzvEdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EI3o1ZeF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pq2bvAL5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EI3o1ZeF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pq2bvAL5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F45R1421268
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=; b=EI3o1ZeF5MDC+pYX
	VaemFAd4mZGQUeQXCmhGHfBbomSWN9sXVjW7HWZq289jFJ4NmrY1kmj50tTCmc1L
	pR403LTE3foQ5tD5UJgRs0MPIZryrCYtIWpayVukEt+rHJu2jgZIozdarvKxTXF+
	rjZoSOXb3CkoO6ARlnUc9PPBeYdyQHOGFcyPKhp1UWCWN2T2dEZdmmtiVrMqV7fa
	eri7SSoZUszj1OqZYB5Te+gHoz7aotwmIZfgp6O8zqWx5Bu+hvdsLIyJsCqJb5P2
	J+j2WNMvGPu3+dht4i8daLwDYPAZlT5OvfoKf6jnOGYm8uCuMFYPSernMlVZE5+c
	YRjgcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf3ntj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:08:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so4417220b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074099; x=1793678899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
        b=Pq2bvAL5JYldd/NNdVvFumNOEZFBK/gBvp3zr4sUt0zkNAXyj/IITRxwhjeY6WrOOV
         O3SlB41PIKZt79pJTGd5MOiSMpHADxKtAsFaVbyq8tybSgiUf70jyHtC/4jl1wYWUZgn
         qxTT5hz6oEnE0ssgkmHWSEoKvT7HI0lSdXlCtRmkYiF0WfVh2kuQONZvog9NQwfuEYvu
         mUQxWArbi8w/f4aASwvwhN7Qk4hhNph538UbDfbhF8cXJgEolv8PYE48d61fYjWS+ttn
         9cdLH5kuoYbsAK6e8Aq4+aEtNYzPucS6icdfnjH9R3IbG+6sPvSFffTHauCuhEIRs46U
         uplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074099; x=1793678899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
        b=JdoomHqw7K2povYF2zSX8FLQYgWOSnGsADF/30cSCLcciMRlGagFxAs3WijyiR8Mru
         VS1gUcmyMCLtWHGGHlM/Iai3apXGBuPKFrO0w9iLWhusv3a76DeBvG+JWiZ21oK+b8KE
         i8/fYpy7JguYnxgtqhBHxqc2y5rOUeZEAyKkKMui2fHEC5Cp9dPR5psgVmN1vsdmMOzD
         48+WCDqvxY0opc7tMk62SfXiLVLbuQT0USmfcJrx95QnXXRxJaxVLdS01xanp2B4jvz/
         /lQ34lRrpQLNExIIZRDAF7qrEKVDilv+7keg9Rs3nEDRMA4/hETaLpOg3KhF8p244JyS
         IQ2g==
X-Forwarded-Encrypted: i=1; AKwUvByqKPW1uhka8Kbs5ONJ+2TrPdAUxs+ZDXrrxrXjlNUNZvC9LMaWKOxtOnU7AocbOQ3w0dQmWjwYnul1a6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsU7HDTnzdl8m0HuwNDTXKDivczU/fJ5u/94pkXcJ/egi3lyQj
	lR/PugV11Yyf2VQkuX/QaCkwMk0OCBa5/p1Oofnf5TP4aa2cR52nZcxL4Sa+OlYT5jdVF4TqD/Q
	xV/LOF+dRx6lDzQV3fqCzXBI1GqPYyKXmQ7lUQiSU/QnJEZeBVOzZVshYVBSXcMkwWb4=
X-Gm-Gg: AYBFou3hohpQJ9NSWNocMbZFjDGjgZmZ1BhF8M4Vip6TLgRXoWpT6p/d2mVaRi/u2Ha
	O1oRxbzA3RFok+SqSal1Y9zevC+Sjo/rgDabRhZ6NwC5R24/qNayYRH2Mv0Z++SyczxqbelRxjJ
	1vM6wFnEsJuf+mQP+tbBCEQOTftemxhZx/cBc3oTpPcEfuwfE+6IFql0CF/jrLfVOi8XEOepMti
	mdb+Gs497vy3Mx1X2siQeuM6pKsvUMcY1rzcaX9eH7lVyx8D7Edx7Q+nuzIi8W2QHHrvdryCSwV
	6jHwKiDyel1G5HWE7SdmcTFh5Sf8uzKGjyBeOhyvaZg0Jd0Dv1fxAWwipTwEd0/u4EXexmmutKS
	/Gze+KvgDQ7VZs/nb7IIH4cEF4YOqQwDR/tgKYXdKmSZXj9nPUEff3wXcLH+Q
X-Received: by 2002:a05:6300:4086:b0:3e1:482c:77ca with SMTP id adf61e73a8af0-3e7af80ec85mr7789139637.5.1793074099405;
        Mon, 26 Oct 2026 21:08:19 -0700 (PDT)
X-Received: by 2002:a05:6300:4086:b0:3e1:482c:77ca with SMTP id adf61e73a8af0-3e7af80ec85mr7789104637.5.1793074098942;
        Mon, 26 Oct 2026 21:08:18 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccb7802sm2054232a12.22.2026.10.26.21.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 21:08:18 -0700 (PDT)
Message-ID: <ccce8847-6236-4b2d-a07d-f2345004de56@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:07:56 +0800
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
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
 <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX1wH7O5s+Gicy
 r4p4+2x7DB9MW5PJscrIc9h44eSw+X9VAgtKVLBCdTQ3bsIau/XesEAWpmb4v2znryRShqhhDKe
 AdVcjTD87379mArdELU1XwgSh7NoL4w=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae023b4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VpRCVQi9ATEJuri8zQAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qc-oLqDazSZqUKA3YX9_lLEWylZh0kcV
X-Proofpoint-ORIG-GUID: qc-oLqDazSZqUKA3YX9_lLEWylZh0kcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX31QGu3ojq/Lr
 QpRKTmTxlizm+PpbCap7d73PNVB8BMOQuMMTxe00qdcu17vj1zYMzZh7eh4n+OeNBeFlaXA6Wus
 YRqL1ktmDHkcKHWDLNDz3daWl8rtCol7adoBk60aHewkgsHGDrVpiXsX1JTnTvzxh0a2M55XeIR
 GhQ+H3dHGn7S5T7dXtjCzYn82yAorfqlxTmdB1Uprn+M7n7hlS+Oou800u139a0R9wDjzBRnpQp
 kLOKMWKYEDX3i44rXaiw/FBu1eJBX6JqK+3gnKsBzX7NHGjSeE4VYFtUx0V0JJwzYRusN2tY9kf
 iDArAXEKVvWZBcBXAogNPfwkTkb2MxGgP2JbhYPmUi7FRD31iOFK1yxGqT2F03Be3Yh+3x04EMm
 YQ9haXMkqLByQY+1ewDFFDqnIXXapUmNvcaYBD/fCQ4rSFvzDNRskTVKaP8MNtbRXX94YD27wAY
 UTFJPv7DX7MB3baBA/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17 AM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells = <2>;
>>                          wakeup-parent = <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins = "gpio109";
>> +                                       function = "cci_i2c_sda";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins = "gpio109";
>> +                                       function = "cci_i2c_sda";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
> 
> Why do we have a sleep state if it's identical to the default/active state?
> Do you want gpio with pull instead?
> 

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link: 
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualcomm.com/

---
Best regards,
Hangxiang
