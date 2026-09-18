Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F733D5C26
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742929; cv=none; b=LSWTWOIav20u2aMwd9xzLhhXmHKMELlG6JLq5y8lG6Q4iBIYZhhzjYj/JgE/zzEkNwRWvgbvpjOPqfx/70pUOlwW2pChhO/AZrxxDrEcu822G4Ujg7ffkiOcdD3vJt/kJiRi0fCldegYFBVtdn3vkrmIdsNjmpL/ci29x1WwYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742929; c=relaxed/simple;
	bh=grQaeezD4loaQ3dOGxCiDT5OfyrOGQRea/DATIc6/hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQT7NjrA8MIvvSQgWso3tofi05qqoNmWKPczGzLMtq5CvQG/Xaheffzkx418i1R6b/ZDzYLgUyeOLnqCLaUWUi/HWrsQkOO9yvRvXjSCuM1KhcJ7Q7RR8tEzsep4/DoOHk89ke53vXWmYmHVIUrmcdQuXaUkKr1qQLGsObfbWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neK5cG8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nws3o9GD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neK5cG8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nws3o9GD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOQ771711272
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=; b=neK5cG8AuR+jOvy0
	3tl6pVJjFoD/X0tupaQ1EiBON5lQjYY3VACqmtdocu5OJ2ylQi34YJ2sv/xBqw5J
	CxZp/+GWO7uPW82E/UCudAPEDe21rD4bP8LsmNGJGxFwThFHdM3MjbXlf2DQn1mx
	p13KjkULEaCUUX4AGpb7+T6326hRnViTMEW1fLL+sOSC3uVeaZGokab0OJNyRpwe
	zJ+Nk5ckVD9QTx/GIF28f1UWYgGuFUSRyBKklfmVG1LCB2v91aBl6Y+dE5h7m7a4
	DiEP0K4433MVL4nI8JYmmLeQHZgxyFQiizLYW+S2bMPsRn9EKCZvK2DwEeabTq3U
	oru+gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43pbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:48:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so164758985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742926; x=1790347726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=Nws3o9GDICYZzlA85AW4+tlvneIdXGJwKOg89aUY291x1f7EkMZmkwoatnb+Flvqog
         PfSH2nKeDgr7za1YxWuf+rbdamroMsC6t8Ky6COkAX6+Hs8Cgp3jThVR/Kq4xwwA77FZ
         M+dvzDSLIyezJN0ODMFov1XLczD9OOfwB0vMElCI3lgCVBsl2rlpOgRsLI2lGzUW2vhv
         xhx4yV8dJQItxtgYAxw51juSUko19bvpajc8VEKPB7c7AGClZgzzEpUtBIwyFDV94g4J
         jlKkrAOWMWl5HeDfZ6uXvY8zTDjeUbcCecJP/ANyIzL/u7pU3hSCOvoz4uo+9AigFasv
         LWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742926; x=1790347726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zHH5No/d6gK16qDfihynuj16LmMumAiiVmAs/BzwDkc=;
        b=16aFXzLBJT/uCpMBUtPxi4csrSJ9n6/CNV/KjxVfd7Y8HHbAe5rYzApuKNpB03e559
         K/C4tJjbLmOKG8dWGqUV1HHWEJiv5Soj1tpaGGd4eELET/xmxPH2rFf4KAdyg+pBU4Wn
         iQH90w+P1WLfKvj9DdlQidGrNYk0wz4l7BYpuSPXJPRadXg6WI5LlugJ5pPmc+YdB+Wh
         IClnVcir7BEMoQRclf359IVCGPbplmlDFbC7PE+1NkqtBlZJgvR0ScAkRmA4dGD20gkS
         dok4+mYJ2PL/KZBfTWQ4Qfmzht+KNnk9afV4fEEchNfXH23hZ8hF+11U2cv0jE2vUrtD
         GOQQ==
X-Forwarded-Encrypted: i=1; AKwUvByfr8ygjVDB6ZUTwsqCD9xfqCefEwJHJvlP2jefEehFG2GXklFmX3pWWgwi7sWKBo78ehZTH/R6w05kWFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n1xttV92kwplLuHB0zVkzvWV8076kOjWAQr8WL36DtU/3dGDou
	7Qqnpbt3mmuhTq/hgbKihSUL9DfXpYiuqMYBbQs8Fr9RUAorZ2TF2HFL/JDOBBm/wU0Si9yoOW6
	E0hUOlw7PGs5zwHvYP1Ac2oeClml+FaMzDCOC7RV0LkV/wtZv2z5EvfW7Px4BaaKdz0A=
X-Gm-Gg: AYBFou3UgIWv6lnTdTeXCjo59TQbEY8zbdL02y6LuOr8SKy1Kp5upjLIJH8n6RBkhDQ
	q2KN4dkwgd2rNbJ5IJzN9Xp6awEQ2MKbBDuKqZIv1nE3eV1RpXSHeovg0B2quMhsreooOzjTAZC
	uIsaU5eUIQ7HYGcU6aCEuSg00Uyl04r7FutrumRxX1HhwE1uo9WW9qVf00nHOpZxMAsmZYtaX09
	8JXeJMBaZSLWEHyB8bdwMXD5zolvpqtyVNXMGgDyWsR8JcVuWcYmU5g9iEwF0RhR6QgkJBc0GIH
	AZI7pDP7GmJ5qHgcs+YA/aMsAQk/S0bwmCqgW1Dv/Hvy1/1QjOFJs15AXe7/Nc+ebFi4roiWnxQ
	mXhgoYcLXof1eoxZfzgMG5RLtQkGW1bsQrhiu2m5DNS/CAFpOG5NqI/4Id+Y4x1U=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376113885a.36.1789742925575;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-93bdc7503a2mr376109285a.36.1789742925068;
        Fri, 18 Sep 2026 07:48:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcc1160a1sm12355955e9.4.2026.09.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:44 -0700 (PDT)
Message-ID: <b5a41e7b-3a6a-4c1a-9475-b40e85ff4916@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0BaodgabZJRSTjxWDN2C2aAsJYX6O4xH
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad4f4e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EXJEmdUHkevauOIPG10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0BaodgabZJRSTjxWDN2C2aAsJYX6O4xH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfXxsxHN+SgmlZX
 ZPHH4Q+V3RwmQ+FV/utatscEsthz3hazWk1VKWNYUDfCHFY3LdkFb2bgUN9YcD3K2a3/EdrqKH3
 VCML6S3z4+GEoatPmfg191JsyjX5K31d5fXnLnD4npxrnUG3I98NWg4b0mN7jRs6UG0sxp4R/8l
 ZUXYAWR8TAGpMC6oa4nc8PSVTTPFo0lio+cO7HKL+RLzUDrIQisSCo0W7TTpiOUGp1NrbxHwiWx
 rretEhnagtuESI+EN72iQ32V/yg8cG6iJXk+VxiCrxwQQvqCs+JcJW1FhJOvTnc40eH/KrG1b63
 uT9IFNAWPd1eazEnqRJetP2MMoIcnjZsQ6qQ66RtI8F0ZZtZvRlO3xuMaSvu53WIznepnv1eZnI
 ZzhUn14XbWFuHu0sOWb/0Ih5mMHT88hADtdBvAYeS0f8qAPg4owhGhUTDE9GY9GJM2+blsBBFYW
 fdJbasnDBO9k+18Jf/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfXy73OEw5OWry4
 E0QtdddltxTNU7rOJsEmAGTaNjiwIaB+KZgNtH3uwlmdfEr6lgc4zi473uW10AfOe1LXeqMnzLi
 bQkdW8Ng7CS6W2xvOhv+L+mUO3q/zGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180210

On 9/18/26 15:38, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
>> On 9/18/26 12:02, Hans de Goede wrote:
>>> Hi Daniel,
>>>
>>> On 18-Sep-26 11:53, Daniel Lezcano wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> thanks for taking care of that
>>>>
>>>>
>>>> On 9/18/26 11:29, Hans de Goede wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>>
>>>>> SCMI client drivers already describe their bus match data with
>>>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>>>> aliases from their id tables.
>>>>>
>>>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>>>> visible to modpost, add the corresponding generated offsets and teach
>>>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>>>
>>>>> Use the same stable alias format for SCMI device uevents and sysfs
>>>>> modaliases. The previous string included the instance-specific device
>>>>> name, which is not useful for matching modules.
>>>>>
>>>>> Assisted-by: Codex:GPT-5.5
>>>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>
>>
>> [ ... ]
>>
>>>>>     #include <linux/bitfield.h>
>>>>> +#include <linux/device-id/scmi.h>
>>>>>     #include <linux/device.h>
>>>>>     #include <linux/notifier.h>
>>>>>     #include <linux/types.h>
>>>>> @@ -951,11 +952,6 @@ struct scmi_device {
>>>>>       #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>>>>>     -struct scmi_device_id {
>>>>> -    u8 protocol_id;
>>>>> -    const char *name;
>>>>> -};
>>>>> -
>>>>
>>>> What is the reason of converting the char * to a fixed array? That limits the name and may result in truncation and potentially name collision, no ?
>>>
>>> Because of how modpost works to generate modaliases inside the .ko
>>> any string buffers in device_id structs need to have a fixed length.
>>>
>>> So the truncation / name collision issue pretty much applies to all
>>> foo_device_id structs in the kernel. People should now to make sure
>>> that any strings used will fit inside the fixed string. And I would
>>> expect the compiler to warn for overly long strings.
>> Ok, thanks for the clarification
> 
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.
Sure, I'll try it with my t14s laptop (Hamoa)
