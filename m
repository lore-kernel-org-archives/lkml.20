Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794779905;
	b=FfFYluExDzkqQc4PqDiqwYNI1msIR7FhAsXbtroeTwhrXz27rP8qtfLqHp7bkYicitnW
	 NzvQ7H/Y7LNiClQCHc0DqAqSKAKhK+O/IQgyVEdAwXFcMhDsSP+xZ5ToDB+tAAEtHG2wR
	 al0QDi8z0GYXdoewmjVn2guaBKqgoJWt6MblfN+rnh0RP0ZYnVuixQeUAIXYhco6ISs0s
	 e1tFi9xWf7mqB773TOWSP2JMANP+bws1tKuovHiuGfp38uFjFiu0t0pgO7+wrSVn0UPwL
	 usB/qk0pQCgXsgCCoUcqWfZy7tbqlTIt+gXsZjDDJq8Zav1oc85xt/6l1kEArYEVmww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+T++C8/Le21U95CJVDo3LG6rDxqw06NJjus3xkKM//U=;
	b=t57XHoIMFnZwn5uSsGUEVn6GoZzGfqA1X5ORBt6a+QBs3B6mqOkUdeWn3gbpUIYYSTkg
	 0PtT+NnVWpkOdDVgj0uCoeLeRVGmMuHlq2gTpFveiJC5HRxJ0sosR/E9EWtaUSgfREdMI
	 a/0zlhNwtazPeA/ofPtyzpevl0P+hBCuiUroHhiHzwpbIqIpqdeZMwHf2F5tSjITsFf7X
	 rxK888pbkCPeheuUW2pAFQFG0gQAFktubaXM3EcysX3LMiAgsjGpp8WrW9mICvIiux0ne
	 5k0lf3rr5NErGnmyRaF4hPPgB+kIzikNr152NXa231AiXkuh57EHLA14G3DvY2S2Hwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0kC65AC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D72606A337
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D72606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0kC65AC
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so200871cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794779904; cv=none;
        d=google.com; s=arc-20260327;
        b=LAUG66ywme6boXK9cVNMHXWaxUjNwm6haV5CG0fSNCNS395klCFasWAVLIKtxNTCXs
         Y1fUaqTAaFvAD2qbTGLzWDGcYULq9MmGQDmmlOMj3ZDp//CcAMqnc3BqGmkyTm4Wk5BH
         de+KSQoDlgGKuaxb63c5jn2lZoT4R9p6gjlMKixd+2xN6hwtpUov3qIuHfl2yxR1DqkC
         27lycNVgfNxcCRBOGZesPjC6k3DbEdhPb/To9RvaHbhRtRkagdg1PuOPeiLkOUKkMIgP
         7++F8146N1MkogmjTl24qeJpYV9jCGiLh88JkESIbqx6VyRKQdlAAoJakkOOz6bDsi05
         qVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+T++C8/Le21U95CJVDo3LG6rDxqw06NJjus3xkKM//U=;
        fh=ytLKlJqAh7w1mR0uf/vEesrVumNc3TT72cDq8yykyfI=;
        b=SELNCBDp8ohBTheh54Ta8C+jT+pIEkL/vw4I8zcU6EV4lfKp94uBUcheZfZtSM7Azc
         YVFqywGsDV0VNuaiOxhvO3W/dxPaF6dHgE2jSJonhM5YvEXYiQb7HTTyNlWP/ACa90RQ
         pTAug3eqgTk/tPlRFWY/LJ8ucZ572uAVXOYRFoPgV3M8luDMb3YMvYEb0iCBbIdzhFH5
         QovamTVe7TpFcB6D6kgudM9sfYesSW2wc2djAwu9SjEoQ3fkWa6mLAfkvL6CQD7VzZY/
         drvjiM1ZfMvU2+21oQ6n1RtUIyaAsyh8mA29407CrpWSD6bzRYGpRWCvSSgIev49WidQ
         E4IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794779904; x=1795384704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+T++C8/Le21U95CJVDo3LG6rDxqw06NJjus3xkKM//U=;
        b=b0kC65ACz9WrilvFFKo7Vtu1BTzxe71GggS7rjoyDbNYO8DZZ93vwxJSZ6oZy551D+
         EUyx2l/u3N+Q362VuIjgqvzKKrrLkixb8z8k9F+rKQpV1pQhON5lTaYHmikQGrrwJBjy
         7QCnZMz4WeVPAQtQLR+Jm3mWc6Up1F17VuQOl218OWKFYkSw4jLPUhyVPnFG2A2FwKbj
         pD6wqe47h1eU4CYzEo7h38xUOEhg1dzDc7oJzaz7dvgEyyW4YjCKx/l4TrOTcKB2Xi1u
         R/nrGJImRQlJg2PaErvJQ8/30+ErjZzJJ+sHlVgsHSr1IyJ+5FAgXhf5Yxw7/rN5OOtR
         vamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779904; x=1795384704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+T++C8/Le21U95CJVDo3LG6rDxqw06NJjus3xkKM//U=;
        b=lvWdFS9NWxSVhHTNKnLU03609Cgkyc0Jb97c8Llqaizoj12jBo7k30W8m4ylyex709
         /SoW63uy3z9WADaD9jwegAwFdW1SJae5xxh+P1QrfoZ4L02nkmqSWmNcl0e89CH5Mybl
         PiaewaPM6WOVrtI+Yha5O9bCbKZZpg3i0P+ezdQ7HTrPHAn2YtQEPNM1r0h+rPF51Q3J
         +g/GrMddbi81wjk3Uk4GWdOy+yHS5OqQA6QC5/xh7OpdCVUW44pppzp/9GsK2R94mo2J
         U0M5v9+i+ORG5XlVxsYK6cA0XPTaUC75J5IUiQPVKTZXwXVF6NYunoJ/I/N79oo/vKRs
         5wTg==
X-Forwarded-Encrypted: i=1; AL+hErFytVviXncbRpXiQvMpHLajzaBW2KpavHiBm6Cw+MJTJApIBKe1Vi4xfvVCGaXlBz/0PRdbtIcyCs7KcVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z++MEfOwvjLeJwg9SD26Oe9KfyyyX8GMLDwusIjjTBqTYFigFCv
	0XZdEpcvOd4V0e5Gxxklj9Wae0X1w3SGJYzGeKcaKQx53pdJBA75v4b1OIRdpVPbRaf6engxEUH
	Z2SHvCWOtUbx1SqwVEfdAzHjPzGJwZIyg0yrlavZe
X-Gm-Gg: AYBFou2l1np/TVz8a0KGEb6NveU1CXw85LfnvwG0lmK1y7wcRxAyIOtH7M0cbBbk73e
	mIlOWgz90ZNd1wJQUEDU6oPl2FaTCpwHNndJdylYgdgurFrax/Mp706EEn4J96OI8m2mo3Hn64g
	mFnMnA76TPk1GOk4Zs2sD81DTQ/3HrJrq1at66y+6d2Zn1tVZpK7kflMO4Pzjd/byjHEEsDfxJV
	yOsJgzuskv9RazveK4j3gwJjutT0REUZ8/qPUbO2Nc+4YlmgqD30qX8ZxPapqVakM3xxygPAQSp
	8/irs4nvaI8VL52SHWjLBibcDiMx/9HnXORPBdeHuWrBEuQqOcNGmLs6RkKLSbOZ8wdZsa/nw3c
	oLaJ7gf0SnXcKetOLt4BXPqsNbmguvvBZK0NS
X-Received: by 2002:ac8:6908:0:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55c67fb2932mr26884471cf.12.1794779903529; Sun, 15 Nov 2026
 13:58:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115014102.2879372-1-acme@kernel.org> <20261115014102.2879372-13-acme@kernel.org>
In-Reply-To: <20261115014102.2879372-13-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 13:58:12 -0800
X-Gm-Features: AclHuK8OXB8NJ9-NAD6M7-X6jeEmjE9CNS0p7XpfdI_YYAbd_rSTJBm9F82s3Uw
Message-ID: <CAP-5=fUmNrya+vyzCVWVknQnHtphdnJt6itYBkWnkY-M_jh55Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] perf test: Skip the LBR inline unwinding check
 when unsupported
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
> The check only looks for the PMU's caps/branches file before recording
> with --call-graph lbr.  AMD BRS advertises branches but only samples its
> own retired branches event, so the record with cycles is rejected and
> the test fails instead of skipping.
>
> Probe the record and skip when it fails, as the branch stack test does.
>
> Fixes: 446c595dc0dd ("perf test addr2line_inlines: Ensure inline informat=
ion shows on LBR leaves")
> Cc: Ian Rogers <irogers@google.com>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/addr2line_inlines.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/addr2line_inlines.sh b/tools/perf/tes=
ts/shell/addr2line_inlines.sh
> index e8754ef2d7f21ac2..6fe47909dae4f812 100755
> --- a/tools/perf/tests/shell/addr2line_inlines.sh
> +++ b/tools/perf/tests/shell/addr2line_inlines.sh
> @@ -71,7 +71,14 @@ test_lbr() {
>      fi
>
>      # Record data. Currently only dwarf callchains support inlined funct=
ions.
> -    perf record --call-graph lbr -e cycles:u -o "${perf_data}" -- perf t=
est -w inlineloop 1
> +    # Some PMUs advertise branches but reject branch sampling for cycles=
, e.g.
> +    # AMD BRS, which only samples its own retired branches event.
> +    if ! perf record --call-graph lbr -e cycles:u -o "${perf_data}" -- \
> +            perf test -w inlineloop 1 2>/dev/null
> +    then
> +        echo "Skip: LBR not supported by the PMU"
> +        return
> +    fi
>
>      # Check output with inline (default) and srcline
>      perf script -i "${perf_data}" --fields +srcline > "${perf_script_txt=
}"
> --
> 2.56.0
>
