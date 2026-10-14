Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1F4FB9C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979038; cv=none; b=j4lzFFTVsk9gt9Q2RZ46gQ3/w1SZJQrjyNq7vKVP7hcJ/Gy8ZdCjM0n597mTx1ekkFoAt1Vrm04qhCoLYvkTnoG9hytBMt6vgweni36JNjgRi36wOOB8VSfHpaXlL1ZheBqY9qss/lfC4DHVpI+P13wzku8HJFcCx4H88+kBjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979038; c=relaxed/simple;
	bh=Gpf/uqA8qhJd0TyJbH8QhW3DTaO8Ge2PGIsjVhn+qFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTjr1I4fhWJrKZpZluPNlPg/wJXcVziGY5hrjZr+urTGvLmvGRbsnHBYg9SfxqASYe++5GCNAkqVzaRI60zHhINj25YOr8CN3yuuBglQwAt713fLRDx20e8kepcUFBUIqm8Ac4BmB8VJAsZ9dQGiKkrEZpwXXLkkwTk5Emd8LaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjcbA/r/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cnr4ejiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjcbA/r/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cnr4ejiF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAJn2I806685
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=; b=KjcbA/r/aXrEFGrb
	JC877QL3ZFq2HyYOOZNEESmeNF32f0qvD+NSwS8o/klAVQFlwHjy42R8Yjf+HNeP
	E+l1/5Uw4kJ0//x9R4Oa0eoEiPxS7p95HnHIcdLkSisRuFGC7hQS7JG5u8brKhew
	AT5DPr3tYct2/I89LxGZeteJ2fGmkoXFYqLsvbFjnxwcgFAF8zcTUoBw0+Hdo5bd
	3q5v1UrHCz1YUiJX38DUTvVtco1e5Ox5khtG9xspPwrobYuQILyM86XmIBStNUZ6
	0/msSBCh86MSzuAtPPxbp+PzoPasWueNHCBSz6TBr1AZECoHowZ5EC1xeG00TgVz
	bcEZOQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6ba0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:57:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so4233316a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979035; x=1792583835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=;
        b=Cnr4ejiFc1eOuigahCnqVkD67K8DbOCRFEaZhRu4i3ts0Gk2Fr0tc6Wsr+eIZrOFob
         o7Kjai9hY01k4hJPSxlEUxYqf532F5kly7dUYQcfPUT//Cm7Ye21pUN47cNC/yuy4VgV
         k0hE1CghNmg9wOqgy3q3MUJ7THY9lg5kM4iMJ4W7MjksHimFgpy9bc/nfBtwKV0DYo07
         KDqeLa1ZO9xvCuWQa3664chweoFWqacDeywuH3twpiPWitualM0v4aYTBLTIaHSVTWNe
         QTpWQWtDNSiOJRm9j6GpzeaBWWGf9JWFvTRYJvYzPAzFS0sVmgFoPLe6YQkf4AtrT+WH
         i2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979035; x=1792583835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=;
        b=qJJnR1fbCS6APRRUDvuREbVy5FWkfDwIEE8GxA3zHBEBINsliT+pa1QJw8CR3Ahdpj
         3LOamkQcdXjymwffttdUrdUXSx3py2vit84CedcCrzk3qsndnBx4uyxdsDHL0Qa7SUvl
         rNDEJuZQVZ+iN4JkKf+X1zmWCnBeEVUGUoig9qoxmANRPR0sc/NOOjkVnCpm7bwkJb6A
         k3oXq5vPUpMvf1UcGi57dRamCo0jvK+PjIedj0RD+0WuoTVYofByq6sliLHJTBEBhdtJ
         z1wxJN0rmbsxCQNzos7zZ367X1uionvnKs0vgvInYpx7viclwiSl5WtWU9bHb4hFTYbf
         tZ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQgwL+zVzrqASd6vH7RR69mugVw0Jj5Jm1+mLqHF9BGG/e920Rd6/+jcYaBpEYp0tQ7qMyehlOJU6Bp6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNVkktMB6c5vorW4Hv6KF9BdwVUsYQgTBsWAzKuXdQ2NOppIDi
	CLIb1M1sP6G7HiEr5fuU+/AFon8CmvwydT5Z/DmAVQiwZKSuKIQUvhe3rPp7WiVb91Mff/51YY2
	F0IYsNyTMCetOqjJxE2NP+cbyP+BvYAU99Gws1BAuf3sSF5dWmhKYQea7ZvJPQyiAsSw=
X-Gm-Gg: AYBFou0ze94IZTV4H05bgnKTPEbGv6tp1ynxd6ROE0d2SwjFzJjAEwBCushFrAIPVe+
	yrfeWEOqHs1ZhTO8PLRnQ9OdgApVkG1f7LueqiD8aMAm3YrHKYkp9fln+MNBRhu8jyTzoDYOQ3n
	tSagPs6DR3xJiUhwnCnjogVM2X7b+/bSYoQlIqNJlvIyKfBSZrHeChR+6KKWPZXsobC/rzokD4z
	KG3FyQK3i4fsSZh7m9eY5I7V40Xs6RaqSVGZ5ZFhoSM1oPYS7msTwTOGekBJSydn1XDVOWMn3xE
	qmqg6wF52bhiZQBclKiegIi5MobExaSnMtJQR2xyDlQBBLJ95d1hg+6kFk4wufsRzMOdrNrhXuZ
	xHovV90LsEyJOsZUCI/DC8IgyZRjZ
X-Received: by 2002:a17:90b:3cd0:b0:3ab:b9bb:dc42 with SMTP id 98e67ed59e1d1-3abb9bbdeebmr5193893a91.42.1791979034886;
        Wed, 14 Oct 2026 04:57:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:3ab:b9bb:dc42 with SMTP id 98e67ed59e1d1-3abb9bbdeebmr5193863a91.42.1791979034112;
        Wed, 14 Oct 2026 04:57:14 -0700 (PDT)
Received: from [10.92.209.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm982127a91.2.2026.10.14.04.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:57:13 -0700 (PDT)
Message-ID: <4bff5ee4-fae7-40cc-afa4-cf79160d7349@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:27:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RIbqkAB3vGA6Hpvo_qyDymmdwm4u8fQo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX/JWrUCAcpNgN
 iDrHVKZEqH91SZ81JnfBEO5rybjyuZVxGT5I0HNj9xj2+GpkrX//DXH8SxQg8i/TX0o66/omlLW
 eXqp+IVIA3ha6LCbsPKkdQ7PPntN1GY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX42F4QPN9jCmX
 aklPAXrFiXk5AJtcdz/uqMamfIc3ZQYgb2KHjdexM1/ioE6VrO1sC7LJcmo8XyH9zYknGc0zKP+
 muQ+l3Y/A3cy1k+ANtlvQMo39+hT+/bUZ8TSTAnIZ4aJohRmTDlEaoPfT8TZjVb53xoCGy8xZpp
 CNiyRGeD8RewDeDxtvP1z8ay2YkFJEHeCCc53rByTcJZXGYdazFjDq8V1zp2qbynw8HarhbE6Nt
 lXmB2Ear6omuSUyfpGAfHRByNgoZbKOFl3/CnD+vGOaoCbNMB+WWVrqItGvkzj8K83Viua7UVam
 AxBOv1OS2SedGFoXQRFN5l6oaANhDRgb7fE7JGj/YmR4yRunHvvhIWl0gVkOhRelTMwVvtnAh9p
 eiEFtP+c7cgQn8zM6ubG2fSKdO7PNragDvjrCCVq6relHZRIE6J7PRJL1tiTKaDP+2G0B0gTczr
 QaUnMDWHhMRZclQmxGw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf6e1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=42DEVwYdyhcKbSgukHQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RIbqkAB3vGA6Hpvo_qyDymmdwm4u8fQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140047


On 10/12/2026 11:46 AM, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
>
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
>
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
>
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>   arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>   2 files changed, 138 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00ea..2f25575e6efe 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>   
>   talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>   
[...]

Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com> Thanks,
Nirmesh

