Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602755;
	b=1gcqwAJjlOyi5QpB/IuIZrR4G859m3aa3O9OqB6KhP/+/aMTn+ZbNjT0EVSnQLLQKz4N
	 Z0CXXkTL1225EgumpglSw3pf1M5vo1wjrP+vmHfZ7pMIzELohznZxEs0B+mm6VFqKSBjg
	 VycrErbJydnTcOcW0JwfUMfYwimWHb2P+G2/83bNR2lBPH6c4V8qS7+41czGu7nCh8X+J
	 zX5EsMHLnUh1hIowUu96I+28aZz0tj57NlLyYmNmgGqVKOc3zgSQ962a02B7qFz63IdAS
	 YkSdXmcY/5LpL461uUdUucUEJZS4q3fOut0Iy7jkNpV8xmYJkr4BDtFrGyNazt1MlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b8GYNp9h1BN6LZCaFYnOi9RO+fehzDHVEHwdAXLSsuk=;
	b=V3LiYkZXIeooTJK+f5YAbbsRLYjazYpDoMI8/PfdQ4009DSAX4Hf8Li8srA0jkzhhgFq
	 PWbGxtq5faZ38JLP1N0Boo+Ho2KnN0sfHt+7wYN9JEVfZ7upuxycAnL/ypL8AkQ9UzZwi
	 K+ZQ7cRAy20I8Y6aIBVMINs6AJZzpPfQlvIUI97BdhxOJbiga0xtd5WwaI72VWdvR1ETs
	 8/hJZiGkxtQ77jUrg+xHeaCGVMwggt8MV7Cvp5zGeS+RjVgMzEA15B2VdFwPiuA+kGiIf
	 XS+6U5Whw/kCekwon9gpI7vUC0LtfDgtYKxMisb3RSMSN/OGqgsj21z9OkNE3LrkT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXmdwO09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Onaae1lG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F41606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F41606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXmdwO09;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Onaae1lG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADKK6RI184103
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8GYNp9h1BN6LZCaFYnOi9RO+fehzDHVEHwdAXLSsuk=; b=VXmdwO09mKW3S/x7
	+wEETAizqcfOdCmVksYiKAMMhQWrf7IC3qpiAIDefnCV0TTrYQO+R5Eb+tl0zjEg
	he3zfJ7lkuESA7BZyVmMg57NxOvxb5P4C58dfVAQPM0z9NIb0oVpEJRKbyg50gbD
	feXOft05NYpxwrw/WfkvGll4+YdpVgKQ1A5l36nYKVTekTJsw1zxH1SfdfI/Q03k
	9TZ3dqYlPc1L/xJaeNLsJ7qxzG33VnLOuibXnGcag8J4X1dAHwBJTmqBRaXtXllE
	d5XOtILggd9s+D/cZNEm8rUlnPxZshrEzxOvvMs2THAAdJ3bHBwk/wiOBCZm6Xw2
	ZDOufw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma8unp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:45:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so1490643eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794602753; x=1795207553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b8GYNp9h1BN6LZCaFYnOi9RO+fehzDHVEHwdAXLSsuk=;
        b=Onaae1lGNOEN7jdMfTLsV/pXQVx/0MlEAe48h8hw7biWEbxWf9EYmuLYT4SBo8CmWj
         yBrOTMWc48C6J+EDIqoX3q4X09pgmLrq9J796aVEK5r3Ldz9ipIlv/pceaLCHa4qGJHd
         YsQ33LqN+gjWQB+78HKKEO0nZwAqfR7lgcbgn3pjLB+6kNb1v9Vu9prZvp3MtIZU/pwu
         +ENGvcSz+UqVsQV4qGXvuVsjKrbN5G0Ai5dpM5lj/vVJJqd71BBQmjyJse+lvXQ1vqZ3
         oaSlqb+EO2UNTG2uIKe6so8GsE3nBY10vQ6mMUXn0cKVazKF64QRPVajAMs8O9tMoITw
         6APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602753; x=1795207553;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b8GYNp9h1BN6LZCaFYnOi9RO+fehzDHVEHwdAXLSsuk=;
        b=GG3B7jAyxjyS9EcEwjALdH0mY+Ly2GJF+hntC/NNPbQMRKqRoNadYiTJlkpMIXD5UR
         m6KO9G09Lt6Kqdnt7htKR58DHA++2U8ksKXXWvKLmCSREL9ErR4DNFSrcb2Hg+cPJMVY
         VzKf0u0VdaSH8yfdEbBMKjwvj3w/oNqPRxrVSf0UI6YrPBO1a6Ht0E359nDs/iS9wiAu
         U9MPnaF99BN+Q6GtJa9T6Rc+d/v2u5zgU6I/Grff1JkvMzh/RyrP3xlG99dvmDmRgGYG
         C+Y7Uzsq+FgzmvQIPQ+ccnzOD50nuf4fShWJbFW5y5e6xqj2eTDyITTCj3+XK5ZF0+lv
         Z+ww==
X-Forwarded-Encrypted: i=1; AL+hErFbNuT+8HnqfR6R8Vh+RaPdS+nsta5iy/52TdfrWHPdnIyD9WDXIDUVL6TxNehDPhsJpUCaOz3UFXax9UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lgUNL+ZPqFVPHfGOidz12HTcyK5r3t5lI3RcpiCtz7G7hQMNQ
	aTU5/Z8yLZvJAXyl+VUIo8JyCvIlTpqSFgjco2WaLyJYK7g9CeWNMH4crqeCXVlJ/ytTO9pXqy0
	1XbTxg1cSGV1CSHr15WRv1JLhbjAm8iTgseOAZionQFbjZhtGFLv+p4m6K0AYYXSkY6g=
X-Gm-Gg: AYBFou34l2WCaQNu3iJPSt+BBDOxR4IFllZ+ITxCV12+Zjw3UprLr/U0lYw3sNBjK4a
	nsBnAabhIISEtmBolsIyAgZEN0jGX/zzmjrCAo/Nr31Vv9yDj7DIuZmEhQVYqzUPHN9dPqx23n0
	7vw2yl2aAOmBbYSlJ+n83GBPOvwoLIatNfKRh6RaxHAF6IXxUH97/U+eBd5w9AZiJ9RHS2pTtP6
	qS7wACniLyggMIHzJK+M7G235FF29vTmLu2EQ0r+CY4WrjiVT3rwAo+lIqyrwMf36OaMWCjJrkV
	Ang3batjx5f9pLmQONq4OWlN4r89CWjoBuruYZOD+ow9L8oOACFSGKcbmrrdExmlAVM9YVInFuL
	m77Dack2uUcLQG3yR5AxUVwEnkp9kK6gBuuv7+Uc3OlWNvlKi4fkdP5fxwDGG6lVeRiVb0LTzWI
	2tIg==
X-Received: by 2002:a05:7301:4614:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-379655d45c1mr2796749eec.13.1794602753185;
        Fri, 13 Nov 2026 12:45:53 -0800 (PST)
X-Received: by 2002:a05:7301:4614:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-379655d45c1mr2796723eec.13.1794602752466;
        Fri, 13 Nov 2026 12:45:52 -0800 (PST)
Received: from [192.168.29.10] ([49.37.154.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm9032968eec.4.2026.11.13.12.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:45:52 -0800 (PST)
Message-ID: <1317a8b2-2f12-416c-aa12-8d0262e0d3c9@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 02:15:46 +0530
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
Subject: Re: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform
 bus
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
 <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
 <197d7d58-9791-483f-9a7f-40747f44d1ee@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <197d7d58-9791-483f-9a7f-40747f44d1ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7-xsslhI2_sI-lx7R5qKzQlR9fh8sCIW
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af77702 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=KJEteu+P7FD/DYblE0u4eA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=b45o4kL6AAAA:8 a=EUspDBNiAAAA:8 a=EpkGB4z7we3iSK_TefgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MiBTYWx0ZWRfX12HDtB/YeeQK
 JrrMHZWlkNua32QtveLAnTGMIcLyilS2fohrW8nsq+s19LOSWpqnYsky10rgMe/3WMnnnsCn821
 vGVhas8RuPrp4UjNmmLSTFTEg2Laq63pLOYi3/YkIXG3+2J+HpypVrVWD8PZmGYQTvlvvTylpga
 d8k2IQFqaPfb+Nw8Q7khkbhIKoAsDvQrq5RfZHIa4GqPpwMWUlulqOkbnb4QWdadAAmRDDqBdHV
 jjQKMdwS9kBFIfRDNlGs7e7wlR8DsAEdTfECvczYjDZ21BksgiuZr4bdVT+QHridR+fkNZg1s8B
 6volGldnRFmoxpJEaUHeuvmq9ir+aEHlvAPtbrdaOCtqodFkf1F+J86bMuSXRnAv8pY4RbYrs0Q
 VfiYw2cWB/pQUTWyqz+GVvjg3DT5kNaOXd6UMnOHJkgcSGbzobylWEPQrI7l9o/huxeu5ka5JSG
 AkT84nXc1E1kad3U0Sw==
X-Proofpoint-ORIG-GUID: 7-xsslhI2_sI-lx7R5qKzQlR9fh8sCIW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MiBTYWx0ZWRfX1ogEfgKdX2HZ
 lN0cinbwlBL5DjY4rTNoiMW0ixPuWB9jR91lG5qSedW940evdM4tniWz2hfXjv41YGYq5QjK25Z
 GQumUyo4nwR1OjEPpr6+P/7+QNW0fMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130082

Hi,

On 11-11-2026 08:27 pm, Harshal Dev wrote:
> + op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@oss.qualcomm.com>
> 
> On 11-11-2026 07:47 pm, Harshal Dev wrote:
>> The Qualcomm Inline Crypto Engine (ICE) driver is an independent platform
>> driver which polls on availability of a TEE interface (SCM driver) before
>> checking if the ICE secure service is supported by QTEE by querying the
>> qcom_scm_ice_available() API.
>>
>> The TEE subsystem currently does not provide any way to notify regarding
>> the availability of a TEE interface, i.e. whether QCOMTEE or OPTEE have
>> probed. And so when migrating to the TEE subsystem via an ICE TEE client
>> driver, ICE needs to defer probe until the OPTEE ICE Pseudo TA becomes
>> available on the TEE bus. This means that for OPTEE builds without the
>> ICE PTA, the ICE driver would indefintely defer probe and the dependent
>> UFS/SDHC storage driver will fail to come online.
>>
>> Add support for optionally registering the back-end TEE devices which
>> represent a particular TEE (say OPTEE) on the platform bus via the
>> tee_platform_device_register() API. 

I've been thinking a bit more about this. Instead of introducing a new
API on the TEE subsystem for re-registering the back-end TEE device on a
platform/auxiliary bus, can we just register the (OP)TEE device on the TEE
bus itself once all the Pseudo TAs have been enumerated?

This could be a reserved device with a reserved UUID that the client drivers
cannot interact with via the usual tee_open_session() function, and would be
returned an error.

A TEE client driver who wants to be notified once all the PTAs have been
enumerated on the TEE bus can register for this reserved OPTEE UUID and be
informed of this event via its registered probe() function for this device.

The TEE back-end device would be a sort of "end-of-line" marker for all the
PTAs on the TEE bus.

Let me know your thoughts.

Regards,
Harshal

>> This allows drivers which poll on
>> TEE secure interface availability to be notified even if the TEE service
>> itself is not supported.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---


