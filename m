Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403077;
	b=Oqcyu+IIPeVSgtPJqgiCHbG4Af2nDvNV83dAXvJlixhHytRnuW3SLYysncrsNrh2VjPv
	 N10+YxBz/MtGu4/WIEjBq4WRJPqkE1t6tEZMUm7MbZ+98thlni0o0WaXuxCeU9piqhl7X
	 W+ORQx6fFxFhXrqBIZLJbgtwZXZbw/wzOp0UlZVHL2VY2jKJmiys1ltiegkKXgyl8BjlK
	 RNNDHApW61CdE/DvD2pu0cTykuxyDq8b0OQOdlVCp+nACgZhhm7kpYeCph1s89UnYDmj+
	 EFITJbiZMJuUzP6cAfOKyC+OZFWNYDweh0rJT0ZgJVTbx0nzj8v+8n7TdFot7l2rQog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
	b=hGSL7hZlEtlaTEywVH/4CvCu55LoNgQYJ1WrhDldtjiJ3SRac+dGGkMVYnNxG2x0TLCo
	 0HcTIVGOEyVAHv0qN6i5+x+MFzkaGiwXNcmQ7A5R6zpNdjM/qeGEp6QuWwPksJ/gG9T9g
	 BHhrhaFXqhHI55oGpcwn6x+wdHBYVuoO1TKUAHZV4vIoZ8clabd5/tYYghyCM/N1PoCjk
	 J8/iZL6xbAlHuAflmBkE+tvZDg3nllIA+ROzfnHjbAb1cayo4UFZC+muqxAqZ+a/r5YDu
	 77D+q3pPxify3WDmeEE6WyF1GgslHOHmoxFrzPAr4fU+BkA4htN9Fqgz5J90DcOVmgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="coB/S3nB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUUxNQOY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52033606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52033606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=coB/S3nB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUUxNQOY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZWQl708265
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=; b=coB/S3nBGSl4q2Kk
	3wr8HinWmENbWSkl+ktWvEokd0uaXOHZD5r1L4pdmrD9RqOIboijjSGs2RrhBz0g
	k0Yy3AdesaWLHSV9WZ2S8/XT6kVK+7zo/29ILGUm+cGoLkKESh4oG5LicBSgUepG
	gOuGhzT4s+3+UxbmSZxl2J465UjQl5cYVqEA305oYDzxtIgqFOcbKds1lri7KQ5x
	CLjRdMIag+g81XJUgxcHX3h/IBxEKIRzhelxzPdNn9GANkql9BUhuQ6a+5XYgi6M
	rIKRHlWY4d84E6nG8niLy4VIJgJdCNKMMXOtT6wK2Mqo1/1yHXZKgZjEIqr3GHZF
	5yQaMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33nf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:17:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so594157085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403075; x=1795007875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=gUUxNQOYnLSKXzPQB7w5K/iV8/eqQWwW89G/u30JhFr9xn1uX0Mb7x0gyWXdE+wicO
         dib1XYRr8ttIW2KCmiYwLIoN8X9ODVwTN7+UfdnfipCLyCKmHLmfAuYHg7EIJC5f8F5Z
         sg0Omowrnji/YyA7RlRKFuJ1U5jpUqnLR2yGK/mPTX8KoNP8SidVg9WA0g3wLnO8kiG7
         dxHIkNk0NOiKVEDy0ZyCPA499m+8qFnVG5v+ZyJfzg/B4bqTQtmCBjdbHoSbFQlMLmh4
         LgwVx8dZg5u8fj3W13VSfTgBK0jQPBZiwqoOlwRmydUKZot0lqL/KwES1d0fSf1QoUOJ
         gLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403075; x=1795007875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGj0HJYwMLzByuwZ1s2H4bizl1YIeJb7PxkqCWE/g0Q=;
        b=KcaAEiXAxOsVRk0VMd9pnqOfnRYSI4yVJvpcG5Ngcx6p3QoYeOe0FUzv1UKmqL3XTI
         kyzpQRvm3z+31YEq92Kn8EzgbESjaxGTvHDI3AztqcVyKS0ve8j3chujxrEqMaovXiAm
         Cynp79h1B8njiW5F5hHXrOYdndi2lX9OEfdTDpL2gUgLPAfGc4+11DoMEc5YtJ+87jCH
         JQ4EY+oVzGxB+FPZexrsH5P1qdPN44o5kmwKdNqCvkJF6S7IQlg/4QyOZVhiXQ+Xt08d
         wy2hR1v3LI9YCUm48yRDQUPAzpd17PAP4HAIMtraZgLE4708ahLH9eou+3nfKZyXw88g
         mdmg==
X-Forwarded-Encrypted: i=1; AL+hErFH8Yvml+TwQNkv1+TEaMdW5ALYV3rF8h3imndn9BpNg4gjQyJGZ+PQKkqYK1uzeuR6lzf+hKYTHbTdOnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8py4P4DO7rAZlH0mZ+EK8V42yAJAdu3rCTF+McQDW6ugD3Kw/6
	LCHqK1r4Ls0CFK0AQWVeEaK2LxpTcs/6Y2tf0P6ItaSe9DwIyU3EHfhBPIQlMoW/D8IwqPlxFjY
	v1NPTnzl5yfdpOs26kFBzhA58KHFSUvmwqVW5jE2KtcliQa2AGlloTybkYmL1NKvu18w=
X-Gm-Gg: AYBFou0Oy00fDijCuUVUl2AlWUwAVo5XGGA+yRP6C18AHF2JK6PwzMCRTyBG3Wb3Chh
	XSyDkAVRvorsFrWfjXtWldyb0+LbZPnvVDeBk8Oux3Fb59MkGoX9DHzYfgvGpqD9JZ2cQDdF/XZ
	rO7tq7XEAbIDBjAHJ8nzbMd0Pn23vbzBDUq4OmIXnr+Ud9hJgqZKXZnFHb4EaeyqdxoPveIkd5B
	/TKptYAlfy3VPrm5I/GMXg5Wfhxezsv/Y8a3Z3M8oIbCgWGMJnU3yBlqOyZ4vJnGUEERUdom6tN
	3nDFWd6NDtBaAuwoM6J5B5uOxfnI9iiNolcrIZ9B4t9Ka6N9vgJm2wy0uvC1k3wqAmJH49BVCf9
	9lj3VqUOsJts4s3cvAM4mSq77vQsh9CG4md5ZLt6SGu2O+mQuVAJoAatVNFZTsAvTGP8E+QskcJ
	wwYNdbMK2c9XYbO55cOaBNzuAjAwdp27SM+JajFRiUYy47y7UnHAv1KE5+JUwZVk81eYpYKPOe0
	OYyMVfgGrICr/vKUg4SjCAhS4+Tj/p74IX5w655mObR
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362249285a.1.1794403075620;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
X-Received: by 2002:a05:620a:2796:b0:93c:a40d:e3cf with SMTP id af79cd13be357-947afcd6115mr362244685a.1.1794403075158;
        Wed, 11 Nov 2026 05:17:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a57085fsm233201266b.22.2026.11.11.05.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:17:53 -0800 (PST)
Message-ID: <38b7e73d-71a8-49dd-85c7-7cc496c57c8c@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:17:52 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/wmi: Allow consumers to load without ACPI
To: Armin Wolf <W_Armin@gmx.de>, Han Gao <gaohan@iscas.ac.cn>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn>
 <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
Content-Language: en-US, nl
In-Reply-To: <c9a078c9-3b95-47ce-86b1-feefe65a6eaf@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af46b04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9ttZ_nxh5X5bo92EjBUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX6LtJfHD68rGN
 4b6NPI8JNPgm6VmSLKSaA33Zgkc3SuDjireVOgbIMJQ/t77gw+fGf4pFS6u9frBs3yxUUrTTfzm
 qqeUW8pnJ/28ASLC6ixppWnCRyW4PIyBrl3Ztvm71pWniwpGu/wX5TJtqaVtF/O2+PdTFpN6Hxo
 496+Qkiu2lzoMBfbpdOfe/Wk+fhW6Vx4oWP3jntbbgGeOPaVbPK6SQHbL2TmG8jBYqLTJwNkPqG
 UXjPeBtgSFOn9SNczS+HphGYmnEXpxNJqsaUUN7hKfd7JHGw7RUR6gGijEFyUszj11hpRV2tnXG
 G7ChqSNHg66ZtOgmi/uox/hfsga/bUkm6Jvu3j2TQiY+zzFPYO+ssjNgC2d2WsLPnQB7/hqmEv4
 tSES5+uNQxWp4QXiTnU/+Wak+dzK1wWySUorvFpk03PdTtfvs7gwGf1HNGjJ2KvMsLp+GFWFUyC
 /i4awRU1tK0ICvOsCjQ==
X-Proofpoint-GUID: oBeM3sa8dZmcXpEyx7ncsc8ahViKUOdr
X-Proofpoint-ORIG-GUID: oBeM3sa8dZmcXpEyx7ncsc8ahViKUOdr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX0xyrNpKHBCkM
 67cflSiZ/os+GoTbRQ6rscme2q0yxn3kZvfTqscg7ni4B0NAUtJSVZGpUbnUZDJFpLfcwpcljXG
 1jn87l/50LUadva2emfueEDqMcfs99s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

Hi,

On 10-Nov-26 14:57, Armin Wolf wrote:
> Am 10.11.26 um 14:43 schrieb Han Gao:
>> Since commit 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from
>> nvidia_wmi_ec_supported()"), the ACPI video module uses WMI on all
>> architectures. When ACPI is disabled, e.g. on a devicetree boot,
>> acpi_wmi_init() returns -ENODEV, so the wmi module fails to load and so
>> do video, amdgpu and radeon, which depend on it.
>>
>> Return 0 without registering the WMI bus instead. The exported helpers
>> then report that no WMI device exists. Skip the teardown on module exit
>> accordingly.
> 
> AFAIK wmi_find_device_by_guid() requires that the WMI bus type is initialized, so we should not skip bus_register(). I wonder whether we really need to check acpi_disabled after all, because the platform driver will not bind anyway if ACPI support is disabled.

I developed the same patch in parallel to the original submitter, but did
not get around to submitting this upstream yet.

I just submitted my version, which does keep the bus registration here:

https://lore.kernel.org/platform-driver-x86/20261111131613.6290-1-johannes.goede@oss.qualcomm.com/

Regards,

Hans






> 
> Thanks,
> Armin Wolf
> 
>> Fixes: 4ea18e604272 ("ACPI: video: Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()")
>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>> ---
>> Tested on a HiFive Premier P550 booted with devicetree and an RX550,
>> with ACPI_WMI, ACPI_VIDEO and DRM_AMDGPU built as modules. Without
>> this patch, wmi fails to load and so do video and amdgpu. With it,
>> wmi, video and amdgpu load and the RX550 is initialized.
>> ---
>>   drivers/platform/wmi/core.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
>> index a99da9b7039d787ce3c1e0ece74ffbd79fafd3f7..6668789904a903c8d4e7810976f4e485d7a1b32a 100644
>> --- a/drivers/platform/wmi/core.c
>> +++ b/drivers/platform/wmi/core.c
>> @@ -1598,8 +1598,9 @@ static int __init acpi_wmi_init(void)
>>   {
>>       int error;
>>   +    /* ACPI video still needs the exported helpers when ACPI is disabled. */
>>       if (acpi_disabled)
>> -        return -ENODEV;
>> +        return 0;
>>         error = class_register(&wmi_bus_class);
>>       if (error)
>> @@ -1628,6 +1629,9 @@ static int __init acpi_wmi_init(void)
>>     static void __exit acpi_wmi_exit(void)
>>   {
>> +    if (acpi_disabled)
>> +        return;
>> +
>>       platform_driver_unregister(&acpi_wmi_driver);
>>       bus_unregister(&wmi_bus_type);
>>       class_unregister(&wmi_bus_class);
>>
>> ---
>> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
>> change-id: 20261110-wmi-no-acpi-159a4cf19580
>>
>> Best regards,
> 

