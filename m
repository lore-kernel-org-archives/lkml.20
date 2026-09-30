Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC73EC837
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761956; cv=none; b=CMCp3XVy2iHrdWG7K74cMUNkFf32AUmryGyZODWSQeS12wnCn16s3Z2EIWujFHEoTOvLPWTi4FMhB7h4iHpIvjqvT1h+kHNH/Xl5cXvy9El0R7ZLCzGShWgceIJnCdKBgmlAl0LSRde1GYP35wauchsAgVfeibGmWvdQfKgo+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761956; c=relaxed/simple;
	bh=iLxVE4Cozk+ouO6iON98og4E45z9ykNZt1PYkY+2Cr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2iArs/tVXpeLf8Ni++ue9lwQrcKqw1HC9jvjwDMNQ22BUhaoN+kqLHB51ICGeWx8ccBLOMWdzSqFJorHdUZkOJlHCWOMpkmfqIyHlNsq2jsJMKTSjxm+BwiOPMZRrf36el8/4rEevqBmGJ61a5qbjfQnrs3ay3QS8xZCEmDyR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzaFuvFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKvz/oY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzaFuvFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKvz/oY6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dOje2213405
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmB8C1C0sVBPcs3s3/896bwiloxgVxc5XOCY4XwaWhc=; b=NzaFuvFS94WYc+aQ
	lu5laVEYepCpsPWCBy//ehocsJzsKA1kTo7oI1JamTJ0Wnn12qV5wA3KtJ/T58uf
	2WN6UIec33eC+4YXwAzZIIABNy0Ijwt0ubXuvJO9U5beJlSAWYwZCxdZQcUAY8On
	AX+9PyXZiwIC64BPQ2bPr13mR1ZNUVfrFBRGNpgaDHrAwH4H0fDF6DMO8YLrklhX
	QWn3qLQZLqx5dxgrNYCCMoZ+zlObWuWX+oIiTM1J2rrniQp2uhNkHyX8LxQi6yQO
	EwmsCL9dJXM/kuZATiPpBsg0a7i1RklugS/0kHszvBPaEw5QcX5kBMlRxGS5kJ94
	ugm6aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjhttm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:52:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d522a20dso14282841cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761950; x=1791366750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmB8C1C0sVBPcs3s3/896bwiloxgVxc5XOCY4XwaWhc=;
        b=UKvz/oY6W2L99w4oZyd6AIhJtuhScKVWLTAQcO1PJODO+QZZW5PuO1OZPYVtKeWSUj
         w9rRuYdZrKfzqbWGDqkVlmQqWJA595JTZgFyj3h2dl+ROKbjIfxdsBNS6SXGPVec6Irv
         rNEtIUWiKrC8Ymr6AWpsMafUygubyeYVQTwhExETbIbLQV1PpTivPumi0vOaDbpzlQbQ
         Yanph/L/11PwVIxcNFwZVw7A7Ou1oB7nCAlRBC5RiCkd/SZr5JqSvzYy+EC/7LRrM5FA
         4RbUL+xVzNcVVqWaCuYNm+zfTYuIHHJ6fLnJOYiRAIxTAMSRrjV33ZyPKvYstK5BAfNM
         EJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761950; x=1791366750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmB8C1C0sVBPcs3s3/896bwiloxgVxc5XOCY4XwaWhc=;
        b=IGPo9PXTG7DVzSMS2zZubgkvUkGw2iY9q+9+ZUoInnPTHIa6cjXWPVuQvDMnbdldHy
         N/3Dn0WDUCN3Pi3rJ7l3WJgzvSY0ErReZ0tdj9KM5vBxUNHErgb0ucyqk4ICihHz1p40
         h6iXBi2tINR52l+1qwC8DDpmBP08XrX0TCrc/Bm6ngMabweK06ToBEcBSY/j0+73gLY7
         f/xWg5AoAYUuYq1ZMzdZTuaejLjHnmZ6i1PTVPkjfffU3qydjQYHUmAA2WoKEVysycW+
         lUqEmjrGi2YjmhvpjNyeNnNewGwwVoxP+hy/JIUnz2RYgHUlM539ewPHsEXletW8j7Fi
         c+1A==
X-Forwarded-Encrypted: i=1; AKwUvBytflg0KXSEJLLkmDBNe89Pelu9K10CvlGIxjkjVpWPhwfogljcL7Rf8BFLA0DQa5SSLoaynRP64Wlx7Xs=@vger.kernel.org
X-Gm-Message-State: AFuF++kcJUZBGvsxjbiQnMf6wJUJoazgmP73CfMwJKGrcGV3R0rzVpzt
	YuyndWgpQP0ub0luraxYa9rj4ARpJpD3hbYvpcwueTOgqOTo2HlBeAibpU938UuSKynOyuzcDZQ
	sY68TtyuZWoifqc2x9abJY6oDm6lyEH8EmYNWM/JNB/4bIHo/6RivMyijyE7N67+bnok=
X-Gm-Gg: AYBFou01MzCA1c//eOddrg8PM4eLTmZgFvLGkTywi21ivpnoazDTBN31XqRWkUZmF9K
	sQTy4LvFM1wp0aNeN02CO5gBpkmkF1Vohjn9VxSFUafEp0Li44bsL5bZRX1vxmoQi8uXECbuLta
	CEGhOOrOPSeDIHYgJUEb+JEH2hx4ANPr4IXspLIpCcuttA7mKl1bsPGpFG6++ky+jJ5LJ2mRrwx
	6enKbGbf8rDTl5DbOcf68+Tguopkz0T4wruoFwORgAJDbTnSwEWxEE9L1QqRgdjtagaemfsSeZe
	9+PzUegqD2HwCHjgCxZtogQLZkJUkuBeWtliSTegGJv5m811SgBJvzYzNs86ZYNwZRqBJdfqAa/
	d+Q1Bchh+et6c9dtoyx22Fw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr116408785a.0.1790761949641;
        Wed, 30 Sep 2026 02:52:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr116406285a.0.1790761949099;
        Wed, 30 Sep 2026 02:52:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm39222766b.42.2026.09.30.02.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:52:28 -0700 (PDT)
Message-ID: <9c4cc38d-6cbc-4c87-9946-904b3bf513ba@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX67uTu94A+5ky
 e/4vBUmxch09ARJHTxAfK3G88RUKXKQgPrBsPGldURm0Fx2JXuUeOrYEGXSMZ2kJuxrADJTrWa+
 k6bZfUk+O/2cuNuPb3Gzcq7RzlqTCek=
X-Proofpoint-GUID: 1EtXueEDnYwWx-nBwdo5gbK0UwxpYn_W
X-Proofpoint-ORIG-GUID: 1EtXueEDnYwWx-nBwdo5gbK0UwxpYn_W
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcdbde cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RJTwi2r8EDbqXNWvjTgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfXxjkooYffc7q6
 sadOT8BDAOAAdJrx+lO5dd7LsLWBXS6Ql0Bse7xgdNG6F62zvjlIsha4ITI1XMQ0F0n/ItUHSFV
 Chu5Yur1SVn+w74teOnPWzbufPoWtPWhBOyDyABsUWpmoR7KJyfhzvu4ITy1n0oSzhUVOimYkCS
 G2BD62y1f4kU5DXtOzPBBQnfWk2N8ED0dD2IoQ4faaqDoY+/t0hlWNcF+29UH71c+XW7bpWNRH7
 kAkELnggZ4RygsfqXxnfMc3YKqtke59PhioqmK8iycVIqbYxmWqAXap36fNSHApX59aUHTnNltW
 /tcuP3YX8R7xJiVa+hav8tZS1nT0z61c2Vbu/WBLBPHzTcdi5L/3eVgSUBPj/31CtTnw51Fmp+r
 4nG3FWNNtLXrWqU+3jtsvrbk6t9IfS+F4LxS7vvWCctuY9N/EYLKaVQFu2RSk+KC/47GOncEVDA
 Eii0nYABC7xFUlk2ltw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300039

On 9/29/26 10:35 AM, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&i2c3 {
> +	status = "okay";
> +
> +	expander0: pca953x@38 {
> +		compatible = "ti,tca9538";
> +		reg = <0x38>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};

Please keep the nodes sorted by their unit address

Konrad
 > +
> +	expander1: pca953x@3c {
> +		compatible = "ti,tca9538";
> +		reg = <0x3c>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander2: pca953x@20 {
> +		compatible = "ti,tca9539";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander3: pca953x@21 {
> +		compatible = "ti,tca9539";
> +		reg = <0x21>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/shikra/qupv3fw.elf";
>  
> 
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
> 
> Best regards,
