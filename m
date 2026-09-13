Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6638F928
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323055; cv=none; b=Va3wkamD7++py2Qp8649miT4PTAGBzo3yJF9PrN9tzGmBDydEjnclEv4+exEpKGopPt3kQC7z8FwZc8seKhX1seaKOA5KRGmy/2NOBYu2oDOCIkdd5cdHNDbnB5QYCMVc2SYgJkf5hK+fQsy6EgJbMDDk/sy2moLH24DzIB1iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323055; c=relaxed/simple;
	bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDRycpn8+8OOF87ELDIRiqrJGtkQZoZgrhrFMkX8RE4Zpy6jo7nNQVPpzjRKHaOKY5GN5+fnY948TMDwKa0CYQdUZ2XwB/AdqR7qp6m1AFoTA4CrkJURsN/6OHOPUrz049NixBAZ7XAEaNwAh2jZr6N8hht+8bSsb7vyuwU4PwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RICXjEuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQW2nsrc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RICXjEuk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQW2nsrc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2m852614329
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=; b=RICXjEukhZO4uJoY
	LQ3HEWS8Ooxa+CF6s1fOjaYpsJazgBl+8YjrALJ2s9EPJFvAyenNlvM/H89xDCZa
	hmltTIs+btYHy9Tg8d2tE2OzhDfMoD1M0rHK9h43AwCWHrekxuC3zcMMwcQbcghq
	6ln8MA5z1b7anYZaxxdeYZIbgjsw0ZBK3gRQd4vV+ZPipR76jjd21Z7Z4lQK3/1j
	yTtkghUeg3ACq18DJz+2B15uaObcqKiyiHBBqxDrFWe+Ke/dpOo8+9r9r6J/DXXG
	D7j9FWmnMydRNEZd9LoPNNKslu9HoeuaepNcWTBYyM1rIpGfCJrEnEK2r0q4zZvy
	LtI0nw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbuam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:10:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so5400588a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323045; x=1789927845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
        b=iQW2nsrc9/v6reg7pTlKP131ZFTviiVUFKS1CMPzZqyjtFO7K+RglBH1nOKiOjoXy3
         cD7TAMPRWfaJXAEO9BwlQgkCjaTxMaOtfghIf8MgIQlokMPetfTMkFuKwYmoPiJwe7/c
         x6i5Sem+h559mJCVXFCJZZ3uj4tyd6pRXolIvJv4aKTP4IghFRBVpM5tcecWAv29GtTD
         zqhtv1gwRcl/h/FCC8WxOyTeCS+sZkTpGIuFrEnSPAHL7az7yaAgeb4Nh2v2cqlIOtbl
         WAvg4nfreb+/0UAKEGWzLQ6IJDcucIAY+wREld3M5y4algv0ohPpYyVqWtEgDFPCTuCd
         ugAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323045; x=1789927845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8U0I6Z/B1mX2JrYuQnWGMmtxYuEY0zzYmBpdRmxwVk=;
        b=rUpsDJdrc22NIeWMk6c3YrLM0GMYk8ckC7COzlP98Yk6WRJD0DOcGWKgW5lUaX48rT
         L6HJYbyhoesYuHwtQvYzARUnSBXOCawxsU7uhsV0WpWhsP3wUEuow+CnAt3XfDmUtgIJ
         2U+HMcYQH5R2AJZrbcNabYPyjdYbFEkfrumr8g8ifp3dGiBIzZ8NLVAhzPbdqftwSs9A
         r/xFfbt/QTt4/vhX2Hfb+xtsQBU2iAhuX/aYpYOD9qZAfe8Yq4ss8cJBX09ZxZOBEe06
         HoDiCUl3TMJuvolnG+ShOMRS9VtRnKRP0mDhPIkUsX5GmAne8Mx3F4W8qj31uTwo4pOc
         nw4w==
X-Forwarded-Encrypted: i=1; AKwUvBwrhd8c8P2L/wLih+Gv6pfFXIe/gwvOibBT7CWZJgLheIo6wwNIAXDLw+ZurlPzkilWqzlyamhCat9MAz8=@vger.kernel.org
X-Gm-Message-State: AFuF++nFBHm9QGc2+7VyI2VGuPv1mjn6ZVL3LqjBCH38JLtNImDWrfIz
	/KveyXwspLtaARJFU01kJ4RNYqBicRAsbXiKn6xDXM6bUb4sNvgIVJsLiUJ6+1RtiDAQlemGjF4
	bR5inekN+7DRsbjFQguhL3REjQT/fx+Za0vUD8t7S/+9mMPlX25gKdx50nILd4c6ZkIc=
X-Gm-Gg: AYBFou0mV7nbYWWa0EzOMukmQ2tt8pjMMD8rPKOVxbqsNdroEY8otJl8gnZ6+XmfHFt
	MIQVuQ02L1zb5Ce5QZYsLtVSN3LCa5dkptP0U6RY83fWKhQEZJsQ6HCl1XA9Y+ZWeiDGvC8SZ1q
	CR9P6lImx54dCBtSW+wQDpq5Enk4HLSTXyAX0AxPmhtvb8ZZVprjSgCxvrlrYyk0R9TnRaSDGKI
	lfgML8FekebZQBlg+uATVD9VykVPC2x3VmpT+OnRN9gY2rryh24ba7UCB3zoVn4kc0nfE88xD56
	aZPRkdCb8G5t2onGWK0r5qL/n15kWIQ1AGGr7AYadK2FsB6VpVwK7SmQ5azb7xM8msLsu6oguSJ
	A7cKMAfxv8Px4gxwwNIYyOoYg4fspoQI=
X-Received: by 2002:a17:90b:28cd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39d9b983602mr25214229a91.0.1789323044645;
        Sun, 13 Sep 2026 11:10:44 -0700 (PDT)
X-Received: by 2002:a17:90b:28cd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39d9b983602mr25214188a91.0.1789323044251;
        Sun, 13 Sep 2026 11:10:44 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8137fsm20539816c88.9.2026.09.13.11.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:10:43 -0700 (PDT)
Message-ID: <44dde4c9-e4f1-498e-8247-94e03e85c521@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:40:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa6e725 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WlaKPkoLHFrkzAxCTu8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfXzkQ3wKaaM9N3
 24wSuCoLi5MEx6Ww8Cqg8PTcUW39pH8i95JXDLFlM9Uoy7Z6NROxGMTsJpPjd9IvK9gitItvR69
 2ULax/bskvUukZAb1Csr9zF5JrwFz9E=
X-Proofpoint-ORIG-GUID: 9fhauoIyH0D6Q5m6IEydirlcgW7rzmkz
X-Proofpoint-GUID: 9fhauoIyH0D6Q5m6IEydirlcgW7rzmkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfXyGuppqWCVx6A
 QPN0+ZZLVtpu+CouwDfDBdjTVQY1W5L5PDxp2khEsOzRVlpyPSYlsxuJG9lbfueHES/PTyaIDpd
 s36ZCJ1i2mX2y3kbyAskcIz8e3M75KboYd0VuiORZRn/6Dccq/zscV3s5/q+IRYT76PX2SWGPor
 6qHW0OGoUwl+Kvx320YYQPj++frNmlUe/1VavB8EZRHWjUKAGvqj1LWqNDrxjAxSrJpBnQKSNBI
 X03NfuXMYRSQ7V/c5drwATdXV/vkgR930yFm6QTUAiHFt0aSDTB6uNDCcszb60WW/VI7nyR2J6F
 VLTGrQDQ9gBywjqg0Xq0GDvhE7uTsaX1wlYaRXPC/YxJEh/MU6ejY/aR3FX+10yghNIQMYTEYTS
 MHcqWATHm82ard3mjVtuqHcW2F1xCS+KgclVTOj9Uyzgyb6TPcLd8LxCNatSrpQrNF81mbKxdkb
 g+ACwnCjrxbQttk/9IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
> in SMEM for Shikra.
>
> A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
> and vlow.
>
> Document shikra rpm compatible to read subsystem LPM stats too along with
> SoC LPM stats.
>
> Keep "qcom,rpm-stats" as a fallback for RPM targets, so that SoC level
> stats are still shown even without subsystem level stats support. A plain
> enum can't express that, since it caps compatible at one item. Add a oneOf
> branch with items for this pattern.
>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
