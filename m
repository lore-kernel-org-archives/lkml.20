Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A5560AA0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961534; cv=none; b=bUvHrsUla22i7Wxu4bJEaa40bXxXC8p4FUpC9Q4VyBWs3MQ/4YT0d1Xj5sce0nuHG8Yq71z9Afe0D1bmjrAnH3YPdgtdEJ79QWmzOntch69A5MH4227iHoy2znm2G/EWhqhuneotamGbCNrLFumg/6p0y6wpEroYTHTYmf8/5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961534; c=relaxed/simple;
	bh=j22DAKA+KtXYCLPyg2Jy6ahEd25Dkz00pXr34ELieGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nk3W7AjyUCEguB9nS1T2nA9Bz8U3ztxtCAptq8/axItqZfFkguR1fKhGN+bBXXhdR2YdZGUL8IAbQE29NLVSJtrWpDFFOKCQS2vKyRUrFENymbmtWFH77hZeEuWWgrd9x+kCJ48bXCLCEo+VaJhRujuvOwxMlkQCvYMWQC/euQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=gvT1IT8M; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gvT1IT8M"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 665EC2FC008D;
	Wed,  9 Sep 2026 15:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1788961528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwCNJryO9ASRAeZtfRIHKuqP9uPce6zNRFZ+i5WEDxw=;
	b=gvT1IT8MVrjJ4uSOd7pVCMJZLCwlaFi39wMzkskm0VT6JlQ6YuaX2Y179iSTZSU3tBPbXi
	2/3MRt+F2sNKlnMSGZeddpMaqpqhb6U4y77UdV9l+sp2XoSAspgz+XHy82ZXvXYawbY9Yj
	yf5nQNa4z1/JVpOJdalTzsOaRsXB/x4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <267b62f1-cc8e-4fa3-87fe-aedd5cba914b@tuxedocomputers.com>
Date: Wed, 9 Sep 2026 15:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/intel: Add quirk to disable rc6 on some TUXEDO
 devices
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
References: <20260908200707.65516-1-wse@tuxedocomputers.com>
 <20260908200707.65516-2-wse@tuxedocomputers.com>
 <7764d157c4bd6f832adeb7860baded67ae151901@intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <7764d157c4bd6f832adeb7860baded67ae151901@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jani,

Am 09.09.26 um 08:32 schrieb Jani Nikula:
> On Tue, 08 Sep 2026, Werner Sembach <wse@tuxedocomputers.com> wrote:
>> Some TUXEDO devices have random rare hard resets during video streaming.
> Is there a gitlab issue for this?
Not yet, but I can make one, presumably here? 
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items?sort=created_date&state=opened&first_page_size=20 

>
>> Disabling rc6 fixes this. Until the root cause is found this is a pragmatic
>> workaround.
> The way to do this is to add your own local struct pci_device_id array
> somewhere, and use pci_match_id() or similar on it.
>
> We're *not* going to change the high level device info or PCI ID
> definitions for this.
OK, can do it in v2, was mislead here by the INTEL_QUANTA_VGA_DEVICE which also 
depends on specific sub-ids so thought it is ok to add also very specific 
entries here.
>
> Ugly stuff needs to be localized and hidden away.

I probably do it somewhere around the where the HAS_RC6 macro is called? Sadly 
that's not a function so can't directly integrate it easily.

Best regards,

Werner

>
>
> BR,
> Jani.
>
>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/gpu/drm/i915/i915_pci.c | 11 +++++++++++
>>   include/drm/intel/pciids.h      | 22 ++++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> index 2f03f95945f1b..a52b56bedcf4f 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -687,6 +687,16 @@ static const struct intel_device_info adl_p_info = {
>>   	.dma_mask_size = 39,
>>   };
>>   
>> +static const struct intel_device_info adl_p_tux_ibp8_quirk_info = {
>> +	GEN12_FEATURES,
>> +	PLATFORM(INTEL_ALDERLAKE_P),
>> +	.platform_engine_mask =
>> +		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
>> +	.__runtime.ppgtt_size = 48,
>> +	.dma_mask_size = 39,
>> +	.has_rc6 = 0,
>> +};
>> +
>>   #undef GEN
>>   
>>   #define XE_HP_PAGE_SIZES \
>> @@ -863,6 +873,7 @@ static const struct pci_device_id pciidlist[] = {
>>   	INTEL_DG1_IDS(INTEL_VGA_DEVICE, &dg1_info),
>>   	INTEL_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_info),
>>   	INTEL_RPLU_IDS(INTEL_VGA_DEVICE, &adl_p_info),
>> +	INTEL_RPLP_TUX_IBP8_QUIRK_IDS(INTEL_VGA_DEVICE, &adl_p_tux_ibp8_quirk_info),
>>   	INTEL_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_info),
>>   	INTEL_DG2_IDS(INTEL_VGA_DEVICE, &dg2_info),
>>   	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
>> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> index 7a4a5658942d2..e4f74916a62c2 100644
>> --- a/include/drm/intel/pciids.h
>> +++ b/include/drm/intel/pciids.h
>> @@ -712,6 +712,28 @@
>>   	MACRO__(0xA7AC, ## __VA_ARGS__), \
>>   	MACRO__(0xA7AD, ## __VA_ARGS__)
>>   
>> +#define INTEL_RPLP_TUX_IBP8_QUIRK_IDS(MACRO__, ...) \
>> +	MACRO__##_SUB(0xA720, 0x1D05, 0x124A, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA720, 0x1D05, 0x124C, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA720, 0x1D05, 0x124E, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA720, 0x1D05, 0x130F, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124A, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124C, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124E, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A0, 0x1D05, 0x130F, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124A, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124C, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124E, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7A8, 0x1D05, 0x130F, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124A, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124C, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124E, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AA, 0x1D05, 0x130F, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124A, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124C, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124E, ## __VA_ARGS__), \
>> +	MACRO__##_SUB(0xA7AB, 0x1D05, 0x130F, ## __VA_ARGS__)
>> +
>>   /* RPL-P */
>>   #define INTEL_RPLP_IDS(MACRO__, ...) \
>>   	MACRO__(0xA720, ## __VA_ARGS__), \
