Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373968;
	b=ZldHcWlerJdhWyPTvSReR6csikkie88qDdJ3ZXLJnqlGTQByJBe7cxb5FS9HJeJ7lJpB
	 w6127K3vo3mierdet4zH/Zj2wLhKcOsBIKLg9KgmJpfvGpBsq7DSSOqV4GCgW4WzbYJoD
	 BfYM67To1ns/bLMc9d8e0QHUqWDWp0by7vmIbF1Ux+txJwHghpJIeNWANHFWbFoyhoEpl
	 nsJ5f6PqWCVR9GST/6SJsBx86xoteCvhPihjDIjZdEGjJQg3oHCEO4/Qmam6GUcg8pl3t
	 RFMP1bPtfPv3EeQ0VZt2ZhjIQ1AIrXDNRkYcj9zMSXUDIEg4UOtqst/xvhxaxnEMH8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8eskYuPqODoDNuy2RAjCMQwnvWJ8H7RTSHlA9+ib0kw=;
	b=kwOj/3Ao+W465MZKsewwACDOByVq8Nx8dKZ9tfKwdPXTUWLfoBGX+aE5sPg2sSaqC3Wa
	 h32YVQYb+l9LvgrNRqemh8CgmyUfIEzM4dGHnZWcBBTNChGa5DHgEzvUjPKPKU61g6lHZ
	 842lpAOI2K6oq1Up3iLurdHAPEL2em6dlnD2wyI/MYZ/8dLjDDKCz09JVPMnT97YLO3Bh
	 UTm5R026TJDPko92LfJELfQQBKDkmz1SWa3DMzxyCaG/8SkkMW5if88E0ayFOw1rcimDW
	 wtRICiRs8sxX0vOoIyVUJP48ju+jMawUqWPZY369VvEWzOxi7M7NaTBNWleO3yjyWdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I2uqagz2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C464606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C464606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I2uqagz2
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so364921cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793373967; cv=none;
        d=google.com; s=arc-20260327;
        b=fPHfacp7PFUR4MkQs9PVesnRohqfJl7HfntjerG4ZYJjpw814yMkRn+rbienDrYPZn
         ZVibAy6OKAmanDVtk1hhlvMA6Aj4EqjO8LjLns6xnvmVyDnDW/73HTRV2ERzKJi+mSW7
         J3Ce0rqOIBq7tVolk3Y7Gf3IcJVUzqnUoYOC4H1Zka7jtKrFaOl9Ybt6x8omJ1+YphGK
         +afoN12GsZPv+IjD7MMnzb9p9+6ftWn87DP1fT78j+rMjCbH/pH0Q7LKo55ggQeRVlSh
         8Tdg64Mmnh2nXe4wB1hQoBwIFnJGEouYAG+AxFIlmb9i7xOzraqkMfnh5lU8249IHHOl
         FsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8eskYuPqODoDNuy2RAjCMQwnvWJ8H7RTSHlA9+ib0kw=;
        fh=onFFtjeDY2Zh+4idaMjIGrq127nUaBHprl5UxeMmyfs=;
        b=HIloATXTQOpsFLlqN2c0ZzarFhAFnvof4yVld+RxwigvUlkiABD8yGEP4mI4+DEx1+
         Q8A+YObe51iI2NRi8RhxdVRg4Q7URVotaZVxsUnws+EN1WWFZsoTTxddTGQmqQUDuf0A
         SRqMFmhcsPawIgdTC94KF37iDtweGB8RNe5vGZWV5E+M5ikbDssmbspf2p5brJaPl5Y1
         Tki68yB2OkkDZAYL2fXRkhwqum290FXbIgZ34GQhxLBgT1XegOfncnv/9x4yU2BiYT0O
         skmq/w5zNT2Jr/Rr5XZ49OKrEAO+RTltdaYZlIuTy/1uz3i81Fd/UnMDuA3CX/bRyE99
         Q/fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793373967; x=1793978767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8eskYuPqODoDNuy2RAjCMQwnvWJ8H7RTSHlA9+ib0kw=;
        b=I2uqagz20O2y0ikxY4OxrjVr3WXK+CegAO55W2FmQTDZn3dv4Qjwi3YlPs5nmSZMyi
         73Wz0mUEotP8ACKmF4UgBYyZabHYNxYNLcTidE01SXd6Jqp6/sANtDbhgjVzOcVno4su
         OWxbfzxVK+ZlbkyiLJJ+tD0QgtlO2ES4YXopIs3rdaAYZa3hE36uriPne1mvfJ1j5d8N
         5Yj/3VYOQgcJ07O22UXEdokmgabm8dFUKMx6H85tEPJ5UVjwawydHpyb+6fpgZ+7g3WV
         ytfBrtK/7tXYmUVDpNYy8rdYrdxmyytByCg3+ehestKvhEkOUjuSjkCJCPzDAMTBsC4T
         siKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373967; x=1793978767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eskYuPqODoDNuy2RAjCMQwnvWJ8H7RTSHlA9+ib0kw=;
        b=YaBUdpCjBH/cGPWqY4faGieYZ921l+vyHL5FZjmwg/FK9uz45+w1wrP1wzpdSmNOYA
         0wwbPyPcA7QAWXTh7JfQUK0Ya1EtkDt1DJ8Mb5J7QL5BBxcpApNqlPdKgnIy3Ei2lgMM
         LIrlKSgyIM9SKaLAQ1RFFZl31Qs68uAT4FBwC4Z8n1KgP4kw+XNhyxmqewAtQ0wZq7sM
         5tyNzDFeTsWK48PqWzM2Qg398JcykgFuN+Lnag5UG4w5YzBxvjdEGJ/ulaWL39bnDDsZ
         lSMD5Bzo+bQYzeTfRWGRuqjZcv4tdZ9RvhoLPD2/HkXrt1iK0LCcEAP34yzTPfrkn2xU
         nKQg==
X-Forwarded-Encrypted: i=1; AKwUvBzR56j/ONP5rezbYwzh0p2m/oY2Nh8iQee16e8GuRAfDHypjVEc2RPB/1qiZSE3JBnViUURbj8NV72n84w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoSGUiESbtYKeJNDGtUO47g32G5RlAygP8nRquXi314bA69fgy
	H3dHZAZYAh3tJIIU3wvTsaO1HU3ZgY01np6WjxH1e6HSJkmUH5nnvi8cJ62rbEV6XGd2pW7J6/S
	uL+wt490etAQOTseaC4WsGdR85I+/OEKZE/WzOxOB
X-Gm-Gg: AYBFou3Y98/XdTSbcus0kJ4CKb5AaBpTAQ0WQDNZTAV2QuxT7vNgstCCbi9S0OmNE7J
	Mr/LYQlGaU5EbscYV4pCoNTt6AeDooWWOkrFcFZ1r2WBfmwy4WsWi0RxR8/gYvqoc0y3pqmK1zH
	InjczgZAiZk6c6EnFrvUqZiiAjJRmbk6QxfvcL7Yc/kYW7jupPFQCJjtzLR3H5ipMZaYcFA/uZg
	YPraNOzVEKqu9sIy2nv+/PV95Z0KSOWofwa9tsm/7OyeSfH0Z9cnHrGMfwNrCxu5OVhfOq/qkm1
	OgOicdIljnPQISE4ftVB7wpzJPxF6oPqKV/ZVT+fEnOXTkwG9Sro8lVbCJHv/+g5yReP7NVMGWe
	YgP8B2418yYeCI5n/c/ieRVoBZmZBNfCHoUopc07stT2Ktp0N8tBpQsdIHLSAEhHp6klp
X-Received: by 2002:a05:622a:400d:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5412d80f80bmr42530261cf.5.1793373966380; Fri, 30 Oct 2026
 08:26:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com> <20261028-perf-symbol-memory-send-v6-2-7e90415f0101@uber.com>
In-Reply-To: <20261028-perf-symbol-memory-send-v6-2-7e90415f0101@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 08:25:54 -0700
X-Gm-Features: AclHuK_KiufgJUQSaxd3tfd6fQpijRSFFUdjGxHrq4Nt9wDMcaxFsk8JN9DpE0Q
Message-ID: <CAP-5=fWX6xN_0=-fJ9_v4vsTkUEgLLYYUN5KhTwNH19nRM0DYQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] perf symbols: Split out name-independent duplicate
 symbol selection
To: haghdoost@uber.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:42=E2=80=AFPM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> From: Alireza Haghdoost <haghdoost@uber.com>
>
> This patch is a refactoring and does not change behavior. It moves the
> size, type and binding checks from choose_best_symbol() to
> choose_best_symbol_by_attrs(). It also adds symbol__choice_needs_names()
> to report whether choosing between two symbols requires their names.
>
> symbols__fixup_duplicate() keeps one of the symbols that share a start
> address. It compares size, type and binding first. If those attributes
> are equal, it compares leading underscores, name lengths and the result
> of arch__choose_best_symbol().
>
> An unresolved lazy symbol stores a file offset instead of a name
> pointer. Thus, the lazy loader cannot call choose_best_symbol() until it
> loads both names. The new helper lets the loader keep the names
> unresolved when the attributes select a winner. It loads names only when
> the attributes are equal and duplicate selection needs them.
>
> Signed-off-by: Alireza Haghdoost <haghdoost@uber.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Generally I think attr/attribute means perf_event_attr in the code,
but I lack naming abilitites, so it works for me.

Thanks,
Ian

> ---
>  tools/perf/util/symbol.c | 26 ++++++++++++++++++++++++--
>  tools/perf/util/symbol.h |  1 +
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index b61a574ce9a3..2d611c05d000 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -157,11 +157,15 @@ int __weak arch__choose_best_symbol(struct symbol *=
syma,
>         return SYMBOL_A;
>  }
>
> -static int choose_best_symbol(struct symbol *syma, struct symbol *symb)
> +/*
> + * Choose between two symbols at the same address by size, type and bind=
ing.
> + * Returns SYMBOL_A or SYMBOL_B, or -1 if only their names can decide.
> + */
> +static int choose_best_symbol_by_attrs(const struct symbol *syma,
> +                                      const struct symbol *symb)
>  {
>         s64 a;
>         s64 b;
> -       size_t na, nb;
>
>         /* Prefer a symbol with non zero length */
>         a =3D syma->end - syma->start;
> @@ -194,6 +198,24 @@ static int choose_best_symbol(struct symbol *syma, s=
truct symbol *symb)
>         if (b && !a)
>                 return SYMBOL_B;
>
> +       return -1;
> +}
> +
> +bool symbol__choice_needs_names(const struct symbol *syma, const struct =
symbol *symb)
> +{
> +       return choose_best_symbol_by_attrs(syma, symb) < 0;
> +}
> +
> +static int choose_best_symbol(struct symbol *syma, struct symbol *symb)
> +{
> +       int ret =3D choose_best_symbol_by_attrs(syma, symb);
> +       s64 a;
> +       s64 b;
> +       size_t na, nb;
> +
> +       if (ret >=3D 0)
> +               return ret;
> +
>         /* Prefer a symbol with less underscores */
>         a =3D prefix_underscores_count(syma->name);
>         b =3D prefix_underscores_count(symb->name);
> diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
> index 46b1649c64fc..d8386c4a7fc5 100644
> --- a/tools/perf/util/symbol.h
> +++ b/tools/perf/util/symbol.h
> @@ -303,6 +303,7 @@ int arch__compare_symbol_names(const char *namea, con=
st char *nameb);
>  int arch__compare_symbol_names_n(const char *namea, const char *nameb,
>                                  unsigned int n);
>  int arch__choose_best_symbol(struct symbol *syma, struct symbol *symb);
> +bool symbol__choice_needs_names(const struct symbol *syma, const struct =
symbol *symb);
>
>  enum symbol_tag_include {
>         SYMBOL_TAG_INCLUDE__NONE =3D 0,
>
> --
> Git-157)
>
>
