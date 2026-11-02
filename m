Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631671;
	b=jPOLTUayfg2iigGoJpRBD4SgqglvkFyIUGQly9BCrHLykTZ3kV60sXTDpBw300Pq/Sl+
	 UCZcb8yWRS7HJOxADNbnmNSKs73y9WNgXgLrC+b3KyWK9qzsk+ZqXHDDD2OkIrQ0cyNFc
	 SSc4lbNOz9JwTgx5h14CX2xpWzl4eE8PBmIs4PYeGmkq0NmWCRyWdkvkQP7/1Eo3T9bB6
	 qCh39tlqPPprBdUgsAQZ5+XTdIra/AlvJ/pQt4/TbND3bZWSgmTFI2xnQzmh7e/qA579D
	 mSoPkI6eTtcis8/phUfvUPPgAvIOexL4m/umr2ChsPSDlXcQfeY4erSt5iyM+8Kqdug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
	b=f0T6/wGMLNt6iz+qVhAggKuUXX2cYOEuT7oCz4P77J9a47aMBD/BezlGp40x9Ei1a0Ei
	 /PY2GeKbHta7Xpgex+O9lGff2iIXtx15lnFnkJwLM0Z+95cCp/wWnvq24iMJH+hJUYXWT
	 KTA8qOCz17iMH6yQpvXZY7eoDzy55lKtpTzA8ma2ZrhXPHV524XTwyoFgJYLRTL8/BodF
	 kyjBVbIFux5u++QObquQLeq0+O9fKqiS1h9vPT95icrXN4RhpIY3cJrvIBvFcwhg4T99K
	 CvvXZLf/2EX4ZHKhELftWGR+YL3iq78hEhrvIhWwZ2E7HmGlDd11MHpA+w3GvUOcyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YxM/a2GI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Mr/ylzXN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9245607F11F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9245607F11F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxM/a2GI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mr/ylzXN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp5h5894074
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=; b=YxM/a2GIs/doYuxY
	9s/3rlQo3QvRMfIZgFux2lufmjx/sz809/lQTjbejlauYOmewYUvEEFr10MEp4hn
	1LfGZLRMWrbMeDoTyQPElGaQ9kNWTSXvvaFu6cX0Xkk3TXuIzrfpQmNscMDzsa/l
	J9bOknL4EvV18r+f8ViJEFcMbcTkcytuPdOxYMseWDftiPvvwunIQJXlOBf/8U2D
	WDkN7m2/T4Yw30EUQ4lMlKm6NJCZlT7u0YZVQm6El6N8S2xP6sfuhmfY+wWM+mJS
	Wxe/gM1dZKZrzOPKlNKpHDhY54VuUO5kv3cosfxswUH7PLyi3TaUxMRzo04qSj9/
	djKkUA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsbsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:01:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac78dbbe7so68449e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631669; x=1794236469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=Mr/ylzXNgz1Mzjt7qZwbGrilQCNE3766w1B0RENkPY+vT+krL7Xx/TWue0at7nsrGX
         7JIQAxLzOC7c1AGfBsilCypzZTW2FDtgLY//c9lxFkEQroZ+87zEUgptuGAP2ncHVjl/
         JFujXZVFnQGZi6DxM+cGBXAzwDaiwapf5W8OBk7vuDGlvJpi/AV7o1MkWBQbuXzmYmPW
         9iadOmmyulzUc2L3B3alJhTNPitXUvrLS7gEX0BcG9BUDmfggiuAysW+663d2yuhAiDu
         6YBLVelmBgP6yecqxbhYKeUEKHTya0nAJHIKeWNJYAjKCgIaCCFkHIz9airVt45kcWek
         /RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631669; x=1794236469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=qqufnk6nW3WlaBIfCMC1PsBHc+7bahBTI8KbReUs/s0P0cvuKoab4+8pPSAIVz3pqf
         2dw1A8ov/4DGpYLBQ/OCFjiCHA2ll0n8FBbSClVEJ52c3dEmT/P6wZ0G1Gg1j+Bf4nsZ
         GwYHKaIFAyofPENxeOyIh9c4kiIXqnneBR+IuTEXssk2j1tLNOiDPPDyZJr0hsaeW9vk
         OyZujP7HAJNJ8iopNdzR7BS2RCBTxKv8uRWIYAfBH0JRPLYMyMhVFvnbVMB3IqnBUZ2C
         dmGhvxfquuwpzohoKym9U2rbUvuNGxHyGMo4+tJeSMxnZ1JV0IWZx7ZWLIMHZVwzrTND
         PSlw==
X-Forwarded-Encrypted: i=1; AKwUvBzIfoaNK/xcQ2ueISXx6ZdPaQc7WY82zyq4DXo7r4UZKgb7o6RvS4AQ6ILChZg5uQ2iEWGr1psGFIwbIuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cfMLs2IfIcqePfoq7TTgACG7lgD+LHm0Wu/nSEftVgdLWCeKl
	8Oog5rI5yaPV2gkETuRc+kkKqN2VHJabGJBWQo5X1JyN/LI5IPqjhLNr1A1b1eEnKulwUByx5H3
	SF1KkSk3M2BLbKfccEhn7VykFSoU37rqzCXyLUCd/AIhpVODX9S03OfqstLM4M+eha8Y=
X-Gm-Gg: AYBFou3zU4wlXpiwQ5bAFDFIDcCNRVDMzz9jN5CfYK6h6jOljX4nuHvCy3cqWS+vzsE
	mV79LaeEkK0BvSyuYtgQP98MKcr4C7OBHCf1UATDdfVSvi9xaFV6nu5Ja8k8lDDpKJ2yBpNnoTY
	V0jpdatlcOA4ULOAzm2XiI4GStyYpnA4V4PrHlqwUUKXQUQAaQvckBVWcQExjZ+qWJ4i53zn7KV
	Gg1d5pXnBv9AHPD3Fbr42ILDkCG0/aMCfc1O7WZSqngWK6tZAwM5LDCDWDouSE7PaBSL+VRttns
	H9lkLMZbg6p5foYZm5pp/81aZQaCcYSaNiN3uaXo8pMI0Gbe3qJNXwzUJ7KVeGREiSm3kNZBjxA
	Jd5L3g8Kj7LoLE4+mrlUa10wfn6rdoyYcZN0b8kxKN7RodeGVcAT5y3VCsm7IV9rdzWZ3CA==
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312311e0c.4.1793631668841;
        Mon, 02 Nov 2026 07:01:08 -0800 (PST)
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312211e0c.4.1793631667906;
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm403326766b.53.2026.11.02.07.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Message-ID: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:01:03 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8a5b6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P02pymlBJQeI0XzeDM4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: _FMmBg7CK-SxI_oVS7Ng_oBuEMNO3_ey
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX1JCBWBn7qi0A
 KRoGtFXukAKfM/7tDqUgyOK1j2Jptl2dA+qXCQX7g8fBdRXjk5GlWdE5d4K4M3gQQEFyqyPG0m+
 7deLIc7C9vpM2dHEfbbHd2RAX/0u0q4=
X-Proofpoint-ORIG-GUID: _FMmBg7CK-SxI_oVS7Ng_oBuEMNO3_ey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXzyqXpySjppqE
 RE1rVyAio4QmMH254I1vCXcHhAtPqBYC5Wr9biHt5Vz9oL+w8BgvmIpVpz+TiA7WW16JMv/E+e2
 bUdq30uB5cvByQVlgI7LbanFEJSu5vFJ5ckDPsCoxuMdG/KhxD1/SGlYcqBvA0Ldiy9+2vch2VJ
 DH4EA7r4Ee1756UTfb5MIdpoFJ+OfSC4FtnreAjVdotf+WTI1TiEx/Z9h0Yk0pCCbqC0g60XIcg
 ukGIPl/FCVnDsOUCA8CJteqDLfQyDl+LrURZjV6pf3OvGcjtSnAWdnwI0Om+hRtJlM9dkruVDdQ
 p000/anjz3QmCnQuoYH0JgPv4m/4dCPCwSuZqfaN7O7kysbebrN7xywHT3k01fAlg3ldYH/CZxg
 D2NzQPCyZWAbQJndLxfsI/cKbyc2j8C8DioO+94syn4xgTtlXw+s6kJP42bRahC/ZUBpusBIkIY
 Gx4BflpFNN1msl9OhUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	phys = <&serdes0>;
> +	phy-names = "serdes";

I believe this holds for both GearVM and embedded, so you can move
it to the common DTSI

Konrad
