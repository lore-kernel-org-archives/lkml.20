Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879705;
	b=3VwXx+ExvjqHJ8iFZ7RAgQBnCet10hUhUp/xVvA3lJDDRfB+nBhlv2xWQCG738a31Hyl
	 xdA1jmk+l++8Tyu9qLzNbi5/NsoaexbmkYt6jEgAigXr/ERX8HwFtU//9PrFhmOMpYtuL
	 gEB5ghI1urNwgP6gmh1dCf1Zqw7ylsKGzbCGDOxU0MhrksLUq+SDp//NqoQB9tKyHsBIl
	 zeKkBU3EI6qyo+BaxQKhtL7J8Ek8rV/Sd1+GsBFQy88niaI34nZiNAuxYSMw2HZC9RxtZ
	 GcZn5av6kYGEfWQFlFvkYkbYp8yP9pwHpI3ag1O7FBwaIqm1t3YkQ+PtAd0sZWjNUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879705;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HyB4U44tHURV9jD0PFddwG89p/LeN3zz5neKsnoHjH8=;
	b=RdawK4FYjmzaLzgDXDqiddzjt1Tx/DmYH6U20OK21C7bkd5NLZAvz5Prc4t5lTmQ3Afu
	 8UlNA/Pbr+fmm2nW2YG25uy6HNrG4Fz9KCgpcF89qVdu5qreP4ecMjKuqpaIzjtwTjw4j
	 F6w5bMUWJ7gdL1GlyvOKAZ8kvejbcPeCUqJ2m3LHdEEXva67bUf1Au2fQ5RFvtRrVsrPr
	 Sl1ZJrVaspWJuZqSgW1li1jqOW3Af6bexeAbrdPl67AldmpNmxw8rGpnq/5NiAHDpTiJf
	 JA6YQ1/EwVmQR5Ot/wOQCAxFTAwbLRlg+728foL/KMP16St3qwNIygnoqRLRDXnN9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlqsHq8i;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF2F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AlqsHq8i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794879705; x=1826415705;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=LUaw1T7bjoW+GXgRPvj9BeoUVtUWawkATYHZ49V0X4M=;
  b=AlqsHq8i9mVYKMPShUsviXUVJhKKFCkBppiiT+lAbVh/+y5yjlFNGDpI
   /bUuF5rvdy4E17Xm9pMPAf6v0cZQD/Zhdd0/56oxBVvSoVjLiC9U1R58E
   Ub1S8ufzc1JvrsRnUZmDRYkpkqUxsLQPLEdyItfh5g7zYmPMFRqDEyc92
   9H3kchrBfTGjCGpA3iWJ4iz9fVt2WVnMY/3MBjWa8DajeCEQ+dtqwEe6r
   EATYgo+plaikP3XMXcRkI7kMErqj9n/wcJH/q83bySKergeVUxDEI7mjH
   YQNPL66n6g4gnAFRY7n0OhkS8FwoHOOCMl8PF4XTPoBUUo1++oXvg3SGn
   g==;
X-CSE-ConnectionGUID: QK2HL0QOQlSFN1dN4kexEQ==
X-CSE-MsgGUID: KBR0LivZS0i15uird1/Pdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3486269"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3486269"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:41:44 -0800
X-CSE-ConnectionGUID: Pr9QhlaeSRK22fSW7xyoWg==
X-CSE-MsgGUID: jPeOc0kOTeaX5X0jwaa0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9912089"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:41:45 -0800
Received: from [10.238.144.110] (baolizha-mobl1.ccr.corp.intel.com [10.238.144.110])
	by linux.intel.com (Postfix) with ESMTP id 43BC520B8CD1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:41:44 -0800 (PST)
Message-ID: <5ed01aa4-1986-4db1-91b1-77dcc7f747e7@linux.intel.com>
Date: Tue, 17 Nov 2026 09:41:43 +0800
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
Subject: Re: [PATCH 2/3] drm/i915/display: Let the drivers free the KMS
 objects
To: linux-kernel@vger.kernel.org
References: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
 <20261116011504.3910139-3-baoli.zhang@linux.intel.com>
 <171277546a58621d8b771fd7043dad0fa0559da1@intel.com>
Content-Language: en-US
From: "Zhang, Baoli" <baoli.zhang@linux.intel.com>
In-Reply-To: <171277546a58621d8b771fd7043dad0fa0559da1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/16/2026 4:39 PM, Jani Nikula wrote:
> On Mon, 16 Nov 2026, Baoli Zhang <baoli.zhang@linux.intel.com> wrote:
>> intel_display_driver_remove_noirq() frees all the KMS objects through
>> drm_mode_config_cleanup(), while userspace may still hold the DRM fd
>> open with references to them, e.g. framebuffers it created. Such
>> objects must only be freed with the last reference to the DRM device.
>>
>> As a first step, move drm_mode_config_cleanup() into the new
>> intel_display_driver_mode_config_cleanup() and call it from i915 and xe
>> right after intel_display_driver_remove_noirq(), so each driver can
>> then move it to the right place.
>>
>> drm_mode_config_cleanup() now runs after the rest of the noirq teardown
>> (DP tunnel manager, overlay, GMBUS, workqueues and FBC). After the
>> previous patch the KMS object destroy callbacks no longer depend on any
>> of that.
>>
>> No functional change intended.
>>
>> Tested-by: Yanx L Liu <yanx.l.liu@intel.com>
>> Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>
> Please don't add new display calls to i915 or xe core drivers. The
> direction must be the opposite, there needs to be fewer calls. Move the
> functionality in existing higher level display functions.
>
> I see that patch 3/3 then changes i915 and xe to behave differently
> here. That's also the wrong direction. We need to make the drivers
> behave more similarly. Can't have one driver make some calls, and the
> other not.
>
> The approach here makes future changes harder.
>
> BR,
> Jani.
Sure, thanks Jani.  will have the v2 version based on your comments.
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_driver.c | 12 ++++++++++++
>>   drivers/gpu/drm/i915/display/intel_display_driver.h |  1 +
>>   drivers/gpu/drm/i915/i915_driver.c                  |  2 ++
>>   drivers/gpu/drm/xe/display/xe_display.c             |  2 ++
>>   4 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> index d513cfc881069..62a4d95d78b53 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> @@ -160,6 +160,18 @@ static void intel_mode_config_cleanup(struct intel_display *display)
>>   {
>>   	intel_atomic_global_obj_cleanup(display);
>>   	intel_encoder_remove_all(display);
>> +}
>> +
>> +/*
>> + * Free the KMS objects, including the encoders torn down by
>> + * intel_display_driver_remove_noirq(). Userspace can keep referring to them
>> + * until the last reference to the DRM device is gone.
>> + */
>> +void intel_display_driver_mode_config_cleanup(struct intel_display *display)
>> +{
>> +	if (!HAS_DISPLAY(display))
>> +		return;
>> +
>>   	drm_mode_config_cleanup(display->drm);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
>> index 1ae2ad7e95f6c..88d9028e86e4b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
>> @@ -23,6 +23,7 @@ void intel_display_driver_register(struct intel_display *display);
>>   void intel_display_driver_remove(struct intel_display *display);
>>   void intel_display_driver_remove_noirq(struct intel_display *display);
>>   void intel_display_driver_remove_nogem(struct intel_display *display);
>> +void intel_display_driver_mode_config_cleanup(struct intel_display *display);
>>   void intel_display_driver_unregister(struct intel_display *display);
>>   void intel_display_driver_shutdown(struct intel_display *display);
>>   void intel_display_driver_shutdown_late(struct intel_display *display);
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index aeb7b24c81c8b..d29b37ab2833e 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -906,6 +906,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   	intel_display_driver_remove(display);
>>   	intel_irq_uninstall(i915);
>>   	intel_display_driver_remove_noirq(display);
>> +	intel_display_driver_mode_config_cleanup(display);
>>   	goto out_cleanup_modeset;
>>   out_cleanup_irq:
>>   	intel_irq_uninstall(i915);
>> @@ -951,6 +952,7 @@ void i915_driver_remove(struct drm_i915_private *i915)
>>   	intel_irq_uninstall(i915);
>>   
>>   	intel_display_driver_remove_noirq(display);
>> +	intel_display_driver_mode_config_cleanup(display);
>>   
>>   	i915_reset_error_state(i915);
>>   	i915_gem_driver_remove(i915);
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 506f26e9c59a8..d33052a98d942 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -73,6 +73,7 @@ static void xe_display_fini_early(void *arg)
>>   		return;
>>   
>>   	intel_display_driver_remove_noirq(display);
>> +	intel_display_driver_mode_config_cleanup(display);
>>   	intel_display_driver_remove_nogem(display);
>>   	intel_display_power_cleanup(display);
>>   }
>> @@ -110,6 +111,7 @@ int xe_display_init_early(struct xe_device *xe)
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_early, xe);
>>   err_noirq:
>>   	intel_display_driver_remove_noirq(display);
>> +	intel_display_driver_mode_config_cleanup(display);
>>   	intel_display_power_cleanup(display);
>>   
>>   	return err;
