Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008647;
	b=lFp3R/O+ePfKHrZxhJoHVo0z6ZzdLKzBE+YkvqYzVorlSLmOzPNRHPSX9RJIcULeOfwW
	 m2M20DGBJpiod5a9q+1EXyFmJez4AEXbYkRtu6g/dN1NoofR/d48ihQJI0dUlnrHrT7ks
	 h/nBRIwVdHaqnxego2WnwEZp4tnj1cEqE+DKDfzk5Kg1iuHdVMQljOjOJ9EJOfzRaeKzr
	 WB2lpsFqW+BxYozaDVOTX75QouLLYbjf0j/uxEGZYVmKbMAA1/VVMOP3ArDBukXTv64AT
	 u2puYslsaMWHswfYOabnQqQyvxwFg4em364os/D6utst1I/hvzWu5nB7jv7OPuD6Zrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008647;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0cP7bHbkVnJIoWQHM/hNh1+7ETLTN+9A+Z6R6C59Ogw=;
	b=DI11aYv93jJPujlBShFN8CN3Ow8nXGCfY/UR+KPUALTDHN5C6JysUhQKo1Oa/JDk/uWy
	 DgeRBq/e80xrsitAuPybrXwNDyFbWq2dBRZu8I8mcVq7xreFEDVN0LN7FGYmpY3kT2GwC
	 x0M/5Q3u3avrPOzkXx8J29ihQ5NZePDILZgbRLarCtpUZibaiDz4cE0kpVI5NwK1+0Sjp
	 V4sqEt+V0FdTCd0TRb6LW8teuMzjRGC0xPvPRqB9Ws4ucdHLvvFpyni5IGGlU7qzvbABA
	 dQhEw/Y76hw4Xx18+WC/EX1vj5PIGq6ziBchV32kFMGU9WbHSjJsKCpMAZi7FMTglNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K0Tm7NMJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xn4yIoym;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DCB606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K0Tm7NMJ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xn4yIoym
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793008645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0cP7bHbkVnJIoWQHM/hNh1+7ETLTN+9A+Z6R6C59Ogw=;
	b=K0Tm7NMJXHx2j8CGHbWzF32hy5l8fGE47XEzKjih5iCAIE2R2TM+ZYnfAvEOMv2km7kFHs
	+1AL2l7h6rYMauJFubaFQT0hcKmucB3JWbbdwC2XSX07+hKwM0K0vEm5pgMgdEOvRRfSAZ
	BhFajd+Ep+XmWf/isBiHJAWfCgfCNbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-FZp26eL_NcueMeeDRDBIBg-1; Mon, 26 Oct 2026 05:57:23 -0400
X-MC-Unique: FZp26eL_NcueMeeDRDBIBg-1
X-Mimecast-MFC-AGG-ID: FZp26eL_NcueMeeDRDBIBg_1793008643
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df5b058ddso1918604f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793008642; x=1793613442; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cP7bHbkVnJIoWQHM/hNh1+7ETLTN+9A+Z6R6C59Ogw=;
        b=Xn4yIoym/OOq57Gy8fYWXKAW7x2l+x07KBukI98Ul/zz/X3ac+NHu9RSP9BnaShtlD
         BoTFUad4QDPOD8FB6J6USxWfp9zAF44xICmvJQ0JVzf2dXauwxQXiNbhPXhTNS86rWL7
         /Mpobuy8RcsOOX/0ywuKv3UG+AH0JTcEv/NVvab7H1YJyiFtEMY+e5qq4j1Y15qyWVOg
         ttVv0t6iwLibqz1DCRmAzErav92JeRHakBm5Re2jYtFxEK3OKAxUz1GsfordJlPirCWs
         MV6HgOK/5o94tKPT9SBogZJ46KkUOLzkBD0G6MjYSoqd2k34fntU94bM45EfT4cu1xwG
         LYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008642; x=1793613442;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0cP7bHbkVnJIoWQHM/hNh1+7ETLTN+9A+Z6R6C59Ogw=;
        b=03LfZjTMfpthvO1gxl55ywVS0pKqeuuFsE3WvVFJo9skrtuAR35T1fuXg3VlRaxoLW
         KgyW249+Qf90xWos3VCp9KKkdn81PQMU5KOhMKru2wMUruLSEMeRahlYwV3zDJD71dbd
         7N4h6+2E6pEBcxcHDenFNKkMYau1gzpni60EEt0jJONG4Sa7YlGVu3cpyJo1U5eJXm4P
         13XzaadrCVVPRFd4ZAgCFv9JjU1STltUFdAEh9h6ZBnmJ1whNtAhmvSSBDXYS0ErCfQk
         M7kC/N+SB2JYEQ85aLwIDAePB+ECOc/mMLK78h2lz819HZv6a4bu47a0sFmv4WwnpY3a
         NAAQ==
X-Forwarded-Encrypted: i=1; AKwUvByL8scVITA7Ni+BCh9ydtUqVYm9JR2KqvafkWjoMiD4SO/jJ78kbsEo79qquQ4n+i4gwPuhq3SOahg5f9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu3sfKKpnlt1EfqGxVw01e4s2WHACDg40+eVCHNX9+z0ZxlEE3
	yHIGvzz6pTwIkWVtqQPyTLemS2QdVm58G7IDhOVCQYzyIMu9Oslh4xHHW5Gh+jZ2Bqw8w1Dl8rz
	4/eU2zSrbfDGEmAMUghcGdJp/g5zNYf8PFeXgR8VyBK8WDRe1wkNhp/X8DaymLGAm2Q==
X-Gm-Gg: AYBFou05vBXD5iF4v7I6NZxJS0OCwak2rBvMeL9eKb4jk0hHKTw7rHnA2JQldGQFjD0
	569H5RwwhSzUNeznxkKdjkazoy/wnT86yegj8FDaSg93wtPWDPByFB/a62HG2qLp+RScrxE4OD1
	0Gq9v9SYRK/uv6aCwblC8UpWrjM/8PoXxA3yn91iEKe8AdmNaU0/K0cHzsmknXxxHh2WuFisQMV
	pIkhkSq2FnaLhQVFxqyDb+lcS/EGzmYRirkZ8WfQ4DPG0wEWCuc/bNFoBBNw3cVaZHud4ACTPgP
	0XnMrDT/iBTphzEtPEqMj2Erq+WZqzsMuMdVxpTrAY1QjoEVC39WxUl+IPW2Pb4mxHWMn96blfA
	uqveRQOgK2iebfiXyv7971ZtK9CmF
X-Received: by 2002:a5d:43ce:0:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48e3eb9fdfcmr8414745f8f.43.1793008642479;
        Mon, 26 Oct 2026 02:57:22 -0700 (PDT)
X-Received: by 2002:a5d:43ce:0:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48e3eb9fdfcmr8414708f8f.43.1793008642046;
        Mon, 26 Oct 2026 02:57:22 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm15843421f8f.57.2026.10.26.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:20 -0700 (PDT)
Message-ID: <a0d96dd77c308dc558da93b13dcc024518f58c2c.camel@redhat.com>
Subject: Re: [PATCH v7 04/14] rv: Disarm HA timers on the storage free path
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 10:57:19 +0100
In-Reply-To: <3d5a8a567f1c1921f725c31a780845ff23e5abb9.1791745088.git.wen.yang@linux.dev>
References: <cover.1791745088.git.wen.yang@linux.dev>
	 <3d5a8a567f1c1921f725c31a780845ff23e5abb9.1791745088.git.wen.yang@linux.dev>
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
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-12 at 03:39 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> da_destroy_storage() cancels the HA timer through da_monitor_reset_hook()
> and only then unlinks the storage with hash_del_rcu().=C2=A0 A handler on
> another CPU that looked the storage up before the unlink can still call
> ha_start_timer_*() after the cancel.=C2=A0 The timer then stays queued on=
 a
> storage that kfree_rcu() frees a grace period later, and fires on freed
> memory, reporting a violation for an object that no longer exists.
>=20
> A monitor cannot close this from its own handlers: any cancel it issues
> precedes the unlink.=C2=A0 The first point no reader can race with is the
> RCU callback that frees the storage.

Mmh, looks reasonable, I probably need to check this whole cleanup path aga=
in
for consistency and duplication.

>=20
> Add da_monitor_free_hook(), called right before a per-object storage is
> freed, from the RCU callback and from da_monitor_destroy().=C2=A0 HA moni=
tors
> implement it with ha_cancel_timer_sync().=C2=A0 Replace kfree_rcu() with
> call_rcu() so there is a callback to hook.
>=20
> A storage whose monitor never started has a zeroed timer, and
> hrtimer_cancel() dereferences timer->base.=C2=A0 nomiss pre-creates one s=
uch
> storage per possible CPU.=C2=A0 Skip them with the new ha_timer_ready().

I struggled with this too, but relying on the internal representation of ti=
mers
for this is brittle, can you use da_monitoring() there, like we do in
ha_monitor_reset_env()? We shouldn't have running timers when not monitorin=
g.

I still want to give a deeper look at this when I get more time.

Thanks,
Gabriele

>=20
> Fixes: 4a24127bd6cb ("rv: Add support for per-object monitors in DA/HA")
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
> =C2=A0include/rv/da_monitor.h | 23 ++++++++++++++++++++++-
> =C2=A0include/rv/ha_monitor.h | 26 ++++++++++++++++++++++++++
> =C2=A02 files changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index e3cf85c9ce55..2cd260208bc1 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -67,6 +67,17 @@ static struct rv_monitor rv_this;
> =C2=A0#define da_monitor_sync_hook()
> =C2=A0#endif
> =C2=A0
> +/*
> + * Called on the last reference to a storage, right before it is freed.
> + * Monitors embedding a timer disarm it here: an earlier point races wit=
h a
> + * reader that resolved the storage before hash_del_rcu(), and
> + * tracepoint_synchronize_unregister() only covers tracepoint probes.
> + * Default: no-op.
> + */
> +#ifndef da_monitor_free_hook
> +#define da_monitor_free_hook(da_mon)
> +#endif
> +
> =C2=A0/*
> =C2=A0 * Type for the target id, default to int but can be overridden.
> =C2=A0 * A long type can work as hash table key (PER_OBJ) but will be dow=
ngraded to
> @@ -543,6 +554,15 @@ static inline monitor_target
> da_get_target_by_id(da_id_type id)
> =C2=A0	return mon_storage->target;
> =C2=A0}
> =C2=A0
> +static void da_kfree_cb(struct rcu_head *head)
> +{
> +	struct da_monitor_storage *ms =3D
> +		container_of(head, struct da_monitor_storage, rcu);
> +
> +	da_monitor_free_hook(&ms->rv.da_mon);
> +	kfree(ms);
> +}
> +
> =C2=A0/*
> =C2=A0 * da_destroy_storage - destroy the per-object storage
> =C2=A0 *
> @@ -564,7 +584,7 @@ static inline void da_destroy_storage(da_id_type id)
> =C2=A0		return;
> =C2=A0	da_monitor_reset_hook(&mon_storage->rv.da_mon);
> =C2=A0	hash_del_rcu(&mon_storage->node);
> -	kfree_rcu(mon_storage, rcu);
> +	call_rcu(&mon_storage->rcu, da_kfree_cb);
> =C2=A0}
> =C2=A0
> =C2=A0static void __da_monitor_reset_all(void (*reset)(struct da_monitor =
*))
> @@ -607,6 +627,7 @@ static inline void da_monitor_destroy(void)
> =C2=A0	 * pending, we can safely assume no concurrent user.
> =C2=A0	 */
> =C2=A0	hash_for_each_safe(da_monitor_ht, bkt, tmp, mon_storage, node) {
> +		da_monitor_free_hook(&mon_storage->rv.da_mon);
> =C2=A0		hash_del_rcu(&mon_storage->node);
> =C2=A0		kfree(mon_storage);
> =C2=A0	}
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 499ce60779f9..99b60d0d26b6 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -29,6 +29,8 @@ static inline void ha_monitor_reset_env(struct da_monit=
or
> *da_mon);
> =C2=A0static inline void ha_setup_timer(struct ha_monitor *ha_mon);
> =C2=A0static inline bool ha_cancel_timer(struct ha_monitor *ha_mon);
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon);
> +static inline bool ha_timer_ready(struct ha_monitor *ha_mon);
> +static inline void ha_monitor_free_env(struct da_monitor *da_mon);
> =C2=A0static bool ha_monitor_handle_constraint(struct da_monitor *da_mon,
> =C2=A0					 enum states curr_state,
> =C2=A0					 enum events event,
> @@ -38,6 +40,7 @@ static bool ha_monitor_handle_constraint(struct da_moni=
tor
> *da_mon,
> =C2=A0#define da_monitor_init_hook ha_monitor_init_env
> =C2=A0#define da_monitor_reset_hook ha_monitor_reset_env
> =C2=A0#define da_monitor_sync_hook() synchronize_rcu()
> +#define da_monitor_free_hook ha_monitor_free_env
> =C2=A0
> =C2=A0#if !defined(HA_SKIP_AUTO_CLEANUP) && RV_MON_TYPE =3D=3D RV_MON_PER=
_TASK
> =C2=A0/*
> @@ -467,8 +470,15 @@ static inline bool ha_cancel_timer(struct ha_monitor
> *ha_mon)
> =C2=A0{
> =C2=A0	return timer_delete(&ha_mon->timer);
> =C2=A0}
> +/* timer_setup() sets it; the cancel paths here never clear it. */
> +static inline bool ha_timer_ready(struct ha_monitor *ha_mon)
> +{
> +	return READ_ONCE(ha_mon->timer.function);
> +}
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon)
> =C2=A0{
> +	if (!ha_timer_ready(ha_mon))
> +		return;
> =C2=A0	timer_delete_sync(&ha_mon->timer);
> =C2=A0}
> =C2=A0#elif HA_TIMER_TYPE =3D=3D HA_TIMER_HRTIMER
> @@ -524,8 +534,18 @@ static inline bool ha_cancel_timer(struct ha_monitor
> *ha_mon)
> =C2=A0{
> =C2=A0	return hrtimer_try_to_cancel(&ha_mon->hrtimer) =3D=3D 1;
> =C2=A0}
> +/*
> + * hrtimer_cancel() reads timer->base before anything else; a zeroed tim=
er
> + * has it NULL and would fault.
> + */
> +static inline bool ha_timer_ready(struct ha_monitor *ha_mon)
> +{
> +	return READ_ONCE(ha_mon->hrtimer.base);
> +}
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon)
> =C2=A0{
> +	if (!ha_timer_ready(ha_mon))
> +		return;
> =C2=A0	hrtimer_cancel(&ha_mon->hrtimer);
> =C2=A0}
> =C2=A0#else /* HA_TIMER_NONE */
> @@ -538,9 +558,15 @@ static inline bool ha_cancel_timer(struct ha_monitor
> *ha_mon)
> =C2=A0{
> =C2=A0	return false;
> =C2=A0}
> +static inline bool ha_timer_ready(struct ha_monitor *ha_mon) { return fa=
lse;
> }
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon) =
{ }
> =C2=A0#endif
> =C2=A0
> +static inline void ha_monitor_free_env(struct da_monitor *da_mon)
> +{
> +	ha_cancel_timer_sync(to_ha_monitor(da_mon));
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_RV_MONITORS_KUNIT_TEST)
> =C2=A0#ifdef RV_MON_OPS_INIT
> =C2=A0#undef RV_MON_OPS_INIT

