Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98937268A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427020; cv=none; b=ks2ENTiE8rbhrhIk6sZ2ivHSw6uzty3wVyNUR3r1JJjp/4ugx2IjBgXBWGpxKOiwfrArVRi1acicS3onpCDsh7Ci7UBtUNGuVoHmVeNZPvVok+ipn3yk5obKBp9fGs7e/DDC1PJULya/AmX4pfg9rp+u1XjggVKm+4Xw5eAAVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427020; c=relaxed/simple;
	bh=7Zfs/6hhRgyw8fL1AnyWaQm3thDH1DSMxrgvQJFL5Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLNzqpTrbCxsCIhbQCoVK6u9SuovDNVWdO2xujzYfIh2xAnLSojUJwjVoHe89nCQd7nlKWPIpLbqr40SFyelthmvLe7q5C0kxJCr69LCVe2deYAb4oewmuQ4e4xfvRM66TBHKSCff0RI/R7GwgIG+uBLgORCSR+/ouild3riRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUVB0c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anjLQgQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUVB0c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anjLQgQO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683925fT043859
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=; b=oEUVB0c59HzMRCH6
	nzPTrI34Mxo4NgolgRlnmjgd3cauFHGhBQBbex4wnBC6TavADg1LgHYBRAn0v5dv
	9wX4VJur39fJlZu5Z/x6vKDmpaalTNtaxSWf4tJwTUSwE/i/VQzJu4GKZmzOFGDT
	adPZjVro0kvaL2xhmVaN3nbkeC6vc1bFcnlnjT9Lm/EW0hPWXk2W6fMr1K+2XrJ6
	4uy0v8ABbs3gvyNzKO8ZmYyj9oAzBvcPE+84b5TyP2YxrPcxOaEkyT5AHFVg0EP1
	aI6vCZx20bqOsCtjjfns/FuD/Bg2SZN515CFx2tcAFoa8aWj9NhYxkI7Zr1wphn+
	nZGnfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh59u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:16:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso51796185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427016; x=1789031816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=anjLQgQO9m0juUZ0ca7QmWlQJmzg2rz+0mWSTtlde+Z/zlUCK5AhPX/Uq0CAObJ/SO
         Gk5ykmjZ3y4zWgGPVmD39np2Kc3oIpLQr9pHIIv5TRYQ1hVUiiBNCBzsO2yugXGvfUQd
         JOFUjNxUFhV+1FkkWvKBF1dFnOxb/O0WYVr9uoeAmLWwT5BRXkhuUEBYfS4kLd11T6AV
         WwBIhKI/6/zWkMWz1f3+uoYEPRNoyAjHpghB7T2U6ZJDMxmrh2F8SSAmjJt6AoOAPlHg
         nt2/xyqLOADCZ7bV0Q/30w4UWPuyuoGINUw8viwXPs9Pv/53CLmSw5xFrxkixq87d7ho
         mSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427016; x=1789031816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=Zf3erXMetTCyY1d0nLx2AhIT9yIq81LE22xnlejiyA78kc001SJW2RP8JK6Mn9RYvu
         mtsElutmBTrUt+cEfUk+Ne4N3LpT4ubkCBzBabc6npy9Qazntb/d1Gh+pGong72xw3+I
         MmXHQC6SdAguzJBnyrV6k5dKCU4P/A12+51XVosRsWLJWg5+LPbcxG9JBFqrJcbaH2wt
         n3eLwgVTKnz4v0kAcMl/EPMt0lnFuqdsK79X1RWRjcR2EYRPIe7Wf2tCLO5jrZmWWjal
         R/ov2trDd05bBVLftPKFSfMAzt1PMbbLP3nNM2/l5VxTzV5XZ1ILzvavEAJN7i6a6ttk
         SSGw==
X-Forwarded-Encrypted: i=1; AKwUvBwxzmTmCwd4xA4lTPn/i2oCxxaxHzPu1y2Igjw+nXPIjaDGMu02KJ8q2odfye1kc9GYheN/rhR9BLZaHfg=@vger.kernel.org
X-Gm-Message-State: AFuF++kiNNTrSCDYQ6ygczymmueYclJ9FqLRoOZfu9VQTRpwtZHB4hM9
	zsaur51sO9UQUxBAqVPmadJBGMlE/d7rIbLkDjvT1ItsAz1aSQbhnZj/L953I9+BggpEfeUTEGC
	P5DsNwRN7fGtwXBxZfhyROlRv1sGx60c4w+F7b5gU+MgcAywtRiuWzFVfwvn94qILY/A=
X-Gm-Gg: AYBFou2RbVmgtmRmxjJBk0oX5KfF/vXGQieAPPHF/mPdpXFAlv2n8cskbToO0Zg+uVN
	Vbmqgo5F98WFt8f19ZIyvsLWrPh0BFkDlf38aGA7LeaA3beWSN/bRAc6ZjvtHIb5poRyw8v/oq2
	qBJM9eluR+PFLlm1nYXJcJlmZc/P67JnAEjAMmg7QLHkEqPmMKrR5JRm3NnEKjx06ipcXbqPDYo
	urXAEZCeo1/ge/NIdE+7n3uf2vuN/OMi2oYTdHeYE2Gi42muKa5Brx/4Cw0Y9TzrB+NCumspIh2
	ihqeYE+TNi1Qq5+j3KrZtgHtVg69g/rblaYsveHGOfAo4ZvSgpQgsENKIVD8/KcVJm5zegYD8DK
	/77QQOwZV9FuP15/amPPxFg==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746528985a.6.1788427016576;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746526385a.6.1788427016118;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41e71a9sm72173866b.43.2026.09.03.02.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:55 -0700 (PDT)
Message-ID: <8fe5c6a8-5202-40ca-9d44-aec284a90042@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXzkdDdDwuh2ez
 B5hNSWACBNH1El5Aa84n1O2/1mxBJFrOF+N7eavs0IknMEiCCgGK2iCYg6r2i2Q3/OJ0fJ4d63G
 A4bTr1Rr5hMZCg9ULjp52tTXct9wY1QhUIRc5NKep26aXDWgTWC3uL5PI46vyq8MSvcYQNKJGiM
 Rx9swn+nuGBhFBx6J3IFcalcjKoFcCSckSderQOGfBui3yn8sV7O4RwEzb3x59cTGLBrVITkwX9
 We5r3hyx4rVr2jCJT3y2UWezlNgV0x+QGapuf8g0Bfn51BKyTw5+BfKwImA62whyuhmV6asuGW9
 oedMPauHr5bEpEtcyBVHraaw9u24nSnUI/fJMuVZZQcC+EIRd9oQVjVy1TnfAchIuDPgAznZ/GM
 QNmTzRoqgrGh6hx22JZqDOYWfcnoH8h5NmS18Keu73/iCsIew39Q5rqCC+GopeesjGg7j3RwLnn
 5A33tj0gb/ZWJODlN3A==
X-Proofpoint-ORIG-GUID: 2GeFgfengV08w5ci4iYk79VKgjf9gIGK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXzPUR6giGZxAA
 metm51JjQqlNgVAEPszSqMbkZvz5p8nozjh8AsK0T8T9wjjLIJJCM4RqFpf4YnkwuajZRQ2huZa
 XVfobXos1Jv8g5xLwR88vVQDkS7HlF0=
X-Proofpoint-GUID: 2GeFgfengV08w5ci4iYk79VKgjf9gIGK
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993b09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LvqhzNTnz3AqRsj0EdkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
