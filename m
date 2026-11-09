Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183329;
	b=lUW4KAhfkNwFZcNGxwGO/EwfAAUcGUrC4/XAR9dm7f489kTre9whj4SbUFbgGs9FHmJ3
	 FOm6jW5WiVd3z0x6ImL3K6oXt/AI/U1q2jpzhPRl4SHGzR/v2ibWpNhd47Qpo5FwWbA8r
	 Xc5L8pSPybagil5iEsk1OI/ZpVxDmcF0f4N6MpNYSY7nYl2ude/VZEzr/hvfmXB3fiLvJ
	 duXE6xP8U/J6+LpqEYTVIYKPKstXIxlJwX84vfO9dp9GiLYEgiikpQxdYRW59MepNg/8c
	 ni8pHnVXiBpW/75vU8XYZI2oprlbIHS5GsFxhJ9sqhN+thr4ukHtu40SgIvG+nohlWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
	b=FA/5Rm4LIiWCv2n5QPuMOgZXB8EjLuTuPj4MMUiNpIQzc0FewQWIXKGUvtZU5oTqMaBj
	 Ioe6iyg3IYwQTsRqcBYBOLh/0VbhxGDCpZFcL0/RtDbk28T5gufgtxS7gxGF92XL7G7UV
	 0JQA25Hi5qXTk13l6oxdDT1nOV92skNTb46GEg0EGHje8yYwKuqGCX2S035E8v3kijOm9
	 dYWNcGz8viTpKhyvs0J7/Dt68LPxMK4HHGbvgsy9o2q4eTJLbvfBjtIgKFZklEZ9ZO5EP
	 JyG/q/UkM86irS481FX0kRPJuJcid6WAtfASivWQu5hmXCGalsGkkA8gx/b95lrSB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02079606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02079606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Kdvkr830535
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 00:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=; b=bjrIIsE5UjStFi/9
	jKbRcGHt46Hbhao8TnWpV0EYDWG6HSasU5PNU/Y9lbkxe81roSDy6Ks+5U5Fvhhb
	e5U8c3dF+gEGi+4kzJYPMmbXX1upf1AsZ475bVN59oFMz5T+DjsAyxERqnRS2Dc+
	VgZ4aG0Y+Iqv8r4Po1DCKblEPYiOqNEnGRiL+7X1SR37FvPJYboHmKH7aCkCqauk
	VrrOqmNCAAqK8jV0+Y7VacOI45nswCQnMZKZw3tdqJDzVMfeCHy+tb7IHWbNx7/k
	UObeBZHlC+xZb/pd0R6/SvfAA8it2eCJNyRZKpPIlPPy1J+qwabp5vWB+qWa6ypz
	6b7heg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k3v2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:15:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so523483c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183328; x=1794788128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=FwGI0ShxRRkijK1Z36+klEQOsQzr/ymfICMUvSoet3RawoO0mBRpfrSQoOyMViNcjm
         EOlTU7rEj2miDfmUcW/VPhfmqMTNQSM7FtznoLiGRFHou87hmFCQknBo6sV2HNwuhI6Y
         KEEvwcl0UK+67N67LCbJXScZj1Jrne57V5yYHEqVqsCv69fQJDxTieMfX6KQgt6mfsM9
         U9lfu7s1UZjROm38/ioJjF/grwkSX4pVouo9ETSnVfkmk3+29zQ9WtdB+ZAVJiW3IyDq
         vTOT8L3+BEwxgVOBYeniUchZqlFZZDzitCBQmsfWSEit6k7bg+fOJHjw5xDSm1CgMZmt
         pi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183328; x=1794788128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=Q3FPLuEsugyOkVr4CHwI/jfH9hpkrXcfEFd7bgYnvsqe3r+WF/vslM1iG6pVAh23EV
         vFrBu1Z0flAtVSZlqnKUpC+iJ+21GikbAwWnRaIQEnvWFakgdPR3zBtrJOJ5wbWt8PFl
         bwFfoeQQ3Hx1PzD2eoqCv1x3hM41L9k6wnX6mHDW4kK5dKr/wq67lt5lF6hzRBVHA0Ma
         Xtjawp0Ijd1T2RCPX4+pUYLWTgkHsNmoDX/rc3J/u12UfhUc6iPCNvp4Ae7a6f1Nlqej
         1FQp3ZGV1TrThhL12QMxEhoP3W63SNe4mk2myVs9WypHZK8koAFDwaIMbjl4sOOwjCOw
         hliA==
X-Forwarded-Encrypted: i=1; AL+hErHm1kvS7fbqaQa7kaDInCEkuN3QfZ0ccxvZNKCqG9JnmcFxVGjItCsFL/w7egK9ahuTRa5EAbLMxBSlmrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z31NBrATXpFWWapNqQ1HkoxyvTa1vl0pv0BotiC4lZy113lAO
	UcCAqLUhxUUSrj76Z1QXUVq9GKNXyxloy6J+N0BUkkyvMJeRUZ0+n01txbfMI5PQIstoEVg2IX4
	EDCOBus/cWE9xFsu6of/usxzHTpBco9xHMph0/lNK9JTXslKlZvvDFi7y3VVP0U11vvM=
X-Gm-Gg: AYBFou3tzBte+a0x1J1bXj84c2zDRiqtgHUFv9Q+cPvI/l4qg29KuKsK1a8xpuJH6/M
	2VAo5YzB7a8862P3KI4RjeyXNZI04RK6VPltjUKSVNHKy88/f2y/TACW6i6lHTG7XIFa6l0u7zL
	SJXoFnrKoWravgarUEaS9f3DasbhBJb7mB3Gr4FsHqroAcH3dT/IUC7n5NJTukVAwklOR6TxC54
	Irj7OAXyz7fzAxSCJpvAMkjqmt6xyGk5+3xxmy8W793nF83c/sqV0FcXN/0fMu71nZqz7iQv8Aq
	HAfKro54UfqZraX6/W97LrA3t0sElnSooqTYGwvYVUFj7pkTf8hqCVCbwAfOddhTulgQbNzIRQq
	kbz/irHQkn9zBdtACxBXDTTOgCzguq7wuUFECiMTQaBTbVgTxIsFglXDCreOq3mViBg==
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134341c88.12.1794183327592;
        Sun, 08 Nov 2026 16:15:27 -0800 (PST)
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134290c88.12.1794183326715;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 16:15:24 -0800
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-hp-omnibook-v2-v3-1-f489fd0bdf33@oss.qualcomm.com>
References: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
In-Reply-To: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX6Qg19hk8X+BT
 PqYhsfO2nTVR3+kfuvP34N65v/i7dYBFlckcwIf45sSGwyFc+vxaGl8IhMHiYMifCij4daU528D
 RTorGinMEFEF49Kz8isVN1GTJZBTYk2uyZf81/1ys0iCVrq1SYQdsYH+AUjAsATzmuN/XNj4tTX
 66Le/ovs8h/j4IwscciqnICs9Idq+H6ZKQkUrmxYVHOixDtGuFgSc0SRX7paFsb8gPjQF9V6F3K
 ZMOsHTHyQBoK6VbHNlXZAbk2IIPjGJuDPaknMBamHg8bDFVfq2avPAiFLO16dPt9AXqaRyym3Aw
 4MmnlyDShWqDCqxvY/gGjELOfuPpS8EtTQk79Uk+Pt9uKk+pY1DlQ6k0+QStZhjbTbLdlVDpkvb
 WiQY2KGm/ajaEdfV/dXqPdQbvD7JLMNiKaFPKuAj9VDIu2PSAEoYP3SnttQcnCtjM3OeH81HrXr
 MVkTlvmUMxoKNgkFSGg==
X-Proofpoint-ORIG-GUID: bwPKvlMMv9tA3QXK2LaG0lZyB0kfCBTm
X-Proofpoint-GUID: bwPKvlMMv9tA3QXK2LaG0lZyB0kfCBTm
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af110a0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfXx9He+NaAZQgM
 JaltRVAyxIDXfcDyG11jMfOpqVMaP7om1GRXNXYQ5MeS4Ow7IQYcdFcgo7N1nx6tsVpRrMyDJkq
 y1G9mhffQNTs8O1G7JBYWUK9oUreHw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

