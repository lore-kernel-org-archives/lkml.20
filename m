Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207880;
	b=Ks7h2Ilm4KjZIAplZp49EH39qRWRensaEilkBGrQLAQnBTpX583pif66uue+5gcxZp9n
	 xGK/cKq99doaKKK9Vgz8PowhaquhfFzwA/ogC95cE7AuXGAihJXaCQVpQmh1uRW7PqMQg
	 nNC2ZFlFJb6EQ8oBKXvJUFST3rI7mXoWpKJq9IdHW2N0vyG9iFcE9mzVQdnDeo9E07gBb
	 7zIPCWGIfAIQbl2w3sL0d4TXElKPJL/LNF0m6uxU5aUzLdRnEwxLwlvByiYNDz2ILRe/J
	 QRVvV2LeD0xy5foKiB5Dqui3Qa8HV8kNeS3/aETb7pv+rtVaZJMFbqSAp3RjSNl6B2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
	b=iIjc13Xres6t40iIikRvXVqENRXb/eJeEl3n+4OYQqr0i7hcyDBHDDt3qlX+UB2WP2/c
	 8JKxwEl7OC25VNRtgTuaWz05TgJUuC2wfZKRAEzBeWlEky44VdARyFbc9uMGc8T7wrwsX
	 REGgSFQQdqa8dgtQkwncK5nPZQEUJaSlk2w2Pxq43J4TSl9DCLi4gRM8hUZgCd8mRQAO1
	 Vyw32SVWfp7iIgldMPaB2TjYZHi4Iy6BosRpJeGtBx0TwmBtzF4Hx+lBksqnYecYE4GpB
	 H/ACbpFESxBPFDNdfG/Ot8VQ9Ozp3lVHMc65hxPjuEg05wfzRDLA/7+ZDfTB10DbTDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MHIjwBdH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecUBtY5T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DB606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MHIjwBdH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecUBtY5T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9xij966208
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=; b=MHIjwBdHdjeK6yli
	9Wbz068RmTNqueWQUph68D1zojIT9iEobJsrFYRWOv4+MOBSjj2wBa9yzTEc4nfl
	f69GNF4jKh1+tPrQnm9T3RaeZZXStPvJw6q49p3n/OfQknyvT+XgudmPpsKpgnMe
	Gs4WPZFJw4BSOkljAfcFrqnhQQu3EPzm8Y22Na/sR2aufmOHOexPtuEgdNjO1d7y
	1gYcEe4LbOx5FK7pCIgMM1spBUGJfViTPQ0RPs4yOXASU0oE1K+OzO5iKqJx9TGs
	VNdrdrmfn5dVu0wtNQNZbdmSUFzjRRG34q5IVYrb6rI28M/XBPCkQUVA+zFLeuGM
	ds6mag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjh3kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:17:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so987015b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207878; x=1793812678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
        b=ecUBtY5T5AGwbNprXj7ymZTOKJdseAZ7mPQO2s9Es4F3+LcREdCoeKC9BYr7f5emu+
         1GlZl2doafyi1kVM2Zxyz+bmkNCenDPwlBdr9ylckoiBGSePklF4pvLMmnqneV440/aD
         RFpceC+wwYutssgrdE5Ex16UfrbK52YTuRdMZ9uqxuFM/b+T/wbTLXDtpys0coAXatpT
         th8u4BTSn4VaFLrYKgSOi5EjycP16/z2/K20IuIKUkjku8CAbfHHtH3FkQeih0Bhep6j
         /QnpBpwJ9jTrqYwccv994MoVTZasvb92wJHxIVMBRciL/4Q7upKqB5rolzCHNk4BVptq
         wFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207878; x=1793812678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAsDZInV195QFG9YcqW3Qj2NrjZbQEXmSac9Yxv4PQg=;
        b=dThUjJ6IP2QScOZfLsG8GxQYmM62hVrKrB5O6A7C+4zF2L7fgMHsmjXudeacG5rvgh
         XqmVsEXOKyAsFv7lkBmdfEd18uxEhKZJYbwkBT8tQupjW1dAK2bbASfT5OxGxyc+VjUa
         NV6l4DQWoar09jKHNgYSJxN+FST59VlqONc8EyAykxK/uIlZnVLjwM7FR7EmwNk+78se
         aUY2VwIdzJj6z+6V2KZ/sB8jwkjNOqMVZ+E6kGl4isaORR0TIuYL2oIdDWOhPdUG6z87
         xpP6ZCxT1ic4Ast4ja5ZIxyj6cZ+z74j2HPkGfYR1sQSRttDEZ/gjKZu3h9pRf/bGwju
         D1jA==
X-Forwarded-Encrypted: i=1; AKwUvBxz2bpyELF4I2prEJKOU0yTjGJi53oMMDjipoJQKPLw78oyZy3nDOv+NEn5zjHwn06QKgAa1Ed3Fp4G16w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzAQJ+f4KEKbseGms1Kz+krM0q5jWJP7/n4/1Y2QamzkCF5UXQ
	0MauXJaxVTm+PhZaxHqKhs6gJqK9lUPq7zThXeYrVDnq/NuYEnx8ehWCmy1qnoKuca4pZmagUeG
	BMZJ6hXNOQfA5wlWxo9F5hpUyuMVSVZjP8Xr0WtJY2/nrBk3AB4Ag2KZF0ZS/3lklz5cLFdyUT0
	w=
X-Gm-Gg: AYBFou3M6rGoTWZ603m9o+EL5p2TR+9jSeW601NYnFGCH113ObFb0VTW+zV7ii6eZK8
	zp86feQehhF+cOiHCFBvqT9ZpEPG9a4Vhy3VASkqxc+X8K4Qv450fq9ma+giwnHG1jFWk9zyVks
	alG4Mmxb8nuP54fUpsSZGwVguhImvvpo/BHY/yCsRI47WSQKeORjkrsumBr6F6+5GISUPcAu1o7
	8xau8BP5drS0h6P6sHVdTpSODWXwdikPDJDxRwHSSbqeKO5lw3od0x7aLgSY0Tkrh+dBUkbPMt/
	EIpsKBvUkYtLSFirznCySJ5ZJVxSF/qzuzb7odcLGS3VKUUtzQHsHiTvH7Yvm2eIOgfZcPogs9C
	1yPeC9r5a73gJLc2xUrhxRX3durWUKxaupWGhWbjVjOP6ktg0WnFGj5tTjbBXbb/D4Pwk4Sa/Cw
	RluFCP6XlRWG8/zOmf9TUUI5RD1W0m9Kt/yAISO3Qn
X-Received: by 2002:a05:6a20:6a25:b0:3e0:d508:59b0 with SMTP id adf61e73a8af0-3e902382a6cmr2223707637.34.1793207878000;
        Wed, 28 Oct 2026 10:17:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a25:b0:3e0:d508:59b0 with SMTP id adf61e73a8af0-3e902382a6cmr2223686637.34.1793207877421;
        Wed, 28 Oct 2026 10:17:57 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6c03c09sm1454483b3a.35.2026.10.28.10.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:17:56 -0700 (PDT)
Message-ID: <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:47:54 +0530
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
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
 <atgaF8VoapljDa2f@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <atgaF8VoapljDa2f@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXyagEwhqCaY9q
 4Wih57a0OjwhHZS+RBV5mgY90j37/vIIvbjZw05aNgwWDcSP8sIOcpvx1uLBTbr5I9k1w3Wnp4S
 XZMw/AJ6y86eLLQs2bHV78ft0PInNFYQoXpWVu6//TDL5hGoHvbWVuATcAxUE3Wzug+osyuV3Bc
 S5+TMx8Iff8+P1UPRk8+3PbYPdO3yqDAzFb5SB0GIMjsgmensD2c7a0KtrfgX28Ipsw1bdYipRn
 JA2vt83wgzzDa4UE6aA4SCEfEKaPg/hUUEXGVUtSheOidrZp3AaugJh2QSOu5boWeZ/vKHLWwJP
 cFtExNJ6gOyFiLk8CDC0OELZjEtjTO8KJm5dDAHXjYarvetLxwc/ADxFGX9r89JMWi2CCZaMQIc
 s/UO3s+sDkVO9MEMc/EQ1XiUVwoJh2nDxyVE8UzVU0NSliQO/+owG/bOL0jpWsYgRkNKBnDy7eC
 MHlOjJU3KquMJASzbrQ==
X-Proofpoint-GUID: xrmP_cxLCRHtRd_oeS-_sQSSowNtlu9k
X-Proofpoint-ORIG-GUID: xrmP_cxLCRHtRd_oeS-_sQSSowNtlu9k
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae22e46 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EyA4L-WO06RbGTTq3NMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXxgnwLQMumQQ+
 KMOlspM+rXSoouZlMskEshCpvEDKwYW/5ukY+sR/GOxg1AhvkvkHmqq/roNxRfz/uV3SmOM+wMt
 wlaRhUalpxIbeYhNb7oFnU7gRaXgTaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068



On 10/21/2026 7:31 AM, Thinh Nguyen wrote:
> On Thu, Oct 15, 2026, Krishna Kurapati wrote:
>>
>>
>> On 10/15/2026 7:42 AM, Thinh Nguyen wrote:
>>> On Wed, Oct 14, 2026, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 10/14/2026 7:14 AM, Thinh Nguyen wrote:
>>>>> On Tue, Oct 13, 2026, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 9/29/2026 10:49 AM, Krishna Kurapati wrote:
>>>>>>> During plug-in/plug-out test cases, it is sometimes seen that no events
>>>>>>> are generated by the controller and all CSR register reads give "0" and
>>>>>>> CSR_Timeout bit gets set indicating that CSR reads/writes are timing out
>>>>>>> or timed out.
>>>>>>>
>>>>>>> The issue comes up on different instnaces of enumeration on different
>>>>>>> platforms. On SM8550, the debug log is as follows:
>>>>>>>
>>>>>>> Prepared a TRB on ep0out and did start transfer to get set
>>>>>>> address request from host:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421006: dwc3_gadget_ep_cmd: ep0out:
>>>>>>> cmd 'Start Transfer' [406] params 00000000 efffa000 00000000 -->
>>>>>>> status: Successful
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421196: dwc3_event: event (0000c040):
>>>>>>> ep0out: Transfer Complete (sIL) [Setup Phase]
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421197: dwc3_ctrl_req: Set
>>>>>>> Address(Addr = 01)
>>>>>>>
>>>>>>> An XFER NRDY is received on ep0in for zero length status phase and
>>>>>>> a Start Transfer was done on ep0in with 0-length packet in 2 Stage
>>>>>>> status phase:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421249: dwc3_event: event (000020c2):
>>>>>>> ep0in: Transfer Not Ready [00000000] (Not Active) [Status Phase]
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421266: dwc3_prepare_trb: ep0in: trb
>>>>>>> ffffffc00fcfd000 (E0:D0) buf 00000000efffa000 size 0 ctrl 00000c33
>>>>>>> sofn 00000000 (HLcs:SC:status2)
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.421387: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>>>> 'Start Transfer' [406] params 00000000 efffa000 00000000 -->status:
>>>>>>> Successful
>>>>>>>
>>>>>>> A bus reset was then received directly after 500 msec. Software never
>>>>>>> got the cmd complete for the start transfer done in status phase. Here
>>>>>>> the RAM interface is stuck. So host issues a bus reset as link is
>>>>>>> idle for 500 msec:
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.935603: dwc3_event: event (00000101):
>>>>>>> Reset [U0]
>>>>>>>
>>>>>>> Then software sees that it is in status phase and we issue an ENDXFER
>>>>>>> on ep0in and it gets timedout waiting for the CMDACT to go '0':
>>>>>>>
>>>>>>> <...>-7191    [000] D..1.    66.958249: dwc3_gadget_ep_cmd: ep0in: cmd
>>>>>>> 'End Transfer' [10508] params 00000000 00000000 00000000 --> status:
>>>>>>> Timed Out
>>>>>>>
>>>>>>> Upon debug with Synopsys, the root cause is as follows:
>>>>>>>
>>>>>>> During any transfer, if the data is not successfully transmitted,
>>>>>>> then a Done (with failure) handshake is returned, so that the BMU
>>>>>>> can re-attempt the same data again by rewinding its data pointers.
>>>>>>>
>>>>>>> But, if the USB IN is a 0-length payload (which is what is happening
>>>>>>> in this case - 2 stage status phase of set_address), then there is no
>>>>>>> need to rewind the pointers and the Done (with failure) handshake is
>>>>>>> not returned for failure case. This keeps the Request-Done interface
>>>>>>> busy till the next Done handshake. The MAC sends the 0-length payload
>>>>>>> again when the host requests. If the transmission is successful this
>>>>>>> time, the Done (with success) handshake is provided back. Otherwise,
>>>>>>> it repeats the same steps again.
>>>>>>>
>>>>>>> If the cable is disconnected or if the Host aborts the transfer on 3
>>>>>>> consecutive failed attempts, the Request-Done handshake is not
>>>>>>> complete. This keeps the interface busy.
>>>>>>>
>>>>>>> The subsequent RAM access cannot proceed until the above pending
>>>>>>> transfer is complete. This results in failure of any access to RAM
>>>>>>> address locations. Many of the EndPoint commands need to access the
>>>>>>> RAM and they would fail to complete successfully.
>>>>>>>
>>>>>>> Furthermore when cable removal happens, this would not generate a
>>>>>>> disconnect event and the "connected" flag remains true always blockin
>>>>>>> suspend.
>>>>>>>
>>>>>>> Synopsys confirmed that the issue is present on all USB3 devices and
>>>>>>> as a workaround, suggested to re-initialize device mode.
>>>>>>>
>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>
>>>>>>
>>>>>> Thinh, Can you help provide your review on this patch.
>>>>>>
>>>>>
>>>>> Hi Krishna,
>>>>>
>>>>> If the CSR_Timeout bit is set, why not check GSTS.CSRTimeout directly
>>>>> instead of indirectly checking DEPCMD type mismatch?
>>>>>
>>>>
>>>> As per discussion on [1], implemented this checking of DEPCMD registers. Let
>>>> me know if reading GSTS is a better option here. Will send v4 accordingly.
>>>
>>> At the time, my understanding was that all register reads return 0 in
>>> this state as noted in that conversation. However, based on your commit
>>> message and the databook, GSTS is still accessible and CSRTimeout is
>>> set. Also, on CSR timeout, the read data is residue from a previous read
>>> and isn't guaranteed to be 0. So the DEPCMD read back isn't reliable.
>>>
>>> Can you check GSTS.CSRTimeout after the CMDACT polling instead?
>>> Something like this:
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index ee837235630a..ff4957a7311e 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -283,6 +283,8 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>>    	return ret;
>>>    }
>>> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc);
>>> +
>>>    /**
>>>     * dwc3_send_gadget_ep_cmd - issue an endpoint command
>>>     * @dep: the endpoint to which the command is going to be issued
>>> @@ -432,6 +434,14 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>>    		cmd_status = -ETIMEDOUT;
>>>    	}
>>> +	reg = dwc3_readl(dwc, DWC3_GSTS);
>>> +	if (reg & DWC3_GSTS_CSR_TIMEOUT) {
>>> +		dwc3_writel(dwc, DWC3_GSTS, DWC3_GSTS_CSR_TIMEOUT);
>>> +		ret = -ETIMEDOUT;
>>> +		cmd_status = -ETIMEDOUT;
>>> +		dwc3_schedule_err_recovery(dwc);
>>> +	}
>>> +
>>>    skip_status:
>>>    	trace_dwc3_gadget_ep_cmd(dep, cmd, params, cmd_status);
>>
>> I don't have the apparatus to reproduce this issue at my end currently and
>> extremely difficult to reproduce at customer end. Will send this diff along
>> with your suggested-by tag if that is fine.
>>
> 
> I'd rather not take this without testing. The check adds a register read
> to every endpoint command and implies that CSR timeout is expected
> during command sending, which it shouldn't be. Without confirmation that
> it catches the issue and that recovery works, that cost is not
> justified.
> 

I won't be able to test this in my environment. The only PIPO test that 
easily reproduced it easily was with one faulty cable from (IIRC Xiaomi) 
and CDP port of AMD based Lenovo laptop (there was a particular variant, 
I will find out). I don't have that faulty cable for now, but this issue 
was reported even on Kaanapali as well on 6.12 Kernel (mobile build). 
Not sure if I can provide this series along with err_recovery_work to 
OEM and get the results since this is reproducible with very difficulty 
on their end too.

How about we add the Depcmd check and then the GSTS check inside it ? To 
avoid checking GSTS always.

> Also, looking at the original report again, the stuck state could start
> without an endpoint command being issued. Unplugging the cable then gave
> no disconnect event, which blocked suspend. A check only in
> dwc3_send_gadget_ep_cmd() wouldn't catch that.
> 

Currently on downstream, the way we work is that if we unplug the cable 
we expect the controller enter runtime suspend. If that doesn't happen 
and the controller is stuck, we do a 
"usb_gadget_disconnect(dwc->gadget)" and then upon re-connect we do a 
"usb_gadget_connect(dwc->gadget)". So, if upon any plug-in, if 
enumeration fails and if we encounter this scenario, we are not handling 
this until plug out is done.

Regards,
Krishna,


