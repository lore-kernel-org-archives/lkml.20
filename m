Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011931985C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071686; cv=none; b=Pf54NvkLpdFLZBYYmQwzKxywTTq99W34EvluJDBJwtw3K40HT2645i4ovaS5aTF+jXtPG6P8DKp9noqvq8SS1GbxutVm3l76T38YgLmyZDUkEVjpJQyu5SPVDld8yx6QeIX/EjyIdw+kWfUllmSIteBBJrQMbvG+n2c93A+Rluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071686; c=relaxed/simple;
	bh=lMC7kxURybpSjdFzTK6cOaCS5kL5BeKCo+5fKJoCl+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ad+unblCbo3FCLMQYGAhpydl8nnBgSZKWcTXmXtxJ33NLuAqEnNBW/DMf87pAbViTIRQTlq75JOv2aE1j1M5j7wUx8gPsIyFer6hV350KZc37UGysDoLsDRsg5YuBAnRftYUtO3Ppf/g0VI51vQEXwHLX78GQd4pqGsp7fAQybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yd7ryF6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3A+Ijgt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd7ryF6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3A+Ijgt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9ji2H2417235
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=; b=Yd7ryF6ARwEaJppk
	GoAc3xiz4CZf/OJppB4KKcYsdBC+TXu7p5VE3YroWBJR60sL6wxTtEFLOYOgfHu5
	a2rPy10u8EmTWF00ljWOLu7NiE5GsGgXZ344IhTh5nVMIQyndmmN/59XbqRUkXgk
	/0SiVSgYNZTuwOXVL7As/E9dE3+fJ3dCjhtedNxdeZU6kgMd/lLzLSs+lITESruk
	ZRHFQ0KkuYrBeXBcyM43yTLJftIj6kEpaEPpvxIFboTsB00pAqqR2T4iFTzwpRoK
	ZR4WTeKkxc1gQ96dGD57gfrGAm1qvIUQGnVxoHHefsw/4ABXGLA429NrBHD14bEU
	o0Tkgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjbh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:41:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so85457085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071684; x=1792676484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=;
        b=f3A+Ijgt3szM34Gh4/P+GHW0C5GCOTGTV0AsZcsydmxZqKp44GhgM+qa84oRXa4c3m
         VrOT43IeJKrvsvpTFEOCzkP8Wn8eXHLNFUo7WvOq45JIgxSOdfU/oLrRjamXELHpAbL8
         72AbhrhCZZIG+FiS4uG32FTF38xXU7ZHMQMJ+wup+ZOoE1OGlOq0BTDUnKxpqrBlzqrQ
         0sEbZyQB0mPqDazPXXINjsO6+GDefYtvc4FZIUdoVt8qJU9wsUfhHk8jatYBxvT2oxg0
         kv/1fH5DS5MVayw3NTd1YmW2+Yq3tlIXySkypeA/wT2rjeGu+eVkpW1twuAq2KNqLuV7
         uXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071684; x=1792676484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hQ6+eENRuBrsEE0ZzvJU9MCl5hk/NK0q37BB4XSGvQ=;
        b=E7ia7ezWPj9Sqa9peqitvwlPVM4gjilesddzuQbOg3weFQcEbwrLOUT9yewcToCwD9
         h/AYNxH05Ppa+imiP2/GPajGtU/UEyJ+W3cWamiWB7lY2M3Wa3hNOpFeBHItv5gtAD/q
         9lhtXHUoJ0fl/Ot2WTJfWJi/Jja9JxpgP05oT6ijSMj5SCWl4tiAvuLBarT8VaoQqQLP
         cC/pHzBHw9ORpnEsT6qKIdujiyimxnHzCC1D7bbMuB7t/SfZouYTu+nJhNTQAnYTF3+5
         Lg6L9ABGHtoCGoVgtEcVdyGLqOBIwPZkx0o908fapFZCVUBXKwFUKjDkyqWtEUuavMna
         Ur+w==
X-Forwarded-Encrypted: i=1; AKwUvBxuzlqCCkCh7r95oWGsXjLCfnRRzVCoYL8fgQy/mAEp3aRYA45WHhx2Fa20ANHizaQAMAoZz9a7erlsWrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHw3mSglV88wGbUIhuco2Vhdfnq+W4AZ6Sv3fLda2TtSHHl2hP
	1HCpDSbEJA+3cmTHS0PUq/GNlToF8JGg7/mJOc4JnppreV6fvUFFSvFbsuVERMCPAdHpMrHraqa
	1M0g18GwIL3gTs8vweNUUFWO6C5w3Zro+/Hn3XxIpxEyGaYHdzzNJBKRzgsbmZmPzuE0=
X-Gm-Gg: AYBFou3iVo0d4Q5umDBJqUokeZOKi9NW7PD7Zic+XT1TApcoL3OxKdMsNHu+7jDjvKU
	p1hCD9Lc5tFJ0xx/yDgFekXbSkKf2nBranezXzGjE5aIMkgvLDwyEZDUO5RESmtN1ehvqIgqD3h
	4sdDzFgQBttIk2pMfT1QUY6wPBuDi2PE1nRDod6Qowmcsq98S1VkW+ABLYj6mE87Snl193EQoEm
	mJ5kg666wJvVOpoSCHijY8Xdy4yCPczPB6UoEiVWXLuLoMDwMwP50260zas/QXooWghqv48WEKN
	uox/emepbs0Jx1ONXhrWCOwamZVT1CROvYNZG6iu12zvadg0rsdGdIijoAjwWnHbohwI/25eW5T
	8E7iowGEdOBqDPayYgFNkrQ==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr739122585a.0.1792071683695;
        Thu, 15 Oct 2026 06:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr739118285a.0.1792071683216;
        Thu, 15 Oct 2026 06:41:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm123620566b.71.2026.10.15.06.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:41:21 -0700 (PDT)
Message-ID: <1be0ad8d-cf9d-4d54-9c16-e9e3213717ed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Fix the CPU retention idle
 state parameter
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-2-3181d488dc0f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm630-idle-states-v1-2-3181d488dc0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX3U5+Z0iQNQ9u
 t6sGVVTdamG3gi7nnvxpro5gJTR+Zs3CO3mpQKUU9eoQ/IZbp7V/aDqShPM4bKx9XNFM/zBNQ18
 wNO0RmObjR2pa1xc0I1l98ADP3uIGA2hoNk9TZwwmhVpT7KJlqU+aZr4DDX6GXmR+sNqzA5rCoa
 06F1fjP4cPDFIrMExikxJfx+agtkyVaurzRSRlIqhPI1TrCDiNH1zpVwROQmN0u13a+iHHOKxeN
 fhB1hNd0goxiCcIQoIcdQsh+NgI5HdC8dOF3/kMwuURfhy3aZnQp4DR+NG64DXhJ2fVvefm7skK
 JJj9P7edN+jF3u/XJQ7t84/2ZH0nQUT9mwuSb1aLct8D5siWrD5F/t38SrVWCAU+xWLXvectOmE
 lJf0oRpxcJNsvoKy5FMmBnzuw7dHGxACHREPftOer/ShxbQDBySaCiAQwQ1O/rePKbnTycNRQIe
 icW90hADLXkUqxDI/ZA==
X-Proofpoint-GUID: GISzNkNHeqg364UuMnM5o0PgHp2Sfz1Q
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0d804 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BdOeh9TuWhobGdjKrbcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXyOMXjZEhJzrY
 sopa8TBvJ2Q781DzKvSlJjmXK82S9cn4UvNbVRv2N5/Cm74TPgcn4yIkW/cjsPciuwSBwpeDNA0
 4I2eEd8qCfm4maB+Xx+9qpLXc1xL+g8=
X-Proofpoint-ORIG-GUID: GISzNkNHeqg364UuMnM5o0PgHp2Sfz1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/12/26 4:18 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The CPU retention states set bit 30 of their PSCI power_state, which
> marks a state that loses context. Retention keeps it, and the vendor
> kernel requests it as 0x00000002.
> 
> With bit 30 set, no entry into these states succeeds on a Motorola Moto
> X4 (SDM630). With it clear they are entered about 50 times per second
> across the CPUs, and the failed idle entries across all states drop
> from about 30 to about 9 per second.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
