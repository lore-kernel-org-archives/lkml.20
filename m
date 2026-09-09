Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E873569F05
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963137; cv=none; b=e9MsVLsOXyDm5Cbhbz8hwzV8j3A89cmiIzinwxmCyoKDjVmBvrQhCHP1N1HdmVYu4oSUhB2PNqrTQm6MmpuNSLS/7FE5+s7oAWXba0U6VzrJ6Gy/HUO1C3pOFFCE9AKyC2SgckQ6ooRcXfCiR7Gbmcyu/ZHbGYFFJdf/WLkyTmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963137; c=relaxed/simple;
	bh=BvWUGhq18+3DDKj4XOXKcGt9/9H5QQsRsuO5iI193ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc2mGeJ9WzcYDSR83yu4U5IuejqvmP/Bc+SmvRH9kGzJCx2FuaQY8yyxKT3QZSvhNUSaO582na7wwZuYiezLb91EW3y8YfsrV1Yg47Y112eNZqR8FRnUGViRBXeq0F/unicGLmNCZQkP8mRYccWr9M7bwppmxVrrg0t7GSzUcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mve06kLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCCQheDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mve06kLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCCQheDS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU948599915
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlSdF2HOZ+5NxjHLPVwVCj4ppBlOqupjBhscykPtotc=; b=Mve06kLBnKeOZsKi
	Hzeymo+goblE/6clqovkahHG8lF7r9juI7sdgFXISJbil00mdLwcsbNc4MQlh+XG
	WRiPDggvMYBWXhWM2bDkC5kRtBOBVIHbYmGkDMhJN8AjziHYct36+7yDajq0IQMA
	YBwT26Pkdpe90mmKFaavJySoAEd5T9tb3XwnAQtQUdfjeavFm8MhiXV1W6kpvraI
	jfr4FvgMb9o04oWTphqLFrh95GLKitHhYRAVsIKSMJqU8Cc4mJso4xIrBYXKk7OU
	CS3Berc+GM3Kgy5lKiMx+hAaU9vbTO7bzAiosCJPWBbhRBhXTc1w58FbJEhjnMw7
	kyeE2w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2dy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:12:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836caf085e0so85603127b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963134; x=1789567934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlSdF2HOZ+5NxjHLPVwVCj4ppBlOqupjBhscykPtotc=;
        b=UCCQheDSXj3uXvgL53fzt6VRpzaCI2hD5SgPXimLlCI88ylawAfieBjs/r+wbvvJIk
         h3BKy7mhiYC30781rEWVZ8bQ6tLT45Qk8aRy6kRslWYnUUjiOKm3FKfGYeX8Ux2AJiav
         NHvMYLj/snDu2youuQkwJ/xx1WGyPlHMaZSxL8vzRTFHZ5Tz+bQ/O16GqiSzcyNzi4Eo
         WDQnc/y2/bug3UKE9wSFWr9Ph+QR769psu5F9SPdsM2in+p2w0K7LVojovjNQh1z1d9Z
         Mk9WFzSa6c/lI3Bcz04IFqKr2kPB1/P2fb4E1lwSuEWkJ/TfOY82YrQ1AwtLIxh98aEW
         QJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963134; x=1789567934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlSdF2HOZ+5NxjHLPVwVCj4ppBlOqupjBhscykPtotc=;
        b=Ihn5/mzbUeK57z1K8JF30+0WWnxtjknzMGDdFrAJX1iSeVzTwfRyQ41QyNhIXtDsa3
         BqnpZF6Zik4OJKiO9aBDU+rLBo9mi4+SyLaoQZ9H6U6ieZSJvjasPneqjKR0/j0Y01AE
         8P0F+nCaKMaEvHw6nF9ySZsWCPMNwjcnF9hqTb0srEn7l9hIe3a8WkToqPvmB0+itLed
         laNdkC6xLcSaM9YbXTXhLQq0OC7AR5vBcPTwEyY2A/o6yec/WPKHmHLSGUFIPuREVz+G
         7XwqyGTu6BgP5/sk3re4a8QnbgHD50yx2DPkJ/v/tC3F+zC4sRJv70S1GYETNGWSmhSM
         t3wA==
X-Forwarded-Encrypted: i=1; AKwUvBwILO92Yu56u6lAUehMCAYaX/ysH0MTu6eGy8ioD05C1ePHqXgrmUo/etE3FWtiYNcUsLJ/l6ZLYpQk3pI=@vger.kernel.org
X-Gm-Message-State: AFuF++ljcUVxI4MpPyfcv4aUYmDkkQnsJpBTWLQR5P95J4ZoxPpTszjH
	O1noZ1Bk82S6XTW/L6X9gqachHbo/FfckfvPQJ4szHJw/gdPrlLp4WtTES8ECTBo2d9bTfE8lQQ
	Ztm3bzNQfOfbZlwuHUxzsth/zJloC7anRsZWtnQyWt8qGFVH0cjOSZEaepXsVHX+9oc0=
X-Gm-Gg: AYBFou3lNjzIVbjQwaNVI6XWNtOQlgwP5+DDl3sJwHjYOdgNShECZj6ozCrAtv0ZG7P
	GuO0r03PZ6s7kdp+imBK6MjIrWtZBACGtHHiR6UEkKr8PGapyf8+eSV3n7eVFaCJStkSK7BHTLD
	eMgvVnUdXExQmFB41vbv/dK96/SydXfL54zQTn+DSfMyxxhk8Yn9fd8iXLSBPzY+GT9cTVwuaAw
	eaLfVz/xXGI7Hc8p+SyZB3j2Z0tZqZW7eyKMVZgqHtFvoCsrhS8xFrnqVMCJAwGnFSUeCu0G1av
	WBuDF/iYpgnCaKjvImGHaY/B4z7+RXiSZpQUOyaW3bZkBrKtVn+yDyYdXYlBgicdB9WZ1kbz2hK
	XSzYhmLic+SRxU3CHWOM15K9tvGBjL6eiHrriseHxEXu7ukJmaMvqi6foJj+S
X-Received: by 2002:a05:690c:6aca:b0:81f:64e8:cac5 with SMTP id 00721157ae682-87f22b7eb90mr28852637b3.7.1788963134231;
        Wed, 09 Sep 2026 07:12:14 -0700 (PDT)
X-Received: by 2002:a05:690c:6aca:b0:81f:64e8:cac5 with SMTP id 00721157ae682-87f22b7eb90mr28851897b3.7.1788963133502;
        Wed, 09 Sep 2026 07:12:13 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b52f641sm109480327b3.37.2026.09.09.07.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:12:12 -0700 (PDT)
Message-ID: <80b5c9ab-de1a-4170-9ea2-26242b767e93@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 07:12:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND wireless-next 00/18] wifi: Add Seamless Mobility
 Domain (SMD) AP support
To: Johannes Berg <johannes@sipsolutions.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260908-smd-v1-0-9fd2d876a1fb@oss.qualcomm.com>
 <20260908125017.0fb226c5@kernel.org>
 <404004c4c97bf776077685b7ec33a14fa777cd70.camel@sipsolutions.net>
 <80266eb9666d6106110d998cb6330868da55bf59.camel@sipsolutions.net>
 <20260908132004.29176fec@kernel.org>
 <0e950f7f0c3f5a2c1f6476e255716b09876624f4.camel@sipsolutions.net>
 <e7089219-ed02-4288-a678-660a52289e61@oss.qualcomm.com>
 <e9b36721c9e2b0b24c89c2e1b5b03b17c438f30c.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9b36721c9e2b0b24c89c2e1b5b03b17c438f30c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa1693f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q5NyMDGURezFpV5zReYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1OSBTYWx0ZWRfX9OHQlwaFGVkn
 xGUH2tTdd2oUjJkNQB4Kd51BKHrAbj0//F3R61LJXeZbExLYUX2562yJ5TAbWanbaIU9yNOgVxx
 RfbGeWItuea9mpQCc4LJWKeD9NyiNG/GkWXd96ET2V8IZFfoD/s2TxVHl4lZtuaHD7K2RDqDseA
 SsRWIuoDQa4lntVnMy7c70/by6CQbAAfu8782RKW3bncN+pdRu4TUzFukmW5KwAnK2JobxsoANh
 JZkCRLbRXTUeSxY8G2oYM2WVQ3f/UL6Ec3/BG4s5olppMaplsggnnXSqMipw7QqX2jVl0Ke1HYf
 K8OObQCz7NBY811kIgzfukGmkjD1YdPKLH7sBLA34KJxQtXFAab6r6nbfRxI8b5emfjT3WbPUhv
 kC+RpyA/Od6If2LXk94a10GDcl2xvLSK/wPypdkfrTKXM6nzrdt/awvM8mNUJ+1weWN9QDB9XWy
 1uCcFNSthg7eLet9zag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1OSBTYWx0ZWRfX0NKpUb/+/rqP
 oc6bUWBbx4s12f0duchfSIrx7zYXNjDxuajUm1ayDeDF1aRAriwGVnb5aexjSQ2lroRq6gYyBoJ
 iSMSwcgqDmp/Og4UNRPkoKGPYAlY9ec=
X-Proofpoint-ORIG-GUID: 5iIi1OVPTXC0isWaVI_TCWlGJmufjThF
X-Proofpoint-GUID: 5iIi1OVPTXC0isWaVI_TCWlGJmufjThF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090159

On 9/8/2026 10:53 PM, Johannes Berg wrote:
> On Tue, 2026-09-08 at 17:20 -0700, Jeff Johnson wrote:
>>
>> Apologies for the AI-like commit messages. Those are at my prompting since I
>> want these patches to be understandable by folks who may not know or
>> understand the underlying details of SMD roaming so I requested they contain
>> enough detail that referencing the spec should not be necessary.
>>
>> AFAIK none of this code is AI generated.
> 
> Did you read it? The comments (in patch 1 we were talking about) are
> also all clearly generated.
Commit text was AI assisted. IDK about code comments but I've asked the
developers to be as detailed as necessary to justify the design/code,
especially the SKB extension proposal.

/jeff
