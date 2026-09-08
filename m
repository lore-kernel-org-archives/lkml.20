Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400F38F633
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852255; cv=none; b=AwUcyRRG3AGo7pcgRJEcx6/4WvMgx1czBYeMEJGH1RoY6XHxPayededRy6fgFCsXdcZcf2VRYz8hIuo7i9fWfYU39jPp9NVTSb2x/FJhLimKc5GBxz9msGoObI3NVLS8vOKxcD4pTPLjJHLZGTbrKibOdtv2XWKWMJRcDk5YJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852255; c=relaxed/simple;
	bh=68mN8dkbcC52j8QqeimD9o9xvyvNhT0HmHwPEE0CFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7SpJHhV1hO/eWndzZ+Nv9MzB4wUVL7eT/tfnsjTWamlPH3HlIr4EWCueGTkfDh9p0lRbANels8A/Gr0GTBU+rfEAceDLd1SJs+5gBGgguPMN1HDPr7BqKwJJFkvQNQTfnxm5v/6GFtRyS1W47FqkpRIAmsRAz9uVS4ia74arFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKulF81J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0eqa/5Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKulF81J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0eqa/5Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M4nD2712507
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=; b=nKulF81JCCJ0nrgE
	ZuKyyZDC+NjlFSzBRYTl0v0ea0UVam99BTdr44yFbRol2b3faqm5S1vSz75QR2hM
	9Y1fP3QiK5r3JlGthx0ZpEPRf/antQ1WdKTybJdgedXB20Fy0EhVTsghi6wxhPO+
	IYlFzuKE1I17uoTPRp73I7hm6yo2g9/k+n286M0hCAOsjOHxQFHstHgrknfdEBFd
	MTFoxc/uZGE8S71kmgKYzz5MLyvHDFUzbt6XEiJDSYH4e8T3vIq/3BQzwkDNKxSJ
	9hi9yzM/MPPGHbyabmCPCtBR6htjnWacbeJClk+shlUdi4EZQ3TjmXvDk6zn+ERq
	J/Y1vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm1ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:24:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so47312285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852252; x=1789457052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=;
        b=f0eqa/5Y2ITAHYnahxnfEAWDoAFgYYGx9Z4hNSmOtm0T3GvirgOTQ5E7H+JGya/p74
         xfnVnN6l2sMVKP9CfgKCmJjgSH8uZ8ajmP9m6VSA9I3AyubgUI1df/UvtZJQ/mndxfKA
         sOEzFA0cSi5jeE/bMNqPlyAggtVdlAh5dKF1yHg68+GvG825puJ/yQjcsLQDkHf5KeMe
         aTXTgb+ULZvsUDLbZv4s0djivudQiKDxkwPj2RS4PFWd214soLBmOsRDJ1NbceTa3O8P
         veDKHxp0b8bGtzyUGbi+bP/aDgXpa1K+zrf3zTQbXaWYMKBSI4/QoE/35e/LQyLEJS/G
         r72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852252; x=1789457052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSTdAbZuX5b3uCyZlyb1ZNj0p6TKqiw8GA7ioN9oUuQ=;
        b=L6l/xV0bGvWa+FWNarjPORbSEBMYD3eS1KLL/Jd3q3J5paeHPj3KI9H5v9ireH57jH
         3i7k5PF7QaSY/Zsb52MxrgpYAk+pkxz5lIwRqYXOYL7Qhj2egxc80KU6xFVBtjzqvsQd
         J/8s0x3TOyfHzf7/xkOsndt1OK+GyS6WaSVPBQ0GieSzyCKqmVJU0E+CHXa00B5yC1s8
         eeknPxVqSBDTDHXyzIbf22KRPnKfzzCKIdrdY69ZCglX/x2o6zJqHWp1/i3dxEO/bKL1
         uAFqTyQwDoweNmaZKSPsG74R+qYO+iFY/58TupTBXJyfkqhy57DKlI4zGMpWp1aNP5gK
         pd1A==
X-Forwarded-Encrypted: i=1; AKwUvBzI5H9lGwBSw/TJe/1jEDhR/nxkUPX6VzXZrnQAYQYzs45M+1Dkl+JH9rs2a65vQHeXZNLvpcQ3XGZc/Zw=@vger.kernel.org
X-Gm-Message-State: AFuF++m+jUacncROy5GsAK3XU3keXOoqE9XT99dfU6NbgebfVpAIxJ45
	UuzeHCb2WM3a3pxUxTYWFSPvEStAmx4MD3tMmSM0J41Irh44/eo12PuGwfaXLnYHwplFcfRSVae
	kv9YSVjW+eTRNHxAQwx8B2h/w5fks47+p/jEpw6dgn5WTHfYdZ7gtUSN8NqIa26JQ+qk=
X-Gm-Gg: AYBFou1yzzq5vUO/05CnAi8n0lMOnbQX04WhS9dORT0BElipGUTvuJlPK8jEFdUv9Om
	gtMwF2zv7OHsnGG2Ll7zk7+rcA1I0SK08UlMlt+n3ZyfEtmhh8gdeOUJml+buqeQUvxOJeNP3Jg
	G6kOa3K0C1b1eEqW8mb6ILtEIXqkeHnI3i6W0UnHXy02lxQQBRiuLjNWUYOPmC2b7Z9Y+0w5KIO
	34wCC1cxOdaq8m0eqG64PkND27pRKG8yZSwR7svdBRdEYIwSsqu2Va6UDhA2qCSfcazQfmWPDS2
	+lxBF/t9N4gsXjiUdK6dBV7fOTM4jvLgEY84LSj5OqNCJGAyIGkxjcV7QHdIGs92Wbhwaw/5gWJ
	byRO03R9VpfVHt5CXxxLs2A==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1700387985a.5.1788852252446;
        Tue, 08 Sep 2026 00:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1700386085a.5.1788852252023;
        Tue, 08 Sep 2026 00:24:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6db293sm571789066b.61.2026.09.08.00.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:24:11 -0700 (PDT)
Message-ID: <edad7581-ac99-4d76-9320-861792b07082@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Honor IOMMU provider's #iommu-cells in
 qcom_pcie_config_sid_1_9_0()
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260907143349.317495-1-mani@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907143349.317495-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX1Gam03fuVGnE
 KNwIknPdwh2NrCh+V/Sl7X0q/rhTLpRM6ZYSHuhUQSnwoK/PF/lOJC1Z+biC8G9vXG6eheXI6IC
 jyFiIb02Sbhb5MYTp0wmDY+qxWpvRy/JnbzxBqwi3Uzq6ENP00FYSpqlCJozTdsSQvIW+q9/1ex
 LvOOmrR+/KSqYETgymc5excYldOWxCVnTSVYMMnlWMVphid/Ia75yMPaXxd5uW1Pio8MEiw/SBS
 0o9pWt9TXlhYW8yh3srJ4OYsDO2AAmmQT9tKD1qh/NPvk1By02c9/m2IC0r3Oir37+Zd7xrI8JH
 /A6KUjQu+UVVGMCJHMpzvbS3qRUavPtjst+Njqgr96O1BXUaX+j8gasPbLADkTi2IlZDrY+iy7r
 l9Yw+hF06UUIaVktXjGI+8x6Od7rd+Sz1RL8QmlP0KrhA1gInPtDtCExMTQlxLBIDPYoZ91Qpiz
 spKYdNDafjPu2mL+V2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX9WkA2N6K8Qd8
 04oIqKJ5LseWTqvsK4egRyhrUKUY5cMqPD7JZ+1CZENC4mY/+kpAKNT1HQzDObMYF0xfGfgznTa
 GjMqZxaBtKCBX5HnTq1T7lMvUyMAfm8=
X-Proofpoint-ORIG-GUID: LJFf_8zUrw3GPZBL6OKLx8eC47lkVszR
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fb81d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MdwB8lPkXo1r4_ePphwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LJFf_8zUrw3GPZBL6OKLx8eC47lkVszR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080074

On 9/7/26 4:33 PM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> qcom_pcie_config_sid_1_9_0() reads the "iommu-map" property as an array
> of fixed four-word {rid-base, phandle, sid, rid-len} entries to program
> the BDF to SID translation table. But that layout only holds for an
> IOMMU with '#iommu-cells = <1>'. The PCIe SMMUs on these SoCs use
> '#iommu-cells = <2>' (SID and mask), so per the pci-iommu binding each
> entry is really five cells long.

[...]

> +	/*
> +	 * Retain backward compatibility with DTs that describe iommu-map
> +	 * with 4-cell entries against an IOMMU declaring #iommu-cells = 2,
> +	 * matching the fallback in drivers/of/base.c::of_check_bad_map().

Can we export it from there instead?
Perhaps as a follow-up change given this is a fix to a current
breakage..

I was hoping this whole logic could be simplified a bit by reusing
the map parsing logic from of/property.c, but alas it doesn't seem
feasible given we essentially need more data

Konrad

