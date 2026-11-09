Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794250872;
	b=uBZMWEcfQzjOMVZK1JxRnNat941QpiP+gnUBCndS1uKvRvA/4c7sgBoug/OFek2hk9F6
	 TpcuX7642SrN8Z5FKWVCMuoGH9YSp6xakKt3mJoIDCaIruqs9yToB1pKcUXv9/IwVcwOL
	 wsS6dOq5Afj+SmeioZTHsGB4EBufndnvEgvGRpd3B6gyrLD1vjTRTET4QwghE0AYe2URK
	 orke4E9M3MUkG1ZYitHYEi0EAs3EuaEiK5Pz5YJ27Z3yywAIOlLTO44EEmDqHhj2yrtNu
	 rwfYcsfejtzOzxNkhQHJjLTIxgpOEpcBTTRNsyBvafFfHHY4jIa35cmKZrhPi55KiDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oViOagL2ARZ2knSY6KlnC+xBVU/YJBbiMnxoNmoki80=;
	b=PPnRp4gJQ2ro4IB0wO6tx35lqBgCkhhB9UtfcpML0o6yZ6pVZCBW4j28YofInqs8ncGV
	 NLqgOKb3+Jje36f4eiJ9Hk47HMMevlClFhq/GNjEErPoWxH59xusFf7lmrJumnS8LD8uI
	 GkepDKI98LNGXdTokzEo9HVTC9PDuspaYvF9D2Pwc5chNXYf16FDM7zwujybj+tp4Ibc1
	 5see7X/r40BDy5wKk5Yaj3Ivq3APtrDtQU9w8dXmd+iCBP4PuZKqenc2nbyFpteiyRZDX
	 ejW86BxQge3AaB2rrXVpf+iFofw/FycPiGQqpNiRM2nVd/aojsqctCAqKaA7A96rFOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jzi0ciBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jzi0ciBj
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d473cfff6so176284266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794250871; cv=none;
        d=google.com; s=arc-20260327;
        b=fr4YofoSM3kh4Svy3GbPoLn8uBnp9D5FIqEWNXzyKcvxh83Yy7Df2zKEKclTiHuAHZ
         9bJbW3lhOQy0nM4aHA3757Re0AjAmHzq8tQTZgpee3kyFgMS+eJGUKIUBATjVEkP+NEi
         WyKlOqPofnPzQW3wpIFphtT3XlJTkmbD0YG5412FEAArhFX9NcvKNQECUH5AIR4b0C8O
         Us8vDvVU2vcRTVX6pAo/S/ONj5MCEh5RMrbDeNVx0a3nAahVnd6F7Wb0CSTQEc7n7NFw
         aoCe4763rz7qPm355QdGlQTr3/iXDJsJvaG4DidbdXaN3I65P6Ynh/87rhZjzaZKZaQh
         pLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oViOagL2ARZ2knSY6KlnC+xBVU/YJBbiMnxoNmoki80=;
        fh=W1ln0LO9XAll5egE151ox0dC2ww9bhPzceiq9576gm8=;
        b=A0nVxX2mUoKxkdpE4wHXig+KyoEyn+zUYHvfd2AcHTcp6bkAYmzoTjyjZ37CURBBT2
         Yxgqu+KsHBhHuC6BdELOSChZTrW/qrTkjxGfMZXf7RbRFsWKvIg4hWxyQlubi9B0fEqG
         tyL9V0rGLRZNQ0x+1Fs1aWehon+8EJSiAIi4AcVvpCSshocIXen+9X4LRZ83gVfxoLOd
         eIFSlPRz/WFWF8Ihnq/pH6Ey7D41bh7WVMpjmkQwulv3cMFQzg5AfLMRkC2wegBnRUgf
         19YhqOzeWS2bbYLLqeUumF5PPq0RLqO2ipiYge5Si1Riflm4HZhJCgdVCWjMEeWA0/l5
         KEKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794250871; x=1794855671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oViOagL2ARZ2knSY6KlnC+xBVU/YJBbiMnxoNmoki80=;
        b=jzi0ciBjghjRkg5pAzrI0ojmRpaAYq8U+G7lTwFnefmPwMjEwT31nBsMHrraMdIN48
         h1jk5ocmP0AXkP33PXtlXEig/yLPesNff3wRQ5S31Kfz1G23tGecmh27o1BCz1BoMouX
         qVfgZRodtJKBqNzamsz8/CUPpy7KFt3oquP+Jgfu3yjTuXeyfA9Pjxe2ZWNK7SkdmBWY
         CGMWoegABV6JeaXHbc8WyX3D66Dp5Z9atRhiP7CEQrJEne2zC49aehY8trSxATFr15ov
         JqNoJac8PHdVHcqXIQYljR7pyXQUaOQe7l7f2YAOO5WWq2HOjClNe0ceGVCPAoqLWISo
         tE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250871; x=1794855671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oViOagL2ARZ2knSY6KlnC+xBVU/YJBbiMnxoNmoki80=;
        b=nAYcsp3IaAvUUOFetjmIrwv80c7oqD4VdeW1KLZOdVOMVpYt4LjVvHzcdSoLoBIC/5
         dlVKfqdG4iUqLKaN6hZbU471Cy+khWiex9v2vAxzVDgiFzxQLipNyVppNmsV2/X5KaKE
         tZiAxkX7WjUEmpNpzMFJZkloH+Qy5L3py3XdFlywLiR7aavKWV3VMl0UydCFeNCqXrqy
         /K+Etm4AFz22WbSAX3ztb8Xy08Qj1dzUMb6qryPOaHW+cOFdEHt0ddjbC4c2W/0J2859
         9BTbYw+6q/ExE+Rt+Ov3nH7CFXxQYm+P0Xn9XTBUw1qbYJiaFTHYJui+tM/iyFWvUmXE
         hi5g==
X-Forwarded-Encrypted: i=1; AL+hErHDGjrphijkz9FA/9Hn6SfYT3401LS2/rBe62RZVkaOpvbNHf6BuM4o5QjxRylMsx2mZoFhnFW5gXYyDVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5qwIhFk4jztlVbHS6iQ7gP3GkdED751e4mGAa2Cg6UOFYDZGE
	Y4artshod+zzHRc3wOjYKecUwEDii6KQQDPoCU9z2Xp/S7wgESI4RbZXN7KbAD3F8usa//iEHds
	aRzDCtaPqGJf0ZYop2qP8d9hiALNtsX/HS3EfcyPt
X-Gm-Gg: AYBFou1mAmoxcty1M5ChQ6vk9eNyT1q+9rf19nCmTq0awRJHO/4XxGUfvghBj/rIDTJ
	gmEvYNiAuMjogPc6c4ireYMY/32hutx8NcGBH4Rlb4+ol8gvsg1FpjYj3F9zzhZ+PTvrf//y7CS
	GGMfUKfMYa7DtZacmYwlJBby1rubhTwhLkhyiDMV/8HE2LxwFrGHwHB8NVzyU38FKji+JrSCHG4
	CVS+jpKJrOPxXFKFelD9txJAbRCBuZAY0BoUSqsTC820icJ0EHGektB6cGUJDF+etdT25xVEDOJ
	rlB6BRCi0AIfmR7/j45kcSN1d0YsyXIioKliIm2nJBFBWkKPb7AEgwuwhiUzXfaxA0AwvKusOvO
	vYOnPnw53ZIgsxJJH8iweW/I7kcfF00Tmrrq9Uf4tn4NssKy4XFHtU1ENt7hvxoRiGWmVOQ==
X-Received: by 2002:a17:906:ee86:b0:c42:5363:38dc with SMTP id
 a640c23a62f3a-c5049569a47mr22222466b.25.1794250870067; Mon, 09 Nov 2026
 11:01:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018081452.1014460-1-lalitmaganti@gmail.com>
In-Reply-To: <20261018081452.1014460-1-lalitmaganti@gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 9 Nov 2026 11:00:58 -0800
X-Gm-Features: AclHuK84cxOm-Fxk-JWgzwE7ADkWICNesE3jwY7PWhsZvhFOol869e0L2WP6QRQ
Message-ID: <CAG2KctpJogfGKwbXk0OUmawVR5o7EodACrk12Br9d4bis3wi_g@mail.gmail.com>
Subject: Re: [PATCH] perf python: Set up callchain parameters for sessions
To: Lalit Maganti <lalitmaganti@gmail.com>
Cc: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	james.clark@linaro.org, leo.yan@linux.dev, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 1:14=E2=80=AFAM Lalit Maganti <lalitmaganti@gmail.c=
om> wrote:
>
> perf.session never calls callchain_param_setup(), so callchains are
> resolved with callchain_param.record_mode left as CALLCHAIN_NONE rather
> than set from the sample type as in perf script and perf report.
>
> On arm64 this loses frames: when a sample hits a function before it has
> pushed its frame record, its caller is only in the link register, and
> recovering it needs record_mode CALLCHAIN_FP. Comparing the callchain of
> every sample with perf script, on a frame pointer recording of a
> two-thread workload on arm64, 4 of 4494 samples miss a frame, e.g.:
>
>   perf script: clock_gettime@plt <- now <- spin <- other_path
>   perf.session: clock_gettime@plt <- spin <- other_path
>
> Call callchain_param_setup() once the session is created and, as perf
> script does, again as attrs are processed, for pipe mode. With that,
> all callchains match perf script on arm64, for frame pointer and DWARF
> recordings, from a file or a pipe. On x86 they matched before and still
> do.
>
> Assisted-by: LLM
> Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>
> ---
>  tools/perf/util/python.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> index 60dbe2dad5eb..92d18e24049d 100644
> --- a/tools/perf/util/python.c
> +++ b/tools/perf/util/python.c
> @@ -4842,6 +4842,24 @@ static int __pyrf_session_tool__stat_round(const s=
truct perf_tool *tool,
>   */
>  static struct pyrf_session *pyrf_session__active;
>
> +/*
> + * In pipe mode attrs are only known once processed, so set up callchain=
s again,
> + * as perf script does.
> + */
> +static int pyrf_session__process_attr(const struct perf_tool *tool,
> +                                     union perf_event *event,
> +                                     struct evlist **pevlist)
> +{
> +       int err =3D perf_event__process_attr(tool, event, pevlist);
> +
> +       if (err)
> +               return err;
> +       callchain_param_setup(evlist__combined_sample_type(*pevlist),
> +                             perf_session__e_machine(evsel__session(evli=
st__last(*pevlist)),
> +                                                     /*e_flags=3D*/NULL)=
);
> +       return 0;
> +}
> +
>  static bool pyrf_session__check_not_busy(struct pyrf_session *psession)
>  {
>         if (pyrf_session__active =3D=3D psession &&
> @@ -5061,7 +5079,7 @@ static PyObject *pyrf_session__new(PyTypeObject *ty=
pe, PyObject *args, PyObject
>         psession->tool.ksymbol          =3D perf_event__process_ksymbol;
>         psession->tool.text_poke        =3D perf_event__process_text_poke=
;
>         psession->tool.build_id         =3D perf_event__process_build_id;
> -       psession->tool.attr             =3D perf_event__process_attr;
> +       psession->tool.attr             =3D pyrf_session__process_attr;
>         psession->tool.event_update     =3D perf_event__process_event_upd=
ate;
>         psession->tool.feature          =3D perf_event__process_feature;
>  #ifdef HAVE_LIBTRACEEVENT
> @@ -5139,6 +5157,8 @@ static PyObject *pyrf_session__new(PyTypeObject *ty=
pe, PyObject *args, PyObject
>                 PyErr_SetString(PyExc_OSError, "perf: symbol__init failed=
");
>                 goto err_out;
>         }
> +       callchain_param_setup(evlist__combined_sample_type(session->evlis=
t),
> +                             perf_session__e_machine(session, /*e_flags=
=3D*/NULL));
>         if (psession->symfs && !symbol_conf.symfs[0])
>                 zfree(&psession->symfs);
>
>
> base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
> --
> 2.56.0
>

I think we can add:
Fixes: 88439191ad5e ("perf python: Add callchain support")

But otherwise, looks good to me. I did a quick test on next-20261109
with an ARM64 Pixel device using a workload whose hot path has a leaf
function without a frame record, and got the expected results.

Reviewed-by: Samuel Wu <wusamuel@google.com>
Tested-by: Samuel Wu <wusamuel@google.com>
