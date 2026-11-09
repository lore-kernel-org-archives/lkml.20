Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222391;
	b=Oa4x85dovZqmWs7rF97frPXd3Xn2dXrBbvQic7YoI0TtIiIWoRHGnStioxiea8aNPih8
	 Wm6VZ9NbmBAVpPjtqhBv81W++1VAy2NaZ5arWbMcNUxAlNFE8hfv++ZfaRmjx8T1QnWVR
	 q5oSOksmEMbivI6Ek/cyfLmHjEDq6LzzY81eCPSsxZ+uRBmk9u5Wj2Ejw/27jb32tUsPq
	 y0wYqNDW/oIS5aVusTkWNkdlMffTytbXGuKYL/Ai3zrLQ8t8P2Ui9PXsf8FBOkgHcOFkK
	 gpFyXgCLWRzNYle1y4BzVxslN3R3ZFNiwEF0c/L5bSqfoEv5qU50oTelM0PZxzt6igw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
	b=esHr/o0bmOBFQVMdzZdrUZBQ/4vzPTXXg25U8N1P0N6axerd/vCg2SZbsy4FpDvN7d5L
	 giGneZkiFDT4iOAiLKBJ3nt+oskB/yCjphunG4n0cdrd9cMnw9bH9rSSV6feOddTiZKvG
	 2APJLd/1tgDgDQlrkwtqCyF76ApQCcllfvSLOhtssf2huV4gWSy5bUzWy7S1ZE9rYDXk3
	 WEVC+32FyU23lPehd7t5lX7ohfJRUaqUkSLZDDgGzr4dzaa4TXki5f3kNXcLs7Fzla1Mn
	 mZiBiH4Jz7LqVOWKsgzQaOIbqLnEq51tMD+4/Bt31ecXmRHxkHhV/N5lCow2+tmSRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E115606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E115606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99urJo3163798
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 11:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=; b=nRkS0TO7MF+qY2hN
	q4vCsuWAzCc3xJRHF0iM01cb48E0wsANfmQtjKGnq15nZajIM/6EvDU4w38kw53c
	vU+Ma9dPr2FyvtGtDkzox4rs7CIrgXT1pKW1zIdpI6SP4COcwu2Omh97S36EN2HH
	mcasD5tJCOZLFJYbuxW58x1S4RontuFyuV+/LPO3XWCFK44dRlPJBrfUuEQ2nU6u
	MvS37Ftn4N0qk/MZjItIp7r2X40E50qNFatAdxSdW3NhVPPTnlMt7MQxZmat4ysw
	JrAfd4j0KyELZeyBmVkaEnci+/ebl77WFmFt9AYItBaujloW3SvJgj3N2MFw9Yn/
	Ll9hBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ntxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:06:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso17916185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222388; x=1794827188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=FM7RtreP0fF0YudoAfpcz6PmoIkct9fSqvdhXamOp/pb2OJ2jlcJquyaPQ/FePvvK1
         FuRyweIZhpAf+UmWAtLt/aT8wZaMUhRyw0i+l9FgdqWmsGHo1XLdr9qyhbZVqkGRsErk
         K2KN8ZJzj37HopXNnuh0RmKM/LMGyHnq06Ty1F8iRuNFU5R91sziFGrsXOF3XZcK348d
         eM/lGsSXXkjO1vzkzRHo0PRZiS0XtlaBfZDxss3aVJzT7IaDe45Br9xBBX0H855v7tk7
         btaf2vuV1uCzog49Gt3nJc1vipibYkKbf+PiScLS9+P2rxPXHWqvXVT+5q3psDZZyWfg
         GldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222388; x=1794827188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=iXqAlcxqtM/EufzchG+BM6zI4uNJocfWhCdV63rkcyLEYSOKC2rh0KkgJVRgkyuO3J
         /ASlPpvik0xp8Ei7SSBucnHlZH2cpy47ulDRAludK9ES277yc46IpEdS7wOSgCA9GhX0
         u2HF8OSLBJxtvvlRcBFsnGm9ytDv6WjcixW6Fo+0OVOER3uRCbzjuALwoh1DGEEs+aon
         LvqZSs3g+HzTN/NUQRct5mGVhN4T8aslxBKswTafd9zD3RvcB0lnJZDJeyCP0tvwjCZb
         DG1A7j+iO6ZbU09zEaplQxPvfWNaItVNvLXGz7rpd5ORa5iWTOG6cxCIQn0g11usealp
         VRkw==
X-Forwarded-Encrypted: i=1; AL+hErGlQ0+p2ZWX80GVv88wZKk1e4VUDlffj+jqjsy5cEgjTScj/sf30n7ULp748Q/ZEcnT5b5L0dEp37ATxj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sgOEUZ3qTlpB9TYDj11chYmFWAncS8Xm3kjv9Ij1Q4nkk8JpK
	bknZof25oKwMKFXUZ57n/DXXw0cQB7aBd7kmXnEbFDySN96/mLZp3pviA4kmOkf4yOL2ZAktI+G
	RR9o01BVpKMXI0fTRf6rS9JBurgOzUkZ9vItq54C8icrBpFS5rvOmAegbgN7y03QpeK4=
X-Gm-Gg: AYBFou1JQS+i34kvk8QLI8fHpyeagUZPpaCvJTWpAdqFuqXsio/74wbOOyuUsS1VhEC
	tCoGaQjeNCXpvE7+iGKxiG48e5wSaSpABoF7GXLGxHR8K9LAnT6hvB/AFKfKthKGFRZpasrioJM
	BTnS1JYbI/h4g7EVBZ7x+HtRvjP0ZrbJQRq4MF21WImFJ4BF+2cmYzd77kcznk98j3b0bK485xT
	kehdwyLJNL2sJ9Ji0l9vGFRtjiCoyblwaH1RFqpfJM8LSt5/FpLyvkzhQwe8t/HY3K5Wl/GBbia
	bTuutocEGz9pRuMg/0gFUQs1wAJuO8zaUPAatqeDDDS8LBA1YZxHlFHb0kiZG+XcpfVe3jNdtQ4
	9uOx2Twaqv3fBfZojiDQha0XCeGU8JuX5K6+T8Ggx5VNVWKOt2DaKuCoC3lyA/laX1Zr9fg==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514318485a.5.1794222388203;
        Mon, 09 Nov 2026 03:06:28 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514312685a.5.1794222387596;
        Mon, 09 Nov 2026 03:06:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm150435266b.77.2026.11.09.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:06:26 -0800 (PST)
Message-ID: <09cbc285-1ea7-4613-a638-6921afce71e0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:06:22 +0100
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
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: Frieder Hannenheim <mail@fhannenheim.net>,
        David Heidelberg <david@ixit.cz>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
 <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T6q3-Ofg0HdoxUiYJVtcwwLZdZSuHKP8
X-Proofpoint-GUID: T6q3-Ofg0HdoxUiYJVtcwwLZdZSuHKP8
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af1a935 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=WE8o4AYwAAAA:8 a=pw2Kr8DMFsTuVtHO7YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX/5qWyuXu+wkO
 tIj+QIBd1gaGpiEi67J02/n/5+vhe1ijt66svkPe9Yxn4Z4gteqGzyqWJ21L4UwmZpNyDPY7RCg
 aAA2n8xQIZAyN8ik5q0jF/FCZOemjA+bDyO8aTttnr98xpSgqkBBoUloB6OE8XYg2rZqbG0eLuh
 k77ILvXtv7PjNZh5B4SM7B2gTy2yispaV0LEZjcWWhL56iIvHIMTF9YRDsy1bG9jiw59uH5Jjik
 4TdqExDKMMZp0Wc2U74JurZHcvM0WJz8We3vZktFGQC7gf64z+qTWcCLf9VWMVslgozzb9fHia5
 ox3k7AlicFgSd/tGSVXIkCcjRx9W8yjBdLmonfWf3LxENeIxxLFsD/vhRJMKUeLj/yGxZep1Krl
 7X5Jr72WO9dRx1XKt0AtJjOeuUgW29WL0y/L5IYMz/2HvkGUfrrSU2aWl+UWNEc0LHwTutIJhRU
 koVRFWuFY4RM1S+JxBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX0GKXPyGXBwAl
 dCtFLdpcW2xdjoxgslsReqJeNpv9kI1RTK+Ks7JxJFSii0be3/Nib/2eyIbmQNnR4xLO6ycYjIR
 90MXhRfQn1GJVwLC9tAyq++km8xEjqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/8/26 9:58 PM, Frieder Hannenheim wrote:
> On 08.11.26 21:52, David Heidelberg wrote:
>> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>>> Add compatible for OnePlus 8T
>>>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/ Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,7 @@ properties:
>>>         - items:
>>>             - enum:
>>> +              - oneplus,kebab
>>
>> How about oneplus,8t? We can use the non-so-much-confusing product name.
>> Looking at existing device-trees it seems customary to use the code name 
> of the product for phones. Examples include:
> - xiaomi,lavender
> - google,sargo
> - oneplus,cheeseburger

Indeed this is the precedent, I see no issue here

Konrad
