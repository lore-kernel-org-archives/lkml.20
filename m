Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153E44C66C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935577; cv=none; b=GUNfnLLlGNbrJvGecJaVNmPm6DtOMdtNGenVDmX0MvbM2efkRdHpcUFOD8uKlJ6sJQmCXXVXxBe14ezTbeCcJ8zS5E6z5nklubH6kG4YP9ZZWmJmXlHItnKqBOcqnAxXJ2opKwCxYV73pO2prJoMvsNlofsy2X6+gLP5c1PROgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935577; c=relaxed/simple;
	bh=VThs8D8j95i55fCtcU5oItO4BUNGgvtoJcYyd72MbHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJJnf7dt+aiR52MtUTmp8w0AJQR16w7Wn1Q2MZUW3QyIG5Hsj0wnnYFpg6FuRz1mtq8qRH5do8McS21WljyFWuKV3II16FePOE1EIfHdypxAJbXcxYVJWKDXIx5Vo1RsQw/92gaNBW/Pbdz2t2WXiIFUZmQTA+TDmVFD7CtLsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAPLoJKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzNzNg0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAPLoJKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzNzNg0c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929ngSl1178039
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=; b=SAPLoJKgQzgwyoXC
	CcnWnTHuyurW1TX4hAti+w/mY3EsmZ4hHK+aLa/X3BbZKbD6LF2O9+zAd8elRQND
	eGoxK8TZnDEJBcfXVtNYksFEYGIc2e/n7tVli9bpqEYAWzb7QowpUoSPdn+J3w2s
	xl20HIl5x/iuNR2pBC/d1lHUSVH2I/qtpRsyUCUoFGyUx4SOG8GWkPVuAWORhB6p
	MAXpSB7C98JmXLs3bwRtuAOGchwLQSYkJG9eFKj6PI9Bb2IXKIa7M94BlDQJBtpi
	PKgWo8vX3R0/NmISqh47++GycjZznQxjjSyr45D3IariHDTsjrq+WC/81vqah4Xo
	tw2OMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfstwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:06:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso77386785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935573; x=1791540373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=;
        b=dzNzNg0cBnfNTVRviipB+sTWTjmPWna2aXUuqvL+t6ldo7j0VbCS2/LIjG5JI+pTW9
         dQZHeHpWXsU7tqybhb4+E+wgLJVNsMEcgEVXfJCPohzqe2MzM7nDPFCZNJno4U3chmNb
         SqLcV6M8e+AE0N0Dq5Ewv7S88qsfCO7cvvnipdII+C7J1a8anJM6LqEnJKaAGDhcU1xq
         Sns/jezzmK3K3MVLAhYpAt8STPzxRL51Dwm56bLq4y4feaXXJuiLFEgNoXKOHlvBk2X2
         6HJJgoIi865r28TiuOIBfn7fS3kWMkqVML69SPCD5c/CcEKuRHvG5uI42mfJrC9ZbOTM
         Sb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935573; x=1791540373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbCLfoi1IU+B9jK2etdyK3yCrIooqwV7pxuwkfym9W4=;
        b=PYILBCaBlEd1L9VOI8qV9JUkZLuTMYhk9K/1i+Qs8BGQbfb/iP0KYkoYdwKYev92Bg
         hzEv0q9B2aRYUFeQsWMoJXXcaXAFtE8zCCxHQzzyd1vo/5i54YDM8qLnyka0JpvWXYV8
         //Bb27vd4XHZozen+i6uFX3Yw4Y/c2+sZTWJwEX7c8+rEqncMpqfIL0Jnimm4ByCcIaI
         qse1H86oLfji371LfRywYXMEfO7SLTm0ZQAvwMqLJrphixhM11+jbMkO2HFE0X7x8m/c
         NvtxiMOsxwIy17xJs15vzkSJBM4eUPSjYa9UwR3hbLSzjJhpdqKx31Ehg2eW58W161El
         BJiw==
X-Forwarded-Encrypted: i=1; AKwUvBzjKIoSC9f7zeJGS+an0V3KBf4fLfg7oJjh0bGHUYV6y5c1abePFVeQn3GBTGMpRmCmQuRVoUoAZPGY3cU=@vger.kernel.org
X-Gm-Message-State: AFuF++kI/kgDmTygnKzpaLmI5E6qB+U6B07zUpPNBDT5JSVRXA/V95iP
	kizOZlZRcpkcDDK3wOYcBAGJvHieRvzLtbjuZLWuQSthU+a9xv+SFWZbg00Lq6BuGwd9r4GPwVw
	+Oj9UMtS12dDD9EzkXk3CfEn5CjNeIxqPtIdW9H+Exc/xT9JB1BIBLq8DNPH75b2IF/M=
X-Gm-Gg: AYBFou1Or7R0VaTj0h6/ejdIQqHqZPaQh+QWYBFKamXSW8umPBedSkP+Q2c8W6hkN6j
	5o+7dnuqOI70yXVvxq7e4n5q8nz2hHTYQnTdjHa5Md/BHw/xzezJmU2UgaWSN+0/fFBDRAd526s
	2wSbzmYoT11Zhd6w0JGFWrYkETsPU554Hrc51/9wjJxPIeaARO3ZyIW/qdioMgnK10a1/jOnYmQ
	xvJiHi6OILHUwAYOzUhIVadfE8uTim1JqLcAQrPwYZ6rTPenlvy1BrjwCinVqSFMljKBFy/xY2s
	3K3bJQRnpw7gKO+d9+LSBc6qTmudRsoI16JiXy03dNgtlTlxiN4/HWJ1i59Xoj1gaC12tqKXjV9
	7AWkdQ4QYRYlc8cRp6SeYwFOloRDRqWi1l1P6iqSltiSSgNg0Tea1Bg/27YH/PA==
X-Received: by 2002:a05:620a:1a1b:b0:93c:746d:7c6a with SMTP id af79cd13be357-93ce920fd9emr344410885a.10.1790935573436;
        Fri, 02 Oct 2026 03:06:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93c:746d:7c6a with SMTP id af79cd13be357-93ce920fd9emr344404885a.10.1790935572757;
        Fri, 02 Oct 2026 03:06:12 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm70346435e9.9.2026.10.02.03.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:06:12 -0700 (PDT)
Message-ID: <d6c23b55-2c0d-437f-ba1b-624356446ee3@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:06:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] clocksource: dbx500-prcmu: check timer register
 mapping
To: Slavin Liu <bolin.liu@seu.edu.cn>, linusw@kernel.org,
        daniel.lezcano@kernel.org, tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 198amnG-7FTEB6Z33I_z0TFjSuxG1gck
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfXwtaCUksYyz/3
 Sa5M3yM7peDeS3uOu9A/0tkTp30rgUibBMhvse8hkhA6Qn2rMrx+GiJuPkG5pHDdFPqMB1MosAl
 I3IPEqilNP+xavLGrQ6eq+NA5SuBptk=
X-Proofpoint-ORIG-GUID: 198amnG-7FTEB6Z33I_z0TFjSuxG1gck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX0LazXvO1K/Gg
 +0Pqa2TWuf2L8AMgV8OAE755558PNA3pGP2vI0wWILGrvG6dYL3chxbd3kjzhMb6XZAPdboh4tv
 N/b/sFXF3ycspW6NQpR9OoRSDTJChoJLoPO1f4/SplQDKTS6d8CHr5EscL5AdxWy4XMP+PykVbW
 ATOGJGzDwJ4LsEhPDc7AuT6yBq17uD/Nr7ptrdsqH+qm9+yIqFVPo23r93wGkn4I6KzCSJyMldm
 qimjLViE3lA49VeUgS8ypOUX7Zub6+xsNuhRIagMerVXlRcXVY9JkjD7bjulVYs0lku0HwNTgUQ
 OdG2OPDTZOd346VT/cq5lhbIKZOW9qd4bxLUyOef3sr0m1S/bRlnUlVLgAfxKH9wUaRIfH7i+ka
 oB8JBXBVzq7smsgmbDCSC45xZ25n6kq6dyMPbGta8sLfpq1fqZMXsMuG0Ag0wKDbdxGBA/OM6z7
 +BOAyVNs4vewB+NJWSw==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abf8216 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=3w5cUUB0E246M0ZwReIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

On 9/11/26 08:09, Slavin Liu wrote:
> Return -ENOMEM if of_iomap() fails, before reading or configuring
> the timer register block.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500 PRCMU")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
Applied, thanks
