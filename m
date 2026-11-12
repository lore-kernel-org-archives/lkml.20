Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794504474;
	b=qYlAXNMnR8Sg1Kc7KVs5xhj3dy8hf2kWbSQ6CNu74gROR9RSwXXueJGEu+xHNET14C2R
	 e/36RsO42xZx0DCV3+NCZRUj5BIUhrkV1IQkGfH2EqCcAHyJQqqxBfQRn3gHZFAxA7lV6
	 A0qDQbI18skuFQ5+TXlVXHN+IaJPvT6xBEAnI3VErAM+mChSY90PklHpqbHj+9uCrJ2TN
	 3BwII6ugRn6IEdCyGC477CPCMlUL9nRsGynPINBUHjhAIru7k7iGKwD0w/wRXHek+6aa2
	 SGfzWpSXms6q3AIW1scDECj7jsC4QCdkUdXZhiuBvNRPRQuP95XGMRq+RVRai5ckW2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tnEBsHT4IjNIGwKYMp6J71ouLD/igopL/CMnmWxkUMg=;
	b=TeI4/+8k2oYRNySKxITPvLolXlpGwGMfyKf/LZS/ac63Bf2FshmeXsCU+/BFp5tk7vAI
	 nBcfMNxkHcceYB/3f51+q6j8NJBWrR29i6hlfO/RzdE6sEu4GjrcFLHEW+sOBJEWsRPBS
	 OY/Toq9WCJ4atVptvqdTyUYdSj4CozjQlzV3O7b+ajapi/sPIiCxEE4rom8PrFwMEf/42
	 v+RuH5jgpYSvWC7gECR1Lzh+R/tT3B8Z6C5AkhfzENDSPIdknq8ZvrGGmimbnzuGNxdpN
	 YGWIcNCF25MwGxFk8YkzjlrSnUYftuBDO4NSEY14gwBv1u3CmiKWsXwCPtqdeQNIqIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FqAASTUF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE1606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDE1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FqAASTUF
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5383c97c8cfso308951cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794504472; cv=none;
        d=google.com; s=arc-20260327;
        b=GRpCFnIgHtvhiJZFYKlQaTsxFt36hNNrx8VPQaINvcAnFPwJCgICnSv+xsOH2XXBpj
         shZYLw32eFUKZxFtyrCMsmeVhdGQBGJARMx3BOhu/W4SYwCUbbp0UTDWAqKKEEzmz7m2
         MQJ6KyK85MctFkeQTr94d8ssg5P87m5zevcqzPhkKpNwI3/skb/VPf9kOhIqeYR6hPeN
         mmFYYX0+CgHmStdRtw0mzZtLiIBT7Osq40DtcnzHx9PBku1qPcffqeabcZdnz2JCvyxK
         whjqr6DpklzrvlXFdrI6u5i+zHG3F2D77wJY48KcEjHgipKtBluGfu995KPhe0zpXLxY
         dAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tnEBsHT4IjNIGwKYMp6J71ouLD/igopL/CMnmWxkUMg=;
        fh=B7NbaOgKjQgJ0fHi30ZHg1Sc2KgE+Yi0x9j3nu3+ov8=;
        b=Paey7L6ifeGjR0cRgxguM6oZawzy8oci9h60U5L1z9dOP6yaKNDyw5Q1lm+eMbyySK
         bJ4SAqKaly8ejhPKvHw7QIy9/cQAu9cxQR6cErblEc2e14RqnQq5RnvEJV9COzY1G/At
         Wt53hizJCdMP4hKiCkCjq8OtiW2ARdg/fkwy8sf5HroD2Fe+kalnxNfv258hLjAjIqry
         2XvCYMjd3l9OwicWmaULceXVebTFRg9BDxbDb2z6Ks5Oj4MzJD9Y0nK07zJLP+/8guan
         cKNkoEvXtOp7djYs8lApMdbVSlMG7KaS4kktOtv/Um8KOeE7LuAsXB62ykdBlw8XDd9z
         Lf+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794504472; x=1795109272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tnEBsHT4IjNIGwKYMp6J71ouLD/igopL/CMnmWxkUMg=;
        b=FqAASTUFGvknZLR6tuZ/VK4egBfwFeb/AEzFa6yq7NhRIKmaSaP45Z3Kj5i1z4SooR
         Sr1H9+GlvCMpk/E4V7VdaPm3GWD2/9WnaXWpx2qFt/rrjThVkpI2zDx8dA+OTj+3Bd9p
         qX7x8uYfvZ6pyoOs7+ereJnbFBaiOyZuA4w01rZ/aC+FxLPxH+oW305x2FrT3xhr99Bf
         uOvXmh8EH2l72ncv4p6NHeGQlAu/D9M55DDiCdlHopRPPiqOK3VGoI+qdgMty8fTJcDN
         InCC9+ANEqQChkQT5MNiyQzRJqVPSc637bJTfWeH5cF6NmJAaw3f+pjzlziSEfXQiOPJ
         l62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504472; x=1795109272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnEBsHT4IjNIGwKYMp6J71ouLD/igopL/CMnmWxkUMg=;
        b=rm3kCIxgCbIfvznmNyu4hvFCf0RRez7rPUiZqfshFQDfqRke6zgFJChITxnqSk/xHg
         lrRSEZfWhQLjc2yXOjnMeRqvnBk2j2w+1N55SZXnXUFFMTl7NGgi7NuyQLJRyoY3qq98
         y8BO/de7yhhPnpNpiNbqdwNqTqRUYze3XvpESaG2fvnQR8it57gE935kI5N8SLBen8xA
         zly7dAucS8aTkQGop5/HecDizsM5WeHo61cp7/FgqgyHoLCdSW1Skg/LTn9+f/0nTPti
         nGKIbvH/yvvxe5gky0sGX9LMYaUyA+dbOhgmUFSIg3gfG7jO7J5Rhc088Vho8FqXHj9w
         RKJQ==
X-Forwarded-Encrypted: i=1; AL+hErHw+enXfbOEfig6GgkjgvtF8lpLyZgSzQrky4YAsQ7QBhmLlst7EPyVJFSg07KQq5oMwE0t3DJBXK8xhqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z++cz+K2u2tF+SEu+5xB5l7R9hxFn36vLnzOqEHlelPfUWze2no
	WAsuoqGJSSsx1QCSQo6owwQ5lO1Z9o6P8KouoO2fOD1gyZ/jYGuFvdcCAbCAOJ/E0yJ9vRZ698Y
	fIiNE+0bN1xq7VEAVtdg3OVOutqkfpVyZXEoLUQkq
X-Gm-Gg: AYBFou19ffm45geAFNUtJ5v5FuSUidEVuG+MmhBK6YoXTnRVDnzyKbkP/VzizXLO+CB
	iBrFBX7B/fw0S45Agc3Bvc5Qr98JLihn8lI2zjU/F3mzTPmgv/46og8ZZ2/DdA+t10oO0MdYrrb
	VuUia9wEqYvMCaJt51rQICx43TuKz0GBpDZhHKjfcvOkLMzNCM6cxtJNaXzFYWXeHajjXxOyHRG
	SlyQUWbWzpIFluYrlrB+IqCFswxS81ItSCtT+t1fu8DqTLb04+tu3GeFrKPtDresO1J9h230vXD
	/KST+PP1vTy6V8RHitb8Jo5SfS6kD/5vrJdLwqaIdOprQ1uGN9laECSu99NGSX6lwQonYyjQhxz
	9Izz+nGf+gwRHErcMGMgOfsVPj8rt/vZNyr2f73bp4Nk0rXmWAq1Bd94jY7qlK/srJA==
X-Received: by 2002:a05:622a:a15:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55990ed99a3mr21782641cf.14.1794504468321; Thu, 12 Nov 2026
 09:27:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAcuPuJUt=Qf6uuTVv63jiY_iCjsvjso1T=WYSFQB=i6Wzb2Vw@mail.gmail.com>
In-Reply-To: <CAAcuPuJUt=Qf6uuTVv63jiY_iCjsvjso1T=WYSFQB=i6Wzb2Vw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Nov 2026 09:27:34 -0800
X-Gm-Features: AclHuK9gXWTIM83w-gVV_norccqytq1EeYN5COdzIUNzghS9AnogfI2G1nfY5Ms
Message-ID: <CAP-5=fWYxRTZmFQZZECLapQCUug-bs3cwTmwYA5SxBy0=0bKdQ@mail.gmail.com>
Subject: Re: [PATCH] tools api io: Return high-bit bytes as unsigned characters
To: Wojciech Szpucha <szpuszi@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 9:06=E2=80=AFAM Wojciech Szpucha <szpuszi@gmail.com=
> wrote:
>
> From: Wojciech Szpucha <szpuszi@gmail.com>
>
> On signed-char builds, io__get_char() returns negative values for bytes
> 0x80-0xff. This makes filename__read_str() silently truncate non-ASCII
> input in standalone libapi builds.
>
> Cast the byte to unsigned char before returning it as int. Add regression
> tests compiled with -fsigned-char, since perf defaults to -funsigned-char
> and already avoids the issue.
>
> Fixes: e95770af4c4a ("tools api: Add a lightweight buffered reading api")
> Signed-off-by: Wojciech Szpucha <szpuszi@gmail.com>

Can you provide more context of where this is a problem? The code
builds with -funsigned-char :
https://lore.kernel.org/linux-perf-users/20260306191908.2065682-1-irogers@g=
oogle.com/
and so we may be failing to pass CFLAGS through properly for the libapi bui=
ld.

Thanks,
Ian

> ---
> Tested on Ubuntu 24.04 x86_64, GCC 13.3.0: standalone libapi reads 0/4
> bytes before the fix and 4/4 afterwards. The API IO regression fails
> before and passes after. libapi and perf build successfully; checkpatch
> passes. Full perf suite and kernel builds were not run.
>
> https://github.com/szpuszi/linux-perf-io-test/actions/runs/43257707229
>
>  tools/lib/api/io.h        |  2 +-
>  tools/perf/tests/Build    |  1 +
>  tools/perf/tests/api-io.c | 33 ++++++++++++++++++++++++++++++++-
>  3 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
> index 1731996b..25e2008d 100644
> --- a/tools/lib/api/io.h
> +++ b/tools/lib/api/io.h
> @@ -91,7 +91,7 @@ static inline int io__get_char(struct io *io)
>                 if (ret)
>                         return ret;
>         }
> -       return *io->data++;
> +       return (unsigned char)*io->data++;
>  }
>
>  /* Read a hexadecimal value with no 0x prefix into the out argument hex.=
 If the
> diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
> index 58858f3d..c3ba1fca 100644
> --- a/tools/perf/tests/Build
> +++ b/tools/perf/tests/Build
> @@ -79,6 +79,7 @@ perf-test-$(CONFIG_DWARF_UNWIND) +=3D dwarf-unwind.o
>  endif
>
>  CFLAGS_dwarf-unwind.o +=3D -fno-optimize-sibling-calls
> +CFLAGS_api-io.o +=3D -fsigned-char
>
>  perf-test-y +=3D workloads/
>
> diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
> index 0ba3d5cc..f283712e 100644
> --- a/tools/perf/tests/api-io.c
> +++ b/tools/perf/tests/api-io.c
> @@ -98,7 +98,7 @@ static int do_test_get_char(const char *test_string,
> size_t buf_size)
>         for (i =3D 0; i < strlen(test_string); i++) {
>                 ch =3D io__get_char(&io);
>
> -               EXPECT_EQUAL(ch, test_string[i]);
> +               EXPECT_EQUAL(ch, (unsigned char)test_string[i]);
>                 EXPECT_EQUAL(io.eof, false);
>         }
>         ch =3D io__get_char(&io);
> @@ -118,6 +118,7 @@ static int test_get_char(void)
>                 "12345678abcdef90",
>                 "a\nb\nc\nd\n",
>                 "\a\b\t\v\f\r",
> +               "\x7f\x80\xfe\xff",
>         };
>         for (i =3D 0; i <=3D 10; i++) {
>                 for (j =3D 0; j < ARRAY_SIZE(test_strings); j++) {
> @@ -290,6 +291,34 @@ static int test_get_dec(void)
>         return ret;
>  }
>
> +static int test_get_line_non_ascii(void)
> +{
> +       static const char test_string[] =3D "a\xc3\xa9\xff\nnext\n";
> +       char path[PATH_MAX];
> +       struct io io;
> +       char *line =3D NULL;
> +       size_t line_len =3D 0;
> +       int len, ret =3D 0;
> +
> +       if (setup_test(path, test_string, 2, &io))
> +               return -1;
> +
> +       len =3D io__getline(&io, &line, &line_len);
> +       EXPECT_EQUAL(len, 5);
> +       EXPECT_EQUAL((int)line_len, 5);
> +       EXPECT_EQUAL((int)strlen(line), 5);
> +       if (line_len =3D=3D 5)
> +               EXPECT_EQUAL(memcmp(line, test_string, 5), 0);
> +       len =3D io__getline(&io, &line, &line_len);
> +       EXPECT_EQUAL(len, 5);
> +       EXPECT_EQUAL((int)line_len, 5);
> +       EXPECT_EQUAL(strcmp(line, "next\n"), 0);
> +
> +       free(line);
> +       cleanup_test(path, &io);
> +       return ret;
> +}
> +
>  static int test_get_line(void)
>  {
>         char path[PATH_MAX];
> @@ -337,6 +366,8 @@ static int test__api_io(struct test_suite *test
> __maybe_unused,
>                 ret =3D TEST_FAIL;
>         if (test_get_line())
>                 ret =3D TEST_FAIL;
> +       if (test_get_line_non_ascii())
> +               ret =3D TEST_FAIL;
>         return ret;
>  }
>
>
> base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
