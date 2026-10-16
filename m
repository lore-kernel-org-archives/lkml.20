Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948E4A9D60
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155376; cv=none; b=k58O6NPhjzxbc6xhhkz05bODdDqERI5teuzwJ6Iyb+23t7Nq/9pUtpBucPAdDQ9rTy2UlsgtK0MRWPlrkipyE9cySSSR0OkO+UlAAm49aLHvmYnatE/qFHnWJZgpFG7phaUIco7GjdsJL0DEut15WztleqRuJ4UPIRZZP9dctlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155376; c=relaxed/simple;
	bh=Y6c9TJV5NBgC3Inpfz38sjLRG2sl6V1/vkLt/+r28F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBbLr3X86OqabswTT9gkHqGXNOv6Ccw301cKXxCpKc9nXQvno9niL+55w8LUvHBNPW5jaTYShvc06LADNc3qDxpNL7qUcQqZC4/JuZ96wTODE7gVyLa4W2DY+dBakemmqUTwpdaifrZewxMhKJhCumUGPfPQQGMr+zPabMJfLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPqgLoz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpAb0Ng2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPqgLoz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpAb0Ng2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAA1t1983163
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=; b=SPqgLoz0tGkjNBHk
	A1Fqggh0Av95qdVGg17CVDxSOU6/uo3GTcj4WopiE5y3VUcJZBMeOf0jEe9GWiEM
	pcyZTcZXeuWpBDiOtOfvO4xj95XJy0lizpSbd2aRPQFwwd88baJyWvhxNKATBGAP
	u//SW88UVOjx0PIZr46IVhO+kd0sxxEstIimZxMu4VY/ZX4mvZY+4M2dEFTcRWFd
	MfYiTToJoSsWWpMYwpv57QS62uHe6N3TFiSaCxnZsNpVcr74B4TZKTenLtG7KHY0
	LF/RbHYKGlW3R8vtUF18ckdDM0XnUQiXWT921xUHVTpHS/kriTxCY7ceiZLCzS7g
	VlGaNg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8apbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:56:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9157604eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155371; x=1792760171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=;
        b=hpAb0Ng2fcfEBt1TP/o4TUNI/1zXCyjHescXpBdLCNcgvnUxBYOFlU/IhwzruVsVxN
         FUL4uJDlxwOPNYE/ZILtK7CaQwamVjxDVjbYy8FN3cAVD00i85aOIiQMhSbpgCITgT5g
         Fh2JWzRHIbrk9pIHp8utQ93BxtvjlAPC8x62FcwmdqhTs3aPkMyeC0I0SwXU3stSj6SW
         3CUOxYZzm6xf2L1wFPkf41dxwiL566X7w8mM41v+pcQlY8lXqhMiwwRlriSq/SsUKDaY
         A9XsbA5Hw2al/mwXcebHNWfQRYHtNgDn0eaKTSw7kGTCOKT5/asRcuQwFxxmH4F41UFt
         SQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155371; x=1792760171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=;
        b=X/3o974SkVoXrxUQ5MrnLiB7HqALG+e5VcBcizgQXahIO5tYTpUCDLrBZ8LhcEvo1x
         ndwcI1RY3oyoiFpJeENBjRnvaUEE2V/DbB9WZc77KstWQtYPUDePrL58YDl0W8PH37ax
         uO+ekHQHtg+7YeylbeoMIeTYAM2g5MDxCQSAcpP1Cle6pkLQnju2y+A1BnasUd8p0quT
         Fgh9R/Hxru69bhB8xeAoJ2cKEwGXOWeJ2pz2ttFBJiUp2y6G6mmX3nuJYcQ5f5n5ZKWA
         kFsMBckuT47iZsOkJsvkT78rFcpg3i0tJPVppebUQNwXrJ82trGZ7GqL683X2Bgvf70o
         cCug==
X-Forwarded-Encrypted: i=1; AKwUvByc+KB4GOqMQd6gOl75qWbr8oL7BitNj28nZBy7X2CN7b4243NPimneYQYqIhL3mhVuvp9Irc5OWuX/KkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeeZrtFK3S0KNjjK1Io922IClN2LEKrh6JuxhTONsFWDt7GM2T
	wyac9fqkncaJo+hhRn7wzonQI8iZ1n9bYxHMex1vIY9MS+vpKdx6XT1iaZ5Zs1V/alj2L8sFn0v
	CRYCuNkRnRpbULo9GHcABms9etwupB/6ZSqH4+hQM5sueyq+sUPKK4PgToJL9n4xlC/A=
X-Gm-Gg: AYBFou3i0Xe4AJDebiEHcN6znngA6n+dqDUxEw80ZbNuinYzeHbI2J3Yh7RIlI24p/O
	a4RCaFYcO8OQTyeBkTLwADDHciTXlnK9MWpDdHQVrLNYSNVSGfEqGYAiohIUcRR+C70tvslt25V
	yiTaoMld1nH99ExnQKcn5T5e321DkgIHOejOywxm+rLs2bSQT67Uzv75/+uPJUo4H6HnMwhz1yf
	bwuOaSWGLCfL6VHJQCzWeYYZ7mn4cO3HSnYowQvevOo8Fbt/xDAa7YzyEiS2eFWYz8ylop6lvwW
	4YrOMifZ2oqJ05F01lK1ql8C9aUdThDiCnP2Nng2hadRPE9j0qENcMJ++tckaMF5PAL75mRBisE
	t4e/soU/q8kjJvZSdyZ57qil1rBasq+U=
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr14511633eec.3.1792155371228;
        Fri, 16 Oct 2026 05:56:11 -0700 (PDT)
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr14511598eec.3.1792155370692;
        Fri, 16 Oct 2026 05:56:10 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm7195899eec.4.2026.10.16.05.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:56:09 -0700 (PDT)
Message-ID: <c9d04672-0099-478c-a774-cfa4fbc2afdb@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:26:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXzdoKjetAUQIj
 ZowPzhtEnW0gKudirJimg/zNX6k3rQpghxWx3tHUgl7D0wuA/MeZ8CqtizSYQq6MzA810Cws/gL
 DfO+LezSDZ+0BIx7ur0JYUrRz8XoPmM=
X-Proofpoint-ORIG-GUID: rNNB5VuwS2WPPBNutp_LsViYumoXF5vg
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad21eec cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7ituTzxtpmmrCW-Ko3oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXxvRCPmv+8tn+
 j5IfshUEbrd39JCOUSTx/M5B4uQ5nQUK6YnBXzEQmSEHN84iXnHfXp2gfxbRehpJpbM+T0dSlwd
 iQ/xbAnzHxLZzHdChN4v6dIJtSzlUk1osJ6eEDqvYV83fKLNNhnYyuhQhF2WWSgCFCARQ9XjneA
 22jQc+aJe4imHAQmGgg9wSQCv3qPnJhNX+W6FUM6WbSTzdGz55V0inFmv8d9cytZKtL2AaRZwdp
 KNkw8VJr5edvBoqHedbGKruTHYMbTdMyT9yDhhd7dYgA+AVSKNKv94V4G6GgdoBCH4c3pj7TYjN
 jYm6TZ0iiNfETl/TMqQpC90pOt2+UputbIHyCnYxO+Gqq4W90P980P5NFGCJFRrUf2eh+y75kID
 fZhvaJbZz3oYGM663rxqjxi1XjTfCWyvMX7IiGZAtvZm3qy3E/JCUqOAbM/QOcfRZ/B/5nz9nL6
 5wSpEvLnafUBGJmBZpg==
X-Proofpoint-GUID: rNNB5VuwS2WPPBNutp_LsViYumoXF5vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> QTEE exposes certain secure services implemented either within the QTEE
> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
> services can be readily accessed by TEE client drivers via QTEE's
> object-IPC protocol if the service is registered as a device on the TEE
> bus.
> 
> One such service is the EFI-variables service, implemented by the
> uefisecapp TA which enables kernel clients to access EFI variables at
> runtime.
> 
> Maintain a static list of such always-available secure services and add
> support for the QCOMTEE driver to register these services as devices on
> the TEE bus during probe.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

