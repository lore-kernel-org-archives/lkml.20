Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869049;
	b=E64sqe/+Ro4yinVLAk93BiPFBgtkVZZCw9Nyufl/5eC7rB4HWltXDfY3E8YjOeUsCX4F
	 uJBi1dISJVT0ZSU2uiXjqot0NPzTA7rTPL4WopZuE8/9+TvubFCnvQJLju2eU0Ucme0vR
	 Glam0FMfRk+2CAqjEJ4ndM3IODPIwluX0RCDNJGGJnMBsVGFTygwuP1mHINa6m7Xe5j7W
	 cpjAn/pebmXi4eWkROdEAnK7/E9LF0uh4Tx48NBB39N5gTM+YI+XYlXu2LrqWoeIqk5rr
	 Gvx2QIy7AKr4tkIArz89giuZHR35YqiCrnRpSwkkNnauZPGVyNFrFyleoJ8xxhOHb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
	b=dsCaQsQJyGQQPW7JtN8geOrve5vmpHEyUFi2Y+OB4zKqV9Nu2+m76sfxi6oaedd2Ka2T
	 ZDa7l3jPMtaBBdqI7kUrrULVtVB8XWEW9CP98rlTLt2CLv4CCxkE3ib0rA8N73Oe4dXOe
	 lW9DJyON7fGjXib5K721M+pe9r3EHBT6HJGqFr6fUTOMxCjJb68MAI5jaijsDRJ2XJGky
	 YdV95q8+fJLZw+e6vGG8+cPaqsWae1xkDp/4TGWFInZw6r4yQxe5lI6vPaEWofFxWGVwY
	 De1cp4sSBuRzSHqMNg6YhueGZzV6QvlXzKNABWUKV3K2kE0ygYSsjhfaUoU1wnG9yRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D93606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D93606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UL641018119
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=; b=kOPmgVes0FT/yCNK
	yULt2a4HiisTgKDYXq1pulg7qM3DKg/K2//R9VSgyLj+lbdCMeiqb0NIWAqCXJ8B
	4bwxYXaAQMbJwqLCb5iRw2q8nB/D6Ffp9LlI4/rB5LhFD/PTeKZ27UR04Q+Y2nW7
	7zIzlNGw1/7DDt9lkmvR7lE9HL4XPbIbHnMBjDVpYcJy6ACBOl2cyKyAe3wFX9xm
	51o+ywJQ2PAJ+T4TI3sqOJJKQfYKdxPQrx4NsqV+wquI4P2/wvbPb2w8IZBlrtk3
	eQX9eENIoLcWPFekGm1HO+EjsCZAL11jwJXPU0oxlzRBSgyJcyWQX7jBbuyEwvrR
	q0RNtQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnm63p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:57:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99062be02ddso419343241.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869047; x=1794473847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=ke0TpmVH4hxD2jxfrrW7rZpPvszl7dTRCWMJppYEdZHMTo7+DoKCRi3nf9Je58ydM8
         oMeGN78ttVjP1Yg2EU5HW51pcZQSrRm3aIcCzbBWWX3Mwn9FFzyMngP1Ntp4gsixaW3K
         yvIV9NybT8ENcaJm4tJNE6QNSC1cx3KHtgW82q/4ynvSG3fuy3+DUkIUySpIY5UKdwhk
         oSIYORD6KHWAvfRNVQVVGrkBIn2Ov0gVRtFydv2uHDPLmoiP7GAmXyg1IKnoBtB/wAuw
         vwqFtMRmmZRM91U0pBrKpaIeduPahxWXTaCjlYT4xcrTrFWu33Xp6Z2Z+PDvnh04Gh16
         SC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869047; x=1794473847;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=ohbNwZJbNZUXvpJjOr3PyLwGL8ttGv20hf3wlOXLfSpjn64Vp8NYObaejI1Becs3Qf
         91/fSZENzBJiDepkbkvCBPri+qwlJQ+t0tJVUXgTeiE9xZ3XBtj6yrIxrAPgvqu5DSTg
         8ALg3isMPOgAPH1zV496TLMA2zBzrSBqvQUzISyJ+YfI3x5E+UPituRyO5zNvewP+zdc
         GRSrmEoQ14/uPiKDvmLlbh+uAjGOeIEzyeW/MF79UPmsrTl5TTj88EfTh1om35TWrj41
         gWBOb+GntpxWVbDIK/U/ZuguWIkZHauhyd2u84Oj3H2Hh6uE/HTCTDDjtByouCiCvCEP
         NntQ==
X-Forwarded-Encrypted: i=1; AKwUvByRnu4m2HLOAkfZEtKBaPk5adtVVp2hoMQ5RpJW34TNGalZcE+0nmJp3t9kD2vOhTNiy6xJADnJIFZHRwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VFhbxWtAOjNw3OSGMmoEeSR23ReF4FVDQ5h/BBuNUU953gqOm
	+pyQml7oCJ2Nm5ZC3OqENFfvTDD92pzjlvuBG7fnb+8KDI5XfrCnmZRARQKYRYBBc+CXEt2TZIh
	0V/DdkzU+qWZwRNjCP0+PGE98uDUahRginozWyw4QVL4VqpEdffPdLBsAv5fNpHOMG7v/3uk8kt
	E=
X-Gm-Gg: AYBFou3Zu4eGZnABfPvL4lXPKuyhNyE4knJ+NIeir6m/+C1CbHvMkfyLZW2IUwqq2CT
	IN13Oms0aMwYH0ic5yttVZ/8ekfRNVpCzzpBY2azZdIR57WLWlCBaD5By4dC07bwmaJMTsu8FAK
	Vi9W1pYjyqCp7kZVAkNAdZ0TDb9nUjxEgLduOvqlBWnKTNXZJ04csx5b3wRz7MCm7uygHNeWLrc
	Uo5QZ1xQ+VatsywRg84kCKEJvbR6jgOCVWDtm4OFv1/+iFN4CNSW/rpdvZbHFI6IMUua6g6FdHN
	Ai28/JQbIqDoFlSeH1/KImI9b18gtzL3pVbSLUSWgQ1012yjG1Fw7wFAHqi2gboc7J2j0qaaNjN
	HYj/nrg0nBYjktSA4JPOfjGc5n+xdfXUbvSaHxTG+9zV+0CtQ2m3QJHZRNCM4ubC35kAPnEMW5w
	==
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900180137.2.1793869046753;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900171137.2.1793869046198;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181079sm9185094f8f.8.2026.11.05.00.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:57:25 -0800 (PST)
Message-ID: <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:57:23 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxDTdfMVS3yazCk@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5Cj2mFXZEv1P
 +pj+2hmPFrq7R26gvshA5jZqTRDS/TGf1+pKeNlO3grC0Ni6tSy6j4biVyhcwa/nxIkmnMfyTxQ
 dyDtna3xAfREu/MeChF7HoVc1/q3hg/jYvM6Tnh6fsBQEFx3sZFpK7tVfEAzyPfAqqQWK4i/NMl
 qrw6sXhZ4PfVzNmES7TXad0c25hhs18MoRT3q4Ilth9c0Eve7agK7uNxbTCcxeAtRfmBlX0aWcu
 YfG5z7tPxBWoRVrx9r7zTooCYYlZqWys6f/nnsCL4HYwQ1yEA6yy5X6phOJcOt5CYQamu4BvY0M
 Tyz4oPvTJyUpZUweXwzIhElDRiJo06sfNZ7mCOb2AR7r10icRvQdfCQGQ4VoHO3A++D/WxtjoCV
 8j4f+jUGq9ljArfr+Ik75PtV1KObh6d6uuLGrAjDlMUIq1AiEHqfmiO10EK2squNKv02FsNJGuF
 AXCWROGWxh3q1qaTAjA==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec44f8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QIhr-27iAAAA:8 a=6PtPwRdlQZAe1Mv8CAcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-ORIG-GUID: LNV_KuXasFjQ_E_C_fl1LxGIDD7P3_QO
X-Proofpoint-GUID: LNV_KuXasFjQ_E_C_fl1LxGIDD7P3_QO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5aVYHO6GMUmv
 dB+jBFWspjZw6QxdOMYEcuXFd0BDcc7JFBBTjsWxIKgkf5YJY3Pug4QPfuCFuTUU5eeoDc+CWDF
 Itk1xFXPRFY3962u9hm9VUedYIzSwIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 05/11/2026 09:50, Wolfram Sang wrote:
> 
>> +If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
>> +then more appropriate is Acked-by tag or adding a "# subpart-name" marker
> 
> "... is an Acked-by ..."?

ack

> 
>> +after the Reviewed-by tag:
>> +
>> +	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz
> 
> How about being more specific?
> 
>  +	Reviewed-by: Driver X author <foo@example.org> # for Driver X
> 

ack

> TBH, I think the above is even better than a generic "Acked-by" which is
> basically "Yeah, I didn't look in detail but the general approach looks
> fine". Which is not what the above says. The above says: "I didn't check
> the general approach, but assuming it is okay, the changes to my driver
> are correct". If I get a couple of those, then I know which parts have
> been reviewed and which have not. A list of generic Acked-bys will not
> provide that information. So, actually, I think even the Acked-by should
> have the "# subpart name" once only a part of the patch has been looked
> at. Ack/Rev is then describing the thoroughness of that look.
> 
> Do you get what I mean?

Yes. Part of the Acked-by tag is actually unspecified Acknowledgment and
many maintainers do not trail it with "# subpart" name. It's well
accepted and known in our community that Acked-by can be for everything
or for Maintainer's responsible area, implied by MAINTAINERS file.

Reviewed-by even with the "# subpart" still appears in person's credits
and reviewing entire patch of 700 lines of diff code (like Frank's SPI
patch) is not the same as 10 diff codes for one driver.

I'll send later v3 with the changes from above.

Best regards,
Krzysztof
