Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575139;
	b=RfUzjACEXrMoa1AhRnDa4pSS6PwkZJFyiRS8m9bHcFbf2Y4ESwnCzkdy49QWbMkMBqlP
	 iK4fQddGWnrlXl+wY/Mt/sOZIQQTjugz4uXdzmXBCSKRUQlJBKFKV9/fQTQAwyXZ6c7H3
	 W6iCaGTXux8G7qBC2jskpzkzJ6KEpg1QRZ+2hEG2f7KsCwm1wx6W9UXxBuP2VK/n9ROAp
	 xpWtF2H0uuAPAjEE8gp616/nR0xie42XoBIHJI/xDaMWazgdNmgWT+W800yiZSH/CUKR6
	 Y+gEM1/5DASiu39rttpEdEYGV2Zt/yD8wpzGk8IvlZEYu4xqvjsGjfbOrx/8G+OjzzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
	b=Nd2YhLp1RpXczdfUvJcnyzoQoaLXZvTqmgfSPXzWcK3KKk8IPZ5nUaj3jbsegVQ7ou+z
	 qe51ef2neiAqKvcHeh1KGeG2Zsfa+bpWExL/Zmjrh5g3JBJnZHhPCCKWuCsqYa4o7oZz5
	 tnXMah/tlCaLSsEpsxFy0CrttwZfAgwvD0tLo6O4IsoQn2hqBnyHtk3Kr9mIvyZwjEbZ5
	 WeHyQ8eZf11TpxT12Ai6cKIM/8vYVLYu5Yg+Jx8do0IW7qtlbY1AVmVGCC5mOc0p2gdLz
	 fZpfeXcrbGJqqJiF37VCycHeqOf0hKwEMuL+qZPYxzFpti45b8espGRe3p4ORoVr9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q9LDIHv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7FB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q9LDIHv8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6BB793349
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=; b=KfvHmY+VjG7+Ghrq
	KYG/RKWC3DY3lCqndyYs427hg4rcmoIbOoM2aS7mwOQL1lySBWMJF9m5EDTDvL6j
	40GH4OHn+LaUzPyegfS6u31qkJJA4prMKnxTsz9J3V/9t+WXwkaShb5XcPDTFRwI
	+VuB80ezlOT0gyFYQiUFeDKJW7C/wwoGoopBtJ0ZPlv5a5jdi7qaU59JuPin9ak9
	4S87pCYH0TAjPsEhwer2YyezJC8dJ+tVJjhrFN5IV68j5wWe0tjsjRCxFB3IXg+V
	438xYp4/RP69yrZlrppcXdZM/8muif03IgJE20RkOyUpWzTGwipuLMZDTKhMoXbC
	4hTeOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk9fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9178ba8eb30so1341616d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575138; x=1793179938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=Q9LDIHv8lTq4OvGuaB4rUaxuI8zNonyvqYqXQEimuCeBkk26qXuFijz9wlvc8lfL+D
         vyEZDK6cx862XuM5yAUCx1UNqrcbVGvuJTFaQs9argVi7W4HJjxtrKftE2TRZK5r+uyG
         RGvLJBF/tKEGWMlajwpcfW9kSKNoFCJXBNh6PU8SQ3nFDXUIBNOd9V/aNXSmefBKSZ7y
         qgUlsInNVXJQGbGOCPUxtRKZ8MlMyt57nEB9l2S9cZEijtdl929fsGbclyWJk8wOj9RZ
         3c/iNmkjKPhgfjTrraTdFkVu01vtr0xeQgSuICUGxFsNr9o4uJ3uI3Q6ozEVIf0mA0Mr
         J15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575138; x=1793179938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=uDoiNaIWBymAsdxoWUv3Nn9Z+XxgpKRUtH/Ineh6dGjipoPAZhu3fPjqBL5qtQssNT
         ljQ/8AG4Nmx926oTSpnHPU7mUNKDY4fsmQ3Bqm5eunCoGIzxSfWpWr3BKw1k1ENrg6Na
         GutG/MggxUzVN/mu6SzaJZpOuQ0bto6lqF7eQePoWZ3BgRScluRTU5l+JB5LdOcyrivS
         FLT/RBDpGrFpUcvmqHHv0T6y6KQ3iwOW5xIILyKAjaQ3ng/5iWLUAzgtYxwTaUAy3Ffx
         sn2LvQeA+MfuKVSqJ/G38Yp7Qj2D8SjtkHvjYrKcePIxEjfh2BxQlVZxrM9+SDDBUfJj
         pRYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxjjcq20bI5PAW8Ye+YmFFfP+Y2HJTgdj9tOguvAahID/wVj4f1El5zABQPazS0rle2HJ/Q7XvXZKWD2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa4sIc1x3NG1mH948mxe8h6SIgcc+YRWi4ftDrRT5eVYB1vAFH
	b4rbrNH+PFNa7jglTEBGA//iQjJQBzTGpyd4U3/ORO5zSdVCBuQ47XXj5phwC1E4d+MVnzo8aVv
	AIUcqa+07zVJwes/LVWwhp6ldJcMEcnYIJd0ZhgnuFm6ZaZUH6xt+YnZsrVRkfW7ylSA=
X-Gm-Gg: AYBFou2kFZ285eGKBoMgIlqlh+8GzMBpBT3i1zPIcRJ64KGkHDo/WuAeikG5iwwrzO0
	Rc9rmmrv2Wkhb5mCJucnKWu5EihxrL1cUjlNrqInjbYmjVOxGVi+PhvD9YsQAcifTuWm8zq07kT
	Ek3q67Fn4FgBup6mcdwpLTaLrLUU9+DUFataIUssLvKAAVbW6CvBrrkP+R4cdMTKsAxnh37bY67
	ydoEk+PbH+gXGEvit/Qb0dcLmjqB2iRUW2ha28/QcGKea5dBSJC2C3q5yaT7XlyTVFFVGX9wtsr
	DsfzjpYmKAXmkRkU6saG+kInWBgnbfWqy9GeMeOJ9FqsAAImtcIZ9eJXKsJ7hljz4/xiVBr+l2n
	+XJtPF3GaD5+p1xONsJvCGg==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675621cf.5.1792575137532;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675371cf.5.1792575137058;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790055a3sm58780166b.69.2026.10.21.02.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:16 -0700 (PDT)
Message-ID: <c7253a19-51d1-4525-91fd-0cc07a4640f7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:12 +0200
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
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX7P+0Bpjaze7F
 opAQiLYemx7SAPGf0dRrrrW7DoBlDjvMewllgj2OZePcs5Bt6h7X2i6vN7MaZOOPx/fBZni1SZV
 YQ23yQchrH+Ig9R1TBRThZfjh3FmM2w=
X-Proofpoint-ORIG-GUID: eph3odx6dILfJnNiYOHihggtsKGUhilJ
X-Proofpoint-GUID: eph3odx6dILfJnNiYOHihggtsKGUhilJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/99UksSol7Jv
 vAwvT6lxvJRAD66dWFrTVwkOLwJe3XohLQ+H6Weh4bm2fwEhv3lvs+v5O0tx2P+61m7pBWshLJf
 QYYvD40Il07kPrGtrw8Lx+yivwOEQOtAX4RmARCL4NIn+1Nrxdlb5P/gbJvFZqztjm4as8RWb7U
 TluRMGDOEqlHmOImhJ5sPQapQ/aTPH6/EKbDS/AhZzrmwtNQ0p6KC/Hjmrtfhu+wjgbvTwjkxX3
 N4x8wmhDYw6C8eBWHDPIqYAj6TPEhAQ8tQToDlD5IW7milE1+PQw2kFVPejMarpVqahlsF07zzU
 0URB8YvvE98NN3RHeEhei1wX7dh3Qc3MILjPXmF55FAQTHTa5S6PkN7OPciCXtBRwcs2qRbGace
 GNSLcQsdj9DQBUQTB+B9LmOWjTzO9XcDoTWM4iBEO7kuDbkvXM5QFPF1avs/KcqJDZl3Tgt7DTB
 ZZh2NzdEKwR2ojLb4tw==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad886a2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
