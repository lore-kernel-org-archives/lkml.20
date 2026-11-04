Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795416;
	b=Df0wbrgenHlv2/kg95Es9DBw29U/1gg2Yny9zkbbnwwyxuZDXWMxM823sJqoDpG2RKK+
	 FHqU00KQ50M/yEN2woE8DdMUS/nUpF6rOKxpqAa2GhpQ8d+aDIkpYB5gCpPpfup7MOY2y
	 Geezb09C0Dlab5cqf+gpwRw3so58CqvmE/FatdhN3HkFjwaGf6Km4APMbRR5s1hSx+PgP
	 LsKO2QvKd4tHezZCbNMMG81FuYUSGa0IR5kUhHukOSaD5LR2LVVviojP+eqb1e2zPkms5
	 z4sqQqMawi7t5Fg2CRHbS1/GuPFwau8Z9a+hekeRoB+uXndws/HJQS0lIfk2X8aEBAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
	b=tbyRKoFO4WRFSOR34XvGJcgyoPpbz+SVytDRxF/Zs+9QjEhasGfR6sJ73FhOfdE0GBg6
	 189TJGflGoJlm/SkJ4imkpPJaaFaa4/dMEKCU1WGu/uch61le0ng7r0k+PSBU6jkVHbEU
	 AyJQ6DzxPthSjIswGcmQSs136Z90YyPGaY5frHDfTBCasl3C0Idpl8K24O63rvT3li0Yz
	 nt1DfK3FAyN65+6FLkWrUBpGGMXLm0NzJb0cD4tMRuHrnNPnWNyxZcnPgHNBECLVU8qoY
	 kfUmpI++rI+WLLXDfZ5syjAl5j3HoA+LI6+UUb+xwD8Xf2Mh9ywF8afh2FrwZFbfnlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzNTiid0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C56606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C56606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQvOdCw8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzNTiid0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtil2667767
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=; b=OQvOdCw8iR3/Qpcn
	RAPANZBLVtI/4IxZVS5zfn5LSC2uFk+caGz9dlK9yy8iBboSuW3HwgAk5y/p8M6A
	9GODdQVIOi0k/CkRvH2pMRxgBrc8A/qXk1AHvf+KLtBmIj5Jq0HZlsSGwnAkhvvF
	tJnmCZL1fHdbWBOmfgd9AGgnZyDPuW/QT6fmi3JgX6ZlBYAVcWblcVhd6jHGPtT9
	0mwIUMAJ4EWCi5xJCRX4gP1dcYAYMx3tK1TPJ3wREWRibA9q6B/o1GseqSgbFYhN
	hjBeNFc/ivN0vf5iSFdKM1ehx0QFn2kolc1Pnyc6Z0EmhI5D3fwXuircSH23i1JA
	Z9I4PA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pm3qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:30:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998c251cb7dso16313241.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795414; x=1794400214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=fzNTiid0T/kQUlFUr3fUVq0IoOBStEJk3apy4DOIW0ZFGd1Tnv6RzPGbh/IwWWnL+j
         +rY4cTVBCaMbf/O7r/+hw8+WjxoLbsAvGZsdbtgZHp53LQ4k4pniLqlYPA/vP0PB0MX7
         DQr5ZwZi5uTk2U5pgisEcQeU5/CA1W90sV+z68UmX98DPbsNid1VGglgWTEtzJeMJgez
         w/kVNOjaALIV/2fay5bNZ+zoZlAHwmFHGnX8DvJqX5gFWGOO+YQmkUtRRSJjqurrrGvU
         x0m/SoHfPDQap3GDe8MFwin+E43FhI8SSK6oRaxbLtjywKp4KmN7A2duI/WLmdGdWF1O
         rdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795414; x=1794400214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FWIVcfNvM1BH6jx2/YFUktTXPiOwChfdc4XYcwe0FU=;
        b=rBJ9Asi0RfP3+orPjWsNp84WQdZ7knIVsh0oI7C9xQQs3nkx2J0Rx1LfUce8586LDD
         C7BcmtHOA4CNJk/a5ZZO41vBsp4tDSiLoV2eEckU65r0Y5LOcfkGPL78a5FzAl0G6PG5
         3Dcc4BEQ+lpkT+Vre9IG/cNAR3imz/oCFNFyXD/ECEF4vupU/K4cZi5pUHEZlftwDS+i
         VtBG5Lh3q2yoPjx10c/0fGojc0j41FzEus3PZTpbXUp/JjxmBzzG8YvLACm1awa5y3Ta
         c7QOyfZSanhv+a//JHKm4o0I5O1dIPi/9H4L080buHfZwtsQdNNJV+EdaPnvrAvDhnrF
         fZqw==
X-Forwarded-Encrypted: i=1; AKwUvBwSK4GzQAvGmeQKdY9/vfTj210psGPrC1zZvUntFBzXtBmf18WVxcmjWTkH8Nyj1FLdyInKLrlU7y/NdEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m1q5YX3bP4eYSnsmGZz61SBSiTwzRkOFPAhtQStUQjXE6Vhuo
	qF2CpjbdJP3AxgbTUMAwkfRf0u86EOAS7TcmdC6c4t+K8BUR8WicjwZtGRipLKAaXZvf8eQAhOH
	gm7582lsBl4UXbuZCLTsMXZzkiundzjMBqU6OKDfIQ6s7NGXvPg5VGae89c3ZnIt0TdIkXBM/xO
	o=
X-Gm-Gg: AYBFou3tamK9MLk04MekvzK9+Wo1MO4/6hwDHYRsCMSnSq78wMpD6CNbjCcIjIKYq6u
	yrFv97qdA/nG3I70VQPJGf7AvsjoRnU0SuZr6gu4eOe6SR95ncit95nq4mGWlAhR/Rm6ksyJWxj
	BTShqQ7ouK2hMM53PW31/ECsHypYKqXkYGIq7DGimjPhUxL2uAiQxTZij6AbVpiGBB5n5+dOXA+
	2auk1rJz7ld9qUzzJm6fvvKVek14nyGBfWuAAfe+FmJTgnY29VbkUEJx1dbrEXQKM3MPxEjQldh
	LIkso3I+etexCV4gppo/ucHpApTB0gYZJuil7I9nz2Rya/d9Vi9qTh5QcMO5dy2bYWPeVDBOxZN
	lTBxnxfidGQNJNokdH5/Pz91HwXbvR7tPUVDxqfc6N4iTQ67s3nC3oGF4i2KcQ6/bPt54
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619482e0c.5.1793795414036;
        Wed, 04 Nov 2026 04:30:14 -0800 (PST)
X-Received: by 2002:a05:6122:12bb:b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec6897034bmr6619402e0c.5.1793795413275;
        Wed, 04 Nov 2026 04:30:13 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a48f8sm62828266b.79.2026.11.04.04.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:30:12 -0800 (PST)
Message-ID: <2d8f4e21-9ee0-4538-b5c8-dcd159d40dd9@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:30:11 +0100
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
Subject: Re: [PATCH] mfd: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX0fGBG2XieZx2
 58z2Ybw5kbRWg6E81cx2PkSrksb195Z6R8VfK+S1l9mXB5dun+iIp9J5ne6VFlgGErVzVfCCBFU
 cT5A6Kp1l2ai74CKev3dbKIcfqSQu+ltEv9QZA6Lf9uh82f9M0N/Tl7bzNgBEF+3xt2JA3JKXaj
 Z0m0PuBzPLS5oniHA+DDoV46hLgk4/xTTsH7oEyoaPCYq2fzSNpZBDVzkj6l01KRkh61IkzRJtD
 SzLBZjwLDMIGa0QSXlS9wRCWAGsYtUoAaRSv4eUQVV1jvBNCaNKjR1Y+dQF+i/957zJUWvHZZeK
 XmLLV1vGFO7Lgxp23vOa7MCBlG8xogp3YmXOfBcGxmurjsfcZazy6XkmnUTlRNr3aM7zSJTAkaH
 qJDHCHKuT1gfjEHUSvXVW82wa8+mk8xstIg92geeY6QK7Z9SAyOAVLkRyDXEeP/ZFoVuG01oPEK
 wFm2S8V9f3Xo4tkCqeg==
X-Proofpoint-GUID: -FdnHRiVeaMYdy1eBWFNpwYKN5xONZT0
X-Proofpoint-ORIG-GUID: -FdnHRiVeaMYdy1eBWFNpwYKN5xONZT0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXw4TfUodgrByd
 B/2B7Yk+t/SC9UvLsgOX9T/4wKTqCbr15gf4VBUoiRDUqqfTkOvKXdE+PKdSirmCzXh1mgDeLt0
 K5Wg1SrX0VSp9Pbt6HbGvptVG7sfnuM=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb2557 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=DqZYlRkov0yPPlpfqKoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

On 11/4/26 12:33 PM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
