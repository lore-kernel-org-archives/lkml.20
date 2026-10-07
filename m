Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0449D59E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379088; cv=none; b=TXO8afrl06FHJ7fCC6Q00PEfSHS4Xqalj+eUu1+2cOiNXZeRxzQPDGVueVhXHZlmLQuzVc6Nq3fuiREQ38tXN1domnKR8mWPJVRZOLF9nyWB6bDAPiEuLW5AIxy28h/hKdYzqXIud3BU1rzcQYj31db7Yc3JgXBIczk5bNKybx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379088; c=relaxed/simple;
	bh=92/uFDsHI72vKyFUud/pW5U13nGqE7CWMLZbCsNwxrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rf5j2s1vUoeJ7XJqiSUZrO07Am/JblEJJaLi+gB2ooIncqxYLtkDvz7bIZ4QFG6n8EOtvWLHjf5Cel9Z+4jGm9ZS2IcBxb2B5Rd4lCtFF+faP0xgcuiIQwWnQeAiFH7KrjSceYe8QAWBN6YFSisvuOQw8pOq6DYhXh29RzUmveo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRuyVewC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bjAa+rJW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRuyVewC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bjAa+rJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791379075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oBOZq9RtKAbT/TMUl/7ikCCKk20Q3D1Efbu3QClthQ=;
	b=iRuyVewCm9td9yznc07eogRjBB5yecyaYmh767e8w8qTicdsFXgYH4PVwtkWVFD3NL/CxR
	OM6HcS06HN67kWkcBoe40jH18Fa4WHnndjAVL6n707y8XkMb/Mjh2ltD821GOpkau34uq/
	5sbFypVGh5ush6YeJ//Rh1wSWFRkebo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-icMVUJFgPiOcKy_II4aaaw-1; Wed, 07 Oct 2026 09:17:54 -0400
X-MC-Unique: icMVUJFgPiOcKy_II4aaaw-1
X-Mimecast-MFC-AGG-ID: icMVUJFgPiOcKy_II4aaaw_1791379073
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso15158685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791379073; x=1791983873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oBOZq9RtKAbT/TMUl/7ikCCKk20Q3D1Efbu3QClthQ=;
        b=bjAa+rJWe/FxoKAnbSSJGiEAO5Li6fMhZ3g019WZcUpzYL7TILKdorn+Xo2MdUqzda
         druHocvsxN0FpNtzq0Cd5T/zcXm8KIL1QLb9gVAKCbpifo2ToWxMO3pQhjhfsXKRMz5Q
         Jx0IJZVChyhCjzrIdqeLoVzD10iuufKLlcBiKKQj3arFhxpqSphcouvpEv+VeAmxYAdw
         u56SEGbPhJXWLFahdIaW5EntzYgeKIWJ3Vpzc7we5RRBrVAGrWHXcs6WnRZ/IySv+oR+
         MH1xGeY28jPQES5t+OA4q16ehbYLfTr0eJXeJq6eh6bKdWYn3t51v13X+HvA0iuu02wW
         cwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379073; x=1791983873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oBOZq9RtKAbT/TMUl/7ikCCKk20Q3D1Efbu3QClthQ=;
        b=X2ZVSzJiMqtWoya184HzrZJJiSohbxjKZAU3c6fFoS0FlYkaXltjOSzB+H6+h00oK8
         GArUq//4JNrsnoyeX/k81QFh0iZSchN8RpBdden3nmWyCW3K10vuFZESUwVIW5s+Nzm0
         U1o+R7pfoIDalAJCHG9XiNubyKnIhdb+3775jRLQavTJqSSqIHll/0tSt/Al5NMh2aqS
         19XF3Q46NwB8DK8M+A8QdL6k9ZA2F9BMxzRsRhXaT2GWN0UWyaYVvPtj7azCOUwyJphA
         KMDUbRLP9y1BWt+ckyoA5qrQ/rie58vfGBaHBLHknMY7PL/whaiON0bXlmf/y2PSFd05
         0/ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwKGx+OGjew+DoF+F/HRTh9qVAsOO6VskHLZ64uG/pXJDqX7w+ziEJaHYla3mVkfBC+1BQufyFmQEptfcM=@vger.kernel.org
X-Gm-Message-State: AFuF++lkm0CwUZ1An+jOeGhpJNh4JcP3qxx636Wujc4ziuObt5cJP+/H
	4jAfHLey3lpXjCteqAhruvxgjWhmzMBnkg7HSnMQveY9TxcYzYlQwimtBYGl71dyYrBdqQwKxuh
	4mzoJG0XsFNrwj1Vw5cvZ5unDg8R1e6RgzmLSqmiyIY3lSPEWIxodZfKij5On9/N4vg==
X-Gm-Gg: AYBFou2fXj3cr1ew/t1n30c8vDaZAPa+BZheWKu1wcx6L3kUCTX9wTsLYkxBRBgLqRD
	6HibpVhfQvuJmrqeshIBJmQXYKf5Ys1zT2MvEw7KlA6hckz0x4m2kGaOZCG2iaukOt8PfkOfHDV
	WfS8Vf4scofBxQ/HMaMCXzxDQCTp08jtlRJ5fJZBypy6xgts3ods8v4tbbSwYvRLKe4Lv2VD1zA
	PjfcAtT3QWKapQAwBlfQrKXD1o1KKCylNGKAK4iNoOfVgMWVZmU8x1es4CMkESKeXgceuL26bW4
	FmhFfBg1M5R6KFqX26FN2aMWyjhv/IqQcMtd7bFbIt8LGfTSfZjyy4FEhWh0MSbV9JwbfTglNeg
	o7XcG8DMJiOORb4AYkFypy9NGsQNVpDN1Gb4wNFoQnQq/8p6X
X-Received: by 2002:a05:600c:5646:b0:49d:2589:d8e9 with SMTP id 5b1f17b1804b1-4a178a25222mr80542055e9.11.1791379073023;
        Wed, 07 Oct 2026 06:17:53 -0700 (PDT)
X-Received: by 2002:a05:600c:5646:b0:49d:2589:d8e9 with SMTP id 5b1f17b1804b1-4a178a25222mr80541655e9.11.1791379072603;
        Wed, 07 Oct 2026 06:17:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm5378202f8f.8.2026.10.07.06.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:17:51 -0700 (PDT)
Message-ID: <24ad6178-2f3b-4f84-91b5-c1f4fb92a21b@redhat.com>
Date: Wed, 7 Oct 2026 15:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: allow overriding panic QR code URL
To: Nahida Buer <me@nahida.im>
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20261002203140.121165-1-me@nahida.im>
 <20261002222021.149450-1-me@nahida.im>
 <c4da60aa-bbbb-4afa-bd86-6516d14f5809@redhat.com>
 <CAEEzyciisJgZgx4PZQbEEkUUKRMpiAsmmsW9JfQzwCCDx4xZKA@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAEEzyciisJgZgx4PZQbEEkUUKRMpiAsmmsW9JfQzwCCDx4xZKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/26 01:03, Nahida Buer wrote:
> Thanks for the review.
> 
> My motivation was slightly different from disabling the URL when the
> configured endpoint is untrusted or unavailable. I wanted to keep the
> URL QR mode while allowing the same kernel image to use a different
> reporting endpoint depending on the deployment.
> 
> It also allows enabling the compressed URL mode without rebuilding the
> kernel. With an empty CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL, the QR code
> contains the raw kmsg. Supplying drm.panic_qr_url= at boot instead
> switches it to the URL format, where the kmsg is compressed with zlib.
> 
> This could be useful for a distribution or a locally built kernel image
> used on multiple systems: the image can keep a neutral/default
> configuration, while individual systems can opt into a specific panic
> report collector and compressed QR payload at boot time.
> 
> panic_screen=user or panic_screen=kmsg only disables the URL QR mode;
> it does not provide a way to keep that mode while changing or enabling
> the reporting endpoint.
> 
> The parameter is read-only after initialization, so it only selects the
> endpoint at boot/module load time.
> 
> If keeping the URL fixed at build time is intentional policy for DRM
> panic, though, I'm fine with dropping the patch.

After thinking more about this, I prefer to keep the URL fixed at build 
time.
I hope it won't refrain you from contributing again.

Best regards,

-- 

Jocelyn
> 
> Jocelyn Falempe <jfalempe@redhat.com> 于2026年10月3日周六 06:56写道：
>>
>> On 10/3/26 00:20, 纳西妲 · Nahida wrote:
>>> The base URL used for the panic QR code is currently fixed at build time
>>> by CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL. Changing the panic report
>>> endpoint therefore requires rebuilding the kernel.
>>>
>>> Add a drm.panic_qr_url module parameter to allow overriding the URL at
>>> boot or module load time, while keeping the Kconfig value as the
>>> default.
>>>
>>> Keep the parameter read-only after initialization so the panic path can
>>> access it without additional synchronization.
>>>
>>> Expose the configured URL to the DRM panic helper through an internal
>>> getter so the helper can use the runtime value when generating the QR
>>> code.
>>
>> The code looks good, but I think it shouldn't be allowed to change this
>> setting at boot time.
>> You can already set the drm_panic screen to "user" or "kmsg" in the
>> kernel command line if you don't trust the default URL, or if the URL is
>> no more reachable.
>> It introduces some complexity, and I don't really see the benefit.
>>
>> Best regards,
>>
>> --
>>
>> Jocelyn>
>>> Assisted-by: LLM
>>> Signed-off-by: 纳西妲 · Nahida <me@nahida.im>
>>> ---
>>> v2:
>>> - Grow the formatted URL buffer to accommodate the maximum 255-byte
>>>     runtime base URL.
>>> - Reject unexpectedly truncated formatted URLs.
>>> - Test the maximum-length runtime URL.
>>>
>>> v1: https://lore.kernel.org/r/20261002203140.121165-1-me@nahida.im
>>>
>>> Tested on x86_64:
>>> - Full modular build with DRM=m and DRM_KMS_HELPER=m.
>>> - QEMU/virtio-gpu runtime override with a non-empty Kconfig default URL.
>>> - QEMU/virtio-gpu runtime fallback to the Kconfig default URL.
>>> - QEMU/virtio-gpu runtime override with an empty Kconfig default URL.
>>> - QEMU/virtio-gpu raw kmsg QR fallback with no configured URL.
>>> - QEMU/virtio-gpu runtime override with a 255-byte base URL.
>>>
>>>    drivers/gpu/drm/Kconfig              |  9 +++++----
>>>    drivers/gpu/drm/drm_panic.c          |  9 +++++++++
>>>    drivers/gpu/drm/drm_panic_helper.c   | 17 +++++++++++------
>>>    drivers/gpu/drm/drm_panic_internal.h |  4 ++++
>>>    4 files changed, 29 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 61111d50b..3d9d421f0 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -111,10 +111,11 @@ config DRM_PANIC_SCREEN_QR_CODE_URL
>>>        string "Base URL of the QR code in the panic screen"
>>>        depends on DRM_PANIC_SCREEN_QR_CODE
>>>        help
>>> -       This option sets the base URL to report the kernel panic. If it's set
>>> -       the QR code will contain the URL and the kmsg compressed with zlib as
>>> -       a URL parameter. If it's empty, the QR code will contain the kmsg as
>>> -       uncompressed text only.
>>> +       This option sets the default base URL to report the kernel panic. If
>>> +       it's set the QR code will contain the URL and the kmsg compressed with
>>> +       zlib as a URL parameter. If it's empty, the QR code will contain the
>>> +       kmsg as uncompressed text only. It can be overridden with the
>>> +       drm.panic_qr_url=<url> kernel parameter.
>>>          There is a demo code in javascript, to decode and uncompress the kmsg
>>>          data from the URL parameter at https://github.com/kdj0c/panic_report
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>> index 9fe97c4ed..463544f71 100644
>>> --- a/drivers/gpu/drm/drm_panic.c
>>> +++ b/drivers/gpu/drm/drm_panic.c
>>> @@ -49,6 +49,15 @@ MODULE_LICENSE("GPL");
>>>    static uint panic_qr_version = CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
>>>    module_param(panic_qr_version, uint, 0644);
>>>    MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>>> +static char panic_qr_url[256] = CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
>>> +module_param_string(panic_qr_url, panic_qr_url, sizeof(panic_qr_url), 0444);
>>> +MODULE_PARM_DESC(panic_qr_url, "base URL of the QR code in the panic screen");
>>> +
>>> +const char *drm_panic_get_qr_url(void)
>>> +{
>>> +     return panic_qr_url;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_panic_get_qr_url);
>>>    #endif
>>>
>>>    static enum drm_panic_type drm_panic_type = -1;
>>> diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
>>> index 8913c3d22..b0ea0b4e8 100644
>>> --- a/drivers/gpu/drm/drm_panic_helper.c
>>> +++ b/drivers/gpu/drm/drm_panic_helper.c
>>> @@ -609,17 +609,20 @@ static void drm_panic_helper_qr_exit(void)
>>>        stream.workspace = NULL;
>>>    }
>>>
>>> -static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
>>> +static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned int qr_version,
>>> +                                         const char *qr_url)
>>>    {
>>>        struct kmsg_dump_iter iter;
>>> -     char url[256];
>>> +     char url[512];
>>>        size_t kmsg_len, max_kmsg_size;
>>>        char *kmsg;
>>>        int max_qr_data_size, url_len;
>>>
>>>        url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
>>> -                        CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>>> -                        utsname()->machine, utsname()->release);
>>> +                        qr_url, utsname()->machine, utsname()->release);
>>> +
>>> +     if (url_len >= (int)sizeof(url))
>>> +             return -E2BIG;
>>>
>>>        max_qr_data_size = drm_panic_helper_qr_max_data_size(qr_version, url_len);
>>>        max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
>>> @@ -686,8 +689,10 @@ static int drm_panic_helper_get_qr_code_raw(u8 **qr_image, unsigned int qr_versi
>>>
>>>    static int drm_panic_helper_get_qr_code(u8 **qr_image, unsigned int qr_version)
>>>    {
>>> -     if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
>>> -             return drm_panic_helper_get_qr_code_url(qr_image, qr_version);
>>> +     const char *qr_url = drm_panic_get_qr_url();
>>> +
>>> +     if (qr_url[0])
>>> +             return drm_panic_helper_get_qr_code_url(qr_image, qr_version, qr_url);
>>>        else
>>>                return drm_panic_helper_get_qr_code_raw(qr_image, qr_version);
>>>    }
>>> diff --git a/drivers/gpu/drm/drm_panic_internal.h b/drivers/gpu/drm/drm_panic_internal.h
>>> index fe6d514a0..f33552265 100644
>>> --- a/drivers/gpu/drm/drm_panic_internal.h
>>> +++ b/drivers/gpu/drm/drm_panic_internal.h
>>> @@ -14,6 +14,10 @@ struct drm_device;
>>>
>>>    #ifdef CONFIG_DRM_PANIC
>>>
>>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>>> +const char *drm_panic_get_qr_url(void);
>>> +#endif
>>> +
>>>    /**
>>>     * drm_panic_lock - protect panic printing relevant state
>>>     * @dev: struct drm_device
>>>
>>> base-commit: 54e61ea6c492d69a1717018826d8340810c812eb
>>
> 

