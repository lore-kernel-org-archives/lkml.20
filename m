Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402093B8BD9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227331; cv=none; b=dNyaQKz49oeTEzpPk2GVdUMSS/zadOIMZOF+RF2Xtkre2iox1lhz+UR1h9kLkQf9IpqqoGmbSzjdgKFsAvSrZjp4HGzARY4jnSnrkRJaTaySY0NckCGlPkfc+HbYo8VUASxbr+XKhi4rKLYn7l7v4EmscAWGNVzGqoDmBIpoTJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227331; c=relaxed/simple;
	bh=s93lAG+INAT/4b0MXPPYETKqS2bdzSLG+uazrmQ8hOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkObf75l0mRtNiSjSmA5lqdsDJ7oQWPzygVsefAm0EOwy/Uw5a8mE4oSrm3NWpFCOl5D30oscSsmuCr61aXKtxzeGHDU7DErOtVJuyz1U7G+/wu9CthQbyEvgdIDi3+vgjb9dzVlb5ERDQoG3u8XN7USnEja0i05+CkTTIrmpfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAlGEx4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIG9b4ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAlGEx4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIG9b4ma"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36ihQ1953017
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVLeYQZvRIJKwUz3I3T62Ef5PwKvf1HfcWgkMUP8ZcY=; b=lAlGEx4FJGFwCVix
	7Ba/Iu9+Dj/tefuNtp9yGfud+QKdSc4QBmD5Go0u6RMvFOv9Z20xaL+pUfKSbB7a
	tFFKjWZyQPE/MubmrPZ86Y9ikFtgNE4AZtlyjTHvnOoeUwal3kf1nD5vX23fAcTK
	fVPdZAck6n8tZ9W2hlHr/+4Ge5PCNycYH7b9wdFplJUB9NmDD820qKP5AFMBsLVc
	aZsBZ2QME+9apOL5ESgT7sv2j/PpyMjlYAjbWztVHmn3KT+RVjwF6nSOFKiZmDKB
	0A1doeUhmLaHpVmzxG0qK4Jv1QhlMWQ+EW+MrfLh3/wQo7Osq9Yw8bb+Hn48D/05
	3ndEdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxucqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:22:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3093034eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790227329; x=1790832129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVLeYQZvRIJKwUz3I3T62Ef5PwKvf1HfcWgkMUP8ZcY=;
        b=XIG9b4mal646PqlGZiP9mV3+HQSQ1haThMYOZp47L8C4IoUOR33M/AUjXEcNuWAy7a
         hCvCQmTzhAzTBJMBHVPrBTxDZrzSdUD3SjKsEevG3o/D5xyQvG/yemiLcl8Hb6dyCR4f
         jkeJ407KzSfZ4e/JtPcRkYeBtCFmJWzdTfLni+z0BkJKPyJvN523Ymq8XDN+H4AV3OcR
         UXNx50VurbAyKzpjU9PSwPR0inXO5M+36GOddXRfrsyx+3MSi/ET9/NDAT8QXB/EroE1
         T4f7PlZeWhWunc1YKyUB5JS6qsaY0oP0NtNwZ8eq0/7E/Gz4pr+Dmbnk4t8wF53damVE
         FX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227329; x=1790832129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVLeYQZvRIJKwUz3I3T62Ef5PwKvf1HfcWgkMUP8ZcY=;
        b=LVwmL5iesUMnT/CjalrF5H7uvX/trNtC0B4VIYJ25cMtNpzetHcdysH64E1WYkgqFv
         gucCndJ+oSnG03V5sNJV/KvQ8rmEd31iIH7Pfyd1SshFlKKbKKS1vt2HhQ93QytazZ7X
         80E98q1JHogLfcl/M/HAUBB8m8tYWxDvjLPUP+m5nW7dYjI+jKrWPMvxP/oV4lJO+Yym
         L49urE6e1grBi3fsiRBw77dsg37D1bnltdh+A575GIsxxuJun0UQkx7HYQJ9ludLF0na
         bi7tW/qbdR2B6VCT4jx9tJXkGeDO7nAM6k+x5NWzHxeqEr/jVlP6v9zxcJcM4bIg1w8i
         1HLw==
X-Forwarded-Encrypted: i=1; AKwUvBz7ZtkcUb1sg04CN5XsQiYR2vE+VJfGzvXpgmpYlLGJRHgwCEmmxdLWKETWEkPVHDoPEHtTdCgTDACdH1A=@vger.kernel.org
X-Gm-Message-State: AFuF++lJU6kaQ1gYuJGsnm6uc1S+/6SeNGRKYc7o9yIJFWpsreaLjM+P
	5gCREAVJmKQzTZJXBg5wIfoEzRpl/65GuI24NQsXpznnXdKFV/OByV2VdJKsq+umLxaDg4JBvOl
	TX2azHfvk+l0fCDyR54/F9mfoMuqaeHZ4dCSQcYivOAchG9LzvVn+VPDidiYxyvh4a6k=
X-Gm-Gg: AYBFou3wzYiNZr59poPYZncS4tBEpKbRoVVGp4PHL5/qbZJXwyuz0rua4Kr2FcyGBhu
	j3/JxmVV3/y9mxmGaXcfSOe50qk9H8N05VYkYwSvAF/7x+YHzowpnnSGGLv3uEFQJnn+nBySSrc
	HguVhMQp4pjaLj0mxXZeW4kpYr9E86f56hOqEAnnuh1UyG8rteIkbC3a3jPpl31FWuz6VOAew59
	uugAaF1vo2RapSnyV1q1XAtL+QHHJ1rN4NNXRUVWE1o21OYDYGWB0H7l+sWj+dE7H/7KKcZt4qm
	1O9TopZLt4SABeNzA6LLQgl/tNpmhhvQSFE+J6X3GDKVm0m0naglyUUShqAscT/1puOpfmv62IJ
	IL7yGbkNK8WFh2MLFehxJHQzu8zbg
X-Received: by 2002:a05:693c:66da:10b0:33c:e8f:5700 with SMTP id 5a478bee46e88-34000f2e58cmr1032939eec.33.1790227328668;
        Wed, 23 Sep 2026 22:22:08 -0700 (PDT)
X-Received: by 2002:a05:693c:66da:10b0:33c:e8f:5700 with SMTP id 5a478bee46e88-34000f2e58cmr1032917eec.33.1790227328039;
        Wed, 23 Sep 2026 22:22:08 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm10645898eec.12.2026.09.23.22.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 22:22:07 -0700 (PDT)
Message-ID: <7d25576f-ab94-4437-848d-57d9ab738ac6@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:51:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] arm64: dts: qcom: maili-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-8-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-8-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eCiRzRjMVidJcnChlwHUdG-_mqmkOPLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMyBTYWx0ZWRfXynLD6qGoILwQ
 rq0mW7rtTExbTAGW/haH3D4NLPFUH6YHBojfLiKs8dBCZYOdK09rdhNwCLiqm1dMarSosc+evZG
 eVuh7HP9otyLV5ddegH2t0vGrvMaIQvVrgTxCeKQ0a5gmA7mH1ayaT6inq90OGzc66QiAQ2p165
 M392n3zBwiPgMeI7Hp1bFer8zXXkEMaUoczUJDlAcA6aXqMWo/v06ChQYmK1y3CAaswb1qKlEIM
 MyY6LesZcxWr41JUoaBhxdmij3tjJ3M31YO9JuM28XwFBpmwymF5XIwAxcJXblC+Ovw/+NSZRes
 eSODDicGXHRdxgwF7/CkJcFWBe5/k+vdmiQFNPIDg4Sk4+0u1GjCZhEZHvy6XRnSCpJwBB2pgKx
 3lvjBAne9DhvtSvWwq+cs5kObdJcQ2yJ6ok74r8VeAd+GzaiUuw3IU3u2y2JD/fp515LQkoCkfC
 T8DsnCkbR+R511s5/KQ==
X-Proofpoint-GUID: eCiRzRjMVidJcnChlwHUdG-_mqmkOPLL
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4b381 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=A5lWGDfZTAothn8YPWYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMyBTYWx0ZWRfX1Lsoktuffaus
 ZJHmve1qMEZJqts+exCKBXJVXCpB7xaSNU2RpFooAwzNE19MnJu+y9tKbSlH71xM3+oKtBWjUgC
 +0MFROqWztSkZVFVSXU8Q++iQk/ZyLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240023


> +&i2c3 {
> +
> +	status = "okay";
> +

Nit: Extra blank line after the opening node.

Thanks
Ajay Kumar Nandam

> +	wsa885x: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&wsa885x_spkr_sd_n &wsa885x_irq_gpio>;
> +		pinctrl-names = "default";
> +
