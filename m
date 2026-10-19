Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7B3FBB72
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395653; cv=none; b=bniKF7o+jjd6xzHHgldjPpFU4co1iRLPKtF61bM+GIp17IikmuNDinTzN57pP6qRLiEPG61f/mdGSlK54iXnOEwbqeKOTcl+ImqQNcCHJGtrzT7ov9ceIzOoFqHn8WF4eRcDbYAbFTyWLnxBsT81RgBAIm2Tfsmz5UpA32zzG2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395653; c=relaxed/simple;
	bh=OCVMV0IKrd29NclpDRVmil+PGO5nL1mX3UOCSUhJQm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ2vNUA5kvnfYCU0B+gRjEddGwT6grw1nNGRWJhg7oh92FvJ8nGm/v3Bz/eqKJR0MlBzUKt0sQ+xFExtdyBR8zrKUQWkLO48atYSHmuJiBFPtXD5pkO5UtcYfGIK74rxgRMD68xNsGSAF7qm6hX5MtiElCiT/ILlimMTsUG5PGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/wMucLj; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/wMucLj"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1229947eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792395651; x=1793000451; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BeGiDStF9eNoCQfKhlV8VGcTt3Kr1QpPNqxrZ5/m7SM=;
        b=n/wMucLj0pec3tIla0iKVuZemSHt0hRMbAOymSsU4q/MOGh42priDG3LtOgCQYj8jF
         yCRRH+iE1s96ZZAK/tjJ0JPI9dq3+zcsZbuFJmqlFL95vFxhKB9Ys49xU++i3Z/sD5or
         4gs6Do583HRHEz+OXK5agtKLoC6YW6Hz5+oixXWveaibV6KQgzrCswgCgQsRZxNmSzYU
         5SA8nlsXW6ewhfvrZJ6Q+Sy7AMGxNhde1bnm5Zzqu6KTfNfLxNpp9Cc1sBA4+AR4QUmo
         1uOiFq59fCXOWl0+hYSogAdDJr7hIJqkEzs2GxHwupcUKLQNkdbREppvd7GEQWInDcRp
         tMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395651; x=1793000451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BeGiDStF9eNoCQfKhlV8VGcTt3Kr1QpPNqxrZ5/m7SM=;
        b=wB2JduBQQmQ+OzPtKJRyJlyKh9QsF9MrUCkbAhKLHibianiXU7w2Gl9GdVkrZ0Ou7m
         /DGVf+bPdiFOEY5Gt6qW9PSHmdE/+54I/Qsy/2bHnBRSdQ6lNIaa/mdbrO2f3aEYSgwk
         /61kp6TQf/VpIn9mpVtziyluuFIJ5yETwU5Ma+/+52P0rfpujNQ1MWPSYwVmSj6Wwg7A
         KG6wr+pfp+yqJ25gQH2xBlt/5jQRPmPMHEjzTfGfenqAi3ONnr48dg6aA13YGhCiIqkz
         C9Hhvc8dzRK8aXJoZOiglnhRE4+ouhR1loX3RVfkh+7c2R9U3DjAJP6TOWQi+G3L3dHp
         dYuw==
X-Forwarded-Encrypted: i=1; AKwUvBwPmP8DgFSL9X/c76NOlR369U1i9/5nZlS6iqcSj6Lz+EtBoSNBATdFi7o1/NBgCFx/RoKWn0sYPaaIN8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbqYSTHERhrbvPHjPkqX+akws4U186EPeYA94B/JlucmAVc2Ep
	vmzpFdpNTFGILeSR0on49p9OkbSPwg0NEmMPPRhsQn2yjh/W15qXrqM3
X-Gm-Gg: AYBFou20tJeRpR9ENBSX3mmR3gZYs43vRiMPmNzFwAynN2WJCNtvbO0B2ZDDQxWO5AU
	4PhVX9V125g6D4zIrITJBo5IJggzJLZ8Rs1DtM52WQxHRAwSTi0/buUj63D2V4wDD9YIY8Kfg1q
	aBvm0rXpmBPMrhOngJ/dTO2rLiyQlg6nbw1lFEUflw07xppPkKSdXrWWmI9vHJzpU85rGsrNGua
	zpCVKqpJ/Rrgze/NBXcg7ADWK1Hs0KxVKNuZ97KtqHC+0M+7S/B+HZdCNEUZsA3ZWQMFnCLjnhU
	KRwEx8XSi3tRwgdStiSELgnzV+8ZwNnxTng3a+8RxrhUOHI8dF4RyCr1J3KsdDSfM2XyUAsqLrZ
	f6OaKkNkJx0E4J65WNgNOA0De5E1y5Ay2TjE9b3LnIg1ZuZLQANIubAlIWA/OzbBPkllLuO1pyF
	pg1qOfcjLrJKAbc5ZvHvVOWweMqCTPurVcy70Tmkoj4ZZUHIZ+Jkfzpr5fh1jC9VU5Met7nOpv+
	ZiVNG4s1+NzldCdl5jxyS2u26+pQ35x5vcqTSfaNas1RCI+x0jzGiHW8uEblLkEo8c0xHbue6V2
	p9E=
X-Received: by 2002:a05:7301:271d:b0:353:5d0a:dba4 with SMTP id 5a478bee46e88-361a2449313mr12338122eec.36.1792395650437;
        Mon, 19 Oct 2026 00:40:50 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm33971784eec.6.2026.10.19.00.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:40:50 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:10:45 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable hwmon attributes when no
 fans are usable
Message-ID: <atW-vwLB8k8yaEc2@archlinux>
References: <20261017132421.279522-1-krishna.chomal108@gmail.com>
 <650e9c05-6631-8870-44ba-5a7532cb500b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <650e9c05-6631-8870-44ba-5a7532cb500b@linux.intel.com>

On Mon, Oct 19, 2026 at 09:22:59AM +0300, Ilpo Järvinen wrote:
>On Sat, 17 Oct 2026, Krishna Chomal wrote:
>
>> Currently, hp_wmi_hwmon_is_visible() checks whether fan RPM queries
>> succeed before exposing fan1_input and fan2_input, but pwm1_enable
>> remains visible always, even when fan support is unavailable.
>
>Why does it yield different result from is_visible?
>
>...Somehow I find starting with this more confusing than helpful.

Hi,

Thanks for the feedback. Let me rephrase the two issues:

This is how our current switch-case looks like in is_visible:
	switch (type) {
	case hwmon_pwm:
		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
			return 0;
		return 0644;
	case hwmon_fan:
		if (hp_wmi_fan_control_supported()) {
			if (hp_wmi_get_active_fan_speed(channel) >= 0)
				return 0444;
		} else {
			if (hp_wmi_get_fan_speed(channel) >= 0)
				return 0444;
		}
		break;
	default:
		return 0;
	}

For pwm1_enable we have:
- type = hwmon_pwm
- attr = hwmon_pwm_enable

which means we go straight to return 0644; exposing this field for all
devices. For OmniBook series, changing pwm modes would result in either:
* Failure with WMI error
* Silent failure (stub firmware, see below)

For fan attributes (fan1_input, fan2_input), the return value of
hp_wmi_get_fan_speed(channel) decides whether they are visible or not.
I believe, the idea originally was to expose these fields to userspace
only if the get fan speed queries success. But the problem is, certain
devices (OmniBook again) have stub methods in their firmware, returning
all-zero buffer instead of an error. This means: get fan speed query
returns 0, and is_visible ends up exposing this field to userspace. This
is problematic because hwmon will always return 0 RPM even when the
users have reported hearing the fan spinning.

Both issues arise because fan-related attributes are exposed even when
fan support is unavailable. To fix, we use the fan count query to check
whether fan support is available before exposing these attributes.

>> On some
>> devices, such as certain Omnibook models, the firmware does not provide
>> functional WMI fan methods. Exposing pwm1_enable on these devices can
>> mislead userspace and cause fan mode changes to fail.
>>
>> Additionally, some firmware implementations provide stub methods
>> that return an all-zero buffer instead of an error. In this case,
>> hp_wmi_get_active_fan_speed() and hp_wmi_get_fan_speed() can report 0
>> RPM even when the fan is physically spinning.
>>
>> Use the result of fan count query (fetched from firmware once in
>> hp_wmi_setup_fan_settings(), and cached in hwmon private data) to
>> determine whether fan related attributes should be exposed.
>>
>> The fan count query can have the following outcomes:
>> * Negative: The WMI query failed. Other fan-related queries are also
>>   expected to fail, so disable fan support.
>> * Zero (stub firmware): The methods return zero-filled responses without
>>   providing functional fan support, so disable fan support.
>> * Zero (genuine firmware): No fans are exposed through WMI, so disable
>>   fan support.
>> * Positive (1 or 2): Firmware reports one or more fans, so allow fan
>>   support. Per-channel RPM queries continue to determine which
>>   individual fan input attributes are exposed.
>>
>> When fan support is unavailable, hide the fan and PWM attributes and
>> skip applying the initial fan settings.
>>
>> Tested on: HP OmniBook 5 Laptop 16-ag1xxx (board: 8DF4)
>>
>> Tested-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
>> Reported-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222138
>> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
>> ---
>>  drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>> index 0eac5e1d9cdb..52077833ac89 100644
>> --- a/drivers/platform/x86/hp/hp-wmi.c
>> +++ b/drivers/platform/x86/hp/hp-wmi.c
>> @@ -651,6 +651,7 @@ enum pwm_modes {
>>
>>  struct hp_wmi_hwmon_priv {
>>  	struct mutex lock;	/* protects mode, pwm */
>> +	int fan_count;
>>  	u8 min_rpm;
>>  	u8 max_rpm;
>>  	u8 mode;
>> @@ -2950,12 +2951,18 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>>  				       enum hwmon_sensor_types type,
>>  				       u32 attr, int channel)
>>  {
>> +	const struct hp_wmi_hwmon_priv *priv = data;
>> +
>>  	switch (type) {
>>  	case hwmon_pwm:
>> +		if (priv->fan_count <= 0)
>> +			return 0;
>>  		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
>>  			return 0;
>>  		return 0644;
>>  	case hwmon_fan:
>> +		if (priv->fan_count <= 0)
>> +			return 0;
>>  		if (hp_wmi_fan_control_supported()) {
>>  			if (hp_wmi_get_active_fan_speed(channel) >= 0)
>>  				return 0444;
>> @@ -3124,6 +3131,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>>
>>  	/* Default behaviour on hwmon init is automatic mode */
>>  	priv->mode = PWM_MODE_AUTO;
>> +	priv->fan_count = hp_wmi_get_fan_count_userdefine_trigger();
>>
>>  	/* Bypass devices without fan control support. */
>>  	if (!hp_wmi_fan_table_supported())
>> @@ -3208,6 +3216,11 @@ static int hp_wmi_hwmon_init(void)
>>  		return PTR_ERR(hwmon);
>>  	}
>>
>> +	if (priv->fan_count <= 0) {
>> +		dev_info(dev, "No usable fans reported by WMI, disabling fan support\n");
>> +		return 0;
>> +	}
>> +
>>  	ret = hp_wmi_apply_fan_settings(priv);
>>  	if (ret)
>>  		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
>>
>
>-- 
> i.
>
