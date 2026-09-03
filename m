Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186B469826
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426278; cv=none; b=dP92GfTp5uD+72+jfv9B03FkxrL1fTZliqQcEvQfy2SFp7W3LwzKT+wecMAMPAem3HapRdoo70DIvaf7xB/oSG+hrdK8/L4uLTgc+xDDOicYw1Exe5gXBECdE/ymptGihnWqkkRIvg3jdBLhhFKchPT2IGgojO3iWQ4AdLd0qho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426278; c=relaxed/simple;
	bh=migUhAZsouDhOUiUV/KoG3AJtohPe5Z2c43aWv+zZnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsDMTrTvxE6de0YNOQMzknXphOtd5C+pvQXoPz9BU1rsCVOtz/yMjm1cXky1lFcbhkD/kxeFVWNGRYxyzfjn+USR7i3G1JPHr6jIM+QK4Qj/W4+YkL+wkXjtdazKZEiZ3reF3DHwFnAGGOG7knEyYLP5qwOCysIY0OPpCJo8F6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmOrivcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX8Dw/v9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmOrivcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX8Dw/v9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683925HR3035733
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=; b=SmOrivcBh0Q5qH5L
	TAXhESAjCHc9pZ1utPZAc+seTpxnn8WpD2tHG7FhC+Rdcwb4uCackdPjIimoqJah
	6kqikgAe8kxl8KudymAZkuTDZjFd7wPEahTKUeyfrRWFv7sKN4bpcfRaSlBMbu2/
	+Q5aOxXuf3vjy650/zfBlveBTf3TJK25soQU8vztHAuR68vKZKLwAk6ZvwT5q/gZ
	KAgyn3lYE3RN0Qrt4I5Yo1a4WZMwstLOZcqcnVXL7l6QjWWJFVIesY/VNV5eZ65a
	yvn3jR69mAGx7EwcC4BUJ230hODNHhw1AKtq41/aAOGRx9vWXQSob3piojMITYGJ
	BMcVwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d1051e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:04:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ea38b1e7eso5128631cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426274; x=1789031074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=jX8Dw/v9tvpV9nNgCkCiYqZJaBEpA6yhIo6bZjDB/ibPi9tB+qwAt5ClhIanizESkr
         Rs2WQT7kfqu2eBXqlJaV2amlAGPf3o0iqlOkpdRo+cX9CgR711ah34dYC7AIJDNx9ZqK
         /by1Nuwu3mJ8+s9/Cog0UMubNMmzdRXcS9kRrz1Q7bTnW/Sa7oyBGIqnWHdXhOuI5rYX
         XoKQBCxv3Brot0bDDQKsT+msNKGPXIdFIUrEJjbRuFDAbfoqrRWP9tgN/nF2aHQkSGl7
         sTHkkfn7c0iljA0suYsRl/lnKNG1wQ1QxQtvR5b7L4gPM2XzukeKjr/EFYpxY9/YJbyU
         FOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426274; x=1789031074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=ENkKsLZBre23H4GmagH1deJXztlLj+Z0DRu8zCDdRd2GwPgjx42hrSI0t/q3BqubJZ
         WwS+9cr6RTriHzGNLP1a83s/Tzq3Fe8pHoFBAMj2IkDFw6fG9OXKkhu2udjn3JedCQZj
         Jj/Uetyv2SMdI0Wues8pHz0FZAUobbwAQcXHfMepuacYmJ5B+WL58IGFPsHpa1enYnjE
         2t/jv/HML73HWGaDr61o1K/mVbM2mGH28K216whz8sQU2WmRa6CD5kZYaVomverpM3YD
         g7tVCC+CXqeje6Dt70GLtsH1q6ut03Fey2r5/VAIPCbuc+QBLWF4uo8T4rsYLdoK4j7A
         NGNA==
X-Forwarded-Encrypted: i=1; AKwUvBw1lGaKR4lsO/Rp9IA4VWR0edF/WNVgORGAJUdsCNBAXagfXeTVJqhHinhJSoplXcprjOl+qvoalG/7vGg=@vger.kernel.org
X-Gm-Message-State: AFuF++meYy7ul0Nu2IkFGdU26kVC2OJR+xqa1R6aVJJaBo9cMObDfgzy
	+XMb8fIcdEiV2U/VDQu7CivJIXWCDXOpGu2PfUkruplWj6PvszrKo5Mhh7e1iO2kD2pEARU8oO/
	67kR4bfFR5hoJtk8x9XXASHjepi6EQ5VcO22X3rXV1MkilKtTIpsh1yBIuBRFv0b6xHQ=
X-Gm-Gg: AYBFou3u25krhPIEIr0ELnwekYRD6QM8rBE3vPrZV+y440iKDyMqstSrqm8w8e8ulKI
	EygsIm2kLHMCaMgyQpqW+QmoVCxP0tZZv+OS64PUiTZ3GBMqxl/00pUAbB1g96wnnQK/aD6UjEO
	C7bWX7Scr7z+EtASLcLP4iD7p5MMVoEBp4k/8BJWZwDMhfk+4YmGlXeCIlD3GSpIphql49V+Kut
	zignlBopO/v5E5YSu2exBoixzymlKiUFLpQQxZM8/rcIXx5j2IWcDV1mqbE4jDIQdH/E06OsSch
	sJTCIGPgP61K2ne+oXA63bFQGB3xZX/39oO4viNq1UqOsgdCRGUXfk5MPlM3g6MnH9uNxNurHE4
	9r0bndoibmMvMzAq2VyYRlQ==
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80397221cf.5.1788426274106;
        Thu, 03 Sep 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80396661cf.5.1788426273525;
        Thu, 03 Sep 2026 02:04:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1952191a12.1.2026.09.03.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:04:32 -0700 (PDT)
Message-ID: <00cffd4f-d981-447b-ae97-e8978baa038d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXzc5tqD7jNkLe
 fytk2JETIzEXefu4TcC8aLI6mMBYHZU4PrxMkMAOHFW6MYS7Qn5+wM0NQ7VimmIt01vKwC1/JT2
 yACwhpHxrSu7PtnL1a+gkEXFRS5wGIfLwzApYGqP8fGNl+0X5ifHiR/tSafHSvlfHBHDvMI59T3
 vczLeEHIP1BAHi+5IMk5srC1S71PTzZnfPceCME45umEea4nG8CbBY/RhIDNkKOhW9MQ3bd6DxJ
 G7g1KVAibeVS15gYQ9Pj+So3Z3C21sWj9+Ig5SStYYnYZSb7wvcTwOfj/B2MxRE0XjH99i23gZz
 NUcN7jVN2+BcZ8I4CZ5GYRIjo0ux/5bnQl7aohDtbsnzXIOy6MzQxPY07RU7aDs+EPNwMM2BtTS
 i40yPGmlzAe0OmgS3pHeGqvhSOMVW1jKsfCENDtdHXxkIOFSn3hLakX3RGe9VMcW/r9wwW2KWwx
 7moeZF8yrNUEA8RMJBA==
X-Proofpoint-ORIG-GUID: yD1ksiVKPCkygz9r8sE6fu4aKw6rdJXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX0kE/RXoqWHlC
 aqGV0iqKhVtuE1GcDtmc5rAl8nSswHMWeHTI71uT3V5cJLRL6SG1YZs/rtfyWXKCOxTnWXkfg5p
 Z3XEvFkA79cdCWaSZvBv88+dc+B0c6M=
X-Proofpoint-GUID: yD1ksiVKPCkygz9r8sE6fu4aKw6rdJXY
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993823 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260812-pm4125-adc-thermal-4c0f713737fa
> prerequisite-message-id: 20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com
> prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
> prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
> prerequisite-patch-id: 391360a3fcb2c44648ec62930e3af61d4eb12001
> prerequisite-patch-id: a1c862130f572ca027bc9c482dede8da183e51b1

In this section you say:

"""
I need the 4 patches titled:

      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

to land before this may be accepted
"""

which is overly broad and you're hurting your work by introducing
unnecessary dependencies (because you don't need the entirety of that
series and you don't know whether it'll all be accepted at once)

Konrad
