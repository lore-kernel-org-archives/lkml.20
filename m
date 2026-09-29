Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C46515881
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682245; cv=none; b=HT75zJxmgUDj6WlCaSA56vIZ9NMDWW6ZGXYenpm1WJ1HavME7e/EDFDnMl8utTGRaXqho/8A3U7xlaVnQH7pfKxjKfInil46zkVjW8cT/2rMD7DaqVYS+DA+dHhRB7sUsj9F986aEAj8XG3D5E6mDVsEhHm5tBYExq1pvYBW+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682245; c=relaxed/simple;
	bh=vqE74hSqpullA8LLZ475ZN4prtKm1cvbqlh6+zEdAYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYluIBv/srM9O2G1X5RHM4KPzjWMCwccGT6emr6/R2kjfaqQ/16E0kaJovNS4f3I4/x6HJbo146gFplf8rKrjxnxi7KGfZe4gwuKooavzPjRDw4llnzZzRwwY63pQLL33L4K8jAyFRuELjPxPSKbNWz178LPEvs2C8cjY/rmd1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2a/30ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkKWnaQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2a/30ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkKWnaQF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjJtn4118930
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=; b=W2a/30ZGjxUjRudd
	HL9zqrdJZ/JGZrpE9qhefBa4KGXfjdWghvRWSRJHB7/LgoBicLjGoO5Y7vAoAiXg
	13XoPgS0VtFIBvdwhfUAN5Rn+3tQ7nOCQmtSN96WH2AzdOBISWDfa9gbK3pU/iCE
	rfey8LqpAvN3LOIkvQ6raCtyAbNSM9OabjpEvlL6a8oBk3xKKSyuhH7Ia+RkP/2B
	1S+zzCOT1HU/zLZMtERCDN6MeAQZLcMl2cw8q+uUUEAG/jg+FJnlpUbXF4vSRtk2
	pvrpGM6MDbjCwp6nv5IK2ld2lyF2bTVHvatFdkdOPljt0wjd+TdyCH6taihMOJtq
	VJCr2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144tr8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:44:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso781003585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682242; x=1791287042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=;
        b=MkKWnaQFw04Qo9Vi691c/10feQR90neXxbbl5X4WUsVC9Tf0XClnxgaxW8oInPorNd
         yEJ4OtdgUJInV2PEk0tE84MhdrpG5TtDLF8UYC3t6dHAwg6DiBT0W652cLhGlVH2UYpR
         b8lVfD7Db+kvbQHLGtNLriXoc4FVN9LaUcCZ9PduPWn86LO7WVt8C01fiIS12B+1WMZq
         5BL/15W6JHCWkC5nRGssgKQbHnCupXDI83+deTOqjGihSVy7OMVkw/ePOLzLUAzvsSXs
         jxHl6lrbceBcWpxc0mjyCq8VUGdHM2ayLPcPAduyMVZKVwsq5Pzyr+YWqENnVHyvfSCq
         EYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682242; x=1791287042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=;
        b=e3xqXN1ZaUy4Bf84XeWOtPFUtenlAdyZ6s7f08Y3qIWLxz3QRXtkQCVt+qfGfeZSUD
         4BrEwxZx1fP9CpjCuhCHKjU/JG2scPHW5mbcpmKJGH1ILTbYAcuhnFMSlZ25kBtArFbp
         u/ep1hFWZL31gFCqYhKrCElb727aVwQtN3vyZEYoGJjrICTPziYRSWirKZ/qnjubZzIw
         riCq/Sq5cusX+3o9XMYTEeE5Jo9LgW21uy0r9ztEGJLDnCzbAycTRNE1g+O8+1tiTKEx
         rzinGPpob8EI6KvUrpUigkT4HWDeIB9QzpcX73DbYGwJ4afIoKZlk5KJcuQkOZC7QOyL
         pvYg==
X-Forwarded-Encrypted: i=1; AKwUvByRVw6xq5TAr/iO+9tfAKjLBz2LLI6V3c2CFE08iEQZHz0910tUwaN7pIhEHchU2eFenYG211NNGwxv6TQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nBt9Sm1b4SO7mQPDv8UKS8RPIXAQCTR9ua/eA3dUOEpkBBdp/w
	DJhmmYRHbwxllqPdqHoL+J5JIB0WV/WtBhQZfcPJzWkmlVCnQH3YPUSzKjMXW2kkUyP6Zgow9UB
	Cd9aUhQ/IJZkd6SK+zK/sHbobsqWOQUMhGpzxpMxKINUb35GHQEWMUgDhKcGEJfOdtsk=
X-Gm-Gg: AYBFou3bz3zESaDiar+rJUV/zlwqbCB5GrMqWZeXUzeZJzEcRRuG6uPXWnQkesyO59P
	Ey8dNujL6i+CjBU5iiLonGSMOTxSvQRyDSlFX9ZQG5vuHfc+UECuijgCUJZEX6FUE3cx7dlOoV1
	VlJi4ZJpFKZxN0OxJRnjxektbjfTBq53mTLzo5GvfjmJMbx3OCu06EOwI3q0MDUeUcafCrby/mG
	7mRVfssX5KYrGDjA1V0xV/iTAZmLmRCLCXrmM0OK20svGazH4+ZGB1hIfmua52qPphgHUtD6zmX
	H3TOY4iTXUi8vL/ggHrg5xlY+L/foKj3fnlS4Stw6JFme42wbFRzxX9ZuWA9k/b2eBU8O5gS4R+
	eam0Foef5Le5ZkHp7trRarbiXQAravEuGpKgR6o4=
X-Received: by 2002:a05:620a:404d:b0:939:9f51:29a0 with SMTP id af79cd13be357-93c43ce6b41mr2573893385a.50.1790682242305;
        Tue, 29 Sep 2026 04:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:939:9f51:29a0 with SMTP id af79cd13be357-93c43ce6b41mr2573889185a.50.1790682241809;
        Tue, 29 Sep 2026 04:44:01 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm86145495e9.0.2026.09.29.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:44:01 -0700 (PDT)
Message-ID: <63cc2480-a8b7-460f-b89d-8526cb17db36@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:43:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <w3u_oVZRxmZkAlC5RmxuB0v5k970jezsVHDZvryQ3oYkStqmsp79LjODiA0mYkNl1jkRya-7Ncvk8KGrE1vnUQ==@protonmail.internalid>
 <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <8df7fdb2-813c-402c-99c0-9de6b0dbcd0e@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <8df7fdb2-813c-402c-99c0-9de6b0dbcd0e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX8rYGxGQepXto
 pDxcGKZykUcWXWYDoL+5NQ8v7Bh1cF/ELZJf3rD9DLWndavmAPLTuG5YnNGN7wkZcib0O1LSXmO
 EAMxkfQccpccLbZDEKLI0qxJXjLNCHPpNaKwahGvi7Jo4NsSmwF9mAy8yj7RIjvsWawgcqQcQUG
 eS3eLs6FGZzEtRmjngLI0EfYEVVwhHK2KvWcuZuYHhaqe/hwe8bYpfnFN+1OdW3CTCUjVCDHw07
 TBIkGReIRpQJM3sOTw9Q1CHCEKuFWAn8o4Ui8x+VX2FWc/J8Q63RHH4EIocA4OjO+abO+oOjnGO
 Lu8mWQMJNn5GaEQqi/rpfm0EIPNCi76vx5HnN6CJrH4pDd3NS7xq5QiA084eR6cGZ1Y8qZz1VDw
 oKYSpTAOHhrFDwd9pGxuV5GwIJay1UGlhDGQMceC4YjeFUcdR3Uzo80eienZJ16JooHTerA+lXn
 8lVidkg+Uy52HZ1ShQQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abba483 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=R6d1XtvNd3bo7WazfPwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: l_2BDryK_yd508WeD2WISJjVG7v_UVhW
X-Proofpoint-GUID: l_2BDryK_yd508WeD2WISJjVG7v_UVhW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX/V83nsfwW05W
 SHgfqcRcR+sew5YtkCIgkztBfaAlMJULZsS3XBrk10oHDiOgv1hLbkdOlGVQu4MkLLxs0elHWQV
 vPte6PgwExE2Mas8g8jHJ4RAtOsayiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290046

Hi Bryan,

On 9/29/2026 11:39 AM, Bryan O'Donoghue wrote:
> On 19/08/2026 10:32, Atanas Filipov wrote:
>> This series adds a device tree binding and driver for the Qualcomm
>> Camera Network-on-Chip (CAMNOC) interconnect provider for SM8250.
>>
>> CAMNOC is the internal AXI interconnect within the camera subsystem.
>> Multiple camera sub-devices (IFE, JPEG, BPS, IPE, etc.) share
>> CAM_CC_CAMNOC_AXI_CLK. Direct clk_set_rate() calls from each consumer
>> cause a last-writer-wins race. This series introduces a lightweight ICC
>> provider that aggregates bandwidth votes from all consumers and applies
>> a single clk_set_rate() call.
>>
>> Changes since v1:
>> - dt-bindings: add all SM8250 CAMNOC master port IDs to qcom,camnoc.h
>>    (IFE 0/1, IFE Lite 0-4, BPS, IPE 0/1, JPEG, JPEG DMA, CDM, FD, SBI,
>>    ICP) with a short comment per group (Dmitry Baryshkov)
>> - dt-bindings: add IFE simple consumer example alongside the JPEG
>>    OPP-based example; clarify opp-hz and opp-peak-kBps semantics in
>>    comments; fix maintainer email; align provider node name with DTS
>> - driver: register all SM8250 CAMNOC master nodes
>>
>> Atanas Filipov (3):
>>    dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
>>    interconnect: qcom: Add CAMNOC interconnect provider driver
>>    arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node
>>
>>   .../bindings/interconnect/qcom,camnoc.yaml    | 124 ++++++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |   8 +
>>   drivers/interconnect/qcom/Kconfig             |  10 +
>>   drivers/interconnect/qcom/Makefile            |   2 +
>>   drivers/interconnect/qcom/qcom-camnoc.c       | 279 ++++++++++++++++++
>>   .../dt-bindings/interconnect/qcom,camnoc.h    |  52 ++++
>>   6 files changed, 475 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
>>   create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c
>>   create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h
>>
>>
>> base-commit: 9e970952a9503d6ab471a2fea4c10b6a2785406f
>> --
>> 2.34.1
>>
>>
> 
> I'd like to see the code for actually _using_ this in CAMSS, seems a bit 
> incomplete without that part.

Yes the next patchset will include the CAMSS part.

~Gjorgji

> 
> ---
> bod

