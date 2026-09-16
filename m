Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC2387359
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540472; cv=none; b=tSpyJTuN/ZyA0LYB5+49GC0uPt2NiDquH/aLGD69ViJjLlj0ra35QgjQst/J4rVviQbudS76hMV4b8Q9JLOkxUYDvETQUtkLCuZJSgjkDdXC/PL2HC2c21nVXEn5YeAh3VlZY85c+CnGUovRdzJTdM+moZ06mtwydOQk+LOfrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540472; c=relaxed/simple;
	bh=EaYrFxQzNWCwreKkYP92hESTFfuH+LpIKQoWkTN33vU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZErqtHAKLlDlmRRYSd+nI+UQ+arNzqDEglHhnzeBXqbAgAAyPbaosOAcHlJN68beRmdagdvyR+XTyN29J+eCze3UO90wzc7ChhxNvMhLyTTDFPDTg354CAlESQNDAU2aOVAxnF2qltAZqteRuPwVPfsGxwRUVhRtC6mGy4mWIpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAYLokbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUZlscXG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAYLokbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUZlscXG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68xs3589969
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dnArw6KLSUhMLfRVFZ3IxNi4cY3VskFH0flbXQMxqU=; b=QAYLokbop2THinpe
	0d8AiEB88x0GC1G3rUUzcXdP+flZOAQHTzqZXO5Tx04jnawdeykxnhvytSuK0H4C
	+jHVDp8d/maVgwXN37zAf0Nuu+lPLLx/qMIipxPc6/NFiX2UOYrqxNwchq3gOjYs
	6v51beb1uXdPdXmqcJ52P+QMqyt7mnkImV5aCe88XhJSNI8RJZp7e41wtRKruD+/
	CGiCFqcm9j/yqA1Gi2osqp1cncslFyGWUTUZy5+mixZpGCj5gn+nRrUmkZ8HZrYa
	j/NY8uRNFzGw82r0tsxaJac7kKVIBiLZYGbkdrjLJh6WaiAAve3D/ms4KGubMmhP
	+ATxEQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9s57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:34:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088203so5114231a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789540469; x=1790145269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7dnArw6KLSUhMLfRVFZ3IxNi4cY3VskFH0flbXQMxqU=;
        b=PUZlscXGL1Z2PmG1NKc3cridJOXXQNPtmG3FuGpBtpNAsdZSeIbfhLXwz51OcQgJ5d
         Y440ijez1scYCY2rADP4qYIxfe7/uMLSUEXe4grN4pTWQwRYNuSlRZhjz3QALHdpMfPw
         i3GNQkv3CxCz5IuGXWkCVWp9xdTT6STbaj1vL6mEfWnPY8YiiT1SdWDula4xdxrtWzbo
         q1cqW/qQZGgbTXNtlfCtWRNAOCIdtPVB0PQJYQQE9+Iu6dDfntAAHgeoYhda2PNVXwLK
         gahIv8vD00CrYtMSXb15HIjt+FdipEgJ8vAqaqbnr+A350VzSaObiykqtIDffTA5/9oy
         aZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540469; x=1790145269;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7dnArw6KLSUhMLfRVFZ3IxNi4cY3VskFH0flbXQMxqU=;
        b=yfOUXATY11gOBKIexmvx/h6hOCrylVAopWsCAd/NgEZEHiuTDGwMvqunUdF316GNBI
         0A3gHpCXvAw5In0PI+PUiC0NcOnHEfCeMqfb5Lm9YL9QO/lm1Zos5krbBJQoKSb/xOr9
         WwabWkKOlvEe9RzsjxReJctbqLI/PaUo3/wGidEnAXVKpwSnnV42QCIoTPT+Yd7nHWWk
         OrF1ZFiErx9dOAvmPFV5VWsQzKHB2792O94uv3p5z6U3EINSKY1J1dI8TljSMasP6Ijl
         9P0ezhizCZO1sE5znEv0GOo+r0mOBYVkyrWTL0cSO96ed4UTjOi9j+Y+0blGSreSuhdE
         vaOQ==
X-Forwarded-Encrypted: i=1; AKwUvByM9wwIqWD/muZCgEgkLYr/JPURsmHILUKfDj0paNARkfkOu6YNSXks0dnQn0LpKmYt/pIrH5dPD7ZZW34=@vger.kernel.org
X-Gm-Message-State: AFuF++mvSXw/ZYLOVO6kbdRRSOh/r64oiLKZWNUnb47Pui7MBDSfVWRY
	JdZm5a3DmlZLv4aV/q5nbqHlJpBrw3SPhuWLJbNJIlgSFB2rYFd1ho6FvctwgUGySmZzMFgLzeE
	gRnR1HGbcQsgDiFGxEQN0Htke1Ll9tpkk/SogVleMolJqbzDTevzrWyPgBmVWSy5/78A=
X-Gm-Gg: AYBFou1GrmWLK/InSKYXLlwkk4U+kUvA3TwU4HGA1Hhye62oGeOP/kCseUVM8WCbBhZ
	ml0B8FC/41lhaSLyisQzEze/RDk8VnvMbMb1nVFiYA/+pWJOes5FPUwiTvJ5hZahqAmFXhR/SAL
	pbE8zS7DpqDWzWJuYfqbPWJnd7UucXnPhFoINb276IRw5M94AbBy1jPGJ8IA8nxK20k8El/3/uD
	kjrDAoXMc0CdAXbOlWSSR1C7T7qtVpanjjjRFosccFivJ/PbBHK6CFUUiaoGK33Pw5+KuT3UQKh
	kxjNds5Yl/9DgVfOYrtpsdt99louBkRpaATZD3fJO9Oqw1GgjfYhGR9GtbLN7X4+Cpxuo+yVMXb
	D5EbIKWHq/xS4bzbrdROk+KKVLDs=
X-Received: by 2002:a05:6a20:6a08:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3dd5f47f6aemr3310483637.12.1789540468297;
        Tue, 15 Sep 2026 23:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3d0:ba81:79b7 with SMTP id adf61e73a8af0-3dd5f47f6aemr3310377637.12.1789540467397;
        Tue, 15 Sep 2026 23:34:27 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm4289884eec.17.2026.09.15.23.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:34:26 -0700 (PDT)
Message-ID: <f9a701be-bf97-4466-9d61-733e85be2abd@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 12:04:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <nfijwr2ptpxqvdw625yedep7tmakwvkeavyeobrmig5hbkw77w@rcqyp7h4y327>
 <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
 <oicbypv7rpxmweclopi5xxpcfq5chnypp5tlqd4uix2pm5e72f@kd3bibeximjq>
 <10a091a4-89a5-4a0c-820d-c5b91dd52529@oss.qualcomm.com>
 <wjzuf7regh2rvrt3spkesp3qanooiqpkua6f7mgq6ulw5z3hvp@q2fkcu2bueow>
 <ab7b94aa-6d9a-41b2-97fd-601db1cab5e6@oss.qualcomm.com>
 <53f00c7e-8ad4-47c4-910e-a78e0c8a9626@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <53f00c7e-8ad4-47c4-910e-a78e0c8a9626@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX1AfUOFKm6Mn6
 QBJOAOpoAlLEiFQAbUnnrBV+OpH2LlS/+oRbu/qWtH3XwUbsPd870ZebRhNBhvkvnaoCV7MzZHV
 WrjmfPM9RDXcf0e358r3mrsQK390kpA=
X-Proofpoint-GUID: gIyH2LheSzHveb3VKgxDQQHNHIoIY5V6
X-Proofpoint-ORIG-GUID: gIyH2LheSzHveb3VKgxDQQHNHIoIY5V6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfXzfAgxzIw21cU
 TqDrfuxn5jtiYsCSKToUpA273Qqdx00gjZNvQKyaOKOWc6Iz8JhfdhaejaMp6xOgqaTrVNJq4yn
 fA08e/7OEg2KiPU2w+f3Ph8UwJVNXGBw6b2uk8uEcYFIZtdnvyDmucTDy5Q7z3G0wfifqUEO+ru
 PC5naTswl+KmmXt/A9sZtVVGSK7UtkbN+yPFZ4l9YL5z3fP7bKpl54a9IrQknHD9rOrIx3vjf8U
 5mSzFiXfaF2FWIQ2n+Y7TpUGAONogjhsSXthpTidIb4BeKFjf2rdxZHVuDTc+zWqF+m7/4OMPzy
 8DGoAJtXDxeYzlNENz06FHq7h8FBBYGLoeLRQ9bQCbFvH5/60p0Rh8gK24kaSHICZW9a6JT7LRI
 jvh6yJ3SZmDHATimjyD233j2JMmFwRZqfcysyxgfs5PTdNcW3WDcJSEBl4uGu9fFdvex5M+6QST
 5QyhbY6qaOue9Qy4GxA==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa3875 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MPmJ2tL_xn8LB1IlkT4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160083

Hi Dmitry,

Another reminder. Please help with your comments on below. Hopefully we
can move forward with suggested alignment.

Regards,
Harshal

On 08-09-2026 02:57 pm, Harshal Dev wrote:
> Hi Dmitry,
> 
> Gentle reminder. I am hoping we are aligned now.
> 
> Overall QSEECOM can be a separate effort for supporting older devices without
> SMCInvoke/QCOMTEE support. By moving forward with this series and with a separate
> one for QSEECOM, we will be able to support EFI variables on all Qualcomm platforms
> supported upstream.
> 
> Regards,
> Harshal
> 
> On 02-09-2026 01:41 pm, Harshal Dev wrote:
>> Hi Dmitry,
>>
>> On 29-08-2026 08:19 pm, Dmitry Baryshkov wrote:
>>> On Wed, Aug 12, 2026 at 05:00:27PM +0530, Harshal Dev via OP-TEE wrote:
>>>> Hi Dmitry,
>>>
>>> Hi Harshal, please excuse the huge delay from my side, I was on vacation
>>> and then burried under the rest of the issues.
>>>
>>
>> Ahh I was not aware, I hope you had a good vacation Dmitry.
>>>>
>>>> On 10-08-2026 12:37 pm, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 24, 2026 at 02:43:42PM +0530, Harshal Dev wrote:
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 22-07-2026 01:56 pm, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
>>>>>>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>>>>>>> Replay Protected Memory Block (RPMB) which is only accessible by the
>>>>>>>> Qualcomm Trusted Execution Environment (QTEE).
>>>>>>>
>>>>>>> Is it so? I think RPMB is accessible to Linux...
>>>>>>
>>>>>> I should have been more descriptive here, RPMB is accessible by Linux but
>>>>>> its frames can only be prepared by QTEE.
>>>>>>
>>>>>> The RPMB key which is one-time programmed into the storage controller to allow
>>>>>> authentication of the RPMB frames is generated by and only available to a TEE.
>>>>>> So on Qualcomm platforms (and many others platforms with a TEE) Linux can only
>>>>>> route the RPMB frames generated by QTEE to the storage, it cannot create and
>>>>>> write the RPMB frames itself (it doesn't have access to the key).
>>>>>>
>>>>>> While it is possible for Linux to generate/program/store this key, on Qualcomm
>>>>>> platforms we do not want Linux to do so because we do not trust it. We trust
>>>>>> QTEE.
>>>>>>
>>>>>> I will re-phrase this and make it a bit more clear everywhere.
>>>>>
>>>>> OK.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> For Qualcomm platforms without emulated RPMB support, specifically
>>>>>>>
>>>>>>> What is emulated RPMB support? Why is it mentioned here? Which platforms
>>>>>>> use emulated RPMB?
>>>>>>
>>>>>> Emulated RPMB refers to RPMB on a storage which doesn't have its own firmware.
>>>>>> Primarily, NAND/NOR storage. Unlike UFS/eMMC storage, NAND/NOR storage does not
>>>>>> have a storage controller where we can program the RPMB key to be used by the
>>>>>> firmware. So we must 'emulate' RPMB by moving the storage driver within QTEE
>>>>>> and making the driver hold/use the key.
>>>>>>
>>>>>> Qualcomm compute SoCs (Glymur, Hamoa) have RPMB available on SPI-*NOR* storage,
>>>>>> and a driver for communicating with it is also available in QTEE. And so, these
>>>>>> have 'emulated' RPMB.
>>>>>
>>>>> This needs to be explained in the cover letter.
>>>>>
>>>>
>>>> Ack. 
>>>>>>
>>>>>> I will add this detail in an updated cover letter.
>>>>>>>
>>>>>>>> platforms where RPMB is not located within SPI-NOR storage and instead
>>>>>>>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>>>>>>>> a callback request from the UEFI Secure Application to the RPMB service
>>>>>>>> running in user-space (within the QTEE supplicant [1]).
>>>>>>>
>>>>>>> Can it be moved to the kernel?
>>>>>>
>>>>>> We have a plan to move the RPMB service to the kernel similar to OPTEE:
>>>>>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/tee/optee/rpc.c#L449
>>>>>>
>>>>>> It is a work in progress. Once this happens, we don't need QTEE supplicant available
>>>>>> on the Linux distribution.
>>>>>
>>>>> Ok.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
>>>>>>>> QSEECOM based uefisecapp) does not support callback requests.
>>>>>>>
>>>>>>> How did it work then? I think Windows has been perfectly using QSEECOM
>>>>>>> rather than QTEE.
>>>>>>
>>>>>> It works because Windows on Arm on Qualcomm has SPI-NOR storage. A driver for which
>>>>>
>>>>> I have WoA devices without SPI NOR. Windows still can store UEFI
>>>>> variables.
>>>>>
>>>>
>>>> Ahh, the key point here is 'Windows'. Windows has a separate way of providing
>>>> RPMB access via a service in the TrEE driver within the OS:
>>>> https://github.com/microsoft/Windows-driver-samples/tree/main/TrEE
>>>>
>>>> However, the Linux QSEECOM driver we have here in upstream does not have that support.
>>>> And so without the QCOMTEE + QTEE supplicant combination, we cannot access EFI
>>>> variables on these Qualcomm WoA platforms when they boot with upstream Linux.
>>>
>>> So, this must be fixed, I assume? What is the ETA?
>>>
>>
>> I agree, it will have to be a separate effort. If new firmware QTEE releases are not
>> being rolled out for these existing WoA devices, and if their RPMB exists on UFS/eMMC
>> then the only way to support EFI variable is to:
>> 1. Add support for callback requests in the upstream QSEECOM driver.
>> 2. Add support for RPMB listener in kernel which routes the RPMB frames from QTEE to
>>    the RPMB device via the QSEECOM driver.
>>
>> This is significant effort for supporting a protocol which is deprecated on the QTEE
>> side moving forward. That being said, I do not discourage this effort. We can think of
>> a plan if we really want to support these devices. I will be happy to engage.
>>
>>>>
>>>>>> is available within QTEE, and so QTEE does not need to make a callback request
>>>>>> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
>>>>>> driver only exists in the Linux kernel and so QTEE must make a callback request.
>>>>>>
>>>>>> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
>>>>>> on a device with UFS/eMMC storage, it won't work.
>>>>>
>>>>> Yep. It seems to work under Windows though.
>>>>>
>>>>
>>>> As explained above, the mechanism is different for Windows. A different driver
>>>> and a different protocol. :)
>>>
>>> Let me be very explicit here. The path used by Windows is tested and
>>> verified to work on a plethora of the devices. Those devices must work
>>> with Linux too, so, in my opinion, we should use the same firmware path
>>
>> Agreed, as mentioned above, we can think of a plan to support these devices by extending
>> the QSEECOM driver.
>>
>>> and the same firmware interfaces as used by Windows.
>>>
>>
>> The interfaces used on Windows by the TrEE driver are different as per the information
>> I obtained from Windows team. But we don't need to worry about that, we already have
>> QSEECOM in upstream which we can extend.
>>
>>>>>>>> And on
>>>>>>>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>>>>>>>> QSEECOM interface fail due to lack of support within Qualcomm TEE.
>>>>>>>
>>>>>>> So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
>>>>>>> supported. Does it?
>>>>>>
>>>>>> It doesn't, this API returns -2 if I add RB3 Gen2 in the allow-list for QSEECOM:
>>>>>> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom.c#L46
>>>>>
>>>>> Does it support QTEE-based uefi variable storage?
>>>>>
>>>>
>>>> It does, the QTEE-based uefi variable storage app, i.e. uefisecapp is loaded by
>>>> UEFI on RB3Gen2, however, the QSEECOM interface on RB3Gen2 is broken so it misreports
>>>> it as 'not supported'. But the app is loaded and available, which is why if you apply
>>>> this patch series, you can communicate with it. Just make sure you take the QTEE
>>>> release mentioned in this cover letter.
>>>
>>> Can't we fix the QSEECOM instead, if one needs to flash another release
>>> anyways?
>>>
>>
>> QSEECOM is deprecated, requesting support for fixing it is an overhead at this point.
>> Even if we take the time to fix it ourselves, it won't help, because the QSEECOM driver
>> doesn't support callback requests and a path to the RPMB device within the Linux kernel.
>>
>>>>>>>> On these platforms, a TEE based uefisecapp client driver is required to:
>>>>>>>> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
>>>>>>>> 2. Ensure persistence of non-volatile EFI variables via writes through
>>>>>>>> the RPMB service hosted in the QTEE supplicant.
>>>>>>>>
>>>>>>>> This series introduces such a uefisecapp TEE client driver for the
>>>>>>>> aforementioned Qualcomm platforms which installs efi-var operations _if_
>>>>>>>> the QCOMTEE driver registers support for an object-IPC based uefisecapp
>>>>>>>> service on the TEE bus during its probe. Only new QTEE firmware versions
>>>>>>>> available at [2] provide this support.
>>>>>>>
>>>>>>> What about existing WoA devices?
>>>>>>
>>>>>> New Windows on Arm devices like Hamoa/Glymur work perfectly fine with existing
>>>>>> QSEECOM based uefisecapp. But they will also work with this new QCOMTEE based
>>>>>> uefisecapp once they upgrade their firmware.
>>>>>
>>>>> Do extisting commercial devices suppot it? For example, does Lenovo T14s
>>>>> support it? Will it continue to work with this patchset in place?
>>>>
>>>> Existing devices like the Lenovo T14s do not have mature QCOMTEE/SMCInvoke support
>>>> on QTEE side and new QTEE versions for it are not being rolled out. However, this
>>>> QCOMTEE based uefisecapp driver and the QSEECOM based uefisecapp driver can co-exist.
>>>> It will not cause any breakage of existing working functionality since the QSEECOM
>>>> path can probe and continue as usual.
>>>
>>> My understanding was that QTEE path completely disables the QSEECOM
>>> path, does it not?
>>>
>>
>> By 'QTEE path', I believe you mean the 'QCOMTEE/SMCInvoke' protocol path.
>>
>> No, both SMCInvoke/QCOMTEE and QSEECOM paths can be supported simultaneously within QTEE.
>> QTEE does not disable the QSEECOM path when it enables the SMCInvoke/QCOMTEE one.
>>
>> You can have both QSEECOM and SMCInvoke clients running together on a Qualcomm platform.
>> QTEE doesn't impose any restrictions. The control/data paths within QTEE for these
>> two protocols are completely isolated from each other.
>>
>>>>
>>>> As per your comments on patch 6 of this series, I plan to enable the QCOMTEE based
>>>> uefisecapp as default 'm'. That way we don't need to enable one over the other and
>>>> will continue supporting all existing functionality while extending it for devices
>>>> with UFS/eMMC storage and running upstream Linux.
>>>>
>>>> Do let me know your opinion on it.
>>>
>>> My opinion is very obvious by now. Existing devices should work. _Must_
>>> work. They provide the reference interface. Make them work first and
>>> work good. Then explain, why the other interface is better (I fail to
>>> see it from your cover letter or from any of the commit messages).
>>>
>>> When I take a Glumur laptop from the market shelf, will it be QSEECOM or
>>> QCOMTEE? If I take the next-generation-after-Glymur, will QTEE interface
>>> for uefisecapp be supported there? Will it be used by Windows?
>>>
>>> I think the series fails to answer, why do we need another mechanism, if
>>> we already have one which has been working for the past N years and
>>> which is supposed to work for another M years?
>>>
>>
>> At this point, we have the following categories of devices:
>> 1. Devices with only QSEECOM support, but no support for callbacks/RPMB listener within
>> Linux QSEECOM driver.
>> Example, MSM8998 and older WoA laptops. These are very old devices (at least more than
>> 6-7 years old).
>>
>> 2. Devices with both QSEECOM and SMCInvoke/QCOMTEE support.
>> Example, SM8650, *Glymur*. These are relatively new devices (2-5 years old).
>>
>> 3. Devices with only SMCInvoke/QCOMTEE support.
>> Example, RB3Gen2/Kodiak, IQ-9075/LeMans and newer devices which might not have
>> QSEECOM support in the future since QTEE team has deprecated QSEECOM.
>>
>> This patch series helps devices in category 2 and 3. Without the mechanism introduced
>> by this series, we will end up in a situation where EFI variable based use-cases will
>> become impossible on at least category 3 of devices. We must conform to the reality
>> that QTEE firmware is transitioning to SMCInvoke as the protocol of choice with
>> long-term committed support.
>>
>> At the same time, I am aligned that we must think of a way to support devices in category 1
>> which is what you really care about. The QCOMTEE and QSEECOM drivers can co-exist, and so
>> by adding support for both this patch series and callback requests to the QSEECOM driver
>> (at a later point of time via a separate series) we will be able to provide EFI variable
>> support on all Qualcomm platforms under the sun. This will accomplish our common goal.
>>
>> I will add this information in the cover letter in a concise manner.
>>  
>>>>> What about other existing devices? We have WoA devices starting with
>>>>> MSM8998. The QSEECOM driver works on them, but, as you mentioned, it
>>>>> can't flash updates to the backing storage.
>>>>>
>>>>
>>>> Unfortunately, unless we roll out new QTEE firmware versions for devices like MSM8998
>>>> with QCOMTEE/SMCInvoke support + access to the Uefisecapp over SMCInvoke protocol,
>>>> they cannot be helped with this series.
>>>
>>> So, I'd say, the series is strange. We are proposing something which is
>>> not rolled out, which is not supported by the exsiting commercial
>>> devices, etc. On the other hand we have future gaps which are known.
>>> This doesn't sound correctly.
>>>
>>
>> We are proposing a mechanism which supports the majority of Qualcomm devices in the market
>> launched within the last 5 years and also the upcoming ones. The category of devices which
>> are not helped by this series are extremely old (at least 6+ years). Regardless, I am not
>> pushing the view that we do not care about those devices, just that the route to helping
>> them is different and orthogonal to this series and I am happy to engage on it separately. 
>>>>>> I need to double-check but this firmware release for Glymur on Qualcomm Linux
>>>>>> is probably carrying the support for QCOMTEE based uefisecapp access:
>>>>>> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
>>>>>> If not, the next release will definitely have it since I have merged support for
>>>>>> this in QTEE and talked to the boot firmware release team about this.
>>>>>
>>>>> Does it work on the CRD?
>>>>>
>>>>
>>>> Yes it does, I have validated on Glymur CRD by locally switching it from the current QSEECOM
>>>> based uefisecapp to this new QCOMTEE based uefisecapp. This is the QTEE release which
>>>
>>> Why do we need to switch the app? Why is the old one worth switching?
>>>
>>
>> You do not need to, Glymur supports both QSEECOM and QCOMTEE/SMCInvoke. I just used Glymur
>> as an example to show that both work there and if a user wants he can chose one over the other
>> (It really doesn't matter). Glymur sits in the middle of the old and the new, it is a category 2
>> device as mentioned above. 
>>>> needs to be consumed for it:
>>>> https://github.com/qualcomm-linux/meta-qcom/commit/5590c1dc631827624c110df282965b85ef2a2e60 
>>>>
>>>>>>
>>>>>> The next planned firmware upgrade for Hamoa will also provide this support for
>>>>>> Qualcomm Linux. And similarly, for all other targets being supported upstream.
>>>>>
>>>>> So, we are forcing users to upgrade to the new firmware? That doesn't
>>>>> sound nice.
>>>>>
>>>>
>>>> We have an open ecosystem for all devices supported by the Qualcomm Linux distribution,
>>>> users can easily consume new releases (and new QTEE versions) to access new features.
>>>> Until now, developers/users of RB3Gen2 or IQ-9075 could not access EFI variables to
>>>
>>> What stopped us from delivering the TZ apps compatible with the existing
>>> interface?
>>>
>>
>> QSEECOM support is deprecated on IQ-9075 and broken on RB3Gen2.
>>
>>>> develop use-cases such as secure-boot key revocation, but by taking this patch series
>>>> as part of a subsequent Qualcomm Linux release, they will be able to.
>>>>
>>>>>>>> Thus, QCOMTEE now maintains a static list of always-available object-IPC
>>>>>>>> based secure services exposed by QTEE. These services are implemented either
>>>>>>>> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
>>>>>>>> usually loaded by the bootloader. The uefisecapp TA is an example of a
>>>>>>>> preloaded TA loaded by UEFI. A static list is required since QTEE does not
>>>>>>>> yet expose any way to dynamically query and enumerate the services exposed by
>>>>>>>> it.
>>>>>>>
>>>>>>> Can it be fixed instead of having static lists? In the end, we can't
>>>>>>> guarantee that users update the firmware.
>>>>>>>
>>>>>>
>>>>>> Unfortunately, no existing QTEE release out there currently has this support.
>>>>>> But support for this is currently being added by QTEE team last I checked with them.
>>>>>> Once it is available, and a new QTEE firmware release is out there, we will add
>>>>>> support for dynamically querying QTEE services in the QCOMTEE driver. 
>>>>>
>>>>> It seems you are still rolling out QTEE-based support. In such a case,
>>>>> please go back and implement dynamic detection of QTEE services.
>>>>> Otherwise it would be a nightmare.
>>>>>
>>>>
>>>> We are working on it, but until then there is no overhead involved in maintaining
>>>> this static list of services because we don't have to extend/modify this list when
>>>> adding support for a new Qualcomm platform upstream. If a particular service from
>>>> the list is not implemented/accessible from QTEE we log the event and silently avoid
>>>> probing the TEE driver for the service. We also don't add platform specific services
>>>> here. So the list doesn't need to be extended on a per-platform basis.
>>>>
>>>> So unlike the QSEECOM driver, we don't have to keep maintaining this list forever
>>>> for all new platforms.
>>>
>>> I don't see a difference. You are saying that the list implementation is
>>> good, it silintly skips the unavailable services, etc., and then you say
>>> that you don't have to keep maintaining the list.
>>>
>>
>> We only have to add services to this list when a client driver appears for it. For
>> example, this TPM series by Kuldeep:
>> https://lore.kernel.org/all/20260831-tpm_qcom_driver-v1-1-6f16fa6924fa@oss.qualcomm.com/
>>
>> We don't need to maintain this list on a per-platform basis unlike QSEECOM:
>> https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/firmware/qcom/qcom_scm.c#L2289
>>
>> Support will arrive for dynamic detection, I have commitment from QTEE team for somewhere
>> around end of the year. :)
>>
>>>>>>>> To facilitate object-IPC interactions from the kernel-space, this
>>>>>>>> series also introduces a tee_client_object_invoke_func() to allow
>>>>>>>> invocation of TEE objects similar to the existing tee_client_invoke_func()
>>>>>>>> API exported by the TEE subsystem which allows invocation of TEE functions.
>>>>>>>> Some suporting changes are also introduced to track and handle operations
>>>>>>>> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
>>>>>>>> driver.
>>>>>>>>
>>>>>>>> Finally and as previously mentioned, access to the object-IPC based uefisecapp
>>>>>>>> service is restricted on older QTEE firmware versions. A new QTEE firmware
>>>>>>>> release must be picked up from QArtifactory [2] for all upstream supported
>>>>>>>> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
>>>>>>>> driver.
>>>>>>>
>>>>>>> What about fused devices?
>>>>>>
>>>>>> The procedure for updating the firmware on fused devices is slightly different.
>>>>>> The firmware images need to be signed by the OEM using the security profile
>>>>>> of the chipset before flashing/upgrading them. Security profiles are now public:
>>>>>> https://github.com/qualcomm/security-profiles
>>>>>
>>>>> Will OEMs release new firmware images? What about the devices which are
>>>>> already out of the support phase? This whole story rotates about the 'we
>>>>> are releasing new firmware with new features' paradigm. However there
>>>>> are existing devices in the field, which typically can't be upgraded,
>>>>> From your cover letter it seems they can't support UEFI variables
>>>>> properly. However they do so in Windows.
>>>>>
>>>>
>>>> Yes Dmitry, this series is effectively forward looking. QSEECOM protocol/driver
>>>> support is essentially deprecated on QTEE side, no new features added to QTEE support
>>>> it, and it also doesn't work on many devices like the RB3Gen2.
>>>
>>> To look forward, we need to have a good firm stand on the ground. We
>>> have a half-baked implementation, based on reverse engineering. No RPMB
>>> support, etc.
>>>
>>
>> Agreed. I am happy to engage on a separate series for adding callback support to QSEECOM
>> driver along with RPMB listener within the kernel.
>>  
>>>> For existing devices, if they boot with upstream Linux and have RPMB located on
>>>> UFS/eMMC this patch series cannot help them. But the focus of this series is not on the
>>>> past, it is on currently supported and future hardware. Every new Qualcomm platform
>>>> whose support is being up-streamed or is planned to be up-streamed will have access to
>>>> EFI variables via this series.
>>>>
>>>> If someone wants to add support for older Qualcomm devices to access EFI variables
>>>> via QSEECOM that patch series will not conflict with this one. Like I said, both
>>>> QSEECOM and QCOMTEE based drivers can co-exist.
>>>
>>> What will happen if I build both and boot the kernel on the existing
>>> devices?
>>>
>>
>> QSEECOM and its client driver probe first and establishes the path to uefisecapp for
>> providing EFI variables service. QCOMTEE and its client silently fail probe.
>>
>> Regards,
>> Harshal
>>
>>  
> 

