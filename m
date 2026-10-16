Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8374973B9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154142; cv=none; b=uE/c8Z3g9xbhvxGWGdOzPI7K++jn8E3mbl69Gsi8tuHtKB0B1ZpVjO2iAUmfiMUpQWOP2n3zazaaECALx/T5Og6yMNOFpnw6soIQc+HzYaFYfvsGizJChpuBLE758xlSVJNeaRElRivFlpo/Zbw0CNBztQCuXHEyStXfj3QJmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154142; c=relaxed/simple;
	bh=+t6dshiwg0k2lvBeYJnIPtUGTCv/MJX/wKhxUVf2VfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9JSbDqB2JBlyHZwAHU/NPyBvLMPhLVh88SEaEW5pl4o6m+FA7i7YIyhYyfgptVr2g1O56vHzfCKQPzjlDEGjqZbQZY9t5u6OzoX19uj8gCxqvDsR6au9uoQIPU6xyZbKK/EHhupuwbBHfCbpcwsurHYrEjiXkBLTAyMhAooPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbqxDIsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpV7As+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbqxDIsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpV7As+v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GBU8Ok1280021
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=; b=CbqxDIspWJc82/Br
	YdeqAbaY1uVfAN7+BVpfVMWEIktZahTVC57FYB1w8smrQyP1vRQT32QGiPqST3at
	0IRfN6ABvss4inCnjBBQwJNwPbXr2u52KOZvWGhJ8KQv3+N2J4dj+uOtX6F7AMID
	ttf3ekLADbLa+kC72Kkv1qfu6VcQ4kWyx0hOz2f+SZn4A27x5H2OaXiV/D0MbDJJ
	HrXGjAoMiwu4QsACereQyb+vYl64q0Kzx1W5Woie9UNosKWhKx9zv1npk7jkKb7x
	Hx221WIL49TP7BwLMS7o2Iy1M02V6Sb2InUKMHAcgo00astXhEoULVHgsKZ3FImA
	jIylEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v06d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:35:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso75948385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792154137; x=1792758937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=kpV7As+v4rDMD8zHWRchaLI9w+kFkqQ8zblVKhPBaheqWsHRc3DtsQ5tpfxx4RX0Kp
         zys2T2Sh5WX5LPHA3Unrl47nCmvFXWAOvymOCd+iEBhlDmY+vnepAxMlfp3enveDulAA
         afEb7Yqx+SXBwcnwUbweZL/GjXjPxMjTse4OOFNY4sZ/UQdy/bHc5DMJMajpBbjsDoe7
         LJL0o/8e2pQ2NwRyHR7F/9AF0NjhneQS0twvtkVr9d8XvIBoi63fwID9mEtYTsc8cJuW
         Myhg+zBJSC52Nv9KJZWXtngjPrrrchehNZsUC6JN/Mk2zq+tlb8301TO0VDvS07vrdqP
         Xs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154137; x=1792758937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDV7CVjOSiyTwKyte/cvf6mHtD43N/X0AGHKK6OXI8A=;
        b=gVkBirRnyeYSaEMkXs+4sNiCa0QVJkh3zc3ZMBT6UDLP2Cbxx9xlPKXoAH5dvOesqz
         ADnHo9tbD6XRlqOdKwFSMoLoHjzaPi62ljTPo7PryMi92c/1lSh+oEJZtZ52uZU8at6g
         P6b4JYwb8K4u1ZFh3w8cTF/78z9kxCOiz7AMq2/5EIHT5uKWNI1dmbwSfzlhjF3j9LAW
         zuOWrKEO46y4pMZnszdKOGbBDhttQ0IcOdFWMBm/fYnBjoTdXoM7OW0kZiOuADZLiXFc
         VMp8ITPpOcD/9WXuwlTc6OEUyN9ffg/Hrf0I4G7T72hbZpvb4dQP530+rO3IQD+c/h+r
         uhYw==
X-Forwarded-Encrypted: i=1; AKwUvBysbxPxnZVwmPNKdlxTzLCJ+uvxAbJYTE20k1pHmHVO4C1j7FfmHhQpYnOMo2p5qUrX9RWBXP3qIxthYbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvsHIAtkmKx9LUdtF9P5eGLrV6bELG76CDeW+qN5S5jEonttyC
	ZhDx/xhdZHTB0uTKNG05cDalWuGPfjIHdZ33O52jbPi5kMayXDWNAF83ogaIfrP7iDFnAKR1J6t
	6urJkdjOWW1YKN/43n1y012RgM+5DSCPDLfHQRtwxyOQjR/r3SnFrDKvkAyWILxZBbes=
X-Gm-Gg: AYBFou1Stu1NZG8foTb2yWQuycca2hJPVjSXW5XKmi++/MX5R8ZpoYq+yts/y6d2C2d
	C137kNbTxEPw2pzn/YcGs2wlrhG+lwoKtwhxgThAftB2mgQ31YDA6ci9l7gNBCJ7k1apWKSoKsQ
	tODw4hJCc3J1QA2FbH2OuDF/sWZzmfvlpNiJxJ3H44jU5oeZj1eufSMwpFP4tJ3KxNi1TQxdJjd
	KXGicj/vjIYvEskPh16/OaE2GOmsXj8FwjxCodKEj7nMrl2NmiwJFOBhDDcQo03AqZLCrE88l2L
	fYAPXuy8SzIoHxd/K4bW0QdSYvjRxh77XdVGY6+hJ/PzaSQvx/wYhJQsMSq0sPYE4JMtbLrr1Vk
	6/mM44JlkBnERJnjUY8mGlA==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094556885a.4.1792154136682;
        Fri, 16 Oct 2026 05:35:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr4094529985a.4.1792154135803;
        Fri, 16 Oct 2026 05:35:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm67074066b.54.2026.10.16.05.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:35:34 -0700 (PDT)
Message-ID: <fa8940eb-45ce-4778-88fa-5502dbd686c1@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA
 region
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OPK3Ty8v813lgQOMUjnOpo894cyMEmpf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX7djwKQHvXYFE
 fvF0k/my8uEot4f3KQatitfFbXAmrkKnV9To/XILHWvmrGe7TGuO5KIiuFb+73jwiltES28Q/E0
 tu/vlGew4KlIBLo09wESNK+t/tcZ0i4=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad21a19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IoKEEaSRBiMpOdyFCbAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX+d/neimEfCRp
 V7YVxCNBlkjz+IGiz+6wOWe1dyjFXw1Z/knKmcjrp7+yUW/Tx/HrK1FGACkI48OePyaS6IYnIMm
 K2jvkrfpfb7zhXrebAQGp6sXMfjmrk4z47EYxqkPDIPr/1muU/gdVXhEdbc/bf211OK/etDc+iA
 FM+/gdvAYLqKToNYa4jvi/YE0AgnxsAUeh1ewmCPOIuUNiuGw/C27mBD1YsEFSqP8yjsIRzlnTO
 z85t8+4yU7tpDFc5u6ZSE1POSnapcDHgZMY3AFU8xp1UT2qNZBzXk7cjJVggNCg333ehPOhTvuB
 PeZ3w0MFwChtUzP9+iPxf59wAUZ3jtKRlecfaUMQ70Im/wkOkj5qeama67dlR67llPGg9n9g/jk
 CveJluGk42RahVA+E41NYvVAk6TPgxVde16lwFiZSRZT2px4JCBXyHRdgptOsYJzH9cZlHlBTvj
 DHm+KCBp54wfx4pfUbQ==
X-Proofpoint-ORIG-GUID: OPK3Ty8v813lgQOMUjnOpo894cyMEmpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160050

On 10/14/26 3:55 PM, Abel Vesa wrote:
> The linux,cma reserved-memory region was carried over from the X1E80100
> boards, where it is needed because the PCIe SMMU is reserved (owned by
> the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
> DMA to physically contiguous memory.
> 
> On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
> attached to translated IOMMU domains, so there is no need for a large
> contiguous DMA pool. Describing a CMA size in the DT is also more of a
> use-case policy than a hardware description. None of the other Glymur
> boards reserve one, so drop it from the two ASUS Zenbooks as well.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
