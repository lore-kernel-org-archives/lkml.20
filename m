Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6E4C77C5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955425; cv=none; b=fWLUf8logLsiBuq58kpDNMkozrDndlvZTTRy/xopu+3kuTMH8soicTjDH5jXpajOMVQUa1rhbwEajR6EieaqXh0PG1IQMyGcjliGayIXlBKXaGB5WSsJxbjUmRTEmt0zifK24tUfuYur1yyz3pRMgkzrEi2L7v4NP6MZuCcWyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955425; c=relaxed/simple;
	bh=LTBwD1h69J9FSsjHehddPX+hOWUr30Pz+tfBZRGQ76w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6llkU1XDKavyZmSclS5UQ3xcm85fsjpZW2dh/giFDlV6+bcpEnSpc1aKDDlvCIg28NEzzotUx+DNnF1RxsHCTCGwJpKAEsKKjUhNXpcMTqy0wScg40v2WcG31SoxwPk+raSw+X1rLjAE5OCU56Kfh3wB2ipuA+VHFFcVvfn6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq7ReIHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIZlJAQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq7ReIHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIZlJAQF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3fK2171596
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=; b=nq7ReIHKiSIozb3F
	PhCWHLTrHzlOg9SxQNkKM4oXCr2Ssgi2WT0qC15hBGnybFQmDOaw7gh9PuctG0WD
	DurvwmU77YXDi7MV+aArP9rt03OswQv+H8CbIE+o29i6r5hLVFs7MXaLgYt48HBZ
	AF0n5BD74z9kwX5Z6LykHOI08HU2WM+7u9uqBRBgB3rjfw9zQrZ/Kyf2bvnpgj8z
	DY3hYrqg7+NgoI6dSIwas2HBrnYJGrmQe5Iw7FLAvyD3/IqWpb9oiZVPVY0bsl4w
	n4BJBxoSiQJ76D1uMD+e3iATfdYxgJfQhxxJvngRg9Kg7cJeuKuJQrRNvGlKulbz
	D9n4Zg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rggatf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:03:42 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45f00527132so3016047fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955422; x=1789560222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=bIZlJAQFqBe4V1dZhAgSxGb2ATNS3dSzZSIT3Aq3Ej+tEKOs/t3yb3eA/3VvDZ7IOi
         K1+xnlz4mpyVAlAig94SMAzrmvjx9BJxr9WHISnl0Mf/CRfHoZdeZVFdP3fAHI9WaChb
         iyFiYjKkBN0CTfviA2bBe533wCgNSmaiG+wltfH40RcHxYw+2x/VaDXOl8dM85DzYXDZ
         56zMNL+xJ6wlJvVHARtYx/kHiXogLHKa/6rEY6fwlrcbasaufsduQqrBGvxQNJdMOPmT
         XCOfXeQ8ueDdXT4kr6lFTU8yN0c68ibraNiz4qHFBiT/w+PQ8fz4MOsu9ad5B42tPeDU
         2NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955422; x=1789560222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7myrCA3xPiz3ZcfTIUST0TcemtCB5dR4O00mG6ydPY=;
        b=IlHVttjyJu+BxFrnTiJmaSFIzfbOHYhf0pNBPGZz0jA+phoBpWoZN1qLiQemDjdVbt
         IzNzdwS0WFoB3Rs3FlCMz4xnbFbspR/cK7BxStx4PZcxXGTk51E1roW/af+Cry9kejyz
         /ESYmFPyTmV1IpKikl1OpA/wdpMUZ9XcqUE/9mf9p+01+FEHhdOZVhCtVh751Ustrmdw
         /sf9r+X6diVNzi+HBDOcS2Dtp3Ut7bFchYG13BN/rHrK1jF+ocOmixD/Ml4YJIpKI/Na
         X3fhge75sIjrWG5lWij8/ydV1Ykxdn04GjWz3cdmpnEXdAhkQe+Nf9SRNUTqN3AbS77S
         53+w==
X-Forwarded-Encrypted: i=1; AKwUvBzjq201qgevbACoYkxziqbJxQmtXQZzJ0qMVtWR6E3dTL3vh9r09FJ1X8klI8YXBokPIop/O4mQdFctjKA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjewQuidf5e1ZukT3oRGVO8xB+sRAHRNHaYKzoUUs+WTA6ZDpP
	TxmMgbqvhFHhvOXzRL1N25NSSD6sUD564pZ1w18APSZzH9y+hngYE4KYDp9C/VMTkOHrqDesOaY
	UD9YVwZjNQUnGIXTSGfIPiVvl0gRWLBKOC0830e4e/1O/F5IJOq3AVLvBjNnkOM1FxUk=
X-Gm-Gg: AYBFou3KEDlEejC5l+TQVpk4bwdfYN4rl35OT89nW4VH/qkpc+M179yYHiR5OnRk9QM
	UDZKhlzCl8WvajnJwmHNxVcXkCTMc5yf1DhVYnfZjabUVdqHs2JEayyP+pOXQLV1BUpfW4GIzxT
	y9g8eJPIKiHcFV0HXg7WTM+QwVqUmhshVmd9FZBR+2ac/5aEK3yV1MgTohfoAni5zsjDyv7VriD
	5OKzuzJC1bRhEAuOjVL3iEFvocwwdYfODABkojcrybxepkc34ZhnZwRf6A1grRX3sOVXOKsv6UP
	CQOMSZFIpiSyct9qJfxZvJu3aukMe4vAPQjLoIVLbGS9iWfR6wNAZrA/5OxVX27iL4CaIdMGNLw
	MZfBXZUSxId9QrErL1Z4zLA==
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739854eaf.2.1788955421677;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c2:10b0:6b1:aff4:8e9f with SMTP id 006d021491bc7-6b71535d622mr11739804eaf.2.1788955421251;
        Wed, 09 Sep 2026 05:03:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm586774566b.19.2026.09.09.05.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:03:39 -0700 (PDT)
Message-ID: <9416e173-7690-45ec-8c01-6ee4facf811f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-tama: enable modem
To: Shujath Mohd <shujath@outlook.in>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfXyZcIfTtmOmaw
 3nu7ejW8NGkz6N68AyltjCdXc3TWgGI6QhXI3nG8kdyneS6jsbQ82hXprN6ZvJwZapZ9LQYBTFq
 NebtNJRr5xIwo5RwFfU8K4Kk+LXkZUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNCBTYWx0ZWRfXwF6BEvoHMbiQ
 rJRj13yCQZNJOaMfyocxVwjA1Eo3t17S+CeBtjqIVIgVSJRAbCn1Ikhrtt8qpcET33XXlxttj8+
 aMuivTHujg//+66ReM46HuJhpEDQJu4feJc/jK2hfdZpGiL2VqslNyBh+oiQeo72RSwCkbuPTzz
 HxOF/5gNNdKXTNk5HjJyL9fjuIY+y2fLuTbkdb1V1aJtyRisqUFmC8Ip1I8MghNMnBx0fdSDwF2
 JBck4L/ext6Va1mA/u6ZwNnrUQcaFaGJLBB8QPP+1RoqGKOmqvn27ksh3txuppb7XbOVo0BDvnD
 4/GrNvTk44LM92VZAe4YoMO7rS1xJFk9g1aHziHOeycv3BxI58f7Y/NzmWiUWnl2T/ygkRqDPMw
 v5j+iTc0IEJVU9Sw2XmAjK/o2mvXy33OoJHRCZLseWFaZS9bb31e0n+LDz7FvjYHhO3hoMxsOTF
 Je3rouVE67SF77tJYOA==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa14b1e cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=q3xCwlIlc302ULIvI5EA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: WBMVGBblItLTH-KgvXihFzpNXi36G6nK
X-Proofpoint-ORIG-GUID: WBMVGBblItLTH-KgvXihFzpNXi36G6nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090134

On 9/8/26 3:16 AM, Shujath Mohd wrote:
> Enable the modem remoteproc on Sony Xperia TAMA devices and provide
> the corresponding MBA and modem firmware.
> 
> The modem requires ta-service to be running for proper initialization.

A link to that would be very interesting to people reading this
commit message in N years


> The remoteproc firmware configuration has been verified with the
> following firmware running:
> 
>   remoteproc0: mba.mbn
>   remoteproc1: adsp.mbn
>   remoteproc2: cdsp.mbn
>   remoteproc3: slpi.mbn

I don't quite understand what you're trying to say in this last
paragraph, given the other remoteprocs are standalone and unrelated

Konrad
