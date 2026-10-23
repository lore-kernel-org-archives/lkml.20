Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792732600;
	b=4OfbV5p98vj5Pe2IgzNI5U3rQ619Clih1ZCuutdUVnc983moQ+CyXqWtzdUVEJIwyAks
	 4xzUXjpELDm5JlrB38CaGRAEwXNwtpVpUZNvcdM7FbfHceiRf+bavgykaoRMGXdYdYJ2v
	 NeiUdcv/m0075vM54RuS7/AiQXWC3YrfQ44+XWvnaX9x7K+F+PwALg6vpd60FDbPBp0GB
	 HakJvFv17r0YjveJ6avOiyH5wOZcBXfivyukS637mBh5y7XgsCvE+rDaP6SodpJXod3Aw
	 5VhQCVOhxWQ2n5NfUmsHhJZ6z0weZIk0oJteqshUi5blnnbPeE2AucbcE8r9mV1fnyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792732600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nz9Cf8qFMGz6p/yYVjpoFgM9Oju9i2cprQSLO3sRbc8=;
	b=4tEmiHm+2UJurPayCQQjWwruwa0/ftmQ3WKvZHpCqvP2plcTgfta5J2xSi5cFIWPbQXc
	 WSgakLegFaptlSsSqrrbaY3Xe9BqH6u4Ew99q64OEQvhtmDsCXjfa6iU/rcbnrvUWaGwm
	 ZbF+L/ZkGhD+GWsqpsNyUUOMdchiJ3oRDf31fhjLa77aWoSXM8HBiKguZnlUidMhEkB+a
	 mzQYoMRGkCwPHygB0fkID3pLadfY+geuN3ZsJHUrAblm1VHOFk72Zzxw/dTDgnKiSXGlJ
	 c30MR9o1YvNhrK9BXBstoULlAj4YAYtAxUqVEEHG3aRNGN+VdM4EjziUoEkGQmwPemg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="qk/Edkvs";
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3C606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F3C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qk/Edkvs
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5337fa12431so126881cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792732599; cv=none;
        d=google.com; s=arc-20260327;
        b=Kx9APTTdhXcRY+x4bE/kfmfMrWwF48I2WbwqcULcuVw1THvrGEgvIhi6P7sovQezWG
         jAgi7bupYN0f/Ggn+tBhEeiGkGpcOWizUf0VS18YMgckY0sKGzO3VNXcKi9TLuR4zent
         g5uOzZTrOn9h/xsv2seW5904WusTBXwPgGwW5bsqCl+GsUoEoX5wmkC8nFvsQK/ukfya
         JJQ1HhB08aW1nIM4kFU94Wj1AlVfTN2G2Fx+EKiooBCkdEWpp5v3ZnQdwKXGZ8U5Cylp
         ANaHs5UzH361JZyH0CWnOX0Y5J3xzXrWiBy75DcCdxzO724oatdm9Z5B+zg5ClSSxJeY
         +dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nz9Cf8qFMGz6p/yYVjpoFgM9Oju9i2cprQSLO3sRbc8=;
        fh=heUBj+yfSHEDRd6JbZuXVSGoz7HPSs6PKKxvKyBYKqw=;
        b=D5jPLz51f0xDj+YjInaMaii4JNaFPYjFMyF/TGTFalHUrHTeRNLclZ2HJrIegB47Ab
         djGiVYCI4k0XgYefSBthxEfl8FcUZm4E12uSS5kZtwC6zJwHU7NQsg2DXh7p9NUsbv3k
         RuzOeOfLZj6M0V9RxIrJIelFcxgmlm1KdnAQCnCQorONrQtx89wJQJQShfRGtur2RruO
         phKwPsyaYWepIf2ohYzrxGHH4L5xKkb/oGlkbxLKsO9LQ2UrAw5GVk3xLqt28PP9E64H
         cWDzl9E13gzS/6gYA+fS4NLn7y1NdAJpofzrfmUTCwhYzQJpPnLf8swa8xmb/5cyQUpB
         xQAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792732599; x=1793337399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nz9Cf8qFMGz6p/yYVjpoFgM9Oju9i2cprQSLO3sRbc8=;
        b=qk/EdkvsHRAnmnorDQKg1s+yWQL9hzjOOpTzQqcpTHHNE4+D3aq49Z0GG1r50IJ8c/
         lONFb5BfwTJ3b/eb5h3y3/ivGtjHXxCwh77N6byYEsTf99Wp/GeGZA2H6qR1/85ORowe
         BUc1fXIcECLjlrHuGmFZTBxzOZnOpWzwBJDNNCX/zc+StwRW2s2UN/zQgkrx+zDgZZbf
         FeTSKNODJ8RtQgUADfG9CYTUa6AbiKRkmLeqijY5U95nre7ZVCtKdUps5uxcALCOqJNX
         WZt0WIy4d1858mhO6BbparV0C0i9GPAZhbAP5D88LztwEJimGi2EZndfCtJfuRwbVm8L
         736w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792732599; x=1793337399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz9Cf8qFMGz6p/yYVjpoFgM9Oju9i2cprQSLO3sRbc8=;
        b=oiJa5QwgKh9DD53SWzq/bY70RPq/LM4CnASzPSg2rBgTB5gK2SObmh75AUjLXHlvgA
         66ag9mkVacUy1yVRkBs2KJKcXHo3MwQ8WNH3bDfmsMij86GJRodx3wzyTeiOZpwbRHFP
         xaIZI9e2+uIhaCLe88jLY+W7Y/0sOl15bxn6e5P8H0sKnhW2ASMhUUN/nr8sDUcSjG83
         eZkHEl+HjA4jk4h1oaCQAKbk2xCjAh/UuZ/VAPUAUhOxMl4qmQ1m4H9zO4nZJJHtvVvY
         1YVHFNsePA0e14hVp7nO3IrDORy3FQABVOL6F8jYBYg9qQU2mHchLS3IWj3ReQQgFJAX
         0XiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOQwD4BycnUzG61UVSSKG9nss8WdiDgMvMS3iybUObwG+WBiJ4hVXPT634NZKs6noTNrKYY9ljfDS19pQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIioxZgenxxlmxkiFu6znghGY9FiQ517xV4IU+D9SAm4D5fR+zL
	dLknldmYS0/+KLQN5wnNIuA1Xjtishzp14EIOlYX82CzPnfGGLMJQ5aVqzd9PsF8AL4Zc8mo2R0
	uI/DKkM+poSs+gTSEpUauEQ0ggltBMKgXKPnWpQew
X-Gm-Gg: AYBFou1wr6Y01SlfMh1thfhO7jhZskSF34oUyJ9akaJH8zZm5fms+h8ARjrDy9Sc8MP
	dEWszjuiEyDk2+VRuKjFlOSw4e0+ABiB72sbbAN5RCw9O8a6Ct0HmqCZqsQi7bmPPjC0S6KAEJd
	z36IZ1Ijbzx1HuOCPcZUUIJ74TeffqsRlbPRR5y+AwfOYwLZIE2W0QAVaKtu5ArQGSQDvEJ8N5u
	qQPLq0kQDtDtUVXdXMP/1f55x0xJFEpxeBZP0D+W6jO72E+ghWj+xRj1+UAKCcn1c9N12G/rv/m
	4z6+FhB+3naoGWVgcN75CbpMszJSGxjVHsLvJSMCByvpWDvKBNQ1Juzv96revKBWakCozPH2bKV
	rweKsd8ElWPi6Tu9MOUFXzIBIKGLRwaIoQeo8eijzludsAKw/L56eH4eIWEo=
X-Received: by 2002:a05:622a:4d4f:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-536c274d0e2mr8214441cf.4.1792732598813; Thu, 22 Oct 2026
 22:16:38 -0700 (PDT)
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
 <20261022203003.1779152-6-irogers@google.com> <atqUSrmtsfCojGcA@google.com>
In-Reply-To: <atqUSrmtsfCojGcA@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Oct 2026 22:16:27 -0700
X-Gm-Features: AclHuK-FispLLEYasalxplr3JlR7dLX32HrZh2qbDugEADtQ2Lp3Wc6zv5VHb3M
Message-ID: <CAP-5=fWFbSP48GDQFuUXsTMJ6sN8hYEYrMPmM8tb_o44AxwCQg@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] perf bpf-filter: Add lock_held() sample filter
 for global mutexes
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, ddhariwal@google.com, 
	eranian@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:55=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 22, 2026 at 01:29:57PM -0700, Ian Rogers wrote:
[snip]
> > +static int resolve_lock_expr(struct perf_bpf_filter_expr *expr,
> > +                          struct perf_bpf_filter_entry *entry)
> > +{
> > +     const char *name =3D expr->lock_name;
> > +     char base[128];
> > +     bool has_amp;
> > +     unsigned int mode;
> > +     u64 addr =3D 0;
> > +     int ret;
> > +
> > +     ret =3D normalize_lock_expr_op(expr, &entry->op);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (split_lock_name_mode(name, expr->part, base, sizeof(base),
> > +                              &has_amp, &mode) < 0 || has_amp) {
> > +             pr_err("Error: Invalid kernel lock filter '%s'\n", name ?=
: "");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (str_ends_with(base, "mutex") &&
> > +         !str_ends_with(base, "rt_mutex") &&
> > +         !str_ends_with(base, "rtmutex")) {
>
> Is it just checking the symbol name ends with "mutex" or so?  It seems
> risky and limited, can we check BTF to verify if it's really a mutex?

Agreed, a suffix check is only a heuristic. The catch is that kallsyms
gives an address for a global or static variable but not its type. And
vmlinux BTF normally only has BTF_KIND_VAR entries for per-CPU
variables: scripts/Makefile.btf passes "--btf_features=3D...,var,..."
but not "global_var". So on most kernels there's no BTF type for
something like cgroup_mutex to check.

Patch 6 in this series adds classify_lock_sym(), which uses BTF where
it can and falls back to the name suffix otherwise. It checks:
1. for a __percpu_rwsem_rc_<name> BTF var. DEFINE_PERCPU_RWSEM()
always emits one, and as a per-CPU variable it's always in BTF;
2. the symbol's BTF_KIND_VAR type (struct mutex, rt_mutex,
rw_semaphore, semaphore, ...), when the kernel was built with global
variables in BTF;
3. otherwise, the name suffix.

In any case a wrong guess is harmless. The direct owner check only
reads lock->owner with bpf_probe_read_kernel(), and only at an address
already confirmed to be in kernel .data/.bss (function symbols are
rejected via kallsyms and BTF). The worst case is that the filter
doesn't match.

Patch 5 adding a suffix check that patch 6 then replaces isn't
intuitive, so in the next version I'll move classify_lock_sym() into
patch 5 and use it from the start.

Thanks,
Ian

> Thanks,
> Namhyung
