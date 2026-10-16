Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE73DC4C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140745; cv=none; b=KuGj+nJ+EkUY4w95Zgm512H1uWOcWaAGy2xwU6ZKq9ZTS3HRXBKqKahzILA9bRMc8CzKeLQAbLXmYR81P35twLLnATMsUew0TgI+NlwuY341oclH/cMPwHNDOWwH+8Ryf9128ieGfaXXtAXCRbornIsDSEwDuGDpUUyucCvAUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140745; c=relaxed/simple;
	bh=x7/AS9iVt+OJOWTPrR8wHUSuCZH3x2iwRo22tfSQynw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYZcRAC/k8+TcK/IQlVUJn/A2cvmsvfYOhLLeqaBFI4uTl4gPWDVoUk2yiY6xys3qmyNhQnTDB7wmZPpoIdGAaFLPykXUA+WiEyT1G3KkZbVfie4njVGNY11OdIwvq2tHIHPVugq9G0bvruox/EYxJ0da0lxBcr9brRn5hDIBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBbF4Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUCku9OW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBbF4Bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUCku9OW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lW332815491
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=; b=LxBbF4BsrXEgr6mc
	ACjR8P2WGtJ6iwV7mIXyhKF8KFwUlv/ebN2xS69wuSfQuL94270CE4ptIuHln5IN
	mVeIWdcCVOWKkAk1r8w+TFERulU5eSbShg2f9QtOVH2jaLi3j8Wj+jBEd1rIOMra
	HVv1GprGV1LAEbV3RMj2snbeY1fnUckFzmT+7HvUVOFg3ua7VcqWJxkRFOKyQn0+
	s8TaqcJ+3eI47QOQtaN2RyZjPVH39Q5Y5jmquDmuG2S98dlmXZxgafV1tV5ZjMJG
	TT7Ws9r8TBFor22jnF23naCmARA5SjcS17euqkQAyrWLWyFXpJCSsVX6CvpWbZxZ
	zj9Jgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11rfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53389750985so12998071cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140742; x=1792745542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=NUCku9OWtYtV+Wjt42wVCJtS1LgfcrJgBbboJq4oojrIiUrqcHN/6KAY3nyAjKcPm7
         H4qM5EID3RbK9kbydv07khThRsW47Nd1TSw+tWnBBoUy2elAVkwsHm1ylvD+dSpwnvIy
         qJTnJbP7gSfI+I7pbcI9IUDET3YK5WR1qBaiB1ntbjr5zigHiy8piA3TlaFXK4Q/pYIe
         kw0lYQuKpV6HYlePRXwCN3ZEXnVT+oPHxcNh5UiHwIjPw8BmFMkF9Qel/XlA+n0KsdcL
         3eeksaAOckHcv2e+Uz7qV8uYxIN8J/WZegnEO8wFSA6K31V3bZ28N4JPMrVexfBMZj/E
         nhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140742; x=1792745542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=r52bVgpOVp8L6RJRoaUZ+O5c9Ahln/Ca90s3/fi0IQUXw4BVNNkGObafp+UupAID2Q
         p/leAIL126pg8EQIipp//vnhKnBlG6PFxM878YLyW77Jhzy10acnlTukdLTQ8i5/fhR/
         JRY2QORHyy6V3d/xi3XOmlVANOoGqvrr2iVEqcOYAvsTUv2SGP7BEG3VGgVwvs0GsvoO
         RdL3fXIx74B+zBFeWL4lUvfOyo7QbWX9f9zmRcZQ3+g02OAQ/ubF3tf7Tg6HZeDcSvPW
         It+F/48iAvG+u/KmDnwfPNpkFDQNv8E+jeP1Z4qPP9KFjnJdTbzHKmUwavGS+UtbEYPK
         Qsfw==
X-Forwarded-Encrypted: i=1; AKwUvBw/t/7/Wh0TghhGogEB3psxKG7pv6v+h8V8Hkzo+hN2Go97HKuJ05vqFrsLvTWeN3iVWLJBUmfGipmb6Kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuX65sr+WVPLQHFWviDIdNGyRuzwPDXjr/xqoMFH4aLA1HxvPh
	xpJgBDCUDKqWyJfQvuWZ5nHikDxfUbGEUYzdWbIEDlTA7iergfnYosW84npYLiq1YAu80i0WXAm
	PDc3A4YgUdAY/V2+TsqSmNKwIdcS1MkEf19VTufqTYHU9WjQOkQPzKw08sv0FAWI9wOs=
X-Gm-Gg: AYBFou36VF7+3Yms/jwKF3884jPeNDblon7CVqLnOFMF4nCDxLUaZTSPKGD94uSD4v3
	jE6EsTRDHZn+hgIEU/NqK5KgEobfj9DMcFMAMaJ/3vHuenwMHgddOMkS2CYn9JzXM298Ntj+se1
	bGAs7dnMWm3TLLj0BoHmN35iAXjkD4NKU+Ovax1Scab6imchOHTWaiqknohtUpNFzSKv3SZQJFd
	zbwp1wZm40sVuCTrUzOh7MfquM5kRydA5gREWBPiPJcb00En1aYd/tSBtZKsPXMcclBgHaz+7gd
	lccuOIH7t2eAVsQC3//iQ4uRhcEq37V/rHaTuWUJWJy32JmpYXhp6SyRs5ch+bX7vrBRT2ivWBq
	PsGKG9QHCn0KaF2/RAzCkTQ==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019483185a.6.1792140742306;
        Fri, 16 Oct 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019480785a.6.1792140741852;
        Fri, 16 Oct 2026 01:52:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cf02csm51471266b.37.2026.10.16.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:52:20 -0700 (PDT)
Message-ID: <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p9NJoKPvWzbFJRouYfWJIEsi45T1uMtH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXy3pIwch9O22B
 t1B+fHJuSLu8T6Scgqdx67GPG1xd1ZIhd4faEKowwlXDCQBMRp2Mo9ud7k2xyyN+VAQp+hh5sJY
 19C2nTRB6bOv5wj6kFtCWu24VrfKJes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwPaZL6Nxd0gE
 Q+JSDl3d/rKBLSfhBTsJM8lxnGRY6hBMwHOROePU6kXOsG+q+diu7iiC2pbltFbrIDrrrLWSxA8
 TlvoHZeiAp68rkMaBrrq/TzbpSESLfDXnhuv6QylCMRiMqCP+TzAGp2APC9OMc2Az2dg0L4oucW
 IhDKyQHiNMOM6EyUh/2Kg2XRpXEXz59rrJH7oyqw9UW0oeS5znnL4RPrK1axwZ9UY6/ZPUP99Kl
 e8KgYzuuB0iHj34CxLNHw5eqZ1NpBaX/XFmmgMgJMi6Ui8+5AJuSPYVsmhw4X4d+fU5ZsP1v8Ch
 n9W/pD8DcQ3Iaa5VwzoAP8IZe64n5zwSNEYwxRSn2KZhePw9HZqD7WxvQlFbmP937xvUKMcjj7+
 b2iW9zDA1RK+F73Ot+XhNmr0l3ji/oIsxQfYC+ZsB1bqEJBXZ/oN8uJ1YTx10iH44p8g7PUwTX0
 Q66fC/f8iWmT9fBeexA==
X-Proofpoint-GUID: p9NJoKPvWzbFJRouYfWJIEsi45T1uMtH
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1e5c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mI9klGO-NMSZWYpAt-EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/16/26 7:39 AM, Anurag Pateriya wrote:
> Enable the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..9db94c3b0c91 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,12 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp{

Missing space before opening bracket

Konrad

> +	firmware-name = "qcom/nord/soccp.mbn";
> +
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
