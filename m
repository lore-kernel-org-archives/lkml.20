Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626806;
	b=xaE3b93iqQ2nzmNoHko16YETXMrbobplRnHzn/6lBabyYP+zb9lezV1s4D/XN+StqfyM
	 omf/2nG+Rg3YuabtNDHsAm0fh40N8cOARxMAtGXmf/ZGWHi8QOxi5wdDjJ+OAsFOVIfkF
	 QRXB2kGNhqv4MH120aOutzi/uUfVK5GWx7Ip1FqRQCaJgKAY1x2LGRH1ZvwG+K12hSuyU
	 VTTSVUJjUL0Z6iocXaA1zNvbLN7/Uf2l9L3CTFTOOfgkIQAtPG5v+GCfJ4J81s18zdo7C
	 wfacCzDhJ+mWccHIAF7UhF/xsr2UJK+gbreClSIISp4Suf9l5m3rHCduOijtnWg+n5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
	b=g3sDdQtQ19ZIhI+4y+g9Q7y8III58b1RcfH41sh88G50QH6sssAjVUwoJb65b0FBxx/n
	 usXW19hHr5F76TIhXN6CEHGj0G+XuiKvzBI+D+YlqbRZ5qd5sA7IJs5GrOZrl5PepL+18
	 QR7e6rA022X2kQQRf534bbuC1i5mVlVcyTlWJ6o3/nS6GAtPsXN1liDzFYOSKnD/eAksx
	 tZXEkH/BONwNigN0npj1NDIvd5VzT9alMWjjulbeJMgQD4u4mzpWm/ESZgaelGJ1FlVbE
	 jqM2dpzd+CoaPgu9lIFrspo94QfwLqqMGqVkAWbCSVBLZLgSDjD00ZlVD1bLwYGOjqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4Lun64;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViE3HMoE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB24606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB24606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4Lun64;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViE3HMoE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAlke2360274
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=; b=jj4Lun64U9km35pu
	uaAExj3y1GIIgJvsuM0V/FvV6FPoGuh1MaQN17vZILYbvJYR8gI3e3Vav9C6Ai1K
	IwrRijwwSjY92Yua0V6BsvHJXuYPGnPqz1OoG5dk2VGtYzhu8ty8oc+6qLoxRAX3
	Ne4fwOLujSkNlghItLg+qGbBseq4JLREuV303/9+Ps6WmiH3wq177i0fJmZtUdz4
	AgBcVODEqS9kk+sL/+T6Oe9VnfeO+JBjsfTWb+u6E2gz9KSk0ShtZp9cA4vPFbqO
	B01WadFAeHb/9c8QLnQlXmeyQCtu+DaQDo15xYRxuWcc3yFQEjvytORcaqq583Go
	wI/mvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hw5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:40:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9441113670dso704691585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626804; x=1794231604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
        b=ViE3HMoE8Lq+BN46kGfNy6dfvxwSLjmt48ktgwyKWnkTFIaupGVN0WujJjIoRTZufE
         TJPokCaPwL+7z8B1PHIeB/hmS5I27svGbry0zfFD03q+IS+QaCRYPoJb2cpgPdU329Yw
         V4El7k2RyOGqLe3vpjepFQGKb4WKI/Imjxd1rIILM5A6B2NypWHhUbzHPaT5cm/gkcLQ
         JqhH91mFhTXw4ZiML7FGrYxDmavih4EBvgWglia7EWd6ArgwQGpc0+IXJylwoSdaYYHt
         /JMaldB3aAiIagneOwMmEVtqyTTTj2wOQR16CT/Hg3FFoLpuhp+jZq3Uu7UeeGILNyrp
         eJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626804; x=1794231604;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
        b=g6y5b4gI8FITnqcOxtAFusaH9inp/b/mM9QRrhOwa+j1vdKbvbb7UU2Jz4f9pefYGM
         HmXKwgsxpZ+MB9W6MVNpxc5eTTXHMjNsiMbCIAq5FNiceYWDMRLQbN/bqV8OH1mJX6r7
         +wvEq6L1OhpHuQW//TyauV69x/rOO0OL/x347mlLZeUVa2zbp5zoef9X5wAm5yhadOIo
         xccD4MIYQWydiap2IxFO12r9IzjVcW+r+p04+0tKgl6d/mQtD71a9B1zOXg8z28wCOLv
         3WsTvDwS0Qv4KSJeZqCYhh7vjG3rg/6TkqByv7re+mzeFZHTSN5JJzFRtSbE+NFN/sOz
         AKqA==
X-Forwarded-Encrypted: i=1; AKwUvBwffHOsoNINCMYa4Qid5Qs7ZPYgxu1Kv8ASM12vc3AXqxY8+sDqNTj0OqmSZyW66HBmXsjxK4940cHi+94=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Pje5QzMr8IlSr/iQJjXjZffed4b4rYtYheG1sIlqloa972Ae
	YbxNt1r9d0WBv3I474XXvaQJTI3/URZzG7HUFp/aQ+Y/Byo/mRyYXWlStIHLJvy/pBkruNHj+OE
	4miiusbVSSqDuZ3fdKaRWiGVfzr5u7MbtbAost4ePkINEz+nXeCNd2yn4Zy6kOXbJ9DA=
X-Gm-Gg: AYBFou1RQn+7ukmZxxNiocTRMZE+NUnEKPRvPdGFDrN1kLZGfxTLaGRJF85f1WU2Xu2
	AMSCIXO8zaJOM12Q8ihqiZOvrPBswlK0ZgetCIhLrzyTAJlXHuNEKzsN0TkXpAzoOwuB/l0q/cQ
	pYNq4/UzQyjDs8ifxyJAIMGeCIY0DFtIS0wGBSVsRoH+iD5tTppOCipxkM/exTdBxFprkZkUiSG
	VtdcKTP3O9jLYkhSwU8gWUkqqz2y2Oll6Hxi7LSDDHPVVjrq4Z/RRuQUvJ/yAWf+FQxP2iLLqYl
	PHboMvd1JDlJhu6OxbPFn3j00Zgzw4wHXxdzQ75arHHEk0UV1r5o+oixqnS/SDJ4EXgxQbyxMnu
	h4GUxyr/gPXNdUMYlP4OowwN2mF4euQ/szkp8Vq82NXYHFQDxePGh4LH2YljgvxDLvEBOI2GQIA
	==
X-Received: by 2002:a05:620a:2614:b0:93f:baf:279e with SMTP id af79cd13be357-94421588032mr1733672085a.8.1793626804285;
        Mon, 02 Nov 2026 05:40:04 -0800 (PST)
X-Received: by 2002:a05:620a:2614:b0:93f:baf:279e with SMTP id af79cd13be357-94421588032mr1733667385a.8.1793626803802;
        Mon, 02 Nov 2026 05:40:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm266325425e9.9.2026.11.02.05.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:40:02 -0800 (PST)
Message-ID: <03698f9f-2e70-4e64-8290-84315e54a5e3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:40:00 +0100
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
Subject: Re: [PATCH v2 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read
 with too many inbound entries
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261102133531.173434-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102133531.173434-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y94Ea6UV2nRd2yAZwFK-Q9KyK1JSvdjv
X-Proofpoint-GUID: Y94Ea6UV2nRd2yAZwFK-Q9KyK1JSvdjv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX34SGfrryQG6i
 lyWMGc9mabaqMazFebqNz+VyLYSI6E1FBXzQXogP9OypgnH/BXnt/VDxGf4y3QrHEdn1CfY00gc
 bl1rK9y4k3ZaMoVu03xV3ZpVaxAcvJw=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae892b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UsLgiRDap3Yzww6lrMkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX4N21JAGd/VEA
 MkslHYJCtgJgyU+T8kUXULg4I3E6cHS9DBJQ3QLOsX/l0Kl6inOc2pVEeZtqJtZcX0eLaZ2EFJ/
 BhWMCte/UhsAr431LI7LufKAFziP7P/5bIdJO0VifU1KoB7DlYJyqA1tytwIkFZOgidUBEymTDo
 mNVhQkRHIdtTnQwW+DYftHXQjubWpT4FvS4W5mMWdoTihsB7JVIa1qxn2c7Ek3tQKzve4MZhiJy
 Bj4NV0u3O8PZgCASgjdfYKO8Fk9QMJxJbgcWbV3Ynaa5enID45DWaLkDj0tbHGuilvofpcztuJe
 cEmfoGN6sPcJNZfJxa4wVm9zWsDxdyX+Fi/0+kAL4OWF9Yl3OvfkPut0bFEAA/L1pYh2jmqGt1W
 xMzRF7a+rXg8mAXUQlOyYwS/1I3FfswJTkuHJfQ6aln0QBLnaWVkAql1ZuohG4qYPkD9OWPXA3y
 1DyY9cphtaK+QPEziZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 02/11/2026 14:35, Krzysztof Kozlowski wrote:
> The inbound SMEM item is populated by the remote processor, so its
> contents, including number of entries, should be validated by the
> kernel.  Number of inbound entries is directly used when iterating over
> inbound data structure, so if it is higher than actual count of elements
> in the data, kernel would read memory out-of-bounds.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
> Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I forgot:
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Best regards,
Krzysztof
