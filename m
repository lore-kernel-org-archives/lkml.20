Received: from 11.mo550.mail-out.ovh.net (11.mo550.mail-out.ovh.net [188.165.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21D3F12CB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.48.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415971; cv=none; b=mud8bi+8Uyug8L4EhvaWhRdHTvO2ir78EsJOQocvtLzMJym8ld53dm7ndrXbRmRVJjtlLzOgS4Jp15hNInMXjGKeN9eLHqrLc/ZohiIAnGpWz9TTXDizZ6x2IgD+CyhYil7Q+WeRj8jJdfo6FBDAmjdeQpPNBtzQG3BjMEkWUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415971; c=relaxed/simple;
	bh=bdvXEbBL3I1sNOLHWPY/aSM89wN1Y+K0iABTg5JXtwQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aACG9mPmEPWpbdG2A2i/c5f/nFAAjGUls/I26uTQ4PSoJi2nTQf6oTMJR2QIqP9ghnUTyiinspaU0KkqCP/6KTbMMwiJ8xkwwWfGHXNYRaCSVuBUuWNNQsDCGtnesFw4hBWWcLvgOBa76eF7n+obgrxtxkN7NJmzTuXi25pWqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=medichon.fr; spf=pass smtp.mailfrom=medichon.fr; dkim=pass (2048-bit key) header.d=medichon.fr header.i=@medichon.fr header.b=B+hYzMvG; arc=none smtp.client-ip=188.165.48.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=medichon.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=medichon.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=medichon.fr header.i=@medichon.fr header.b="B+hYzMvG"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.0.202])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4j7SVs5yBKz5xCB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:54:29 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-w2p87 (unknown [10.108.42.201])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A6EAAC3DDE;
	Mon, 19 Oct 2026 07:54:27 +0000 (UTC)
Received: from medichon.fr ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-w2p87 with ESMTPSA
	id VzFGHbPM1Wq57gYAh9bqlA
	(envelope-from <abo@medichon.fr>); Mon, 19 Oct 2026 07:54:27 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S003e25b5ac9-02cb-4e08-a646-4f4adac193de,
                    E22553FEB6AEB75B33DDF2A505A99149E93FA69D) smtp.auth=abo@medichon.fr
X-OVh-ClientIp:88.190.90.129
Message-ID: <fd9c0bbe-6e0c-486a-ad23-ea99935a28ce@medichon.fr>
Date: Mon, 19 Oct 2026 09:54:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud Bonnet <abo@medichon.fr>
Subject: Re: [PATCH v2] drm/amd/display: remove unused cgs register accessor
 typedefs
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, paulmck@kernel.org, rostedt@goodmis.org, ast@kernel.org,
 peterz@infradead.org, gregkh@linuxfoundation.org, skhan@linuxfoundation.org
References: <981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com>
 <20261017130047.42080-1-emmaonana18@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20261017130047.42080-1-emmaonana18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 14750696155911184108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEC+pQARFvnW2RMvD9rJWwoSB5KeWL1zCtrex0rqKpMGM/5SWjDLMgrr+9PpUdSees96VENuuMOCUpYmiYcW4lsBEkE8EniYAkM9m3Rnj8NjyA7soRhfPa0JBImFi7NB5lrqN4GOn1OQwSMzJvMp/9HxrvZR/Jb9vXM8njCWKzRcxewl6oiGGkofXbt5b77yqFsXqJC/pfsOjBXhKcNlvZ34D4oJxjsKydJEd4U2ZpzrE8t8cjzAQRXQORBS6UbXMhaDk40DNY01DQUxTDRzULvuVsXfia3e2pEGnhcagdyPqNu0q+OuN+fRPDRf2RlEuRMQ9iiqoYkLWaeFtR3yiWkSHUbXRaeeDPMNSRtSuEszKuLXwwsdzIjz/D1fYkL0DfXUpIV8H3zGrOKw5XtT92eRUZGjky5RbK57JNxKN4dX+qftN4vnVDd0o3T/zbmGfE031JMKXljPSEzQGrbTO+CKaYP47a6fGP771zjgVHmQypY0cAfSr3Xq38a6J9oOe0bLOuutyVzhpPlvW19RpExa2VMwNCWWv0c3q59HzRXgCF82ABDYGIhxJffHgCgVivg7JXcdIG2TxKsjRR4Ili9WH0D2RGKUmkm7aEdzTf8AmtxbMs4fH38Ui05r/e1d5MtMgnEx7Ycp8nzNSvBd+hs19ABgHafQBL5WDKamaV7pA
DKIM-Signature: a=rsa-sha256; bh=gTmA+d0ikT+8IflEYztNYyZ9CNFtEwNKlyOUdD5euEE=;
 c=relaxed/relaxed; d=medichon.fr; h=From; s=ovhmo3801317-selector1;
 t=1792396469; v=1;
 b=B+hYzMvGsktzDQBt/pNR8ValM6WDtLcrVZBp+oS8gGUsmhCcBFjET0AEs2OdImj4P8Rc23cu
 B/AWcPmrZQ2CLRUhKlYlNvzv7RjeKaeolzV8tOuPdbklh11T49D1RwtGiFzoTvnhLJi8zccW1lc
 ZGpVHSFaTeabF8sP2Yn5CMX1aKdB4hctX/QaL4rh6MIAga5W6D60La1QHje6cPn389oBv+8mkOa
 OOYcbGCiWkesQi0A60vkbQTFr7gH4ejNL22jqA6B+F9+Q6TcURB4O9Ty0puDFO5Asy/BfxlDxUV
 GeBsc1Sbva22FxaS98dhgSPFCGkfFgiXu0cGfNgN7ctaw==

On 10/17/26 3:00 PM, Omokefe Emmanuel Onanaroghene wrote:
> kernel-doc reports prototype mismatches for the cgs register accessor
> typedefs, e.g.:
> 
>   drivers/gpu/drm/amd/include/cgs_common.h:89: expecting prototype
>   for cgs_read_register(). Prototype was for uint32_t() instead
> 
> Each of the four typedefs is used exactly once, as
> the type of a struct cgs_ops member, so they are merely an
> unnecessary layer of indirection. Drop the typedefs along with their
> kernel-doc comments and write the function pointer types directly in
> struct cgs_ops.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Link: https://lore.kernel.org/all/981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com/
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/cgs_common.h | 60 +++++++-----------------
>  1 file changed, 18 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.h
> index f40b6a03fe63..1750401c7d08 100644
> --- a/drivers/gpu/drm/amd/include/cgs_common.h
> +++ b/drivers/gpu/drm/amd/include/cgs_common.h
> @@ -80,43 +80,6 @@ struct cgs_firmware_info {
>  
>  typedef unsigned long cgs_handle_t;
>  
> -/**
> - * cgs_read_register() - Read an MMIO register
> - * @cgs_device:	opaque device handle
> - * @offset:	register offset
> - *
> - * Return:  register value
> - */
> -typedef uint32_t (*cgs_read_register_t)(struct cgs_device *cgs_device, unsigned offset);
> -
> -/**
> - * cgs_write_register() - Write an MMIO register
> - * @cgs_device:	opaque device handle
> - * @offset:	register offset
> - * @value:	register value
> - */
> -typedef void (*cgs_write_register_t)(struct cgs_device *cgs_device, unsigned offset,
> -				     uint32_t value);
> -
> -/**
> - * cgs_read_ind_register() - Read an indirect register
> - * @cgs_device:	opaque device handle
> - * @offset:	register offset
> - *
> - * Return:  register value
> - */
> -typedef uint32_t (*cgs_read_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
> -					    unsigned index);
> -
> -/**
> - * cgs_write_ind_register() - Write an indirect register
> - * @cgs_device:	opaque device handle
> - * @offset:	register offset
> - * @value:	register value
> - */
> -typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
> -					 unsigned index, uint32_t value);
> -
>  #define CGS_REG_FIELD_SHIFT(reg, field) reg##__##field##__SHIFT
>  #define CGS_REG_FIELD_MASK(reg, field) reg##__##field##_MASK
>  
> @@ -137,14 +100,27 @@ typedef int (*cgs_get_firmware_info)(struct cgs_device *cgs_device,
>  				     enum cgs_ucode_id type,
>  				     struct cgs_firmware_info *info);

Hi Omokefe, you probably forgot
-typedef unsigned long cgs_handle_t;
-typedef int (*cgs_get_firmware_info)(struct cgs_device *cgs_device,
-                                    enum cgs_ucode_id type,
-                                    struct cgs_firmware_info *info);

As discussed I have built and ran some IGT on hardware for the versions
with and without these two, so you can still use the tag if you send v3:

Tested-by: Arnaud Bonnet <abo@medichon.fr>

>  
> +/**
> + * struct cgs_ops - Common Graphics Services operations
> + * @read_register: read register value
> + * @write_register: write register value
> + * @read_ind_register: read indirect register value
> + * @write_ind_register: write indirect register value
> + * @get_firmware_info: get firmware information
> + */
>  struct cgs_ops {
>  	/* MMIO access */
> -	cgs_read_register_t read_register;
> -	cgs_write_register_t write_register;
> -	cgs_read_ind_register_t read_ind_register;
> -	cgs_write_ind_register_t write_ind_register;
> +	uint32_t (*read_register)(struct cgs_device *cgs_device, unsigned int offset);
> +	void (*write_register)(struct cgs_device *cgs_device, unsigned int offset,
> +			       uint32_t value);
> +	uint32_t (*read_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
> +				      unsigned int index);
> +	void (*write_ind_register)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
> +				   unsigned int index, uint32_t value);
>  	/* Firmware Info */
> -	cgs_get_firmware_info get_firmware_info;
> +	int (*get_firmware_info)(struct cgs_device *cgs_device,
> +				 enum cgs_ucode_id type,
> +				 struct cgs_firmware_info *info);
>  };
>  
>  struct cgs_os_ops; /* To be define in OS-specific CGS header */

