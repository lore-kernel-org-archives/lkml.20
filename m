Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780480;
	b=1eaIBhkrhw0FhRIP2UeyaT4sSKfO9vcVOkl4440kD4ISb5IO7R1f0Y70QG6Y0Poq9me1
	 N/BVd2Qp9Pecu54/ypQPuCEo57ZyF75+vqHvyVhJ2LgtJXue9HkQ7sTRG8DZ5wyQ73khm
	 WQCWnWbdmbxi4vl9g6lURf6uRshpG1aR005RsLV2rek+Zv7EbCxsHkJDiEK1ezhICzWTe
	 pP6Ezk6qfXmDskGWZzp1b/RaZqmTbWWOtiBA0uj0P17ymfN+L49/AAD7v3lsXt6CfBY1o
	 zEMHSPvwAIM6JPUPfnsNq7OONorQ75yLCLoOdnTFwp2hlOpAAlBkp4dZ/hbpBhkIflA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
	b=sF9rTC9mzsdSMH1gu0ln6WGUFKu2XR04eJ4wzNb4wbnH0G3h0xY1xlCdhJ2PE38rXzGu
	 lgsfWWXP/cfB9+vERAKLhvCqCkkU6S9Ik1eZJaz0aUWIqn7vzC7HitwYRXM/d7tBZyNk2
	 fo/wUbrrkz/Wa2QUU4ecwlZP9iD1gOtBUG5iSR2PoibfD5Y3HlB7TU+pJm/tu1LHKuiM4
	 OZD9ndvrLu2tac5Hg5JHZvlKkxPCTePkkI0mZ415zMa9rIc1QJ+vq1/3snXIzSGzGF39T
	 kw8iwoBrYnBUJhtFp7YyNuufEx61/1UrzyNEDrTkVeuc7B7Tzs+P7byjdB5UQuRH0CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D4A606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFLmFao632960
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=; b=cKU4jBb1oLOwttr/
	x+PM/xgG4ULXw75e8nVkQtD4VZzNqylIGqUp3nRwM2qXuZQq3TQVpklLE8pDkI6J
	qFCN4F1i29jd30aKeAUAYZhlTqoGR5jUs/9Q1VIjMzqc8k/rbiueb5Soj4Fih6lz
	EODjcHq9QnuRk0dAHzcUaDUtWEwOr62PyLbjSZgBfmPO1MUPHcNSwnnSIM1LKzjQ
	BTdxvficyIc3w3j79Q6qs2d9gfpzqbzbFlm/OcwIcQ4f8vqI4S/7KnkaeRYhG0yh
	TJHKw9ln7huNRG6Qwv1SpLqTMdNX8IR4HL6kwbqN6Ar+H4TigrzLLaq0YbKWMAXG
	5jbM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhduus0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso587960585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794780478; x=1795385278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=cwMlpBdjKKbckSpfK9lRkulNcgARW/rozdeQ0ZtTFCbnsQwe+ko5dx5br12kCcJvEZ
         EGw1vQ2BNEuo/8Z23F5j6LSgTfUfy/rXTewT2hGclNaTQFQSOkygrv57a4ZhOWNlqodz
         eOEIS+8Kbem47IxV6IKO+0uQIA1UGgrZRpSFdo6FSMI7kMfJqmLM3GOS2YsB08ELntmA
         TGE4IJ6QQVjyE69ERKrxVKzHLVt6wpS+h57bSlM0QaTGwAvk8fEzeHgHnjo4PXkLx3eV
         oGwNXhmQ2mx6XytFYXdYhTRmEzPFMhgmHmzxVnGIX7LBfeDsv5+DqvEFS6oJkJldJJH4
         q1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780478; x=1795385278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=IG5m5cLnnMTTlrvHdty9kxaLf8SkDi6vw6yDcQfoOOIuwV8rRMrpY9DqM80pmBubiF
         F5buLyEEDacZqpkNEdzSfRS7cY4h6+REulVIs9n8YuzTzZMHGpFQmtIadKQS8YALAkqP
         hoe8Vzpgct1rXAl7yv8pdfFq3wsE7Z3t1BYMbgXDUfSvtRjVOH1/KgciOHhHH8SnyFfn
         Nkr5gOfoPJ62dXxLPvPyY7nszTwwjs8VzCyIYiLZxEmRgkenJGG54R1cfYnv2la87DJM
         OtvHl5t76DV97EBD5p82/a4t2pqNE6cliuy4WdTmftIWSg+F2l3jm4Q9S63TbHBX5OKP
         b6Aw==
X-Forwarded-Encrypted: i=1; AL+hErESMJFUE7xiXBzCBNF/Sz8/AhYP9jypBq+EYapPyLwIojB9cSRVsbhH0Ypj2Njh7sPq6DNeBUngzbTdrhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lTYa/N4Y4RO7GyYD/KMmZGKvZpBuNuYoydUGQlFb9wTaIXLIk
	am8F0B2YMOPGylct6IZQh8Aw6zyQJeU/7y9rdH1oBKpTtFByNbixD1xZEJVET3cuGoL0VgcSBhj
	fsG4iq6pyHZFDjVDH+ZtphbxhI3SkYPLRPvuVHBCkY58XzK9mJYxcpUQ57yGgf9ZPm/I=
X-Gm-Gg: AYBFou24D6GU2gkQjk9Tqa7eTNQy+7zirQejLoVe8KvF30bxSRyls/MJ/OcUzPbR/vY
	2nu0q7LlBO/FWcE5xl5673CF8jPJLiBlJp/xzoQaj4ys6lRuxbDLE7nYBQrEtR76/l9uB1UsVPF
	BFFyoaoaPbsCrnJQZH6j5IwN/d/n/CVs1CaQ2sYAhwFMnLqZENd2RoGJt7Gv45ltPkomcbc2W+t
	CDv/BwKqyTb9iuo1roqyMxXdGs6QzmF5ICxbPWCl9RcoF1XDXVgcAtV0zqw53ycLx2Sihp4KnUC
	GGq60qRm+LtWaTOwSZ1/YMKncZOhhatcY51RF707tKUwJjkK+9qIls2A5zKlzxhgT5YR9vvmQcZ
	w2KE01QTIYza0aXTdDwaUdxIvx6a3gwr9kcJOsMY+j3Usv0fJMOuNzTOmfD+iyWW1mzZkYu0ymW
	OJ
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51589585a.7.1794780478253;
        Sun, 15 Nov 2026 14:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51586885a.7.1794780477782;
        Sun, 15 Nov 2026 14:07:57 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm19639489f8f.43.2026.11.15.14.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:07:56 -0800 (PST)
Message-ID: <65e3d2b5-a48d-4ef4-ae89-68a15ae7466c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 22:07:55 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261028163152.26892-1-fabian@fielding.dev>
 <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa2d3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2dS5UIqEM45N3m7Sd7gA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfXw6suXON/nHit
 GORi3Bpm40cyr3ELsMh337uKrf0wjHYQ2WfY7E6y5/SBsGyYzIGAUUclMHvlsy1eYd8jiV70Y1X
 kNqD8QKj9SdG9DwSKvGG9y+iXEyYRL8=
X-Proofpoint-ORIG-GUID: yv_MZGbwAC9auTO83qN9tuBQF0Lp1Aqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfX45/9p0IeDT9h
 Xcw5N974SxNDT6uF/DtqarhenE1GpbxJ0d4Xa+EdOMnzrEav/SUMhGZVEjMxz/jMkKxZeuHQXz9
 vNwmIjrk6PM4DU4bicKsejLAkvDcs+zkbNCI/ZW48QKUvBPr7SFBr53rAWx03OOLcKL1bpkfakS
 CWDgvIhDdgr6HRchHnt/zsfgVIfZ7nv4Gw/4L1ZcF3/82RqChaR4eZvwbDtKmAmDzPX5XXz7Gt7
 Wg69PR+N8jZTHxXRcL+U5Qm3cIiI0Cs+zdrqcujfpmXCsq1ch5yVO4/LBf9QFt6uP1prkp9iT0H
 NqtDbmzdLDELJPkxPVtLsp64ve0upV+tXBcwmgwOfrELC9xhP2JKtlutc6T87JNX9huWxYFBm+g
 3c9AEHgvpH3lzzgljjDQQmq1MADhusmtDvSZT4V8RMftIBSHdAdZiMxML5wT9E3ErRoz+rIYNfl
 mauUpV9wk4afBGy0czA==
X-Proofpoint-GUID: yv_MZGbwAC9auTO83qN9tuBQF0Lp1Aqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150088

On 10/28/26 9:56 PM, Srinivas Kandagatla wrote:
> 
@Fabian,
> My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
> hoping that it should work.
> 
> I will keep you posted.

I have now managed to test it on T14s Gen6, no changes to these patches
to get it working only thing that I changed is dt and tplg files.

thanks,
Srini
> 
>> The function allocates

