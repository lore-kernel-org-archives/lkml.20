Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359505;
	b=XGu3e6pVhQWw7Vb6k4JlxMCSllu5xBUAdlZ1r0TOxg2Xj5LWXnBJpz3nJGxC/8DgQGND
	 7KhZUbox5jDknD8pEAqS0sJP0JDwA7A7Sfxpd6ph2hRj/Col1xi1eDmRo8j1IRbx6/cbI
	 UlHvpbKrb1gAWmq0DcKCJtGDwX0KAtmUKFmL9Hp+gljlTeVTaOazllAstKs2ovAyof8w6
	 N2ocCsaTV2WVTm92u1EJswT9AzcTYid4omkEiGlvOlAEaPp2HKjLmO5bdxZ4YEsYt93Yc
	 5S8C/whPW0mh75lrR5nzyaYwiWMXhf0JkG52rcH884wOniwcdHWB0bMZ2RxPqPwh7cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
	b=vcBiL2zzZNPZt7zrRXzZD5yHkM9xGts4DacHOoMcC8VZgNXajqpLXDvBXHHctNbFzcoQ
	 DOTCv9GXtpRaG7CvJ1/BdrjB53j17goEC32TYIaHZT7pF4MuXVzbRj0TU8NK52SNNeC7I
	 l9pnRBvixEA/vxFJGlAntOhQCNyWuuFQm7zGl2o8RWFSKHEmoy8etcOcQ1bJWiFIS7zyl
	 JOiGUTSlTmmvp0l61SYmpEsY2yN1PPlX/Ov1k09wqfG8qFG7dJEK1MrQe4+0QsTCh3lDS
	 QQp8PIo3iZS97024RYiazL3XN1dqbzMQ2rYghbgK//r2VV4JZz2hYTp7AD3aKtO5ooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6Q06qH8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MthHSyok
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGNBQ3130313
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=; b=F6Q06qH85YmQbRp/
	mAovKzDurDlFMxNV21b93Z/D+NsjJSl7nznr2xlXGIagBnsvB/EXPJ92V6Rl1bf5
	5wu/gsVUWrVJHCRggG7tYo14x+AOqvIJVdKtsk4AhkD++8c54UqMdaS0x3WjLhg/
	rcSIW8pc7acgP5FloK/TjFXrXHeJ/LreuGQj3MuawAkFopP+/r+ea0bO4wj0KhX4
	013/PVbndtHn5QXQPL6Dak5VwD4o6P9+/ohFR2MxyY3gPioyA4Ox65kUxahYmnPw
	DHaB12iLFtFvHaRkKEiEy7bbYfsYpdprO2qarXLR9Evi6EsdSuA2euMx67Mly80y
	/4cYmQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjpvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:25:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso3075876eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793359503; x=1793964303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=MthHSyokh/pEjj8ctzTLe0GTxgnt34I/YRpD2kntoyGtC+rLRB/OaqNPkAyHTFsbrW
         kSrZ/xhtFcX4b8OB+4lrve1Tqt/tMaDLqCDKAgi4i5nWIaWo/8Jd8+nfP3qunIgPFZW1
         PXqNCADSSy3ZARgwyjiIzadOToxPlx0g+0oPHJKffajIMCOD+HqF7mxeqSlTwOPXKKZE
         oyXEO3cgxRFYYQUpizG4nEwBMsGj61U0GbKHratCFqgUHGcrjf4gt008T6w6W3zxsc0d
         lPG6XZevu/oUdNCBfKNjndDeYnJZ2rYOCZPd/iVmtN7Uut6oKxvMMGotrAYevMqJqi5Z
         siYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359503; x=1793964303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdbx0dHYIyp69emOWIEzNw41iQHntBCECrGFrtburSQ=;
        b=FDTkXA29hFNtASJgQb/U85POAKyb7SsdHI81L1UVBmgX8KLStW7PDyyqWzI5O9vcJX
         JzQBiaXGR/p0rxnbyAU2HFy8QifHTcaqgKNztK1sBSIobNxiv1eBWMbJd4nSDcJuzQ/4
         DyLvkJDBtqd3s7Zg0tG3uzXLJ34Y7BwyL4rJvXvgXcK40sF6nEwRhdli5UHs2Zoh7V6p
         WYIQD7kNXwh2aKxwmxLgxf26pBQ5b5oFxd4zOcn8EM/pAJZXTnYIfWZ+QIVM2+DMp0EI
         TRMSl1d1l7s9CcnvNRpChNZdNzcTpShdlUWrLEK6DwX66l6qImLz9ImcZ2nMrc3Cu1jW
         JTBg==
X-Forwarded-Encrypted: i=1; AKwUvBw1DkspkyysoxBGLGRFygbKvX9MRtMcuNYMrFCNljCkP5xWJXLrRAdkxcWuZV8SO2sg7evf/mvLRhZDHpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1tPM/5RVDvIE4fkeJFzsEAuLTZCI5dreePgAThh9vKFguR4qT
	SbXXIUk2fAHXfC5aVPb6Jbib0fZ68V8wErhsbAKJGBHRtikNZPQva/hgAGlyctvgF6C7t9ufmAH
	mRzOEabqsHvsaz8bpYg9OaVjrYh/54UEOZ33tpGfGYglLlJ2lULy2VyFxk+V2iYzFfHA=
X-Gm-Gg: AYBFou3u4DaL+Ta5ckXm4gCInrn9cjZfFbfr6s9dhh79TPCqdq91+rpM0MsWBrj0ag3
	YZDnLTIFVGV09gXKPJNnxCDcJCwiJq4QGjeV/BwxFCILcvms4S16G7UOOnkFx2GrbastBK8Cl5q
	zWQwRU59lsScPqBh5pI2gh5/fSo9SH4k+LvnXzugYHOiaMAxH9MKLVhWPb51DXtGwWVC3Gc8yuS
	EbhtSpVp75IIOl/TPFmo/Hn2rxE7lGrpV4+PadOwWmj3slCEZH0Cl5/eT1SDgNwZVgFPJjbIx3F
	Jl4JMItp3WMcc7s3nsRbfFrgZ98mrITKAWdVFbt+HHU5HUVKGcqQmRYQqRKAXLGq81izyPXtboX
	MsrDK+M8Voz/clBoBL8Py/8xZ0+wzaXBYHrXd0r+0d/EUxgBQ/V30kSk/+G/noq63ViDKRZp3s5
	YMTUw=
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624511c88.35.1793359502829;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr2624466c88.35.1793359502028;
        Fri, 30 Oct 2026 04:25:02 -0700 (PDT)
Received: from [10.216.63.119] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm6421408c88.14.2026.10.30.04.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:25:01 -0700 (PDT)
Message-ID: <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:54:55 +0530
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
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j7o47XChdS9IHewDo_SfRbc2Ma3G8jPh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfX8MCMPQJEj70w
 vB9Uv//RM+04RMPNlMneYdpgFdiSbyC/Ow5fcRxoUMwrJU+qPitw+n1uc0LG2aX2C+WGtiEtvg0
 IOm1G12KAavObXxQ7VafJI7cDLIQa1Q=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae47e90 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TVcAculkLhaLcnG0sCoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: j7o47XChdS9IHewDo_SfRbc2Ma3G8jPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0NSBTYWx0ZWRfX13YYEidAmpho
 u+S1L8GyUewzLAHQ7OJqsZD8seK5A2Q4SjVvQ8HRtItMIgwLYBPabNjtx3t6YWGMiEiomiKQaO5
 RmkvsSpmYKcyVvKm4pj7PlyhI1anNwxKF1ApewItWYFRdNsIncGJR2ofs3CK803vf5ITv0w7lp1
 M9rXGiCwcpkb8vMx12VMDWUGL9Z5afVFuecrHFKeoYigquBNQVs5xMmRZn4zYbELm+KXIQh/Rie
 9HZk32hYRyqWavZ77gA2YgYnP/7qeflQWdp8+9pTqBcoxjwf8CuzW+zmEeMe4UXcToVdKDp+LOP
 0axfXqvesXfQVEatwYiaWVZXMMOImkWmFtLBPAZuRA6MPAfRx8MYYh5UPHBI+tUus/2rDxfU+qi
 0ok96pxkoq6fUJxJDKgSeWQULucMI3Hec9xYqeceM393Qy+/agfiCPfUebu2uBa9keQKsNQsrK3
 x9aS4/NzQ2wV419RLrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300045

On 30-10-2026 02:54 pm, Peter Chen wrote:
> On 26-10-29 00:29:31, Faisal Hassan wrote:
>> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
>> clocks. If clk_bulk_prepare_enable() fails, it returns with them
>> disabled.
> 
> What's the relationship between clk_bulk_prepare_enable() fails and this patch?
> 
Hi Peter,

The wakeup interrupts were disarmed before the clock enable. If that
failed, is_suspended stayed set, the next suspend returned early, and
the next resume disarmed them again. disable_irq_nosync() and
disable_irq_wake() nest, so each failed resume left the disable depth
one level deeper. This is the rarer case, so I will reword the commit
message to lead with the runtime suspend case below.

>> The next suspend returns early on is_suspended without
>> re-enabling them, and the next resume disables them again, so every
>> failed resume leaves the disable depth one level deeper and host-mode
>> wakeup is lost for good.
>>
>> Re-enabling them on the error path is not safe either: the
>> level-triggered ss_phy interrupt can stay asserted, and the handler
>> can't make progress while the controller is not resumed, so it would
>> fire continuously.
>>
>> Track whether the wakeup interrupts are armed and make enabling and
>> disabling them idempotent. A failed resume now leaves them disarmed and
>> balanced, and the next suspend arms them again. Disarm them in resume
>> regardless of the wakeup setting, so interrupts armed by a runtime
>> suspend are also disarmed when system resume runs with device wakeup
>> disabled.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d44f093ac243..d4fda4dd81f6 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>>   	enum usb_dr_mode	mode;
>>   	bool			is_suspended;
>>   	bool			pm_suspended;
>> +	bool			wakeup_irqs_armed;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>>   
>> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (!qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = false;
>>   }
>>   
>>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>>   {
>>   	int i;
>>   
>> +	if (qcom->wakeup_irqs_armed)
>> +		return;
>> +
>>   	for (i = 0; i < qcom->num_ports; i++)
>>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>> +
>> +	qcom->wakeup_irqs_armed = true;
>>   }
>>   
>>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>   	if (!qcom->is_suspended)
>>   		return 0;
>>   
>> -	if (dwc3_qcom_is_host(qcom) && wakeup)
>> -		dwc3_qcom_disable_interrupts(qcom);
>> +	/*
>> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
>> +	 * even if wakeup is now disabled,
> 
> How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
> hardware default value makes it enabled? If it is, we need to disable all
> wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
> 
> Peter
> 

They are not. They are requested with IRQF_NO_AUTOEN, so they stay
disabled until the first suspend and nothing needs disabling at probe.
The issue is that runtime suspend always calls
dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
of device_may_wakeup(). The old resume only disarmed them when wakeup
was enabled, so a system resume with device wakeup disabled left them
armed. The comment read as if the interrupts trigger while disabled,
so I will reword it as:

     /*
      * Runtime suspend arms the wakeup interrupts regardless of the
      * device wakeup setting, so always disarm them here. On failure
      * they stay disarmed, as a level-triggered wakeup line could
      * otherwise keep firing while the controller can't be resumed.
      */

I will update the subject and commit message for v5 to cover this case.

Thanks,
Faisal
>> so always disarm them. On failure
>> +	 * they stay disarmed, as a level-triggered wakeup line could otherwise
>> +	 * keep firing while the controller can't be resumed.
>> +	 */
>> +	dwc3_qcom_disable_interrupts(qcom);
>>   
>>   	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>>   	if (ret < 0)
>> -- 
>> 2.34.1
>>
>>
> 

