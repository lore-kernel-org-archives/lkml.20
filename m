Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779831;
	b=cQj+gGZ6c9Ss9s3PN33VCeHVYNVMUcpjPEozj0f7dKEQKn4nBCn2hsp7QehYC7gecFxx
	 Es6Lghfy1+CvO6Ioj6lhew9fZNmWd1N4VJ7uhS6ldcukTFEImGBMzzXRSrpR42RyCgwmu
	 okWQpjI8H20IrSbpEyggM3ViBkV/1HjmlY8gutD6lXuXN0iNL9J5GYgzvsCcd5+VMxsPp
	 BfHxdgmHURTgImaCzcN3YiarCw9L7HI3UIrtVV5wa0LkzdzydqU4p5B6b8wBy/44sKWfe
	 I+UQXMQI5Fj0RGDYu7904iBtL/1fneRUBJj/TSeq02zlbDsnZslQhLA7z52dnmTdZfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FrqXa+k3jytZUHGymUrBhmXYifhUZWCqjzRMofnbh4M=;
	b=nVh432X4hw4PRhXr4rkv7MPUtNQnngPO8Cr12n830ktXsiRz0C7FYNrh3jFkG/ugnJ0K
	 QQpj1AtW2rmIMrufAKr7lrEkOGmadKYwNJHJFaDEKF4dkq/GRe5fFU+q4BIDqXfaw3Eh1
	 v/k8WhHdbyE06LRjwlm5vAPcpyo9/P8WVkbIfaMZx7PBHcXxGhwsrosgENSHGoWTqwhfb
	 kdzhsRN78DCHyuIUuE/Zks/wu/96xwfnbovf5FNppCEtzAD/MZN6bd3ssfiwl4577e/aC
	 JzavQl21G0k/ZR9jiUqWfxAuGPsRwwKwBoFNYUEaFLBBy5vkAWB/1NXMxKtkeXGUA0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUojU28V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AA606A890
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2AA606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUojU28V
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55be673e029so212001cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779829; cv=none;
        d=google.com; s=arc-20260327;
        b=WdZ+brOAVVbrfHKZgquUMtkP14n0lxEM9uq7m+edYLDOUNiSA9WwUY/igwEm5JbjYa
         BlXv6n9mPJ3S/csrY7hIMmZnIuIZ5BN1c1t59KhmXlOPGxrfmJVCksPkGBxdhP8gegXh
         al9IGbJFrcLkSOU8vmPMSmI7llxTPeGd/OfJQR3q92+xVCNZ8Iq5QNGXes8NF+cutolx
         ZLZsk83kN6jbEE4XVROX70lBFvOq/JbDc1R3ZW3HTXbG34wTiAEhVzmY1yK28eZtyOkt
         clHwGj4qyDFREhzRHRLDDwycV4JDG2F3N138q1PXfJWxYXlOuqTZFWrM81gz8GHZRBUw
         NBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FrqXa+k3jytZUHGymUrBhmXYifhUZWCqjzRMofnbh4M=;
        fh=UDybj2EqOzd1tCq0yH8PnKAOqCXIn2lygJeLNikpNkg=;
        b=plB/WPXuLM4Juq4rtcFAIg5JA+ABj1YlZ4lrij4gZpEEfTQ53+XOJWdZfNzEawIs4l
         d/DNvue/x9ZoQp0OyatinInxtegGyZzmjE3MhFNDNqMGcozRV2JXPDflLZ8XgBv7FIz6
         iIFRFu2fvpNME5Pq9YGMX2DOY+ZbcyMHYNFQxLAuuJcACtAZNN8jaIfyk4vWAi7f2YBq
         F8MYVyVp9Yw2Hr1zGUwa8aUY2fEZYhMQQB2s+xTr44Rk4nUU2niNPX6DQ78HDooWQfjZ
         Se13vpIU6gAbYzBWBZmz1mVWD9+YClvphFbz7xP+zZKxHEe8Cx8U2T9Gm4vWpsO6A/GP
         owgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779829; x=1795384629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrqXa+k3jytZUHGymUrBhmXYifhUZWCqjzRMofnbh4M=;
        b=lUojU28Vd3dqK01eZKmE3yuMAiWpA5SDAF/VehUstM3PbMQD4I0VAIbfuNaxpOlnld
         9fBXxZqdZ3kCYgu65FpbSSG/KuTR3YWl+ipVx2XjFnc021yflHAQyf7g3FiJEqC++fu1
         wTowk0eA6n9ssPkLGWGo+JngDkwuuJ+GoZRBDehrTqub4ALdzd1h01HVzvrFkdH8F/8g
         YOiVfuzIb5Gpw5MSCBnVCoRIo190L0XAc2R45ORsyjSgRac8tUpowxvlYOjekRxJYGEL
         BjcZjO10JJK0hXzlJu8mAvPT9IDxiTd1fFkb66f83dsWgsjxTIGnF6W5na1/PejqLYNr
         szcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779829; x=1795384629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrqXa+k3jytZUHGymUrBhmXYifhUZWCqjzRMofnbh4M=;
        b=TCzDz6anEk8c+fI0Sty6+fQXPyhqNCMbiAwYs33d1uOSJf5gjHMtTDZEmB1QTmlot0
         vwjVnpMuuDdrgUPGsHixjEMnVtxwO/91lFVYr/Ezkj4IZ8Jb/Wxn2KxVSKOfZWRq/Lmn
         n2S0p3wYnFdAhHrg0seBKNdPfcGx2Z6l2gQVk8jd6AV42QxS9IVqzmc+xs76FnExIMen
         7zmRzC5Cn0cLGXzCpBImIY7IGe1bdrvmZDnsDUvs26sA4DuGQmwyyeJvvD+Bpmmb5eKs
         nOyKkqqjIvbsE6KwhCcJftNZjakWyi1wZumZcI0v3f/jUpfS/tADeDEoz0QYZCQ5JJXr
         vu7Q==
X-Forwarded-Encrypted: i=1; AL+hErFqS/DSrHjEyFwY75xCxijZxrbiA63iPmysqmuGYnC3bulpgDf7oZjI6WBjtJR3reTbxqA0d18TTra3SSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yW9xA4L4xxC18qdVfJg/0uZqpKxTU6KGYSiv25oPiYUktgtZy
	8HuKunR6dXqeVLz9NLl4qjnBxzMs5+bF5QUOGhbBFiFkSC6THdp59PlNv/EZz7MMQjm8P0bdX+p
	1bJ8LoMjKvpyJTey4SrTYsNvQuMpn33MdVE1DcUSQ
X-Gm-Gg: AYBFou1sTt0CFPjnT3H8PMligscTD4wJqe4bpuaHzY1/2SNjrdQoApM4ee+u1zF/83g
	tTCCLDDK3ho7ScFf+buv17G7nHNxKo7oCcVnrXBignsYRIxgrXlybuFkfO8qWlvrBuPlOhsc8IN
	sjbveWu+qGxFqvixRo8t0Y4+YpZITMYs3/A81XiW06rSnNkqNSBEq1hQfJeS5My7fmK45C4oo6j
	Jux4q5waYiKgtVfxGoLGRO/371MHAqLjg81YLV+iicUqPT0j/dAX3Mo7geM3hGf0HUai80fAjvd
	MTu+hTp0ec4mQnlOtDQO21nxdVcPlddTkLssfA7/bUEBQ/UjRXrrkOorH7hMBqi0fi1xjkhtjRs
	oyIBVDrr9lW92B4zzVS0pcL1q+WsaBCnbrXJY
X-Received: by 2002:a05:622a:418d:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-55c3ef5b118mr30920321cf.0.1794779829101; Sun, 15 Nov 2026
 13:57:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-12-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-12-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:56:57 -0800
X-Gm-Features: AclHuK8tUG0HqxJLZwfiHpkrbYOo6UvxhIaokwTCKMzordl012uFYJdKi4dzOyM
Message-ID: <CAP-5=fUXT0eB-YnozpOXJzYz1K3x+BnDZELU+ipXPp6Oq9BFWg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] perf test: Drop samples without an IP in the
 dlfilter test
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 5:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Since v7.3 the kernel zeroes PERF_SAMPLE_IP when a userspace-only event
> skids into kernel mode, so that kernel register state is not exposed to
> an unprivileged event (166f10836a653dfa "perf/core: Fix kernel register
> info leak via hardware skid").
>
> The test dlfilter keeps those samples, and the check that nothing but
> test_loop survives then trips on their lines: the comm column reads
> "perf".  Drop them, which is what the test wants, everything except
> test_loop must be filtered out.
>
> Fixes: 199d5e872a9ce737 ("perf tests script dlfilter: Add a dlfilter test=
")
> Cc: Ian Rogers <irogers@google.com>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/script_dlfilter.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/script_dlfilter.sh b/tools/perf/tests=
/shell/script_dlfilter.sh
> index 88222280f6094fd0..797cd9ae84141f64 100755
> --- a/tools/perf/tests/shell/script_dlfilter.sh
> +++ b/tools/perf/tests/shell/script_dlfilter.sh
> @@ -46,7 +46,7 @@ int filter_event(void *data, const struct perf_dlfilter=
_sample *sample, void *ct
>         const struct perf_dlfilter_al *al;
>
>         if (!sample->ip)
> -               return 0;
> +               return 1;
>
>         al =3D perf_dlfilter_fns.resolve_ip(ctx);
>         if (!al || !al->sym || strcmp(al->sym, "test_loop"))
> --
> 2.56.0
>
