Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE37345CAA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923270; cv=none; b=RX40dJd/cWaxsur7BaCvFR3f48uGS0jOdXyxjBMiwJ0f/H+H8C3lkq89sNXF9Byu6UuSM2PwAY8HgV09+cIxsCiUNN2e4cj9ayGS/k6BtQx7yjvurWJeA5dMabba4roNTb5B7iD6RKYeS5/5DCwwi9egxn2vHswzQu4zQ9BePCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923270; c=relaxed/simple;
	bh=7tSvt6nwUb7l4EOQl7mknaeKX1Rd4B8AUvBTftBoL18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y++i8iOoKziwWhsVzaIUNWaneZkIhFP4N7Fw4j/mM/1cIudkfHlb1LXJ26IQkMzluNQpQi0QupUvLkNs8K66TzfJNw74964PcMYZoPZ/J6acIxqzbq2gyNPXFger7CsEyyBAg3N87nJEYbwBYc1k+ChsDoKrlGQmt/M+g1iY0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRN+39zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djsEqN5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRN+39zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djsEqN5z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mgvah3697627
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 03:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=; b=nRN+39zrtG3WJJ7t
	ECf4XAKuBvGiEWq1Eh+95SXKjDg4InmKcNO7zh6hfLugvhmn53ralwRI3m2OVo/a
	YBgPezcGw8auKHr1hghgKKbglJoJUXh3GdEhvL/6J+a48X+a8u4em7Z3Tk/dJJoT
	JSMZzqMpEOSeUM/RmldR1RIbYCyTiB1fCvBj4DJLoNk9rOsz5GqUPfeO93ZbTjpd
	MhsBuUydiywBzpQcZPWLvDh9noQsSQpPhpbZOvcwbebOEOHPATQAtgrHnpxer5lK
	KVnbcWITjbr9k7M0VvrzpcJAP/+quBjGx0jGqhtcHUW3bK5FARsT682NJJg5AanD
	X/eBUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvukbmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:07:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so6666681a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788923264; x=1789528064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=djsEqN5zSUZjsImo1mvo3EfayV1jdV7cF5+C8HWRtO3HeHgNKJsDbr7L6Ooj/y+OmI
         USiuxHI+xnZNenS92YQiqtIwV/vv4mN2ArvblzvN/RKbEMZHA+ik6Yke0+/uVNGu/L7J
         B5cMuBbvJ4c6lJS5+hM1zs2k+cky7rpXfqNi1mXyJy3ftRbkGPAO0slqUdhAaKxVmiHR
         lYa5ZO1nq5uRQrwZh2Mz1QrkfqQz9mgx1i23yaCLJt2HP3/uAz/dl7bbzIP9XxgY5NWM
         5aZ6vKDGxbTPTblcDKOwm2vfnvoFIZq+tx/IWMBYbEXLUkJIi1nlUOIvhU5l6kPr2tEd
         gzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788923264; x=1789528064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=XKGGwahkWH1QAX+L0Ma1qCJ8EthjuOUh6HbD+/E63YI6TzIeT14W8hz5B+hbffIQor
         OEbFiaYRuaotU886Mat5ayfPmoR2deOSP3JAiDQ7GC4hef8gNhjcrmM7CfZdhhpToXm3
         szLdtv5HEV6h/xxYogobLppmTTkAFjA5QOabm+QaOHvSSCoUYGE3giCYqZq4znIFfAgV
         mIfb20CUoFbTt4t7dNV8G1a6T1FUNeIfeR9LcL7KV8rMirrbsgp+Jp13IOgc1sfjKtx9
         AXPJpw3DHkT/mTh5PYhRrYVXdSf20MzUCQhkN+xWk6gmRd5xr2KApWbQihqyx7yyovqL
         kkYg==
X-Forwarded-Encrypted: i=1; AKwUvBxre7qAo61aqCt/4Rr0QCXQbeRK5i6z6EDcrKXpeVsNeRAeQmX9ZSyA4tLhlHm7o7HOVMKAcZp8fOYJtQY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+BbBZixf3pmndiB9CrjkhiXLec6iywDTuWS2yRjOCO89o05Vz
	01pMAeWh+8SSUkn1K9uQ56Ggd7sIQXBoB0pgkP78wb5xO0bTIwr2kItEyz77fDoblibxzREtQYq
	B6cmIxzG5xZ5gxxKHDKFvIZIAhmVP393o6NkizBJCSR9AqBrRo+yHN8SwAovJJNB2eDtv84KSKN
	Y=
X-Gm-Gg: AYBFou3P16UMVpKWi6tNS/vuDb5cKQIFL1V25gANJ2BjFT3RzZutPOvlX5Jp1s7FX30
	l2VGHpBsYfK+egoPgaNRz7hFfpL6TaNxv1gyRqEsHCHe5RtKl6rM0R0PBaGwgT4FLDCpbodSaQJ
	jBudGZWbEvhK7fmmjRcjVb5002mdC5z0soHweN9x8sogAdbMFUIdOD+98mDFiQIzM9p1Aj4PEw9
	2k0/AGUs23OerXI87saE5/3ST2WqG8VinsGbbohS+e6lK+UpGHbvm4l3m8QJbctVGMSocQ5R90j
	HEE6vBW3QwPrK1eg3Isoe90iAFSE03SGLA+NGOmhJLBtiPIcDDmDVQpCJYUH+IQCvukve/MyQ+W
	k8O5JCxGlOLlwAyfhH3SCK7irg0xw0sd2sFD9MFDq6kWe626+RFiSMyhJVpLHjMdV8RwJ
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053643a91.0.1788923263912;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053567a91.0.1788923263255;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm28937505a91.10.2026.09.08.20.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:07:42 -0700 (PDT)
Message-ID: <188ac6eb-764e-4805-b17d-e46a362adcfc@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 08:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
 <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
 <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool> <aqC5oyqKj6A3y8WK@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aqC5oyqKj6A3y8WK@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FaFHrEmeots1UBoEZFpnNhQeCDU0nhUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfXwuHb8zLwRHaS
 CSCFMGTrPXIBUzXnXnWCp4yzWrfRkgbjTlggbBaMDrFB9gtHH4tF/pAVuCtgADPM477PCDAEjrC
 5/nXFUKWnpAxgaG3cEz6A+JDkazd2SWMatfSqELOMyvo+ssnMzSHIXJZdoTgMxKspVQBZ+ghACn
 sG5Y5dbQR9ALkjR5bOFw34Atzi2DlBjTYM/9bBK304rch5VOfW/IrX4g2+6AS0KWPlzslFVrLaj
 M88k1eCzQIyOb4VGqIWGVfNI/0OFy3k+d6wlsaEXF0mVK9xEbP18jgwSbXmJ3YpLd7j3yPLFdDk
 UvrYz+amtkQsZh4I30Jd38cqc0iV4X2aC50SB53rF91+O4YFmxWHX4FPvtKte/or7QIrKgigvrS
 d/bhoi2lZ9tzeQFVc4M9hEqyI7b5R2rqkMU6lzWtjnxXfFaI7CstRPcge/hZ+IFZN4/aH8u2llX
 RJPhRK8IfblrECRReUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfXweuavKi1rRz9
 khEYXbxKQy1nu/dHVXp2CcMR6I7AqIFQAwPliC7X/vtEqMQg+WAINYcpGwVu9OgXujb92FXGWJg
 MqejbF/Sst04X8BrPE6Y1op0h1S/99w=
X-Proofpoint-ORIG-GUID: FaFHrEmeots1UBoEZFpnNhQeCDU0nhUM
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa0cd81 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=k/HPyTtL2bl9pZtdyDiZRg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=eanv7jwH1jcZw_mpfL4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090032



On 9/9/2026 7:16 AM, Thinh Nguyen wrote:
> On Tue, Sep 08, 2026, Val Packett wrote:
>>
>> On 9/8/26 7:33 PM, Val Packett wrote:
>>>
>>> On 7/23/26 7:54 AM, Krishna Kurapati wrote:
>>>> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
>>>> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
>>>> exit is done only when roothub is being destroyed. Due to this, during
>>>> system suspend in host mode, although phy_exit is done by DWC3 core, the
>>>> init_count on phy is never down to zero since HCD core also did an init.
>>>> consequently causing phy's exit routine to not be called. Hence, add
>>>> support to skip phy management by USB core.
>>>>
>>>> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
>>>> hence disable USB core management for Qualcomm platforms only.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>> Link to PHY calibrate handling for Exynos platforms:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/__;!!A4F2R9G_pg!aoY0pB27Tlxo3u1RzNzwPHpGsjuAgJWtPeKMvDrL___6gEQb28ew8Rg-O1877xBHB92Zv2fY3_Zbb2aoEQY$
>>>>
>>>
>>> Hi,
>>>
>>> this was merged into -next a few days ago, and I'm seeing warnings on
>>> boot now:
>>>
>>> [    0.613188] sysfs: cannot create duplicate filename
>>> '/devices/platform/soc@0/a800000.usb/software_node'
>>> [    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G
>>>      W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
>>> [    0.613197] Tainted: [W]=WARN
>>> [    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS
>>> 2.13.0 09/19/2025
>>> [    0.613199] Workqueue: events_unbound deferred_probe_work_func
>>> [    0.613206] Call trace:
>>> [..]
>>> [    0.613226]  device_create_managed_software_node+0xe8/0x108
>>> [    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0
>>>
>>> There is indeed already a software node being created in the shared dwc3
>>> core code.
>>>
>>> Could there be any other consequences than a duplicate sysfs path?
>>>
>> Answering my own question: even worse messages when the controller switches
>> to gadget mode (which happens even with chargers when DRD is enabled)
>>
> 
> 
> Thanks for the report Val.
> 
> Hi Krishna,
> 
> Can you help send a revert patch until a proper change is in available?
> 
Sure, will send a revert patch.

Regards,
Krishna,
