Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC4496D31
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679756; cv=none; b=ZVgQ+9l2slr/gDSpWHx4LZQPUYpqH4cj13EHOKVM0UTs9RSHjd9YYZBkkHPKISicFfAb2D0Ojx4WRBuedb2vfx6GUUyMvtIWFdPwyYofcW4cEFFc6Jh9N384ya3Yx28o/D+M/zSeEShhUGoamcJMV/HsRqvF5pgdNLoey/k56Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679756; c=relaxed/simple;
	bh=B5TZmuv/RT+ZbMuhMEp8GJBe5UaTkofWHWRfqv0Txuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=NEv+U2ULHiqzfbz1A9vUZSr2x3SQvlUnxUS7OHW5BET+1/c5FCoIlX3amquAq2+Un9cL3WgKNh4GpTOVEJmOUbeqVe5DU7QfxyD65akxxllryGP54EfqAj9UXZqZ/nNAkyZ30C8AHBKjpIKGX/ItGcf6AtLQX6McduWfCP6+3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HSypTEH4; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HSypTEH4"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260929110230epoutp0227d37f01b91a356c8e8ae958bdfde523~Zxb7yPku40556905569epoutp02x
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:02:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260929110230epoutp0227d37f01b91a356c8e8ae958bdfde523~Zxb7yPku40556905569epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790679750;
	bh=XJK+AKu6uIU7aKnWokR4EXwOmdNHY0582+P4NQN2mO4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HSypTEH4GO+9KzOibDAyr4IXBIaHgyeGEsdO4JSgzKPUZIU81KT94qwSlkZYjAosR
	 3B2ZHXFSxI2OzyHq8kvkvTw04lJ8X8rMd7tuIMygNXjhZlNoSy9nNMIH8Hsk6LAXU7
	 851jug54eTmrA8MnEjV+3AuiE2tYfLCH0LnzyYFY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260929110230epcas5p16031aa48b9bd593079b2f97d2d24b52e~Zxb7gNkQP1677416774epcas5p1U;
	Tue, 29 Sep 2026 11:02:30 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hvFd1521Qz6B9m4; Tue, 29 Sep
	2026 11:02:29 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260929110229epcas5p1564b15e1ec9662b3d86395f7e26944a1~Zxb6TiUKK1078410784epcas5p1L;
	Tue, 29 Sep 2026 11:02:29 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260929110228epsmtip2774e682fec88888089cc8c6b7f3c9159~Zxb5jPbGV3188631886epsmtip2M;
	Tue, 29 Sep 2026 11:02:28 +0000 (GMT)
Message-ID: <86aa3ea4-d453-4de2-8948-c5887e7a2142@samsung.com>
Date: Tue, 29 Sep 2026 16:32:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <647d8c0e-9323-4b1e-9720-9e51ea8e3227@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260929110229epcas5p1564b15e1ec9662b3d86395f7e26944a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260929051941epcas5p27a5c69151937b9105660941776cda819
References: <CGME20260929051941epcas5p27a5c69151937b9105660941776cda819@epcas5p2.samsung.com>
	<20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
	<e8b9b694-0ba5-4d0f-97c9-ceeb89ae4729@samsung.com>
	<647d8c0e-9323-4b1e-9720-9e51ea8e3227@oss.qualcomm.com>


On 9/29/2026 2:05 PM, Krishna Kurapati wrote:
>
>
> On 9/29/2026 12:15 PM, Selvarasu Ganesan wrote:
>>
>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>> are generated by the controller and all CSR register reads give "0" and
>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing 
>>> out
>>> or timed out.
>> Hi Krishna,
>>
>> As per our discussion with synopsys we got a below feedback for CSR
>> timeout in different issue.
>>
>> "Note: CSR timeout is not expected to occur during functional mode. Once
>> timeout is reported by controller, s/w should treat it as a fatal error
>> and should identify the root cause of issuing the parallel access during
>> soft reset and fix it"
>>
>> As per our understanding, there is no recovery from CSR timeout.
>>
>> Are you able to recover from CSR timeout in your case even after trigger
>> controller recovery?.
>>
>
> Disabling and re-enabling gadget mode is the recommended fix. I did 
> not test this particular patch as mentioned below, but this error 
> recovery mechanism does the same thing as a soft_disconnect followed 
> by soft_connect.

Hi Krishna,

Thanks for your update.

We tried to recover from the CSR timeout, but it was unsuccessful. The 
sequence below is provided for your reference.

It would be best to identify the root cause of why the CSR timeout is 
occurring in your case.

Issue Sequence:
1. Start core soft reset
2. Parallel access of other registers
3. End core soft reset
4. Getting CSR timeout


Try to recovery from CSR timeout:
5. Clear CSR timeout bit by RW1C same bit
6. Start core soft reset
7. End core softt reset
8. Access other registers
9. Getting CSR timeout


Thanks,
Selva
>
> Regards,
> Krishna,
>
>>
>>>
>>> The issue comes up on different instnaces of enumeration on different
>>> platforms. On SM8550, the debug log is as follows:
>>>
>>> Prepared a TRB on ep0out and did start transfer to get set
>>> address request from host:
>>>
>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>> status: Successful
>>>
>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>
>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>> Address(Addr = 01)
>>>
>>> An XFER NRDY is received on ep0in for zero length status phase and
>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>> status phase:
>>>
>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>
>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>> sofn 00000000 (HLcs:SC:status2)
>>>
>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>> Successful
>>>
>>> A bus reset was then received directly after 500 msec. Software never
>>> got the cmd complete for the start transfer done in status phase. Here
>>> the RAM interface is stuck. So host issues a bus reset as link is
>>> idle for 500 msec:
>>>
>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>> Reset [U0]
>>>
>>> Then software sees that it is in status phase and we issue an ENDXFER
>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>
>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>>> Timed Out
>>>
>>> Upon debug with Synopsys, the root cause is as follows:
>>>
>>> During any transfer, if the data is not successfully transmitted,
>>> then a Done (with failure) handshake is returned, so that the BMU
>>> can re-attempt the same data again by rewinding its data pointers.
>>>
>>> But, if the USB IN is a 0-length payload (which is what is happening
>>> in this case - 2 stage status phase of set_address), then there is no
>>> need to rewind the pointers and the Done (with failure) handshake is
>>> not returned for failure case. This keeps the Request-Done interface
>>> busy till the next Done handshake. The MAC sends the 0-length payload
>>> again when the host requests. If the transmission is successful this
>>> time, the Done (with success) handshake is provided back. Otherwise,
>>> it repeats the same steps again.
>>>
>>> If the cable is disconnected or if the Host aborts the transfer on 3
>>> consecutive failed attempts, the Request-Done handshake is not
>>> complete. This keeps the interface busy.
>>>
>>> The subsequent RAM access cannot proceed until the above pending
>>> transfer is complete. This results in failure of any access to RAM
>>> address locations. Many of the EndPoint commands need to access the
>>> RAM and they would fail to complete successfully.
>>>
>>> Furthermore when cable removal happens, this would not generate a
>>> disconnect event and the "connected" flag remains true always blockin
>>> suspend.
>>>
>>> Synopsys confirmed that the issue is present on all USB3 devices and
>>> as a workaround, suggested to re-initialize device mode.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>> This series has only been compile tested. The issue was reproduced
>>> easily with a certain kind of cable and CDP port of AMD based Lenovo
>>> laptop. I don't have access to the cable currently and hence only
>>> compile testing the fix for now. But the issue has popped up on OEM
>>> testing as well.
>>>
>>> Also, didn't add locking while calling error recovery work in
>>> gadget_ep_cmd since the caller is supposed to handle it.
>>>
>>> Changes to v3:
>>> - Using error receovery mechanism from [1].
>>>
>>> Link to v2:
>>> https://lore.kernel.org/all/20260806-ram-interface-code-v2-1-fe4a0de31d42@oss.qualcomm.com/ 
>>>
>>>
>>> Changes in v2:
>>> - Implemented gadget recovery mechanism during gadget_ep_cmd instead of
>>> handling this issue only during disconnect.
>>>
>>> Link to RFC:
>>> https://lore.kernel.org/all/20231011100214.25720-1-quic_kriskura@quicinc.com/ 
>>>
>>>
>>> [1]: 
>>> https://lore.kernel.org/all/20260915110637.17658-1-jiazi.liu1984@gmail.com/
>>> ---
>>>    drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>>    1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index ee837235630a..a7c4514cf0e2 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 
>>> *dwc, unsigned int cmd,
>>>        return ret;
>>>    }
>>>    +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
>>
>> Where is the function implementation for this function?. Could you
>> please point me on what you are doing in this function?
>>
>>
>> Thanks,
>> Selva
>>
>>
>>> +
>>>    /**
>>>     * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>>     * @dep: the endpoint to which the command is going to be issued
>>> @@ -432,6 +434,23 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep 
>>> *dep, unsigned int cmd,
>>>            cmd_status = -ETIMEDOUT;
>>>        }
>>>    +    /*
>>> +     * STAR 5001544 - In some situations, like the cable is
>>> +     * disconnected or if the Host aborts the transfer on 3
>>> +     * consecutive failed attempts, the Request-Done handshake is not
>>> +     * complete. This keeps the RAM interface busy.
>>> +     *
>>> +     * The subsequent RAM access cannot proceed until the pending
>>> +     * transfer is complete. This results in failure of any access
>>> +     * to RAM address locations. Many of the EndPoint commands need to
>>> +     * access the RAM and they would fail to complete successfully.
>>> +     *
>>> +     * If the depcmd doesn't match the actual command, trigger 
>>> controller
>>> +     * recovery.
>>> +     */
>>> +    if (DWC3_DEPCMD_CMD(reg) != DWC3_DEPCMD_CMD(cmd))
>>> +        dwc3_schedule_err_recovery(dwc);
>>> +
>>>    skip_status:
>>>        trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>>
>>> ---
>>> base-commit: ab29ca7714b82485ebb31d66835ccd5364221a76
>>> change-id: 20260929-ram-interface-stuck-v3-aaf0c4b13b98
>>>
>>> Best regards,
>>> -- 
>>> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>
