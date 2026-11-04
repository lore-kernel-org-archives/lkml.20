Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771931;
	b=db1R8r264vWuWhVjDuZFjmiBxp+BkaeAw7sAKa6+KL48FiP5SyAhAw34p+s1reKbkVvq
	 aharSxKKCd2C/V0v/8vaG0cNEqGPsZ43pKU07uPR3ySpGnauUFaFoYA+3hB6ZlaUqvgRd
	 08vsZ9hQtuxeVK74vWhoLbG6vdxpc6MdbvnIFKf98PUpP5El7s5qnQpBCuacdCfgAOPwk
	 SsXC0Lgxvx71MFUAnalDbClMTy16puYd2i85SrPNLmgF4zXtoz/l4fZDmodKM6hAcOp+e
	 aqN7HparGFE27AbyOhiXeWXtPSQ7GHDnJta1UbQj/D+wMw1snxa6zQ4Lddr+SZG2x6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
	b=LQH4KK0jvknhkd8ZZBIQe3ploA1FhL19sIJQ7fGQWhgVFJdG3ByQ8YOu7XM9isEEINiy
	 xvlI0zQ586yB053+do+MOMpcEqGLJXVlouDMXGcV2qWfsaLzCsTQ0SkCZN++fsK3q5W6E
	 YbiP4Bk/Cxvk9YMf+mEtU6jObFVP6l2Fet8FUfM6Seujc9oesTFSAkJhhLm9vOkM5VPku
	 OoAFeiCaVN5TKm22Z2KK4Ure/U3Ec8q0iLsv+CaI6/zUWGGWldOE73pZtkWTTpEeyswkw
	 igFjzpL5rqNUJ8p7Rpdfljk3XflJQjFfxHVdMozwa9vN2rtIM05I+gLOBbHOGcr6ntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979F606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A979F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ew+EDxDL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfzkbx8z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RNPf194059
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=; b=Ew+EDxDLSs8kDC0E
	FvrugefWxrjX8yDUUL65XV9mRHQ0diHUk9CZHfya/zYWk1EF7B6QnLOnsUxihepa
	4YehPZuY3lsSt+UKY3IvqeGtm33HZhKfBa/aZYwjmfitQi30ia2zS0TlqZ4yLdIg
	7/6rkaoUo30T7X/DvZOMGQ4yldP2i9b2KYv8hYPWUD4PEZfTY7pvyA3cEzRpIFir
	sCZK8c9x1eZSDJx3tWMbR/Q1L2DYbJ991vHMTGOofOC7ps/q/7688WHGlzTIYKIq
	yVSsvBSmnFw2zXEmtiSd+iriesWL64soXRs86KHy4JZYNip3/lGHxWiCHwHoYBVx
	eG1QHA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nj6xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:58:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso539811eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771929; x=1794376729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=hfzkbx8zgVOT5plQBFrLAlDlJDvcPZ1KuG7TYd971IKg7eXEq+h0h4AH1A4NDT1E5J
         FSnsy19nzZnELcXpr8UTEFPkoG1NvDXcssPbs0Mubi+OKSfuiHm4r1T4SihqZ/2imeWl
         bF7yO2ZfE8vHbE+U0hV9HW+2EcmPpAp/P6HEZV8KmZuPxoZ39XfLXjtS4/28r43FWIk7
         mlBQiNDtunWf8e9OdOMBjrFGVcgKuKvduWrVsisr6cW9fuLZmB4jhs2KiKNksRGnpm9p
         XbRfIAfMeB6moJVoZ1XO/IcaVi2rwGGcs6ON0jhd4XqzjZQvOMctnS5L5pJWzt5VnB4B
         fGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771929; x=1794376729;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/OJaXcbh0A/OGTREdwWFahC1oeqC+Z50vcwN4FBE1Y=;
        b=ns1mM2uIm58gHFEpVfRpLS0YMP2WCoQvQUZAY8J2zfdnB5RdUpSyQRWMDEJ26OJq6y
         a9nSjlI1pjcAYIuBG9+ykrQMgmvnDhEiX/vEC7H10MWfnHDe7RZJV+6qz44OcXdiCdP1
         47cNQtBJ/RthrsuitouDTxMbNtrbR3r5590FbetVqzJ6cRrgaqkr8SBbL+7n63vyCorK
         3IOt2supCmtqlKoGZusQ+Io4USBbEyJw0x5VFtq2yHPpYdUhwaKLZ+/dWT6u66zoeM7Z
         LOCgJLAcNKqekGju0XfGWR6D6XQkL/4nBcMeRIEFMYe22sdt8rxNHq88Tz66dKVJTbG1
         CoTQ==
X-Forwarded-Encrypted: i=1; AKwUvByVPRmTPDyu4SkbIJhwFBwUgyoHSrBHBNeGOJMBj9J2L0lojo+1Vi4l5o5wvHKonVX/+DYEd4Kr+fN6wt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KZMbiHgw4FNmQ2jNlAtYBBWlG6V57pKOyHjI17L07CIT8FKb0
	g/xCXDZzROEjwJbtAVgHP0ni/MZ6v+0+xaqiMVZGSke+bgtbsgsqEH2xtYpzgHTQBH49DIEvio3
	IivEZ4elmEEgzP3x2V/ItwltKdczivJJ1saTzt5pCNENm5uW5CTjckhTn2w4ZSisCSK0=
X-Gm-Gg: AYBFou0HZKINqo8WQVkn5IumpUUiBknqarqWjvtu5Ix5YGU1gRLm7UvsArAet7DHrnP
	bS9f5n4ulDH36xXjSVAcSdc7OyKGIIeUUMOHMFvi8wjYTBdGyxg+iIHMz2178wcUzEfkogJqzJb
	vYWixseijWqdPZ8neyC9ABimy/soZJaUOfY23vB+OwlVA4U0C2y7mxdMJhazY52uy5f6w7zW9Vz
	s3/7z39+gkK8FGcUG2LHVgcQr3TbaF2ge/PEsC0Bws8fRW30s3LXj3u6jiT/neFijgfeMc9jJ2m
	9jZGkvQfbW0LZldib94BH1pgFfFoWpmvzh7F9qtR/JPBsUNPw6BEGuFsip4EwxWjEAfcjzUpNTH
	Ek3LJWHECvu6xhnvSPZFuQkOffXktSSvWnygAelRB85b+kElRfbHPzR21lKqJ7I90iFUgwWYwlp
	sG
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341844eec.26.1793771929166;
        Tue, 03 Nov 2026 21:58:49 -0800 (PST)
X-Received: by 2002:a05:693c:4084:b0:36c:9c64:c547 with SMTP id 5a478bee46e88-36c9c64d2ffmr5341810eec.26.1793771928636;
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm6269224eec.11.2026.11.03.21.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:58:48 -0800 (PST)
Message-ID: <f8327c0e-ff47-4e67-a37c-9b636758f83b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:28:40 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe for
 default peripheral role
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX1Edhui1YnoyI
 LwV1HUhSgLzBxaJ0Vi7i5yjwJ7J1ah5snUPr6OiFlJ25+fo9bFQHX6hsd5Gk0nPAslD4YKGakKt
 ivgqxp52WDUgimtYB+9ZkKdWBA6qQCLyNP6pIW4JQx6jzcaNosVNOLFThBdJ8VJ7vwdztVsHfAX
 qRw/QNNEVk9VxR0YBNMFK+UxEqmuripvZBrNYQQM4M1uPxqI+rfQQpRxjhZvoCyclLf2rORTuoX
 B8snS1tDXqxzpHRImO80V4GfCEGZq325ftfjznzu+NT5XzEvWrXouiNVDwjEr7Al6/8vCV3Dc/I
 wKRFbBOyFXLi9PrlG5DSl4JLEi2pxC4I9T54EETAvyGsfRIFSDAOzRt4gIrjN7L17jbDSdVGo+o
 XAzZ904NbvhHsuPYMGEjd8hiA+DPJLc2Ye10UPdDvwpfoN/OlB7mTrbQzg9w1FP6Fbt01OuDLXX
 pXO3jQ+Uyn2XM6rCHUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX2V2ArbFHYwbv
 IorYaknGTRKLTCaAueWxoN2UY8ZgDPGh+wsWVWkJ8d3YRkxqAcW79VMyebBoojHtTRUNbYqP4qg
 qc7jgN2bZcbAknXvl3YNh2asiI0XtSE=
X-Proofpoint-GUID: DwRvI97xSv8DUFq_KmJauXHGfIuP44SB
X-Proofpoint-ORIG-GUID: DwRvI97xSv8DUFq_KmJauXHGfIuP44SB
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeac999 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VcVH6SLggcOI8xUk3fAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 12:06 pm, Peter Chen wrote:
> On 26-10-29 00:29:37, Faisal Hassan wrote:
>> When the controller is in OTG mode with usb-role-switch and
>> role-switch-default-mode set to peripheral, the role notifier never sees
>> a transition at probe, so the QSCRATCH VBUS override is not programmed
>> and the device never gets a session-valid indication.
>>
>> Enable the VBUS override at probe whenever the initial role is
>> USB_ROLE_DEVICE.
>>
>> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
>> suspend/resume iterations completed with no failures.
>>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 0896a323bdda..92f1223f7b21 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> ....
> 
>>   	} else {
>>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>>   			qcom->current_role = USB_ROLE_HOST;
>> -		else
>> +		} else {
>>   			qcom->current_role = USB_ROLE_DEVICE;
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		}

Hi Peter,

Thanks for the review.
> 
> How about move it and above [....] under device role, let above code purely determine current_role:
> 	if (qcom->current_role == USB_ROLE_DEVICE)
> 		dwc3_qcom_vbus_override_enable(qcom, true);
> 
> Peter
> 

Ok, I will make the mode and role-switch code only determine 
current_role, and enable the VBUS override once afterwards when 
current_role is USB_ROLE_DEVICE.

Thanks,
Faisal
