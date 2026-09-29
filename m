Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCB47729A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670965; cv=none; b=i0XWv/FdCRqLM6g9wzxnu8RKKvtWCObJiKa4GtCXZcC+Pxr7dGrZfG3nkc9ZHEW9lpU/HgD75zZ9h0fqrXWrgD4jLujyWC+oE9SoSkVuoArYKaM3AMIrhcVlxwwXA3Y+BRe95cY8lsBkuYKnC+FSqI/pwUEOOw8EKM/5n0xF2+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670965; c=relaxed/simple;
	bh=vDHz0DAqA5MD+CahZEBLaSzq+QTld+VPqz3iHZcp718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tK2D0tko2be9LCEPKE4QmdMqy3DibJWR1ZEvNOneFJ8P03uroHtTbjTFd8XU0SBOVShoQdOT/u2TuU2979Btb7r2fvMqPK3xGkfoA3e+Dhi64Tq+XeMBNxhdFVjpv+tNhJ/+b1Nu4SHFiyAWPmiy61LoNVsk02jli3Bc5JJAjNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSU2C6Ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCacsUOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSU2C6Ut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCacsUOQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U3ik3127867
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=; b=aSU2C6UtHw8heWth
	KUMPzrKiDufNk5QyNwPPqy41HRjgrYGpWVGJqpCrEq9pIntoJ5neqIe6/+k1BeJy
	8QD/lwVR5SMwdxfHfnM1yg8Y2DACCLodGs6IWb6zjqHhwCK4cmsCiTkiBTEnCWgr
	Y/u8bfweHWUN/JJ3wDd3ZkS0UAsdfYSiRGOarMs5T0JqIV00oerJeo9QGeCTGmuJ
	B5tCHVqUjvMVY2g65jOusa2zeps/Wg7ePdcLJbvkHqB78ubVGErV0+pK6sK4auNF
	0sOiDbxA6YuQ5hHDaR0ZAPyteeJ4LUqj6O1P7pqsFqSpkskJTA79BjX4O4ibgAXl
	aeh86A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjhpqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:35:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2654307a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670958; x=1791275758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=;
        b=OCacsUOQuyBQ6d7rv9IzbGyKsCafoX1JehK1pbsV5ujRekAVu9yp8q2+RRvAhTZR+G
         uX57UAUdj/vTeT2FF1n57s584fQOl6AZVN/JXrFzbhlUWq0JAHcqXzCcXA9zcbYbg5zn
         6ZI0f1iee6pkwttuTBd1GHt6nma6eVrtejQOfEnmH+jY4MmwnQmhIBka9xBV/tJtVqV3
         Rv7+vLw55w4LDN3WmJqHm0dwFl9qO6z0yUwGMp5A8TW7WIxBSOokXM614dmoMkA2wvHB
         EHQZ46E8Mfy4IWo6KgzvfAAwZi/Q/H1geXDyv7TjTNn3o+nXL2Tj5YBmBR0xfu5vAXcc
         YB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670958; x=1791275758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pF1P5OcHLv/aoX+LRZz7GRT/2F/cIdD0NlBp0emSFeM=;
        b=EuR5j0BxAHl6aeZMq1PUdhPTwej6aJvq6yiQe1CssbMl+cqMWT4dI5i4xXPCPdSBSX
         MlEZPVeRtPGf/CrAMHFm9MDP1X2/aY/gLZRBnqby4gWXoMeur2tVRzGoAG66pYybuQs3
         mgcZTWAJdUZBABLwdWg2XFlfSL8E7DrzL0FbfsILF2lA0GnbvLNxqbSph9FfBj7ToGDa
         pdPXy9w+Wm9EAw5GnSn/5WmBV9iPhgLHFWl1NDbEVkg8ZbpDor5TqmEXxwCidy4EnFp4
         QevA3h8/F5TFo67aX1xERm+hw4yj1a9kqkBlykERpmWYo28uX9yKtZRpsWIockcn0gMP
         s72g==
X-Forwarded-Encrypted: i=1; AKwUvBxMmtggK8RbKr/0KfHYs6xzE9BzJBWmNUEQSinL3T7jBtfa1hzigT15hgT0qvZD5YPJ7d2TcaZZ5isJLJc=@vger.kernel.org
X-Gm-Message-State: AFuF++kN/8prdbmvo0JD0DvvClntgruxT7qfpmM4D+RyWghk1AgOmTQS
	NNyn1z3z/I3GWK35TlQvrk1rqo05kzJVmROtHJk+At2yjRu9ho3Wzi6n9N9g+Po6IXIRgdpQWZV
	Ue6MgQWufKsZ/kFMDo2MdQNyRPcjzP5UNP80z0Q7J4ot5dxCq3L7LRy5s0HJOCBY7JOY=
X-Gm-Gg: AYBFou2GoMfZ4mvMLr9YDcu4YJGPugZ2+6zjHEuIqE+/AF+zPbVHn9/kQ1NpbcKpwNh
	QWRpmRkm7rfCQ/+I9n/QLFFZeX8Vn2lFtOGgVj3+A5okY9loke/d2Wjk8DeIq73l8KyhXk3aZic
	G1kg+2wxwiSUQocd1vmUz8AG0acjP15nl053m2dNTzMXHWwZY/Cp6Ywztk92XwtBHcEtOIJ14Cp
	JdTDUVZ7eHudTmLoHTtLxy8y3RJolTIXWCtKTpwp31tbkobQKNVeah0FMm6wPAhtu8ktE30+EEw
	BegBhsTvFN9LA+9GZRk8T0K+wYTWFaD6qpus7WHOfiaLgT5TkolWdoeAgeUfxs8sksrwQjMXXK8
	F3KIoyZ9u54/Qu4uV1PexSFJVuemW2OwBHcPk6DA+bbJFZvEkP8ix99LZyX8Uy1px
X-Received: by 2002:a05:6a20:3946:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3de0e6c295bmr13747114637.23.1790670957570;
        Tue, 29 Sep 2026 01:35:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3946:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3de0e6c295bmr13747092637.23.1790670957021;
        Tue, 29 Sep 2026 01:35:57 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd8482sm417972b3a.7.2026.09.29.01.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:35:56 -0700 (PDT)
Message-ID: <647d8c0e-9323-4b1e-9720-9e51ea8e3227@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:05:52 +0530
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
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <e8b9b694-0ba5-4d0f-97c9-ceeb89ae4729@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX0JndUKGawUlR
 MafXc+teGcus/Rt1dJr7F70QCW5wM253S2TvK0n/JZFBes47f6zZQyfgbDHVd47Te7oY4Z4adzH
 +sVCR8x0PLS4T24c0h0CeT6wOVBSoDEet6tRNiB5QmPqFGpN81yUue6JpgRNRPZsJFfNizTvy7+
 DltjgFaHYyb320WXvjn+gdHbx6VR6x6EWRrzpl17HJeOoV79+e41ajBtdjqTFRRPsNsIvfZIWQ4
 cEKxOrBNp6jXL19S3srrD9Pk96rfxnCDynjiNBgem/oMGooiShXJNR61RUE1dWcAE7CsS5BBMvL
 lTRV0VLgOQHk4E5PJwX7XYc6NYSTX+prcDnA/48hUPfUugfGoZnaFsDnEMjHHyhN7EC6ba0WOiQ
 4dyGv7wueaL7GYjxKgq5pSiO8XXeInc8XZJHwuevHk/SyqvfGoHgMR95xtFpUb9aj5QQIEd/fwt
 XrBKbHTuDiDJJ2Qg3qg==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb786e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=zJHVBnBqPTMeYmh37F4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX6joZLXsU5nKf
 81sJb6JTM7ZWtb/Fmu0l42nsA722qCT8HUCzRew/g1xEAgjxCofuvfHEl3hIltyLgmniIiAxWqf
 6FVUNYRKTGjVuT5+EKKVRQCBXFgnNCE=
X-Proofpoint-ORIG-GUID: IXBB7eN2ud3lwM7rlJ1IH3TBD00hGqLe
X-Proofpoint-GUID: IXBB7eN2ud3lwM7rlJ1IH3TBD00hGqLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290034



On 9/29/2026 12:15 PM, Selvarasu Ganesan wrote:
> 
> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>> During plug-in/plug-out test cases, it is sometimes seen that no events
>> are generated by the controller and all CSR register reads give "0" and
>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>> or timed out.
> Hi Krishna,
> 
> As per our discussion with synopsys we got a below feedback for CSR
> timeout in different issue.
> 
> "Note: CSR timeout is not expected to occur during functional mode. Once
> timeout is reported by controller, s/w should treat it as a fatal error
> and should identify the root cause of issuing the parallel access during
> soft reset and fix it"
> 
> As per our understanding, there is no recovery from CSR timeout.
> 
> Are you able to recover from CSR timeout in your case even after trigger
> controller recovery?.
> 

Disabling and re-enabling gadget mode is the recommended fix. I did not 
test this particular patch as mentioned below, but this error recovery 
mechanism does the same thing as a soft_disconnect followed by soft_connect.

Regards,
Krishna,

> 
>>
>> The issue comes up on different instnaces of enumeration on different
>> platforms. On SM8550, the debug log is as follows:
>>
>> Prepared a TRB on ep0out and did start transfer to get set
>> address request from host:
>>
>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>> status: Successful
>>
>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>
>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>> Address(Addr = 01)
>>
>> An XFER NRDY is received on ep0in for zero length status phase and
>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>> status phase:
>>
>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>
>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>> sofn 00000000 (HLcs:SC:status2)
>>
>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>> Successful
>>
>> A bus reset was then received directly after 500 msec. Software never
>> got the cmd complete for the start transfer done in status phase. Here
>> the RAM interface is stuck. So host issues a bus reset as link is
>> idle for 500 msec:
>>
>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>> Reset [U0]
>>
>> Then software sees that it is in status phase and we issue an ENDXFER
>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>
>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>> Timed Out
>>
>> Upon debug with Synopsys, the root cause is as follows:
>>
>> During any transfer, if the data is not successfully transmitted,
>> then a Done (with failure) handshake is returned, so that the BMU
>> can re-attempt the same data again by rewinding its data pointers.
>>
>> But, if the USB IN is a 0-length payload (which is what is happening
>> in this case - 2 stage status phase of set_address), then there is no
>> need to rewind the pointers and the Done (with failure) handshake is
>> not returned for failure case. This keeps the Request-Done interface
>> busy till the next Done handshake. The MAC sends the 0-length payload
>> again when the host requests. If the transmission is successful this
>> time, the Done (with success) handshake is provided back. Otherwise,
>> it repeats the same steps again.
>>
>> If the cable is disconnected or if the Host aborts the transfer on 3
>> consecutive failed attempts, the Request-Done handshake is not
>> complete. This keeps the interface busy.
>>
>> The subsequent RAM access cannot proceed until the above pending
>> transfer is complete. This results in failure of any access to RAM
>> address locations. Many of the EndPoint commands need to access the
>> RAM and they would fail to complete successfully.
>>
>> Furthermore when cable removal happens, this would not generate a
>> disconnect event and the "connected" flag remains true always blockin
>> suspend.
>>
>> Synopsys confirmed that the issue is present on all USB3 devices and
>> as a workaround, suggested to re-initialize device mode.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> This series has only been compile tested. The issue was reproduced
>> easily with a certain kind of cable and CDP port of AMD based Lenovo
>> laptop. I don't have access to the cable currently and hence only
>> compile testing the fix for now. But the issue has popped up on OEM
>> testing as well.
>>
>> Also, didn't add locking while calling error recovery work in
>> gadget_ep_cmd since the caller is supposed to handle it.
>>
>> Changes to v3:
>> - Using error receovery mechanism from [1].
>>
>> Link to v2:
>> https://lore.kernel.org/all/20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com/
>>
>> Changes in v2:
>> - Implemented gadget recovery mechanism during gadget_ep_cmd instead of
>> handling this issue only during disconnect.
>>
>> Link to RFC:
>> https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/
>>
>> [1]: https://lore.kernel.org/all/20260915110637.17658-1-jiazi.liu1984@gmail.com/
>> ---
>>    drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>    1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index ee837235630a..a7c4514cf0e2 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>    	return ret;
>>    }
>>    
>> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
> 
> Where is the function implementation for this function?. Could you
> please point me on what you are doing in this function?
> 
> 
> Thanks,
> Selva
> 
> 
>> +
>>    /**
>>     * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>     * @dep: the endpoint to which the command is going to be issued
>> @@ -432,6 +434,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>    		cmd_status = -ETIMEDOUT;
>>    	}
>>    
>> +	/*
>> +	 * STAR 5001544 - In some situations, like the cable is
>> +	 * disconnected or if the Host aborts the transfer on 3
>> +	 * consecutive failed attempts, the Request-Done handshake is not
>> +	 * complete. This keeps the RAM interface busy.
>> +	 *
>> +	 * The subsequent RAM access cannot proceed until the pending
>> +	 * transfer is complete. This results in failure of any access
>> +	 * to RAM address locations. Many of the EndPoint commands need to
>> +	 * access the RAM and they would fail to complete successfully.
>> +	 *
>> +	 * If the depcmd doesn't match the actual command, trigger controller
>> +	 * recovery.
>> +	 */
>> +	if (DWC3_DEPCMD_CMD(reg) != DWC3_DEPCMD_CMD(cmd))
>> +		dwc3_schedule_err_recovery(dwc);
>> +
>>    skip_status:
>>    	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>    
>>
>> ---
>> base-commit: ab29ca7714b82485ebb31d66835ccd5364221a76
>> change-id: 20260929-ram-interface-stuck-v3-aaf0c4b13b98
>>
>> Best regards,
>> --
>> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

