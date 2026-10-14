Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B28545DB3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988314; cv=none; b=JqtNNV3el0d+iZbDk/bGcQ+YgJNzcQpyBO+Rmfa/PFL3354NAPEDCKpPWcFtn7w3z7WDU7MSZBL2Dml3Ujnb3ZSvD1ykh3zrktrg+AxZZHiW1hMEa0awAteb/CrcwvXeVcrCHOAUk+yWm20vtqXnPQaS4U1Dyg6W1qlabO4lPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988314; c=relaxed/simple;
	bh=VJ6gRZxJ5I417VUJFcUxjTbPRR2s8FVgzR280XCPIzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zzymg21TMbGjcRBdX4gZ67hr8rO5tBJ6sRvojskfW4fXjkb1E17l7AUo3CLI2y10NkjljgvgIehiOIm10+pl6jFchm7IvLvN7la6YI24sNtCaCPJx3viSqUNRiajQK9MzBdmLUGTYLwXMoD3lOpyIO0Ji7qsR6Q7oImSTlVqswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIhC0Cju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USxORKOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIhC0Cju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USxORKOv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR3hY466254
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=; b=aIhC0CjufYqOf4yq
	cDNQm8OrIw+xK6tMPiXbfr6h85/TEamKxR0bOrdAk/DLJ6nxTR/E7ANMCImQn4c8
	dRnhQvd2ML7bM+5TYsS20mo4ncX7d5As9FZ5QSiatcOsIk/36tdXfu5caVnM+ulv
	uiriOKoB/k87VY6wyMvXMGdYsV4bZQ0pJZkyy+yNcKbFpcGD5pZlc7HjIGo6pm4O
	wMZ/d55si51TKkf+y8evvnmdE2XpxPSBTaQAe8opR5rJ5GQb2GQ6vYw0YjAat18f
	VPlqb+J9fycj5mMbEOMjHFMQLfhSrh1+XmAHMx2jTWPjDI5L0jZLBFibAGIk7UVr
	JDULqg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crxcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:31:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so138634e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988310; x=1792593110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=;
        b=USxORKOv5W6HbprefhERVyM96i3sDBnnD9h8fsRinNu4nRZzfDzBv6+yJKk5TvjB0p
         yX2VgQdC6V1/rIg1++ctkBZIOsgRvadlVkSPllTdz9NfLDBOldDRZaEePRAWhUQ/vl2o
         mG9vqYCdFpHjBoCKmPwFG9FliA7ZN2Ol5gU4oERGLRSrLWfqPMrvnLZHfDB3F5wasPvm
         oHSkEJub2tHHGKFvcR77IpsDmvy38Yuzy8IqeF4Pqku1TCDRzHPi1oHkHYfpiiR+L7uJ
         9Sgf81YG062SPIoPW5vGP4vYgQszZFV1IQmaZqrKc91THQPZD2SW9DgjpI6rhFMUAabu
         xGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988310; x=1792593110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouav1jCUIGC1aVQKVliTm9owRud1HmZkT7z54EYBB74=;
        b=dgR5Fn9y+rvhkJ5X7gnESuZzSrXOen3Dzu802Sqrp6Ce4KW9EnFzebeQEkSBOcJVUM
         vadkNL8ZNohxMftaL5Dg7AAwOjqsTCeewBMxk8gwqKzb/7qq759uxCwSIplusGjPfBoC
         kbmCHEq3hoK638uUFrcF5yyl4EFGZspyAgdT6pDUL6IefnFmq2fAlhpZe6Hn1oWCIBoD
         SfYM/MuGv6iEDCJ9TJ+gt5xVPeMY9ncKR1/hgg56YyNXrWVyGVwCrGRMng/G8n1v40d6
         6Whm2XbZH4/YXjRAs/x9O3lkMVTdzvYVYQGG/mt00mi9hg8vopQPDzxelHDi3kqecO9j
         lYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI07/i8mABbbPhgiZc7/E7Nw3qTFahWuU0RExrzkq1mhtQzL7JeyR5r5Za49Ntua3VTTkGAmwdIyd7vQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWiYk+hY9fOkFte9Ec/TuhZvWNJH1jkVLJnVXirxvUdLcJ9xNB
	DT+UYJ980J2jdccxCBt2r48YmGx1aK4fJlUmkSPLjQdgX/VqkFe5QrAbRF8EnkE94BSoBlm8LQy
	z+7WeVnsVxNEXCJUt81/k+VJmEzQZZztsGnMCHJ97QdVnJmyAF3hhGqV2lBfRJfj+pew=
X-Gm-Gg: AYBFou3TN+9FywtKZ+1bGvCB3R7VO3PZPrb8wXlSMAhHtpRpHxtxDP632+ng+59U2xf
	++21kjzioBRyQs0q9ANx1GPRz4ABXgGcz0myLDN0BeTsjLVB/fPuuXEYlYO2797/ucdmPCjziwl
	gn2UuamRxRrI+FK1j7cbXzqRnamL3VLmU3xqyvBubHrq1+0VC4Nut9hZaQT4CFld2Kl/W4XQ1gQ
	K6gKg8D3R9iRTQ/P31eLDPGABZ0+BJGzH6ZBQ8LRUVPcPxQTpp/yYyH199Q0kg5+fM6Cv7/vCNR
	uI8iFn5ffwmu9SDlYvNNh9qk+WydtY1oiSdm5BrS0JDaPXEii+5ulVPRewVbS4TaTwkGSY1HJUV
	fjJQUpAJ5epAPcKVAUayVcQ==
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3173579e0c.5.1791988310137;
        Wed, 14 Oct 2026 07:31:50 -0700 (PDT)
X-Received: by 2002:a05:6123:5c4:10b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5e91f52a44bmr3173534e0c.5.1791988309635;
        Wed, 14 Oct 2026 07:31:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm709600266b.87.2026.10.14.07.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:31:48 -0700 (PDT)
Message-ID: <f8f161d1-be35-4fb7-8dee-8bda3a231438@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan.gerhold@linaro.org
References: <20261001181055.9149-1-daniel.lezcano@oss.qualcomm.com>
 <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46ba46c8-c84e-44d9-8729-9298867b19fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6J1anpzl0vJC
 mJVVfXac/x/X/vBSi97GP/5RqwVefEiQx4nro5iod9u88MokfnTROA4298EPyxEhp5dUCH2Pap8
 bfEaaQGP47bCwOhjRn/P/ZLw1EhqJLk=
X-Proofpoint-GUID: jr8HsVUr1TU7RiPcI8gqET0d-LqWF2jG
X-Proofpoint-ORIG-GUID: jr8HsVUr1TU7RiPcI8gqET0d-LqWF2jG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX4O2thFAKvPWL
 T5mDn/9DgBTitxHi1SWYehlXdSD2ppGEj1GQFLuCWpVeunY0mK9W1p45uNWyKjlg+KQ7cldHGZe
 Onnb0JV94e+Uc9d/EmzTlYvDX9rqkCeVl0Bb1EhYXk247lKMmgKgPaw/U9G8ner8+pgJJpd4j8p
 1y6Oq2tB4/c4EX3m6oNMrm5NOaj9Typli1hvBiia6c3m6W24IFHcJvc9BaLVoeyKxrgsC404o6x
 VhxZACBWPa+L9+itIYn8xKOYHiXnkNZ1+nKoXiO/VraXGYjwrzU+z89LZYlQamnGG9y2kvRu5Iw
 1e5CoAZFTEh+oRqZa8l3R+2vSK/+8OisSwchSQbN9kmp2WPzzcabwu9aJQYMfia+dvD4jPKRxMP
 CAPW0p+0qndeJcdrKBiFeLADjfWTxgXa0QB9JAi+81yILzmLjhmPqfpJaQqpyPG1D2UeUmaIW6x
 WnNqREAdTKqYW1dgmVQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf9256 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=n4yv8perxTnihnHdoW0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On 10/14/26 4:16 PM, Hans de Goede wrote:
> Hi,

[...]

>> +	thermal-zones {
> 
> I believe all nodes should be shorted by label, then name which is why
> the first node before this was "wcd938x: audio-codec" since "audio-codec"
> starts with an a.
> 
> So this should be at the end of the global nodes.

By the node name

FWIW:

label: node-name@unit-address {
	property = value
};

Konrad
