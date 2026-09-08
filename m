Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0338333A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861461; cv=none; b=HBOXkmGKSfR/oT8mZHMsmc1BuCf7tUFdWUP4BLdcJw1UqX6+XL4K+wmN0/8F3eCdSQmGrs4Gnd1gR+dlnQpiav/ScZmRL4dy53oOUlj1B3/FuAUfENscZmKQGErIYKnk8V1PSn5Tk1AUxxv0svogmO89ApwnPz1zpKa26zDx7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861461; c=relaxed/simple;
	bh=bUB5yJ7aQ+oD0OEtatKSAP+MZmjX/d3fiGJdZw4rV6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP7Ze1WUcZ5+CK03sP2t8ppNGwObkxZYvTwwz04Rg3Ci8k/74wE6DPVKCV1VrKAhy3kMd63iBaAz4wcLkzjFtZJWIAzxHhjq6c2QeSm8Yr3MyDbt7TqBq/8Dco/YrC4mlhv/Rc+zdo1jv9TZ06XwMG0xF2cf6HBCsNhcoSX95CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnnIkPnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwzfknOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnnIkPnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwzfknOO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Ldk91477255
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=; b=dnnIkPnnQTVV0+JW
	+9edF8QTI7D840X9Ldr6a9teOCePvCBBoSPMtiG+NtsiTE8zEJUuFmXA72Msfzt8
	I+VgixVeB6gctxPtB3hy2rpk9lN5VfLnWr84ojvQCiyLfjkpsHOD3MJSY+fZfjkj
	mKW2A948itWVVt+Am9HdZsIHpZ2oF5bhmvS/X8Iulf8ViQLfXix/KE0J4ZFBbJ8D
	pj1FkyoBIn2gYu1yVF7mO+vp+4nKzsOiGg1FdrPNfqlKdRJkp3nJoXubpE5rgWpu
	FQ3fL6rYkgLkSjpTHy2GtTHipEKM//X5SY0nWE+WVsZeB/j6gmxcQhZelgbvrOJy
	QDh6sw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjhcm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:57:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ce451128fso4314536d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861458; x=1789466258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=GwzfknOOWk3VGtN2a/pHMuw76QcYt8zBnQ/Hp6c9syvQZUxFOURcm6kbGqWCcHIWQh
         yvoBjBSknQxPYgfmhG0dCF/qUXzk7uBw5KE/lDy5LLLdtT5yRiHTP1/ifZFSW3/TPHdX
         Uxd/WiK/ONszeRqZl5LDQ1dTSTEyDb2rK+0e22TjpxQs3budV/4qFEpYKbimfT0Z3uDO
         KFGHzO7QmstcJslXCYFZJaqFUupZxKnAzs5HQxi4QkPIcumB/G1b3FvnUrPzKtPxSY1l
         spzqdinPoIYHTTA7U8O55zyYs+HLJ2rOfNGPnEp+8uLjLA75Wj+cd7rxzIgVNBiL3jQm
         KZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861458; x=1789466258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xA6a9Q1OKrr7fgxWW30qln5vPyiTQZl5LrYWPnCDg=;
        b=Lh8YPgVk/QANFBYrKU4CEd4JOWS+MiwKQ3CzInTRtTFwlDFRhEgPabTApiZOmhE9G9
         zeaK0RFV+whrZGKJOMqeIepz7yO3LhWg3idesVLXK3H+J+ozGeKOkyyaN/P7bPdwp4jO
         gc5tKXWtsy0VcqW+dhTvWyGPUd87Q6cLrURyuYr427Ty1lqFPzAcSxmZFBbcyqSA0Ais
         JmWVwSRnv7OzRv9U+5v6PGppz0OQPJIF80ZDcnp5+ea9qBWQqpTx0TqrQaNordjWrSQ3
         NiHjwPe3oQKH1Eg+s8dmRCnpCmfxG5kXKsaIuTVNuGq2+Pch6G7XrM5yAA4uzMyY6JpQ
         fIhg==
X-Forwarded-Encrypted: i=1; AKwUvBx58022BFftKYdqiq0IKqXqglI8bvXLHIivpWAWI65Agcwimevktg2cxIsxwyPq+QFvo8oBFrvuYBEsRMM=@vger.kernel.org
X-Gm-Message-State: AFuF++m4Ir+arJyfbZb0JQXIv7N8SVW9D5X2ZbRqVkOGSEKme840yZ3I
	udeuhF+JIDxrRXq0dRedevhXr0NfpmqOVMbp33esb4vnO8LJoH0mwHUGH+oVZKTLK+043kKZRYe
	sK1QvnEk+az2FfivWdO2qm/5Ro9AQ9l3PbeqBY/d9jTNhogpjDcOv+MigmlMECk1iAtA=
X-Gm-Gg: AYBFou1tokZa38naFio61LvxQz1fz2DAa7/V1ScXzVS0dfdqMOKJ5WK1x4ZV/3aQw14
	RT6p3M9rrw4orBq4IQKO5RtsmO0aIh7GUgtP9IZ5fAe7aQ0XYJk24EuOB/ArFAWPqbCjiWmxzMd
	EplqAZW5e4rL9NNloGVUbn4n7Id3SxB5nZxwKvGXhAOp0q3XfH7ttW618X36RgvKij5uh5jdxAt
	C6dqIRMhA/DUnxHkwttw+oC3EAOL1yjy4G01t22paxLXZ514P0c7Rmk2Dvbez3xLf2nQfvATjQ0
	5+5mp1UbCDXjymYTDvL/CF+/kGYqoPmPIJ6jxb2SpLuja7HNZR2l650AejwMoz9x97gRsAcxKab
	m1a0ACBcccCnFqsNc2bB5Xw==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230021001cf.1.1788861458538;
        Tue, 08 Sep 2026 02:57:38 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr230020281cf.1.1788861456867;
        Tue, 08 Sep 2026 02:57:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm5164740a12.7.2026.09.08.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:57:35 -0700 (PDT)
Message-ID: <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:57:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
 <ap_RKfCbXAVBRtSY@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ap_RKfCbXAVBRtSY@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfX6pglq7dMj05v
 c67aFPz3jgNt4tOjpor5EP5NIFOdbYAwvOklExEukuIsJBVbI7POgxPENRMJboYD+A6Z9QSxZsH
 +0xDDn073cq6ump6Fv05EFzYISWUCW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNSBTYWx0ZWRfX81oTILqptaPl
 KEvfNdPqc6cF67s2qpw3XhifCQNBE8RtTEhXFPELaKR3xIoAyVURU6Z8GyFcV+5V3PqeXmF6Rda
 dPM/3k3i1Vq51fOLLh6Tufv8iOYPinAEvPLkAW82ZbNbtpIq8lonWuVd0F71sfPlfA5LPTOEsaA
 DQ8Lh637GnCuBI8ACteiHMJ9elyVUFZHRPprD3EybEZtZk0iRW6GC3hjDSlOtOC3wlCLgMvCVsK
 JnBwTppsaxzLd5i5wWEeugHDAEQfRGHl7F+P1c3yiQZVovelFYwVlK9AN4rVvcxU54rBTt8mi1K
 EWF5PZYEcJvuAUsCrIwzQWlcdRJ5Oqdl1VpdiTPiJQeF1ouNJ18FzN7LwxgXHHP/+/+e+zwBFU0
 a59bAtTKFnxxN8DvlP+1/Sv7JFxA7ZRmF30L7E1cwsAqIKjPAwj4pPxyfZXEk1dCFoC9YdP+ynY
 K85SHBTCesbWUwLy7EA==
X-Proofpoint-ORIG-GUID: SJXoMCqIKrrvVrCu5kWQ0-N-nJbNewh_
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fdc13 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=MhUYJUi1OxyXR2b_k0QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: SJXoMCqIKrrvVrCu5kWQ0-N-nJbNewh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080105

On 9/8/26 11:11 AM, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
>> On 08/09/2026 11:03, Mostafa Saleh wrote:
>>> Hi Jens,
>>>
>>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
>>>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
>>>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
>>>> chassis, different silicon. Stubble and the DTB loader need distinct
>>>> compatibles.

[...]

>>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
>>>
>>> This series does not apply to ToT nor I can find this base-commit
>>> in it.
>>
>> It's a public/standard commit, next.
>>
>> What is ToT in upstream development?
> 
> I am using Linus's Tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/

This tree contains the latest release/rc tags, linux-next is an
aggreagation of each submaintainers' branches, effectively "what is
the next release going to look like" so essentially that's where the
development happens

Konrad
