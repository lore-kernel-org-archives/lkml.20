Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297937;
	b=W6VB6zQQ2vY351xysRDwfopqiTfO4kl6FgI09NYEbIRNriwFRm8BKaTk4B4s5npAgRCX
	 nrVCV+R9rphMlgXxTtHWJhTiQmaIt1I2D6DibTsTJ4GzK+30EU/pylJpixrcdf9AVgflz
	 DMZZngcey+gZfBn00ZrCJb94dzTaKjDKngWDByp05JDb7k14Tl+SVXT6SxJE9rTYjGeEI
	 clQLRcYW2/GnOZjDSj7jarPP1fJu11q5v6zAIoRZU6djQf1D4GsmvZxmkYG2CT+C072Uz
	 pM2Y5o5X5zHIfGTOOk1rxU9SA0Wf6EZPeUE0Ur9wR7Kb3Un8DS3J/pUFtQnDvJ0K5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
	b=vBLtNL7P7GnmxwL01Hir9eLJDd0rArkyVxurfLMWs1NJEI74ncxDqlHO3159AYIKhivr
	 mwEQjVjF6hRcJsQK2aiXZvp5QZ9mv/GkF8H0e8lGkGVBwSIa5LHEVOfN2TLba82yZip3t
	 KjLDiSdxyVk+ePoR7aVzhqR3s/bNZacnOSXwY11Bqx9/GjGyegK1SHyBuOab9cvf6xL7z
	 H0rJU6dcEIre3S8Rf0qjpNRIHdGjHTObrXBIqpvRFsap4TZezJWvX0kBzuTYQLGHCA5Q/
	 zGctC3Djixbge9XZJa6lqvIve7SSMpj9QOidKxnuOrvAv1xsOoB6tfolyt7IHR7cb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E7606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lB3U3402939
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=; b=Ymm32Jxu9xyo0ZWu
	hBgC50+7K78337ntZ39i6h24qPBKxB67EcPcp2JxRBROQgcOJe1D01fyuRembgXJ
	hDO+Q/2Us0e7ZxhYAJXwd99DDfL5OvX152el6QeNtbbaq7o7gDCRw9fv3CZ5nXmD
	HubcxsJ3swsOCExsbfBpwLF8IKFi7Qy5sqGMu5MWy8bo8ZBap9k80i1oMTnqGcjS
	bcbT3LP1aDEpsxuHGeXWMTiBgMw6UBPQUhNc5NbUazzKOQCP3p0aZ63nBFawseqz
	2m6/ngKVhBFBskDI2lefXx1N/OCrQlWkBVFiMbbRfgBGqlTIUb5eBDsby8ftdu+8
	YfBTHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx83qyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:05:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so5166791cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297935; x=1794902735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=H4pmW70Y1JPi0mJDhJc7PnIf5FbN+gXvBLGrmKVK8HW05RNipIuUFH9ZQMJE3aZNyz
         9ftdGtfFVotkP3MVjWuN4XsAC93wlxRHWmP75GWc95iMuxNw+zQSywOYFrbww9X0xE9x
         Zcn4yo7VPcR/22e9QU0VSX8VZJ5V+TTu7m8tsL8ggvSc73BVz39HB7m7OM2Y+mtfqFiw
         vskpGxh1giEzku6TVUTxh/Jhg82eoBswUcgkvFCpaxqG9gziejF4cmOw2a83ZyP/bcbR
         vOYpemoDQdCqWEmwl5X4VR/vP2Kj1Q5Wo5SPyGdFq72G52V5y7hF3GYhqDo1fWVMrqj9
         5Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297935; x=1794902735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=vjgQ+Rjp+3oONVSGz9c6Ia3WBtSjkKlDX4e3CR95vktF7wqZ9Z8vtHdgc0ku6xpMyE
         6rhmqgrszLzHNpMx+K2F4uVfsmoz1rsy8yiVHq9u2eF8lYvKxgP2vGqsWCiuzawLlL2y
         rAcaJcvir6hf07iRs4dv4rpR0Wjoqoe0A4Kpiy41zxSCzaEXk/QP13LZIDAy7oKQaikm
         ZtZWXrR/J++19LLULeaKckdxBspazBl4laTzKamADU73FMFR7hoR5aBB+Gp/KZGOT0h4
         tjiXp1R97m0orEF748xu0PV2SwPCrtYm8W+1NARltlkjfhwV0urNlsAe9i1m3e4Pt290
         1OXg==
X-Forwarded-Encrypted: i=1; AL+hErEKiPzf33ywKg7jDrH3eKa4FlEXsI/leBZO9h4gR1GXI+ds1+PJEMEiR8eQEL6JhKgfu7vGbiRPXkdVv3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wvHbFyInRNnnGciD4HpAsdXGPvbxLUMxQZc5YQNj+SpCN3sF8
	RwHy6Lt5EwpTIh4OjG51AWN9R6UcWhXerrZdmJcWII3FDQz4LTpsxXDFQ2739feUYz4d+mwbIL+
	vA+JFVgx0kzFLyQXa2LlvHzdAcetwjQ3yv/Fjff4Ldi4mM3MhzD+gVubbBcLGzaNbUHWotHOuhy
	4=
X-Gm-Gg: AYBFou2OLW2gmnxmh35gdnbar4B6WkcMKD13cR7JpBtzABMc2q8uCf8hgBzk0+t+7FA
	EmpqgCKd6Ddqjy51DRhXUm4sG+ZOYEdTfrQfX22NCBmzYps+Emfz6ueGr90574/myncqf0VyJ4Y
	Z02Ln4TdGhQEArfdwtJQlWVO5zmLbQi9/tinnIBzzwjlTcyshWcTm+drO+4PSx4Q72DAboG4v7K
	XZ1QzBEmCBuKbwBk83XZqOBnLwwuKIgzyf/02JMnXCkRD5+bD41ui1qu/auCAQPBwQnc5jGcb/P
	1wOExh/Xb31TXVY2KDtJQjEd8F00FjK+FvMPqIhcNLk6c0J1JTunWs9eQ6Yk950caZjS9IrS3UY
	NwxcYrHxFTcWMz7TI7k0+6ngGZgxcdqE0+8OMilqNAd3xcfzoMWWvpCAj27mw20OXD8qkTt4=
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34573201cf.0.1794297935113;
        Tue, 10 Nov 2026 00:05:35 -0800 (PST)
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34572611cf.0.1794297934423;
        Tue, 10 Nov 2026 00:05:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59436esm79121566b.40.2026.11.10.00.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 00:05:33 -0800 (PST)
Message-ID: <68b721d0-4777-431f-bd22-e89c9c21853c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:05:31 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2d04f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ArbKvjEle962CzFOaqYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: RQ3ul7N3so7chSwFQ7PhlNvtTt06634m
X-Proofpoint-ORIG-GUID: RQ3ul7N3so7chSwFQ7PhlNvtTt06634m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfXzi9QzdaIQ6+y
 Hg2i98Z/Qk9gHUj3D/5JAzJsrsJqjuuDEYn6zidB8QzikPwrUHvZSKKj5jARBora4OnzJWzX9lQ
 gMkEH2303/fMWxRpMcsVBL8uTBO/IMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfX63hLo5EZlCg5
 bWo0UGAhygvbqYX40WuIxGNrTy2Hd7YzNxjz5azAmsOatGfNlewe5nBz6DaHQhg8JA2jbN4x7zR
 uNSl5FIr/6Nup9WMT1HVW+pAsJohBhdvuvRRMxglmtsunAB3QOpOFWTIwwZw4GT8pmC3X3aKu1B
 +Fj2VOCVfb0VIwxZ5bM+p+xZgcJ1+uKkKwlNlCXCr8D6jLBx54C76eGxnvzH3p2O45tD8LC8Avo
 Kj+iBkksrS+6iCnwD9IyeLYm707gW1ZsusxnMvImpHPF2JXUPbfJ9qKpN1FHun79hUxLgeOJwSc
 haOxV4RbvI23P2/Ny22lf+wGNGC8bWdCz3Q/qQ1nmr2CSK0tHVa2BUGwt6xops/pvRHEgJmP873
 VajpnuVoy/BYCBsHuwfkOljlFHBHlYBvyTFO2GbDtk/IrLkFHoRR/dnPLnJ+Wq4o4lfMGAJDU6Z
 rqUXEJ964eIeMnZ+QMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100032

On 11/9/26 4:50 PM, Nabige Aala wrote:
> Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
> Enable the two DisplayPort controllers associated with the
> Type-C ports and define the supported link frequencies for
> their outputs.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> This patch enables the DisplayPort support in Mahua CRD.
> 
> Functional operation depends on following PHY PLL series:
> https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
> ---

An alternative patch was part of the power grid commonization
series and has now been merged as

fee7cfb39608 ("arm64: dts: qcom: glymur-crd: Move DP0/DP1 to common dtsi")

Konrad
