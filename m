Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE964DF4AB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399357; cv=none; b=u3voKlzEL7IPSCAiNprt/KtqE9ZvkqGdZUGFSt1HjxfDL4cVTCnRiURsSt+Jgt3Z2S55sSRtDkvjUmn3rwcPFWyiI7qXsTx2APkabnd9wALOiLRmVdbUAvf9cBJhyDRknxFArUmOt1bT2/nJrPVb5ssmf+aoRCw4nA2rmvGM7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399357; c=relaxed/simple;
	bh=vLInWXHZzviqWQ27RVDsMpzKgdnAlGLLXXLkOY3TKo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrH1CKih5DY36BUZFVBmt+cVPvFqViA/WOzxc5LzenkKYVhscb2yJactHQlJqFko7qTN7XvPmu0SgwUcIf4kBSwl6p7Ndsqh3vTB95w/XVvA8SCQkuQwaFYiVM4AtKqh70hdsNP+ulbK+/mDNHQTmqCMDFpdJVnyeZV6HQj3sHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=altX+R5z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ITY/mnL0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="altX+R5z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ITY/mnL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791399354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdJ0yl4Y7a517Zh171Ufd/qnh/YUt3oPd6EQX5MGSs8=;
	b=altX+R5zRmw21/v48Ll169i3W9HAe7ZMPHQRYRBMJaPmSUf1HrMUpte+YAGssTiABP3xpv
	hScm4egdJDbXEA9QOJTDrwkG2D7YnUjPL5OvA8x8yeKP7Ond1whzx+UNpiCa2/5OFIfAWS
	WnR3u2LnMLQZFtsAJh8FGtkT1BTdguc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-IG8qUjJFMSmwm-_kQkNWIg-1; Wed, 07 Oct 2026 14:55:53 -0400
X-MC-Unique: IG8qUjJFMSmwm-_kQkNWIg-1
X-Mimecast-MFC-AGG-ID: IG8qUjJFMSmwm-_kQkNWIg_1791399352
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so33295745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791399352; x=1792004152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdJ0yl4Y7a517Zh171Ufd/qnh/YUt3oPd6EQX5MGSs8=;
        b=ITY/mnL0NA/uMMqi3yzgwJdOtGL4+121sDJ8pFV7RsSL9Or35AXgIizZbgHm79lfn8
         8G9tgffpJCKHy4swaenNpAQ/DdcBDsWjUcpOv2W3hmijmG/5fYcHo5drxNCgy/3/pEDc
         aC0vK7juxbP1gK/264DzokOv+XmW85UjYjCtjlc3yrWw2Fq+IpuV67/LHacS6zgtLF8S
         Vqzli+N08LxUxcAdPkcY078JGS6ThyNE0QTeQlIOT3u9UaDSNt87017b5rsH+6SiVHT2
         gqBD04ypDgqJWeEdr03mwL2L7DyLSQa5ifhypb7+39zIEVh8MsyEEVDgNSzYAqSeYDBx
         uxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791399352; x=1792004152;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdJ0yl4Y7a517Zh171Ufd/qnh/YUt3oPd6EQX5MGSs8=;
        b=O091+t66V4B8y+8e0QmUYi/HHe+lQ/G/sfr0F8TFGKVbdGMMuwvKIYeYN+uA0Q4XMB
         ajYNBt7MyqZ48qbFUv784T2zqGb1cT6/lJqZP/ZvM6/8JV60bJ8lxgUpsGlWUoTFORZV
         TNBa2p7OeMJRQvlutyclNUJoGQHSPZ3ocXHZQe2VEB/p+UB2GecADdtBQkzL+M+KLDhO
         be/BaBLzTdt/81eU7v4YrhgNTJEbo3xFz5cwM1VIiBQRXyXe4oTpVvxbTjgBVt1nOkxL
         n+jF/VF2GwY/C+bFu2On6etEQFu+hhUf8gG5xzffeZnceOGfxoINfJsnZMbjxdb6FwmX
         GZLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrwW+C+x7PEsQmR6ihfL4Z7LnNjQ2byYHe6UTcER1mpTFtVRZ+2sTsbFb88I0je2iJRKXFPgezksDKifI=@vger.kernel.org
X-Gm-Message-State: AFuF++lrMj6bgtWQZiIP4yWSP5293r4YSBPmwr7vqo+y/6lyVMfxPmQQ
	/l2aWGo8Ix/QZ8sn91KSOE4ALXLNJaU8MfBKhHEzwDagZwfj1CgrZ9ozyGB/pyU8TgLAbJ2HCgR
	WC7JC0Y7kCNMjxa9aZG4FV6EFpceAyJUIqRcG4hoiReshoDE64XqyQIT5ANm8SV9RzQ==
X-Gm-Gg: AYBFou1v8weV9Bb7QjAGUjV8NtGNsh0t6C57MhpwnkyLdS5M7YrwNnzfoXLlrTTm68U
	g4LI9p4NnTw/9VxpoMxSXlsZVF/3f9u4PVNXrVmgbmW/W8WsnrFXZiDdDEbrNgxy86kWKN210gt
	a0HormVrPLRJf9VAv8QaYXcECA0WLUyV/9Qvp1jTTl12kLZGApjbHZTQ1U6AK0Aa+STYnGFC6ux
	vDhQAC5gMIR6HpZsQT7vRwlRshl67xFKFGs9t2k6ZAMJY5bx2wxQ/N2DBexAMtNXmkOCFvHYc8A
	UzS/zkTf5e/fEN25m6UmeWsjMzDd1S0eom3GcJ8rAP4fHyE4qu0NdaPAV6y16+BuQWXZLDxc6A=
	=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a180459354mr49839085e9.12.1791399351190;
        Wed, 07 Oct 2026 11:55:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a180459354mr49838785e9.12.1791399350752;
        Wed, 07 Oct 2026 11:55:50 -0700 (PDT)
Received: from [192.168.2.75] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18044c970sm47111245e9.4.2026.10.07.11.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:55:49 -0700 (PDT)
Message-ID: <2a263f32-82a9-42b7-8aeb-8ac51a801fd9@redhat.com>
Date: Wed, 7 Oct 2026 20:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 4/4] dpll: zl3073x: notify sibling pin when shared
 output config changes
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Min Li <min.li@microchip.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
References: <20261006153116.347497-1-ivecera@redhat.com>
 <20261006153116.347497-5-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261006153116.347497-5-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/6/26 5:31 PM, Ivan Vecera wrote:
> Each zl3073x output has a P-pin and an N-pin that share a single HW
> output and, outside N-pin divide mode, share the output's divisor,
> clock type, esync period/width and phase compensation registers.
> Changing one of these settings through one pin's dpll_pin therefore
> also changes the other (sibling) pin's effective configuration, but
> only the pin the change was requested on gets a dpll_pin_change_ntf()
> notification - userspace listening on the sibling pin is never told
> its frequency, esync configuration or phase adjustment changed.
> 
> This was found by code inspection rather than triggered at runtime: a
> dpll pin-get on the sibling pin returns the correct current values, but
> because no change notification is emitted for it, userspace is never
> told that its configuration changed asynchronously through the other
> pin.
> 
> Add zl3073x_dpll_output_pin_sibling_get() to look up the other pin of
> an output pair, and use it in frequency_set() (for the non-N-divided
> signal formats, where the output divisor is shared), esync_set() and
> phase_adjust_set() to notify the sibling pin, if it is registered,
> whenever the shared HW state actually changes.
> 
> The three callbacks are switched from guard(mutex) to explicit
> mutex_lock()/mutex_unlock() with goto-based unwinding, because the
> notification must run after zldpll->lock is released: the notification
> re-enters the pin get callbacks, which take zldpll->lock again, so
> calling it under the lock would deadlock. The DPLL subsystem's own
> dpll_lock is still held across the callback, so the __ (lock-held)
> notification variant is used.
> 
> The sibling lookup walks the zldpll->pins list, so the list membership
> has to match the DPLL registration state. dpll_pin_register() publishes
> a pin (and P is registered before N) before it used to be added to the
> list, and teardown detached the whole list before unregistering any
> pin, so a sibling that is registered - and thus reachable by a PIN_SET
> on the other pin - could be missing from the list and never notified.
> Add the pin to the list before dpll_pin_register() and remove it only
> after dpll_pin_unregister(), both under zldpll->lock, and assert the
> lock in the lookup helper. A pin that is transiently on the list while
> not registered is harmless: __dpll_pin_change_ntf() is a no-op for a
> pin that is not available, and the sibling cannot be freed under the
> lookup because the freeing goes through dpll_pin_unregister(), which
> takes dpll_lock that the notification path holds.
> 
> Fixes: 634ca2cb06d2 ("dpll: zl3073x: Add support to get/set esync on pins")
> Fixes: ce26d7ca50a5 ("dpll: zl3073x: Add support to get/set frequency on pins")
> Fixes: 6287262f761e ("dpll: zl3073x: Add support to adjust phase")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 187 ++++++++++++++++++++++++++++--------
>   1 file changed, 146 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 65107b4cc4f8..9c678acc3e77 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -123,6 +123,8 @@ zl3073x_dpll_pin_get_by_ref(struct zl3073x_dpll *zldpll, u8 ref_id)
>   {
>   	struct zl3073x_dpll_pin *pin;
>   
> +	lockdep_assert_held(&zldpll->lock);
> +
>   	list_for_each_entry(pin, &zldpll->pins, list) {
>   		if (zl3073x_dpll_is_input_pin(pin) &&
>   		    zl3073x_input_pin_ref_get(pin->id) == ref_id)
> @@ -132,11 +134,39 @@ zl3073x_dpll_pin_get_by_ref(struct zl3073x_dpll *zldpll, u8 ref_id)
>   	return NULL;
>   }
>   
> +/**
> + * zl3073x_dpll_output_pin_sibling_get - get the other pin of an output pair
> + * @pin: output pin whose sibling is sought
> + *
> + * Output pin ids are allocated in P/N pairs (P even, N odd) that share a
> + * single HW output. Looks up the other pin of the pair, if it is
> + * registered as a dpll_pin on this DPLL.
> + *
> + * Return: pointer to sibling pin, or NULL if it is not registered
> + */
> +static struct zl3073x_dpll_pin *
> +zl3073x_dpll_output_pin_sibling_get(struct zl3073x_dpll_pin *pin)
> +{
> +	struct zl3073x_dpll_pin *sibling;
> +
> +	lockdep_assert_held(&pin->dpll->lock);
> +
> +	list_for_each_entry(sibling, &pin->dpll->pins, list) {
> +		if (!zl3073x_dpll_is_input_pin(sibling) &&
> +		    sibling->id == (pin->id ^ 1))
> +			return sibling;
> +	}
> +
> +	return NULL;
> +}
> +
>   static struct zl3073x_dpll_pin *
>   zl3073x_dpll_nco_pin_get(struct zl3073x_dpll *zldpll)
>   {
>   	struct zl3073x_dpll_pin *pin;
>   
> +	lockdep_assert_held(&zldpll->lock);
> +
>   	list_for_each_entry(pin, &zldpll->pins, list) {
>   		if (zl3073x_dpll_is_nco_pin(pin))
>   			return pin;
> @@ -899,12 +929,14 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dpll *zldpll = dpll_priv;
>   	struct zl3073x_dev *zldev = zldpll->dev;
>   	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct zl3073x_dpll_pin *sibling = NULL;
>   	const struct zl3073x_synth *synth;
>   	struct zl3073x_out out;
>   	u32 synth_freq;
>   	u8 out_id;
> +	int rc;
>   
> -	guard(mutex)(&zldpll->lock);
> +	mutex_lock(&zldpll->lock);
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = *zl3073x_out_state_get(zldev, out_id);
> @@ -913,12 +945,14 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	 * for N-division is also used for the esync divider so both cannot
>   	 * be used.
>   	 */
> -	if (zl3073x_out_is_ndiv(&out))
> -		return -EOPNOTSUPP;
> +	if (zl3073x_out_is_ndiv(&out)) {
> +		rc = -EOPNOTSUPP;
> +		goto unlock;
> +	}
>   
>   	if (!freq) {
>   		zl3073x_out_esync_disable(&out);
> -		return zl3073x_out_state_set(zldev, out_id, &out);
> +		goto commit;
>   	}
>   
>   	/* Get attached synth frequency */
> @@ -927,9 +961,24 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   
>   	/* Enable 1PPS eSync for this pin frequency */
>   	zl3073x_out_esync_enable(&out, synth_freq / out.div);
> -
> +commit:
>   	/* Commit output configuration */
> -	return zl3073x_out_state_set(zldev, out_id, &out);
> +	rc = zl3073x_out_state_set(zldev, out_id, &out);
> +	if (rc)
> +		goto unlock;
> +
> +	/* The clock type, esync period and esync width are all shared by
> +	 * both pins of the output pair, so the sibling pin's esync
> +	 * configuration changes too and userspace has to be notified.
> +	 */
> +	sibling = zl3073x_dpll_output_pin_sibling_get(pin);
> +unlock:
> +	mutex_unlock(&zldpll->lock);
> +
> +	if (!rc && sibling)
> +		__dpll_pin_change_ntf(sibling->dpll_pin);
> +
> +	return rc;
>   }
>   
>   static int
> @@ -959,12 +1008,14 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dpll *zldpll = dpll_priv;
>   	struct zl3073x_dev *zldev = zldpll->dev;
>   	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct zl3073x_dpll_pin *sibling = NULL;
>   	const struct zl3073x_synth *synth;
>   	u32 new_div, synth_freq;
>   	struct zl3073x_out out;
>   	u8 out_id;
> +	int rc;
>   
> -	guard(mutex)(&zldpll->lock);
> +	mutex_lock(&zldpll->lock);
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = *zl3073x_out_state_get(zldev, out_id);
> @@ -977,7 +1028,8 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   	/* Check signal format */
>   	if (!zl3073x_out_is_ndiv(&out)) {
>   		/* For non N-divided signal formats the frequency is computed
> -		 * as division of synth frequency and output divisor.
> +		 * as division of synth frequency and output divisor, which
> +		 * is shared by both pins of the output pair.
>   		 */
>   		out.div = new_div;
>   
> @@ -1002,7 +1054,16 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   		}
>   
>   		/* Commit output configuration */
> -		return zl3073x_out_state_set(zldev, out_id, &out);
> +		rc = zl3073x_out_state_set(zldev, out_id, &out);
> +		if (rc)
> +			goto unlock;
> +
> +		/* The other pin's frequency changed too - it has to be
> +		 * notified about the change.
> +		 */
> +		sibling = zl3073x_dpll_output_pin_sibling_get(pin);
> +
> +		goto unlock;
>   	}
>   
>   	if (zl3073x_dpll_is_p_pin(pin)) {
> @@ -1017,18 +1078,10 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   		u32 rem;
>   
>   		out.esync_n_period = div_u64_rem(prod, new_div, &rem);
> -		if (rem != 0) {
> -			NL_SET_ERR_MSG_FMT(extack,
> -					   "OUT%uN freq must divide OUT%uP freq",
> -					   out_id, out_id);
> -			return -EINVAL;
> -		}
> -		if (out.esync_n_period < 2) {
> -			NL_SET_ERR_MSG_FMT(extack,
> -					   "OUT%uN freq must be less than OUT%uP freq",
> -					   out_id, out_id);
> -			return -EINVAL;
> -		}
> +		if (rem != 0)
> +			goto err_n_nondiv;
> +		if (out.esync_n_period < 2)
> +			goto err_n_toohigh;
>   
>   		/* Update the output divisor */
>   		out.div = new_div;
> @@ -1046,25 +1099,36 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   		u64 rem, prod = frequency * out.div;
>   
>   		out.esync_n_period = div64_u64_rem(synth_freq, prod, &rem);
> -		if (rem != 0) {
> -			NL_SET_ERR_MSG_FMT(extack,
> -					   "OUT%uN freq must divide OUT%uP freq",
> -					   out_id, out_id);
> -			return -EINVAL;
> -		}
> -		if (out.esync_n_period < 2) {
> -			NL_SET_ERR_MSG_FMT(extack,
> -					   "OUT%uN freq must be less than OUT%uP freq",
> -					   out_id, out_id);
> -			return -EINVAL;
> -		}
> +		if (rem != 0)
> +			goto err_n_nondiv;
> +		if (out.esync_n_period < 2)
> +			goto err_n_toohigh;
>   	}
>   
>   	/* For 50/50 duty cycle the divisor is equal to width */
>   	out.esync_n_width = out.esync_n_period;
>   
>   	/* Commit output configuration */
> -	return zl3073x_out_state_set(zldev, out_id, &out);
> +	rc = zl3073x_out_state_set(zldev, out_id, &out);
> +unlock:
> +	mutex_unlock(&zldpll->lock);
> +
> +	if (!rc && sibling)
> +		__dpll_pin_change_ntf(sibling->dpll_pin);
> +
> +	return rc;
> +err_n_nondiv:
> +	NL_SET_ERR_MSG_FMT(extack,
> +			   "OUT%uN freq must divide OUT%uP freq",
> +			   out_id, out_id);
> +	rc = -EINVAL;
> +	goto unlock;
> +err_n_toohigh:
> +	NL_SET_ERR_MSG_FMT(extack,
> +			   "OUT%uN freq must be less than OUT%uP freq",
> +			   out_id, out_id);
> +	rc = -EINVAL;
> +	goto unlock;
>   }
>   
>   static int
> @@ -1103,10 +1167,12 @@ zl3073x_dpll_output_pin_phase_adjust_set(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dpll *zldpll = dpll_priv;
>   	struct zl3073x_dev *zldev = zldpll->dev;
>   	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct zl3073x_dpll_pin *sibling = NULL;
>   	struct zl3073x_out out;
>   	u8 out_id;
> +	int rc;
>   
> -	guard(mutex)(&zldpll->lock);
> +	mutex_lock(&zldpll->lock);
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = *zl3073x_out_state_get(zldev, out_id);
> @@ -1115,7 +1181,21 @@ zl3073x_dpll_output_pin_phase_adjust_set(const struct dpll_pin *dpll_pin,
>   	out.phase_comp = phase_adjust / pin->phase_gran;
>   
>   	/* Update output configuration from mailbox */
> -	return zl3073x_out_state_set(zldev, out_id, &out);
> +	rc = zl3073x_out_state_set(zldev, out_id, &out);
> +	if (rc)
> +		goto unlock;
> +
> +	/* The phase compensation register is shared by both pins of the
> +	 * output pair, so the sibling pin's phase adjustment changes too.
> +	 */
> +	sibling = zl3073x_dpll_output_pin_sibling_get(pin);
> +unlock:
> +	mutex_unlock(&zldpll->lock);
> +
> +	if (!rc && sibling)
> +		__dpll_pin_change_ntf(sibling->dpll_pin);
> +
> +	return rc;
>   }
>   
>   static int
> @@ -1739,6 +1819,13 @@ zl3073x_dpll_pin_register(struct zl3073x_dpll_pin *pin, u32 index)
>   	else
>   		ops = &zl3073x_dpll_output_pin_ops;
>   
> +	/* Add the pin to the list before registering it with the DPLL core so
> +	 * that it is findable as a sibling as soon as the core publishes it.
> +	 */
> +	mutex_lock(&zldpll->lock);
> +	list_add(&pin->list, &zldpll->pins);
> +	mutex_unlock(&zldpll->lock);
> +
>   	/* Register the pin */
>   	rc = dpll_pin_register(zldpll->dpll_dev, pin->dpll_pin, ops, pin);
>   	if (rc)
> @@ -1750,6 +1837,9 @@ zl3073x_dpll_pin_register(struct zl3073x_dpll_pin *pin, u32 index)
>   	return 0;
>   
>   err_register:
> +	mutex_lock(&zldpll->lock);
> +	list_del(&pin->list);
> +	mutex_unlock(&zldpll->lock);
>   	dpll_pin_put(pin->dpll_pin, &pin->tracker);
>   err_pin_get:
>   	pin->dpll_pin = NULL;
> @@ -1784,6 +1874,13 @@ zl3073x_dpll_pin_unregister(struct zl3073x_dpll_pin *pin)
>   	/* Unregister the pin */
>   	dpll_pin_unregister(zldpll->dpll_dev, pin->dpll_pin, ops, pin);
>   
> +	/* Remove the pin from the list only after it has been unregistered so
> +	 * that a still-registered pin is always findable as a sibling.
> +	 */
> +	mutex_lock(&zldpll->lock);
> +	list_del(&pin->list);
> +	mutex_unlock(&zldpll->lock);
> +
>   	dpll_pin_put(pin->dpll_pin, &pin->tracker);
>   	pin->dpll_pin = NULL;
>   
> @@ -1803,9 +1900,11 @@ zl3073x_dpll_pins_unregister(struct zl3073x_dpll *zldpll)
>   {
>   	struct zl3073x_dpll_pin *pin, *next;
>   
> +	/* Unregister each pin before removing it from the list so that a
> +	 * still-registered pin is always findable as a sibling.
> +	 */
>   	list_for_each_entry_safe(pin, next, &zldpll->pins, list) {
>   		zl3073x_dpll_pin_unregister(pin);
> -		list_del(&pin->list);
>   		zl3073x_dpll_pin_free(pin);
>   	}
>   }
> @@ -1918,16 +2017,24 @@ zl3073x_dpll_nco_pin_register(struct zl3073x_dpll *zldpll)
>   		goto err_pin_get;
>   	}
>   
> +	/* Add the pin to the list before registering it with the DPLL core so
> +	 * that the list reflects the DPLL registration state.
> +	 */
> +	mutex_lock(&zldpll->lock);
> +	list_add(&pin->list, &zldpll->pins);
> +	mutex_unlock(&zldpll->lock);
> +
>   	rc = dpll_pin_register(zldpll->dpll_dev, pin->dpll_pin,
>   			       &zl3073x_dpll_nco_pin_ops, pin);
>   	if (rc)
>   		goto err_register;
>   
> -	list_add(&pin->list, &zldpll->pins);
> -
>   	return 0;
>   
>   err_register:
> +	mutex_lock(&zldpll->lock);
> +	list_del(&pin->list);
> +	mutex_unlock(&zldpll->lock);
>   	dpll_pin_put(pin->dpll_pin, &pin->tracker);
>   err_pin_get:
>   	pin->dpll_pin = NULL;
> @@ -1979,8 +2086,6 @@ zl3073x_dpll_pins_register(struct zl3073x_dpll *zldpll)
>   			zl3073x_dpll_pin_free(pin);
>   			goto error;
>   		}
> -
> -		list_add(&pin->list, &zldpll->pins);
>   	}
>   
>   	/* Register NCO virtual input pin */

Reviewed-by: Petr Oros <poros@redhat.com>

