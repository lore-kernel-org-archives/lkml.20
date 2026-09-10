Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FB391E7A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026313; cv=none; b=dWnMv5v3Y4Np4gEo4wu4nSD3dtVkQDZTXb3T7teD2d/pWP83Ay9juQIK5Kw+BWKBCLWV/ro/PMGdWqS0J3a638e0yk0SF1vTWYEMYxwuwTrJ9TOrESLxQGv8D5Yni6gYdrOfSxd2VUqbfiIKpyGzCHfIR4Lnc5iitRrkQTEWITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026313; c=relaxed/simple;
	bh=ZYmEjvHrGAQO7cqi6Yvg5Vou9RxiLtdcAkctGESY/2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTa4MrMywPDaeA9D8WnyYWJI4lIJMQV4qH0Rf0xSXKaLGWHRhOWnOdVJrvzpNFN7P5sqCXoCXghZKibbhdaMhGrhXAn8spPWfZPIRAKAC8ps7Ks8OTyOotg6o0UUA4UABPuSy3G/eNdnGT/dhj3znCtdfhrpy5+vYtCH50lRfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGD5juVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3AiHgQH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGD5juVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3AiHgQH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7hRRx3815247
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=; b=XGD5juVJnMNwnkqs
	8LvzH1QFHIX1OhqIAPmigc4wD8Cu04YfIBxzONyg6ludMI096DE2Mjqscc0JXnG7
	37LYKykjmDl8tTi5zgfGqx607uy6v+cRcSnX2vy+MATceJumgXyKR2DB6wSd5hH6
	TslSzgOmKpzWqWZk/WYwIXLjBXEoZQNPnZKWGPsU1ALrXqn9NMx98NqG03ulCqw6
	KUtsBbtob3ki/ar/1nds5Z31d9KOQra10EDBcPRQj4coC2Id45jvYzrmMn/oEVR1
	k10FZuXAxs2YnhVpmp+NaTD+MZ57qf3JO1Q38HFC30Sth2FywePgye/yn8ft+h9y
	OXxSBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn8074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:45:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso83263685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789026309; x=1789631109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=;
        b=G3AiHgQHaweKW1tZ5keiQQ8lB27rzNJ1WSarwuNpIafS4YmtBs/RyWbbjJOk6iBnfM
         wmoxtPT1XRDu+wgTNdHYDXFPnftGX8H8iFBSEvZCWNZVCCvMgt6Wqehgi94JyN87O8hR
         ZWjW2X8NFQSpP2gpg5Qjsy9+FGoIYz+vmWz7CmAT1Oj0tYQhskL5Iyyz6NeWKJ9dpHye
         EuGtTppxNrBf81WlSOXurvpaTJ6A84i5G1CIH5u79XnmtGgXk/jgWEXcbXI6ykSfWcEi
         fhhD4DcPCpA+lDXj5LG09b9icZ6J+OLosVANNIvogqRk7Dhoqvmp8vyxBDPPJyeytWOu
         XZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026309; x=1789631109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgH2jtEtLN13NesQS4mHFrUP2jdvXt2vKYplvCPGTSU=;
        b=fVu5GyojZLaTHLbiZpPNo3nNW0YoJRAomXZdNiVxXLNVAsybBdO/4izEGgTNwbOnnx
         DJ8ZzeiOe7Hj95MsUClT2C7ITmTNuk8SMoceGmfDo7y/2dJZGIDXV7kXyC9RU5aTP9ML
         H9zFyVfgz97BgX7J4FNYe9wioKm/+L8IqXnACyROQba9ZEb1XQ8QrZ9ChifvsVKx5kdS
         krGw4iIBPkFPa2bUT0ZBMg6t/nYv57pjgPqGe/ApjkCCpdmH838zuILApXTdKJD869Db
         hMmbILn5VpiR9uZ4zE7gdiYtArizElCWu1tjNwlC1AGC6co1VKVv/FOUvp8mrjAPVSWv
         urIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuJCbrTTydN57A+cEuBAXmBmPHaTvv8Z51pzgQ3GxBBjVx/WEHbLZkEf43PwdjEyxfxlHw0AjQqhiXQfc=@vger.kernel.org
X-Gm-Message-State: AFuF++nfMo2JfDF8z3aKJtJo0sk0A1FgCKB/+VZjIXmfAbavEG+coESs
	5LJoNnsKvH9p+ftJ6mlJCfa3cR20Hf6mdcqWSGgwBqswOOXLg/C63ynlSPm13JM28oc3/mZGd3R
	amXHmpuUM/Gfbz4CgT0OdFesx/nlfqBts11CgbO0ZsFu/A1Xp2eTIbEWWg5TWBsHifWc=
X-Gm-Gg: AYBFou3wSPOHnC86yMN6nq4+KxaFslsLGkwbmIwMcMlvF8jOvY81kAOsnGpJLvoYZu1
	uGANFuFZkoH5w3XpNA101dwbsuqqHbMPHqqcSLNNpJl84kEKMjsxf+4ggRraa+9wWBGpj30BaNe
	lBgSXrTfheH12nq624x3Px/8ZNXMQXPqxPyRifFQvwsYlZCtXaIzndGZELU1iPHrIKRlCMTGulS
	o9TYi6Qdiid7bICBIeitO40D+rf5oo71swVSk2wLsgXVlbHR1qRmvqPK6PgKfQlB3hZKJzLcXOi
	+d5hUbOfLPeY5X0ytaWAqQgHNl8gBAbVcYgxm9irOO7iMcWwT6tfJOycmmIpaJFTrZdSltsjldi
	D9klXv/jzcmFo0V4e/KClEA==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2763873685a.2.1789026308985;
        Thu, 10 Sep 2026 00:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2763869085a.2.1789026308504;
        Thu, 10 Sep 2026 00:45:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bf5072sm7672972a12.28.2026.09.10.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:45:07 -0700 (PDT)
Message-ID: <907c4602-f4c3-4491-891e-271d448316a9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp: Fix alignment in pcs-v8_50 register
 header
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910011500.659353-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX4PkZ8KwDvoGq
 X/D28co2K2/ivsl3opTN9FgVGuAZMwRZBGJcMtxX/eFRNwBuRofrN3ogPgwD9wRvWKrSl0/LAxk
 0X0zumdZPJCWLBv7tUU9Q3B8QSZLepNv9FCecfoLbVYEIuytkNwo3EOSGZluOw2981ZE9/Cz3zR
 oiHUr+t82zXJmrpAAVcypm1q1lmba1DNMI/ueR/KZT4onKfa7CILQ8AS86LK+3q5JiCsHM72vOO
 Sf7F5fckQvYHNNEaBBF8qL/dBCr9wD1Xb2kZHb+nzCoXlPJ7WjYdCL26fEHvEQXIfZlM1KCZI2A
 yHAq4h/L1VexidNzyv+t6nuQodlln6cW5g/gv3eTyeUsHlPfXp9kqz7yIGg3V5iEPK7w58S9Bdu
 QlRbLlLW28u2OL4WvwUSfGwQ/ojoKzZPuKyd+uX0r5X5csDD/Uh4LSNf4veg9JsFeJ6TjWL2bJe
 kHrmEOFDVtP6h/t+oPg==
X-Proofpoint-GUID: XiFLImk-cu8JcBoE0ifDlqW-PduY4PH7
X-Proofpoint-ORIG-GUID: XiFLImk-cu8JcBoE0ifDlqW-PduY4PH7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX59xP7ZpeVezz
 HOdzW7HnxOZieYpHb1EU/9vtyaPFSmvjvPoPgcQO7b73xysvqDptAJYYJDZSNeIbDVgR0TNwpW9
 pxmHEnLWJCMkIhp9Sb7o/+AzuRRHJwM=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa26005 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eKJ4GL2s265JBOqWuI0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100084

On 9/10/26 3:15 AM, Shawn Guo wrote:
> Fix up the whitespace so all offsets align. No functional change.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
