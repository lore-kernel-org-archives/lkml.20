Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501848C8A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141452; cv=none; b=BWrpWWoH73Oo6eG+YHeJ//ZDSfQTOAjfc0uR45hCyVgQcX52qz8dT2GYgTbFiwIzLPSz07w5DDwJ2Km9Me5maBlr7DGvuqdNHmgCE02pBE+WCXqOjLWEjPkYs2l2eiLbFkZoyw+WZOviICiP0+wYrfq5cdU9L4MpCh+2YBavnGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141452; c=relaxed/simple;
	bh=5rX9hvTS9mKTBg5ndn4tdrp9BOneSpV/KhbdJmbZSZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opc2f5L7u+BmREOvbxZl9K315yt9d4847DsT0xR3XaWsoL/ZoC484qj1ejTOSeAIXHnptXNaJEEx+hMmXc9+dj6olOnNepr1cwysLhOHLnjMxyKH4cppdL12ODkR+rWgp/t457pbehM0lEveRCIpN9FV5GlZJCAOdix5uywgK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOFmg6Df; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFGwSyml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOFmg6Df";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFGwSyml"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAUC222596
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=; b=bOFmg6DfOzZ8hu62
	ht9ozoFEEXIZONOEmavQTDXyjm4WyzssQbnemWUg8la+WlAry4sg1J0ufCZCxBgi
	ndl0LL4jG4IJFWUbWNILJv837dZVkIewSsMbOdm8IPyDJiaw8OIe2fFwdMihTL5q
	vrKtq0+2mdPsAyw3Co6sh7mxsA9Zz/GvyM2w864AKvP9vb32aH7uRh0IU5H38JwI
	DuviOCQwdOr+GmbNNm2XUnWpXxU9ypblAqBnxZJJnEKT3vVoDyYX8Av/1tehIssz
	AEw3vO1A4VrpBSP1kTRW+krvLUvjenM5cTArYRWJQHtv5aPdBDZm31oZzTNSyU1y
	5eUemg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdragwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so61896e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141443; x=1789746243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=gFGwSymlPXukZn4jccqTc3Uhfe2ZNQ9ik7t5smCeb5HLwdwCMHANG2ahmgtcONw81+
         pddK/UBrxVubjZzPSJi9DT/iCyzhtE93Dut426FmVwvXTXgI7o6Pe2Hb8s4DC4EKmHZ2
         FE4alxTDdfiW8M6XXbfkZv/fgbdMVhjz4x2NsRPXwj8M0iokkL9YgZWtJfDEUqGOQLuy
         rLWEV1WuGLCiPutD2JrTKmuqpHNpOgguHwHSJpS40L4UO3VnzExBanFy/rJtJR1EirAa
         ayMvEhT+M3W8QYFcw3AaiHKPtlz2pnA3CUSCmqZniidsqcKRP94dckAjEGLX1ixvhof5
         vunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141443; x=1789746243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=kRmlGof/R8wmopfaRMij/OWOOWsmJ7s7qMWHwIJ9bkejGJDX2+9sgtHFlQ85EYZC72
         ZMrE9ojic2H7f5YtcGILtSjlzUQe/Dx8g2Cl1n1ZGd9PMOoJVGqNYQwG37RKNWoBGYbs
         So7p4eLYoOoVYhyD1zNk8r7a6rnrZeBSdv/2QlzCxDsxR7tgZdmP0VyGSN8zotbiSwLg
         nskf1XUaVTtigMT/Lj4BCK1iEjvnHK/HPgALyOZk8tweXfw6cZP4TpCjc2NOeYMZx1PL
         Z6h5ZNXrpaklkgYoFzcYM9L6XsNRGtymnOKgRMLOCIAFMhIHZrswui/EnD8iCn0hh1g2
         POvg==
X-Forwarded-Encrypted: i=1; AKwUvByPfcVubvnwyLpfqoAkHXgbF/ijtUMpWpwtIAlRb+TM1b3CSogL7gW/fUQVT35/g2ovxBUCAPUxv4oH3f4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSOViIK7CNTSG4AFSUHxHAgcgUQJY78k1nCTD+qepuR9+iFFVo
	uq2xO9w+BvswRhc/9amvnKrGm2i7bxqO0yxtAg2QCxKHy9ptAk7h0aPfy6IU+TTlrJmGOJFu5PL
	gTOS4fkbX7jIBIf1oR/Ndy/KDS5Z9vY57NjDYnCwVgplbbRJAxPENIIbto+XtsoWXgsY=
X-Gm-Gg: AYBFou26XdQ1N6hzdEbCifZSASSRLjs2/0xJ8FYMD5EjYsQvtgn47rPwj1seLlp7z8/
	6dvo+7DGznohjqrIyL8AUJr6OfleN0RtYnrpb848etbOiqxrBVgMJle5ZyAC6vDdFGIP/wpy4Vu
	sIt29BleMO3JzdzDULpva8IaCsTe9ufsul9UFd+LvL+Mq9MwpmkwO3tgfHQ6dehOacUI6AUg+f2
	t82im24woIYeW4jR1suA/Sc1Hx49cw9wadZxsnY8MJWKIAhu00fG/irq0SCJda8nZ0yYdV8WTRP
	jJW2GO//5tHxWpAvlRdfWf7GLEJcuYBpDT6aMYKT1pGzjYIc/jByySx1vkK77sSg74O651l2yep
	MFGBbHBe1iT50+t+pKMN2XA==
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr511029137.0.1789141442980;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr510990137.0.1789141442547;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296598e8b0sm100060466b.0.2026.09.11.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:01 -0700 (PDT)
Message-ID: <2fd56aef-6a03-4af5-898d-8a57e7034600@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
 <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OWL-rscuU0ED581BvpfY-8S2MV-MiPFQ
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa421c3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=T5nqnGCD1gggo4biR1sA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: OWL-rscuU0ED581BvpfY-8S2MV-MiPFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfXy9IIS8EO0QpN
 IpF8CwAnY8fjk8nL98EjtSYCRCqRq//wihiFvnA4AbQoVWycVUhY4KFz8v/EL/RuzzuhULnLqN9
 JZU8XEemcbzOM+icnmjtuI3fbjqLPWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX81VkdDlG1Cqm
 GyzVBna5Q3i3ggTbyhGpRfAlACtJbzK0WOfOBmgdF13D03Q/Fx4hcRd/MdButBoc7BQDqse40El
 f8XHF7OScpgHcHQeRTHXpjxCgy+9Om49Fd6ZTsg3yavfDm0E+4MqSSv3PzKoUwBZ5JGl6IYHE6l
 Ph3A3d6zFEQKChiAbh9fzyJ3MMQH5zRNriSQqJpviKUImwhilXv4wasP9gwWsGDMIu8mDTvUQpB
 LKQVNx8bVidOnW9mAoK+DUhQj0YoDQbec12Esi7dWLxoSVsNZG7BgjPH9mLQiVmGbLWrC7FkXgi
 f42/12FOJsMlLHGY6o0tSc5P7eeeo2u2sWGQQXYXh9UK1euH5PYqYRvcjsk+nAdu0z3gW44zDCY
 bqol60SIj/cxtpIhPCUiFqcwH5fHHmBbqzRyJRIX+p7ntdOnrW5yjbyWXqNT+E08O20JwwdrGIh
 ot4t6qrJc4VXe4TYi9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110219

On 9/11/26 5:16 PM, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
