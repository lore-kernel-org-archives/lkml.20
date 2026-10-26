Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007812;
	b=AQQLZG6Aa62gDpXmfK9cXkBfcnguEXZVE16zFQDPOFBCvqXxGOEpYYK0R6OxeDizaB4k
	 K3h2WRaA6cFS3c8Z+5YeeOX3T3XcPwAaMKwZNJmxxN8JTXW2opphC6GFEwMwwzrddRKRf
	 rpYv+fV60vlNTsJfBbvRjUWfR5heJqSYDJ5NkAU4+zg3Fv3xAPPEp2STkrU6P4Ccz+sI9
	 lICbVP0VYLvqR+2u1JaHRpNk4ShGILHWTmf246TWuVNp8K6P/nk37simiVuXrS9zMEkIg
	 E668g/p/++wPLCNCnb2QSrKJ8J5sFTCN6AQ81tNS3goe1sbKScfh3uIHKLVsHP0b1Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=YzYyV3/dl4usk2Ucqfq7Nq0hoAaOh/AV9apr9Ut9AII=;
	b=tjIkVHxIZ/NfDpl0zUd3deJYe6InyDRVFi7tcTTh1VRluQmUDI4ilb2Ctx4c2huv0i0m
	 v0esQj4N02dWgMyBAGdtoilPecNiW1PLmD4YsXNspH6NtbUq7+QqpCp29co+/++V8rc2h
	 JIEKYm/olwS0Xxfuok60sDxuUvHcFJcmVkgrnJ4KeYbuNN0CJZs1+r5PrVjwcpugg4PZy
	 LIkgzD60TGl5NR4hnV7BxKrrGrGnfjClxijwOfj1LDhNENSY+B5wdekd2sjLIZ/hfMo7B
	 phUSMXZ/HRhv94jYw4mtuqf+jMFQxv4cVxnuheHY/4f1Sfozc97rSMiyiOgEwEtWgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VhNU1xyV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H1aNFNuW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VhNU1xyV;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H1aNFNuW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793007811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YzYyV3/dl4usk2Ucqfq7Nq0hoAaOh/AV9apr9Ut9AII=;
	b=VhNU1xyVyA/HicwImyO/0cX7aYE0XSYqQntBin0RPIMgRjCr8dExHTKojbfuPZ7C9dAfDI
	E+0WkNeFuRwkw3WKZdPBPJUl6N496ruVL3hnjfPsG8C5p/BPupn7YIPmisUQOQoPzKc3Zx
	iuEAYgBNq5rFBaFMob3Gu+YNtX8bFe8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-uK1hopnrOcePQ993yQJu2Q-1; Mon, 26 Oct 2026 05:43:27 -0400
X-MC-Unique: uK1hopnrOcePQ993yQJu2Q-1
X-Mimecast-MFC-AGG-ID: uK1hopnrOcePQ993yQJu2Q_1793007807
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso16664425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793007806; x=1793612606; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzYyV3/dl4usk2Ucqfq7Nq0hoAaOh/AV9apr9Ut9AII=;
        b=H1aNFNuWmmCXKe21c9gDs03ZZin5m1PP+I/WkphR8QB8HX/SEfMRLbhT7B2G7xAe4I
         A/ZE1RMupPNXKvnSUgn/uIIFqPw+aqdybpQ80BWmnjOM/tHKkEK+ok5dEptJPY09HPVN
         ibAL+PMSAuVSxXqV+JIWETJX6NVbifWqun+tRJoPjE4z5qbn3ys4jMtDUj6gNmjw9lb0
         vJVJvPFjbItVs69rIYC+1zwZdZq43mADKX4hbQVTmSyz9J4JiV567IBL1O4cqsKcS2Cu
         uhSLCl3az3WlrT36yIKEHEEQejYXJcfjNF5uDxbMj/xQtUZyONS60RWnq2h3ylIXT4TF
         UOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007806; x=1793612606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YzYyV3/dl4usk2Ucqfq7Nq0hoAaOh/AV9apr9Ut9AII=;
        b=iajP1ld4ddqJKg5CieiZy2fSIs8Nj0IMjQkvtJgMr3sIR54YjhEvvF3LjMS0mEdzUa
         W8pdwyoiovrlGxPUJxhnnjcvj3NeWVwLmR+I4J+1/451sWpDF3ZH8VDp7NDy2tIcgHXF
         ILf8Whpp4Rd6RnmjOQUtQO3VhpUc0VHdOJsLiHldo8bMnuDmkvfTopeUyojGMk9CDq5s
         gfySw/4OshBePcln4WbM/Cpgc9eGduden9q6DwsLrWWrjTF7kVXzs2yvH4tXxaLhBIwd
         aA8VMwZIMtWmhwS8q2qWRQ3lMhZccqZxcqkXjopBKps0ap2+q4JDO8KRM1ZVZ80YeWkw
         JyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU/Gg8BtsWYtv6+eLGQM9qlyYl+FLnx2NbWcrxtuoA5Q9Ja2MJ5Gk0d+DmBOBswu7ILWN1WDBQ+o4vX+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ40PkljrUtB9zwECMYEN8/sRneIHrZsh65Q/jrs88dF1Y+TG+8
	JrwFRCXea2eHJ0DVFIYXadzUnshjOkGJYJH95DWPLaiNemQsHH2cLars2UnZD9X2nOoMZgIUm0C
	UaMR8+G28aSGluyaAKs5wofhqZdqa7uSI2KEDWbHp1E/rQahm91UHClP2g2FA6vi/HQ==
X-Gm-Gg: AYBFou2dUAQl2nhAwYaYtpdd/wiO0Kbx+g7ZmpxHRwLnw9PWlJTAMh8kEHoXR8mTvWq
	+Yyzy1TimTVGOjLgwv+GTZ/EbXJz18+jyhxGovTnIzX+phfWxCi7tQQW2Ni7SxgCAsfo9pXhIu7
	514I02+xtm60xdMxzPIR1jowEH/Q+j5pHjT0+eM1zfpuxqHw7C9kn04LXpVCN/Ip4q6j9ASEmLU
	gJhjQ15dULixZCcl/+Y6ZkHxeUh5ihl7HI6LoszEbvTQETUjpYUo01GSsdpgT0PNSdW6sWt8Gr3
	Qc/eoG1/O+ZKtMR8tQUBNBg7+ILmf8iyQJEpK8Vh382m9u3OINRc64exS0Av973bQjM6P5T9upZ
	19f3QfYhDXGxSo8lNteU2jG4pUyoH
X-Received: by 2002:a05:600c:4f86:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a35acbd064mr110624685e9.27.1793007806565;
        Mon, 26 Oct 2026 02:43:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4f86:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a35acbd064mr110624495e9.27.1793007806185;
        Mon, 26 Oct 2026 02:43:26 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm487617515e9.1.2026.10.26.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:43:23 -0700 (PDT)
Message-ID: <e39bfec47ecf06453242e3f6bf919e9fd2e04caf.camel@redhat.com>
Subject: Re: [PATCH v7 03/14] rv: Add a KUnit test for the HA timer underflow
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 10:43:22 +0100
In-Reply-To: <cdaf33af866392428f1942cef4e442b1d106989c.1791745088.git.wen.yang@linux.dev>
References: <cover.1791745088.git.wen.yang@linux.dev>
	 <cdaf33af866392428f1942cef4e442b1d106989c.1791745088.git.wen.yang@linux.dev>
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
> Add rvtest, a minimal per-object HA monitor, and a test for both
> underflows fixed by the previous patch: an invariant checked while the
> uptime is below the budget holds, and a timer armed after the budget
> elapsed expires now.
>=20
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
> =C2=A0kernel/trace/rv/rv_monitors_test.c | 122 ++++++++++++++++++++++++++=
+++
>=20
> =C2=A0#include <linux/rv.h>
> =C2=A0#include "rv.h"
> =C2=A0
> +#include <rv_trace.h>
> +
> +/* rvtest: a minimal per-object HA monitor driven directly by the tests.=
 */
> +#define MONITOR_NAME rvtest
> +#define RV_MON_TYPE RV_MON_PER_OBJ
> +#define HA_TIMER_TYPE HA_TIMER_HRTIMER
> +typedef void *monitor_target;
> +

...
> +#include <rv/ha_monitor.h>

Uhm, this isn't meant to be imported in things that aren't monitors, if we =
just
decided to create another test monitor here it would be a problem.

I'd suggest you put this all in a new C file and build it as a separate obj=
ect.
Then you may export rv_test_rvtest_underflow()  (extern function, not expor=
t
symbol) for rv_monitors_test to use or whatever works best.
Feel free to add a new rv/kunit folder if it looks cleaner, it isn't necess=
ary
for now though.

Be mindful that it should still build as a module (trace_rv_retries_error()=
 and
rv_monitoring_on() aren't exported, you can shortcircuit them to nothing li=
ke
you did for the other tracepoints).

I think you should be able to keep it as part of rv_monitors_test.ko but I
haven't tried.

It's very good to have unit tests for these things, but in case you cannot =
get
this ready for the next merge window I'd still get the other fix first.

Thanks,
Gabriele

> +
> +#define RVTEST_BUDGET_NS (300ULL * NSEC_PER_MSEC)
> +
> +static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_rvtest env,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 time_ns)
> +{
> +	return ha_get_clk_ns(ha_mon, env, time_ns);
> +}
> +
> +static void ha_reset_env(struct ha_monitor *ha_mon, enum envs_rvtest env=
,
> +			 u64 time_ns)
> +{
> +	ha_reset_clk_ns(ha_mon, env, time_ns);
> +}
> +
> +/* The tests arm the timer themselves. */
> +static bool ha_verify_constraint(struct ha_monitor *ha_mon,
> +				 enum states curr_state, enum events event,
> +				 enum states next_state, u64 time_ns)
> +{
> +	return true;
> +}
> +
> +static const struct rv_kunit_mon rvtest_mon =3D RV_MON_OPS_INIT();
> +
> =C2=A0/*
> =C2=A0 * An easy way to pass the context is to use kunit_get_current_test=
()->priv,
> =C2=A0 * but this doesn't always work (e.g. a reactor running from anothe=
r context
> @@ -146,6 +227,46 @@ static void rv_test_dummy(struct kunit *test)
> =C2=A0	active_ctx =3D NULL;
> =C2=A0}
> =C2=A0
> +/*
> + * rv_test_rvtest_underflow - the HA clock math must not underflow as u6=
4
> + *
> + * An invariant checked while the uptime is below the budget holds, and =
a
> + * timer armed after the budget elapsed expires now.
> + */
> +static void rv_test_rvtest_underflow(struct kunit *test)
> +{
> +	struct ha_monitor *ha_mon;
> +	struct da_monitor *da_mon;
> +	const int id =3D 4242;
> +
> +	prepare_test(test, &rvtest_mon);
> +	da_handle_start_run_event(id, NULL, start_rvtest);
> +
> +	scoped_guard(rcu)
> +		da_mon =3D da_get_monitor(id, NULL);
> +	KUNIT_ASSERT_NOT_NULL(test, da_mon);
> +	ha_mon =3D to_ha_monitor(da_mon);
> +
> +	/* Uptime below the budget: time_ns - expire_ns would underflow. */
> +	ha_reset_clk_ns(ha_mon, clk_rvtest, 0);
> +	KUNIT_EXPECT_TRUE(test, ha_check_invariant_ns(ha_mon, clk_rvtest, 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVTEST_BUDGET_NS));
> +
> +	/*
> +	 * Budget already elapsed: expire - passed would underflow and queue
> +	 * the timer at KTIME_SEC_MAX.
> +	 */
> +	da_monitor_reset(&ha_mon->da_mon);
> +	ha_reset_clk_ns(ha_mon, clk_rvtest, 0);
> +	ha_start_timer_ns(ha_mon, clk_rvtest, RVTEST_BUDGET_NS,
> +			=C2=A0 RVTEST_BUDGET_NS + NSEC_PER_SEC);
> +	KUNIT_EXPECT_TRUE(test,
> +			=C2=A0 ktime_before(hrtimer_get_expires(&ha_mon->hrtimer),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_get() + NSEC_PER_SEC));
> +
> +	ha_cancel_timer_sync(ha_mon);
> +}
> +
> =C2=A0#include "monitors/sco/sco_kunit.c"
> =C2=A0#include "monitors/sssw/sssw_kunit.c"
> =C2=A0#include "monitors/sts/sts_kunit.c"
> @@ -163,6 +284,7 @@ static struct kunit_case rv_mon_test_cases[] =3D {
> =C2=A0	KUNIT_CASE(rv_test_nomiss),
> =C2=A0	KUNIT_CASE(rv_test_pagefault),
> =C2=A0	KUNIT_CASE(rv_test_sleep),
> +	KUNIT_CASE(rv_test_rvtest_underflow),
> =C2=A0	{}
> =C2=A0};
> =C2=A0

