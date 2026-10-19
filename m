Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A23945DF48
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390557; cv=none; b=sGK8A3dhF0zsRfvupgkE+UqKD0XCsks+YiCpu2Qo0DwW8PIt/nI1Ta/CPXRnYTaZrgHcwD/81/VvU63ru6Zq06LOjd99yxBTShI94KYorBFwql1ElS5U5E7eaHKeHFa/sk/wVh11TcEF04snTDb2irBTDLnXxfzxQ68hps2Xwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390557; c=relaxed/simple;
	bh=xhmXf1PR+SPWbydXKdG1JG0Ihlu3vWgnp2oEIJ3YqRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyP/QxYj33PPX1NAJCOhJ42w8ubgnKLF80fyLwv6fxsF4tazL822dtIIqkvAn/Ic1lC6CZYZY8PIdWeZtQu69ilDwQqWi4kjcINJ5xSusuJCwvPlElxeHq062sV1JnRuv8/epUCCKXl7VF4lOuhdOz8/epX/DHPDmY/aoaYd1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBafz8Cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwn0lHiW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBafz8Cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwn0lHiW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jcdJ1408859
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=; b=hBafz8Cpu55qf6Qy
	RRsAnylBWsXPrZOVUSIJGFPsjdbUIODgR31N/lSucVSeGpCO+D3Ad8TH3E/Xlw6S
	t1qEAw32fZ3lQh7UciwTaClUF1A0L/Y5bhSKS6YK68SLOEkF2M+f/euccjDt5m8Q
	cyoEcmzjzGex1A2Hyv9zY4gaI7Vpky5pixtbbJzj0yQmXM0niutqhf181rDp3KAT
	IthhK6CMaJdiznoPfJ4ZF7okP+COcOeZr0iZu9tCEDzHIqggJDLw4nZGPeZe/F83
	ZGL7K45cBwg3tAfvoIszodOVhzMdMfH0INn6IpAAofwmd+BwQZk7W1WE1T69boUd
	tEo9VQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr8djh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:15:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3915590eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792390554; x=1792995354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=;
        b=Bwn0lHiWiWjWhpcMrudF3xEmzBaMcfDINhXWtqWFrjsFM0IPul8CAnTfngGTprDMZr
         ehfSUh3gptDTGuHt8m8A2FvJ77XJjP5C4se0waBhahOzru0dbo64+PQgTGXFgzpKahWf
         J31YCXFA3ATn/9yXROYfWoKfiIbcQYrR9UGXsSMa7Lll4P/UC0ZWg6SIhP4V6onWoVWK
         +YlPDN8aB12FoaMdrzNeq/XInDzkCb6VPJnHjmZhrfPcpvQsO6MFieM3fmDwT3H8OZCD
         Zr1FaVRUdClIS7tkObKiyW3dAeqDiyI9bH4VnFgwMBfaIfa0RatNX33Y2U1Gu0NTA8sx
         eUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390554; x=1792995354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnXlvura6HqbRVAHGsr8qtM9oPK7l8m6EFNCUTUAuOc=;
        b=NuWZ+9nPrtKFfD4zguQxGGK96Bul8jDbahWh+/fheL8muCBmr8W90V/9lxe9bjssdg
         fEWiBJYR4ywTAPKffdt9TJhcuGnsoHeyryAuk6vwrQAQtfLlBMvae/3nng1VVKqiXVcF
         uEW4Vj7XdKvWNvXVrdg/8eXT5o5nvCBm3OjclZBlQPTpnueztpS1bfelL/1LGaAgeVbp
         gaOOFFLJpiCG89bbGqjeHibM3PoPiCj4y1NT1A1l81PYtw4KhZBocVTwLUIMenjlmQDn
         /ANhQRwpGChjdfvTlI9NnYkiyhdlnqFbN5yvyMC7KpizxXgJJAMjXowHfWTlVgRyCNL2
         qviA==
X-Forwarded-Encrypted: i=1; AKwUvBxqFwQtTFu9tGCxrW48Oksuvb2WjlhlbsxPusxSSRRkmj1Xh9fOPz0EYojJgZ93E4Ve8AMUXqLURe30JOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLONysFnmf+4FSGzcYKCkUbn/AAm8beFJv5/aZt4TK0RXVQ3Uwp
	yB0rJgIUvHSCo7QyWJZBp9GKM8l7CT2BNTlRTzAp32aegSkGVj3Rz7BMo5DxDbQoMLMxGO9BvFl
	1AlR0YQ4co0nSBXhlVEG7UU9BpD6rbaTxrkTt/Y/wwj5mWg0OECEQvOgno5rYorK40p0=
X-Gm-Gg: AYBFou3EzH/T1opkYKD48njERzfQ0+oT1k31fV2FXmK3BpA8XP64M4smAYfhVihXnOK
	KSPAxuPxNqeHZFOczQ1xhFSLnBCeO3IKUACa+bb05meh4DJLO3YJM5qfWi9u/6iNrhczKhapC3C
	tHLy+E/Xsmd1Boi12qvckhbLmGUjgM2+HkaQVwhbZvmcBKhNhaDbSV1IfZK0Q046KFGdTzDUflm
	KkQgp3O2YV5ezACO+7/I+VZOJRMji7fJ+98EJ8bvHRod8aOpA8NN647gtmvictGbyE0gSGV9BqP
	upHl3j3dA6V9CYP5jHBGe8dgLOxsMH+Wxr9buVtPa39aJG28SMlOkXuuGYCJ+vk4AJaESe24BWE
	XwJoeMnH+7Oj3nVCoDmTDqFfn1jWnbQ==
X-Received: by 2002:a05:7301:4b0e:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-3619ea236b5mr9259803eec.1.1792390553780;
        Sun, 18 Oct 2026 23:15:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4b0e:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-3619ea236b5mr9259784eec.1.1792390553247;
        Sun, 18 Oct 2026 23:15:53 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm32590185eec.0.2026.10.18.23.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:15:52 -0700 (PDT)
Message-ID: <f14e7eb7-89af-4228-82d2-e0dc6b67a0b1@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:45:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
 <atKRjiZEMIx3hhxI@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <atKRjiZEMIx3hhxI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfXy8B6zLaOGRtX
 zJ2vYV5sDRh3ETnI57xKcXTvyIVCmZud23GDLoE9sHTAnuZHdF0dggSIupoDtm6bYmjZgDI/Bgf
 dqZB2u2AZcXzHS4Euc0s4hlSRSbpE9kFOO/7sud/3hZMMGYUlkpjO4enZ3btNNwxDI4aQb7HoNm
 UJ58FQnNDtJ6PZyPNdwq0AQ7sGl6RfGeLwtpqWDDtifqeZqQkYwsEGRcCuH7kLIg9rXY/zGW5bg
 S1UOzB7AufCK7B0Z4Khl1ErEW81JoovL8O5E8MM64psFhemuwZFEOaQKYIrNYJ4kS4CpjkNF1Ti
 AVNGfLLm9Bd7EbYyRmRwvkb/8/7+XJNXiXqrN5+q85uYZ4NORwuv3w4hpFS21Agqbzc9o6xcP9d
 lCeNRytF8dtgDYivrinckb6k7sMWZyBgmqbqqc5ROlfMK/EmjB3WX5cwR/TzNdTwTwGc/cRyarY
 ZlHU2gy3xEJ7ifUVI/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfXxklUBuTofinM
 yX+4ElmyinAVPk+5qHcdt//ODhzwpPBRpk8ni5ehuYZoptgzigqX+b1IQq11dqJVdWgvCDrljzz
 p1BApSJ+sPnuCqI/okwe+2bcZfMXsYw=
X-Proofpoint-GUID: QNJ0yd5Vamf0-3vW0sj_rcoC3RVEtxkT
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5b59b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VeEq6VHES1BVyvH2O-YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: QNJ0yd5Vamf0-3vW0sj_rcoC3RVEtxkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190024

On 17-10-2026 02:35, Jarkko Sakkinen wrote:
> On Thu, Oct 15, 2026 at 12:07:45PM +0530, Kuldeep Singh wrote:
>> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
>> a non-secure SPI channel from the kernel. Arm's Base Boot Security
>> Requirements (BBSR) v1.4 require that access to go through TrustZone
>> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
>> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
>> Execution Environment (QTEE), which talks to the dTPM (or implements an
>> fTPM) on the kernel's behalf.
>>
>> This series adds a kernel driver for that TA, built on the QCOMTEE
>> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
>> QTEE services.
>>
>> This patch series functionally depends on below(first 5 changes specially)
>> for qtee service discovery.
>> - https://lore.kernel.org/lkml/20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com/
>>
>> Tested on Glymur-crd target with tpm2-tools utility.
>>
>> Validations:
>> - Get capabilities
>> - Random number generator
>> - RSA key creation, encryption and decryption.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
>> - Update return values of functions and drop certain error prints.
>> - Define locality_arg as default value.
>> - Add Jarrko's tag on all but drop from 2/3 as significant changes done.
> 
> I get this because I have hard time to write "catppuccin" correctly ;-)

Lol, so sorry for typo!
It took me sometime still to figure out where i caused the typo! :(

-- 
Regards
Kuldeep

