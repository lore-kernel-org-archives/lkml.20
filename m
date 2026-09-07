Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA14CB8CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789019; cv=none; b=prdY33YzidtWOGrmUTBZtpKRr8ZKCAWmwuGESiMsnHamhYEtM83nd9cGCErrtdM+LL3VgUa1XWm9cKPm6EHcM1tZimPmI6LdrYOje31SrD3Rp2Fermg9fsyj0jMEUlig5ecKtTq/qKTSrY5ZdvunrF1MJGJA7LnYoNfGSojdLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789019; c=relaxed/simple;
	bh=o9S1JfDAchq51Lt+nfMscQYFQmX7g9WFFdmCc4nhmQU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GOmQFrx/HpRM7kA7j1t4m+/rRhUP5VwlIV5kOJnJxL17RDcQBskO2G6azAGAXt4H35f/9I/yAU4ADQrs/OYZrffcAC3tu7I38MAKZc9ZqYc4QJY7JrlcslvGZNAl1WJAYnslEoCvOgKnr0h1ygbExqgfAYq19Ff/Np38utXm7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pki9vY6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rvd/eKD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pki9vY6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rvd/eKD5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdP3p376759
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=; b=pki9vY6Bi/x7W2WN
	Mo32dCJkzGI7KUIqSgjzTQfqJCzdyeJkG1tzTk+YBpmTGPevcgf0IXUQsCVc1TTc
	//qcQCdXOQ6lonMtpsJ0vbMyN0/aNFyyZXTXMGPcJmOgDVcgGe2x69WnIAdV/fD9
	3YWAtsTDQqCH5iqpTOprK9df/1IWo2QHHk7THWe6a8PgBCrlKwaa4/kZZ9wqaaBH
	VBivDts2C457t1qNKtCVqn8ZYD7SGLJ/E7U355kS1SKJbg0hw0zPqgSAC99PfEgB
	DphXOyCOvLdQbLM+hrH6zwRZ6egd6KoT8o5JjQtVtMLS0cmBrNXxLb2e1DeYdQ6g
	5yr7Vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg18x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:50:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso4693157a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789015; x=1789393815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=Rvd/eKD5jeJC1ciKkoaNPG/T3W5nW+L+NU7U0u11sc9ungL06JQm7iER8fFo2Kaiev
         yL7a4m7McyXHWuBiyaotuiQGYWnXj0R3mZPhu7VCvMq4EfkGUVBBUjSQoAsYNlri0Fx/
         uudPHWVXjiOXVAkx5mlLI7qryf6wKbCOtN4JhwtJtPRTk16225qYLxgUoIIDpp0Br2t1
         mMsioagrziCmAoFHREr1ejQnP5Yg3KF22y7r8RAWUd+q8enwz5IX2IQQTul8Gc/R0zrr
         G0oeJWy2jHW8pBYokzIfCsBmksG9NRnrAx3HlQEibuDWnd9VK6W0ssNVd0WQGBd92o+5
         U5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789015; x=1789393815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wM+eOxTc6jOlnbk+CByrbAH9tqADAGsO4vwBIVFrBM=;
        b=gDrK4jilloUXGAVKDKeIpbVVa+h4u9Bcdxm/xITeMZ6gsNiUUKokh3tD1FdSAN1j13
         Zsd0niunO5HlNVLmwonprSkTd2RfHkURR3yhfSwDzLKG5jBjzdrCe0Ybs0SbG7xt0o6P
         J3hjvoP3URqrHgBOrI/UltgW7TKS9o68y5UWIfD8WT6e53o9SMIOVSHQHYiRxGJXYycl
         Un6/rPZJnoRsjVChJdydvwvDa8epVCRxvE7c+vPszWWc7uRtHNnzzG8vu+7tZPh/J16T
         xpnybtCi1hlE/62rxamPHn0Bi7/RFLHax+Z6ULxLhuNFgF7dSu0t+skrOD3TLD88sEZQ
         706Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrA5qcHMrrK7ne16dAnzTMZhCxfr1KxAmibELqadvagrsxssnCt0jZcj2K3tGrLvTVlFa7+cki2zY0FCE=@vger.kernel.org
X-Gm-Message-State: AFuF++ng5GWbL09CR3glVqoqCNPODLt+dbnLeo8cdXn0+bUFIL5q8Aa/
	hWwlgroIwEBPOeCbo0+kOem75XydaGftXtuO6DtBGbF4pY7d4ipDI0lUo7aC/vCB3+RQ/riNj1h
	V22vbg82qmYVFOvUmjFmJwh4Yb8mdMBbV4ZP3VJGVInqYhGHiGqJwfMiktWUpIksxMuU=
X-Gm-Gg: AYBFou2zMIKy/XJbipylPGkSelz42ngxBzhxpJ6eENyu4WhcHHmE8ZUKS0i8+YyKnye
	4xIFmno8HCI2cc0Q1gCEXkPcMtDsgs8cyaAAZgxewuMs7tHqqO+7tJVY2z0/JQe8nFfLkDzegBt
	uTDc/EMoSrKzwefnd97xmPnrSydfI+zJVgxCk+OXGV3ST++IKFyIBkbrGzay2p/vgs61Q753+ed
	NDZADhki1R0M4dZeBNciQrQpIyXmUExOr9GB5dH3/OMVy3c4NWFOwpoU4ZTKVw7MZNqlrbEVzl8
	MT0BQ5mh9SwajPwU7dHYRtks1pP7JML3jpUiijF1hfK5N4C/wkApAhXNMNtpwTeHtS9vhaHcNjs
	9DabTHIaRsK9xvnt2Uw3ekNwWHbxGXKqMgw==
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973629a91.13.1788789014945;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr28973597a91.13.1788789014477;
        Mon, 07 Sep 2026 06:50:14 -0700 (PDT)
Received: from [192.168.31.154] ([49.43.222.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm37879546c88.2.2026.09.07.06.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:50:13 -0700 (PDT)
Message-ID: <ed8157d9-d8c7-4bce-a7b7-4e14015b6019@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:20:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
 <apl-vKnwHWFJ8Kru@baldur>
 <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <73411be1-7b7c-4b06-ad1c-f98af338c5ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX14duh8wMQjDt
 R5TfFOtmaMblxaI8oSs8oBT0fTuquvsOa9GWgHAF9jXxOaVE83tL0iKuiODZ11AR7YK35zHE5y1
 eYptSPj7XO2rpM6dPc637TCeGLjnu0JiBfOvEXdlnRP7AwsaKJiVQ2cpbw4//fZdEq+oZJbjNQL
 219l5e3OQExLN0JIv/UA5RSAZWGWHKRt0XtU7JfbDDpyOMd4/MdkY8VTgMD63hE5q+h4Dr6g4ke
 3VkthbMdDTDg3R1F1/Ik3IH1gRXC4Ji+hfFH6siY85399hD9bSHn+J/mM119gYaoTeMf/3Unvx0
 +4HQo3os6zO5ifmcxAaKhgM5FiTztQYh9o+3fHuqNDaNTxys7sMuYhNwAvDQ4zZzwUZ7UU7jXep
 5VWFonDehYU1uZXbURP/ynX058OSOO2KVSR5CGFPVDx5Dg+oa8xU6ohqG4hY/G0+aQ4Nk4w2bEC
 erE7EJ4Z4QwtRYxTeFA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9ec117 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=zqSeLMjUMbmoh9kLUE0R/A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=TbQuDKBBEd7-K4y6meAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: fQWJhnpk2NwImZ7keEB2Jh1ktFFtc4fk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX71Ta7hGOsL16
 4sPyBdSWS4KWIIrAUx+MCXfQTIwvMFg3joKD59dejOFfO8PBoR3svndAi9NbCCBMcfhbGJgPbQA
 ClGX1y6sZ4v8LEihPIHqbnl11qmlxo8=
X-Proofpoint-GUID: fQWJhnpk2NwImZ7keEB2Jh1ktFFtc4fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070153



On 07-09-2026 17:28, Sneh Mankad wrote:
> 
> 
> On 03-09-2026 19:36, Bjorn Andersson wrote:
>> On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
>>> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
>>> stats like vmin and vlow.
>>>
>>> Shikra SoC specific compatible allows reading individual subsystem level
>>> LPM stats along with SoC level LPM stats. Change it.
>>>
>>> Keep "qcom,rpm-stats" as fallback compatible.
>>
>> So the fallback compatible works, but the more specific compatible gives
>> you additional stats?
>>
>> If that interpretation is correct then this patch is correct.
>>
>> But then you need to fix the binding.
> 
> I have already raised v4 with the option to keep fallback compatible
> in stats bindings.

Apologies, due to some other issue the send wasn't successful earlier. Have
raised v4 for this series now with the binding update.

Thanks,
Sneh

