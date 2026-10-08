Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330D3BB690
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439931; cv=none; b=OFb69QCwIGWhmqoOm1ca/vPLNZ1MFHALw2CICOwaa8pbllNsaxg5KYvz0Lj1v6CsAGEeQHL6xyRoCTUWkEzQb6GZxzYXGORTQ2IUDNPASnk2fbGNnEhXWTsdwVZnKMf5CaMJZkfr65TOwDDqgn+gZV3zJyJVhpxPqdpn0gaeuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439931; c=relaxed/simple;
	bh=BYJ5rVqFRgTnxeMSjvRhSgYe8ffD+B5w+Tjsrc21jZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDM6Xjn7ithVX7QQrJDzBIBZNOvjAbIfI4SLtJx8xUD2hoR6sRG5wqsznw3TFvHG8GwOOFD1PLTQOeiPeQh8MVjCLm43TmMAVYKx8z5UUQgt3R4VngJlSFFuhtHLF/RGvoVVkMDdTndo2ZlrlJILDXBMwebn9JSQPDIKxE7Kkew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fqnbnf5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfrUam4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fqnbnf5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfrUam4S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BYEF1654214
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=; b=Fqnbnf5DNqxV1Qjr
	xFJ00qsGb+AHPKJk2tXgx+blgdntm/qaHerXv9ZoOjfh9Bzr/dhUOAPt4fROgDYm
	BC1KgEWfNEbYYx2UTlpOGutf/+W1GjoA73ESXBPdO6hklKsEDo98TEFidH9mISFw
	mql3VFK5F+HiuPIlgW21Dn7zh/CtwRXByM0i6uX8tks76YPQ7Ke1I1kj1zTKUsx2
	tJ0daANecaMunovsfAfFGuKAStk4BAGqYxQJ9L5KZ2/HOYZxiZvQZ2fQHYns8y8l
	cGNxOrbtOS5WliWA+5bjdssRnDEdWu+MfdaFhKHj6nL5IgoB6yNlLjc4JfAod8PH
	q2YHQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hd8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:12:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so1499748a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439926; x=1792044726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=;
        b=UfrUam4SKjNn6DcvqGfOkRn8eHhw5fhCcyvidEO12Aj+WFN76PEMwmrPeTzbciiPj5
         X1jED70dPYah+N1Mf/mIFRCTVlr/DdLctTmCC55duYr7D6c3iJ8iegol1cfR35ebfqBl
         71CG3kZwNZWIsk+EXU2nwU86zxi/1d1m96zFQRYmvjathizzONoDnHOIcGhWeL3uZ+iQ
         7nalk64IQY67/ftLD/A41fEB6X0zHQfW11vXGc32YsjyEMhHtH3bpf/ILYnYpKC1vB+N
         OQBCLA+Ljed/+Jv3Ch3Zxq+3TADn5DmtxsZ7P1FZbFOf1Fj5y4N5XWud8HaRrrzYrZbH
         bP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439926; x=1792044726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=;
        b=yZaskieBqucs0YyEGmVxYF5QWuvcZvFQhxJZ+T4AjclqXDDGHZKCxtjsp6DMugpcxu
         +PkLT/+T36Lm5b/W94bfMR/6x25725gecQFjiVRK6+dS5ETtCVa5e3QGZgSS/9VcUksX
         4Xi4+4AmoLT5yUNtZyj7HPYGUvhSWlu7EAB62gfe5Mr/uru9xa3iSxj3UWPF11XH3pSf
         Ou8AKEn7tTokwLOMwClpY36ILmXjYya3kjWcgJ/ew/Mrq5f+oJAKACzPgAJtl/tSVaL3
         fB4Chh/B18KJMNqCiS3ECNXY1q74yFLaDivEbxwB4fzAhYc+OpqWxgUqnuiWnl+TEz94
         jnrg==
X-Forwarded-Encrypted: i=1; AKwUvBym+PJL8VbK/rkkKrBrqHmniNmEMy8erPTDEnxXcD0MnPHyPypkHkEC+CKFaaFsv4mxS89bpFBWOrL+9Ok=@vger.kernel.org
X-Gm-Message-State: AFq9FYI027B/iQmERRoXYlzjf9+bOSCXhNMMVlzXJAoaSamLm8hU5jBX
	1Hg0aq9LPZyKqGeYUam3H05fFEfsvJuVGqooDHosZY5Dl80K/zomdQQIzR/itlgNn0qLcycmPG9
	oqk/4v5pHysMxsMoYfc57G4qoi/BAFz7x1Zd3KSfYWOjvk3vFIGJw3Vz3oCgX0dtfVEo=
X-Gm-Gg: AYBFou0i7qf7ChET5vgSPdhyyBRg9qmnws8WXlYRxOv877m+8INmeCHHoJ/qMTLSSm6
	Q16/AD+tdJ05ShBY8ukfw6qUe+8v3hLLNltQnyi77Fnl7bsnKT+TEfOtZZbhdKRLbqa6b2iwSss
	/29ELl2kwsTXsGhKkmhiCI0q0SHuVJkf0BM5LqJrtw4bjdCVq3EvRenZgy+s4JsQ2PQtbg/imp3
	eOEsFf1kaWkmE7jXtTyw3tmrHRpmX5ZAPnjueyAHw9lGNbsON60R7d2azbeZyCLkIvulbev9FRB
	2oWO+pYZV40vRYRLaMEJEtxMSUkYw7mTmn9ChTQC0VfOJspx/RuykZFS317XjABr1pP5fVHyw4h
	0kLjX3vhn2biofo+SLhk/kpxDfUHpfgiE
X-Received: by 2002:a17:90b:3ec9:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3a984821aadmr1865884a91.40.1791439926378;
        Wed, 07 Oct 2026 23:12:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec9:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3a984821aadmr1865857a91.40.1791439925817;
        Wed, 07 Oct 2026 23:12:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aafbb29c12sm803186a91.2.2026.10.07.23.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:05 -0700 (PDT)
Message-ID: <4e3cbe78-7a32-42e8-90be-db5158907cad@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <rwjiriaurj2ajowddjjerrr5wsu4ios6lpm6adglvlzsrxf4x3@tw2wbobghgca>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <rwjiriaurj2ajowddjjerrr5wsu4ios6lpm6adglvlzsrxf4x3@tw2wbobghgca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac73437 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pIBEpd9KSKheSvzPkZgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXw3YehuIfhe8c
 QHMuLDhSZtFGEVIt0+G4jNvhMNYp4MDAEnU5FGqfqmmP/bu4z4Muzqrc1Cf7+ClYZyzZKFxm9wN
 GlBHE4orzS/6JKTsqj/EvYvI35gUbK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX4YoNqXOlmXBC
 CPPvOKk2DyzBGtJQybbAH/dHBG4PQ98fB/GN2zsy05BMZOeQeSw2sVMj/gTFBtc21Ih+EF1YNaX
 WW17GyM+83XYeTeBAf9u28MGM1VechEnaxxkDuODJw1mPVdc5P6IeB7vRINVhsO0hqaUvEM/3cJ
 UrN2Zq1IrqYFVMY+6q4rakDpkfylIGylyAY5OeKqJzqANTmo8T+DB5nL3k7NmB7w46Vv6CMNoMj
 NHIMhwPjKpVjiPjQ5n2X5BkURbiYqs0hSJlP5ohPIYND1LJ4IDeUEweJojP63KAaKx8tJnVGUqR
 +28U1loXmhxkGliu7dHTHNxFVH93LHQekB3bEGlB4HlsC5Qe5nWXUKTf94bN/fpLZNFqF4wVZtA
 4DCTahGU6Ki4+GQG/Q69xB06haqDK5ZoUk/L0hnMD7YQmfI2JrRa7G0CZ34M8HE8Dqe028yR7Cl
 lDM6Sy+r4M29pmeOtzA==
X-Proofpoint-ORIG-GUID: jUb-Y8YdYyFkbKTU5PpdU6FYVYRWbt_N
X-Proofpoint-GUID: jUb-Y8YdYyFkbKTU5PpdU6FYVYRWbt_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/22/2026 5:52 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the Sahara channel is torn down.
>>
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device:
>>
>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>
>> The sysfs read callback serves data directly from controller scoped storage
>> and protects access with the controller training data lock. The attribute
>> lifetime is tied to the controller device via devres, allowing the data to
>> remain readable after Sahara channel teardown and ensuring automatic
>> cleanup when controller device is removed.
>>
>> Userspace flow:
>> 1. For each controller device, userspace reads the ddr_training_data sysfs
>>     attribute.
>> 2. If the read returns non-zero data, userspace persists it using a
>>     serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
>> 3. On subsequent boots, the Sahara driver attempts to load this serial
>>     specific DDR training image before falling back to the default
>>     training image, restoring DDR calibration data and avoiding retraining.
>>
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> Sahara MHI driver.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_cntrl_training_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_cntrl_training_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +static BIN_ATTR_RO(ddr_training_data, 0);
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
>> +
> I think I asked this question before, but didn't follow up. This attribute
> should be tied to the SAHARA channel, not the controller. There is no reason for
> it to be available when the channel is gone.
>
> - Mani

Sure. Let me clarify. In this flow, the sahara channel is used during 
boot and is torn down after the image transfer sequence completes. If 
the sysfs attribute is tied to the Sahara channel, its removal can occur 
before userspace has an opportunity to read and save the training data. 
This is why the attribute is intentionally tied to the MHI controller 
device. The controller remains available after the Sahara channel is 
removed, allowing userspace to read: 
/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data. This attribute 
remains empty until valid training data is captured and is removed only 
when the controller device itself is released. Thus, its controller 
lifetime is required to preserve the captured data across sahara channel 
teardown.

