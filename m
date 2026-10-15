Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263404A2617
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048265; cv=none; b=SCEr/zo3pjaHne7bRRHC+VYrZWj+geThWgtNdtWyPbZGVaq8e9iq71ZYI6GxSL7999Qy8HfxzOJD6GKwRy98FITPOO8QIYZLn8ZauNXZzkmY6MvFbBLATjUgy6ZODXTVg435pXal70yAz8k+2Fu9ow/cWbuEIih+WX0ox/VrNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048265; c=relaxed/simple;
	bh=xy/pbJv5rk0AZgE0MAUUcXJlIE2Ibp6hOh9B6SVt5N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tb4Tcd9xjVO+F9S2QTV9SBcIBiSkdsXC/jPUSEzI7w7Rej5J4iBmUsIpWodoGDlH84JHT2kWabUaxCbAltsPOIZ4g8eAmUAcBHrpeZSxBVR2cu/E6dgYav1c1eownfEm1za4goMPTvCjZhOHc30N2Q90/gtGQ68D2XYbB49sXIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Do+45MFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eT8rgjpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Do+45MFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eT8rgjpL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0WlcI1672812
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=; b=Do+45MFEVGkoS9x9
	t81Mq7WUK1m13qgQihjztuztYBlk1r9cHtrWGBm39Gun+br75kuNpQ6GbnF7yaXY
	qrskbdXlZdPoYwvjJyfm3WH6SCOoPpr34D02AZQM+035blR7hUVJ9eiZd82rJxnA
	onUU8jCrXii0fqjzEWrdYl7+Sm7mrrloFL6MdYOV/bbPpBDYSpW3LAiMKtMvSGlG
	dlCrDjOSpRjDjbOtJ3LWVidLZHmJbyWN01JvWjlbQMbzdhXuZAVi525ORoeBsXpD
	hSSa0M/oJnfRiifVUh+ulvChU0EG84NgSclt3lmbnLYC7Qr1vzsybI0dnDvA9zvu
	W8nWsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb28v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:10:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so1114856485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048253; x=1792653053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=;
        b=eT8rgjpLpQnd8oiqazHJ51xhiwt1eO58dzph7t1Locp2+t/4lqqxQLayaAawupp0o0
         k+a9RQAn1SNR2DPfc4zxpcCUQjBB2cHwMQ8/FzaMU5dhDv6PTGA359xoSfRrhcHHOkB/
         mi052PJnluqmlNY0y0mAraaTh/mGczPnak+z/TuVBk/Uff0x34PwMANRaKisC2+qhU5S
         uM1lY+xUmoWVVhFWh4Ta1Lo2OKoX+Mm5UovyVHcH52Y2nh+dSAVDO/hbM8KNZBmqbnit
         yxL6H3v2BG8bp9ej0HMHa5Zwuw5XL75uhk5UkTNZjDbiceZ3XAcRf/fwVQcle4k23Olg
         MsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048253; x=1792653053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqdmAbJsWzaNsPsG0T6wcp7j81AciEH3O1LUc2xXTBo=;
        b=D45QYOGHz5PTYX/GgX986ZEP7w8NIE77SUUBv1ydreKbPYOgIFJVYZY6pEKdWaF79z
         Evsjq6znSsJyx89CkxysfGL1EZWnubDd6iENBvhnw4qXhoO7EaBtBU6qawC6taPo5JEm
         hGMxhoXItwhIRjSGGoeD1OA8y9oYYXQOW/uwpSPQHql5Z/O0JzKQEVZFHVj81OHZOevs
         C9XDzBe5KgszF37P5elM7NYKXJ/zAT+hEiA9R/NzlWIpGYqBMYPETjjZmOyHDCjJDHD7
         KQQ1E/8emtZeuVNoe0o3if2EPlSSnLfxT9bmQ+BQITXRGitoCw/2dzeWlCwbf6auN3wh
         /Ofw==
X-Forwarded-Encrypted: i=1; AKwUvBwXPGVuXiAKLRUuiRvPdX9fyHtYPnVMxeIk0h7rqXJmDh4TkgYf/2+SAIP/VAt3MXH4ebFCmI9SlPxOxl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwSjnwqJGeqFK+VhBPi9X3jaT0jzvHV06kHA+4kj4qfhaJVwZV
	rA6S+wqZ6KlIxfIQ51VVFo0PHLxZZre7zFD6n0v4BPEkJntPHPGQfBYbdxlfqmSYhcFqFgNzAT3
	fJVt9kZ+ZMM9/hKhazq4bEZ1fumczOAdzcuz+GKId1ahX+rXRZAr/+miZIeaFI2EFR+A=
X-Gm-Gg: AYBFou2N2jNVMHBydryWgc8FE1NI+5oRxccGNzLkLpbBv4Atr/UUEFpmUrYWSmRwxzc
	KOpe65QzvwPi6ks0FUp25cbgBdwSN6nHgZfDJHJxbc/BIuSvKAcIZNA32eHaWvxIp22Dr5Pu/hL
	ks3n+xesstwsaUxtg8PuihoDb5LKBmGBHVIdtX0EHiMj2jhDBEK+gPEa5oaWqL0BrmX9n+OJtnY
	WLXCZ45OdFPhb/tnZmjLB0QCIs+gCru4xbkU695escjGcC20zXrNtH3NRVloLEbX+Se4+gKyyvP
	19NBSr7TIp8yfxtuq9rbcz88/SGTW1zZT5T+VL+BD+JDiXxWmbiI7sUVsE31lAYmEDtxHoCBew4
	6U9BSl3I8qrlB7tq7MOdyLXawVDHKDXi5gKS0jdNAWmrNgwlvCbc2g8Xef7OY2w==
X-Received: by 2002:a05:620a:1b87:b0:93e:6c02:d173 with SMTP id af79cd13be357-93ebd26f427mr3142071985a.46.1792048252892;
        Thu, 15 Oct 2026 00:10:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:93e:6c02:d173 with SMTP id af79cd13be357-93ebd26f427mr3142068885a.46.1792048252403;
        Thu, 15 Oct 2026 00:10:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm49809535e9.14.2026.10.15.00.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:10:50 -0700 (PDT)
Message-ID: <0ca8681e-8402-4540-8635-9a98140b8243@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:10:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
To: Kurt Borja <kuurtb@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Hans de Goede <hansg@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc: sre@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, stephan.gerhold@linaro.org
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
 <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
 <DM55HM3TYCHT.1F7FX19ORJPG@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <DM55HM3TYCHT.1F7FX19ORJPG@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YxltvLSJPQV_UzuBqMhxCIcHpiojBUK_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX+Do4JmFVAM5h
 MWmYvumtqo+9IqGpil2ctJ4cDwhXUGCl4fc8phuVL4mr3M/+653mAmZTLiSk/hAEUFdceja1Lcy
 qQz4Z0UJ2DQD61+963hTmt6kDNUEz/o=
X-Proofpoint-GUID: YxltvLSJPQV_UzuBqMhxCIcHpiojBUK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX7PE/RrJ+5CWv
 vxbrILEUyrnWIFoz9jpVibJ98cwt38w5cmCnBxvbHdVKP0q2zDS+jlXOaz43pXEq1myLGedx8C1
 0Qc6pjcv/ebuh49TdLlMd6Xon0kmGJ38jXqsBDuAURuGhW4lZ6JyawpmcnXPV6sdHrq6M6NfM/e
 Wf4+N8QlM8EJ91DnZTtnm+sy3V8GgluRTWmgY6PUieDhkUJT15+Hnygi+akQ0mqOgVxkSjNQuh6
 5dNO/dmO+ghMEv98eejd8p3BTHbHmIpCFI+2zG6pjcGMbqUfKYGEDpFMRixjoZmBZDHH0xj/I2e
 ROh4B/GRdZ33YsUBScrkGVo+VhoBtQip+MYFdhhCSz7GF/nz27dKdJVqfgs7AlQ0CKX4nDKmPz1
 El5hbpzDYGspdP3MrtkEKva1wTHnOJA7PQJ1y59aWGrUPzTbylFaNJMjNQqmVpYRYrGeNHOYesI
 6Y/V7W/R1nxSjILIVvg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07c7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5Kx5z0Epgnzjo5jacSQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

On 10/15/26 07:08, Kurt Borja wrote:
> On Wed Oct 14, 2026 at 10:03 AM -03, Daniel Lezcano wrote:

[ ... ]

>> Yes but I have a series I'm about to send decoupling the
>> platform_profile from ACPI
> 
> The platform-profile already has a platform agnostic interface at
> /sys/class/platform-profile-N. Unless I'm missing something, I believe
> that interface should already cover your use case and its also the
> recommended way to expose interfaces to user-space.
> 
> I was not around here when this functionality was exposed to
> /sys/firmware/acpi so I don't really know the context, but I personally
> don't see a reason to duplicate this at /sys/firmware/devicetree or
> something like that.

Yes, I agree, thanks for pointing this out.

The platform_profile is however tied with ACPI because if acpi_disabled 
is set then platform profile is not usable. It uses also a acpi_kobj.

The aforementioned series [1] decouples both so it can be used on any 
platform.

[1] 
https://lore.kernel.org/all/20261014132500.3817549-1-daniel.lezcano@oss.qualcomm.com/

