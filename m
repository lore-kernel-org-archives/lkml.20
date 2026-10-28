Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198267;
	b=xDG7B5EUT/pYwkDdeaH5m9mFmQBTrSAJz0wgSDHyTtnbMbdof15khXA7hzMWICHZBsIf
	 lOAQ2KD92uzuBAeOmp1xJybXQVWuAKIsBMld7yfErBSi5I9DQa9eW9GoDu8SpzrkkhYOn
	 pSNpt6Rj/cxLDOYMV9Gzv/yDmNqonPfEkAS3wXwuVtmHDhRQxVAAQKIaz6g3IOzk35I71
	 ENWD+6iY1JLlYUlhWFMhIigkhE9yJpmFKWOiTlFaGYzXYELW44OiYzfFthGQN7P+6Lyug
	 Bk9EqBK41XNoaERVIhbmnI8K9re5bKhxaWPA5a69rQCM4sR++XLqXM3sig638CMEUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
	b=wpcYbE7vHoxa1W1/yq9NimeyOXmOiG3jCRTFYyJeBkiFowX7PQ9Z4tgibjrZmNGhMqaB
	 MEjnE2TY2+HWEMM6TEzXR84+Gp3HArRuFN9AY6jqgvS23TBvoXhY2lomEgQ40IRXuUuT3
	 iiTrY4kHrrfr9h5iucWsb2X62IYYC5KoQdLyznx/lbG5LJ6xrRwSJoX0RB/5gOKUqMoy+
	 AsppUrqTiAewWur5/DCnuC8UtoQ0h1Html9TaI7dBFlLeyePs2Ayoaj7yEFKeL5zAGzsR
	 FsvnKXB3PyGmB1jnju70fn/cdB7pvH79tkMH5bLFfVvd+3Lr0y56v+aAZyxbGL0I1EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2888606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2888606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6de1053363
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=; b=FVHWF99am9gDr43l
	/MBzYTpcJkCmaJmT/GUjkKS5+m8Z6Hcs/5JOnOZZKLpOHZlL+WSrwBLJtrVcyTP8
	PgJpYWqEOMGojhA2Ya+g8bpbZyfoHdbaRByTv6JcFoPQQMfAmxl8lD9dGjlsWd3d
	gX70KW7uy6zlEmverd/ApanB3UsFStWYZKR9q9GNusuiW6l+L137WR4G5QLqogdt
	TRchHeWnnDaJ4IqT0frQqv0zbXG/bS9R6wvqBIprT+Jk/0g9FVc84whZuYe9y8g2
	sLsbeoaXqP1QUiAJcYKuzc71wbUcvlsjvI9a/1k1zct4vLF1soVgFPE0k7kxhf0v
	Z3USAg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9w1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso89343e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198265; x=1793803065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=MqQ3unHqxsCb5N7+MkV9hsH+XFJ3H2V0d8mhOdLsLf+Sl3YiNsJN6ekBNbYaGNhlSH
         rHzvGdofDFQu2vcxG59RIz9K97+LfWzG7qZB4JxJvqr3QOzuQc2sl1X2QprR9WJX91cR
         DWox09ls/plGBKUPHp1AHy/yq7jnBC9LiGCR9fbiG3dQGXDMu6lpuWlHfo7Ea+9P0a9E
         llLz75EKsUmdPon/5oy4kTQIH0l85DGNZmIfV3w4JD9Gm2O/q83Waqud+tvhheZbM/Tg
         t5ntZmK1BGKLkTAcjFq6d0fEwKqq23/LOR807DGwu/2vEIuROA9QO9ujUDMHVbCj77A7
         1eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198265; x=1793803065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=tUoqjWNhlGs+Tg3ltTyMBjIU95CtP6hlRZgKQIFkddcGef0KSTuKqSQzoGLxDVFbZ8
         McB+T6FUhkNOkOYhPid4GC6FnYJuSsP8lKIK6KgEvyVQIvKvesVHNUiyNMV4F10gI7Vj
         XI4Evrufuk/OslIswrogqWslOlRH89dyllRuDBBqO/8e9VULAa+i+Op5IiF2HF2kZWZ6
         hPUE5V4Xup9nbLPiWAql3kpDUXtpqGP8yaxv2MgBOOxmZgRoPIsIUiJXmL4zmrc/DyfJ
         fy1LpxmJU39cC7ZD1wdtkzx8j5Qi2+wDpDL/lqwZ6jg0RaKoS1hRMbheEnX0nvy6xqj9
         Cdnw==
X-Forwarded-Encrypted: i=1; AKwUvBy9/uKKPl1Ug6+nPRT8ShFN0Ga42AV9BjVkwMpQvGqOoGG+V5JjkN+6Lnq3TRMedAgIvTOoo5KuW2WEC3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVjmx0TF/KRF6nE0kbxQqIBE6WtLr/VyjkkF/K9tP0JjSDhU2R
	UlWi5qUpiPjceYGkIOuOA3Pbu4jGv76wSAaCO5OgGAbSy7MI2JzwlBcn2GZsgu7AuRI/Y7WB08K
	jEon/4AZTCQgYhvOr2XR7VQVdnF5GHQMdhnkzMEY5775PHin7dwE+0BGn3FR9iepBc6s=
X-Gm-Gg: AYBFou1dXXnwR5YJMwHC3U9p+vpJNyrDoKZfs1m2Gb8XtlZcWaUGPA+CbbEqynR/28j
	dFyJBbHrwzcwryyGldhoggj4qZMsDo1L1xfbKGmvyOHLtVqxC7nEwoFrxUNIlEsgZRLDs8cd/cZ
	OvVevtNMCQ+eLl/BpQI6/jtj6ccNWpu6mooYfJJsNZS5RkXn+3Z3lXVY5JClSD+IE3F78TjBtx8
	whZuMLgcH2CnEbYvly0pwBs4osRPxQefQT21zKn/jRbLbNDynaKWJeahYWctMFB6gFbspW959T4
	mtm9ogdvyJCXRUTxIL4uBrziJ0nwz5Ft9khziStPmoorQp5f3YSXVjHx1l4IwO2UxFknuj8p9Hv
	VZJen7OsKjCg4FXpHMcyOfNeGld+20lXZdllz8nwYIpO54JazQkToaHNee0Iz+RrfL7662Mw=
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211469e0c.2.1793198265143;
        Wed, 28 Oct 2026 07:37:45 -0700 (PDT)
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211449e0c.2.1793198264694;
        Wed, 28 Oct 2026 07:37:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:43 -0700 (PDT)
Message-ID: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:40 +0100
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
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator
 vote for QCS8300 and SA8775p PHY
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rIF7yjE61UyfsiNN2D0BgDZdC4rXodgN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2fpY8ATX/Wlu
 Uqjg1FAM7vgyi8V57R1HoOQTmwwebN6Ejp1XtgPMWX3GSWdPz74LabrlrWAuFa5Mv3OQct81xtU
 Pumv83yJdZkndeuoWHfPndnkZNf8P8E=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae208ba cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t5PPnQQkLeIUCWTc9swA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: rIF7yjE61UyfsiNN2D0BgDZdC4rXodgN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX/TbeDtmXd3U/
 c+lZ1WsUa4IyxWSYdD2ByeuHFC5XlajIomPBMGFoUXnIoRkTmlhfWRaVP1vuzIJUDwz0vYe0E+0
 sAZtGuQPrFzIP7MKgvf3gstC8uRSymDnUYIa4BrDYT3r0XKPEKL2WdATLU5KbtexICRn+WgCV3O
 Q/NkJxfyFvSxrGxks442ZramsjDFQ4cyWB5CACpjcviqyGwYuyoVN9c0ctboKVZLs2FFN+yXCgA
 tFQ0DW2lEo5m6nidUuzTwQ08rT/viiAwA0/3lof+dtoiOaGes8UyVNP9PXUSHlOCD268SuIvg3q
 eV0jLUsyK32dTyISSeHqWdyotQ7/PnK/4EIHLgo07+X4tLG2kESi/LYyDSR41tEXhMbzzn2DjO2
 5WhFQW0zGS3WmujJz9eKcq25D905gyZ5u6371KHx1L8rjoOS4qCHACcMLVe/DG2EmLE9WKjOBT+
 NdLJkajmnbDT+ladiaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> and SA8775p PCIe PHY configurations. This avoids modifying
> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> 
> These supplies were missing from the original driver, which was found
> to be the root cause of occasional system crashes observed on QCS8300
> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> lacks stable reference clock and voltage, so the PHY never becomes
> ready and initialization times out:
> 
>   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> 
> Note that due to a hardware issue, QREF actually depends on refgen3
> rather than refgen2 as documented; refgen3 is therefore voted manually
> via the refgen supply as a workaround.
> 
> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index da83358c97ea..ab81c6e584a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };
>  
> +static const char * const sa8775p_qmp_phy_vreg_l[] = {
> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> +};

I think we could grab them unconditionally, as QREF/REFGEN appears
on most/all SoCs (perhaps with regulator_optional_get so that we
defer the correctness of this to dt-bindings for any specific
platform)

Konrad
