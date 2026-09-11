Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085443E5ED1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100859; cv=none; b=A/+tzzc5i5ZlJsBJIc3qfhOzI0z6ZffR5GYmHttYPEw+iD5O4mwiJSufQXOdTv6jV3LEV3qQv4+Ln2P5TMijRE16PF8GAcm+AMwy5najWMgxcUh+xvfWybasyKZ06QhdajiefM/cWhs2mYsAvKUsT4IGzIqkahByPMy3t9tldFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100859; c=relaxed/simple;
	bh=l7BLvAbP/Pdv6FGDbaIFRrv/1rYKCBm7pQkhO5EUGVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZPJvfYJeFbC53YVJJjM4uGXR7R/gs+drZy+txkwlJrLafFGDhakDUHuJqaFpqpitiRo0YIwlxTCGAUXVBCPi2e40b8NrC4CG/TjqscGYT51CNEge9V/dusCiL55dprTBHJcPlZizdQXAmPbdIo9Ft1eHUU3yshxKyqKpf1Ss6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYRqXudJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ/673VJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYRqXudJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ/673VJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4MJ1A3229558
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=; b=dYRqXudJ6cp0K3Fr
	SWnA+MCtmlN9m0ze9mT0UoUcj+e2dtJl6W97lWufLI0R3kM6emFYjMwts5b/a97E
	MCNM8+QEmxYWniSSbYxfw0pyYoW2pMyDI1YgbQ/5yTDYNcsrHLCZDHJgf4SZYITD
	hv8NOmF9IgEzER8l/5vUetm6/3tLXVZ+ktja2UMkgKHp+rQ2IwVM3FpuUXcbjSBG
	kg8JyMISdIeEX73RnkHMg+WJLsZhqZsJ8+zddq2mMpqZ+qkRFO0o5atbhcxGI/nN
	xv1swcfZpqeW5ntAOX5c6xRCNWyMOxFu3OWyBW7KyhMZ3Jo1PK9+aTUxUTogEF3G
	2qV0Ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9ufpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:27:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so741794a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100856; x=1789705656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=JQ/673VJXxLW6QYk8JRW0c+skjpfP+JeHUhsRtWBH/EyojGkToWBjCyjGSDdzpnhZ/
         NS6aXz/DyjsUlThwNuN9wVxLEtuNJqzvn44UF4//QUImWYxn+TeGv5l46xQ7S8/m2NbI
         OtheR/0mXsdTRKMLD8w8EtmJU7x+qH28QpUB5jfDQSsW9hpkngLDPV+XPzqLDIdtr7hW
         +3YtOcY5LWDdlBRRFnig1whsOUb9rqpJyrKp9UeFBk8Cf2bLXjBYS5pM6y6mShyStqhs
         UTZb++RHqivCKiYxFMibsSjG5dGul+cesFPH4vHIUqQ0LaASPMYCmYPW9mmpwuXxPjM1
         OUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100856; x=1789705656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=UpB1u5H8Bwc++phMLCJ+94r9m8IHO/9N+7LDVeOEXpqqhSlcAsSaGBA7MIPmJp6U5k
         4Pzjasgu0QnvnjDCuAnxZTv30FRgTME9uWL8jF7uUy5RTF09mtOKP+mAq/T6xURVR+NN
         9pKppI1b9lySd4FYKDZ3fT4uT31mY/7208QJoHPbUjJOgXmUORMN2Hibrn1OD2dE8CaU
         nLZCtAKdmqIKvMBXLZScKYNCczbkuC8ozyRuRgVWGq3pL5c47gPWdtIgC8PmBgIB+P3D
         z0B5y5a9X7AMWKuDknVQwIO4iPc80KD+B82ECPftKCNCV1u1H2J0dIg/1pSDtvdThAU2
         uhxg==
X-Forwarded-Encrypted: i=1; AKwUvBzRjjF8/eO52pIHH3fyK84NipY4L6QRUeVNIt5g38NHBikxooa6hXl3qZVDePeFJQiPOygQlu9/zxfLFSY=@vger.kernel.org
X-Gm-Message-State: AFuF++mSzHXAcbTxan1LcSnRCYOrXpR3DEmitSBhqf2G5VMe/pUmDyhZ
	PMpDhK0Zfqls2IBJDiXrs/je53mKopNfqzWH5ceuML0voCrjSV0lZX3rjvJTDMSYUuFIGwomal0
	5K3fqvtdwiisnaqz2abRr7SrNk9u+smVj6iNoHdvtpGxwba8aLgZOLsXXi/6cLYRgucc=
X-Gm-Gg: AYBFou0R20Pw23WI7G8VggvoeMv2WALgXJTYz/wINKBrVMZmOfW3yBrj50EuNdoVCK8
	Q06mqFnZgHkrfsz8U+BOo3c0mETs37/IBAmnMWZNzwPcY6iX8J8yCWnMPEoZxcZARwndwUenCAa
	CsE83qVHFF8xiLRBuuG1WgDLIPAFl4qyh0TrcQqh+wC0il9VNq93/eESn8PjSuwoP3Bfn8qfoab
	3NYNhL1kSXSKx7S+2hFrn5IWkwEp2pztoQShLWKTha6+47U4XMS684fa7JQ3M3I1axKZjM8f+J7
	J+N8Dgai0UUaHt73ztksgFdwc7Ap77wc9hBho2mOVh3siLpl75VqrBeCvzkJxa9syVgTWlyA9qP
	KVXOAE9a4ZNTMfXU9OPRC8RwFXlY=
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4018020a91.17.1789100855693;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4017972a91.17.1789100855066;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3072419c88.6.2026.09.10.21.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:34 -0700 (PDT)
Message-ID: <3e322428-7673-4428-ae29-dabd9cabb974@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:57:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX2fiUnw1T/UZ6
 n3OfNBfgISbHRR4Oi6mQvdlKhCaN/OyV+BkiZqrHNFK4VWMyebVuL4qQ8TpWrmIYLbbrZYgfIWC
 p9P6RqrY37XwlXl6APCvROj2Z9JcZ2rgJnXFFY6lLkAr506gfilxDbXXhFUHog1YjHjzmRXQ7/r
 UQp0tPpAuZzkwaLq9iFTTRshISoAK+lG0wj/ilkr5QTE/GSSih0kK4tbqkq8xSbzaM8QpkKU/T4
 9X9GmRhUBRzGG48j0ojS2guGJ/gQ14EkO6C8K76WBBrMA52Nq+MJUsK2oSeYHqZuXb/E56xhYtF
 lpt+8eXDumzesRPg0BOJPHOF2DNsUTIHsSvxVkLU86AkokPYIlxXqprnDTIpP2RZrERVcepW0uO
 r9vhHt7qOwAvuweUiSdSLEZkKpnit4XmrRWShy+1TMZLGX2VW6iZOQloS7nfVA0VP0emXaQ6Ost
 BDmq8jptogwzIyrQJBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX2T+TSaRbHK8J
 X6dHEMA6HkuHKmOYGyEXjhdfuHTY0tEWnMmqt3IeVR9It9YwWroMPL6cJ4GU7OJgYnj07F9txvq
 qTtfTUowlryaUOyuZ9O9S/Dt3TtkYOI=
X-Proofpoint-GUID: L9lkXAWZYQdJd7uYuIhuOLt7iFJSpCqb
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa38338 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5R3-X4UbMoIwJvzG15sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: L9lkXAWZYQdJd7uYuIhuOLt7iFJSpCqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
> Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
> driver to support both SoCs without modification.
> 
> Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
> strings to the binding, along with the corresponding clock ID header.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f65380747220..3e6ba5505584 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -16,6 +16,7 @@ description: |
>    domains on SM8450.
>  
>    See also:
> +    include/dt-bindings/clock/qcom,hawi-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>      include/dt-bindings/clock/qcom,nord-camcc.h
> @@ -27,16 +28,22 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-cambistmclkcc
> -      - qcom,kaanapali-camcc
> -      - qcom,nord-camcc
> -      - qcom,sm8450-camcc
> -      - qcom,sm8475-camcc
> -      - qcom,sm8550-camcc
> -      - qcom,sm8650-camcc
> -      - qcom,sm8750-cambistmclkcc
> -      - qcom,sm8750-camcc
> +    oneOf:
> +      - enum:
> +          - qcom,hawi-camcc
> +          - qcom,kaanapali-cambistmclkcc
> +          - qcom,kaanapali-camcc
> +          - qcom,nord-camcc
> +          - qcom,sm8450-camcc
> +          - qcom,sm8475-camcc
> +          - qcom,sm8550-camcc
> +          - qcom,sm8650-camcc
> +          - qcom,sm8750-cambistmclkcc
> +          - qcom,sm8750-camcc
> +      - items:
> +          - enum:
> +              - qcom,hawi-cambistmclkcc
> +          - const: qcom,kaanapali-cambistmclkcc
>  

Please add the interconnect property in bindings, similar to
Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml

-- 
Thanks,
Taniya Das

