Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793766225;
	b=qzG2zCz6ZvqRd7HOfNQqwOjdE3MlHpS/H47nae7eGtVwHLuM8nIyosvNp21pnGAHR9Of
	 6RoG080lnlnjyIx75Ymhxo8Xq3/zuAnKhhocET536HsT+XTcHLdtJY6Pi0II7S1OZ/X2K
	 pJoI9pYqgPvExmwnNLmbXs5cXlsqVgImeTsF3B+r9Ju714bVsQoec/MWNOpRF7ltA87rs
	 kHYLc00zpEXsT1x8FTz3UiGYinWnelAMjMJ8bNwM+CNt/z+Db1vkoioyHgF+UZQM12OTI
	 UMUyL0bft0UpdgHw3hZdFymJq66UVFCxf80Jj7/jv3ArxTI6VpGjLtdGjY7hysXg0Sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=YRNZziqNeCRhg2/OKwe5SR/k0fV6elgIBlSt+p0bAm0=;
	b=M3BK+xlPK5fOlGKYWLmStsEZ3oXxAIcTCW5luM+7Jr5Ik6xlfXUIuRR84iYIjaMnFxDx
	 4fzKNPjWSsnrOi1IbTTEcOiQdpOat7GdgD0dZt+9tPiJzfwvFVZQlazo4zD6gIm2rwtEJ
	 q2nodX9oP43rumi3GsrWKAw9cLIj0L+2aBzYJnSKkb8PNknzz3h6CrbU83kHkpnnT0kA8
	 77fN46rvSVa1J5+MldnU2iFCoMw84jdBz/TZABlEnZciXLh9NzNu4XxKYwAUeTuHuoXOF
	 ljyh7n2eji5Q8bBgnaEYxNCyGCCXiQOP7+OzIBF+yMXUqLeraFgz9VEmaFJaz8xkUEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fR6BXAGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E4B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fR6BXAGP
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so160521cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793766224; cv=none;
        d=google.com; s=arc-20260327;
        b=FMY4DcCCoMEqAOZT5/A7KDkTkMBVIqu/plg1U7W7ERXsekgdPkx0uWvt1DQe9C+2fI
         56bU1C835EL8BzdbHGekOpj2HdMUvF2KQxcFItot5flUzAY44V+A8hwAVdVd5NJrBq2p
         2XMz7xC+5JC/hVOs8U9GfS35Wo459UPwFCn5IyVLB7FSKmGUYZVxYWz2j3Kiws5ULqJn
         oOlVoFWzSM0yweTnmh7xWofwBXVVhQQyaJNWKVdpYD962kFKbNwGio75EiIBLuHkA4Nj
         NxGj7edhzmR3IloUB56aqd56CZNkPdHbQvDKrWrcDOWReC9R/MMX1gVcsg43acEPMJKk
         a1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRNZziqNeCRhg2/OKwe5SR/k0fV6elgIBlSt+p0bAm0=;
        fh=Z/s9t7sOr2P4PQr3V0HNkHNUophNYTbIrbdUN9VfXXM=;
        b=gsJuCh8lWEIjeKbedJfoMOcyXOLLlDnvwVeC/cDKFOo0VS2bXxRMihuIsjFrlrG+wc
         XS22z2WDJQdm2Y4SL06+g8I+IingwmXPGe7Ya8kGfygk5i1yviBFLCXZshp4OG/aUNaS
         mryrmwQePSL3S1ZIHXuNo1jk4sWvLqqDb71aVjQHJz8e31G4haPg7oO4Co2ppWz4Ftav
         shPRzZ48bhF9gJOggAtii6mU0ayhJ3yi+8/VJRUqcu+N37wOya8Np0pbBmFpEZWHy5Ky
         Zm26kofqkGsoKMwZNYgl63ooox1C13Agjmb84iXJcRbOVzuTX25cQSmNvDOdvMmczgf3
         oJSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793766224; x=1794371024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRNZziqNeCRhg2/OKwe5SR/k0fV6elgIBlSt+p0bAm0=;
        b=fR6BXAGP/rO2SR67/BLSYdj14V4i1fTa+NE/DjoGSW1B7HKANQT7CR7qD74FxQdpOf
         NwKo9XHnikjAn4UAp7G4t04Vcm8+pRkRExNBzdb5Haq/ezLLl0iR7ucUemSoHGa01gio
         QUgQW7m+FDhXAXdg8eXJ34BSg2u+lYS+BG4pyk4pGN9z6qWPQ17uEVyOnD63uYiawdoZ
         7pz6N1nCVQTnnWXIwbhKKXAZyVN3yzAQdQY+0lUQzYtHwjGlJtjFZ45H/1KWK6GAuvOY
         x5yGcmfGjt26ALuU5Qxy8V+rTkSs42WaSWndNM3rJvGGe0Ak1DEJpMR+Yz4ei8TM+Zgu
         iPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766224; x=1794371024;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRNZziqNeCRhg2/OKwe5SR/k0fV6elgIBlSt+p0bAm0=;
        b=B5l/wccchxxxiokApiczrC4ChaqcuvWBx2c0+j3ymRPLSarLSTydEZfjF/IpcmAd2G
         u4GUMMrhnLIUKOhOlWvISgVZdtvvewgMQw2oBRsb6y6ROHORzm5PRVRTAtepQSOEQwpE
         HdJUtuj2/qfQtLZqNFBz8OyCCYbbv6eoDwgujeY/hgGQyZtDM/AMmL2ljam9bRk+oX2m
         9wPtiu+FZsHHOB1HFvrQIWqjDizbvgWVzDyt47XJIM4+1FfeJhwulXmDvAP7f/Z5JZmy
         zsE5G8ExPb/3iejXAZ6BVDfKLCy+R6lglogdAqkR4sR5TeZf7Elg69reczqf3gLQZdCX
         zOfw==
X-Forwarded-Encrypted: i=1; AKwUvBye9lllDH2oi9gAeomkpzhlbnrIiCjk+lMtKTP+T5Npwx4E5icCA905XVIAXZtZRfG9X3zZVsea14irt7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p3rJmHK5dB5/G5oUzLbEQXKwOebZXPhY9zcl+eoRyVSSrMlKn
	eNEvKJbHfSEdLkaN1pf94tA5SSgD/wnIrq3nbrhIUwM9FojhzX7VI/nTq6RobOhrA+q/t2Ya3q5
	XqoHvHW2ap5zKrYhll6YLnARGSJs1Ic4uksY+9Rfc
X-Gm-Gg: AYBFou1p5hmQuKQ1ii1a7A7fwkI5tYIZMLYntxg3YLwaaffxG8Ut4qcimt5DX78cDAN
	rVFHFcZ4Law8gH07mJJjxgmPDUrYw1RVOYUuGARyVG/JqKfDkwfKb0hCnngNU2zb5t995lQLI5c
	g2gWxL6IEpgYPCwYzRnI9ZV/BNQ6E1FPnHDI8hhN53vbgmVgCAJitDHvC3hGG08QzmscC66ZynH
	vtYv4PIBSJNPQsfdFqfVUo9M29lw3tVNcoTtv7odkW8RaKvTZ4Z5ViQEseEVoJxUFJdw6jiSn6D
	0eYp4phPgpNJMNIgrI8T9/YvIvjkhKuOjMi9LAWBTBpPHJbbqNXtOV816VtipQlj6ghWYBZpi7O
	c6OYAYfBuUmyoHDQDLVRCk7UbCYsWzmvYOYWKUQ==
X-Received: by 2002:a05:622a:1b20:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-54b829d9c94mr3580391cf.12.1793766223068; Tue, 03 Nov 2026
 20:23:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025215508.1237480-1-irogers@google.com>
In-Reply-To: <20261025215508.1237480-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 20:23:28 -0800
X-Gm-Features: AclHuK-09ccaNUB_xQI1MlbkOynuoqVxYzBV14tH6-b6vEZf1TaXgfzq7UrUzCk
Message-ID: <CAP-5=fVsz3rX=T7_DAmdgDEK=LWGfSLr_7ZHJ8Z4-hehT035xQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] perf/core: Include attr.defer_output in is_sb_event()
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 2:55=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Events configured with attr.defer_output =3D 1 receive deferred callchain
> sideband records (PERF_RECORD_CALLCHAIN_DEFERRED) via perf_iterate_sb().
> Include attr->defer_output in is_sb_event() so that such events are
> attached to the sideband event list even when no other sideband flags
> (such as mmap or comm) are enabled on the event.
>
> Fixes: c69993ecdd4d ("perf: Support deferred user unwind")
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping. +Steve and Masami

Thanks,
Ian

> ---
>  kernel/events/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index c4217c996f5a..b43883a42566 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -5347,7 +5347,7 @@ static bool is_sb_event(struct perf_event *event)
>             attr->comm || attr->comm_exec ||
>             attr->task || attr->ksymbol ||
>             attr->context_switch || attr->text_poke ||
> -           attr->bpf_event)
> +           attr->bpf_event || attr->defer_output)
>                 return true;
>
>         return false;
> --
> 2.56.0.307.g5fe7bd680c-goog
>
