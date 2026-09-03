Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59014F473D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455115; cv=pass; b=Rat0SJGfbGvTDn0HOzWXBf6nfSTnrgPUgKzLSj4C+mgAhiu7D2yb6toxFKQ83PSFcDBjEi2VxERkpj3nKqiFyMujo4bqk1WXm5C9kiHnjlFsKLJe6ngDFomq9/cbkp74MQgqid8VogYgQG7YGB3N8CJvzxlozrZTB9Bu9TgpQ2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455115; c=relaxed/simple;
	bh=vlfKr5IE2AmvXuvkQWF5CvLsiSzdxYhNi70EsyDI0Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMEmw5EgvNiB7FUSd7PEhAr9uJEUXvhuY2QQoPyenuOeFTqgavycSAIttsPJ+nMbIwKjpGXzSe5pLm03izrJpggVH9hBgAiFpSTDvfd/KtU/RGL5IZX8Ces4HGyePkrjPm/cUME5pxYACAS7SjVYtne7UwUQDIcDG+70z62GYJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tOM80uqq; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tOM80uqq"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so282281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788455113; cv=none;
        d=google.com; s=arc-20260327;
        b=sEAgBKJ4Ja8aWruhhHuBApH7ocCQHjLMw7y/ZpDlnt3AQg/Xxz8jHOlYuJlJZQV9na
         M2l7t/soDwzCwskPhSJiz0OMyM1NTnxDKm/mDIIOBIUWvdV2PpFU88x68ndOoMAVXkug
         yoI5Tq9/+btPP5w0Ahxqd7NNra/mfUjcJ2+bx+xBzKB7UCGk3uwI3/P6AI5oL1qa1gDV
         P43rce/tmgd/7xSRy68jFscE1k3TSKZnjFoArUcklQtY4ykwQNrpaGCLfX4Lv9SXUfl/
         gbf4BCifdCbJ2Y8J9R4g6Gkei9M+TGXwnn3SfV5huBRz1XUTDukeA0oXousvKvxCz9Zm
         YRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TVZ6SKklgIyu/7/uPgJ03I/Ha/dghJOvVylq8CQpLeQ=;
        fh=bVqo72A+XzogI9S33rpCAl49NJxmLT7GyRy0HADKHis=;
        b=r/lyVUuQdZ7OGnZ3vBcgzOU36XCPNlACZhtXmnQ4CC4iQ6byJ7BRYj044Ey2O6uiDR
         p3L4UvuYWG7kRo+XrsJw5d5LmaeGiAKmTaIaHWqOm3bN31rmLRLPx3mIn5wdwF8yM2Ax
         +tcqSrau4XaB3AfcCYaI//WPrfqW4sOXrZlTDsYLAUlii65YBOcfivU0Gdlev8Ou4TSZ
         ZSJ0k8viAl4B7mRUlaRgMMASZiPXsWlXU6T3oimZw18jwl8AxKP4TPX3+kdHWhTbWwiW
         tq3l34i4nHT++BSbtk8UuiZfB2LitjwpzBTkrJaPHmdqj1w9Q4GPWFY2hoSiaHGRMlV5
         +7GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788455113; x=1789059913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TVZ6SKklgIyu/7/uPgJ03I/Ha/dghJOvVylq8CQpLeQ=;
        b=tOM80uqq9p0+LHDAYKeRoMBBa6+l7BjvtD6ErlmtC/1TePtjSvOOQ0z5u+QUBht25U
         ut1Agc+ROWv9Fg4qYZG6jCduL7MDpYUrkyBcWGyjyD/3IcekNeB/3ddxiA++VbCc5CDC
         U6DFiTAGavGzu+HTkhgFLbrPH1do6gEFOwDJMOSsVM0K9ZofH+guIMq5MA9vO4nrFwsf
         HHHR6c4343RPQngxLAeRuo3t09MZbVrlTJzI0n10WKeXLsWKqFXMwpE8p/Bt6pc9wDX+
         ugGYF9ZMwSLggzNTHHBBAirBHNdj32CsIuZsJV0VNGeIp3dOCmPaYU2arQilXbnGwbc0
         feiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455113; x=1789059913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVZ6SKklgIyu/7/uPgJ03I/Ha/dghJOvVylq8CQpLeQ=;
        b=GeOMEeLDR/JPhE82QszphSuPD6JjCDtbMa/OAhBcA21f4fHCrCTZz67Fi5gUOMIXZ1
         5oYCMEtOKR+V1akboSI+gJKgJ238ZY45IoKTWt8ekO0hsuVaE25pGEgLa2dkkdQ2xuVa
         6sPCDAJQlryrUD+74dmzrw73A/DxqvzVngYHNfNftdX+chBrwyWH6V4QF3SROGAheABw
         t2anEO21rgkX8hsaa2MP/C9JhbznwZbhxMsLknYzPwiWKWg+CrCQ/2VEIhm1aNA2qA4y
         ipNIvmla3yapdzO0neb9CdStY7CqAi053hrdQJRXhEMB9bFkHHSyELUwTTssaUYRz0RF
         soKw==
X-Forwarded-Encrypted: i=1; AKwUvBxRHz5qUWbGrmXCglViJm+UHtdHGgYnCZFdGrHQ8mLETn2MjLrwZ0Fzz7UL49AX4G8MepOzu5A0vHdR4Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++l2PTgUWzsRB0WlGMpo7bwSMfMNmgdIxBd6L+eY1rMyZA23fdvl
	3IDJH+6/kXETfrvvrnpS6BV476jB8em3E1kDsUZgIA/q8gfrpHBp2WndFdPnml3+tLvD5A9D/ke
	DoVF3KiThM1L0WIm8pWQFfSmEgdXmxij5FHtvLKZG
X-Gm-Gg: AYBFou018UgDfN+lxex+WGLObzcN84fa/sbzilL/QHWqZ0Kw4ANwTdy7t77Ux77C9pP
	ZDC6JUNbWaCqjyJ8vgMMVLqx4HhwEbuowd6DiGdS4IypryX4Tucg+cd0wx4SyTdb5hPRegbAWeJ
	yzdX8uQ3SvFgQGQCabd0Qg+JSsgHWL7AK2IzZJYRtK5XtakWzYQNBZlKzTvLsafEeZTCVCmYLiu
	NFTW0SaNsOxKXO25VnljRQOGGSGrmAr8Jeq5Rchcxf7i7jigDs6H5vypZZDombWpt5dDubKB8Gm
	bX8vj/no8Gp1cCv6SCpHgRYZx8qQnaJo7bOsdrvTL+yoPlS56MU9D6C7qZdO6nv44mPlB4BsFg=
	=
X-Received: by 2002:a05:622a:4d92:b0:530:2d11:3e60 with SMTP id
 d75a77b69052e-53045849e54mr19391961cf.5.1788455111801; Thu, 03 Sep 2026
 10:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903132251.237029-1-acme@kernel.org> <20260903132251.237029-4-acme@kernel.org>
In-Reply-To: <20260903132251.237029-4-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Sep 2026 10:05:00 -0700
X-Gm-Features: AcwNN1WB6xM_NdmEDMnNnGegUJPuOH6fOdzT6FDe_1g-Nf4qfRoHyuVKpGMTrHc
Message-ID: <CAP-5=fUsp9w-AUQw3jLnS_rnGiJn42yqw4OCiJ_NBz_JeTv8oQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] perf jitdump: Free unwinding data even when
 eh_frame_hdr_size is zero
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	sashiko-bot <sashiko-bot@kernel.org>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:23=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> jit_repipe_code_load() only cleared the unwinding state when both
> unwinding_data and eh_frame_hdr_size were set.  When a record carries
> unwinding data but eh_frame_hdr_size is 0, the cleanup condition fails
> and the unwinding state persists in jd, being applied to all subsequent
> JIT_CODE_LOAD and JIT_CODE_MOVE records, duplicating unwinding sections
> in the generated ELF files and inflating their event->mmap2.len.
>
> The record is validated upstream so eh_frame_hdr_size <=3D unwinding_size
> always holds.  Free the unwinding data based on the data pointer alone.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Cc: Stephane Eranian <eranian@google.com>
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/jitdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
> index e0d5cc9a828189a2..efb40d93e33ae664 100644
> --- a/tools/perf/util/jitdump.c
> +++ b/tools/perf/util/jitdump.c
> @@ -530,7 +530,7 @@ static int jit_repipe_code_load(struct jit_buf_desc *=
jd, union jr_entry *jr)
>                 jd->nr_debug_entries =3D 0;
>         }
>
> -       if (jd->unwinding_data && jd->eh_frame_hdr_size) {
> +       if (jd->unwinding_data) {
>                 zfree(&jd->unwinding_data);
>                 jd->eh_frame_hdr_size =3D 0;
>                 jd->unwinding_mapped_size =3D 0;
> --
> 2.55.0
>
