Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DA32E141
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299810; cv=pass; b=Gqbz1LJeI64x3XXp/QeeZXebCi8t+H5a7EJDHO6qj0YHx8J43jhwnmy4I3SeaePeFs9IWlcS/i2h2n5qIzGlE7fdlH1CHj22nLHCmAnw8kBoQfANSuTWo2bR8w15HpOlRFvDv6HcT4Y49VDJyuC4z17qWMaNFvS+kuWE6MVSW0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299810; c=relaxed/simple;
	bh=tkQQoO3vvVQs2XtJl00nGi7vaebFncL/Xj7fbR+UOxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Atl3SO+y8nJuVnnWWe3OCsp1qpPqSE4MwvzSz3RKOUYUhFJpG6wgfo9FZhp4rkNUQBpjLXcZ0ipXT1lZKn+kw3TQcXYWSwDNfNPtSwzXBhe+fD6XgwP0hJ0yppVxYlTR6gTCVWJXS4yzuXRv8LWf1f2KaWcmUuvTbkPmSKW0BV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kh006Arz; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kh006Arz"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so238001cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792299807; cv=none;
        d=google.com; s=arc-20260327;
        b=OuQASMhIb0xR+uU54Y50HYL3ImmaWrocDrV3MDaS6eep8IpS6oVDx91Xsetb7++NB5
         sEcXygx9T3La3tJ0ONqFH5C0wuwmeZiAO0wiiDS4BYx3cMTbMEQPIbZOR+VK9MB5E+dM
         jYDAdLGM6Ns7YLgryazUlJsp2q/ck/HIck9kPgkP6llpW+dNd4lrjwWYLsgrJpTulBY3
         TKvVGL4YE6c0Swp141sQBlouedsP+uaslJTSMBQdxt2wJbVSnmAqC5n1ecsrewkn8mry
         Edqb/RA56oy6HYdbEzYHVExDjB0mEvXUmlH0N4iZZqPb5qgLfdZ6dNjdKDW3DKcJnDFd
         Gn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJriBqGLviqWmHHPERdjBK4yfnHo9QPRMrJXUUU8Ae8=;
        fh=R/nhCK3XmPqGhHXUy8Eol3hmxmO6C1qdSZYmA3Ztuh0=;
        b=ghjwA3NFQRArybaF1rwNTvh8bOoSriauJxs/Iwc9izz6oNahzRgu30lpHBbYQjbCjV
         nub7L37QHOnB859wt2jlQVOSIIKyb2uRMp4ZU2tKkS1gCsRqAq5A/dDxiPVgXdfW3qoq
         Tw48DCFETpDFdUIysIN9TpLblu/1PTb2RALEp9/oWj9gKFNRojt4coONYsuNZRBdNgiE
         v5LBHz+4av8RE8gTa94CJ/04Fn+O66KK7th9wU5ZonGnoILPe8//pgzHC5H/6FmXtyIT
         YSiqKiQiqnzC5CriXC8aYU0ShvMKWpsGBT2RHK0r9O8WNldiyLMwGbjUPRFjXdnupEv5
         xpjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792299807; x=1792904607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJriBqGLviqWmHHPERdjBK4yfnHo9QPRMrJXUUU8Ae8=;
        b=Kh006Arzks7b3rVY+JEdOOCBJqx5yOIfyxikye4G5nooShzW6f0N7i6nDpPGTvR3Mv
         M0tjo2i1Tt2OR3aOsScesbq1I6u0vwPJCG+c/jI0BM7x9PhZYCkOcnULGzEXl4yJi8QE
         ih0rV1PeS9flYqbc3DKu613cpq+zbq6DCH41WBlPVqKUXWLNlQ0i5L5AU//lXrB6bzTw
         vCuFl3VBrlz6rMvSgMpkb0Xlx4hdmT7ESGP6LRJvqWZWBNgTs+mF7IOchyBxSfd0Sg7w
         A44oIwdn0hH+gRW4OyQtJl7g7wnNg7wWVbkI+H9VC5iz1Yhd/1tGUZC9L+oHekzD7kQ+
         OvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299807; x=1792904607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJriBqGLviqWmHHPERdjBK4yfnHo9QPRMrJXUUU8Ae8=;
        b=Ng5y4zpGukZOq74+JVYAlezH9nKoY+B/bDjKaU6lVqpUuR4gT3TPZzBmj5fpR0PUEt
         pCdtPqpOpmkjDvtKyyH30CXM58DNpC+II53KpQMUjucB/3zfGssln45met2wNzHARymy
         1YsFPgt0RgoUoSYle+0Idl1YFq2Qf1pNEzGrwhRT9WacM183xaJ96RRhyb8fnOlvM+gR
         8zb06njub3t3Pcm50yHl7CstOJIurnw3iMdCMXSyZWQTIHCxv0pz0mIT01clJ8zU5m0C
         sLrSIJeXkT0CIkPyhYNHMWfHdmJMU54LlxNAGaFjr3sRLEoC2PoKFxO/aHoLeZVvRY3M
         h9DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxueJCcD8XjeRZjRJntfxLaSE9cbk8rmG4srrhjFgv3Kau2J63EtQtzB7/8TkGJlqFTDcRH3kzd0HaHolQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhObi7niNMsCo6x1KBZfRVqqzx8IaPSjWf+JtQdmWqxJ50VVlA
	Sh+BHfQBSPagFPgN5H3rkIK62IrxQ/bkV9xJ5aKC/Bk22sr/Wywb92RSv0InU99rp1tz6H7SnZR
	01eBBQbqaHRLu4qcszR7HuyqlTrGKJJelJ7SXmy5A
X-Gm-Gg: AYBFou078eGIGpZiSJTGGvNeiMfERcbBHTSeETQHGR/Fjn/9037dWN5+2bxapqrW9+8
	v5XSP5X+MPjdFKBG7nepKVxpqqV6Tak2ZxXsdIXuOx003sNOUIxkZ09ZuZiwWEboSzkvGpxNuyb
	UME4wGDxd7eBgT8JxhD/VMXy0oXS6ezO39eg43dtyuut+/cIKkkrxJ0oH26yZtFmcQ3PRIvcui0
	4QvpguVGxtx1abjhhs+ew9UHKN20/bs9PZQCPfgD93iaQJMiFWxr32dx6/jzD70DBoRWKHxPlN3
	SVgg6VFN4b5qOr1RQiGFIz/BsQjuWTajbIiIcd7BjiBcmPBIOXMFeDyYwvhYhoGaLty/QXZ2gy6
	8asmZp0cNKwor+EbzO11S4kMqcAgZ5T8Fkoe81rs=
X-Received: by 2002:a05:622a:15c2:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-53646271decmr20079161cf.9.1792299806552; Sat, 17 Oct 2026
 22:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791410885.git.abhishekbapat@google.com> <ed2e9cb670af7d013aaf6585aea551587647f070.1791410886.git.abhishekbapat@google.com>
In-Reply-To: <ed2e9cb670af7d013aaf6585aea551587647f070.1791410886.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 18 Oct 2026 09:03:14 +0400
X-Gm-Features: AclHuK_oDOaokU5jt01qhnnQcmoO0pUXkqXeV5gDjzXh3IzX5q3ZSZp6iLCM8BY
Message-ID: <CAJuCfpGHwan9YDjn_9-8EGKT-ZP=GNVPnfY8zvv5nw9GUK5qiA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] alloc_tag: Add a test for trace state toggle and filtering
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 2:40=E2=80=AFAM Abhishek Bapat <abhishekbapat@google=
.com> wrote:
>
> Following the introduction of the ALLOCINFO_IOC_TOGGLE_TRACE IOCTL and
> ALLOCINFO_FILTER_MASK_TRACE_ON filters for selective memory allocation
> tracing, update the kselftests to validate this behaviour.
>
> Introduce `test_tracing_toggle_and_filter`, which validates the
> architecture by:
> 1. Dynamically flipping trace execution state for a designated allocation=
.
> 2. Query the same tag again, and check that the returned tag reports the
>    new state in its `trace_on` field.
> 3. Restore the tag's original trace state, also on failure, so the test
>    does not leave tracing changed on the system.
>
> The test uses `dup_mm()` function name with the function filter in the
> IOCTL to run the above steps. If the `dup_mm()` tag is not found, the
> test is skipped.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  .../alloc_tag/allocinfo_ioctl_test.c          | 113 +++++++++++++++++-
>  1 file changed, 110 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/t=
ools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 74fd64b2370c..eb52ca1a1dc4 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -48,6 +48,11 @@ static inline int __allocinfo_get_next(int dev_fd, str=
uct allocinfo_tag_data *pa
>         return ioctl(dev_fd, ALLOCINFO_IOC_GET_NEXT, params);
>  }
>
> +static inline int __allocinfo_toggle_trace(int dev_fd, struct allocinfo_=
toggle_traces *params)
> +{
> +       return ioctl(dev_fd, ALLOCINFO_IOC_TOGGLE_TRACE, params);
> +}
> +
>  static bool match_entry(const struct allocinfo_tag_data *procfs_entry,
>                         const struct allocinfo_tag_data *tag_data,
>                         bool match_bytes, bool match_calls, bool match_li=
neno,
> @@ -289,6 +294,8 @@ static int run_filter_test(const struct allocinfo_fil=
ter *filter)
>         return ret;
>  }
>
> +static const char *target_test_function =3D "dup_mm";
> +
>  static int test_filename_filter(void)
>  {
>         struct allocinfo_filter filter;
> @@ -304,11 +311,10 @@ static int test_filename_filter(void)
>  static int test_function_filter(void)
>  {
>         struct allocinfo_filter filter;
> -       const char *target_function =3D "dup_mm";
>
>         memset(&filter, 0, sizeof(filter));
>         filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> -       strncpy(filter.fields.function, target_function, ALLOCINFO_STR_SI=
ZE);
> +       strncpy(filter.fields.function, target_test_function, ALLOCINFO_S=
TR_SIZE);
>
>         return run_filter_test(&filter);
>  }
> @@ -514,11 +520,106 @@ static int test_lineno_filter(void)
>         return ret;
>  }
>
> +static enum ioctl_ret toggle_trace(struct allocinfo_tag *target_tag,
> +                                  bool enable)
> +{
> +       int fd;
> +       struct allocinfo_toggle_traces toggle_params;
> +
> +       fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> +       if (fd < 0) {
> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
> +               return IOCTL_FAILURE;
> +       }
> +
> +       memset(&toggle_params, 0, sizeof(toggle_params));
> +       toggle_params.filter.mask =3D ALLOCINFO_FILTER_MASK_MODNAME | ALL=
OCINFO_FILTER_MASK_FUNCTION |
> +                                   ALLOCINFO_FILTER_MASK_FILENAME | ALLO=
CINFO_FILTER_MASK_LINENO;
> +       toggle_params.filter.fields =3D *target_tag;
> +       toggle_params.enable =3D enable;
> +
> +       if (__allocinfo_toggle_trace(fd, &toggle_params)) {
> +               close(fd);
> +               return IOCTL_FAILURE;
> +       }
> +
> +       close(fd);
> +       return IOCTL_SUCCESS;
> +}
> +
> +static int test_tracing_toggle_and_filter(void)
> +{
> +       struct allocinfo_filter filter =3D { 0 };
> +       enum ioctl_ret ioctl_status;
> +       int ret =3D KSFT_PASS;
> +       bool initial_state, target_state;
> +       struct allocinfo_tag target_tag;
> +       struct allocinfo_tag_data_vec *tags =3D calloc(1, sizeof(*tags));
> +
> +       if (!tags) {
> +               ksft_print_msg("Memory allocation failed.\n");
> +               return KSFT_FAIL;
> +       }
> +
> +       filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> +       strncpy(filter.fields.function, target_test_function, ALLOCINFO_S=
TR_SIZE);
> +
> +       ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, 0);
> +       if (ioctl_status !=3D IOCTL_SUCCESS || tags->count =3D=3D 0) {
> +               ksft_print_msg("Could not retrieve IOCTL entries for %s\n=
", target_test_function);
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +
> +       target_tag =3D tags->tag[0].tag;
> +       initial_state =3D tags->tag[0].counter.trace_on;
> +       target_state =3D !initial_state;
> +
> +       ioctl_status =3D toggle_trace(&target_tag, target_state);
> +       if (ioctl_status !=3D IOCTL_SUCCESS) {
> +               ksft_print_msg("Failed to toggle tracing\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +
> +       filter.mask |=3D ALLOCINFO_FILTER_MASK_TRACE_ON;
> +       filter.tracing =3D target_state;
> +
> +       ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, 0);
> +       if (ioctl_status !=3D IOCTL_SUCCESS) {
> +               ksft_print_msg("Error retrieving IOCTL entries with trace=
 filter.\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit_revert;
> +       }
> +
> +       if (tags->count !=3D 1) {
> +               ksft_print_msg("Expected exactly 1 entry, but got %llu\n"=
, tags->count);
> +               ret =3D KSFT_FAIL;
> +               goto exit_revert;
> +       }
> +
> +       if (tags->tag[0].counter.trace_on !=3D target_state) {
> +               ksft_print_msg("Entry returned by trace filter does not m=
atch target state\n");
> +               ret =3D KSFT_FAIL;
> +       }
> +
> +exit_revert:
> +       ioctl_status =3D toggle_trace(&target_tag, initial_state);
> +       if (ioctl_status !=3D IOCTL_SUCCESS) {
> +               ksft_print_msg("Failed to revert tracing to initial state=
\n");
> +               ret =3D KSFT_FAIL;
> +       }
> +
> +exit:
> +       free(tags);
> +       return ret;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         int ret;
>
> -       ksft_set_plan(4);
> +       ksft_set_plan(5);
>
>         ret =3D test_filename_filter();
>         if (ret =3D=3D KSFT_SKIP)
> @@ -526,6 +627,12 @@ int main(int argc, char *argv[])
>         else
>                 ksft_test_result(ret =3D=3D KSFT_PASS, "test_filename_fil=
ter\n");
>
> +       ret =3D test_tracing_toggle_and_filter();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_test_result_skip("Skipping test_tracing_toggle_and_f=
ilter\n");
> +       else
> +               ksft_test_result(ret =3D=3D KSFT_PASS, "test_tracing_togg=
le_and_filter\n");
> +
>         ret =3D test_function_filter();
>         if (ret =3D=3D KSFT_SKIP)
>                 ksft_test_result_skip("Skipping test_function_filter\n");
> --
> 2.56.0.385.gd3acb90ef8-goog
>
