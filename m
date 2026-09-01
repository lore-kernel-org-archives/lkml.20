Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869932D9ECA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251678; cv=none; b=Nsh6vWKxd4YutBLYQSGfFBoZKr1meIPcO5u799uSBMmvuji1KWWwrJdfoFxEh+k/Xg/9+L14qdjFColSKkv3852VCW8INIW1jY5gkTPDXOuBGaa9ut9BOJRrEhg9h2kJrZp5Nq1Le/jbclw5gfMlctCSaEBvhxzeNc4lXu9dvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251678; c=relaxed/simple;
	bh=+2D/ucg0xsdoUCrlgOH62aNlq5NomRTOZrwN7SeHwgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFbzLooDEqJ5WiIYxglKPqO39/W2j9zR+/VYe8OSxItFTdqf8LmY0k7TXGmZUmFYsUswgMv7g/4yNplOeDjFGMh9e+yJWgVRFnuRICSlsG2zUeqenvQk5xqvnICOShknTEcn9Sv+dRKPkG088fBcj/VafDSXfLKH7jdNAVwDv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E77LP+lI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWYfa0RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E77LP+lI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWYfa0RH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179KWC2061945
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=; b=E77LP+lIGiO9Nxcv
	jY9dmnpHRg5VHoBBHUjxhZxQikjYXwC/sn/0SzMWYRW+xKtmm/U0r/S3obz6UAkJ
	i6BrzJRWiEDmjSZj7wdZANuwEnSz/ZbF2sHrC15NohXSGumSMxBkf3sow0ZCj/nH
	q1x/4Bkez10x/Cr8HGoNkKT0NNqAWo7AuIhyx3bnRjGddBOrHMj58m/z9pObZakI
	4e9dIN9JE/JR5lfPfSif2tISJuxZoHIj4myu0Ii0VbtkKxKb/5Ubhyh313Agsc3U
	IbjmzFCEpkUXWHxL/iKOJ634WCJ/C7WugpK0LxA0qQC2FIqDmlKmZ4sD5tgQDPgH
	5prxCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh12ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:34:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso89046385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788251675; x=1788856475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=DWYfa0RHjccGdOSmmLwmqHt5fEqcnOx4cPR1OF1JHJw367NHjNdMM/EReWXDJVaQZe
         71xOQnNWck3fTF/tbWefZvj0e08jCWh4bJ3+Zw6IAhAl+EVNkkVRqiFk4wLMgih+cMXo
         /aBgUrdLYEDJg7TMPWAmoeKzOtoD/sc5ATrVt/uEBykgQbllEwu/Egn5hU4cZlO9l0L/
         JlUNL+60F52JemQLZbOjQ7M0gC9SsxDm55k7CR9/zhJNGLLKDBasrk7wu5yNYjihYuhU
         R3/pSfXeYpqEODfsOfqSZf6u7cr2ybWqke3rflN1ewvIPQgEHU353IMoK4iu9i+73ejh
         ki6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251675; x=1788856475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=sQyqHKs87lfgdT9zGX9cAfXsrYQDNCEGK/ZoT3yCJI2ZIHQkypBgP+X8x46kdp5v9F
         wIvQaGJA/anJg76D+57Q+6PEZxPGVMHRCUN0UJ2d/I9+urM9kRUkXpLaKZnQUFDSpHLH
         eMNLPQ70gSke652HU5wClHAS6TYtQtB7IA3QDWIdOhqlMSsWIQqUgU6mVnyvTNXWIW5j
         vaf61PupwRaOyKaK8vVYDub1xokWing2UpSa3BALXAFT2rVff4E4I8QV0MhO/EWveAhY
         argbEvyAyCueHwVDjAFGhvN0M/ijY7t1HsBhgkPjHrN5k7ZOgQn+Ozg2gZYHNyhOrxel
         lM2w==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1jIK4U5v6ycKM0VNDIhQCvqyyJpp8U7E8yKVg34oOXfQnUNQ9LXsA8kuQj2HLZcXD1PTBctbKtuX9Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++labQ7G4lNs96iece9FXYigguOWo87nNGGbh28G+WtPkssxLVEB
	PmQbUr2Myxs6oUG5VxjzuaizssWHcJUwNTKjArh2+sYYB34xDuZs7wKugv+lY1Qa2zHlUZm8Tw0
	dMHwaX2hxtc6XD2jIxE4X62dpowoK6VJzF/UE0VB2IcxNOOQnzTXolGJNzc5lS6w3QuE=
X-Gm-Gg: AR+sD13VwerxZ3asYeQF0dWpOa2omwPxggnOC0GIYIhcagpSH9J1wSh+ne6T+wVFQHW
	LtZee5GjgV5/2vWAgiungAOFzScZPQElnJ+Pw32agICHzgLdeVQNO2r4l2uML1kx+OfEHcCW4Af
	VmIzw3Q8LkRFxsG5xiEd5IsTqmeHWMzVTq8ToEbgiJ/MJkLpOVNOYWNwplvZ4Wucbn9IJiIJnZf
	twxs1+KMkm3yqwjg7vv7ESQPiBzkHwA8bCxGlI3lqZN6x4IFRnQuNt7VDjAGqpDvT4hTlLkQEIs
	Wt1MP4+xQZGYb8aAFu9/QlQhImjBNKccb+/ypsO8HhisGTeYWDnxh9bEz2f/2N3Bu4OEDwB2+VJ
	LOKz7h/vKQ/NHAr3vi30TxQ==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426951785a.4.1788251674694;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426949785a.4.1788251674233;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b23esm525247466b.2.2026.09.01.01.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:34:33 -0700 (PDT)
Message-ID: <1019ed3d-cc30-40e6-b82a-940144a97e91@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX8ulqR8g10n8s
 t47FzgybkvXYbW5oa7pnoXS8SfBhZoyiiEZSKAS0vrUMam3KQenibk33i1ou2Y1DNIWjPyi1Oh3
 In0wJPR+qCajK/nkj8/goJa9Q4eBnoQ=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a968e1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yxBm9irkQl15ksekz78A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2w3ovWOQbEJDWdJVzMKi0WV6wi3fK2JS
X-Proofpoint-ORIG-GUID: 2w3ovWOQbEJDWdJVzMKi0WV6wi3fK2JS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX0sGT86XxI6+I
 c0qwCI/yfFO7sSBiRACP95+YIUTiCfvNKCr7NaN5L07+oKVl8mpJK7Z0pjxMDXKdYhcG9NrMcCu
 BQNFce3JeGsoxN4bggB0hDHN7UfhTHqTMYneuaQVzFHGDTb7QrIdpuQd2DgykZfYZSF3KaQ2Yd6
 m1UEEGoezXsJeyHE41iHMwmRtDiapr20sSfsPMg1OAfkhb30tIF0Yn8QqeEUzua8TvelBIqk//V
 ywxb8TC0zwuytHouZxKJ3XyWgx34lijM2dOC85vxQRThFFDiYc0ffINnBysQ767A1EQRb+ID0A2
 a7jeBFfsfkCpb1+eGU5h+aSB0WlhXlGSgkYritHfKCy7zV0GqJAQ6WZNNMhwOHNq8nuPcsY8SF8
 QGEqDTpIo844BxZD3aImeCAoDJuHEzvyaqJUtAUfxy0mTZZMij/tboBg4E1lfAK4M2pzjNdoTP2
 GCge+UrL7QvELvmyjAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010075

On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Rob, can you pick this one up?

Konrad
