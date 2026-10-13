Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330BC3C278A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887940; cv=none; b=JALSzuvF4xtQ88lDYvaPceIm59kh5qu6rMWryUbebno4tKPKBWD1m7UY45Zgp2EOOkM5U0g8NTJFwxxLW7WvCG1eA5lMp5OVKaVLtwHxqioC8yW/OCc09wO10OMHtk3Op2HAPhKu9M1QfBlmqz+LqYcmxfBYasGSZWeeP1LN5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887940; c=relaxed/simple;
	bh=/gsGpTTN5NSPm+Jmv2ESZ+joUPJVjv92q4cmcpfiVX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiYA7sfhyQ8HtVjBDqdp3uyUCL2NZsBS0RjRkdme8C77aMNIvTO8m4Hj8jbrZBhXIt4piPNdnZno2JFPiz36A+9BwIZFzFC6E9+srh9T8hAoR+IJkGlOcNTaEU/aECIztWRHsaqbuZ+VbjnoHZC7FWa6U1PxHnjKLlQinF8x45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBL4xTER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpO3J7gM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBL4xTER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpO3J7gM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXgl015275
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=; b=NBL4xTER/co8/kJF
	7DSfXerpcioiw/bezO0kWygHrgEkzJz/LxAw6aNneLmt9/vcnhlKO+ahCN7qVA4e
	zgh/Plm1Y/Ydf21ofFkhdDO1/qZGs/za6D+4F+mB1DuVkIHrsKJoiyaXSqyPgdZJ
	7drK/V3h/rvpDcfTH3RyweFSo39wU9Asgt3HbbJIkRY8BNH8QSLRQ4Y7jfxWO4If
	U0iYrJUW6/+mBOjwCuToNlNfVl2S7BaUnVWLs8inpZ3j8NjrNYyOABQS0HjqPyAJ
	JpQbMUKhFyz9VTHAokGwfQg4PTaUoxybTjbnMZaitL+l5XClj+48IdMFE8zbmm7z
	Br3C0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugtf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:38:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so40018485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887937; x=1792492737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=;
        b=XpO3J7gMVIRq0JVCW3FkY4JcuuOU3tMrA06/7NLqeT5iHKWV64biI4U7GLzLK8XjsR
         KOSR+L5+k3parWEanuq+MjfFQQImAn0vov5LEE903FKYzbQLkfQm+l/FhLQNH5Z1nlIH
         0NkTqPP4M3aJ0hjlBRV4F0Gi4BY69n7tXnOxiBWP1uhWhyDjJZZZNJG/UP+nKxhODRyp
         PeBu1YOB60AobzjUb2DGqx1JPKVmxnxyiHDCxcJVLffWUXKTjSYVYRHpg8OrcwCOZ0qP
         /txsnjwCoF96Z9kNZkiwvVFkDfHSQze7VTky385W0omVbT5Zc/2nFJ4W2XM9AV1ZzzX/
         E1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887937; x=1792492737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=;
        b=FJMyv6ds1e+bgTTo98wB2Uf7fTHWvpgtYDKSA4tduRYk/9YOg8Fpe8A8rrqH0KxMSO
         TLHKquMdLumniqv1d2p1tLyNt5m/4DowP4ywo1dQg8gqfgpUgBHkwwdaUMAVGvs71QyV
         6kk9TaCp/ClL/IzA9nMIymE4XkZsYqmPmn1bTGbRnE6Kdvq+MY4w3bm+z9vhtIjI1TQS
         f9KrCIoeN3I1+KJkFc8yWT+HBoyZUeg3F/ciJYkn4parCWTeOHG2SdpDmoUq+VE7luBe
         kYnAV+50RND6skmSZKYkzMn3xptUva7W1Gjpu2vchxev4XIaKLkKjhVMmv/IOBIWAFrr
         iccw==
X-Forwarded-Encrypted: i=1; AKwUvBynWEhRcioZvTFZgk+agElXjsTDCJ8N9SD0GW8ObQVHa/tNnmp9gh47akPG2R4CZ2jbmpsXm337xjaf2Fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAczpDpUTaV+v7UhlxyWPqgMy9s2C+oDIQhVYx7FiRdSCgmiLf
	BLGD4xX7PtBi7dzk0xhiYSEpybqwcaA6iCguhnVgmncusgKq5yNd7JkJVXUgGJc0CarnJbZvTG6
	sE5kx21qPI6VxvrT83bX0yYB5dG+/9wEPYas57E/7SMZZ4wkinsYbIaEauQnCrSUV2PI=
X-Gm-Gg: AYBFou3n3NeuG1vkCidq9PTGyfNoGuhy7+myYrz7YfSWXu12BA/ibatIfqzbs83dHS+
	9Km/xXo0AiRMN/CPkI+kefTs5epwwP+8Pc0j+H+3CoNSUOaF2mifHngLwN3cVrwCJM6PwHAJc5K
	oq5sUaWJYU+S8ZLXb1zGthG9jpuy6LmoD5mMKv/VuAA8MDfYYDNCePEfT9Ye9wTb0+PPkpkzf4S
	Ga85RRu5aXd77rey7yC5qkA4id6hoIFj+gYBQW6//DAc6Ww2AqgP13HwoUqm9GOD4EbPg69ziu7
	ShDeX9FNYSCZ9+yTLCAoHF5qwv1yJRLEvytIsXtBe7ygDWVkLuiBpWyd77Ff35KGEMeGvV47tow
	kcvzl/Bdth0auqhcVsEGHvg==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2416253085a.1.1791887937276;
        Tue, 13 Oct 2026 03:38:57 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2416251185a.1.1791887936833;
        Tue, 13 Oct 2026 03:38:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3527f0295asm208034866b.72.2026.10.13.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:38:56 -0700 (PDT)
Message-ID: <61840bbe-8167-44a4-a127-469697e4525e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:38:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: acknowledge notifications
 on undescribed ports
To: Rahul Pon <theflyingrahul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930111657.1147-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930111657.1147-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXzWYq9kLhZOn5
 i+4d93bK1Oamv/svJObJzkNNkgmPendQeixnZRM202GT1mHEJa825OeoBkuTHcYLmpxjgqrMeO+
 Mncwh3KJ3lZSAnr1XF1Fq85gjQbqTv9cffaNEMUXTCdVdGiuPqW7ZjZRZ8NZ1RhHxYK4jdggrat
 +JiL9vhsE0LXVAorcjJ+1nWicsuvXluXOHkzrvQQy2cpcR0rmR25dwKK9C6LmptVAu+C8dtNbC1
 5hSAN/JIYzAoCiqhyFjm7Sa0r3PE9puBMh7BMCWQN8duZDZCpc53cqDh6nZn6XIpxaS0LETsBmc
 w4r95AZ+QnGXOqQxlxZVGsVjCUH48jCHIsVaLoKzqx+JdldwbiGBJpGmzeC+iU/YLWUmMrSWad+
 GgP4bpSc5BnXMY/AZNo1PeHYma/qa00XekHimPLbdPGt0Lr+1VRWHjbVpTsox7QufooOa+vR5vt
 wK/sYeioXUZFGym/ONA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0a42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=5B3i7hfZnreuUmc6IpwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: saqKuhs2BSk_c0_KFkOcmzrRxPFqFEYa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXzFVwySnnfIiH
 VVC/g6rZrBjWTXxPd0y8RuMgHweGVzZBiqvPfX5Gh6G1714TAW7q9+AmFo3agFRfRquXYWr/4Gg
 RFUG2pkLm5eb3pnaQy0Z6P+RA1ON+rE=
X-Proofpoint-GUID: saqKuhs2BSk_c0_KFkOcmzrRxPFqFEYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 9/30/26 1:16 PM, Rahul Pon wrote:
> The driver enables port notifications from the firmware (ALTMODE_PAN_EN)
> for every port, but only acknowledges them (ALTMODE_PAN_ACK) from the
> worker of a port that has a connector node. A notification for any other
> port is logged at debug level and dropped without an acknowledgment.
> 
> On an HP OmniBook 5 (Snapdragon X2, Mahua) whose device tree does not
> yet describe the USB-C connectors, the firmware kept charging on the
> connector that was plugged in, but once a notification had gone
> unacknowledged (on unplug), its UCSI connector status reported no
> connection on either port through repeated replugs, and no charging
> session started again. The firmware also reports more UCSI connectors
> than a board may describe to this driver (here a third, USB Standard-A,
> port).

Please fix your DT instead, all you need is to copy-paste some
boilerplate.

Konrad
