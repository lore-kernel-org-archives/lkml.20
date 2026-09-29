Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68E516155
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678752; cv=none; b=QCdHmjfowsvFsx30s8BVdhs6OIfyEn4Q9mE4rWXjFhfBv0ax+/ug4V7a2PleE4hJkIIXBVdH1Ax2nfvanbpp4xqkctufivcQsOio3xqMRa3BYgJ3cCAHbleTfINmI8Y+M+27f3I2tzceJ8023yA7L5KF6MO4L+v/56IIIcCy5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678752; c=relaxed/simple;
	bh=7oAh9n2HNriIc8pQ7EX6gC2TpA2I2Y5UzF+0ybwLhUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qesEY/Om268BW2dhbqjEOx4pgy4rF3a8vLm2/9xphA74qGkLzff+VSC9bR4ADy7Iou2G+a6qWJPR2FmdfuLxWcGDWYLF/XUmm2xtVxClKq6D+fKsVp0M9PHduMe9r6iKtcApcx3e8qm9pAsfYuPqv9Oe3RB7OBHXxTA49Gmk73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFM+X9HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7nIToJr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFM+X9HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7nIToJr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjBUh330917
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=; b=XFM+X9HHocuN0I2p
	1BascmweDqw5tOUGaSpmElzjbVtSOBxUiiZMS4RkG3j6bXjtQV5sNiO+Oe/1QTFe
	bA+6iL1pI4I6Uqq9RRZx86HEmyLl2M1QZH925wxjyDEIaKZA4TQhZVe4jmydresj
	prJH7sX4y1x+pyJVa27jskfgAJFWoTQ6M7kzFli1kjsrxtBlCntks54r4+mdeZBm
	OXR4jJyKu23pmg2BRC4pmVQ5wBVKEzgaIoutyRMOdH8NEc712uveYpFwjwahqMZ4
	3Jak2AVkIKyFtYfKxXZXGauuR3dSW7iKjubunClTZyoaokIPPUsaznBcYMStZbYS
	4vTwsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4tkmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:45:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso716185a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790678741; x=1791283541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=V7nIToJrNdbF49NgdusCVmShH50LT9NFLf8kyioi5bjRieX4WWLj9TIHsiGrbiirCs
         6STD8fU7sy4AB0yQ07cX/t0K5tHU6Y++LXPIs+YF3Oj7uj5yM15WpR096E6C+rl4dN9r
         +HFrTJuUwOtZbhkN6TjIxHxKekgf4iKOns1LSMYdCZ6hX3yAzNwvEEiDs0TfPuvaKO2V
         u7C0oXOiuYndEV+/eeksM9G37MYzjg4sATaLxLEEMPbDwaQviyPNpl20jI/xgaIO4Olc
         z9xXiDCZ+ZaqefDVhdqImBMghv0FyaqIpHGZ7h6uhqzvkkVh+7D0U1WZc/STwtZetxoZ
         ZXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678741; x=1791283541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th1EoeF+t6Rzml88WR4hQCtOyjoGJpY9HaMHi7et1Bg=;
        b=QPOKaBX+hn0XutCXHI4vJOGuwMwsI8IOw59l5nOFT6azTEZB3sPflmDXUtpiJsPn+Y
         NSUOSOeLit6EyCoM+tWJvD8AZSWZdR1ljks9/CuQgQd1uFOOzc6if9kF3ulN0b0hQre8
         7RXZzPjbTwxXiLJv5lKPhgbkg8ZoV2lm9keEGFJDCthia9mTbh7eW3siOKAOsUlkJSz+
         qJ7kfjxe/Fj9mboEzfPGQFmeMTsp1xdkBqcLHEX2hKHr+I3KXthpWsRax3lxqJFo6Ooh
         qUcxPPgA1XCDjwqnkVKcaW/J3cvGpLBmMRaiQ4OhxRlfXBUVO1tgBXACuVXtNudo6bc8
         xEQw==
X-Forwarded-Encrypted: i=1; AKwUvBxX/Po63wfXjvVbL9UM0RjRJGAGjsPMnprtbkMP/nRZDZBuHoCECSde0fNl/v4XTjdrDkMw7EHgN/b3o3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmxvvKPXcYdybGL/dtBJux/9CHFt8+f/xlmVrMe5bjMtL70sgx
	hf8ZB9GfnP/Hvsb4EmKUneI4TxeaDQhiwELRfHL2fbLC5WuNhEySYNTHX0SEC0bdzsjPoF8HYio
	mMQ4FFX8H4n8VzB+JaTimkd8nE9TPNPanOl7dab1wSXBgiDOXKuEnQNBMF/nhLR3shV1udOwQBw
	Q=
X-Gm-Gg: AYBFou2Y9GVA4WvfMXx3nWpB05ihBxY479bI9O3+unyq6sWqN8CdTArufpS6TQ1+72d
	86fqJs9HkCaIjlpdw7jihGuBV4S/ev9wkCsTFGqgTE8/kXMpG0Sg1TIY3M109vEy4FG7R7JLGM5
	f28f66RaiTmcuu9w2hWTjkq04HS6JmGmJisBuX5lDxOSX0S06i4kD7sd/rXlkHnt5r8BJOurKn8
	A8pvXc2jNEp9CZhn22ZET6xbJt2QntrQgILQti06DmBzq7+rVpnVLKr5NEixuWEddGwm1HRySKf
	qeonFq1oyJRv9LQ3iUON8F6fDOriSFz35R7fPCiVwczEcfkyn154XVUq9m6N6wVmQ/66txvRVWu
	7Mc8kp+VXLP6ol+ZZgm1crBST961uERIWXpQN5w==
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412412a91.21.1790678741231;
        Tue, 29 Sep 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:3a4:af1b:46cc with SMTP id 98e67ed59e1d1-3a4af1b5358mr412400a91.21.1790678740782;
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4907530a91.13.2026.09.29.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:45:40 -0700 (PDT)
Message-ID: <16a6c858-1b75-45b5-bd84-3779deb0cd68@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:15:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
 <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfX+vcPXhFtdsgO
 LOOttgalAYq0AYST+YMGkn8Pp2WD1fhtP0sIg2JiwheWlo0V992TXPFo6mQRqGh/8lXhzcYpUDk
 V9dhLHDfarwrOKpybMaKITDAvMrJtU4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb96d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=uVyU-rc3LnrGhSSI6FMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MiBTYWx0ZWRfXxeNrVXzTi4Mk
 NMEXYGrdbbos3ylLpm3gYxLlEEGYalskUDwVZwngnsly/jEOw/7Lx+XgVVnLChCXn3HJOdufb0P
 72ZR1uuW9heJegDZrmZvGuKunzrz5fmMxaWJYwFL0WnjXPfRcPbzkmIwwvxIpxKHW5lId1KzS/F
 PENRRmbAutGd0Q3xediHvUzVMUI+0r8PHFMN2tFuBzSQs+E2elcRVI4Sd0BbNPp6TIaUURGzoFw
 TE594n2SkqjPsIKyiNunUHdUCbiEIQ6tYfVqjlWZO2ZTX8j7QLL7RZV7u36+9LjCvylHamM32Bg
 LMqFwfmVXDoYxB6t+wBPp224jv4ECZzfaVUa9RxBuItMy5/4HvJy9128P6MTm9CKOwcv4p8Hb5i
 CTpNDvdCCdAERO9i28cE27IwvuUEE8/xO54agwKfcd3i1jBlL1HAyzHII0J74jaVQikr2ExyM7I
 k9erNnAO/hlofmOfSTg==
X-Proofpoint-GUID: xRsWpjfFEBb6iOGUdko0iGKm5_J-mwtD
X-Proofpoint-ORIG-GUID: xRsWpjfFEBb6iOGUdko0iGKm5_J-mwtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290042



On 9/17/2026 9:05 PM, Abel Vesa wrote:
> On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
> 
> Don't mention subsequent patches here, please.
> 
> That is not a good enough argument to disable it at SoC level.

Ack, will fix in next revision.

Best regards,
Raf.
> 

