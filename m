Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651F560AB0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092293; cv=none; b=IcgvXffb233AF3w7h4yyVe+dc0GYijhpDZVgByie6gNic2KtqmSLoKoJ0r73uuFnisrOCywcAL8O+vGGoWywzx9H7LDA+/k9o9f82Pytn86ZOXBCuRxyjOhANjlLfgt+GQnZuxvOf/VkaFgxrLQrzsbgaFW78tzNtYtSeAXybTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092293; c=relaxed/simple;
	bh=CoyYTnZ8DJVM5eZTTyQQ88Q1PAuHVEJ7jE5IuXsp32A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/KcUCVPG5gJkJBcffUP+YuCkf8TnT1tb++NLZHpLsIIKvA1Dw8XniRXoVo+R/0lQP3+7W6ChW2DmjoonGJHSMfNMukzK6UMcvSz0wuYXrN2afWbXvxObLj+kmdE6XxHYotAhBEjHE9bEjv6ui3Kk2CtL1iSFOM79ohxhQGH61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSgbiMZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWHpB/5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSgbiMZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWHpB/5z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjI3R573101
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=; b=VSgbiMZDKXRJDmXc
	D4ULXJkDgfpS3i3YddwY4p1jbbc6884X4j2GHj7YPBxODjIiBJrn0cu+L4EiyN/f
	GIlqcZ1IOHG3KehVShBsBcnpTdfpvutqtWmajzgDYxMn/OwH97ROdZOaK1h2ZaFd
	UiX0PAPLu+ukh0Z8hwWvBZ0D/ms1BZkqXkxWmZiwMCso0HPEeumig+E/u+WHAIXb
	le0dz3LH44A65XNnt1HTosj/HvyG5JuHZ32SYtCem5V8H5RD43FX4ivkDFL3mG4z
	XnjvJ4GxGPoYjj9R7mhctNT54NsTfJ7+QAiO5jDyqAxiTrDJPIhZ57CdWQbn0tkA
	wSWeFQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjawws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fcc331099so150749137.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092289; x=1790697089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=iWHpB/5zzWoXcl4aIEVAUwb6iMA2NFwRfFVe8hFe7Mld5dGMK+QO4fpztIoIgUW/ME
         vHqX9fH4aKspVxNAoCV71cDaACA+SR5RwX3FRYGvvY0h6HZVpusaRFD7TWHh4GHHbgjn
         Pq2Ryt5S6IIF8f/yIiBEfAM+T6O3Wcf3eKKAfBGWvYJZbfHy63k4DdWreNyKok+HVr6p
         Rqhw5/pi2HmTFRDsy5txoJrFJ4XaOm7LH7O9sfzqanavZvIdn/BKS+ak1DpxrLHFRu9m
         aYuH8RICTsyAEN7Ksv4uvrrBmIZiS8fwAlvhZesTujlr7hV9pCOFg3QZd+W6n1Zfj9I3
         +dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092289; x=1790697089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=k2b4syzIEKTjuaVbPacluvXLzjF/SR+rVyYaWOjeg9rH/apG8Pw2CoNMdvezXPMrQB
         wCU9QII6EsZFSSfCu2vcQGyh64s18vnp+Xv/3T6ytGAdSwB+1GZKmvyJj0cXvPBUoAes
         GEBPV+3T96ApXqluS0PYmTgWjLehD7oWrc/pbRBB9FXJ9pOGlu63RwLlD1kkQuPTaCvz
         PZHXr4YJKaO9RBr5SRqGADR4HugLpgXOSnaEOYFPvu0bPNov6Uf11YowZlzi70RC9UcC
         Mqh8JtGh7+9JVCln/U5RL2UQwsjaIos+rX/S9VS/UuI8gn28VlNbY2/rps10z4ezD9Lf
         wo2A==
X-Forwarded-Encrypted: i=1; AKwUvBw8qJMkWZfKuWzegY/Lg+vFFUeJ8p+sncstVCalUTSR+Gs3rrc98YSDKIIapCD3aeZ5oSk8YixnBxOZM3o=@vger.kernel.org
X-Gm-Message-State: AFuF++ldi2IC3I7hFH4d4njnNNyPd/OIP7i9XM1eMbmbnuDPUIGQjwbj
	YwXvBWmoBshONYnqOZzgMGNCLnK9Lkeqyt6hWUmbXJvnqxomTu+ku17Am289BPapAjNYcCaNRdn
	n70KgKnbcEDtvixmlejdLC5Azq0j1Pe9Xcf/Lt4AbAYAMnVw+ElqlGLW75NKlxOubhOw=
X-Gm-Gg: AYBFou3J9vYldz1MDtAgQf3Ive9zJ2pZuzItH77mQZ7PZcF+8UxBfKynhPUcDj8bpGL
	EnbJF6eNw02BLF3eTPzHLmOpEx+2Zaf7pwMGxUDg2NgbtD6xllHwb5UT1GneLYzwXRvkraW5bbs
	0mD/b23CSKCrWp92SRwuiJdp+ByznZDVGfaPd7rUVghnaFYf+yV5uyU20Id5hbek9FFMS7Ig6K+
	pAtB1X78eQb1/YHT5SdqT8KturxdnWFkrH4cTqY+koZXUA6Z4sT1JFveO93dWNz2e2icqMKxX+r
	nTb/8QW52IZsDrYi+Z+0Ez7htAw+LcRb11AN0B+ecj+RGkdCTa3emaxTBL/pjmtKE4koBNYLPGo
	ZPsj1TxEYKzgsr5OLuqsa9A==
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581238137.1.1790092289164;
        Tue, 22 Sep 2026 08:51:29 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581185137.1.1790092288703;
        Tue, 22 Sep 2026 08:51:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c2a6336sm113065666b.0.2026.09.22.08.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:27 -0700 (PDT)
Message-ID: <27810459-c127-4b85-abcd-43d8f1e25c15@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mog7n7OAa-wGiXFR5sbzZvTC7dmAjdfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX2gvCXT6It8y5
 wy3qqAFX9zAkD960uK3DpESXlKPzI/CRIixGmaojOOwhzMZTnW+0au3eScRE+LanWxjn8dJAKQl
 4SxzrCzw2L3i8XBhni0cmApM9nRI1A3HQpsX7bi2/faNUM/EwrCz2ewX3y9ctwdbz1r98yarrjG
 7E2AXsBuKLP7E5FU0bgHI4XGFliBwnfboKbgy7PBg/KFnKr0b1B10eY6a9v/l7G0aDGLhYiCxGn
 89sVx1gXfnJfS+Jf88oJ3ZPfOPUyCCJmuXvFZdPkucOkSRcEIQ7fh7Es7X9URSgDMfG2jiUPGFw
 UFnZF51gC1rlKwKtanUNhkBLRj7wN16Scr9oVxyj6E9Pq2dlUD2D2QV5vZ1tl+901fMEQj3tOTe
 cuB/A7FcvMSuMelIr7h0f47E5DEhN4IAAZvZ5NoF72foiNjeYYCbe1F2CfIyhUKVHg3zgQy5Wr8
 w8Gj6Nupv3p67jtzSsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX+tTw4s18WTpl
 lvK88/ltdzE0V40mYROwRPADwDbuO2NO5xz+YLlREYxiEGHncoRjWe8QA8SWkYuICNGs4iXO4CV
 lzGPeNfjQrnZWijKObDJZkvs47Mylbk=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2a402 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Mog7n7OAa-wGiXFR5sbzZvTC7dmAjdfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
