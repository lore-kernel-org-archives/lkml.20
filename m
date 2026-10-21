Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554105;
	b=O9Nuo2oZ1kTaprEjL4u3g1JIoQbnxn2jOCnB11brUIWnIIjlEpEk05Ok6m5pCrWGd0L+
	 BEaPmNXLPpjNTi2GgqfWDfLPJQyIRIl/IN+jCLKg5UJVgOE+wzh6ckR6whyaMqBQrJjoo
	 eMhTGUvrnzBzkdKQW945aNA0tHqDWmB1bZ3Imec5T9SZLXW2yxpsFObMvvuz+blSWs++C
	 /zjARCW5hHJCCJocUFfdc2VJO0eJZ/yzAFgcgMXwXr8lwzTSgBdZId7YeJGFcqwGJUAL3
	 7G/XHQ5It1AgC0MdNgmzZDH2/ObxloanrW3MSI7RJglZCN+fzyAItS+NWJqXtkV7y5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
	b=3taDvmoTNe/ItcnPnkHCSDQtOkg+45Rf6OrF/zQigAmvTzmxS/iZIXkNF5SWu8jSbln0
	 dSRO9LtJFGoKEZA73ESXIxnSOrf63lW6pHVrLFuyfYx2dsxRYNfnlwf3rGmjXwCKjt9we
	 YEcexNowJfLL2oLYWHOoUsidMQ5QqIzsL6x1sX3qD/qB1YohQkAwFg8zZcmdSPvsz2neE
	 vfz5O/I3rU0LQbQzHzE+ByGT2Huvilxalce5ydkfnyBKEjYMYZTu6SSZODKzpYl16cW80
	 OifKywS2h+df4njnVPW8amWzcjlehRh5jaUdJR8U5biwiWm+NEYBmx1ueQJfYEG1CRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347ED606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F46g2391346
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=; b=Vssd5sIIrq4j8ts2
	ijkmHc7MV0i+ppTspuxGSeXl/ZH9hsFZ3HwCKL8402xJXkPgW6jllrGqbPa+afbk
	/1usO2KZxw7ZWF+UhVts1cQ26Ewagw09xYtYXjCzXlqmrGho52GS/vTIbsNzRAiV
	ozBsNyW2T2N9qOI+UYJTUI8FToxlgY/go1Kt9EENR2IGrhWyBfpOOxwzD+IDxq4x
	Lbo86PHKV6K8irh+5hYZkARRqsJZCZq3q7Jfhg9XWEB3M5AEdkcXwvPk/GlnFxLO
	Bm8tqNtDX26AcZBX71YpEXDMWpoiYC5/HJ4k2VaifOuloot+pspHckXLJzMN7sfp
	qIaVgA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99kgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:41:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so471929eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792554098; x=1793158898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=CcJeIcHcG7oDszfV09U574nRRY69IX5wtr1qG2u+A+7FlbMujc4wDKqWUoarzUO5D6
         FgIaA9TbK32E10WfJH0F78ozHHTDZC9J1fKS3bQiy73JaLCPrOqvS4TOXoj+aUxw7lwu
         iiFTrJRdvD491zUlPKBlNTPDPI6cI+7P++l/uDLhCZHx+NcCPmP/CVFg/9G6KSJS+Ba7
         DS5mSgVohhQdWUhoPJpqyXwgPoBpWN3vRnz8Cq1kCfyF7r87EzoMlw7S5jW1vwuEYfl0
         u++FlsP4Y2V2tDPUEukjwmuii8ah38So+lB8veCXiDVMUibG+r1xEqllGX3opWM/V6dD
         s/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554098; x=1793158898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=pDt/iIicqKjksdUQKOLo8bYahn9H9GTjWt9auwR+gWPr5fP8dyelHVPacF4HJ7HWiG
         7BbWhNA43a6Cow/z0dl2ChU+pGw6zbhM6sDZU0gsfNLi0SYm84rtXs6r1b/rSK3bJn6H
         6xtoPlNezja203swbmEtcD1ZJpC/paJHLQUd2YN9YFmAUpIUR6mQ2WiSpQUUD8hz0J45
         0sQqWSEnyVeLj7QlVV6IYwsp2RwzfyxrQ6Qcp6487Npd+2qrESGew+oO1D99AsmFu0FR
         xYqf6xc8bu5sAepugI5vt2Vqjs3C5WrTFP79JXiI+3PU5YsMKo3s+aIP3POtST04bCzz
         OyLA==
X-Forwarded-Encrypted: i=1; AKwUvByu257wrr3cqTvBWJt2oHiIlj48QqOPHRskg8O8pQuVFYm/fqA7oyRnOBXUb35or7nEakrBMOR1ilFoDcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ8fqfJhvg1FMYGrYE9iwuHLi5ltCfCaOwCRWMPmN/x9kXd2wP
	2cgq6zVhDLGP8/S47+itxbx/gQ/ecj6OBUPcKjuxaBla6JsIyNr29CaKTMuiGHr05qGqD6s6hch
	YkgfW0qlqT+yuBHP2VjWObO3v0j7RX1q+Xj3DtnKR13z34ExX2h7CQGi7w9cq12a0sMI=
X-Gm-Gg: AYBFou3kOkX+nd3YgnwBHWtFpMHkkMUn1u93ppxnFFMbwZWn6H70tEmdsgf4CJp+m98
	TI5jMhO2kl8oglz9vttvag8iZpxJg9yxgIk6aYK7f6bYc7zls3S5lh2luwEvpTky+zKtNs9ll1G
	plZWVsGkyhCYDFK6ZLcDa0+zLCQwF8U657oacjrcjwxiY4HqqQazo71S3gm2Lrua/xZT/n/7TS2
	nUc0EJWtaeqPc9LrH5pn7H+1KUlYmo/3JHYirJh/0FDiArsL4vjzkDNQlzc0BLt86xnbtgF4Xq9
	eyJEuxp23UoEozJiNY+LXTRgleMR1iGjtlw9K2g58evG0yEaWs4elmB5aaCsrf4bnJ3obUmmitF
	IXZfWaCail+9kDs0v1PjgsoVMFPZLgA==
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236456c88.42.1792554097919;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236425c88.42.1792554097382;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm3336442eec.11.2026.10.20.20.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:41:36 -0700 (PDT)
Message-ID: <92c02649-454e-4b68-a9a8-2371f8a6e5da@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:11:28 +0530
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
 <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
 <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX4SqL1H9ewRta
 fcutWBVqTPXTRFpRI+feFXFBNhi59a51jork+KPmcoaub9hc2wz+3P1tlEyV0biZdB+zbr/WbDL
 dEPqrNpl16fnW7nY3Yd4KF42v8jEluU=
X-Proofpoint-GUID: G9FCoGacyu3Fz7wvVfYFkx4b1HlghfYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX9xFcMCCRRXcD
 pyiDc10jGn8bLXLIvXkWP3usrUfjeIODduMO+pkTEAaLt14GOt3tY21K+Zlr5cHovuTlgehinZX
 6xcQUrTTZ5EDnBDx86AjbuO+wNAi7+Wq0kg4CbjKnluieeiEfzqxmZgsoV1UrbfU2fZwS2D/WL6
 HJ/xrmE2q4WjfvCCN9ZYpY/UYM2Amuwb1vfWd1W9Ccwnm2p/LlehwADt2QfxTHadhZdYHetZVal
 PNUkrTMxkfV/owiUb4CupobuJVVK7AwbH8GRJPql7LjoGVnIFK85FvHUMtdWBSXhtqjrdaTnE6k
 wEYFY/XHx1+59O4oNMBTDKunWwHmPZZ89JyVLneTRqJnscfprBxVLfp7sGM1Qb+dh3YQQ2iPSPr
 HyutYBC/JQTVeOzauD8H6OfirDLBbtsOE1srcJ5D10GY2BmzsaG0gqprBgSw7sN18E2wNROsocI
 O22QlKNjaFQm3aUo39w==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad83472 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=TgBa4wLDfMOKYiLJ7W0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: G9FCoGacyu3Fz7wvVfYFkx4b1HlghfYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210013



On 20-10-2026 11:24, Krzysztof Kozlowski wrote:
>> Krzysztof, should the binding example mirror the SoC bus address/size cell
> Why are you suggesting in review something which maintainers never
> suggested? Or actually opposite to what some maintainers were suggesting
> before. Code has correct example.
Understood. Thanks for the clarification.

-- 
Regards,
Nihal Kumar Gupta

