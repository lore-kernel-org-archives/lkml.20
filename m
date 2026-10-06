Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB133BFE2F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276848; cv=none; b=UwTWZmtQOSiNch3i7+WUCqDLIXLLNjmI1HqZf4E1AgpJdWr5bzc1L658VDVeJ6QbmWQjMYcVAgm/uH8Pi81bcnMHWH3yWZvcT9w+/SrqFdWxaBL1Fq2NPOAqUUICj+qM9KCQAzQa8C6M/SlPBUfAD5hBpJf0Q1cOM+jrQ1D43zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276848; c=relaxed/simple;
	bh=pEICiCXqsvjm+RcTdBzINg+1WAhtpYv3zpVmdUVt4OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUafuKFacAQu5HG7LkDaa40yBEi8r2ou8K9H9aPbBs9NQCFEx59Oe7B83TlrqM8zAeriBRpbSRQK2to74IL1rqDkBl+m26Spdwk3o0o+cFwcXsXM07uMXzETe0v0UFtqCH8dRAH2+eqvqyoLmuZUvIJOQIrE+3kgNpcFZLQ7Io8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZatZWRD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZatZWRD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e6f83f0bbso24456885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276841; x=1791881641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfJXTdn8ue80wbPghLppS9dzjz3UnRYmvDs5id3wkqs=;
        b=CZatZWRDiaYe65p/oGllJ05HoaWv/ltiV3koa8SKG3yPA4LUSIZplpCyR9tFbx/M4D
         U8/0X94P27g5qZB98ShlNvuZqIkbjHKdbV/A2jpFDjkDVKM3Mjom3eBbpd11XVywyows
         /+5TokSA9XTpAZ6IdyQFX1oFSQHGwKVztT2OStDbu2KBUo+5u8oxFU801WRFMDggCwiu
         BLQxjBOb1SF/JhCSH393mAJqlZqK1RBeAdQc2FIAwEgUbBB52bv4ezeZbS8nQsH7J5/F
         8TT6Uxbwz8uYuYUy+bPO4bTBciMOMQk/Ossff1r65AuvpgOK5TqPFNOcY/ZBCc9vV1Kx
         l1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276841; x=1791881641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfJXTdn8ue80wbPghLppS9dzjz3UnRYmvDs5id3wkqs=;
        b=Oq4afPbX/Tl3jVINRH8kpdN3D2fo+XHt2bZ/l4fY0lhFk7fGz8febh72JgAPQX2POs
         gcJFCLY4VW8GjYEwGisN9BDnej1EsJMY2PwmD0wQ854ULjDuus+OOR9HSW+fcVqlWdQ2
         p71A8DbJaY+qfw45XVyltnEgLn+RLROtn9QkxI89cg0xpibUMXuM5Lo13RFv9gIbet1H
         o/y6aCuSpFG653VO/F/nFX5bg0U2W0APoCo2tD2/+5nNzDyssUtthEX9BRsUsRiAZUkV
         gMUBcwlNBqTDfVBIzImpg8W2AdTbBQla0tAELyPusTs2UdOE6E0tqb1/OJ5DeP6q1eth
         cSAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0B8+t5q+8GyrkKyzRyTreFVOe3+f/EvuyZvR2u4IWPSFO/11bvUnIth9JJvtu4ckElH15mRRpQ5IUrvw=@vger.kernel.org
X-Gm-Message-State: AFuF++mubaOA1KP2nG3UQI2jxL5xV0YGlUfhsVh1O0Xt2iEVVSBHKEsc
	PwKb8wGOUdtE9gjv7HbCQUagDAgqHXzgxMYKq4c66Ot9j44MyLDiiQgI
X-Gm-Gg: AYBFou1TOV1LK6ojlmcWEaqDuS7BmnBfSAtTQ0Yq/Vwh/NM9MUYpd5aLQ4elgaB4fSP
	xZRhGXycepjK5XO2Mikx2UExb9+E9C+e+93tKQCahugavchaTgK9FtHcfMNdGDmwElCmMculYTA
	LwLV1sqcRp4bEqRitbFP/ACW1czs3QtQDq3fpXtUt/byLg6GjXUMZdvNQO1w20qd9TBOC9ISLpK
	x7DN83s73n7plSVdyjfWdk94KGq5wN9WBcTpwrGRO1PKkZp2A/q1HrewqWvrp09VjL70JDT4L1o
	SAzeT8qXViLXwO37/KzFKySDJEQmq4Yt170j33P/7cdDAdpVdaSSTS7CQ4wj+FUshUZ7LqmzF+b
	/1CCiD74zm/ukzKzrN7yCSIQfrb6+nK76vhKw5cVGb5V/SN5eQI5qzg9q1JOpHJRbsdjT047xwP
	TtTLfEjezuYiObCKOhQUBoFbvR25ea3BiZtDZnTg05B4VLizBqnXxUhtA+jcsWJzWb0UyjsqoPu
	69XFHW9Qahdz6W/HsjqDB7HYkpUFO9Qr+rOzFJgXK2U
X-Received: by 2002:a05:620a:2625:b0:93e:5016:e3a6 with SMTP id af79cd13be357-93e8f35e939mr130199385a.26.1791276840840;
        Tue, 06 Oct 2026 01:54:00 -0700 (PDT)
Received: from [192.168.60.5] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e7ddb4141sm316305685a.18.2026.10.06.01.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:54:00 -0700 (PDT)
Message-ID: <dae242e7-fb20-46e9-abe2-12c592807d72@gmail.com>
Date: Tue, 6 Oct 2026 16:53:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/1] platform/x86: panasonic-laptop: add
 platform_profile support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20260805180544.1134916-1-alexyeo362@gmail.com>
 <20260805180544.1134916-2-alexyeo362@gmail.com>
 <4a918d1e-490b-3236-b72b-ef952e11a1a3@linux.intel.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <4a918d1e-490b-3236-b72b-ef952e11a1a3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you very much for taking the time to do a review. I have sent a v2 
to address the comments.

v2: 
https://lore.kernel.org/platform-driver-x86/20261006085021.853827-1-alexyeo362@gmail.com

>>   
>> +static struct pcc_quirk quirk_cf_sr4 = {
>> +	.use_platform_profiles = true,
>> +	.platform_profiles = {
>> +		[PLATFORM_PROFILE_QUIET] =  {
> 
> There's extra space in all these.

This has been fixed.

>> +static int pcc_fan_mode_get(struct pcc_acpi *pcc, enum pcc_fan_mode *fan_mode)
>> +{
>> +	unsigned long long state;
>> +	acpi_status status;
>> +
>> +	status = acpi_evaluate_integer(pcc->ec_handle, "CEFM", NULL,
>> +				       &state);
> 
> Fits to one line.

This has been applied.

>> +static int pcc_fan_mode_set(struct pcc_acpi *pcc, enum pcc_fan_mode fan_mode)
>> +{
>> +	acpi_status status;
>> +
>> +	switch (fan_mode) {
>> +	case PCC_FAN_MODE_ACTIVE:
>> +		status = acpi_execute_simple_method(pcc->ec_handle,
>> +						    "SEFM",
>> +						    PCC_ACPI_FAN_ACTIVE_MODE);
>> +		break;
>> +	case PCC_FAN_MODE_PASSIVE:
>> +		status = acpi_execute_simple_method(pcc->ec_handle,
>> +						    "SEFM",
>> +						    PCC_ACPI_FAN_PASSIVE_MODE);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("failed to set fan mode via SEFM\n");
>> +		return -EIO;
>> +	}
> 
> IMO, spreading stuff around like this just makes it harder to follow code
> flow. And the variation is just to pass a different argument to
> acpi_execute_simple_method() which would suggest a helper would be useful.
> 
> Once everything is done within the case, you can directly return from
> those cases for simplicity.
> 

This has been fixed by adding a helper function + refactor code to be 
like the code mentioned below

>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("failed to set power mode via SEPL\n");
>> +		return -EIO;
>> +	}
> 
> Same problem here as above.

Code changes applied to this section too.

>> +static int pcc_platform_profile_get(struct device *dev, enum platform_profile_option *profile)
>> +{
>> +	struct pcc_acpi *pcc = dev_get_drvdata(dev);
>> +	enum pcc_fan_mode fan_mode;
>> +	enum pcc_tdp_mode tdp_mode;
>> +	int status;
>> +
>> +	status = pcc_fan_mode_get(pcc, &fan_mode);
>> +	if (status)
>> +		return status;
>> +
>> +	status = pcc_tdp_mode_get(pcc, &tdp_mode);
>> +	if (status)
>> +		return status;
> 
> Please leave "status" for acpi_status and pick another name for the
> generic return variable (I personally prefer "ret" because it doesn't
> carry error connotation "err" does, but the latter seems to be already
> in use by this driver, among other variable names).

This has been applied to the whole patch.

>> +	for (enum platform_profile_option pp_opt = 0;
> 
> Move declaration to the beginning of the function.

This was done.

> 
>> +	     pp_opt < PLATFORM_PROFILE_LAST;
> 
> Please use ARRAY_SIZE() + make sure you add the include for it.

This was done.

>> +	     pp_opt++) {
>> +		enum pcc_fan_mode profile_fan_mode =
>> +			pcc->quirks->platform_profiles[pp_opt].fan_mode;
>> +		enum pcc_tdp_mode profile_tdp_mode =
>> +			pcc->quirks->platform_profiles[pp_opt].tdp_mode;
> 
> Please make a local variable out of pcc->quirks->platform_profiles[pp_opt]
> instead (with a reasonably short name).

This has been done with additional refactoring to make this into a 
pointer (as pointed out below).

>> +
>> +		if (!(profile_fan_mode && profile_tdp_mode))
> 
> This code doesn't make sense for variables that are declared as enums
> (do not handle enums as truth values).

This has been addressed by making explicit comparisons as opposed to 
treating enums as truth values.

>> +static int pcc_platform_profile_set_profile(struct pcc_acpi *pcc,
>> +					    enum pcc_fan_mode fan_mode,
>> +					    enum pcc_tdp_mode tdp_mode)
>> +{
>> +	int status;
> 
> Change name.

Changed

>> +
>> +	switch (tdp_mode) {
>> +	case PCC_TDP_MODE_UNLOCKED:
>> +		status = pcc_fan_mode_set(pcc, fan_mode);
>> +		if (status)
>> +			return status;
>> +
>> +		return pcc_tdp_mode_set(pcc, tdp_mode);
>> +	case PCC_TDP_MODE_LOCKED:
>> +		status = pcc_tdp_mode_set(pcc, tdp_mode);
>> +		if (status)
>> +			return status;
>> +
>> +		return pcc_fan_mode_set(pcc, fan_mode);
> 
> This is structurally much easier to follow than pcc_fan_mode_set() above.

This has been applied to the code above.

>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int pcc_platform_profile_set(struct device *dev, enum platform_profile_option profile)
>> +{
>> +	struct pcc_acpi *pcc = dev_get_drvdata(dev);
>> +	struct pcc_platform_profile pcc_profile;
> 
> Why isn't this a pointer?

This pattern and ones like it have been converted to be a pointer.

>> +	pcc_profile = pcc->quirks->platform_profiles[profile];
> 
> I'd put the assignment to the declaration line (it'll be only 91 chars
> long and is quite boilerplately so fits well into the variable
> declarations block, IMO)

This has been done.

>> +	if (pcc_profile.fan_mode && pcc_profile.tdp_mode)
> 
> Again, those are enums but you treat them as truth values which makes
> things harder to understand.

This part was removed as this check was originally put in place to check 
for malformed quirks (fan and TDP both need to be set). This is 
addressed via a WARN_ON below.

>> +		return pcc_platform_profile_set_profile(pcc,
>> +							pcc_profile.fan_mode,
>> +							pcc_profile.tdp_mode);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int pcc_platform_profile_probe(void *drvdata, unsigned long *choices)
>> +{
>> +	struct pcc_acpi *pcc = drvdata;
>> +
>> +	for (enum platform_profile_option pp_opt = 0;
>> +	     pp_opt < PLATFORM_PROFILE_LAST;
>> +	     pp_opt++) {
> 
> Declare the enum in the function variables and put this to single line.

This was done.

>> +		enum pcc_fan_mode fan_mode =
>> +			pcc->quirks->platform_profiles[pp_opt].fan_mode;
>> +		enum pcc_tdp_mode tdp_mode =
>> +			pcc->quirks->platform_profiles[pp_opt].tdp_mode;
>> +
>> +		if (fan_mode && tdp_mode) {
> 
> Same comments as with the other code.

This has been converted to a pointer + do not treat enums as truth values

>> +			set_bit(pp_opt, choices);
>> +		} else if (fan_mode || tdp_mode) {
>> +			pr_err("error probing platform profiles: malformed quirk\n");
> 
> This looks a clear developer error so WARN_ON() would be more appropriate
> than pr_err().

This has been done.

>> +
>>   	return 0;
>>   
>>   out_platform:
>>
> 
> Also, this looked entirely independent of the existing code (?) so it
> looks as if it should be make a separate platform_driver instead of trying
> to klugde it into the existing probe. If there aren't cross references
> besides the sharing of the private data structure, I'd just introduce it
> as a separate struct platform_driver with a proper ID table and own probe,
> etc.
> 

After considering this, I agree and a separate platform_driver makes a 
lot more sense for something like this.

