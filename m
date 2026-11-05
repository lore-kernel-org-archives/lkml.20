Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868858;
	b=4Wll4Np7Q4tc/3e7EvD9uldzFL5AMMaffKiOv96qYcKP+BlutVKSWjF5zdo600XdztUj
	 Xxa4aCoQrBxitWzYKQ3Osz0JSdSo5oy4lH+EQk/l/NgW99F+1LYrLAI82tWUxNMB4p+3p
	 5mb+Nl6mlWvQuy3ZUA5rLiSYI7Ti1Q0BtEvYpEpCkLSiqtVLr5zdTq0zBpvt441uHESsB
	 7Yf+qB8lYdegOl2UoqN4IwbhKge/BUyXySSAaGAWXSekit8jLEweOQbVmwqa9ANnlJftc
	 UclEU/iQU4kuoSXqi9YsfRGmVZMpbjoiFG33mgwF8svAJHKvghcUvrwz+dNTOzzpatA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
	b=nXzpDWRxXYhSuvJem8uENFx+IJu/QiJHsk3KSli4jEY2mVmJEY/VLlX6xFmhkUFWkkjX
	 EgCJPVE/mHnrMofW6uCwARrbukWVd5S0xc5ga+SUI2xEUi8STFskaqiLORrYJQ7ufzDl4
	 aWcaucR04nHuYht1bHnjGyQZJh0KUBO3tDHAVcDzWUXBq/14NtynrKCdV/syAXmLHXXso
	 fjk4pdnCnbiohF7+UZ8+O4tEM/qL21txT6e9RVF9NL/m5g3fBhMXIvPDUhWgEUpM3vKde
	 XDCvqgShVAijUIT9MJ36Kq7oWxkDhnsrHkh5i0hY+KrwgUXxVY4PDxVGIGyk13hXTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B5E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UY9h595343
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=; b=oI8fiLxrX9MVAS2o
	GVojKcZn+LYdt2j0/vq1o3yz1VTl2gEzCu+CWyWWI2RK3zMZ2kz8U7eGRVaVrgBl
	rfiVD2cD36WffmRqnBwzJu3iHwgLxKDskHldqTaVtXOKmLf1tBeNbUfW7u0JnqY2
	p3IrV+CsrmrcIJh1W4r8w7UkIELj7CZYSzlHpCWwMmbBu7NWPTjfiieGMbUK+d/F
	dY9s5YKZyRpwcNRPIc7I7RSGr4uS6yRibEoJ74l7VOs3bjNQ1IhizlROsAE63ASR
	kdeFEaUdv9M7AlKE/uLVm0yVPhORm36lxrQbws411Mjc1XfL20MWQr2pTW6yBWo7
	pCr5ZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3jp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:54:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc099197b9so1285156137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868856; x=1794473656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=WkZLQlkCpcLveevDkD2bv0zsY51xjyRlCN4tzF4sCp7CsrF+2yF84smKlfb5iXZLrm
         McXjy+KAeZm5BEdfeGDVFQZGIh+sRhtmHQVeSBu9+i3FS3ZSIShbNwqqqGg7kHrW8AG7
         gJSXBbSBGp1HXUP7tml/f3687k+4YNHHyjVr7VkQGxPQ4TiCLu1B4D/3i1r37DijhkaW
         4HdsaZdIiFEDTEmdIiHGmtVeOAT9IbHFEKXHjBXJLvkr5Q1XTxyzMpQATvjhSwdn+mI2
         GsckBUfyntcwCWD4yn4NHlz4kXdgJRkaSxEiBXc3sJGxidDiRM+/q7ic/Hi2qtyvhz2r
         Vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868856; x=1794473656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=fZQL1RrTDwujn+CrViilntTs+fuPWKQDnTpioaca8o3CvL4Y0c2Xs3sdgq55KqfWfc
         sonrVU8kLiqSJjT0yFfbGY88VxuPU+D+iUOliVInun4x6uzdKMlnveReTBUZxfK2muQx
         jOIHEb4PH5hD6H1Z7fjklxOmf+dksTqascs7YZQUKbeHN5f6KhnmpWY3tHef/rl5bJRn
         tqmoQqq7l/HnXAj4ZQufUGfnC7gKtS/TkUnyNsEcIlKYZIHXfcx7513g36eNJrm6mD/k
         6+VM3oG63XqSIdqOdhyvEQ8nDjWhkRIiJbl450aYHVPCM5mVEa4Q3MN0oplD9/RidzB1
         JHDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDKl1BecMvQk6EOP4zw2yYKycgcAcCOO7ad+gOqtQI0XNIRtJrjurncIf5ia8GxtnTg96D5WktrcXMA1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EWpv7+dpxZofXh3AQVFYpDg7gSV+BsFRegVoDb4SHV8x407tU
	xdXlpSyEjdIyEWdeRYi3WBygJP5jAIfxMCLsTNq49IiSADhD68eIhTnMBzxU4KEUxOBMFnZ/5xk
	ldIP2kO2PKm99ffZw8z+2iEtBTsYDLVm61tbCum5zKB8I3ChinZHrL91441LSenWLxgn+KbBvgc
	0=
X-Gm-Gg: AYBFou19UBy/AVw39kRhOcY0n492mvrsFxCqUBNN6ED5dTNpLWSNSvVfAdhjG9rGwJC
	DDihFvlwRTw7hhitLp/zjRklNsKcqKeFkDoPprbzRKSUEQNYBUU5Er80C+lcniPMvJMGximiMlO
	T5fSA0YaTFTrQIs3I2bI6lEZxIoiFQu4wjJz18O8bd6qCKu8XskkVfb1LMy0JqSQbGHhyk1/KMq
	KVYsL8ERryp48eV0sD+4YGDoLD2td3y8YaxNe0lK37WdbqdEmH0tLmXKcOBrszvvadUMxcpQazu
	AwzQkp+X70Y9dKp6AxqJlbBnIdexBTWS261ENN3IBhwyVSKEqPPx3dLsS7K8vGiDbtbOjB1imqX
	nifNhWfSp/1aSAPJK0OzR5ssNTZXut9dWQzeITRQw3A1lrrM58ECs/9LqLXMmhQ5YqACtk9+XLA
	==
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077921137.1.1793868855869;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077890137.1.1793868855323;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1a1csm8603233f8f.12.2026.11.05.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:54:14 -0800 (PST)
Message-ID: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:54:12 +0100
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
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auw_egkhHADKXL90@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec4438 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hQWSXl8fteurQVfxJlYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX2S3hpiGSResq
 CEUoGs4ZVJkuCfMqzClVkaYVHhIYaiTXaKiPxm7xcV3b1R5XkUoI5Zz13nLWtXhZFxzW4xOBCQ4
 k8vqYVu3KhfGQ/dlymRDGeGw0aN706U=
X-Proofpoint-ORIG-GUID: 4Sqwz7NzgLnUx_qniVA9TKtlwquEq0Ca
X-Proofpoint-GUID: 4Sqwz7NzgLnUx_qniVA9TKtlwquEq0Ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX2bDDlE4P0mb4
 jvgW3NPI7ZME66ow3ZdcU9jFkjD/uHBBnFIsUaQuTD/ElTctYVvB0rpnXq3C0ncJPv7zA+gOQR2
 67aXfVbWZwh5ke6zo4jC1BEjD3LGgqe/ir1E0bpj3xqagE+MEbPQg94oIA2BqWJlWbKs4Xaz9si
 5QyxkdenR4OAZtme0e1d5pmdeM7c0v3II+sYhUyiGO4zsWVq2AS0zIr67kWYZxVQuLyDcLzOsDs
 1NVp9UBgPz53bfM2c6ClHR4v7Llvk4MBfOiF7p+4TMiL/n+tFiBFH6RYpVFZ5Onuc9DFaMumm7v
 fwaoxjeBl9HMzYb3RONAaKPgC9Sl305GTRtwYxyTLrvfisYMKUHAp+7O0ItHaMqUPzuN/6e7kN/
 KR74XPRbQV/2KNe1SXciKyNrZ8pKiwo8+7xQdP977ftF+bVqNmn7S8oJreCjXav03H4WQkGc5i9
 Oy4HvyxIn1/ayyxzYyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 05/11/2026 09:34, Weijie Yuan wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> 
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring entire rest including the main concept of the
>> patch, are not really reviewing "the patch".
>>
>> As explained in Submitting Patches document, the "Reviewer's statement
>> of oversight" is for patch:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is complete, meaning it does not allow implicit variations
>> "this patch or part of this patch".
> 
> Agreed.
> 
>> Reviewing pieces of patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> But in this case, I suspect that your "Acked-by" trailer will still be
> interpreted as an ack of the entire patch in future git logs, rather
> than a partial ack and/or a partial review.
> 

Which would be fine, Acked-by has that meaning and no one really counts
Acks or tracks Acks for any metrics or patch quality purposes.

Best regards,
Krzysztof
