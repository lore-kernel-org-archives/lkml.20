Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5741DE01
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748782; cv=none; b=IiiXZDDC00hBvlt5iXi68WQnlBtEEsMcAqL8khdEGmuM/vdCkziw6ADxHpDoe9OOpzHjNk5a80j36CxjneYoL5bvB1z/xtr6jRcOFzniXw1Yx8fbNj6zF4+NLuuU4+Kmy+VCN1zMjKNVC7K7o2D3a+v4RHsdY74DaazDfna/vbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748782; c=relaxed/simple;
	bh=tEj0puOMv3YPQfmZXyOKbvkusA1zz5vSWcDN0Blq+7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpXp2b5Vep5A2o+5qE83wPKK0XpkB/mw3KuyQ4GR6+Uj004VGFfxwsT54epK7WJsxjLRCxK95H9BYkSJV3Oi/aBSarWb9TGI8xa7bu3KXzv4CLXs/9xvZjth0/MxvVcAxHEA43CA1iZZB+a3itFWIb6eUE54b7CJaP/686UEI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqZ207VW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSmQfIRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqZ207VW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSmQfIRc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBvA61909311
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2gECbtLim4IsFDtHK0zBICZjbKaXqnyx0T0kMypovFw=; b=fqZ207VWMmusFk0m
	dp5WwvtBTNzgz+Bfh15kZyfnhSlNTXBBiM3G101KbvL8B5lP7nbDSdxjrthYcpq8
	vYLjPqDi87xrdpu95sSyVm2y1oB25YBG0Ru0F42MmnIEAqpIYv+DmuJjTxp4f7sT
	vv6pgIKgnppc5TqS8ISIhcGr3HvLoagNlHKs3fHpX6oD+JRtgbetvGjXddelJJJG
	4sG5VEZPqviEHWF8RvuDJ39seOUucTc2jLiAJAiy9S66AggLpCcXF3ytIhiPWIxV
	GE7Tz9Dft2aHw0nNbdsC+XUOp7VnagTYlDgZwQe92puF0oWcJQN+zjLZVo2KuFqJ
	lE5N5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sa6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:53:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so357541cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787748779; x=1788353579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gECbtLim4IsFDtHK0zBICZjbKaXqnyx0T0kMypovFw=;
        b=DSmQfIRcrXVbUGNitJbFtzxYcBn5SR1YG43+hpGrqA7Cy8dlwbCce5Gt/xFvjL3n8z
         iJ4+/pEqBkBuc3snAFB2wPatthPH0pdzNVEi6IIvlzQsq9vdlFB4epoOv7fNIsaQtgeN
         2wVfE4OV9E3v8agsbU9qLebqFTRG8zlRXL+ah0KRioda79sDkDugY5CO5fzWZBGPdsyt
         m6or8fLxhb6nd4rIBmQ2oEGcjxfmgzBq/KkeW9M7frABA3lgFMU6Lvcj9dtpNvhDIeIE
         Z0uWw+zh7ivXgNi9gvOoYcSFa9L3ZjzBcQ0ijL0GK45YCcBAOvCeoUJMOXTQn1rI462l
         9ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748779; x=1788353579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gECbtLim4IsFDtHK0zBICZjbKaXqnyx0T0kMypovFw=;
        b=A8XkcW6J9D2NtVwDACNJgFSDt9cCIiqe0bU+ICjr9MGwBAGo/aiI0BXy2w7+1qcSoG
         315v88Yv9SsReB5EyyyKqgVh1u2ztX4tzTQShd5drC5X/g6PgrBgblEbDD9P3M7PH8D9
         wqqsD4G3gNRgbC/NQo/9c3k0gp9yGed91kcL+KEsgYQjgmAAxe2w1VYGx1xubDmwUZr3
         WRFipuVf6rudzlJ2OW5vTNIDLgiscQ6Trwo9Mktzx3TrY2YpuFO3k73VweLIspIdm560
         LkeppGjw977jFhgQao6a2UuDW8KyXP/41uYmRM7s0naLwcYqUKKinmD4FD28pt7Fg76U
         1Qvw==
X-Forwarded-Encrypted: i=1; AHgh+RqjO8ZZtrPRUXZ8EOhbZTs1QoPf0jlnuCUnCXabzt3DvsD8rVyhyY3d64MnTzy2iWS+3zEk7vryR8mq9nI=@vger.kernel.org
X-Gm-Message-State: AFuF++lYmJVfHiLLx8gptMkWYebNK3hkgg7/1RBTcCnrnoYC9MnZsKpy
	q5lJq4pSOL21M+C3s4+J9IuiKmIc9Wtt4haoMTftXuUqH5gUnXwFjOF4e2ANpLS1A7PUG7fhlBp
	RlrdFjSqIs81aSb7MLbyVOwZCBkBI/8lLM7SaFDRoQ5/X2V2s3qykhojyIovaEoKZuZk=
X-Gm-Gg: AR+sD13DzdvBfFQc29FnE6cfvDGMKXX98yRpVnmgfcqIF/6OLbP/TyM9P1F/ieFsCGc
	rzpbk1kTViIKjEXmGMz+qZqjQ3jWORz+tfTQ2b+FO6q6y895dgxy5WDQ3ajPKuHtU1DHS6ib7+C
	vRSh52d3c8d9f5L7P0np3Io2R3iGYH4F+WdDsjMX3C5LcR4cjxo0X4kg2bUuHSt24GvmYfW2wVG
	d1srDy+FJbEv0laGU/kJ6bN4BUODCf+gd52T7zTyf8cJk03/JuEzyJz9eaMkGOiqT+JgwI2w7Kh
	cghORKrRUE7TC2j6F03dIPCw9g1jGcROtz5ejxPjLCETPss7rL3LAwhud0OVYbzfcqFRQs49Ivg
	1Y2x/dcinIa+0E7/YFZQePpYG
X-Received: by 2002:ac8:7f03:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52f9f774021mr205101cf.4.1787748779028;
        Wed, 26 Aug 2026 05:52:59 -0700 (PDT)
X-Received: by 2002:ac8:7f03:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52f9f774021mr204581cf.4.1787748778493;
        Wed, 26 Aug 2026 05:52:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd676sm501014066b.17.2026.08.26.05.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 05:52:57 -0700 (PDT)
Message-ID: <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 14:52:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson
 <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zOqSc2QwjxCX99pTPW7svV5iWJ6LYMYn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX+GQ1p04VdFCM
 11mryfr9DzSKoS/b03EOsEKOmzFGq1W5TbVVmTvggBySTexN65B2Fir01BB/tlNZAP7v+8QTnuJ
 or/gOrtUOwNXCSsZbef+TB5J8Mmk2IpiVmBFNiNmcpGO5esGjpWQFWz/YepMIaV/FhgT+D/SLnt
 rDhp5RnQDOu73wl8wuhFmPuIoWReE6IAvx2BZo7hYsaf2qnJU4oNb3+dtk/af/qSRsiX62z4/gW
 BqdskjAq+5QN8mzHK2Cvo9/RlltELJ5rBTdH6ywwxbArushw5OJFXEHuJLdgKp3W30Q88J/8La1
 u8rDOS2pEdljImJRLb/EcSweavfDaNt24Jh9DYqd5YmVVTMtdFWtLceUDYWrbXfMrqlqc/w393W
 w706UYIoztPIRunhLUvH9/EO4baJU1VKq3cVLhOSgPmUV7VyBLabt5zbNXkaJangoq9lWXHEUBh
 YIZBHfuYKpp1iOs4o7g==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ee1ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IZIQwfiFe1kYP54-uPYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zOqSc2QwjxCX99pTPW7svV5iWJ6LYMYn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX9edwyLJxP1f5
 ejWgh3HRwcZ+JdNf+0nd+RQpWRu1LKnflQKh0TIvsgdJyOR7BIDxZoLWT9ZkmQUTFRdbVDFtElu
 32fywv3y57bVWaL8VmzJaLgAY2M/azU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260106

On 8/26/26 12:27 PM, Shawn Guo wrote:
> Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
> instead of the shared MX rail, so the CDSPs have to reference "nmxc"
> rather than "mx" as their second proxy power domain.
> 
> That makes the ADSP and CDSP name lists diverge at the second entry, so a
> single top-level 'items' list can no longer describe both. Keep only the
> item count at the top level and move the per-domain descriptions into the
> respective branches of the existing conditional.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Is the name of the input not "mx" at the rproc anyway?

Konrad
