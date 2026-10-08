Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357D3BB690
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439909; cv=none; b=azxGVMx63c3ahMmGEW7fkcEX4394A4GugBkyYDQjIO+camJuRFLdMOKSlgigrEyobh5K+2TNs2Znz8o4yToLM4L1OCt7jGwa6bnJLZHuxPGJXUBKlU1OkbTcKXU3B3rNTPyJvr6JQ0HwjvrAwAR4BBwsxJNQf36IjNurdpFC4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439909; c=relaxed/simple;
	bh=mQM8iO+zt5QYIp0Zyu8xKeOXW6PSpr6CP7eG/xPY764=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pu0Cn5oEmtfk3ajqeiUQDdQVU6FeqreppWQgGWQ7V0sbsIYxLuIP6J8Yct3Z1/i8RQwKIRj/ci37dMWC81q+W/xAUkIL/4l68Y44JTjAoSgTpqEZClRZISeaCPxEWmhXtzqMiFibtpum/9CGcu0Ugu6of16hC15O69avD20JQ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C60Yibao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hS2T5Uck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C60Yibao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hS2T5Uck"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CRvT2272045
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=; b=C60Yibao8onkV6FM
	w2Vqcu1Ki0Yr6cfzts0IeIUvieAvOvsXjV4alKG8EFG2PXC+l+CYbcDTQTMliPWq
	c9ecXeXC6vhJKzKBY0rzPCtES5jeYjuG4JzBbu8sp6M13BbBS0zsPLx7y2Kd5MIW
	WaZbZbUnAbNIjEuBShDWvoO+csLWikYp5zCRjHkj33hSjw+3MIK+bmAqjr71Ijk4
	XY988HPKjnP0FwnXLvCrTEq1PFA80pq7IabbK4RQAgCv3u9DGx87eOBZVaZUkMVV
	2PIx1kfdbcWnlPqwx6d5NItHcn3xDzlFl2/cEXbmFWc3NYvt+yldy37mnnGDjfpK
	3dYMwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe41db8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:11:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso5031183a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439905; x=1792044705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=hS2T5UckQN9XFP9im+jfLOvLB47uYHsF9ZTCeyE714GLon6d7aMaAPOFM64MCDLWfN
         /jYh7k17otkIPMWluOvmOwlgJq2ex+zJ7jRTYL4qAaVDA+1ndNrpsBw/0afYMj2G90Pj
         29pSvIkb3CyfFG0aKNVYQgrlOG9FY3sac0As+Pmpnjo2RiUzrYbooLpJ2d63N7d4aS9s
         zCvusFZOusctupzdelsBrXYGPEk/6bxzFFMIX6gq836QdqmN2FqNVn+k0x8SB5ZxDFcm
         gReGXjJXX/46wgf4DNV8kmSlM8iOcijDF5OWfbkOqnRBeXGTyh3lFr5I83t5UZFNkXMA
         qPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439905; x=1792044705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=IXVxnpi4DJ5tKJm2L5A87OkIKAUvVYHeNW0H3FFF4S3K4U0X9APiV0vD+YFEhcEPkr
         7Ynnb1JmCnwBqTm/p21G2AGPRSG4/28PdT2db1+ipBmM49y+kELxsc3V5G9W7V2Yhl01
         banztVOqd2own3wt0iihsJhhqZhkgb6ZED+IogZodARl1I2rCwlrTzm6df8IS4AcUr2J
         RhFArJW4BN0q0fsGDlPBVVr9NGJe3AKUXk0A1UVABjzQPFKMsT6tdhcQNqHABFBEcIfB
         p6jTozsl2Fk70LlsHqu+ftY9j43Hl1XK/t4n4ya2/SZ1pi/HCtSt3RSqY4kbNbxVX2PC
         PYew==
X-Forwarded-Encrypted: i=1; AKwUvBzoZt6sUh3qOvf0OQIu4W7Ot88GzbYMbASW2MHFXxx9cedS/woEaBTjjNsd9EH8QjKNw3WscMk+ZoNBVmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKGe1sQl0VTz4SjxjjFptT7LpUiw41SIcD1TuvbPpiMK77Xj/3
	/qwlzVpKFzhJiZoitROk9bjW5DAuOEpdkkjVNVMq/2ELheqVJ0VS0dmhpgfbPg9iedOg9K9/Lx9
	3Bu4zedPzdzG7qzdWnEyXP4E7y9m1u7b+iXDpBVnu4MQIW66MDikxdFYht9gtmX9DpxI=
X-Gm-Gg: AYBFou1leWCt4ZTg4ElcgTpXCWS8T6o4R9WYG8Ohn+6OT1NPx0FIXvRs6iFTX7ArHD8
	rB5D7nMZIGOTa48N70tlSMfKt4OvLVSt0edrtF3qPcRj4L4zgDEdhHPPq2fSITuqgmZhZ6rP9E1
	bMY4WZCTks1WPWmWRa25xBpFWMIKhsUg1JGxE/QGRjHzW7wffekWbx1ZaWMC4JquecwT5yDqL3t
	9Q0vKeDnWkO5zUdp0wxg2kZ+aBcJPAeHomuk+A4PNuLGkOwQvvt84j9kZkwDmV8PKcFLydK7Z4w
	MJbXuivUPXgB9KVQJsvjwEG/7tBIb/dW+4jgBSHg6wCrfIcsJHXOLXXx60ubhjhc8DlCWru9IdY
	hTqbqnRqGWkm6VKcooZEF4ct+0WVrbKc=
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571761a91.19.1791439905494;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571754a91.19.1791439905042;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d416348sm4247427a91.0.2026.10.07.23.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:44 -0700 (PDT)
Message-ID: <4ab383a0-5fd3-4cda-a0b4-8d9bd5d015ed@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
 <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D8OM8_dmI4KU1bYIl-4-jL8hHg3w_fmo
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac73422 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX/jf5P5fisMP9
 dlNwqudMdl5B2qrAbqsb2NzAT94Wghp7WBgeMbbL7Q1v6SzLw45CzlrCMiv9+8dz37AuPFqZcmy
 hP3Xxy2+AjV3C+kiirNVj+Ofc5xKxXo=
X-Proofpoint-ORIG-GUID: D8OM8_dmI4KU1bYIl-4-jL8hHg3w_fmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXw6Ry6NvC1+4E
 gh0uXl9eP9o4gjX2IX8p3G8gr5ISMDWgJLPAm4X3VK46FfG2WHUDwz+MPPLTexMFGDDYhN5iRPp
 wUHuipvjjHjif+axEVHpT4hrD6cs+nGF0GgA5aj0D7/ZfBRzNhD/Tyx1N5NWuZjLHT6AKISOoBC
 L5JQTJlqv7fpzPXqKabPn4Nrom7Y3J0pvmzrqZWVe2T210/6VPcOFi5Ab4YFqbFabb+cnTELZgv
 Xtx0OYA7719sQFNTH8OWferSd9i8aO4ZVXSvWMAGircuwuGrLg5rk02TBffPMv10Ci8yPQXNZGV
 asUpUxDsbzaq/2OAuKwXw6Z0Xryjgo8z84nxfnyOH+G4RjJxl/v3ImG/HlvcCd5zjMgBrkUv7J1
 ZiGbdu8hXrzAMGXVN1jcDzbHJ4snkjY8nRwXgD8f/q0XlbNjft228seO9F8qjpkJqEo6nmrkHnT
 ig01O7w0UvETiAUguLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/9/2026 11:51 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
>> Devices may provide device specific DDR training data that can be reused
>> across boot to avoid retraining and reduce boot time. The Sahara driver
>> currently always falls back to the default DDR training image, even when
>> serial specific training data is available.
>>
>> Extend the firmware loading logic for the DDR training image to first
>> attempt loading a per-device image dervied from the device serial number.
>> If the serial-specific image is not present, fall back to the existing
>> default image, preserving current behavior.
>>
>> This allows reuse of previously generated DDR training data when available,
>> while keeping the existing training flow unchanged for devices without
>> saved data or for all other firmware images.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -59,6 +59,7 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_packet {
>>   	__le32 cmd;
>> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   		return 0;
>>   	}
>>   
>> +	/* DDR training special case: Try per-serial number file first */
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
>> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +
>> +		fw_path = kasprintf(GFP_KERNEL,
>> +				    "qcom/%s/mdmddr_0x%x.mbn",
>> +				    context->fw_folder, serial_num);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +
>> +		if (!ret) {
>> +			context->active_image_id = image_id;
>> +			return 0;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This image might be optional. The device may continue without it.
>>   	 * Only the device knows. Suppress error messages that could suggest an
>> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   				      context->image_table[image_id],
>>   				      &context->mhi_dev->dev);
>>   	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +		dev_dbg(&context->mhi_dev->dev,
>> +			"request for image id %d / file %s failed %d\n",
> Spurious change.
>
> - Mani
ACK. Will remove in next version.
