Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31B3F8257
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428560; cv=none; b=atx36JywMtNOTyPj+YbVDlJm7qVqGOtDmsggPL23MrvTYdo9/JhligP3vShcTywn7vyMuUGzu3dAvtlC9X0taogcyG3c7iUMbiioznXwAVS1r1t1ASuuqVmfovSazlUZZ5gvToGlTl1Qe9ZD+8NAX4IrGEFeV5sVtobsqkKOhwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428560; c=relaxed/simple;
	bh=W2pM+s6RZdTdONP2DLs0my1ASvHPk5ZTKKrIo3pXhzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAQXj/r0fQN4x/4LwqTcWRsFapugHMIjlG3lpDSkidMKhsQG32YvVXwDroPT+cpVa9sZBA6tLzJbOrv7VuzfzxkTQkt7yVSBwjR+RUISBXoCPydOGOfxTponhMMiOxn00/rjyZiaSb4N5XRnfJATVYZQLYUeFErc50WWZuL8lbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D05honEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b371duus; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D05honEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b371duus"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923fN3035540
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=; b=D05honEvlt/nGR9t
	r29iJ6NAyWEB18MiFWj9gMAS5/nx9Dk6xn+LRhkPKDWGU1mMbVZGAMKHDsIdVElk
	Om7SM8d+cSqjC61s0NqH6abHWs2Do3zQD1fVzb0U6buks0rMNxetuRV1RGI5B4AO
	rYuR4heamylZcLbIHOmMtEXZP9vyFWfkltFyXHFi54NhC4Fbx+fcDhHCF8GzwReH
	asSbTVD64xOoRTkPggzBaAsoVrb7x1o7EeD04cL8xSBmnIFErio0+XLAPrFd+xaf
	R+1EzeNtWdZF/v7FGa0W/x2nZ+HiErccLb4ALQHzcYC8WKDp+xtSLBablp2synTY
	C604Rg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d10a4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:42:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso4063077a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428557; x=1789033357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=;
        b=b371duus8Nosv32vzbkBqdqTDIcU3Uoqp9mfWe/yST9Eci/W4cl5QpB+vzKyEXKIxu
         hnYGSFYJpOaDEQuYPTFP17FuBFtVvtBf02PC0AoV5Lrc12XAiqf0uirha3oOsNj34yz/
         BlYVVNMzNuH9M6NE7LW5tRBnqv1jAp9Q0X1gTEJN4T3z3gVDA0bGZIHd4ccjRHe1On8q
         Qr8hlNZREsNA306c9cCXf1wbO5oM1IR24q/ZtcguNHHionbu7Qqw4JUFGiCnw9MvrkIp
         yDJRTEjl4PRNhlV2A0v1wyPm0/t0h9zPj5Wl0DyL9ZLigvhQsys/zBplOUcSYJbKln3d
         smbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428557; x=1789033357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=;
        b=ZG/1JcbW3ePhze0u3Mnx4h2kV+SZG/tSig1xxwf8vDFrdrNbA3CKWMXfb5eJytHeNk
         fIbF6chmQ0x+UNpyMPvNqsie7/1gSfCIRUNmLGcpT01dcqa1aVRLF0hmuyd8kCbiLChw
         hIdc5XIJZICsxr79ElXvc3c2MCwquULHxuU4XOUZtOaicUZiJ+u9zAOqk4z0IlVY1WDg
         YOcMlQwTaEKH35ZEXHVgbTJAenCTDk7E1p9CL95U7GMyQN4wrdMsLAsGkwbgGpc5msGM
         cA4Hys2adknjIRZoousqT8wdKL5RYPZSlvJU2X5Y98o6lBatlDGmYetoHgeew9hZRRVp
         pEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxm/twriBOUptVnoJlLUzoqWzIke3SSbS74BmmhLBcVsZk1uA2iYN4bVujtwr/MTzKV1FYqkLitqsYqug=@vger.kernel.org
X-Gm-Message-State: AFuF++npD89GWZQetNto8CF4iiNfnWJVeS9TARte2ymNdGw6NRnxVu1E
	v4rlV33i7GbDHDHY3lydw5yYk9pFzYb1VUTm7QEr3ahNNRt6HFpHAJRHLI+sDQfNudxtwQVzQX1
	wUPzUh11Pcx8AuY/cpNDNCGJIRmiq3YFd3JloieEtu/oZ/+di+FaXSja80mi4gU/jPnw=
X-Gm-Gg: AYBFou3UMZ76Q7n5h37dbocQxurXkEiy7RX9p0ZWNWUSRBeHL7bbFHjhn3/3IWMZbz7
	7hUuyLTT5JblA+E+4nWnYPwrFlf1/JLYBrqYL+y1PB20nY1hRFlgMjiw50ewVveIlRNbLDkaNHv
	OwVpSdDtrC4WC7cA3KYC/4/0OUryap7+27n9vsHDIqd5vYQMURGlxG4/Z718lk8Rwr77FRgdq+Y
	fhS6sCX8FuEtizHOYCUwHNdmtsuiurEqzICe4D0q4QoT/rADuIT7mes//0rGPm1EahFgxmZTqie
	EsHcqWL83yfEqSA9kHZtk+1ixe+Zs/mZYFmuwJeboIsLcHiz5uEK35DoPmTznB0Nc43PL++g17X
	evXONmBkB6pXr7X9+zA==
X-Received: by 2002:a05:6a21:3947:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3d9afafc369mr17369083637.5.1788428556831;
        Thu, 03 Sep 2026 02:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3947:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3d9afafc369mr17369002637.5.1788428556313;
        Thu, 03 Sep 2026 02:42:36 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d39c899sm754924a12.9.2026.09.03.02.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:42:35 -0700 (PDT)
Message-ID: <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:42:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
 <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX7JNjGcPyj6+G
 vL7zwiXG+fOBR/3nZJ1uTk6TmB1pdYT+pJrTuflfykcuo/whB4yHJUM0Pii+qzciD7VUSHy5ZKn
 X/ti/Hlf2WEY5klskikDhg2FLQOPUHA/HMrUfEpSDIJe/YIiWs7HbKCn8sxSS88idxZPu9QCcYa
 iF5ZwJAnunmp1mBdqQWddgKkF6BQxQLb5Ut175JwVYXEUqYF8cf2xDIl7p+/uIn1O7kPtF5DIZG
 tsvLGuQBg/tLLOAamDwbv0qGt3yfGpRjEBxHRrP5E1NE7+X527ixzdxMN8EzgEZQOibXJp8TxQt
 vPo/AUdT4Rk8jttqocWyv8Y07b/ld8LwWI7kwKRyZOlqYg47K7/5x2PzDdKKDlp+mkEnVLTu+7w
 OAreG//OPqW8ZZZJhM3M8I2f3EkBPMgrZvqPhKP4i2Oj9+YKOvkU7tTaeMpLPDFmJqkULaFckRD
 4q3RfTScctKnpsQGmXQ==
X-Proofpoint-ORIG-GUID: A1v4WKrlKSWTcJQAYrQDm7brXuX2CAVe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX8X6TASmmTeSq
 nVfIGM5jfPpLSZFcF7VjNEDUDY4khQS8CNEsGcwnNIBRBKJQ05g8co+IeO2aSgEAhYo9NJ+/pQl
 VQztleiS/ubJjdfV0uuQv55xAfqbhgA=
X-Proofpoint-GUID: A1v4WKrlKSWTcJQAYrQDm7brXuX2CAVe
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99410d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cCZmPfQC1jL7EaltuNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030083



On 9/3/2026 12:22 AM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> The RIS index is read from device tree as u64 via of_property_read_reg(),
> 
> what does it do that using an u64, actually? Do you refer to the reg 
> property of the ris subnode, which has a limit of 0xf in the DT binding? 
> So shouldn't it be an u8 all along, and we fix the types up at the 
> sources, rather than widening everything needlessly to u64?
> 

Hi Andre,

Thanks for the review.

Yes, this is the reg property of the ris subnode. The reason it starts
as u64 is that it's read via of_property_read_reg(), whose API takes a
u64* for the value — so ris_idx has to be u64 at that point, regardless
of the 0xf limit in the binding.

If ris_idx were narrowed to u8 before reaching the range check in
mpam_ris_create_locked() (ris_idx >= MPAM_MSC_MAX_NUM_RIS), an
out-of-range value such as 0x100 would be truncated to 0x00 and silently
bypass that check. Keeping the wider type through the chain lets that
check see the real value and reject invalid indices.

If you feel an explicit check right after of_property_read_reg() (with
the downstream types kept as u8) is cleaner, I'm glad to go that way —
whichever you prefer.


> Cheers,
> Andre
> 
>> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
>> further to u8 when passed to mpam_ris_create(). A value exceeding
>> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
>> passes the range check in mpam_ris_create_locked(), leading to incorrect
>> RIS creation.
>>
>> Widen the ris_idx parameter through mpam_dt_parse_resource(),
>> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
>> is preserved until the range check in mpam_ris_create_locked() rejects
>> out-of-range indices.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 6 +++---
>>   include/linux/arm_mpam.h       | 4 ++--
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index cc9fa1d78925..1e082fb60e30 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>>   }
>>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct 
>> device_node *np,
>> -                  u32 ris_idx)
>> +                  u64 ris_idx)
>>   {
>>       int err = 0;
>>       u32 class_id = 0;
>> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc 
>> *msc, cpumask_t *affinity,
>>       return 0;
>>   }
>> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>>                     enum mpam_class_types type, u8 class_id,
>>                     int component_id)
>>   {
>> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris 
>> *ris)
>>           mpam_vmsc_destroy(vmsc);
>>   }
>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>               enum mpam_class_types type, u8 class_id, int component_id)
>>   {
>>       int err;
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index f92a36187a52..30461cd71199 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) 
>> { return -EINVAL; }
>>   #endif
>>   #ifdef CONFIG_ARM64_MPAM_DRIVER
>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>               enum mpam_class_types type, u8 class_id, int component_id);
>>   #else
>> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>                     enum mpam_class_types type, u8 class_id,
>>                     int component_id)
>>   {
>>
> 

-- 
Thx and BRs,
Yin

