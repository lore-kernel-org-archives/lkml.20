Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F93BED42
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766594; cv=none; b=ES5FEhrRpEarhfVF8YlnJWpr1A6eL2T9lcj8KXlpGZ9VaEDbiXNbhnEJzFfszsaRUbwC+D9Uvxy6t/PojqDl6gd6q9o/mRAl8ZkRAPQ8EuhM9x42nsfhvqT0veQ0rgjJ8c+N5YktjvpLRGQUVaegzGnN3b3083RTO0Ny3XR5U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766594; c=relaxed/simple;
	bh=00A4izmS3+qqC6S9DjNshzjIp420gqhDfuHUMZL3ozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcYvp4t5+lzOvY8jXi8vHB2NVERP8hrZZkaGbDeiDZJnEfzjV9bWes27qk1nIFezZRaUhdqEqGtQZ6dFYaMczVoVAfwO5T0XH1KyIR7jbvjf1tdaXoKkFwBmnA02Cj8JPH4Bck2Y12XxZ3y89v3u6A9mSi5CHH2GczHPJQzHSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORr9shmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRmwdeDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORr9shmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRmwdeDV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7iSZ2678474
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=; b=ORr9shmd1lZq625v
	bVNgw2g+TMvKu5RGuUJhe+EUi6QxX3PaJ5IQtJcWedfQ8VVsYzDz4NW9SdaOzLtM
	tzci/c/Rbv5B1yWmSN7I4u9e0ULaUhqtIaEj9Q6BkXpCrcu1pHLQFKnIHq+Ev7Zz
	kehui+ueLSIOv8laPZZWiwQQlo0P2UV7ZnF8dEdtYNcFA1+JFm8GBv4KJQh1/DUu
	bYC6umuFudGzmcINMPDswVDneEvX2EFWlugQAowC1Bf1RPVCGTE78tReVz6MTCQp
	QIcKUA2KUD5xyznngLrXwfMplGR7hJN6+OPzIQrISr5dqO+QC2GYzie5sjLpg3Ux
	k1xKlQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj5am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:09:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso9648636d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766591; x=1791371391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=;
        b=iRmwdeDVHr8SrWRqlqBhTBENS6BbtLFs0RZjX5r5MIzUyipNYqpbwfBwmG9hev6HrY
         Mh3jO+usyZ9ivAFYxESW397Y1qdZJStvSz4k8iSdWhcAJoHM6mdoPzzr7MksGtAXYzvR
         LDMoRTikhQqf2F9nSYVrtrECCznbtM88gWdbijBKJ4SWsw3y1BJOHByjF1JKwEmv8OQW
         lkNkCds6iURbfQrMK6jM/7MVrmGwiKV5Tog1lF9p0SAnFI1SgSc+oqUwGXtDuwAYF/F4
         eH8wH2V+hnNjxaTik8SCvT6usmDecrZS9+Vq/sVXaVU6RU06e+fjuDfwhWZjoUeNG9am
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766591; x=1791371391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdREyfHkaKXyyA2KgfRqNuEH6FRhqqn1hFmmztPRCyw=;
        b=EToGsnjRvreFUN1d0V4g1Lmszf2RbBOz/g9FT6afcgrAFs9zqelxfHNvtGSGGPKm6o
         e3lgpNGd/5pcvy0idj3a67DrnjwPvEYgDXHJ0kcoBDC6nzwaf0rncKZlsUhs/3CgvJdc
         5P7TrdjnA/SiYrhH0ucFIefm9lmpQz7nMd8BKteCvJrnpgnZSCRsdbnWXKnBpJBxA+gK
         N7NzP7hExGI0p+k+9+sDd/x5l1xH6DZ+TVNYmjGQNW7tYLuH/R/Peptu3031wxClZjuh
         K652hmVrMIco4U/no+R7vbq8V7CRIKu3YW8kLUA4Jtwo9eGDEpHgfECW+XcM/qI/oh2d
         xkXw==
X-Forwarded-Encrypted: i=1; AKwUvBzKGOqzLpfW4XMZczYhLB9PsQFBAwna0EgnqeszrvYR+O/mtBZhyj7K6jX24D+HWqTnLIvAbquXA+ZAtn4=@vger.kernel.org
X-Gm-Message-State: AFuF++kH8RlWZeUK4cCIlWucj8i5jAc9U2JMuN2g/+69/lrpLjdQ4hbL
	/iwut6wcVfscnistLH+3hQp9VLoEcPSkwxKY0wNZWLrxheXsS2oD9VyLtSNkuV4pCMcp/uTVoPU
	lr/mTOgSd+gUpxJY99fJgnQq45lcRLTD40UOpxfF7m3AEL1K50X+6LBHBHsl6h7CQVTQ=
X-Gm-Gg: AYBFou2KB81JPFUJpnvnACaHLYxgYlThmEaJLXQnqfevhADOGstCwjX2a8mAXDcYtgc
	kLZ7q5ihAEicUhm/1dmB7y3iq1xIU5ZZ31Dz6542eV4loTbBHlH2KMKHGij4csY8sntz89xQqVH
	50EZddwSUFXE2r+DIiBiytE/vdDAqIBZw5UzSEBsuCI3s5ZboFiGPqyyIxCnavIQZ49wHMAPTmN
	43mHk2S5jzuHEFZXoG6aXt4XlKNwyj52n72Ag9cW4FmrxAEGwY/yDI2vdXKHJWegDEY7tIAHTQL
	GcI3F13niGAMc/WXy9MHlr9kg1nHf4PymqOJ0SOavC8ZrL9733GC2iltNLeQy+TsTaYPZMWW4Ih
	pwMQDk9ePl2/0dhfuJETyQw==
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr149389785a.0.1790766591448;
        Wed, 30 Sep 2026 04:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr149384385a.0.1790766590966;
        Wed, 30 Sep 2026 04:09:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15c73bcbsm644653a12.37.2026.09.30.04.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:09:50 -0700 (PDT)
Message-ID: <5e1b9e97-d4b8-402e-9c72-782c0a73e4d9@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/15] arm64: dts: qcom: maili: Add CAMSS and CSIPHY
 nodes for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-12-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-12-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX2bAWVRI9M3EN
 IAc4RLN6BQbzU9WGCxJJB6de+rCmasaK48pk7Zh2C0xPRKovnTzwdszPHmJkDpMnv3FeR5syGS2
 BPe7qKhMhDu0FDKj+m9OOBgrzchELYQ=
X-Proofpoint-GUID: pKDYK-R7HCDi_OC9A1ENzLkCHxIGFrj1
X-Proofpoint-ORIG-GUID: pKDYK-R7HCDi_OC9A1ENzLkCHxIGFrj1
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcee00 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PJER3EP_5_adeMidZ8cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX3evGOh3R+RXu
 LYRLxw37rOn7lGsKeFw1u1MetMps7JVTOSXaDRNQdv2LSP4e/C4+Y+pMD6P1VK4WBpsGGwYT9Nq
 eL8LOZckaIWja1Oj/PecNZDeCZwJ+7twxtjPj2jKOkJitoX0Y4LfQ9uYj0B5BQFZP6fkZBT+KjB
 TsbTt+t6aBISungIZh+arB+pwUhyPdrqmcuyD6P19vYupZd7iVAEnRZFMXQ2SMMXF7OfwnH38zS
 mgEizr/2TSiOj7IpcvJ5fkCuNHH8XtRMQj8Cu2OqORDtxusC0x3uUFudoVkXiXYF2IDM613gL3D
 Bo9tgJq7tYbo2X+oiNtaNGIamywnnIfhSt6SvDls/hye0O6TO2bXq0z6RrUDgxuJYgCwfFQpsSi
 /142cpJZvqOGU9+HhN+7TETU9ALJ2IS6dniNCgmHbOU7hdrMdh2CY0lUQ78FJM4L+YJ9wPd4kdT
 3l2PqbnFK/woVSLDxRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Maili uses the same CAMSS IP as Hawi with five CSIPHY instances
> instead of six. Add CAMSS and CSIPHY nodes reusing the Hawi-compatible
> driver.
> 
> 5 x CSIPHY
> 3 x TPG
> 3 x CSID
> 2 x CSID Lite
> 3 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
