Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA34EB866
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055478; cv=none; b=T/MkGzsZlRltv3b8zZdgQVbD4o40mkhTCG2zMkvsh3OrlfAG557Bqfv+Owyvomoexd3oqORrKSSrpunXo4DlHlxGjYw6rbC3Beg9QmFggCLI2uu7GQRl1SuOxoBeWczsZNykHOGGJ91oFzuP5UazT+h5nG7tOFZL9ZJ5EeX/Owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055478; c=relaxed/simple;
	bh=ZP/V+XVDi3VU7pwiGc5G664R30B243PanFs9BryZBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvrn6x8MDLflwW7T+2b+9ZkDRh/mOwRl5BZrjJ9iJoAgiCHHYWkMOy+cl0ZVnTzOMgIY4NnITdQUx7Dd+8KnjMbaicE0I/9XavSyQ1ku6WiwWdhwm6EIvfuOdeAUhpa7jWynWpKapDRffYS2OyIyc5JwW7POZzkaVOTP0CbMZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AogNQwqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Giwaak3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AogNQwqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Giwaak3Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wfHS1889621
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=; b=AogNQwqAZL9D8O1C
	72ugis4zGLSjwVmVlHqQ1Uw00SWq+/uokvuCnwPJ4aB8NypSYZHZeJDIwBmctMpu
	6lNEHwWc0Fj/+qoWLhn0wuiomkYXSJ9ZyzwaAqB73hR4kFiUyjwavYrhCRtcfwdh
	bXQ2km1dFQID02/+ouh+RwxshawH7jPobd+xw+LD+/tLOx9l71J5cLA9NcXaS6JG
	E3fOykxNof2Ai+Jx//OIEpucs3aQpydwLi6seB2vSX+y9P1y3lNLc8JsYbnZdU8Q
	Fm4sRaxUSfXOeEqHd+WLyF8xXWXbrIRLpk5WStKRD0i2/7dFhMnccPSAV0z8q2go
	P0JDrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda175k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso14690751cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055474; x=1792660274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=Giwaak3ZIwgCXsYAfg/Ypvhw+degn4csvsFTBl+9EYACH4u7W+Xh7heljRST6/mWsb
         jh3ptVnOkwSC6dir1M2TfTdlLMZh/wjzGRVmbcwVSwnDgSEVcOZ82wsWemIGmMKv63N0
         /gNyDmyn1TyaPd69cogGjkGkiR9ij4hH1EBKQ4b4gS1hUmidj4nGT7X9Q9KRlRRKqKvA
         wpSx9zeuUyML+sYFO6zkYy9ILweKjH0kdodqd1E7Pe9iX/PvaOx1o9naTdXfwKVaOrlN
         cZ7Vopg0nkNMCopWhraNTd8qvM7dMIV2JhAVesj0jLL+UOCKgXlwNr0VusO+u3s/wo00
         tQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055474; x=1792660274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=itc+rPMcRK2GoB5HPrCv3qDwcbw5hc3lCQrY+8uRgjvc9VPe76O2facsHK1UtVCoha
         Tu1mXf2jUaCpz4ww0iRFIl6uk8XsftZDCm5MKr6f0MbOPKJ67CxjcVltrL5RDVQw39b8
         xlJDjDZ9dBnGw+V2j487YcOqSgprQIt4Zjdvu3cio/ELfb1e/m+CI0cDJiG4tsErxL89
         djxmgzH4ClQEfRBYX7inrIUW7GtAGyiWeVl9i7Dr2Qq1l5EO8N0PiTcl+jHh2iK+Pu8n
         qQ0YX5JqCXaaTEfTCI6b15DscbIi33WCk7PUFw4F99EU+8CDSmGgSafQhXKrW87tAJLH
         +epA==
X-Forwarded-Encrypted: i=1; AKwUvByoc1iuKTQbY7P9nGEFQfKuW16b/f+jzTjPJJSu+/bXNySJSx/vzAXpNncOBODokiXDyGH6GmDLLMPuaZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxtva9F4COnd3kq6hxqCgIuZFigOrHD5tgiwJnkJS0o5GBytEz
	zSb9sd9n3B/78U5V0rBI5e66ovgqX+j2DY8yiWOOdaxiuuGWVJu03t5So4z34TX1Gto50o0kDcj
	Iqpsqfzieq076fRx3YCyYN3GGXBCAbCkvWBI3sWKi/uPhsyKH1UBo3pBaZnOzc4qTaNc=
X-Gm-Gg: AYBFou1WWUfRXucghofnPng4LKgqvFXugyBZJTImzk4ajGnn5lRsoMwzBgsBGrhllwL
	zsGbYlblkGXvlLWExhJf58SU4Dee+xZQgphCS/MkxWgszyHcY9sTYIusnripVnD85N9IMQuKky7
	qZK6c6Hjs6yjLumcVlLmLue4GHAf1fJCsd9EmsGPGT86OE2teEeq1pJP3ib/stplUZ0/DEQuWvo
	vsPGt7xsoYdtRRaCdn7oCEi+KT3HwIHBRDElP9euLjBtgUYlsbCrZnL9ZEegnHliLW3BSjG1uo7
	DU8cRbYod9ePxaEWESqNFcf7HcifijtAYvekOiL8hp12v+GmHEsi77N2SLgk9rIntGEGceoJZYc
	ktf+/rKPl3iNK4jj/eRAzhA==
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94187911cf.5.1792055474044;
        Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94187711cf.5.1792055473655;
        Thu, 15 Oct 2026 02:11:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101289466b.83.2026.10.15.02.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:11:12 -0700 (PDT)
Message-ID: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXx4ZULFK+pDnY
 WCUPGH8WLZLNFrdy73Un2oa+HAISm1fCLlrWS3SVMKxlhRdZtmKg1usQ+0KgSxQTWPW806K5Ea/
 ZKAlPK39qsP+sHBx+qkukteURgNaOAw=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad098b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mAFRzXhWWU4R2_A-WnwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: yG2InErhEzfq79J7dlVIxTngKY_21xpu
X-Proofpoint-ORIG-GUID: yG2InErhEzfq79J7dlVIxTngKY_21xpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX7lvyOLDqOGkV
 JipJ18golMyU+BZRiHkMTCNtud8/LgVfAzXCVP8UDFBUPmsinnkutD35Mq0ejKJdUCT+gxkCpBd
 ev7SQrI1lyRZr2SQIULtOCely/hJ6dTPKf7Gaeb8OzYW6Ui8MJ2CfEo365/QpTsxAZezp9ObJUV
 TnuuhIhZB0XyJXXSjFaIiExyRCintd9OIOZe8SYwvAolIQJZmxZRt4hvKqRBuJIfNiCJnETO3XL
 6L14LUi8AFnhLcwNZhu5yX3XvbSMgC+g6cOZwSFWyk+MdgLst+KdOXwqaX+unx1eYhdqe2v+KU3
 j/CjTvi+/cILa+0Rw9e08cbzD7Rl7+ifIKQxDPa1Q5Yk6YOWhxU2Hsd/uEmmkgTLXk4aE/to0Zf
 7cuTxO5Due66nFS8NFOpYAlWOAlNMNMhYZSNM1RbrAPOdYOgeh+GmOz307yOEeIdlfZS1YbdzPH
 MyUrY3urKw1cpKFHrFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
>> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
>> the wrong address the mux driver fails to probe, the Type-C controller
>> and the DisplayPort controller keep waiting for it and the display
>> subsystem never binds.
>>
>> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
>> Assisted-by: LLM
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> an earlier revision of the board which routed that differently or
> something.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

oh wait.. the previous guy (author of the Fixes commit is you.. :D

Konrad
