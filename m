Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776203EF0DC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790981778; cv=none; b=Oy+0Qvb9hDd0kKklTHWkfbhoQvY/GbX3gKbUqs8ivZZpzXh+Tqv92PEbHbB4fSucPtatE5YLzu2AjCfiCpNt1A17nM/yIRQt42Sifr7+2NygI39zg6yoI3fIytyXrY4OVDQVBQH3KROKDlkpjiYh9EPPwrqMNwLEaTI02NHunYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790981778; c=relaxed/simple;
	bh=D8olf2LgdWF57bP9PPzyhwoujB3uOLxtLLN6SUFyQYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQBwmytjrRELcRxd3j3PQgER+e3J+Br0JbPKG3tqvbEhHNLLwfS0b0tbaFzU4Z/hYFzXS77OAXfqwlkgih9q51WaMWAO+9AQgvYqIRvd/3GrGloX0pYyCNJMjqwZ6TP96k0CqDBl5+EAR5xORjnrinlVKsMs2rCt252NQUmPBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SaiUoV8q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7y/EmA0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SaiUoV8q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7y/EmA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790981775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4KaS7H/G0FD4CdLsqlWhJOk1fNCdgivOOJSC4dxjc4=;
	b=SaiUoV8qcCSioLCK3cJe7bKtTDuiwG/Rc9D7PT8Of+5hz711X4SBlRRpNESGENv81qtlL0
	rJmeyWGFVNyL3vdlrt3c5ublOGaafYQnfNrROK1lFR48rFMr3gYG0AAJ9O0fgHVL28Xp8P
	3tRaT5DZyP4LDzNaF3RouAUlxxcOK6A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-n9wMHA4fNB-DJPGfSs7GLA-1; Fri, 02 Oct 2026 18:56:14 -0400
X-MC-Unique: n9wMHA4fNB-DJPGfSs7GLA-1
X-Mimecast-MFC-AGG-ID: n9wMHA4fNB-DJPGfSs7GLA_1790981773
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4887782ab2dso236234f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790981773; x=1791586573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4KaS7H/G0FD4CdLsqlWhJOk1fNCdgivOOJSC4dxjc4=;
        b=f7y/EmA0N19GQdjK6pBRLm4OO7LcSEAeWFYlE5Z19LmvhzasIjYlgpsqfndw3I0vzR
         f0kUu4F4v9bRIX/HGFJc5TECGPKT1zMDkfA+mhUDGBxPs3KbqV86LZGGw4vIqHdmtwRE
         1l19p9APw/o0Xp0Ipw5VoEHIuCX6yfHxiiPB3dEIHl2n9Jf0qVT2PRRyszfi4yEPWLof
         ESgdKRnF1WyLzUQlp2NEPGAPgTQAMN/boWkZuVpTdskTxInb/Dcf1SM/zJKdVsJbB6gT
         YtdNlKbz8MM27L0GlffecNytOSasOXXCpaOLa6PxjlSZogLzNmoOolWw/y5uKwRZFXuP
         scmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790981773; x=1791586573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4KaS7H/G0FD4CdLsqlWhJOk1fNCdgivOOJSC4dxjc4=;
        b=V9D/MXixYwHo69nZtKzeQVMxRMAZKMCKR3SxBuxMHCP4b63RHj7nDjFHtS/+xSzETL
         1uC59hn6gyrb1gikM5891uMS3nnWwojPK1brpxeHBBMPMgIAhcrwcOOZxT5bAUcpfmgB
         TWUDe5T3Lv3I/wVgDuTHqKfIRecHRtwDo5e7mg1fQiffvDOaHDGO2GgPaR5qalIubpv+
         1bBOutl59pQuaGFMjtSXjqhpfYHRUdxfyvPBWR5GQ9TQEjqoECxdnFqdKpiepY1YbvKQ
         4quU1zX4cqUJN1SuHZuw+t87l3S3eg5PZ80KOkCwqTNxI44qSdmkywIavsApL7petW/P
         IhOA==
X-Forwarded-Encrypted: i=1; AKwUvByojUybCMT37E0OedaiHKjXIwOm99sw/mbRE8vXBpxSTp0ugYknYBuUyf50NIz3d6eUdCzej6IXCig05Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+zVHtR1O8E/OmewU5zC1Ej8kHoLAN3UnwERMm3ySXMPm4VrWc
	km1QFrzqwZsI6hGZgUrcGMZSiM+cFnUxjnwW/KnG7GaN5nkUioAFY9Tf9hwPQhxaGBGbo/Cim4V
	hAa9E3LXgOri0Bw9ewCuYKdClLQtnLsno8pbcJ804hruU7hDUHFOScPInJ+wxIajSTw==
X-Gm-Gg: AYBFou3SEPPXRww9rplGFRqevf4nr1Vja8Jc+Od7YBYNFw8ZY0Qd/kaHfd6mZwzK+lh
	h5nqr/zLAkyVAYgRP5t6trNWILz0bCWdiG4mvnau3GtiWWv432Y0Y6w6qxo3FAhV68KVS+Q/OhV
	3S6EsU05aX4W5Rn7eJ7Et+aYLAp+4LTq6/13xY3A9HtxoLcrHQKGn4rq93TZwgrFCqw0vOKotKH
	X1bFaXHr83QlCv6uHcnsFMTMsYAkgDVdOBwyVjs+hKQAcEZZpCV2MkmsOy5VLCRNRVZkBxlKNwA
	pm5DG98ptbWI92rRoEIPUuulcZAvng46Ip3Sjue6mZ+o6tH9ALxuYipUekaHi98JzbFWbdSnFuN
	04/UVuOfmWpqE1N7hjNW7jH+ZncG5VPxtDgOmITPnz+qM0kg=
X-Received: by 2002:a05:6000:a84:b0:48a:f454:3d4 with SMTP id ffacd0b85a97d-48b12747166mr5488930f8f.53.1790981772846;
        Fri, 02 Oct 2026 15:56:12 -0700 (PDT)
X-Received: by 2002:a05:6000:a84:b0:48a:f454:3d4 with SMTP id ffacd0b85a97d-48b12747166mr5488923f8f.53.1790981772535;
        Fri, 02 Oct 2026 15:56:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm7845823f8f.0.2026.10.02.15.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 15:56:11 -0700 (PDT)
Message-ID: <c4da60aa-bbbb-4afa-bd86-6516d14f5809@redhat.com>
Date: Sat, 3 Oct 2026 00:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: allow overriding panic QR code URL
To: =?UTF-8?B?57qz6KW/5aayIMK3IE5haGlkYQ==?= <me@nahida.im>,
 dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20261002203140.121165-1-me@nahida.im>
 <20261002222021.149450-1-me@nahida.im>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261002222021.149450-1-me@nahida.im>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/26 00:20, 纳西妲 · Nahida wrote:
> The base URL used for the panic QR code is currently fixed at build time
> by CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL. Changing the panic report
> endpoint therefore requires rebuilding the kernel.
> 
> Add a drm.panic_qr_url module parameter to allow overriding the URL at
> boot or module load time, while keeping the Kconfig value as the
> default.
> 
> Keep the parameter read-only after initialization so the panic path can
> access it without additional synchronization.
> 
> Expose the configured URL to the DRM panic helper through an internal
> getter so the helper can use the runtime value when generating the QR
> code.

The code looks good, but I think it shouldn't be allowed to change this 
setting at boot time.
You can already set the drm_panic screen to "user" or "kmsg" in the 
kernel command line if you don't trust the default URL, or if the URL is 
no more reachable.
It introduces some complexity, and I don't really see the benefit.

Best regards,

-- 

Jocelyn>
> Assisted-by: LLM
> Signed-off-by: 纳西妲 · Nahida <me@nahida.im>
> ---
> v2:
> - Grow the formatted URL buffer to accommodate the maximum 255-byte
>    runtime base URL.
> - Reject unexpectedly truncated formatted URLs.
> - Test the maximum-length runtime URL.
> 
> v1: https://lore.kernel.org/r/20261002203140.121165-1-me@nahida.im
> 
> Tested on x86_64:
> - Full modular build with DRM=m and DRM_KMS_HELPER=m.
> - QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL.
> - QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
> - QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
> - QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.
> - QEMU/virtio-gpu runtime override with a 255-byte base URL.
> 
>   drivers/gpu/drm/Kconfig              |  9 +++++----
>   drivers/gpu/drm/drm_panic.c          |  9 +++++++++
>   drivers/gpu/drm/drm_panic_helper.c   | 17 +++++++++++------
>   drivers/gpu/drm/drm_panic_internal.h |  4 ++++
>   4 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 61111d50b..3d9d421f0 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -111,10 +111,11 @@ config DRM_PANIC_SCREEN_QR_CODE_URL
>   	string "Base URL of the QR code in the panic screen"
>   	depends on DRM_PANIC_SCREEN_QR_CODE
>   	help
> -	  This option sets the base URL to report the kernel panic. If it's set
> -	  the QR code will contain the URL and the kmsg compressed with zlib as
> -	  a URL parameter. If it's empty, the QR code will contain the kmsg as
> -	  uncompressed text only.
> +	  This option sets the default base URL to report the kernel panic. If
> +	  it's set the QR code will contain the URL and the kmsg compressed with
> +	  zlib as a URL parameter. If it's empty, the QR code will contain the
> +	  kmsg as uncompressed text only. It can be overridden with the
> +	  drm.panic_qr_url=<url> kernel parameter.
>   	  There is a demo code in javascript, to decode and uncompress the kmsg
>   	  data from the URL parameter at https://github.com/kdj0c/panic_report
>   
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 9fe97c4ed..463544f71 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -49,6 +49,15 @@ MODULE_LICENSE("GPL");
>   static uint panic_qr_version = CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
>   module_param(panic_qr_version, uint, 0644);
>   MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
> +static char panic_qr_url[256] = CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
> +module_param_string(panic_qr_url, panic_qr_url, sizeof(panic_qr_url), 0444);
> +MODULE_PARM_DESC(panic_qr_url, "base URL of the QR code in the panic screen");
> +
> +const char *drm_panic_get_qr_url(void)
> +{
> +	return panic_qr_url;
> +}
> +EXPORT_SYMBOL_GPL(drm_panic_get_qr_url);
>   #endif
>   
>   static enum drm_panic_type drm_panic_type = -1;
> diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
> index 8913c3d22..b0ea0b4e8 100644
> --- a/drivers/gpu/drm/drm_panic_helper.c
> +++ b/drivers/gpu/drm/drm_panic_helper.c
> @@ -609,17 +609,20 @@ static void drm_panic_helper_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
> +static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version,
> +					    const char *qr_url)
>   {
>   	struct kmsg_dump_iter iter;
> -	char url[256];
> +	char url[512];
>   	size_t kmsg_len, max_kmsg_size;
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
>   	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> -			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
> -			   utsname()->machine, utsname()->release);
> +			   qr_url, utsname()->machine, utsname()->release);
> +
> +	if (url_len >= (int)sizeof(url))
> +		return -E2BIG;
>   
>   	max_qr_data_size = drm_panic_helper_qr_max_data_size(qr_version, url_len);
>   	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
> @@ -686,8 +689,10 @@ static int drm_panic_helper_get_qr_code_raw(u8 **qr_image, unsigned int qr_versi
>   
>   static int drm_panic_helper_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   {
> -	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
> -		return drm_panic_helper_get_qr_code_url(qr_image, qr_version);
> +	const char *qr_url = drm_panic_get_qr_url();
> +
> +	if (qr_url[0])
> +		return drm_panic_helper_get_qr_code_url(qr_image, qr_version, qr_url);
>   	else
>   		return drm_panic_helper_get_qr_code_raw(qr_image, qr_version);
>   }
> diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm_panic_internal.h
> index fe6d514a0..f33552265 100644
> --- a/drivers/gpu/drm/drm_panic_internal.h
> +++ b/drivers/gpu/drm/drm_panic_internal.h
> @@ -14,6 +14,10 @@ struct drm_device;
>   
>   #ifdef CONFIG_DRM_PANIC
>   
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +const char *drm_panic_get_qr_url(void);
> +#endif
> +
>   /**
>    * drm_panic_lock - protect panic printing relevant state
>    * @dev: struct drm_device
> 
> base-commit: 54e61ea6c492d69a1717018826d8340810c812eb

