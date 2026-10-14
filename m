Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00E1F4634
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975491; cv=none; b=fXDaiQtYFag+bzF6xVRinokY7Icg9dnOk63mZT+b7nzvIa/QuuwHmaU9s42wNPYAy7R7kd4mFsEufZwppCw0pUICwQtj0NFW9vuCZG3QpNU9zUEHGmlRhRfXYDk6DfZqZz9e5chbIBiOANLXAxwD6OXomwNDO/RUSEHg39ydfbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975491; c=relaxed/simple;
	bh=Ro6vP9b5Zfl6m+gMzTrefw+2aiw5GBcRhau1dla888c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQnwDykuVGMif89yjEXhH655BwEPwAWI9IGQhzLBjgaWbBC7x0uif+GW0v4MaYn17rWX4hiK9fJIAsxSlmq+ZPozHtncLnwNRlQQPOENrUocVw9yEEahDn7lnxp3Qx+qMXibO+Gfug1xG7JsJ6r0uT85eb1EPLdbrZCwlgGNkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSXcN+pR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRQWHTxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSXcN+pR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRQWHTxA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR47P466270
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXYycA9KFBxtGqBSvEjEWNQP/UL9PkfzXKCERqjtGfU=; b=lSXcN+pRQDAjEB3p
	Tb2pbdbuKNudbTwe5xhXUYoSVOuIj9VgBLN2EVKXCPLxzwoQUyzcZX5K8xHG7EPs
	NkTMhtiEWgGaitvoOPHDWLMr2Tmh0uIrNLI6IkBsmQLw65gBZ2uVwVnoFv50qTW1
	W8LOBgt6iZfWjtbcr/dko9+SjQtyJ/ct7xOq2mxnWMqvOs1kqjXKui+UXofSDVbA
	XBtjm/cag4L5WfLu+CXiStyzyRNpPIlJuVkBg8Bw+0iQya3IL1U4WRfBe+zOY2lG
	dxjvU0tZ6a+V2nELGffEcoNbWJ8+JB9qmVIQplZ+Qcknk97gUbUp0dc/MYDNA9v0
	GlvASA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr3j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso48115605ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791975488; x=1792580288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXYycA9KFBxtGqBSvEjEWNQP/UL9PkfzXKCERqjtGfU=;
        b=YRQWHTxAG/oVSa7NoRBPelCI2zfGwQK1fEPkdJhou28WAHq57GAWTNM/sNfolgD55x
         Iezb8lqN7oXwn6XPGFH7/89rzH6S46NqqWcIYq0DT8XbAkd5GEqszI8CvxcvnLHJYXH4
         4sF9HQcK/xAbaUIx+eZGjPs2koUKEXoFI6YO4UfU9woRpND4Fa7vK7MNHDsDwFAJtyq5
         Y1V8U+cjnfJzt8ogQI4DJz1dKO8wg6eqBnTQclnLb30+AyuyBtaiwzjlHcX08xlSZLqu
         6wRBChVjq+HgGYTFXtRQDK0TgDj/2nfAGtpHr2B3UiJWpGikFOfRNrjUeB9g6LemAP73
         Hj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975488; x=1792580288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXYycA9KFBxtGqBSvEjEWNQP/UL9PkfzXKCERqjtGfU=;
        b=szCsUhlvrAs7CPG/6VBGJZobauJgdMU2nB0rzyKLIzKEythOiJy5flxUUp+erT6SOI
         ct9Efm5oCY63BfVAy6WUhFtibw2aLOK7AnPLn6mKH4GllXitQHxLvTAc7xTLH7QmqMtL
         h2BXHGGefhndm97xZGHIK8NHtpeEsm3ES3OGiRVaslz8VT/agQmG9pR3BcZhwrJ4osBS
         ryMD0CCPWhgBfc/BD3s+tXh/vztZtlFkIcdvq9oUD9QfHMuyIntzFKMyX4uSdjZ1qpp4
         kdB4NBIZq3JSb1NOS616SdHCw3cypz7ZvHpjX+U7ywkMCOOz8PA6ZYJXYvR5E83inFQl
         OoBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2nZP/tc1iw9y71IEAGd88VyvLVbfIrSWJlFaUbPDJNqjugXRb+pCytD8G752N2JpeIfM+yeEgW2f9h4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCi8axPCz0G6fS9HGoIzLd3b5lRXq7miIaBOHg61weCHWBaAN9
	ZL/Z3rdK3Kre8hNS1a9SiyDHUkky7Z+NkmS9+J//Lfs5YmUfaiY7szbXgENmeJ4Ib76Eu9uksDJ
	QJ/dm0PgXuaA8FfsFSf0s0oKHvo1yuzm8+knMBTIBE8ABqjX/4RYNXMyI9LOEVrPam8ohJS8vXQ
	4=
X-Gm-Gg: AYBFou1EG73OPJVOrngj4mLFLn0MvABhK1KoYnHR1r/wIkPOk3lpifnWykVG7kUIeoB
	ddqJLjP/NG7a8fSxsyqw3sOvnhbIFmyJn016TpExtfPHtec5WStMiMaLFgEiWhWWefvhVxovPlx
	1AGsdktWs66JU6dpGx854W9r9FnTiV7EnpmBdg9T3ALR6R4CWRuMlyy3HbmASlHG7oJEohkTCag
	Ku1gLs0BbqNznsmhNfEie6iN7SunMOCoSdkbAiw6qBiqM4XXY+Es30oeVdfUwwkkIvrKFp6i6aH
	M14ypF1nWl3JWcdaMbY1GOoXDHSv1O08MJ7fgTMRc17bYBy8CLceRMoJuvTmAERNOMZLosdLSd6
	rETz7w9HHFDUzAWXaCZgUQqabxFxRizq1JeA1r5d53BfUITkx5ClS3f+K0VXEwlxA
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr127278965ad.42.1791975488132;
        Wed, 14 Oct 2026 03:58:08 -0700 (PDT)
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr127278825ad.42.1791975487529;
        Wed, 14 Oct 2026 03:58:07 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421af46asm68478685ad.39.2026.10.14.03.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:58:06 -0700 (PDT)
Message-ID: <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:28:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <as7c1LHrOsqAA4Nx@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX/vjjtkOflpNY
 tnJ9LnQUXmpWDHMX5FSBqA++JUQBp1+3NCBdmZ/TqFO5QsvlByUkLG4cBu3H1hrPekx6UjEOe6P
 U/Y9YhJgXbcg1sm9DAFOlj4XhKZTbx0=
X-Proofpoint-GUID: KTMsfqsngi9MTJTMBEw4qNX2OZzNpLGm
X-Proofpoint-ORIG-GUID: KTMsfqsngi9MTJTMBEw4qNX2OZzNpLGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX9JdSrCXuYllO
 3ZZqpaZ3MqaVXgVbGwhf1V+fR884kMOTakZuPUMtgI3/VZr6LR4fYaO/ems9dmEA/r2IAhy8vZW
 07gAy64++ZIT/taknHv8kmI5FaxNhZxjgxNBZp5U+U53AXzw57hp/q7FuraPjMtYgiyvNBGd60B
 XwVLJkq1tfH4VmA8SUp0do7dn+fAYZzSHGRSgboL7WMJZTN7IaLotVWiZm6HzE4r7MTyMndh37B
 1cn6fOAChfX3XBl5AjWZuUA7MjjhML22SGyekFpjAAUeqQFBl6SoGstOfPsZprCcsXxC2IZfanM
 olJoWoCMBUhzdbqslncdppNcN4lS+jdSyZro1+C2ocEcWG5zLkaU4f4KA2jg0ImC5GxS5cJy9IL
 3Smf6IcHOopwj5T0smSu+vPnByx/KVH4YGywHsptjmX3EOAelQwaFI5e709hP330wk5xOp5PlfG
 C+x7e8ftwLRNUwUl2ZQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf6041 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=JKohlkezLAjgD4mUqSAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140043



On 10/14/2026 7:14 AM, Thinh Nguyen wrote:
> On Tue, Oct 13, 2026, Krishna Kurapati wrote:
>>
>>
>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>> are generated by the controller and all CSR register reads give "0" and
>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>>> or timed out.
>>>
>>> The issue comes up on different instnaces of enumeration on different
>>> platforms. On SM8550, the debug log is as follows:
>>>
>>> Prepared a TRB on ep0out and did start transfer to get set
>>> address request from host:
>>>
>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>> status: Successful
>>>
>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>
>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>> Address(Addr = 01)
>>>
>>> An XFER NRDY is received on ep0in for zero length status phase and
>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>> status phase:
>>>
>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>
>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>> sofn 00000000 (HLcs:SC:status2)
>>>
>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>> Successful
>>>
>>> A bus reset was then received directly after 500 msec. Software never
>>> got the cmd complete for the start transfer done in status phase. Here
>>> the RAM interface is stuck. So host issues a bus reset as link is
>>> idle for 500 msec:
>>>
>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>> Reset [U0]
>>>
>>> Then software sees that it is in status phase and we issue an ENDXFER
>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>
>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
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
>>
>>
>> Thinh, Can you help provide your review on this patch.
>>
> 
> Hi Krishna,
> 
> If the CSR_Timeout bit is set, why not check GSTS.CSRTimeout directly
> instead of indirectly checking DEPCMD type mismatch?
> 

As per discussion on [1], implemented this checking of DEPCMD registers. 
Let me know if reading GSTS is a better option here. Will send v4 
accordingly.

> Also, shouldn't we return an error code instead of success if need to
> schedule recovery?
> 
I think that is done while queueing recovery work:
dwc->err_state = DWC3_ERR_RECOVERY;

[1]: 
https://lore.kernel.org/all/20231020225349.ocvyxt5opw4y5bl6@synopsys.com/

Regards,
Krishna,
