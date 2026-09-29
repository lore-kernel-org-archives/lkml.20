Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6265476C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704243; cv=none; b=HNhB+4+HYWnCh/fYI2QGMfNpmC3JM3P4+Eb9TB+6nSCrx2HhKmU9B4ellMx780xCg5DdJyj05oruhlrxx5pfndnNjEC6R6CjrvphJdLgr+6cDwIctBKiQk1IGzQI0IdoEzlV/rkRWSnc6vrlIXuQj5pm8bNIEOwZC2c+PZw3wIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704243; c=relaxed/simple;
	bh=w+lD0u9FSU16YpYBvLmPZ2JygzZ5+JD87LuSQxqckqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqk2A45erH/8C9Hr/Gh2xYeXmD7wAh1BXs/D0gDzHtz04VNDHKLRLZ/9ehcDaKdEx38XU9gClGc1c/ldCmq7Nfrw8oHqxz3vI3dO4hDwg+G55pLNG5QUMghWw9sQeiNugTi2hMi6qVWu2bDdOQuRj+9ZPyJ2JPKDs+wg0LeC3D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZrQ9Fzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWH7bezW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZrQ9Fzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWH7bezW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THiSgW1275901
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KoyF9Zzd47qphYG8RQTQrYj6FBn+9xfx6cR3mcgi+UA=; b=IZrQ9FzpwogfVnHN
	ScGnK3xJYzW6MnEe2nRQhG3EaD2R6vtZO1DDHSSK/8YALapi66SKHPZSvCi24frY
	61zby/ucyNLMSEEUG8eWdR4WUcS649w42a7aZ82TLBQg9KYC1bwjiQZwqTuHZPgL
	8aHrzKOiwKnGTjRMuiwdmkXio9qLAGBPdqbLPgJP9KLFnakXrvhO7LIQiHidoapT
	cNjhjosg3IQm12C+HmN132iQILCFGJdbtpjY/eUgDM0aNcgJR7nZ/pRWUsB2sObB
	KboTHPXpwvVjIw7T3OvJSivrZQHQxTIxQb4Y6eM45nKFUn2AGyRqTy1/NuHmT34M
	Ri+vfg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0eg0um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:50:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3471500c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790704239; x=1791309039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoyF9Zzd47qphYG8RQTQrYj6FBn+9xfx6cR3mcgi+UA=;
        b=dWH7bezWEQj1vZvV5JQuyg0Efa9v4J9M3Fkf2kz/r1CyUwtNu69Uci3rgkRFs98KDT
         y8CIDVzI0VAGZwAsVnc3y1J+lot4IjxY/v1YfpaAF/MLhxyX+VqOWiiD4EDTl/rmjmTo
         WNzZJG161+akuZWLnPGScRTKK0Dx8A8G+oVzg/aXXh5jFBnvEjB5Y9GIJ9+ilsTi/Hjq
         DCMBEkWaqzuRAx/ZfWVblum7SfnHFRKkW/FUAElij2mSilmoG3Nx5tbrqZvO2Qz5QtrO
         EIS07U4Fia+NHSAR9N+pY7ajb84A932gCekqM3mz+dExehTOoJQfajj0SQXicGlYu6vJ
         XSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704239; x=1791309039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoyF9Zzd47qphYG8RQTQrYj6FBn+9xfx6cR3mcgi+UA=;
        b=NscreVvlWzSaZoYbZ8RyxPZWjCbNvooPJOlzV3959MR4pNMgsDHjbkzLQbpGRFlk6c
         l/bfd1qNM0TL2HCRbmnvF58oM+MOnZy7de5btNmYpV+a8CRg6L2sWeKHI2kfpT5Ihtn0
         HlWTidUymrIX894qtmxddUdaBmSCZhho3BWeSuo7m6h/Gmihwznbp4FUkkVJfDb2v2DP
         Inkkrkg1OKSXgIxV3d7GURmCSiUpb5Yt9u0s1bklHYXqwOlR8+xq75Bn7MLwjDU7ay+e
         pGA+FNDxbeJlAlDTDMpxHqJEFJ7fzNGFf7J2D62Bf7K5uiP5W5vFRswMRbQR4J3EBO9p
         JopA==
X-Forwarded-Encrypted: i=1; AKwUvBx5dP8fU7gQ71m272FfuzfpXr3d/f6wSNGAqMt0fBA5pzJ0IDOt5/lDnMQ4IKF2+1HUNBL+GoHQO6mE5r8=@vger.kernel.org
X-Gm-Message-State: AFuF++kiz69dyjj4sP64na+tjI5okbyq8oeGPbjDFrWBP50LxiO+WolA
	19SGBhSSKjFVwhEuVxXs9hjxhnnYRSSjwoaRhoTcR5fXV9ozPWteBW2ATxKJbWTZmusDRiOusrr
	aQN/ZG9UGRRgkwsRZGHRQclfR9e4IYkQwya9mpAVAoL+oCzgeJdkK/Zw7YNvTNdBdLmQ=
X-Gm-Gg: AYBFou3dmUhTcPr+IfxRYTGISFX2DY+oxB1B79s5v25+ZEYEkm7GAuvAPo9gYSC4JWz
	GZH8ce5tYlx/NBptqmHM304ZhGFT61tG873zXYOZne4j7QUSzKqfcV8zDpKHAzinkE0h/1rfm+q
	ilTtr71lEj2WqaflkXhCwHlg/4RZzm2BE+guETty5XyRQAiyQ4/gjrHBAdZatF+w4Q0lCAVLf2Y
	KLN8iNGZTxszCsTGU/hVnHHzTNEJ5DVGRjR1CAdbYYaXRJV1DdEtBAoQHoE38wEm9JNruSrh/Qv
	WDo457YnTmJjQI1Yc7S1lXhiSiq9cLJwBigMFvq/pU3AF5tzYkpdbu2VNryeEVNNf5646y/2b8I
	Zm9DfofRneqmMcf6G61vW/vNJsWLf7YDtFnvqDhrO1QMXuoWQ1xn2pZSyadR8KUPaUg==
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr15034190c88.20.1790704238225;
        Tue, 29 Sep 2026 10:50:38 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:144:ed03:7c66 with SMTP id a92af1059eb24-146ce680be2mr15034144c88.20.1790704237502;
        Tue, 29 Sep 2026 10:50:37 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.245.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c6479db30sm640403c88.14.2026.09.29.10.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:50:36 -0700 (PDT)
Message-ID: <810672ba-bd18-46ee-9716-37f443d4a7c1@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:20:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Selvarasu Ganesan <selvarasu.g@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <CGME20260929051941epcas5p27a5c69151937b9105660941776cda819@epcas5p2.samsung.com>
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <e8b9b694-0ba5-4d0f-97c9-ceeb89ae4729@samsung.com>
 <647d8c0e-9323-4b1e-9720-9e51ea8e3227@oss.qualcomm.com>
 <86aa3ea4-d453-4de2-8948-c5887e7a2142@samsung.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <86aa3ea4-d453-4de2-8948-c5887e7a2142@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abbfa70 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=sNyD8o0HqZJu/sFm8jCfCw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=AhpSn6_gRgcaU1u8A2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bpkDHNkG3qGXfQdZj7J4knPHP_JQenMC
X-Proofpoint-ORIG-GUID: bpkDHNkG3qGXfQdZj7J4knPHP_JQenMC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3MSBTYWx0ZWRfX0cz3AsUgS5RO
 uGiQJJJL0cNT0dYDR14kF5fVc8ElKVAmPpCANDHMKwjMC1H5DPgfelPuxOAsAg9+y7kr4qxAISy
 MNe1AL6XgHIWB2Np8xoAnMZUqg80Arg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3MSBTYWx0ZWRfX2MTC2lVESITN
 0GD8UyPeKP/Nbwr7UA2vDFyIVjjSbdjfDwNicihhVCy0DSD/juQHFjokMmwblBdwCbHlwxozxvS
 stad9koOSCzJ83DLzlTIixFixHQvnjyyXJ/DWa8tdKVJKSMH1APyBflCUMaKXAMb9s8OorApzJm
 rWZ8cHNa46Kwx+YM9Ryo5CBPETSwJH9Ht9a6YbKWz/kA54/YLJAbq+7YIiNVqJMVxTXi6n/3H4I
 8D/8N1UAG/BX4WQf3gwkYFXlSbRVLi6/wcbUbgGVEU1M9DD5WrpQw6ZmRjhIKsWdsIZVcG8aIio
 qBjH/mGhUltgwOjQYJHvbpp4CdaAX62lu14DbdiZxPgKAVOmLFOnErj8z/wBqKa7ScjUgsS6BCi
 QwuLCFLiYI6tBLzSISfoKMBNn9TdYNmNXPos8fjbf9kyyyCi0j1LPGmccG7+vzNWwSfgbLZBrC9
 tlylYk2dkvK2BoXTHUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290071



On 9/29/2026 4:32 PM, Selvarasu Ganesan wrote:
> 
> On 9/29/2026 2:05 PM, Krishna Kurapati wrote:
>>
>>
>> On 9/29/2026 12:15 PM, Selvarasu Ganesan wrote:
>>>
>>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>>> are generated by the controller and all CSR register reads give "0" and
>>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing
>>>> out
>>>> or timed out.
>>> Hi Krishna,
>>>
>>> As per our discussion with synopsys we got a below feedback for CSR
>>> timeout in different issue.
>>>
>>> "Note: CSR timeout is not expected to occur during functional mode. Once
>>> timeout is reported by controller, s/w should treat it as a fatal error
>>> and should identify the root cause of issuing the parallel access during
>>> soft reset and fix it"
>>>
>>> As per our understanding, there is no recovery from CSR timeout.
>>>
>>> Are you able to recover from CSR timeout in your case even after trigger
>>> controller recovery?.
>>>
>>
>> Disabling and re-enabling gadget mode is the recommended fix. I did
>> not test this particular patch as mentioned below, but this error
>> recovery mechanism does the same thing as a soft_disconnect followed
>> by soft_connect.
> 
> Hi Krishna,
> 
> Thanks for your update.
> 
> We tried to recover from the CSR timeout, but it was unsuccessful. The
> sequence below is provided for your reference.
> 
> It would be best to identify the root cause of why the CSR timeout is
> occurring in your case.
> 
> Issue Sequence:
> 1. Start core soft reset
> 2. Parallel access of other registers
> 3. End core soft reset
> 4. Getting CSR timeout
> 
> 
> Try to recovery from CSR timeout:
> 5. Clear CSR timeout bit by RW1C same bit
> 6. Start core soft reset
> 7. End core softt reset
> 8. Access other registers
> 9. Getting CSR timeout
> 

Hi Selva,

  As per official issue description we got from SNPS:

---

Problem Description:

If a USB disconnect happens during 0-length IN 2.0 transfer or if the 
host aborts the 0-length IN 2.0 transfer on a Transaction Error, the 
driver application fails to access the RAM data subsequently. The read 
to the RAM registers returns all-0. Some EndPoint commands hang without 
completion as they need to access the RAM locations.

---

Root cause:

For normal transfers, the AXI BMU (Bus Master Unit) module reads the 
data from the memory and issues a transmit Command Request to the MAC to 
transmit the data to the USB Host.

• Once the data is successfully transmitted to the Host, the Done (with 
success) handshake is provided back to the BMU from the MAC.

• If the data is not successfully transmitted, then a Done (with 
failure) handshake is returned, so that the BMU can re-attempt the same 
data again by rewinding its data pointers.– But, if the USB IN is a 
0-length payload, then there is no need to rewind the pointers and the 
Done (with failure) handshake is not returned for failure case. This 
keeps the Request-Done interface busy till the next Done handshake. The 
MAC sends the 0-length payload again when the host requests. If the 
transmission is successful this time, the Done (with success) handshake 
is provided back. Otherwise, it repeats the same steps again.– If the 
cable is disconnected or if the Host aborts the transfer on 3 
consecutive failed attempts, the Request-Done handshake is not
complete. This keeps the interface busy.

• The subsequent RAM access cannot proceed until the above pending 
transfer is complete. This results in failure of any access to RAM 
address locations. Many of the EndPoint commands need to access the RAM
and they would fail to complete successfully.

---

Workaround
• Issue the DCTL[30] Soft Reset and re-initialize the device controller

--

Error recovery work does the exact same thing and hence we are invoking 
that in gadget_ep_cmd when registers read all zeroes.

Regards,
Krishna,


> 
> Thanks,
> Selva
>>
>> Regards,
>> Krishna,
>>
>>>
>>>>
>>>> The issue comes up on different instnaces of enumeration on different
>>>> platforms. On SM8550, the debug log is as follows:
>>>>
>>>> Prepared a TRB on ep0out and did start transfer to get set
>>>> address request from host:
>>>>
>>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>>> status: Successful
>>>>
>>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>>
>>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>>> Address(Addr = 01)
>>>>
>>>> An XFER NRDY is received on ep0in for zero length status phase and
>>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>>> status phase:
>>>>
>>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>>
>>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>>> sofn 00000000 (HLcs:SC:status2)
>>>>
>>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>>> Successful
>>>>
>>>> A bus reset was then received directly after 500 msec. Software never
>>>> got the cmd complete for the start transfer done in status phase. Here
>>>> the RAM interface is stuck. So host issues a bus reset as link is
>>>> idle for 500 msec:
>>>>
>>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>>> Reset [U0]
>>>>
>>>> Then software sees that it is in status phase and we issue an ENDXFER
>>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>>
>>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>>>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>>>> Timed Out
>>>>
>>>> Upon debug with Synopsys, the root cause is as follows:
>>>>
>>>> During any transfer, if the data is not successfully transmitted,
>>>> then a Done (with failure) handshake is returned, so that the BMU
>>>> can re-attempt the same data again by rewinding its data pointers.
>>>>
>>>> But, if the USB IN is a 0-length payload (which is what is happening
>>>> in this case - 2 stage status phase of set_address), then there is no
>>>> need to rewind the pointers and the Done (with failure) handshake is
>>>> not returned for failure case. This keeps the Request-Done interface
>>>> busy till the next Done handshake. The MAC sends the 0-length payload
>>>> again when the host requests. If the transmission is successful this
>>>> time, the Done (with success) handshake is provided back. Otherwise,
>>>> it repeats the same steps again.
>>>>
>>>> If the cable is disconnected or if the Host aborts the transfer on 3
>>>> consecutive failed attempts, the Request-Done handshake is not
>>>> complete. This keeps the interface busy.
>>>>
>>>> The subsequent RAM access cannot proceed until the above pending
>>>> transfer is complete. This results in failure of any access to RAM
>>>> address locations. Many of the EndPoint commands need to access the
>>>> RAM and they would fail to complete successfully.
>>>>
>>>> Furthermore when cable removal happens, this would not generate a
>>>> disconnect event and the "connected" flag remains true always blockin
>>>> suspend.
>>>>
>>>> Synopsys confirmed that the issue is present on all USB3 devices and
>>>> as a workaround, suggested to re-initialize device mode.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>> This series has only been compile tested. The issue was reproduced
>>>> easily with a certain kind of cable and CDP port of AMD based Lenovo
>>>> laptop. I don't have access to the cable currently and hence only
>>>> compile testing the fix for now. But the issue has popped up on OEM
>>>> testing as well.
>>>>
>>>> Also, didn't add locking while calling error recovery work in
>>>> gadget_ep_cmd since the caller is supposed to handle it.
>>>>
>>>> Changes to v3:
>>>> - Using error receovery mechanism from [1].
>>>>
>>>> Link to v2:
>>>> https://lore.kernel.org/all/20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com/
>>>>
>>>>
>>>> Changes in v2:
>>>> - Implemented gadget recovery mechanism during gadget_ep_cmd instead of
>>>> handling this issue only during disconnect.
>>>>
>>>> Link to RFC:
>>>> https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/
>>>>
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/20260915110637.17658-1-jiazi.liu1984@gmail.com/
>>>> ---
>>>>     drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>>>     1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index ee837235630a..a7c4514cf0e2 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3
>>>> *dwc, unsigned int cmd,
>>>>         return ret;
>>>>     }
>>>>     +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
>>>
>>> Where is the function implementation for this function?. Could you
>>> please point me on what you are doing in this function?
>>>
>>>
>>> Thanks,
>>> Selva
>>>
>>>
>>>> +
>>>>     /**
>>>>      * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>>>      * @dep: the endpoint to which the command is going to be issued
>>>> @@ -432,6 +434,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep
>>>> *dep, unsigned int cmd,
>>>>             cmd_status = -ETIMEDOUT;
>>>>         }
>>>>     +    /*
>>>> +     * STAR 5001544 - In some situations, like the cable is
>>>> +     * disconnected or if the Host aborts the transfer on 3
>>>> +     * consecutive failed attempts, the Request-Done handshake is not
>>>> +     * complete. This keeps the RAM interface busy.
>>>> +     *
>>>> +     * The subsequent RAM access cannot proceed until the pending
>>>> +     * transfer is complete. This results in failure of any access
>>>> +     * to RAM address locations. Many of the EndPoint commands need to
>>>> +     * access the RAM and they would fail to complete successfully.
>>>> +     *
>>>> +     * If the depcmd doesn't match the actual command, trigger
>>>> controller
>>>> +     * recovery.
>>>> +     */
>>>> +    if (DWC3_DEPCMD_CMD(reg) != DWC3_DEPCMD_CMD(cmd))
>>>> +        dwc3_schedule_err_recovery(dwc);
>>>> +
>>>>     skip_status:
>>>>         trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>>>
>>>> ---
>>>> base-commit: ab29ca7714b82485ebb31d66835ccd5364221a76
>>>> change-id: 20260929-ram-interface-stuck-v3-aaf0c4b13b98
>>>>
>>>> Best regards,
>>>> -- 
>>>> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>

