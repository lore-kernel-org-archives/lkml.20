Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E851A9F91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770984; cv=none; b=p+hveHl29CfRDhIqDNQm+Mb8xkvT7VTXNDRshJo6N4yD1WI/3BEVIqp2OVn2QunnvYDEpGmVJz3+yvHik4R+hfQf/eEa+BOj9PT71MoDOaR1rE8Uxc0G+okrCm7AtkEOc4HUJyAJkluRcUTS7rxxqnAW/k1YtWqTFK3w1gn7MVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770984; c=relaxed/simple;
	bh=h1ZxY7NuC/gJ03hkK3sWX06TOA+MMyhk04o6T3KIqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u38OxPMowvAS/BWCk+VNjbbhPMqyvWTrxU59pPeAHT2Q9k9YqPuWaGxY/GFkcHApnX4mut0hV4/CwtF6GUAXUVABGvnJBImaV/1RB0Z+BhR1v1RFevcI1b3tC0sudQ+qSXzCTYF6dmfJf31/q9IfMPJdUajcr7N0eewTYELAvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evfmqC17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3iKa2zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evfmqC17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3iKa2zz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777OB93363569
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=; b=evfmqC17XpzGLbM4
	sPDPfDx4diDv6dIuS6l0nmCEwBIVbht9FIoPq85b8TROytwgw4oGSxhi4epVXSZH
	h5oCWUxLy28y9A+FzQ4iuetLA0LC9b79evd6yrsYDaaMnyG6OudrnBkd4KIXjl5c
	FRqSrM5bctRP+G6WZEvGAqDOJi0xtH9w7q8HVJ3iMxuHlAILXTvefKQGiBYaUz5o
	W9oxa0IsnsTH6dVkWvfEE9T6JxnFMY+WrtYc9BWKsZ1l3GlOoES8raOTWcGDzziq
	KrYHwWTO+GtX/1rEJawyIJDWGGwbH3GvmMxLjuTViSUzFGsr6WUEb67XLj0STCgL
	fXmu0w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj14g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:49:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so7802946d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770982; x=1789375782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=Z3iKa2zzs5w+AiZjGMIuIBBz+9IbEpGq9fNhlCwGZJjUyJPHRlFHYnhNFLzWbvnFWe
         Hq0W51TVTM/G0gKapJV++fzoJNvFUQnAbBSfIHtgjlOat+EhGy4EtmqiFP268BST8WKy
         X0KiULalGqv2dNkXJ4z9e5t6D/qGlhD/uvxwK8umCidF9Pcqn0R97LxmVpFbzZUSVyqU
         /IC68JUorhOC4vo0EKVgW8TH6q+zPcoVN7HmOrkPhqvy8zxdqy6hNBtpqJdOXuj9wMI/
         pIOuFqQbryqBR9c73qIfmggbPsKkrzxOnC066CjVzxZ5nSDGDvHxflihGXSkTuXjNgpW
         cBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770982; x=1789375782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgvH++j/Y6LqT6iaClP8nDLZ/ECwoa0TBh0Bvtxg4MM=;
        b=f6o9k+vKSOaiYF68fbTzywXEx/yG8x2iftaOHnyf/Wsx+AGjJ53KGxsp1BMJrISKgl
         0AIs2UPrNUE+OiiG0BQf4t7PENK85mV7sMAbrJWEfGimbSE4pGHjruk/h5sB+81jqyEl
         LKtdQH9zu5kgV0tIWtbEmmJ3gAXkt5OnjBbCTx3n4cASZ8rjsz6yzTg6hKht+i1Hd+4E
         IOJeINlzBx2y38y9mQ4psAKPyjfZ69pIBQVk60/99EqbHuvrC1L8Jsq8+kHtwPdmdLKh
         1NcIf1lrD3aA6U7v63BmVQuea2UkjrhnvBwlcBNMWlhPgOjUv+gzRxC2VMlHyyk+3eyz
         VtHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrPPa77L7vfREuP4TrjHzWXFD0nRlXHPvHVaIdlsWF4obKQxN8jVcwdqbTr4NU5vBXc6Nzs9rvDXcN+YM=@vger.kernel.org
X-Gm-Message-State: AFuF++kSe8fnfochl+61rAYAN5DQTn0I+pgrZ6ieb7fYFOGzVjRuql4B
	odr5GDvYfJBDhsBO+kNiCyZVzeFLL2HMfni4m3gXJilQBU8cUZpy34pEjCrywZ7N18bF8T8+23j
	5850/mwi+4TNdq+D8teb+6PLi+OxFxTryQM9azYsNe6t8MCO1IZiIaki3KGxADWypXoA=
X-Gm-Gg: AYBFou30Se+7gphcLiyci+NbuH2i0G+kdtp4HNkHqOIeioBp20oVE/wKoLor4mRPR05
	mjRE9AWmuycKnX2PL4YFVqiJcbIceUASkm2e1PN5TsXCaAWfHMgLMUGOnvYErzjF6BvlQnOMyQZ
	uDRJbTl9opYLeIQlylCp8hH+XiWr3omIvtUki63XYq0qNmJgpPScZa6CgtDDojCG+dcu12Np5Ra
	AYDhPRVBJwiFrUaV2EmXPOVCbXZYkQhDVT1Rg20mTwBgP/K2b92QA0qaqp4KN8EtAP5qKDbBZPX
	rs+ud9cIG5J3XAA6kr+CBgEKvOYIhehH9PsV1nkOtXadxB7yzlzDsqP0KO/JUXdxMZ+/qHI55FW
	TLo5YSyBx9XztD+blQqWLYA==
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089815085a.2.1788770982114;
        Mon, 07 Sep 2026 01:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1089813785a.2.1788770981637;
        Mon, 07 Sep 2026 01:49:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm372159666b.4.2026.09.07.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:40 -0700 (PDT)
Message-ID: <9cae2950-43b0-44fd-a24d-a1044eb733e8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: ideacentre-mini: Build the Hamoa
 EL2 DTB
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-4-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX/TSscZbAqaoR
 fioZp8ZIBMHLYeb6jq6BJwcOF8JuTxvY1uiOT+oB2UmkNx+mMC63hZtvHuB+u9zB5/IYn915fxC
 SCZzubKb/MqMf4L/Ths1OPuChrKWrwwW+r5TlUanOnEZ9Qpgc55GRD0utZGPY835QhD9DpN4WFO
 7alGPi2tUvKnVIS7nOsiyfRqAv35+VslOyZGB5ktrNVzzk56SxJTFZHCY5EyyQ6xjnEvoU1owcK
 1zVuEUBb6Dc2Wy0Ojk2dpsWpAF3AhBkGyxpw28UmWORFCBG1MOSgWHXuChSBdGjn/0bxpz68OvD
 32JhB1rkXnZ4+bezpo5WT9wYB2Xgm7H7qbKzPWaGrnCnmRljec04z3xKttl7xh26nVcI8Gn1wj+
 Hoz1upP3qsA/6Ac948nqkfYJDmb/dHbss1sTohim6uSHDz4WauG6u8uhpzj51+Gp0OlWdPYlFfP
 FxahRufys5bbpy84F+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX4x3sFVhdwxiS
 y1tIpY/pzKECTdKcX3ciKYdavzvh+8qL4ZSDx3oIc2shMi8OozLpxR4S/81d75R/giZtozdhFSc
 BZM8TUwuwykxP+J1/Y6hVExiP1qukw0=
X-Proofpoint-ORIG-GUID: ex3FXz_owZte13rDUyI21n0J2ITH3wlI
X-Proofpoint-GUID: ex3FXz_owZte13rDUyI21n0J2ITH3wlI
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e7aa7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=VAHzJ8QwipbKsDwnUKQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Other Hamoa boards combine the board DTB with x1-el2.dtbo. Do the same
> for the IdeaCentre Mini so the EL2 overlay is produced alongside the
> normal image.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
