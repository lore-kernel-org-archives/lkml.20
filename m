Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244475;
	b=jaXaLNF4xPnRzDqq+QG1oumpGoGysZkAq7yF7akgCZYVACcwyGe6ectVLoQlgTQgzjjE
	 kZJ+kXiw+9LIo+Q1oawisFP9pn4ZYZD6OVkkGnhAyggMwEx2cu0bvp3YSTeoZp00+oll9
	 lGDqO3VyF5rYAau91MHW0xQfNP74cLG9zELrp2Hz39BVtjZL0gFgTK3p7Gmxrcgxfizqk
	 2lTrc9zorMi/DX4bUkqlYw4RZj6lhrUDDdwvVBgbEXpqNO0yVSNKwq5AE5cDl4Ik3BNOG
	 qXg/+UbslIK61v6YNkrmvn3QwHLMG5h5lF+Qso3a5Llm2zZQ4IMdpyLMN8dkbijybKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
	b=NvykBzW0jLi84qD7iI/qp74WdVhZ0eeS69hSnAeGRqRg6AUqVm4hHFNvc1cHf4y5NbOd
	 q+f4+yyg4JpOxM7rIy4ckvetXurUTH5nnmhMtRxvhpBsdQCZSIqMrCnunga2Kclz3YmpK
	 bhCz4awfnq78JriI04qXrUX95hnKo+5TOd9XlAUJFFcRaR2BDTno6/tvl4npxmlNkP1c/
	 Isut9k4NVX4Keu3y+06nNJaVeJfVWyBQhyDWIlaWe0y64ZZiGudlGuyruJQtpQBZ9XFii
	 jYwyZaLR0WBL92mwwRBRDXVpi06V6XNrOJ5fRPKpc91FXVVVQnaQ3QT/4AAs5gmJO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jbqW1340147
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=; b=gYHsIv1NKRePU59Y
	9555y6anHD995DoIJJv7WhyO09xHvQxdRvFjJhkx5HixMUF1Fd4rwjLCyH8y3MXi
	W+3gG6Ez545ztoyahx20ZZTM+79U7gmGoHUL3oblVtbG2QKDVPGt0A5NhAkeo0Nw
	fWzRfz7+JKLEM4Tb/ojNpLh8Vi/PK0KjsoZVkQ71wyXnwMaG3fAznvCFTGJIu/xs
	/orwkq2Ro41wbNMUUxk4MydN0abkqLUuqbVrfVhleA3OQbFS0EK/QAg4NOmFPA9i
	gAwvML7SQmhcQt0GMtmYHL1erkvw3x77NESE9HIBTFhbOiPp210w577TAzCFwcmx
	z7X3Sw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnk3vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:27:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1495733a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793244473; x=1793849273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=MbhzBsXQgb/jjo88cmo65JbI2G74qP767UJDH0riA28KKauwL1yw2NKjLOKMlYWU+/
         l7zE4q4v8UCYV9/emC5LN5Z9KrByEQ4FWvSSvhCuxZ7YiCq6E9wBQRh/QAEWf9Ag0lOP
         fNCzzt26L1sv3/cGuvyxzJH9tKxPCr+ZvVrKAf16o0BaEWRQ7yuOvn2zsKnLi21a2D1f
         qTi+O5GwUWhhj/2VbIRnLxL4cC24AjwD5NejrFXuZImP3fOZ33AB99Hc8cBNlBxJIoee
         xoBMyGthTqr3nEdFcuxYjtaCHe5J/CDzcYJmsuKFjQNyReoXXf7+vkVY+VTRbHXIASqB
         yJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244473; x=1793849273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=RQXYYRl8Qq+jBWi8lih1NsZxde/5GtzN4DAj44G2/MFHZSoFr7nrmTXUj4USfxVlo1
         VsmqhJ5oMSDGpFHXWSq6qBSx1BaPJwHGfJEZM5DQAKaExE1HzN1Jqalr+UTHBZBQ7/g9
         eNJ4XgOLxJ0mqyp0kMXRPsuS5poWfQsJ6GzhcVabsZKA5Tdpm06ybviGHs2LiVtyyxBP
         Lr7XXUrOs+KWboHCq53x2Pl0GrlI1e+cVUmm4lirq3m1+Kzv38IagvUjAnT8ZDwd9pjP
         nxEKgm5b3J7OLT06iNv3oyvlpUruDm72zdFJnkgE/2MjgYX77XChjKhMtEcR0js98Liw
         dtLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxa3kXPPLlfF+lwfwF0TINr4dvcN50UkwSNIC4DInjeDOYvpVhXGbQJxNtfhRf3Pn72Ve4WRvL9vet2UiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhLmLr1q7ijUUVVlwsSjcLb034Mzc2ZEoeMSHP1a5GIbfRHQ8n
	Kj10uBW1aYpiZdqMy2gOUTTl6EOG7GYrbwskfYrgxCl0QnzubXTQnVXmPz/fqcHRF+tMCNHWsmX
	WUXREPa7x7XPJbzZAUCkILDs9AkCtU/rILy/1A4kORFTUab6YP/gNh0CLplicrCCrzAM=
X-Gm-Gg: AYBFou3PRtqvIS+9QouHfJQJ9fHENXT7eBVg2JRCVIEblmmdyhvvPYdBi7406wzRndX
	2OSUERYARYRz6lJLmdjKa0K/Nw976bQcayswO+g7oJV9a9b1EZ46GjmcbKiRypNY6kp+BhrkcJ4
	LdN0o+ngC6I/8N/5FwwDYDWP90anxbvqtF5eURyK5c1/0PnOqTO6h7KEme8GwOEJHDuKRqezhzO
	auVVad9ryIETDyYFDd4fbKLky3pEdGKUGDZkTlyollHppCutrNUi9lrUCk8tTotKpBhinfjmnNI
	ksNto+EgEa3XgxtPF1ISRqotO4eMPiToMjB2fqoybzxcYwM0q/BH1Bt2dOASoA1dUJ+7rCslDws
	BV925OhOkOhvDF+gu7MtRDBpmNmU0/a9sSELDCBwMEegQaTIj+d78xFqwgnRHMpi8yT/2Kzs50V
	IL2dBbxUgBmE++JjMpQ253khbg6L57TN++jmGl
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543167a91.22.1793244473014;
        Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543143a91.22.1793244472548;
        Wed, 28 Oct 2026 20:27:52 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a6dc1sm1885033a91.0.2026.10.28.20.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:27:51 -0700 (PDT)
Message-ID: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:27:47 +0800
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HRmoETDHowh6YF3ggVNsDbmPhrlfJDeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfX9d1hD8/EnyhR
 9zbqsu4DmvhRyL3ftWmNXSsHpSNhTuCvniAsvyQHMUJlK7NJwirVe7RYg9D0tfrmy31stipF/jp
 VK5i1FgC7+B7jzSi1Mp88WKsWn7JMPomZH+Rc0F3H2zt698viDmfIOC8UgvfXAK4VpYjNGmKeB2
 /nmTNAsZ93oYuogFO5zl4Ej/+1R3JYFwGYXNopu2mXpLaV1BDmLFfsVdhnd4WpmaMQZzFUOvvK9
 jTRQmTezgokVu1uhxVTB2trxSch1LdMnwxnsmVnyplyRW9VOXjSKG+N2x6LLV5lv87dPWruMRLJ
 kE0mPrV01A2F5pg0POPqAyR1TfwGgCBwLqwDXU1kFKGKNCi2stRd7TwAccFuoFtHswRLVxDROgT
 slijA94AuqRMS+1tcNuu8zPgRz+CEA0hnvP8fABjzwpCJCOJFviZGq3W+MrnhXV92df82a3PrBT
 +e74QnGixSFnyNPWujQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2bd39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e3FvKZFSWGuFtYgZOwkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HRmoETDHowh6YF3ggVNsDbmPhrlfJDeq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfX3b0IWqiPI9y+
 MCZoqYirmK8Yeubyk10+AxZq4oORtQVvTRBKAt4NQkfDQ+lEYOGQEaPF6FmR4xARis6d3C+7eLJ
 VIUZHC+7TfxXeS4ln7QvFyjs49qasH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290012

On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
> On 10/9/26 5:04 AM, Le Qi wrote:
>> The DP2 DAI link is missing from the sound card definition, preventing
>> audio playback over the third DisplayPort interface.
>>
>> Add the required codec, CPU, and platform DAI configuration to enable
>> audio playback over DP2.
>>
>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index a811d8ca2dbf..93cefffd1f46 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -641,6 +641,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		dp2-dai-link {
>> +			link-name = "DP2 Playback";
>> +
>> +			codec {
>> +				sound-dai = <&mdss_dp2>;
>> +			};
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
> Srini, can/should this be in the SoC DT?
> 
> Konrad

Hi Konrad,

I think it is better to keep this in the board DT, since the sound card 
is board-specific. DP0 and DP1 DAI links are already defined here, so 
DP2 should be added alongside them.

Srini has also agreed to adding DP2 support in the audio topology.

Thanks,

-- 
Thx and BRs,
Le Qi
