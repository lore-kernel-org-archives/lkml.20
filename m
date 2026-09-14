Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F955402B9E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383817; cv=none; b=cScBbPrtuQuAsfp7xazwz3kl0b+kSRb7JTAr1HYkWlBhIgSen3v/93LQOjZTKkt2+/mCdFTZ8TbH6iyxoOZkRYaLDFY8NzsyppzINc1FmHcBQoXa9CpI9Xcf2evNU03z4Hwl325MnuhugFvFrxpqFTEQtP/7uLX1kge24SoVOv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383817; c=relaxed/simple;
	bh=6s485u4hsYX3q0MFvfZq3ETXD6xoKXpFGTAjFn2Mero=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwRVkD0jiXpi64w6t5vJ9wTXdXPLcha3Tqrn9o21ryz1B0ErOJ2VJJTGxIN4IEzt7FLlBe3yXREugW642YFDx8BYNik/9MrRmheUK3t9y6k9kHadHcIJhed6qA1Y1TmpvHD3TnxedKE/UJy0qztjHU96KWBpbeZUsMDGZnttidc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lvl8iQ1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWBusi5w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lvl8iQ1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWBusi5w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1Zr901881
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=; b=Lvl8iQ1ZHjpUnBCu
	qs2lemQF2cn9q2OFiHv468EBRV64Mc0iV/s+LYh3H7bAU5bZUSCNTwarnH8wgufb
	RY7KtcFM4nqcRo0BGT+i3gtJfQoK3P8MSyEtmvLRrd4uzj4uhLonKX7+po/MfMyL
	AjTej3k9So3N0J5BuhP/3id0QgTEi2qEZ+UkuM/W72izsHk5ALkcbEdKsZ9A1fek
	asFjBfW7xuacj+odCA8uxoY/q16TMCLg8tfBvKWG+R3UIqWsZJKeaZpayvm3atHP
	TQifkfrLGzSroyRgldhPIMGROAMuSkdT8Mwd6HuCi8PPvFQ7F7hWNVN23H7Sr0aT
	x6z1Tg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrj6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so53460e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383811; x=1789988611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=PWBusi5wZ/WnJnVfpGUg9wuxlwj/XjaCjmcXKfxcG8OicEEQl/5A2j23yOk/vnqV+Q
         dQBJuSGdSBblLp6lwPoaMUhI3vWf6GUsJYIShKZaHThXxyqp9sRdQM8bRMs1YmzmZs1h
         ogAYBfxk2MRc3HIKWjZWuZTcpirvaSXeVP3ix+tXYCe/1I+5N2EKO1hn2HIe4jUl09HP
         woMseuNkFXA/Qivd6Gn+IpPbUorr0CAaFFLwyLDmP9fGxz+eR8KU8H7Wli+1G9lCB1et
         QOenybbVI2rm9manJ6k/uMds2HDsg/bE67nf7dUzjDyiECfwwEknzmULBtMctBU98U+u
         Qryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383811; x=1789988611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSgCXYyWjXSuxjyZ8n8hFNw6JNFa309KScyB8XosxnI=;
        b=O/XfmwMH4+G2FtIyj1+sT2iYOLlLuAj0MCa3Nt6gIzOFFyV7UeNngCT/i6BpUGGhtj
         dmo1mN0Jk3rSVT9v9+ODq9OnNjDviYSiQDwKNmukNXNy298EiAVCSfd1lnnMgZrQDR9S
         pO4zJm3MBzzF4fniY44rgJUpHVIPv8Tz7qAuxl8tK6Zgyqyu7TMT248Wt5lXCtdJGdHo
         0IegMJDC2INZdZ8+LdSHZ37CjSC+9+mXghNL7Zffrw07seL8/YPDwdIOH+LNG2WyVNMH
         Ra/cjOSgWCKoe/7zZ+EXBN9M+DExBla45PNIoZabErJxOp8adu1Z0+88lTLukgSnL6j/
         WoZw==
X-Forwarded-Encrypted: i=1; AKwUvBw0AQG4Tsl9LqTqgqWxF+6dIX9P+4N6jOD1FH3lh5ASwaG5uBriSWOxiNT5iU/AC5j41oW1A5j1Lk6y3xA=@vger.kernel.org
X-Gm-Message-State: AFuF++laTBjT0B306SVHp7cXqMMBMj+wFrOG01rIhcC+L2a7Rz/I1z0T
	xUjKTqgev3H//HCrmom+pagckCEO7U1RbW0VFqI50CMQoQmX1VmdODw8RgDRywoXwIYNb2+JIhT
	QHoXYM5uxRLbY20awTfLNLiz7cf3JvtRkgL98cQOJpQUGZDe73TQRXQTD3mqZH9qNDeQ=
X-Gm-Gg: AYBFou27eBvPPPE/UQc5b5jGRoxSqHhKeKIEs9VmxraMx1lNr0EvJKWzW/p3RSh5Nxr
	5Fcl4Tmlf187LNlRu1KOGlECOgfEbOByAwOoq+PqzWxWTHTYpn6wloSNfpyhXyVOG/7+jcYyrcj
	GY02BR19LVxqMTMKwpAtsl2HgzHxWeQQkwJgLWAQQbq1M2lSHG/aiIgC5I/YHCrGJZFRUzcgyfs
	oYEi2K1KD9s2wF8x8x9qDT+kG473Npolnulsr9Qf4ssEN1EPidyWjqgjp12R0dNu58/6EX9SVFm
	NGaV7bCCcyD6wLbFNYQIvPoUMlk0bG+feXPOE/L5gbU/TAjtIoCKNyNgGL4r5vIAVd/RvY305X4
	cQuXs7zQ8uUHYjCNAQ7YWKw==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr279356137.2.1789383731433;
        Mon, 14 Sep 2026 04:02:11 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr273874137.2.1789383696795;
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409923766b.54.2026.09.14.04.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:36 -0700 (PDT)
Message-ID: <6353d1e7-32a3-4a2f-b68c-97f2bdbf55ad@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/34] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-22-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gyZ9PhbD8h50W_yPvH76LDdp8jVgbFql
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXz9bEhbXHWgTy
 IgDuaOZ2eqYgutxpq3yf0zYS8TrqpKHkgnYXmnVtJ40aotTgGFRwEa+L3e0c68wDrJ6y43QSMHv
 3ZQBnW9XRUgOdD8zvg9umVt4fXyxDRI=
X-Proofpoint-GUID: gyZ9PhbD8h50W_yPvH76LDdp8jVgbFql
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d484 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX6kquhM2q//qF
 Zbx5+l4rIfUvqDl/WL6IsNCJ20v8IGXJvhXMRMiECJy0CclN7AY8jvWW1w7SxMMimfoA8QqSJia
 SxI0+SiMmzXPu8XHViqJoc4SbMYCBhrGy90iUfYeT5Hx9tooLoe5XtKQDj/OFABHAX4XBkYCNnv
 vhPt5Eadn71snUckQw03P+zGvfuq9AIYQLKbeQQyjTczU+jKrz0yb+m35Tu+QwmpUI2tWqS69ge
 V283rkNLH3Sem2eCCgYr4KUBZzJpUoFB0nWBmAJa3aiBpcYoPoQVOUGTCvn0z/idnAVquQUOQjf
 HezAtiAZ8jqNRJMOuauKMNIFtQzUxeMJBTzBHv4nGOT2a7uC6V45bSBiCbAha5gkz89YUXgkPlj
 cJ8LyCZH85TqgY8uJfUxRWj40hbPqnJpDZFjPR/BC3WnBv7d6g3kiEBbxAALHbj/ZK3n6CibnzF
 Yf8B21adk6xL352rZXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys and phy-names from the controller to pcie0_port0,
> adding a label to this node to allow board-level overrides. Move
> perst-gpios from the &pcie controller override to &pcie0_port0 in
> the board file, renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
