Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792732788;
	b=Xv/mFiSwD/YXhEpFnEuGe9dG4+9KpI/EfYTbE64npBSz3Y+gTu1jHzfVXKiZIFMAmR5U
	 qy+ILdzVE7jDg83kph39hdXMJBGPjWkq0ryuK5FWE+NfuxJlLIZ5fmYV/Q2R0FeUUp1Dc
	 z2N0DJb1d/jpJQgrKXzjigKnVkaXyXgqBQcHU5vV22DZceirw4QJ+QaTFVxfSzQoxwuNi
	 5L95cgmkXo7FGnxAwLD61ImZnNFS4YrgLoymRyp5Cy75XWbk/RoW/XUDaGW9m4Q+H0nRl
	 Qv4wUGPAI7kNwGo0gSSRLKXAUM3+D4cyPNInS8n4zGLdro9fN/t+/p2T2/wLIEmYNhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792732788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/NaKMAAGxxDgzyHN/M6S08Zb78X5Vhy8kShaURHSxac=;
	b=01xiGJY/i+KhOoX5Kk8uugC5rKPCOW4kJB9lpXKOZyd3f70VZPs2Z5dKc6hqOwve/jw0
	 TItKLEbNUtXsbSI7uoNyALBwqsIU3fDyQbANmJ6lQjlu7h0khFCZB1FgRy6eDq6kKHXpD
	 4yQMBo6LVJGOGxUhuPZ2dzMOC2hdjaCmRkiTmiaPq2dvsgM20Sr97Fr3y6Z+S5KdATubY
	 eVNZ6RsLMY0ZRWZPmxMYkJewns2QKemBPmu1gHEQBqUMuv4Pc5ET70rOotiF8czwLDE0P
	 Skxbn5ky/f1a8ZKuKhrBUzoX7cGlxkeztoAwWKa0AcFkPn2G9kDezggfvmDcBOHrPag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="uy/1yJgn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C8C606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C8C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uy/1yJgn
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337c7b9937so181061cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792732787; cv=none;
        d=google.com; s=arc-20260327;
        b=isBS4MPVa0Q1Bl8mmW2CSXkcqu9+0bartI0QrhIPeXIzs5KV2uRy0mZ8C1r39LKqQB
         YHWuVYcswe//b2zcZBlrR1ySgSBPB0Nbhv5g1kECrxKD0F8O67QY2+FsBjU3V7KCZf3H
         4BAtX5lrQPmPtJrxg2mzQ1W+dB/ByyUSRawL7G8WcCzb8/VKQrCh+ZA/zZRokNUAize1
         ScAGbvrk8NGttwB38yepnHgtQo54I8dfYj8U7geasfXra5XPuJejYob8Vs8BVgAHryh/
         dkKUb/GUfON278Ii+n07YY2NiFTfVzZRBlZtgFyYBmjN5+D6q89furIAR/KEza52Hu9U
         ec5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NaKMAAGxxDgzyHN/M6S08Zb78X5Vhy8kShaURHSxac=;
        fh=gNBpz4WESeJROF6+FAi73pYe5zaBsMWDKypGkXw6UIM=;
        b=hBADVuJUqf7AuSh2R3kKC8xTDYaKxOvUqkij8001ftnrZpDDGmcSqd/Cr5yQVR5VHl
         3Gf5uJagHK6VwOPmXc+ucE4EjxTTZa1KBls+AiwHVbVzgaTeiTtg5YdB7SeeXKvwU1UB
         D8WxjvHgEeKSfq3pqCkkAWFTXCpT+3RfW/6Uk4D70e7+pxPLFqrdazIkCZE6nmSL1o0P
         2yXUH7yRUfLv+mW65uzqoMvXHZqyoV8RJ+/BIUT0TCRxertIRcmiou2Yk/RaD6RTQJMQ
         3dYyPKlv/HNjrFCDILNVGXH4I5n4CnVKm8dIhWXY+2ekB3r8pdxexIK5S0IkzLET4jBq
         ZKFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792732787; x=1793337587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/NaKMAAGxxDgzyHN/M6S08Zb78X5Vhy8kShaURHSxac=;
        b=uy/1yJgnJ9y8v/sLjHDmqtwgd+PCbTLhkQfcdb6T5wRpVF2nBmK2jpb11eDmm2YHRN
         CBLHm2IO/00IlpHuThymVEze8PrK0imVzoO930wlz9GtUk5pdf4O6wRsTU3+4O3tv5x8
         PQen3aeMbpTZEgKrWawaW1RSWAjahYvoKOaVwLTqdsYY3JjJYIkrSeTMerB4tApx4oTO
         yrknlYVj4DqFJWpC3EpbpK6mNxST12bi/tZalWparRpJs0V6hUbVTRexceY52zPg4aCN
         T/TDeFufurGASUB/xn3Fkm3rVqfDmtE9moBHvq3ATxWnnRarp2sRAiHqphaps0MJRtcX
         f00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792732787; x=1793337587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NaKMAAGxxDgzyHN/M6S08Zb78X5Vhy8kShaURHSxac=;
        b=i4eVjCgMmbJuu/DfEYlh+6gl7ODQ+Q6/8qQc8GVuDgOyU5iu8Hm7NcgfRN4o6fM498
         PRbm/Uko5OA/q1JHhxTE7uSq2z24NHhrTvI85veqBiColysdUck1i9PWvXMWnvs+EEWa
         pzlfsqTEHSgN/TTTimtVHcJHV/A7WHo2tOG2OMgm5fOJ9JLF0lyNIERpXM37SKmVGlkm
         7NURwMaLSAxRqVZNLwsC4zWYDhE7m1GtdKs6qMu25J80KocCCoLY2SkPdGA6lE+Kl1eT
         xAcdMUXaubZAM/dESko04kY3youcT44qleAmTtS7sgV353TNm0Y8I1D/95CZnJm04Q/l
         FZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxcvQfoRu63FHyusd4B3kp4P6LCw3MoFA4em0bZfZxeQmAG95brY9VooLJ+VyMu+XUzFxqNqc9aqUfaS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI31DK+hRlng+IktfCJDgoCafofGybjZvL74iIHzgDLzVjD/lwC
	y1bVb22L5cj08SdoIShHAs9wYy/9NG3DhHL3ND6ipnNnWsgnhx62NA6CuWQaeIgg6ZoTPoibf7h
	fPwRSQIt66ATBrRvEmq5yujoH5zm3bFsCcIAg13Eb
X-Gm-Gg: AYBFou0X+bcpBw1wmd3AHDXWp4EUrWlzNABjI2lK34LN4E3TxRbBsNbyDJssKM59A2f
	xqLUE60652RHVRttuT76l/lpr09kufKsmZOxockYIf53i0yNFqILXhh/Bj/MTNdATHqKaucCYvk
	MxirjR9mRb1adakjiaoNuVoKW77I6MZWMQfNfib5XycNca4ab60KT+jMu9sie44idFC0V+OI7X8
	2grB8EnsJzyLcFDMtpYoC3et9UImohCBCN1AlPirRHcsMUARNRbImUVKFlEICcQoCN+b6uWSZzq
	Xys32Biel4oHhjOgqc+ulQPtJpBsEn7LQdYxPvfVRbatcAHpEZb4cSbIBZFV0xY1Vx3sT9Yn/CV
	gJL1EBaZU84ANNb6dAMfU8cFMN0kSY4NDHQFvzQ==
X-Received: by 2002:a05:622a:410e:b0:531:282:6560 with SMTP id
 d75a77b69052e-536c499a845mr5631721cf.15.1792732786055; Thu, 22 Oct 2026
 22:19:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020205859.1080743-1-irogers@google.com> <20261022203003.1779152-1-irogers@google.com>
 <20261022203003.1779152-7-irogers@google.com> <atqUsIBhPaxjp3p8@google.com>
In-Reply-To: <atqUsIBhPaxjp3p8@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Oct 2026 22:19:34 -0700
X-Gm-Features: AclHuK8074tTEIi4nbK08SZtgABfkl_zUHjYXnlEC7ftpUdA3DXoCtzUr3SI0rM
Message-ID: <CAP-5=fUZ+=_b_1SL7B=wtab=8foQ6iDKXrxQ_k8wDZaJTd43Pg@mail.gmail.com>
Subject: Re: [PATCH v6 06/11] perf bpf-filter: Extend lock_held() to other
 kernel lock types
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, ddhariwal@google.com, 
	eranian@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:56=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 22, 2026 at 01:29:58PM -0700, Ian Rogers wrote:
[snip]
> > +static const struct lock_prog_desc lock_progs[] =3D {
> > +     /* Mutex */
> > +     LOCK_FPROG(fexit_mutex_lock, "mutex_lock", LOCK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_lock_nested, "mutex_lock_nested", LOCK_PRO=
G_MUTEX),
> > +     LOCK_FPROG(fexit__mutex_lock_nest_lock, "_mutex_lock_nest_lock", =
LOCK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_lock_io, "mutex_lock_io", LOCK_PROG_MUTEX)=
,
> > +     LOCK_FPROG(fexit_mutex_lock_io_nested, "mutex_lock_io_nested", LO=
CK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_lock_interruptible, "mutex_lock_interrupti=
ble", LOCK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_lock_interruptible_nested, "mutex_lock_int=
erruptible_nested",
> > +                LOCK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_lock_killable, "mutex_lock_killable", LOCK=
_PROG_MUTEX),
> > +     LOCK_FPROG(fexit__mutex_lock_killable, "_mutex_lock_killable", LO=
CK_PROG_MUTEX),
> > +     LOCK_FPROG(fexit_mutex_trylock, "mutex_trylock", LOCK_PROG_MUTEX)=
,
> > +     LOCK_FPROG(fexit__mutex_trylock_nest_lock, "_mutex_trylock_nest_l=
ock", LOCK_PROG_MUTEX),
> > +     LOCK_FPROG(fentry_mutex_unlock, "mutex_unlock", LOCK_PROG_MUTEX),
>
> I'm not sure if these are still needed.. it can handle mutexes
> specially, right?

The direct lock->owner check only works when we already know the
mutex's address, i.e. lock_held(<global mutex symbol>). In that case
prescan_one_lock_expr() adds no LOCK_PROG_MUTEX group, and
configure_lock_progs() turns autoload off for all of these programs,
so none of them are loaded.

They're still needed when the address isn't known up front, or the
target matches many mutexes:
 - lock type filters, e.g. lock_held(mutex) or "lock_held(mutex) ||
lock_held(rwsem)" for the direct reclaim use case. There we need to
know whether the current task holds any mutex, which means tracking
acquire/release in held_locks;
 - slab cache filters (lock_held(&<cache>)), where the lock is
embedded in a dynamically allocated object and we match on the
kmem_cache of the address recorded at acquire time;
 - hex addresses and symbols whose type can't be determined, where we
hook every lock family.

So they're only loaded when the filter actually needs them. I'll add a
comment above lock_progs[] in the next version explaining this.

Thanks,
Ian

> Thanks,
> Namhyung
