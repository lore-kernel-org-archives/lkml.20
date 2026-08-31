Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9672E06EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160225; cv=none; b=tdu32xjxLXJBr+FmvbOb2qILSdmoo64/BI9lyb+PICONRBXFjL+bTvkF6BDB0ByefiZZVJGJr6rzJZhuboeriJWWDRolW2iYc+eOZw4kVeU+ojaWRowCKdyOsTL5tZeselABCwrP9TyeP6iTSSlpnBcmhWfmzXSXGMgJVam95+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160225; c=relaxed/simple;
	bh=Z921shTsCX3RrS+CkOjK5B48Xp0W4QrNeaDSx83aXAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cU9o8nOuN1ZFyvaRMam0eyurcWyYJo5JBrMgwg+VvNpwqo/e8Mcz8QzggM3AUPeENNiylrjDlOAsh1vhdS2HJHN1ulZ6ETFvrc81UOEJdHf+yOh0K8szrpgfNAfXr6IYHUM8TtmttiTsXCQTQUespLJVuPn761k0pHco+9LlhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXsmSSXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vgx3MZa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXsmSSXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vgx3MZa4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52aHr2061053
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=; b=LXsmSSXsL2zX1Ffr
	rfiKpoFMEbDXFkChRvHYab28/IQFI4Lf3ilnjRls/396LHuTCXcd2SPX3AUVw7x0
	4r2oWIMEq4zBPl7Hw0Y/1iuJVXrf1WYQQeCjxJmv/SZ6GoGWOqPngXIso3ghbg1J
	HQWt4ckcbe17k8P7ufLBS1pVgCH3UqFi2zGIpF2pvJpl1QCV2aBxLtLWem9umEWT
	s/CpBXxN4x/+ecCsJh/z3UU5ChA/UN+2MjqK4/U7Fb9hg8NB2/o30QhV5VIyK3nS
	/VtYxvG2wGm0l+EDRaysc58dv5du9mpulhurQMrK2CqCNps73NLOO/8Q4iYjGf7f
	IYC8JQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dw06h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:10:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso56085085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160223; x=1788765023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=;
        b=Vgx3MZa42SGNtZMfEdWeSjQxD9Lr/l2/3S/RUu0u4seJKTSgS7hqfuP0kt4NsM3Jvt
         v5O6gupyhhzf8h99SzJHdXKsJQE6EzhxxngEhDHZ3W5U7nYlVlHGjFpJ2vU7ck5OZv1w
         YkIcnutPLbxOVYnn5c5y99mcG8Lb8cJ2rwGxw10ot5talNTHVpnew4cg9tMo78liP0nC
         y/huNViPALJmaiSnwgKwOyJ08jb5cynQQiBwXZRXspVEN//+rpIgZpv/1d6dFgeoZddG
         7Z2c1mfPNYIme5rPq3H1N4cCJqclgmDpJb86jyrZRYpHM4WhTyixtvm2By6Me2Rsd+JT
         cKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160223; x=1788765023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=;
        b=p8LF8Sa08lhQL6oDV1xygfkIkq/8toW7D6ynDSUjXzPmoOKz/nY3Gk+fup3J1VWCQV
         VoHmgP0/VZsRTgPOMVr0tGG32O2B9cXUCDrRiGYEyWVGo1Mid5RN+mlX2G73Pco/2UpG
         Y7d7SN7UUurB5v1Px0mVJ2x2my1L2c4ibCMepAsXyYu/CS/Cp2BdnTZUvL++rBDZRrDB
         A5RZ9ex1scXljzWZOvAsPavdRGWH2mB4rWwgklR6goeNC56P8QFGzwTbv+3AeZQAvoaL
         W0+oGLrHXZtH+wLTnB++QvObPxqfJOUuD13KwAvBC2vq6WpicJdQyO23vkvBY3HtXXNK
         uyVg==
X-Forwarded-Encrypted: i=1; AHgh+RrdfaJbLPvXNazKUBrVXIWegZjtzU7PoTLbNAMvlAehnhfxYKaHPSZTIyEPNPILn3vUTQ+2DYMoWIXejsA=@vger.kernel.org
X-Gm-Message-State: AFuF++m8eUoqMqY8neAbRL2H5e32PqewSNP9yoBNixGg3UoYfrjF1e4O
	EAMyEJuhsJ/fiLetWO19t+wsPPJXIxXVgRIJxlK6xZ6CLNT0ovCfudtn8Wemv8QvmqQiMpY7GDk
	bpyKNUwh8v/LYZWXT8XjSu58O7tt7J6dShIEUbexiLcr1IAIJbjWkc884JausK2ndMRU=
X-Gm-Gg: AR+sD10UMRmEY6nNvL3GdKynhtfe/QOd7KKUo7tV512FzKklNtl2y3++xFM+8sT5BJV
	SZzk1gMyGFfteugImAVi19SmF1JpyTrkA0Zi2QtUnzvmzWNsS8vgl4hVAHx6tRc4JT6ouX3sXlQ
	9A7aliv4N+Y0qWG9eSdSmajwYKA27vaZ5ETAFHmOEnFMy8zEBJOwQk+fVqygImTuKOf5li5Oq+2
	W2YujP+ZrEn+hHeMjnugDo0mO8MBJbqmUl4HCWcbozoBBV8/TT4LXnYPD0l6tjHmT/u2WwJ8HVt
	dTxCju7W86GJIa+TdTtPJ+WZh4nd8j8lGMY0KYUUHjvh5AyJ2uyU+EemQXWVXX0Wek5Suhjr4w+
	7gAoXYYp6gLecOQ1sxYSvSQ==
X-Received: by 2002:a05:620a:2794:b0:936:5a34:7a6a with SMTP id af79cd13be357-9392878e32bmr713661385a.3.1788160222792;
        Mon, 31 Aug 2026 00:10:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2794:b0:936:5a34:7a6a with SMTP id af79cd13be357-9392878e32bmr713659285a.3.1788160222281;
        Mon, 31 Aug 2026 00:10:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm374376066b.22.2026.08.31.00.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:10:21 -0700 (PDT)
Message-ID: <94b45279-f0b1-4603-a188-00a5ac6287fb@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfXyG4ilrw77RG7
 t/G7pvR3PP1ULBvfLPlCOwUOdfiCHVFI0ipfBdvFvM3recb2rL9XguWXkUde4NPxrL6giL8Idbh
 v+7QlI5EnAmm58HbamYFmO/Opxvlhl1PGPz67NmrwifWAW8a0L2Q2+HNZoTCUY6qzkZflVFcloH
 EeZpJySEXX3KifqV35cGZnd8I0FFrhIczTu4MZg+4Uc2I2XtnRnfORcDP8ohmzyV3+vfH3v4Aj0
 7K2KNE+qJ0L8wXgmwdCocaHoqwm+Rw33j/2YG7Lng+TsIhCrI4QQumt7tP8fELhd4EEzmxk7ES+
 ZHewWTIGOid5rvao8uiJ0YsETf6SFqI2JSu2k2M9yuaHAq/1ANF+ClzqsHnfocaZ9+sObV2w9aq
 M9C/NNp5CB8nwchw6aM5T7vzwU6wYDXUjDstnWl3rKW4YEisatifC3lE/aGeBPLL9TAhZc1VH6I
 bIQVT7BjRmkGOAj/f9g==
X-Proofpoint-GUID: dUcs1tq1MhJ4Ln0svD95GGMAD86qzaGE
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9528df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z7oZEuqFRaD5O6-Ux3QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX+w30TGJsah2P
 DdOfhZ0BJBTsn9JF5816/5fmk2RFJFgYpmcHn5e/1QzfLCkqFUSmQaMLV5eeAr3qyYaM8pTVtJw
 o6xW2+q520iLFG56e+yrdE1FrmppNrw=
X-Proofpoint-ORIG-GUID: dUcs1tq1MhJ4Ln0svD95GGMAD86qzaGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310059

On 8/30/26 2:26 PM, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
