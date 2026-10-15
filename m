Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06694CE671
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062029; cv=none; b=iAJE0RNa5sA3gkV0fVAjLJnbRRgL11rvoZkorOpKtCieZr45VRte3+lVyTlVHVFj0AoKOHUCnEdBy/PTAx2zLt+YwZjoKmP0uctI8E42wb6a/F3nsuSbmyrTBoWydBPfcbDYv5GkcnR+Srv3aR1Dol3UgkgHVAikZCesREtZnmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062029; c=relaxed/simple;
	bh=rBYJ+VBooPiZVjyoQritmIrBDC7txb3ZU8qUUwQjDyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIVvWvRSFbJH1vrr42YkbidbLgi7LCyD1hTx/mjScAzEgbiHDldQcRk/UJtmpgH4sL3DR64RC2Z8XIlqd7hX8zarbcNm6UTzCKdzzw7Out+8aHNDWlrxUhPdCXMeLyAa7UA0QFVM2zhxiOP24uZUskwRwtljVJJE+rn9btaS4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9HO6y/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyXfQakU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9HO6y/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyXfQakU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPul01596362
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=; b=j9HO6y/ydwVkyQOZ
	K8H62hOQxCyXL01kFo4Cp+Ga69p5a/kYJYfitjkaFWM6nrwxHgR77RQ2mqAZ4ur8
	9MHoSRTgy/IviyWUUIAbw58xUl4vBiKIoaB7pxxzULpV4w3K2Q6NnWPXOXjkmMEv
	ZZdfFtaWmC3ptr5DJ74mB43KWQHAkf6leg3SA9moBzm97wbWFQ1+NxJmjHWnEdNB
	dfy1Vcn4qiuJNApNuURj7LrcAveB3fq3DpFL01kBeAr5QQS0AL4K/G7SwtISwoHh
	zvdaTiOLykLu1FWwkmIpJBLkz8w9r7Jt+ttmaYToZrThrYeMqlFg2H6C+SZkSgFa
	arFHzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v83x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:00:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so1385689a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062025; x=1792666825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=JyXfQakUuwbKqTRgHT3dysXxX1z/acjDyQDfQGur/HyVoLGINFeG5Pm6bTmz2rX4g+
         ++yvYXAcJO3P+6r+YRZkWGzmHfxzlm/tNOrZB2x/0d4PnoFmPA8GXpElDC9HYHMwjm4Q
         0CbSsSyACTJSiKNrcEMWrpzJh/8mXO9+gEBYRCL8SfagFOib46/ILFsIR9FCk0ledl4/
         bY/e+GKdLxwGbb8D8dUw0usmFOdiNhfkKSx5F0IVwXpyWuR9LMWsoOzJ97KD2IAVUwc+
         C0o3d6gzBjBlEnSEkcSYW6Bzf7Cim5AnQ7iFXqzVwEAk+c94Wgjtah/12QmOm3IS+O//
         BzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062025; x=1792666825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=T4TxorUAKWA2bSTZWW9o9faaeEY1Yha6LtRF/UYUfTfM5YzAAUmXm4HiqodyJWPPQZ
         2q5ghXLWOdBSWIYcDG/q7rRL/Gn5jt/YFqg01cTaWgeufnRE0ht7JOYGGQX0qocET1Aq
         t0fhR1rXs6DRrq1Vs61ZQsLXaJIBmRIL2iF1cB8JeAm6CKSoTN79KXHZj/HssnURYni7
         ykmhiepDmamSebBulxeHrBdyI2GWY7430+KckeHqJXxl2DrvrCEGzfziNfbgVKghDSfu
         FZWr0adYTVKdPYR02q0ne7cou3f/W+ZlsqfNPZ+syQxdTPMdOyHwmRzzWWCc4DDhvDpQ
         B3bA==
X-Forwarded-Encrypted: i=1; AKwUvBxD/oTpfn3Kt2UfXC5sl3S1QWGNR1S90ccR5RxBC95lO45zTheMSTnawE3E7dFg8jprpPhoPuE1fXeKQ2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb7bQuHp8Y2cjpHA5aZDgf011zE9QT/62ZP5b2ltbWUEyvQyU0
	l7eUNH3uGF9sZeFMLT1zk35P6VXQnZXre3b9J4pKXOHtF8/lFMooKSEoYXfnDqp5YY2sFqAAQwq
	fphHpDW+syw4v34tv67t/HBpea/jKeLCml0Lyxm39kHkn3XdKAa7xXyRUrgntBXJRa00=
X-Gm-Gg: AYBFou27ySIj4An3nff32vzLapW7uL5YfiiqSHmVsHMcvvlxHJa9imWz1ZXzTu2EpvV
	baRmcB60rqG1y7RBHcDJX6HnhRM7tk2ncUr2Ar+AITLLDGr6mKzgRao0mmghIatqT9C/D3l3xjY
	XumshFdIMW2CQST2rINrgHJdZJEVn6B2Tc06uhANXSKBdZv4wEnow1r5O0Um+yv0wpgXsmms8D4
	mVlahpR8ey/HGMA/pUf3an+ZR5Fmrc7ybHlemwub22D07Cbf8SdM9sKiMoaWxnHw70/dhLa7jIU
	2wTsHGwC3YcTUWzf0AbF8WcD3npptr+LRLBzX4/P4zsW1sanfxAQiv7W4+sZB54q0EYjRzBwkov
	wuDBhAzX2JTA4bifBqeQ7uVV5e4c=
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268715a91.56.1792062023557;
        Thu, 15 Oct 2026 04:00:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268644a91.56.1792062022861;
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a31aa8sm2134817a91.0.2026.10.15.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <fe833dd6-0124-428f-95a4-bfc48c3a0dc7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5jdaqvl9/7QU
 SHqyfzXtEHRydtZdARvtJRMofZuT2330k1Q8DFAp3zAJBjyCFnBAkrCpYX80Wbha+aLfuM63PXt
 C4tO2wW1gbDa7N2HU7em5c+QKYCGwTgc1v9n9GfUCXuUvptZ7hTrWroT03Sy9wLoqgV6HWWGQJ9
 KAT2Qcr+qlebjU5HjtROpy48at4CS83txmkf3r/Kf4Wzj2w58TBbkfJuD8V9+N0HR3beU9he8/R
 Y4PeFhysO7fz7cCOtP87tpexD6IKFwOapADhPoxdVfbAvFX4squxktOjVQIaBmx6WhBHr0wivjL
 Ct3+e2wuZtkQ1Z6FAOxdizozyuTkcm3nQIeGRIC7uqtFPqrLK+am0l8mDyrvwEHcu2//KC0FaAL
 KJ6G6zaoIvhXpdqd0Tr1SV+aX4CCE50KT0qBybbeuTaZNwKxBZD/BiNlvmlz2g1MP+B7BkpWptk
 pCVDlER7BQ3irBQDX2g==
X-Proofpoint-ORIG-GUID: 2EMIxwRfT3SgPsHfiIsdyEDvMuJj8vR-
X-Proofpoint-GUID: 2EMIxwRfT3SgPsHfiIsdyEDvMuJj8vR-
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0b249 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hpE6E10lv6cxlDq8Q4MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX6bYuQmxjEAQe
 aoHazrLPRV2YWRFdqJdoljh8yD4DpFe3maTKbpLIm5N2glTqu5BuNpLDqrS8SdCabQwR4Y5/swT
 XMUqXYOT6ZSxa5iI4WOFZg6CmIxXuA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043



On 14-10-2026 16:02, Jishnu Prakash wrote:
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 

-- 
Regards,
Nihal Kumar Gupta

