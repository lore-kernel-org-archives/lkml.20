Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491301;
	b=Ch0bkDK4cOedz3Je9XBBRs+lXMrC3mUlegLamGToMBz8dP5VreNwpGPt1pF0sxLxK4fw
	 NTelLWjdxbaORvIGHbBFjXPBh3bP2bXdTegHshzwP/GVaaLd2YPJfhXJvO1afmEVB8ZQR
	 VaX1co0gpPIVSmEsdO/NtgDE/0PKNgsohvgsBGNh835CKgesoBkmKqmKW2fMSO0Yn25gX
	 JQsgwB+ySYYd9P/PazWGwaLr6bk/T88wSuJ3jt5B8QEs3gq2AGHPrRUSUCLREAXJUZCow
	 buC7YG5rGc0Rg7EQoH0nVIKCQV02WSKi4mwuclQx66kPs5mJo8i6c9jdxXjTzEsAzxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
	b=it9b/26KssF+SAc12rwXCmVLAblp9dV6ZUQoayQeCFP5QsxsS2uL5Gdyh+boIKVuBdI3
	 JdO4N2TwbTFyxNdV4yj81Z0c2jnMzW8x6i2rlWY0YI8rZs+AvM9s/MeZW4vhn2IPUTx3R
	 AAfz/7WcJq94E3O2mqPm6xyYQEw0yMmNfnHK8d68mjnKfioEWuyfZas2dhkH4FZ3veu2B
	 I/APwqEigcOGHtxw6IaVNJQjLrhheDzMdp7aMgsSh+nFGfiH9YFg/Gf2B0olVT0wbmp5a
	 aDSebYazwzhZFIYFAbCNirGLN5xfqFtTPRY9Kx6+airGIZ3IIq4PbgYdbvnocMgeMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4E606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B4E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cspKiUEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUcFsqG0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8a2Zv3485656
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=; b=cspKiUEIS7Jz+WsG
	CL+hXvcNojI0UMBfCjMQzCzUOpF615gZAyQtaFg3vCuSoJLgvyr0RTx4s2U8Ai+I
	snCerdWYAQVqIIWay+IZcgq6dDMTl4TNOIL9LxJEklqTSXp0RXJxIHmN+PktyP7V
	ULw9cweFsISL2SjDcvYAuObRE3kADq42fGFLWrXKO1D59uHimup6yasFvpOsDaAG
	7WbjHWJ3HvxT+xfSvEZ+lnU6m8rMuCwy8ohXLTcanZI7NY6XxSFGY3S+m2abOJbx
	Uj+xBUOL88pJegolTad3D7sVwC5G8U87QzMouRBNCg3GHG1Ko8WykMeQU+VbpoD9
	bXp0sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n20sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:14:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so47391785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491299; x=1793096099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=HUcFsqG0qNlMmd89CavZCHBIRivguWI/hGES2joNfqm3YL5PekhTEOmDQivg6BYrGO
         Aj9MS+pltxDPq870KjEc/4toGdmXSICrM2zvirwTJX7pI6nOVjbHgQ6usOA+ES9vXN6q
         MuAl88600SvFJZ/8uOpUCEGuIKfycO6QCYXGLDDhPAo7egsddEJ2djWyMxoCtydb/7xy
         dZZG3xGkA8s+QpcpfCewJeYfUfRalXmp25EgHFwpWlgSPOP5+RMxYN/2LKms0d9OiEZs
         aa8SnSxgVWpP2CPHfXx2L7rsCNTZ9+XRPgbk0qL7ceB2kfjdkDy7nykGrXwzJ5mpRGW8
         W3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491299; x=1793096099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc+1ACYP0a1UmXoSDns3gFV8Olwj10Wp3zpKLGelbUg=;
        b=xD6K6DZzxJwhz5T5PHo473JgKg9sP+p0gGDp3Jfk4m8Tul+9izEQGPwFL8tfcqvet0
         +sVlGw+zVMJP9X5MQzOlyrpz+nIy0/88ziR5gZOR7cI6si0V8NLmx+wuhP57DxstjVwn
         qYh2QmjgJRIpLIShWCnlWmB2uvIb7A9FfesyKXL76kI7ZiYUGWC3LM/tnPu/DxLvlmVj
         JaxTKP7DEHLHV9k1t3rRcYpriZB0GBiyOlf4eNVMu1hlzMwXKZvAnr6Y2CYT3NPNVlr4
         DoFoj3NAj2MfAYR21uYnecfz48YJ38W6aECi0jx764Y3Z4FelsBl0pv8MRYub5WwfyDY
         RTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVT/kSXuSx83qo7lcLmW7juewkFkxiIa5V7J8xhK2rJaozeIHrhom3rl2rcW70ZwLv2KQO49b9r7v/XZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDdJ415otOp0uUid9PNBnH5ZcwtNhqQSE0Np3oO6/7HYJ34rnK
	SitcBvarR1Umfu3o5B6mtvUShpTSACFvRodtrMkB4xsiRFr2dpmqRUl31k6WKA1JPj3Yrw/ZCrg
	t0esyNFBMHhwNHhBT474GYzjnqC2luzKS0vBOu87YRtPcOidFVdZJ7Q+DtxjarNb+Hq4=
X-Gm-Gg: AYBFou26sNqZzJ7UGoXIl8LFom9Njw++7y/5v5ykQPh6wmC+ONd3XI6LUR0inYsaTH2
	Yrn4f2N+nNW344UIwm7m93olJlBNZPsn9z9X1XvmWZbnPDtbZAHKQifN5rWcUQnTitn/dW0ibaA
	9x+QmWSTa6wWmk3EMwONXhNg0enHjq9dPmqGbtWQIovQ8bHTdDAUdDLX7ynsvO+8VvT1o3nL3pK
	vFwoc5pYQahos+J872opj9WiJpK1OBYsdk1Wt/tlmhno20TYmEAqK8eXvRrbBpEKhZLFJfmJfQs
	8SbUGrhdATc6dSNwG/qDVrvFwTopQijS425KWa+pie2hFqXIjrC3QlYpfVm+dEPn1cIBPJBoxu4
	NaG6oZpH2wSVyGiF85bB4kA==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729941485a.5.1792491298792;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1729937585a.5.1792491298279;
        Tue, 20 Oct 2026 03:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c5e36sm5247373a12.17.2026.10.20.03.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:14:57 -0700 (PDT)
Message-ID: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:14:55 +0200
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
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad73f23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hFpWyfsUHjvwOGgMCfsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX76SnRkY0z6Zz
 DutPEsvvh3pr8y7ihMIOrN9LPpVlDq8KCqrCuseRMHZRRhzRRJ6LywB6ypnx6nvB3Kg49x35lVi
 TBVqM3TJh6/q6k0ECe2zLXG56TM5GMQ=
X-Proofpoint-GUID: 4Lr2INC3ItPA0V2kHwsCYQlM_3QcB4g0
X-Proofpoint-ORIG-GUID: 4Lr2INC3ItPA0V2kHwsCYQlM_3QcB4g0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXy5hI16fqULu5
 VAJC0phsOVkDKHxiLGVj9wQXQRPAn2K+6/Ua2UEIMH6Qjpt02aQs5UMXjDaOhIC0iFmTLeIeu2g
 760izYjNY2kXQDmvWujOkjw9xbc6V/nmj//n+YsRVvsE/giKUHR53raJF3g0fEhFo3VWmnFdliH
 LifgvxJkJaxWIt4bOCTvo0neUG4OcrRTG6lcI7naU+zNM3YBrp0rWFVvgjdwBuY66kw3Furpn80
 uwuleNSuEOzL43UybxkOp1q5gjsy3kfXt1dKGDNN7iKE0DH6lg08vPrk+BVZ6/A0kFNgSOzDgUa
 YD3yBI72zSGKEJNTy5xPlyK2qUN1/zTePgL7PgIA2Q3FgUirkSzOWV7xwKZXyh5+jOK6z+/Fm2W
 gip8XyQJSVlPDbcvpSDmntXbg1DYvKp/ozJesK/gvZ5JaF+vBLsQmnj8EOClz0T61oM8HPDneRo
 +fdGiKshn244XRFW+pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/9/26 5:04 AM, Le Qi wrote:
> The DP2 DAI link is missing from the sound card definition, preventing
> audio playback over the third DisplayPort interface.
> 
> Add the required codec, CPU, and platform DAI configuration to enable
> audio playback over DP2.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index a811d8ca2dbf..93cefffd1f46 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -641,6 +641,22 @@ platform {
>  				sound-dai = <&q6apm>;
>  			};
>  		};
> +
> +		dp2-dai-link {
> +			link-name = "DP2 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp2>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};

Srini, can/should this be in the SoC DT?

Konrad
