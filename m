Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F393B14B3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831868; cv=none; b=SeCjHk7QYoOG6e/YVJWqrli1YzXHRDL4Um9GKqjv//Xy0J+TsePKtluOgsBq2BT81BS0FRvLojAWh3RBqwl3PYaJPi+phxcvQXkC92yVXjJb1TfNDlKqCVFmpFWjS5RMEjxaYJvHFiBLm3N6Xlw3waA1WLyVtC+47UbOQ8dhRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831868; c=relaxed/simple;
	bh=ZUEzwYxVU/SPymFaEzQukivD6XPxHAuMDmWh+UmC77k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+bkppc9mmxI+eWtb+n43tS5c5fVwoG/2tFHg4k54CPjG6v/iIAW9E1CwULzVwcpV/ghee12f/ZocjMDcrYE2YcbfJyJ69N8HpAurEgBViS5S0TvDFkgEMAev60Lol3/nhNYgDqgAgZmmiOfRhCX4O6TqkFJMs6D8JUEsJhvQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hz2mPt2v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EF1CAatA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hz2mPt2v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EF1CAatA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787831865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7HpnvAo/5rchYSAkV+wWSi6+4eRJ80plY8raMVgf7q8=;
	b=hz2mPt2vMJNH5AWC4wq5JXWuJki5w7f24H2yS++dXOpKV3HjMbYCkBPdZug8IvxHkoHUbL
	8hsCs5h5xgxUqCEZmKiUjsUFvzBt3H5Tg4y87g1O6Mnx4i5SNofCZbfaXOwQEmIqh9mK15
	4dXb5ei9iKTXin0olNny/UCTjWwGtzs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-C2xnKooYMa64cAQe-aSeXw-1; Thu, 27 Aug 2026 07:57:44 -0400
X-MC-Unique: C2xnKooYMa64cAQe-aSeXw-1
X-Mimecast-MFC-AGG-ID: C2xnKooYMa64cAQe-aSeXw_1787831863
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c213d5fb55aso230978366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787831863; x=1788436663; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HpnvAo/5rchYSAkV+wWSi6+4eRJ80plY8raMVgf7q8=;
        b=EF1CAatAHBnufzumR9ClUr0+rzvGH229MeV4RmRG1l6Mk6CrMXLFexMit75Q05lLNR
         C8eULdCt9DcuGedASTaGjV9vjqofLkKnasTPzBGK0+K7luqzv00KOdpuwX6HqdI7hqhX
         cBOf5kZQ3a/ckqxiPtJDN/2CZlGF7CiSYx1O5sv3ZEEjodCvSo20EMfcmcPR2SMtYNMp
         yY0owAiscl7V4Tye3vLtbWF0mMQHnXaugFsUcefOpZR1jomyti3kl51tLgxvYESDxVWV
         NhWD55vHgDq09ygcueOrigBQRNhkmLQVUqk72iHT09AXGxpGwO+4ZbQ93OGChP13hbgA
         HzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831863; x=1788436663;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7HpnvAo/5rchYSAkV+wWSi6+4eRJ80plY8raMVgf7q8=;
        b=e6vQQnVoVLkwbz7HSchv5N9P+hrfV8xmo38kzX9ah23FLn88NPlVRrB5kr2hhxma9C
         QnMabArYZCMleqG0EKkVcNiVddphoEq45hg5plf85HCeOhrASCT6dnmCIaL9AMD7Oipa
         3tck/4j0Wo96EoQtHaVkDEHA2EB2gR9i8cF70FatEIz6SdZp4RIaGtHIt+pPsTt/OlBu
         XnmKBS7bHe+i8LBO5UtzcZD6Q+jH4wnDfGZZvwzTbZpVHG6MlcKJnsbQmtGfdxxPw91e
         6g6QLq8ny58e1h4G/KemUmmkPCTXyhsM05P9/UzqZ5yxrREL7npRxFNyXTRuDoEvM7WI
         EL2g==
X-Forwarded-Encrypted: i=1; AHgh+RpCZIj3nCy6aWxMoCEdxi0HxRD8crqcaoPRxmnTJ0uLpPUx3cHStOzbpMQcjLLAuXKxkxk+TybrGuFjYoc=@vger.kernel.org
X-Gm-Message-State: AFuF++l4YSRFL4/qh1ER8Wg2f/kd0Y0F9Ua7jLizz8QCF12sgsfptAzJ
	om60z8J/ndrAbaPcP5Jf6RAhiP8KV5WxVIlMydRtIq/kIeEZs1LCN5/OBe3ntZBmA2HtsrPXvmo
	yqlcm9GgSOOM1/MEGWfxwUEpXohcC9sRbTxeXWUFXo5kttoqDCl/TO5h+ggoL+4fO0A==
X-Gm-Gg: AR+sD12Ap+RYJUS3H8+5kDeJhi/R9pgKaWHXH+1ui3IAQGNZTBr4aZP3Sf/tHKpZhl+
	B0Ad5SfPuKZ8SYSr+zmZRrfHHdTm52SU6rNNoq/CQIz1BoDkVv/xuLnPEPltaZUjpFOUUzK9XiO
	iNe15wgHBU8vidivdKxzwU2mfXdC7IUDvc0R/e3WF+JqPFYCGGQrXl4XnRoo89/2dqT0XnTqkUE
	BJEhBzh+wbpg2qeTlp5gt9jqCk2zT9lPkbMT6MvxkMspQbhhX8FbjgogEs08hF5l+XiWe5abvck
	ckf3HMvEby9r2DnvDPx2tQGpgbSGEQwo7jEWX/eNky6/cs8fv+HkH0ZOehrVZ9Cu1uU3dcaw3vq
	k4NVUWH/Na/nSrKO3ankXkuTLLW4bOLp9M/NDIRWEloPA3icRgMJx6I+3gsNklaSvCPwCeQ==
X-Received: by 2002:a17:907:6d1a:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c250c4b3348mr1308156366b.9.1787831862790;
        Thu, 27 Aug 2026 04:57:42 -0700 (PDT)
X-Received: by 2002:a17:907:6d1a:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c250c4b3348mr1308152766b.9.1787831862331;
        Thu, 27 Aug 2026 04:57:42 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm651105666b.24.2026.08.27.04.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:57:41 -0700 (PDT)
Message-ID: <989570aacd3e23acd67a25178a00dc6ed6f2b522.camel@redhat.com>
Subject: Re: [PATCH v6 1/9] rv: Introduce DA_MON_ALLOCATION_STRATEGY
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 13:57:39 +0200
In-Reply-To: <30a9acb1cd8a634aed04b28701ff29837ec2f124.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <30a9acb1cd8a634aed04b28701ff29837ec2f124.1787243842.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>
> +#define DA_ALLOC_AUTO=C2=A0=C2=A0 0
> +#define DA_ALLOC_POOL=C2=A0=C2=A0 1
> +#define DA_ALLOC_MANUAL 2
> +
> +#ifdef DA_MON_POOL_SIZE
> +#ifdef DA_MON_ALLOCATION_STRATEGY

That's correct, but technically it wouldn't be wrong to also define
DA_ALLOC_POOL. We could do:

  #if defined(DA_MON_ALLOCATION_STRATEGY) && DA_MON_ALLOCATION_STRATEGY !=
=3D DA_ALLOC_POOL
  #error "DA_MON_POOL_SIZE implies DA_ALLOC_POOL"
  #endif

Then the next define shouldn't be an issue because the preprocessor
doesn't complain on multiple /equivalent/ definitions.

No big deal if you prefer it like this though.

> +#error "Define only one of DA_MON_POOL_SIZE or DA_MON_ALLOCATION_STRATEG=
Y"
> +#endif
> +#if DA_MON_POOL_SIZE =3D=3D 0
> +#error "DA_MON_POOL_SIZE must be non-zero"
> +#endif
> +#define DA_MON_ALLOCATION_STRATEGY DA_ALLOC_POOL
> +#endif /* DA_MON_POOL_SIZE */
> +
> +#ifndef DA_MON_ALLOCATION_STRATEGY
> +#ifdef DA_SKIP_AUTO_ALLOC

Right, I told you not to touch nomiss, but there's no need to maintain
DA_SKIP_AUTO_ALLOC, we can have the monitor do

  #define DA_MON_ALLOCATION_STRATEGY DA_ALLOC_MANUAL

(without any other change), so we can simplify the logic.

...
> +/*
> + * Per-object teardown hook, called after da_monitor_reset_all() +
> + * da_monitor_sync_hook() and before hash_del_rcu() for each entry.
> + * All HA timer callbacks have completed at this point.
> + * Define before including this header.=C2=A0 Default: no-op.
> + */
> +#ifndef da_extra_cleanup
> +#define da_extra_cleanup(da_mon)
> +#endif

da_extra_cleanup() doesn't belong in this patch, does it?
You could have a separate patch for this.

...
> +/*
> + * da_create_pool_storage - pop a free pool slot and insert it into the =
hash.
> + *
> + * Returns the new da_monitor, or NULL if the pool is exhausted.=C2=A0 F=
inding
> + * an existing entry for the same id fires WARN_ON_ONCE (double-start bu=
g).
> + *
> + * Caller must hold an RCU read-side CS and the monitor's serialisation =
lock.
> + */
> +static inline struct da_monitor *
> +da_create_pool_storage(da_id_type id, monitor_target target,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct da_monitor *da_mon)
> +{
> +	struct da_monitor_storage *mon_storage, *existing;
> +
> +	if (da_mon)
> +		return da_mon;
> +
> +	mon_storage =3D mempool_alloc_preallocated(&da_monitor_pool);
> +	if (!mon_storage)
> +		return NULL;
> +	memset(mon_storage, 0, sizeof(*mon_storage));
> +
> +	mon_storage->id =3D id;
> +	mon_storage->target =3D target;
> +
> +	/* Single consumer under the caller's lock; duplicate is a double-
> start bug. */
> +	existing =3D __da_get_mon_storage(id);
> +	if (WARN_ON_ONCE(existing)) {
> +		mempool_free(mon_storage, &da_monitor_pool);
> +		return NULL;
> +	}

Isn't this check for existing redundant? da_prepare_storage() is always
called after a da_get_monitor(), so the first check for da_mon is in
fact validating that we do not already have this entry.

It doesn't return NULL because the entire machine doesn't expect two
different targets with the same id. This doesn't seem to be expected in
your case either (you WARN), so I think you can easily drop this check.

> +	hash_add_rcu(da_monitor_ht, &mon_storage->node, id);
> +	return &mon_storage->rv.da_mon;
> +}
> +
...
> @@ -607,21 +723,37 @@ static inline void da_monitor_destroy(void)
> =C2=A0	 * pending, we can safely assume no concurrent user.
> =C2=A0	 */
> =C2=A0	hash_for_each_safe(da_monitor_ht, bkt, tmp, mon_storage, node) {
> +		da_extra_cleanup(&mon_storage->rv.da_mon);

This one line belongs to another patch, see the comment about
da_extra_cleanup() above.

> =C2=A0		hash_del_rcu(&mon_storage->node);
> -		kfree(mon_storage);
> +		if (DA_MON_ALLOCATION_STRATEGY =3D=3D DA_ALLOC_POOL)
> +			mempool_free(mon_storage, &da_monitor_pool);
> +		else
> +			kfree(mon_storage);
> +	}
> +
> +	if (DA_MON_ALLOCATION_STRATEGY =3D=3D DA_ALLOC_POOL) {
> +		rcu_barrier();
> +		mempool_exit(&da_monitor_pool);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> =C2=A0/*
> - * Allow the per-object monitors to run allocation manually, necessary i=
f the
> - * start condition is in a context problematic for allocation (e.g.
> scheduling).
> - * In such case, if the storage was pre-allocated without a target, set =
it
> now.
> + * da_prepare_storage - allocate or link per-object monitor storage.
> + *
> + * Called only from da_handle_start_run_event(); must run in task contex=
t

Also from da_handle_start_event(), you could use
da_handle_start*_event() in the comment or even better say "only when the
monitor is started for the first time", because we still call
da_handle_start_event() and friends when the monitor is running on
models where the start event can occur again, but obviously do not
reallocate (that's what the check for da_mon was for).

> + * for DA_ALLOC_AUTO and DA_ALLOC_POOL (both take a spinlock_t internall=
y).
> + * Subsequent event handlers use da_handle_event() and never allocate.
> =C2=A0 */
> -#ifdef DA_SKIP_AUTO_ALLOC
> -#define da_prepare_storage da_fill_empty_storage
> -#else
> -#define da_prepare_storage da_create_storage
> -#endif /* DA_SKIP_AUTO_ALLOC */
> +static inline struct da_monitor *
> +da_prepare_storage(da_id_type id, monitor_target target,
> +		=C2=A0=C2=A0 struct da_monitor *da_mon)
> +{
> +	if (DA_MON_ALLOCATION_STRATEGY =3D=3D DA_ALLOC_POOL)
> +		return da_create_pool_storage(id, target, da_mon);
> +	if (DA_MON_ALLOCATION_STRATEGY =3D=3D DA_ALLOC_MANUAL)
> +		return da_fill_empty_storage(id, target, da_mon);
> +	return da_create_storage(id, target, da_mon);
> +}

The rest of the implementation looks good.

Thanks,
Gabriele

