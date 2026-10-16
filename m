Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84554706C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158627; cv=none; b=r4mDA5HB9u0FxzwWrLv1jOSYVOYDebzN2a9QALTG6yldwf9Z4I3KHoNbsHqMTdftfJJ8elMdyvsXVhh03xlFYPEIY8X2knA1MsGNA4LB078ce0ACBPqqnllhwKBcewYy8oEaXJkhhknJB09IBoxcNbqlYakDVMg1zmlbW8yj554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158627; c=relaxed/simple;
	bh=89kIaJQIhInjaSQR0lqJ3W6rutg+Bsi+y79NZy3l+b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbFhW25MBNmrxppSHQvl7SZP0DPN6LwHfVOo5Z2wQ4M/pKhAtC9J263a7ygi0AJPrdmmw6jbJQA3DARjEtpg46qi8mdeRcnEC0/wFdzsaFUbWcyw4pEFne+6uca824BDjD7Xs+rolrdUP3eZzR+d2U/kkDSbjc4Uu4TEu6Zowwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPy++eUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZVRSsyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPy++eUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZVRSsyQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAMoU488643
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=; b=CPy++eUkBDzE98Hs
	lGliouZvZ56v7lf3I92N+p8zcEsUqiaYIKcfh5k2xdyfFtac731HMM0rbc3DvXTQ
	W699YuD85lBRPz7Aqk7yOVkVPd9xU6lX2dB4li2EDNVgqFNZ+cGHbgjEfu43VGkA
	ZfoXlOVYb5YbWjdoBGW3CFKDCTEb1bj+9+CA+41bKox9+ZEnsIOhcSU76jbwkeuI
	G50cyDc+HbXLWfQWRV6Ze/qcf3lucG+V0JbOAf3IDUoKdAhylxzZMmw8dSACYBmx
	DJbzz2KGJC/hiljZMSuxyj1vUd+xLaSeR1Q1eZxxptwGismvsoAnTl/pVL1Nj7Z7
	ID5IPA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta3yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso260358e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158624; x=1792763424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=;
        b=iZVRSsyQioUfZwIKqY03F1hUOZlrhus1Fs1LY701K0wei7z0shl9WKxTOqK/SKvs4p
         ZO4dPYVNulx6PcgiGFLPexoycb3hMcE2Z0FCcUJTXFUW2e0XNZtnSPXLMZH0PBTqH1a3
         tUVgyyhmW6ISpcQOJYW5MqvzTRXnCeUepai9VjOoRNfMXdl0OQ16/vLZOnt8Y3Psky78
         9xHcwnyWFZYoRKwKs3fdjgBcXKhd9eMj888HRTUKcIZJeoO89zSnm59KXoz0dQ5b8890
         gXlFJIi7HqgIJ5PKeSS1e7KfqNZJNz6nxjzIYz8/iNck/Z5ru3Y3kKLo5KS3FN8wSw4N
         xZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158624; x=1792763424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=;
        b=cJAi0AxdkfvXMgNNBhOY0GHPPl6q9M3odkhUOVtiBBpEQAK5wSL9GK7DHwWLqtA+jE
         L60XKpusITxnqYb+pbrgj1tJbKO8ZsqEo34G0izQMeJPSldO9EU43YOraFLzdw8zlXJ5
         Kev7ucCpfaV1ek3v3e2a1vh1xwgnHjBaC8KiUgAr+wsvf2OWlqxrbgG8CQXWOF6gB6Ee
         gKKQvbuApvYDEX7gvCEgo3sBOoL5GMewtyM3PhusEYBHFpQQHJ0lPsLj3WpfULr+MDG/
         vpUxCLBEpCwGetmAcivSqZVNdaEdIJe7UBpQaM7m9CO1/tQpK1rHiZ0GmNTqLBfSsUVA
         pUTQ==
X-Forwarded-Encrypted: i=1; AKwUvByen6MKPDKgqeVhL7eYLmMdFbJtL6awsblPg7riAlPwLAkgwXKyMUqq77cXIbZ+842gbt2r29aC9zfrWNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXPptu8WmsfX765KVNblEYd/yC2wDySfPeIR2zA1XV2azxGkpL
	Umy4taMziP2kCS2mxHzPkFZZVWKOt7yI7pg5c9roT7YZMkXPsfgMWXynL21FRhGKtblP7iBPNyQ
	tB2lNi82CkDd66o+4SK2g38T10UZgSTzx26uccf7dlhRO4zV9ZzHQUhZGnpoRgKIP0JfZnaRqAy
	w=
X-Gm-Gg: AYBFou1KSD/pmaXT9vnjTmg4e0W+G53mouHVUeWEIs+yOgbd8aholaeLSKQBKMVHVi/
	fFSwBDGPLc+mpMlF7Hxn4KLuVxv6P88nGNcrzFB9h/iYsjYhPVs5uRRtwq8W3LYPV9wjjR39KN/
	Wzq3NC8pEOURPQS+AHWodcEQLg1EgErohlV5OXUqoVqmLgdw7xV7tUPvQrPng0neup6yy0nK5Pe
	W9zSs08s+yPNvb6hAsp+FBTe4p2fpyr2uGNTM24pmQEbFyElcKStXfnMjCyLUo3hDLVknvKvG2G
	z/kPegA4JZU8OtfIWC+yTlsQAej1vMqsgerA8PSUG76do6srEQOKr5y6wJ3TcTS4WfVfz+eW0Jd
	sI1arlG2Mq0XO1EhpCoOOCQ==
X-Received: by 2002:a05:6122:4fa2:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5eaaa65ac81mr10515e0c.4.1792158623922;
        Fri, 16 Oct 2026 06:50:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4fa2:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5eaaa65ac81mr10500e0c.4.1792158623439;
        Fri, 16 Oct 2026 06:50:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm73753066b.29.2026.10.16.06.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:50:22 -0700 (PDT)
Message-ID: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfXxXiB3vNigKmn
 fjBjq+dIbejgdU4UTNzHYtGWwZi/oFxia6nuJ43SCXQw0VIQyleXQhHJCFf8OlwrJ4d3uN4+hB3
 buP+290GIYTNK7rDnaej3nnlJNz3OcOnMlGf9f6IvoGwF5FRVgKVJsUNn2oL62iquoiaTY3/8H2
 7G1HXipYlf7IcVSjwu1emhURF+CPBLqnqpoVmPJOVjNWxeSr7bIGcyeDU9yUFiSEnD5OZD93fJ7
 jffBgto9u+QDzqUX59t0lIbXjDmgC+TYj8JQAM8uOFtRtFqXSguUkjyyXTF0oYd8cQHXGLmN4/z
 bOu/UEzRBJG2o/MdMNFTHqdvQkhKV6uG6SIWWQkFtKR33/rDLTHi0hjJcQLbZUNfTBK1755BTEd
 toUiW3YTgynOS1Gry/jB5qMwAk6fnmGOvpWP5MCeupaJjPgjGf4dDbfS+hEXX0GB13PLam3+xhU
 THUZstrX3fAHPmaaVHQ==
X-Proofpoint-ORIG-GUID: -to38eT1_3iu5HFlv1-EWzmSWZ9KIrjI
X-Proofpoint-GUID: -to38eT1_3iu5HFlv1-EWzmSWZ9KIrjI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX1xmqWjVuee/2
 iBzhJqUddmbINumAns+oPFePTqr3QcPt/2+afelfBgq5nmyrPwczzI4qt5yObKWLBnWrVuDKp06
 XLyfQCBIjWoO+BbMEzmlzzysEa1d3Vo=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad22ba1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RiPQFFr3Mvuh7BT_tTEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160055

On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> that provide the clocks for the A55 CPU cores and L3 interconnect. When
> the APSS clock driver probes, it attempts to reconfigure the already
> running PLLs. As part of the reconfiguration sequence, the PLL output is
> disabled and the PLL is placed into standby before being re-enabled.
> Since the CPUs are actively clocked from these PLLs, removing the clock
> during this window causes the system to hang.
> 
> Avoid reconfiguring PLLs that are already enabled and return early,
> similar to clk_trion_pll_configure().
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 60173b076cc5..3641b2da92cd 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config)
>  {
> +	/* Check if PLL is already enabled */
> +	if (trion_pll_is_enabled(pll, regmap))
> +		return;

Please add a debug print to match the other similar calls

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
