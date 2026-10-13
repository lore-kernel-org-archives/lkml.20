Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE940DB53
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884002; cv=none; b=SelcAq+pEjhqUsWykRsFssm8ho1O3QN9/XR0u4armWhAO0TGCugIfsdlO1k6yJieeB4GW/OSMFyUcnxr3I/6daob948AFUUd7vKlDT2jBpdc9EM3SXkJxLSZKjIuRe/qt401X1uRrZDDiYzDkuQeqIAg+nqlTOX07cwK793cS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884002; c=relaxed/simple;
	bh=GpEWMCk465fYWaNMRjPWrbrqSW8S7SvqvlTNLoxTTKo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iBKkRUFY8FUvMdD6Hs/JE3v4GcHGDj31Oou471RNM4ZuXcTKKgfag3TAYSiEWAyA61UGl8dus0wxVWcXzR/zbr3YmTHT4WxiUOZRi0GG2EqiLeHIag/KDhqE0tJwnVyY4Wi9XiWPODm1JbhltprpGIY7GoGctr+yyXG7/ZKJxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jizr1LoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dkt52Ko7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jizr1LoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dkt52Ko7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8OhSI3055513
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6B9+bIi044eikoFbvIIj7OQGZrIoMeOPnSHN7hdqGA=; b=Jizr1LoYfw/RKTvj
	QqxAneSHDFIqbfoYSSFJ/IszjW/GVKt5bdKWEyq37JLbyH7f7sXTOQXVRYlZTr+F
	lbI1as7naq5+Byhc56uf0hQzKXTVvI9o3N3il29c9eW0VeJioY6NE5om2pzn8pel
	OwlV6/fj+Xx3aLQouOWkSWp50qcpfkbumesjxw0Dp+0hCGFBMC3lIa+pygVcRFUX
	mQxqOuttPR569tsf24gmvZX04fiXMwBKcDJizbwgTQgHSAdRds6xVBukZYpH5fpx
	Hl918YEj2sZQ3AQJ8bhM6yTfASDWcVKIcTdR33Yopi5FyK+b3bEAW1NLqDENZXto
	zSlwLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuj4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so891565685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883995; x=1792488795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6B9+bIi044eikoFbvIIj7OQGZrIoMeOPnSHN7hdqGA=;
        b=Dkt52Ko7astTpwcb/VajyW15VOfUjpS8OlUJynnVCO2gdT4cNefXWcIQKnb0dcxLf9
         WeA7TWqqc+CweRmVhYomy7lHF3gfiZ9VIuq7HBYngJbT488abR9Fp5zLI42J3fs2nP6X
         +hGO5Tlll2XkisH3xad4OIggT1mBUgX2xLnoLbrix1YFUTy3pRYGjOT/Rkag60NqOQzn
         AAicuCmePc2a4hO6x0EbE4N5QNOXnTFl+yT4m5IlSgtjJ1Z/liPNEgOGLstaXhmILVEG
         FKwRuRDW1zxTCX1YPO8PGNFJEFXt1itKiLgwpG0+rhrfOJDE+jwcyXhnsrNHFhbI9SJx
         nxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883995; x=1792488795;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6B9+bIi044eikoFbvIIj7OQGZrIoMeOPnSHN7hdqGA=;
        b=RVpO9xgcdyRe3YkgP18JeudfKkYYP6PcQ/s8lGCB/1Jn4Nz8w8Ehz4GGoXVZPc5AHQ
         RbfVimTyxFNL8lqQ+MfQ1JmK2BH/BTxV72bGEptNsugU4IfupcAX6N67IKI0gI7JVsx4
         azgGdeJ4o5HME4vonzygemR65lxMWjtguCsu4Hi2N/jZHdirjaq0uUZmaQ9xY8OtwQAt
         eTehvp2YAxZ4LjKv2IugXih39QLPWb27AvuQFYoFre6HR02/gQox0lpcgTUptSP9wCpe
         d72I7PAGreHOgZT3BYj+kIg8uzKFN+6o5b8l+p5y8z3rEwQuKB4EtgQ+i3EleLSjCrms
         9a/A==
X-Forwarded-Encrypted: i=1; AKwUvBw+54h0K8Yk+N1RFajppO8sFjJtAuU9ktvrXh1jZJxhrv1/dMRl7eIPgc7PPS3+Xeh1lGFrJvCqeYXiufk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/VzUj44dicWosALbTK0tn7JJq2EGqa18X6nFbrRELqbb8N4YN
	xWyBi94HQxeGU1k0ID2aAAeV811VK9EKZABw+5Rt4PM4FDCUciyqbQ2g1MzPLiTqiOXf+e2e4cD
	5c8+nh3AsNRs/KqT+3sjUydk7K28VLu+hZqVCvziz9bSCGjObZncIsKsrtROlD48vcBY=
X-Gm-Gg: AYBFou12OliuOH6bekvbS037DdXwLLvbIrbarr1+q0OmuS5t0W6Hum6P8YZtNZF7idl
	EOoJ2LEtIagpIcgTRtXxZL/Fjiw6axtQNiSl2zDrA3++XRR2Uwy+B1WJswBUJt2aaKMOCgh2PTF
	gis6i5r8udwphEWkcbmeMIOZHpa6wQVttnI0gMwciimoK2uzkztenCmgOyU7GHGMfak/QuK9t25
	r7fu5lJnMb/JINTbezSDoYumFgpk1vGexVvpnrWpagyyRue8wpEgttEscoWTFxxazvc9OXWWO9V
	J3I0JmzU87ZvIxkqJekENoPNbXK/T6sxDbxK+oYUxiGJtIq9KzEBwsNYTVhD67ZfUeZpHdLxZEL
	ZufrKecwQIvOIShNElHwqUbzARxxOeHFYs0jcGSSnCoxkVaKwU0i6Qgc0R7HiKMtzYqxGWcYiyq
	vP0RWH7rRTlK3Fx4VofFleEufDq/YwR5X2QK3GosRTnH4u4robTrcW1NATPRFihJU5vg==
X-Received: by 2002:a05:620a:4510:b0:93e:c12c:f13a with SMTP id af79cd13be357-93ec12d0631mr1790185885a.68.1791883995044;
        Tue, 13 Oct 2026 02:33:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:93e:c12c:f13a with SMTP id af79cd13be357-93ec12d0631mr1790182785a.68.1791883994619;
        Tue, 13 Oct 2026 02:33:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm2346702a12.27.2026.10.13.02.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:33:13 -0700 (PDT)
Message-ID: <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:33:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] ACPI: battery: Re-read battery information in the
 complete callback
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, regressions@lists.linux.dev,
        Mark Pearson <mpearson-lenovo@squebb.ca>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261012225141.13683-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0jJHZDsLI85yeOP0bDjv2Fdg6f6t9yJ0
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdfadb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=LpNgXrTXAAAA:8 a=-CJwA2ej0K7jv6hoTRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfXxVdBv31k2g1h
 v2QHRd5KEvjQFQ7BDRdlW2VW+/JMesJwWiArn+G5l2eovDdOJPhvIdFdpqjheEUm74bdNc6z3zy
 MN3H4fxIE5r0elhzRHfXcVVCecl0kdA=
X-Proofpoint-ORIG-GUID: 0jJHZDsLI85yeOP0bDjv2Fdg6f6t9yJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX43JB6Us5cu8Z
 c4hy8EF5CdqqFrHmZhFj1vUH7OWAE62s1dILs/haDVIRqm+WvezlqUnKUOjwUjOineDRgDYeglA
 jgNmHqonisaQWJQTRKxQx+OGTNHu0Job71OolhTUSIwPMbKciY5F67QNETpATYy26ZB0Zi/jIAh
 fn7eWG91BZ1tmoohRjoZVNOkFDD+gG8iRYqSWkbEFXYCHBKWz7mkH1zuvlhaXuEFlJLmd6CQGMT
 8l6qruNBf4fN67P9ZWJcvbq5I0GW2k+607j4nJ5RJ+qZ3bjEwWTmtogbx+VecLM2etKaoNfsanO
 J0wAAd38mrKJRC+Z8sKQO+W770Skn/zbp+5VEx8Z1KC5gaOzmquvKNHz2/nqvTybc2MFL3eS3A1
 vbGgPQAWDidUkixK6LrZHrzEZW6jquAzPsUdh0xjIdy3oCcJhRBdp2JOG/US+BkDRzBxHaj54Ej
 vmX3xlWywJOZEo63wjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130037

Hi,

On 13-Oct-26 00:46, Ali Ahmet Memiş wrote:
> Since commit d33e89d12295 ("thermal: core: Suspend thermal zones later
> and resume them earlier"), thermal zones are resumed from dpm_complete(),
> before the PM_POST_SUSPEND notifier that re-reads _BIX and _BST. On
> ThinkPad P1 Gen2 and P53, INT3403 _TMP calls \GTST which switches the EC
> page selector (HIID) without taking the BATM mutex used by the battery
> methods. ACPICA releases the interpreter lock around EC accesses

I'm wondering if this "ACPICA releases the interpreter lock around EC
accesses" is not the real problem here. Recently I've learned / heard
from a trusted source that Windows ACPI subsystem is very much single
threaded. So it is nice that ACPI has these mutexes and other stuff
to support multi-threading but as long as Windows ACPI interpreter is
not multi-threaded I think we may need to consider to copy Windows
behavior.

So maybe the EC accesses should keep the interpreter lock locked during
EC accesses.

And even go futher and maybe we need to introduce a big-acpi-lock,
which I guess the interpreter lock more or less is? And just serialize
all ACPI accesses since most ACPI tables clearly do not handle
multi-threaded access to ACPI methods well ?

Another example of multi-threaded ACPI calls causing problems is:

https://bugzilla.kernel.org/show_bug.cgi?id=221065

Regards,

Hans



> so the
> two methods interleave and _BIX often returns temperature page data
> after resume.
> > Evaluate _BIX and _BST in the complete callback, which runs before
> dpm_complete() resumes thermal zones and leave only the sysfs
> re-registration to the notifier.
> 
> Fixes: d33e89d12295 ("thermal: core: Suspend thermal zones later and resume them earlier")
> Reported-by: Charis Stratakis <c.stratakis@proton.me>
> Closes: https://lore.kernel.org/all/37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
> ---
> Ran into this (report) while reading the EC firmware of my T490.
> The P1 Gen2 EC has the same single page selector.
> 
> Tested on 7.3-rc7 with an SSDT that makes a thermal zone keep calling a
> copy of the P1 Gen2 \GTST after resume.  _BIX was broken after 5 of 5
> resumes without the patch and 0 of 5 with it.
> 
> Doing it in the resume callback also works but _BIX takes about 75 ms
> there right after resume against about 35 ms here (and by the complete
> callback all operation region providers have resumed too).
> 
>  drivers/acpi/battery.c | 62 ++++++++++++++++++++++++++++--------------
>  1 file changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index 670853ec3a4d..34f2e78c4314 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -107,6 +107,7 @@ struct acpi_battery {
>  	struct notifier_block pm_nb;
>  	struct list_head list;
>  	unsigned long flags;
> +	bool resume_reregister;
>  
>  	struct mutex property_lock; /* Protects properties below. */
>  	unsigned long update_time;
> @@ -1209,29 +1210,15 @@ static int battery_notify(struct notifier_block *nb,
>  	if (mode == PM_POST_SUSPEND || mode == PM_POST_HIBERNATION) {
>  		guard(mutex)(&battery->update_lock);
>  
> -		if (!acpi_battery_present(battery))
> +		if (!battery->resume_reregister)
>  			return 0;
>  
> -		if (battery->bat) {
> -			acpi_battery_refresh(battery);
> -		} else {
> -			int result;
> -
> -			scoped_guard(mutex, &battery->property_lock) {
> -				result = acpi_battery_get_info(battery);
> -				if (result)
> -					return result;
> -			}
> +		battery->resume_reregister = false;
>  
> -			result = sysfs_add_battery(battery);
> -			if (result)
> -				return result;
> -		}
> +		if (battery->bat)
> +			sysfs_remove_battery(battery);
>  
> -		scoped_guard(mutex, &battery->property_lock) {
> -			acpi_battery_init_alarm(battery);
> -			acpi_battery_get_state(battery);
> -		}
> +		return sysfs_add_battery(battery);
>  	}
>  
>  	return 0;
> @@ -1450,7 +1437,42 @@ static int acpi_battery_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static DEFINE_SIMPLE_DEV_PM_OPS(acpi_battery_pm, NULL, acpi_battery_resume);
> +static void acpi_battery_complete(struct device *dev)
> +{
> +	struct acpi_battery *battery = dev_get_drvdata(dev);
> +
> +	if (!battery)
> +		return;
> +
> +	guard(mutex)(&battery->update_lock);
> +
> +	if (!acpi_battery_present(battery))
> +		return;
> +
> +	/*
> +	 * Evaluate _BIX and _BST here before thermal zones are resumed, as
> +	 * some firmware shares the EC window with _TMP without locking.
> +	 */
> +	guard(mutex)(&battery->property_lock);
> +
> +	if (battery->bat) {
> +		int power_unit = battery->power_unit;
> +
> +		acpi_battery_get_info(battery);
> +		if (power_unit != battery->power_unit)
> +			battery->resume_reregister = true;
> +	} else if (!acpi_battery_get_info(battery)) {
> +		battery->resume_reregister = true;
> +	}
> +
> +	acpi_battery_init_alarm(battery);
> +	acpi_battery_get_state(battery);
> +}
> +
> +static const struct dev_pm_ops acpi_battery_pm = {
> +	SYSTEM_SLEEP_PM_OPS(NULL, acpi_battery_resume)
> +	.complete = pm_sleep_ptr(acpi_battery_complete),
> +};
>  
>  static struct platform_driver acpi_battery_driver = {
>  	.probe = acpi_battery_probe,

