Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1FF35C6B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839800; cv=none; b=Gggd48IEvUPagb2E79kOaT2v+ziJmClmq+WsiyfIxrbD25L7qVsPpbmX77yxB+qBxbvO2HXz07xnMFkgo0eNDH+VFkMc60WmMjQRYaynho36Q8RXp8MHkUKdcMInNJrGBVD6jQX43bkVal+h5SkPa06DiS4li+iZLE/5gHpc6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839800; c=relaxed/simple;
	bh=aj90nkIktV90gsgtUkZ5qxQYTUJt/JYnxXvgLMgGLSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CB7Ey/dJ5FcUc6X8WDXPSrJ+y5Rv2wIm19dHkh6ZxddVVItCUNmvO+OKs6Z+l9YJDRvLXnZ+6Nf8YBHc2/zVU+sMdHljn73b9S6Vn0EhEmPKGlqtgQR9uZYJvjiNQU8uJI4zMecRVH5lDcHUMWSfNh9xufMzJfMDWT+cbLCZdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrpm+rTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz/woWMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrpm+rTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz/woWMV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPxt2887724
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=; b=Nrpm+rTF70oa7N+F
	PF4GLVmPPz4AmekPPON3PltFte8dTNEBjoJzbdJi15QUFYkl42yX3EJa6tR06Mhn
	8/CwtWLy3hAgBvyKzbEcNFf+KBSZEtnEDMl0t9o70QmGOidymkW0WHYwQqJnx5RD
	jHxdaWiy/o/uA5xBcfV5eDBNSHods+T8j1vM+JIu8kS99s7q7SZL+nDrsdWVUZsA
	LH//cwVO8ZYjl9puCy7YkjdHdWpL3+vcYFrva5ZHi8nVVHg4qBL1xtbWC/HD3JQ8
	i1evEQXFnJzS2iKzuaUXheBh2pgkIqzpUZgVFrbgQf/56qZ3CCYVj9nFGPrCGC9S
	8SIQLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tkxcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:29:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso9647926d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790839795; x=1791444595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=Hz/woWMVSgbN6cBnsrsQSwaMKZdzj7d3Qz4QNRCNXG8xBL4ClzJYYK2mRaYv3MVWfQ
         SjW4xJSy4wB/wPESulZwNxt+NQg5I5PC/Clxxj7fj4a6FxOXYsWTMA4zyLK8vK+T1EBt
         YfENVAhkf96h+GauwcNxlvEfxI1XhEH9qvQZBCMzohrwHeFIcsuU/LM93/y624jagfnj
         DKc53YjGnUVIWAUanBE8R2T3ZrQ2i6bdBA+NlqtyfJxByPoCZGVnrp/DRDn/mbIusPwT
         vBQZJw8PDeqvw9XTsPGy8e6V+pup/TgxzK+cjr8dpfKPcoQ2ZaH7TFa8bRZJP2mazk73
         vrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839795; x=1791444595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=FcRvAwznbbPgXqTXWhuWiHhkHwSuQ/qWVZbCUoFwb7svKNvT0XdUuah2OjCBL8iOmb
         iXwJR7yY6/Sw/WsHlhMvojmLX1ZC3Plj9Yjg/GixExARO7mJh2w9NXQ0y6upY3LKEwjJ
         E71hs6VjC6hA4uStf99qH79O6lWCKWk4nfnibFucy2RrTSgJ1YPpEACd9HsWDNkK3fzg
         PWhrALY4p6ESRPwl+n7FzE/AEvzV2McAn+UJJsYmkPL8byCDM55d1EBcJkEDoabrN21F
         MpX15bU6A7oWQbl/XsYluidDmiTTR0v75wrFTklsAXPI0GfDPrRNdrdDoHKCRdzYIQdE
         i+cA==
X-Forwarded-Encrypted: i=1; AKwUvBxxCUMRlS/z6focRJgBl2V+bODCYgzPWnZDs4FxyGxsq4mmiwDH/JVzE9pB3wAOguEtrsyn8l5PE0d/sSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nyYUZgUr8kRPr0M/xJrr8SThH8XIyyK42yd4MGxJITPbxCnKlV
	NQcjUevhkI9FS5+YoVELB87Orw5VRIItGWdu1D0jpfwVpnczPXyQ2ubB9MWb64t9o4/AGgwLVw1
	cSNXxkiHKRIi4B+ua8+0QsR8Tf9p79mJ6lp6S8e67kWuwtpvrid4/qQ6p15Udl5ethME=
X-Gm-Gg: AYBFou0qADaK+fL6CcbMtQl0jRllAjaI7iN0xxM1c5ufG+BXPn1zoP1oA9rBtAL0bQl
	GKsfx7bGPQIYnb296K0NY6eQtNQEIyvF6YdJscHj3dY1u6RIVZ1rOg4NvnJoXOpBAgq9UFUJR0n
	NecKPt+4DFM5d2Sl365HwAJeUXVHV8BW8+vBE5dUhZlgegsf2ELJBmVzmwNhgPg2BBgzUSmz4Aa
	9Vza276wdJUtlM8VmK6K709mi8lAnrXF3NGZbOhEe4OA97MhC4wpOxyzGMFRj4yuyeUc/TTT9EF
	jb5pQaRu2ZseDq33vaiM2KN/iTdPmdseaxoVJaV07Ks+Aztgr3lXVmaJPzREAZgAMK/kx3CRqrE
	/NoKeg1OjJj8tlFqCTQQ14A==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664520285a.4.1790839795470;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664518385a.4.1790839795035;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca64e84sm556505a12.21.2026.10.01.00.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:29:54 -0700 (PDT)
Message-ID: <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:29:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
 <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfXzj+/aeTq2qWu
 5c20QmgUXWOtEi7o91/yJnyNU0Gdgtj7jRQoJwI6z74t+WZUm42FbU0sHJVwAh4GxW1uRrd8cIO
 7yZ21g5UV2F59ahSfauMgh8u2uzPwr8=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe0bf4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cNAZRwmMWnWlOyi72XoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: GY69Rl3d-V6FQhBzj1YHi68TKlJLf9kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfX6NazFaT1TGvu
 Gn7Y2yKth5hsP6CNwSSr+b7C4JUXNfTjeb70rmMkc1b0Q9znNLLgw5YsZXyp6vu8SzTwElgsYZN
 dJXbD0H6tKUOmovE0uIWb9porMqUl6sLZRu2EWblJ1zNXc6sn6o94ecOZ4zu1ZIJBC9BDyWWrfQ
 cpjutZL6l7pTR/4O4R4J/5YXBs62KI2OUavxLW2KFiuLWsBS4pNBptSZIQVtRd5kb5h52YBbL+y
 ncJTFJR2PjO8X9Sd+Ae/shSGY7667NSbgHcGXM5Yf6S1VpLEqQJNIbKRUOGRx5ohq30LMbkSPyJ
 F21NnfnZDHHy9KkAWBOqnmG2WmQ8lkflRBgFzEK+9VX63CosrFbIp+AvQElkXBjwxocvP8hjxul
 aEervdPSXhfyEnSQA4Z8103FKDEDKvp8aV/WSG8N1Nsuzs+I6Qpy4KYqCfLBd7d4Nbl3nmXS2LB
 D6AizUASZV1GdnYHuzw==
X-Proofpoint-GUID: GY69Rl3d-V6FQhBzj1YHi68TKlJLf9kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010029

On 10/1/26 7:12 AM, Yepuri Siddu wrote:
> 
> 
> On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
>> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>>
>>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>>> variant.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---
>>
>> Why do you have one problem description above and a different one below?
>>
>> The information after "---" is not merged so the git history only
>> contains the one above - and there's some interesting details in the
>> description below. Perhaps this is the b4 "cover letter"?
> 
> Yes, the detailed description was in the b4 cover letter body which
> gets placed below "---" in the email automatically and does not make
> it into git history.

FWIW you can simply ignore the "cover letter" for single-patch series
and leave it empty (minus of course, the changelog)

Konrad
