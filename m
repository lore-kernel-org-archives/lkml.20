Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480580;
	b=3W0o9i3FVftwaC+nwzGnCdG0lAjl+yFE53gAiVCepcKh1NmVLyUF2ftBFmLPgI+iJtOu
	 K8x2/5EEJ5Bt6kpqtlw2Hx2IFsR6aeQUg/n1eRleieDrCSLzOQ3mUYIYFYWx/S08E7z34
	 OVizIGp3wqhz8Ad9NV9XgcOtIo/BY+B/E/pO8NOSo5qNDLlb8/i6qjnW+Dl24PJVSwejj
	 AT3WdqP+x0VR2exOqeMRgXsVwiDKs436HN6EYyhPNR8UiucpCWKX1sl2xLGW9It3ruJL8
	 V0H1Nj0aodh/u0IVqNC3gfx6OWdZp35CABsCVG2e7ZQCBDIZ2C/4Vbre4Gygqzyxb9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
	b=mkt9EPbtxISA/oaufgBAt0WH0e+VKJIbiiODlr+7c0OigSOOUwyIkJ+7pX7u+H/ttrNT
	 6b7NIqIKeHgCSEwU503doVSJY7MDxl43zr/NNmdlGg04KqyLhf9utBwPUBrqaceuhGGru
	 c6yAanyXU6K5O/7SCAsgF5zCHIZzCM0rVRasIG/u9Z/KRw+4oVZ5V77S9OMaHS+FK/mq+
	 Nb/zhjRu2VnALmbJbf+iuq6FO9pEhhlmFw9jYqSegoWg9aSOLUgwN2tjIuRTXweIGxSKu
	 VC0XrKigjllsMUsgAgXi6rV5NpzpvAq1k1/oHnLz2vr/6h1zb7Z/IC2cRe9gcW0um8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21786606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21786606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7DbnT1517045
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=; b=M0AtttzRXOO1ivfx
	P54emTh0eMhl4KmvPdkYFzNqyXijoRTDcUeSu+ngkx8qXmnJ8lct3xywB2NAkQN0
	oBu+obGrXburVFGq6psNnsw5orgmtMMMRkZlU2vCL12somGkZtjr52kLvB0W2kha
	a/WGPetwm/kk4EfpfnRdL0747MqveEigzgFvLp02ZTKdvCOmDVWphrAUSIUTbCD5
	cMN9fPtrmmsDodnrXJlXP+CEAEgxOfVtf+BVRJkUliHevJCpVGxjxUGPD7/GzbY7
	mwy1yNt5pGzpecmUG3w6vFHSACYpdwEYwsglREW3LyGE3y+DkOFZrWxhXUnI93iA
	lBdXAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phccs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:16:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536540909e5so4772961cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480578; x=1793085378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=R7tEs+M581LwNazc4JENz8ncY4wktrXLRdY18caE9dHTr0AZc671LdEv4cOjgJvPyi
         FbE443yzy7DmGYDoETxQ/ah4o7CzLwVU0J3aCTj7cljjypLUQ9T2Rc7hiycYQx58/UZv
         PyQOAitiKVI0i/qPDMjZJZI2S7L0gyebIOk4GR9+4qve0Exuw+UHlyNAcvbpw01RWfkq
         2/wXQyo8dgM19eauVLBjWF8cy+J0nJcql3OWBDHBlhPGoE6o/8+cobTs/MVoBZySunGg
         RoYpeyTPJl+G1Siw+aBVG53DKQuMQh87ZuqASebKx27//z1MC6Ue53w/XPlmKucMYzWR
         nOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480578; x=1793085378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=In3MD+pEhN7G540T4tEFhrpLQhZ47U2g9QRLjaLHujYTTq+wKR26NZLBHPwdq3Uvuj
         /BMwIpOQaa29dR5akxcdZby2B64mdLViECPUkLkwsukYDeSrUxJTb9zMA6laGHQPk2hM
         yoWmwhdRjJuQKifsSYKjvEPfbe8HQ6aYZvsIbYIiOyhslCH+4tskOF59pRl7u83Am7iA
         3Mk7jXvbY+DUg/wcEBeibogpFtan5UGxxlrcvTBG3emjaeE1Ata+MRQj3ZGCPXvVbdtZ
         vX2nrKwAmgxVPbztZyAegqpgc8YUGRXRYWFQ6wQP29osMlmw1f4Q/RINID6YuKvjR+O/
         T7kw==
X-Forwarded-Encrypted: i=1; AKwUvBxqM+mXjCI5rhSXFKcEIisKS/bqCnMtav9ui2slm/e8/lBscO07IfnJPrnNcZ7+TX6njqGUmK8vZj88cjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1l1i6i7HkR8OazYCV/TBm81xcMFSCBwgFPo8qy/YXwhEze7nH
	WVDBvuLHNVyKmJ+o9OT/4pq5aY5pQp7JhHZJhEiE3CZK1g7V12N+gvBaYBZp+ZmXkn9yRDhRInm
	e1YPXJKQIzc6IZJeo/M8RjVLYNaRruWEIr5fyXVvAX8VjP0rFgR7V+sYeR5LJZ1YN/54=
X-Gm-Gg: AYBFou3spGrD25jE+9ehWbzj9LskjLnXUSfu6uAeecKHJ+H8R0axis6bIMY0RpDsQ2w
	Vfpw5NvJavCT0kPQRapEXWqtk4afBAmjOPvCp5sX+9MLzAAVe2Yt69kvwBwWyFOi589yiFER8AM
	zG1+P0lz4yVZ47HN1dc+bhxBiEkvuuRDr1wbuEyVlT8pM5yagzDM4Yrg8DLQG+4UWGm1f3w39eI
	m/7JznxA/Fd26fFqVXXURTgn7IM+6NUNAR6kfFMMGUBT91C1wHFzJW09GuVENi3EUY4JCDi9AVp
	TbV0x/k6I/+17PJZTbvnSs3t3gy06kuZsOWbijq1u3wW7YzKMNshxbBtqACsSxrudDCw96ebbWp
	o2/SSZT+V16+sPO9T1i4aaA==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1516091cf.3.1792480578327;
        Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1515851cf.3.1792480577861;
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb164fsm447640066b.70.2026.10.20.00.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Message-ID: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:16:15 +0200
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
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad71543 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JzhSTXaIO3PCq1I_VtQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: QS46ylHRAUqawEDBXffpz1SGSZy6W0o0
X-Proofpoint-GUID: QS46ylHRAUqawEDBXffpz1SGSZy6W0o0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX1GqbWx1ecldS
 7HEuEyNag1dtA9IUbCROLuu48QAotSzMnXHH6uZt2rHNNbrnMyKXFMB8/Lh7bNmv0TIc3Jx2VfU
 /GGnJ3Xnlz+r2r3C7FdPmXU4Qq8bZPCZkImAi2Z/yMQWUc7OE20ExNFbySfmrcgdV7ImqRVxrJb
 tGOTVwuiUr62dVTpn+S6P/c5z0zNsDX8EkjqHzhGC4HCmfjwrighPq1jYPh1exWV3ASKEwFS25+
 PL8f7lSrepXsnWGG0iJSa7LcVJRJvpsEKCTalkR4p4cfoRjevqFvB+HcW6ajJPekXzm3e0guy+5
 BDfsyP/qd+GE3LZSLy8+AYSuO78YNgUD4ql6XdILvJFFv4XtgNx653/eq3QBJncv0aq1W38Pv5e
 9I6+7mdHhWdALTYXp3OIgvEMTDRnO60ow6HtyeGa0MbuiXBCNP3reH81fqTq95cT7bG74OyuQcY
 QTHQiBNkuE2/khwq03w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfXxFHVuksM4MD2
 FpYRWcxvYBmHuGPfgW+J7Ryql9K7qVXvLsWhtiePklabSf5zS8udyG8MFsHNA0yW4w7kjZMR6W8
 k5vQ7DC2bTopq4lSZ5BOWTcG8bBidls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> With the NoC providers described but no consumer referencing them, the
> NoC bus clocks stay at their boot rates: nothing votes for DDR or
> config bandwidth, so masters such as MDSS or UFS run on whatever the
> bootloader left behind.
> 
> Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> PCIe config slave, and requesting one only makes the PCIe driver fail
> to probe.

On upstream, sm8450 is the first one to have one wired up in DT
(intriguing), sdm845 is the first one to have one in the icc driver

Downstream, 8450 and earlier do not have a path defined on the PCIe
node but clearly that relies on lucky ordering

I threw the LLM at msm8998-bus.dtsi and it said:

The only edges into slv_pcie_0 come from three masters:
- mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
  which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
  the apps master.
- mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
  is fed by PCIe, USB3, UFS, and BLSP2 masters.
- mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
  is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
  mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
  mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
  of those is reachable from the apps master.

But I wonder if it's some sort of an oversight. Can we try to
regenerate the paths internally?

Konrad
