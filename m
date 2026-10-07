Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD90446070
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359773; cv=none; b=u9yBf2quMKWyG6i1emJWtxPaulCEBEyrC0ZxsaHH3cZ+WvoG5WzyBzg9yYMFc01WvZ71tWviEIMZREWx46h3yqYN/i+gmG+/i08+jKjyeT0ERtRFNgZcY9fnwU5mUA9m82BGxLP/09oiT6YBKnfI98eJCNU4kkKnHden6kpedxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359773; c=relaxed/simple;
	bh=IuXpEauogL/St8XNKk0KwsM5bjJdVpTHycJAZSQn2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVnZKd6cLx9qqqh2nke6yOG+CIbXeA/Jf2z8lUgHZdh0i6Sd9DtHHLnIq2+OT0xFC+TpFSRBcJlAtNFJ4zujw3ycbed00bATTHnw8H7qO+La7cgTAcsuWKlyuiV4FcmquQBQ9riEY5BpU6LuTPoovbsCU/+BUkyiFNkT0skG/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcHs2lAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDAVtATv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcHs2lAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDAVtATv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjNa2970126
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=; b=bcHs2lAbc25P41fR
	eltkj+WGOA0fRD+7F7DbOrI1z4AymXUrkNLC2mIGn5Rh3iwxXHcnaVxmot08vUg7
	gc2q+RSffPMvJeJstrDGTM7yc+r8tBVgvDDqH88ZpawD29SphH859Nkii2XhJu+x
	HWKP7DQxj/9mWQH63LTsAs0ZgkbIWoKjA9ZMTR9qRwU2zoPnRN8S4KxQlseTVm5U
	3478jpm1b/bL9ODHmsvP8dy/bI3PHzRmQNr+80eBM8+atJiGgSmZLGZzu+AbxO6r
	vR1YMUlVU0XWfG4ewbGHNU0mL42pk5VaSsrd9CLRaUfHT2HU9/eYGV9r3vBUlWKv
	BhXMEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6794jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:55:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso721263785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359746; x=1791964546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=;
        b=QDAVtATvsgJIXsla+CTzXR0oh/OcydgVNaq80yacMlwMC+rdQuOj/ONvSynubrST/F
         bHFAsqkFQvD+DLDVg3yNmBhM/hI1WItXD86vdSbAB/BDDhgSfS/OQwQOP86MO9yUlSA6
         tjJSExly81SyISoLPg3+zkextxjCYic2iH7UOIhhAY8mTaDAJTL57vhQ0AVKdhpnmSOi
         SUPiveFfU0TgTJo7zvYVzzYMWiZ1q+9U9ZU/MgxNLB0vs8pEegT9JV63AZTXjE0c0GWr
         wsv3VvGtpiqq5Oi0b315ZSgG/vls5nwWKO7Nf4wY13dGf4OvLVrPfX50E+6s9JNDpImI
         EnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359746; x=1791964546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ326SmaFiOj+nfD4XJq9xzpEa0pXi8pa+upEE/mPc4=;
        b=H8ZgS11qPBAqpxNidu1MFXoRbG2QFaV4v1FmlVZIZutdGFBeaMEkZLvYXpffJQV4iC
         APhonmERzF229uhYYQNUEDUBbLZ1HpUk18Mm4dybHD+OMiDj8GOLeW6TjRp4Rxe+Mg7T
         e3hzgl87XCMopV7XLYmiqFAMKs+W7bZ/GLW65Y23RnApGHcEUVUALNAONPRC9+EgPGGm
         hnWeaLzMpGkpD1WbtUnL7sfZo9xpTCYjLMPv8Tsx2aPh340lxxpP6xqfirx0MEoTbMs4
         Y33EmGBNrU8PQRlJNIoST079z1Wh89UtSz+aAOswKgmfLD5lsoo1xsZgVkxDUAuhJxW8
         YxRA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ+QIYeg7BIygFfiN4Gy8NBFijnJUEHcxR5IcGi2G2AXVjJ5CZm7F/O2hxx+xzNfO8rrIckapbVmVHGq0=@vger.kernel.org
X-Gm-Message-State: AFuF++liWxiSlSVJiKoHnf6/8a2bEKag7GYYzzXpRAjh+hDcl0Vc3QdV
	vXAqsNRSQVF1z9ccWqorb+8yK/4VLYd7tpPCMOp9jjI27VKq4skl3Vl8Z7/6j/9DOJyMm6Ng7Xv
	OgtnfA52wkp9gXaRshk81wcUjqzF9z+gqXetHPYYq8hDESa+kTaLHBXXxGOTGZNx38S4=
X-Gm-Gg: AYBFou1/+pQc9a/pC8ZLQSz8TOn0QL8k4yNVY3CLyrLoAjhK0Ap7uMcOrlNdM02hICZ
	Oa4LFgyz407YJC0ce0MExGjjRcVEtQPny8ohaGJeaMjQjBRDPSFJ63+WYrpi6W5y+J4uhfOXgQn
	6S2xtIq2Wmfj5/vcR3I8gYB1JIrVT39FJS87VMVqcH8ad7RG5te/hkBz/Ee0pO/AytVk3ZHbmWK
	hkgoXUq+WH4098WxmGFktMDduyryJtBBVbS9TobGWswxfXkx8pfCKqiaNXsdYXcemoXul1Q60vT
	I4rZYjcFz6MFAY6UjF3ZMdRXyxFmlunk7NQHNfKNjXy4zqt90maiRu0M6aptrtaWVr2/CC7NKXd
	12ZJVpOMTAJMT+hjcAL44AKRg2077BFym03kfbKBG
X-Received: by 2002:a05:620a:170d:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93e9b7bcb58mr298387185a.41.1791359746080;
        Wed, 07 Oct 2026 00:55:46 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93e9b7bcb58mr298381885a.41.1791359745579;
        Wed, 07 Oct 2026 00:55:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c50f54sm123186815e9.10.2026.10.07.00.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 00:55:44 -0700 (PDT)
Message-ID: <03a9480c-97f3-4ac4-9e65-2636cb51b8b1@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:55:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
 <cfa0190a-bfcd-4b09-a5a5-ed4980b16db5@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <cfa0190a-bfcd-4b09-a5a5-ed4980b16db5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX/+K1gI6rusiX
 TXJziOn1DIgA7VSo9XrZZEQ1NGZ4EfPzcUSMaWSuTx2YxAodRKZWw+b0ICBUG4boyDo/ZQNb/gr
 bYvM7e7JvK6OR2iNfRMIhjupTA9H58Y=
X-Proofpoint-ORIG-GUID: JpyN7Tk5L6tp4mez2jR-FWAHgwJuqvie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX9k+WESA1ur0P
 WjRyhEK0qadv8UETxcGcR30YbXpuw3Nm00IVTksJ9D2RB1Yuaycf5IZ41VSm46Yz3z/42wT0UsZ
 36Z0pXC3PVQ6rWToCX7CgZwZLf9JfM4HmGIitejfWoaLGU5grKw0qMqI/5FVjtQGBsqUxHq9Vdj
 ntZ/VP3pVwG5JoY8IgM0BYvV+HKCgK3w3sdH4ny6ZhUuCXPzRjELIxHG8T/zJwugEZGT5LnPkNr
 kOdEE4wqyYhIH7bO36+RJe11uO04r+972uv6Lj8CZvaYiTvGwgtCRPT9C2acBCdEq5NAvSvatYB
 opANqZJy+F5neLiuiDJlTcFnKEJ6dXFKsMhMkr/RUuGTjAzl6JpCofo+KqzJHbyKfBVHTavn2zN
 BwC0JhndiqYhViqhr1H1ktorWTZLAkwqAMkJFV2UqDVjTFU6ZNnCwLegwzhpt8xcQcKACnhDjMg
 gf6zlTq/pEtGxESAWDw==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5fb02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DO7WzgAb8V_MQCx-KrYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JpyN7Tk5L6tp4mez2jR-FWAHgwJuqvie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070031

Hi Krzyztof,

On 10/7/2026 10:41 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 00:39,
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
>> that use the IFE pixel path. It uses the existing CAMSS property
>> layout without additional properties.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Incomplete DCO.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

Thanks for pointing that it seems that i did not include all To/Cc entries,
from the get_maintainers.pl. I will resend the changes including all entries.

~Gjorgji

