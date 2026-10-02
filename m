Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62E449980
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979200; cv=pass; b=M73IheIiHfsRjvIIZPR7QNgcFqBQ4Dojrqnn+oKbwkHJcZLeuCtftTAPKbnUpOdLgf3wSwepJcgk3TIJnXT4VAilJ8b8CzoTRsvyyqbmsVmdeG6hP6gSyyX1nfK8B0NNSKmBO/ln+dRi0MMV8m/d22Oi1eMxi5MU2m8QiBDictg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979200; c=relaxed/simple;
	bh=3oCSoelva8wEMM3KnsFQNgKv+tmBYN/dndab7/bw8P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCyTOtfiQqd8OEgxLsUD4F5Uvmg1szgAMgdT5/nAt3o3VCajb70NcEigp2/eSBLcRj2uwTkdUVh7YAj05uuRjZlvScc3Z9+vFpX9LjsAL9GtofJvFscXtlv9qRvAPXnAddty8R/4XQyUVArI8P9faIkKNnbU2qA28M6CF4FbmDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=omfFJrSM; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="omfFJrSM"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5337c7b9937so85401cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790979198; cv=none;
        d=google.com; s=arc-20260327;
        b=EoX2Q6bMy3VcZnmt0spQ0YwCOUpHpGJvokC+oT0/0CMnWpr9i4jZXa9EMGa725QA1k
         jgdYW/c+LmIU07AHaIWL2YwXLcO3ixUnL0S0kU2RxLVRoVpw2ZQuAg38Seizoy5bDccf
         GO1vzoZiCMiRInEDAV8XG5+L2lIJoG6Akl/2G2OYNj6JmM3SEvCadO61iEIFkNI5KzBl
         b6JA/dJSNUzBmboFb0hcpOR6a50/fQ3/pdz5qd1D9Dy/h7OmwhhyxhI9yS77u5+uDdfd
         47RBMU+Cupmc8AajF+UgZFFuFkv6X8IhikwnrDYRVo+W695TO28NLwMFXZkxawyKrDbw
         CvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EQ29teI38L8bIbQ7Fl3d6Y+oq0SQgd1o+9aDJy9uRqA=;
        fh=XghWftqiMVbATEbV3CiNv4AGtKEUYyX8C+aAikjIPJw=;
        b=cCMQuRFotHZwZ55DH1u92SsSOtqns0CIUn7OOKhkuV0agKwK7b2724p/HjvdpVqLqN
         22Uk+D9Zq/jQgsXKQIPyFNqSEsKVg3Ozp25hGNd4s/biZqbyvWpbgDfUKOLsmxiZWB4r
         fisPnRwVDai49CXRMK613nnr6nsG2Pxw6PuLinHEYwMKTebQJ8g1BVpZzVP7MZg4vG4u
         lOnfoJZMpLa/d8l3EbbAHsAj5hF5cn8oje7UeD738LkfbuthStDNQmzBYsmA8efjxWiL
         gAFtBPYLzxqMkMsXZEVYqU1bacWpzOkZNlfpxr1yVKl1wYGcpufhWQ+eikBtvOWmauHR
         Y2oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790979198; x=1791583998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQ29teI38L8bIbQ7Fl3d6Y+oq0SQgd1o+9aDJy9uRqA=;
        b=omfFJrSMbJ7D/Lo/Ag6qu5ieVfUjwTB7rDpEph9QJV2Cg+VfEpHj/DVUV+zlSPZV5I
         efn8JOHRFaShEPlK5pkC7RleCFLxp8nn6BXHjR4ysy/RG+/+oRpQE0RVxHpWxiRa9ivp
         j3goGBDT/3RDkvgSay2htHclpRG3hap6OXoxoRoLpL2EZ+zAno/wHubfhoOh5GeJACiL
         giV4KbTTv59MJ/L4b6HBEpbGurwGZ0idGCYyJxIdTwRUhGAzkcleCBWUeNJUCQsgDG0C
         yhHMAOE7DIAzXREp0SgNjjkPWhDhFQA59YPB1T6nVP7hbs+TZkDQiI32VyBwzV9HqO/U
         +UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979198; x=1791583998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ29teI38L8bIbQ7Fl3d6Y+oq0SQgd1o+9aDJy9uRqA=;
        b=gmymIP4vEZrbVVeQ/RcFv6YGFz4KSGEBO+oZ5F70Xi31qjESOSGBLZKxSdiSgXT0g/
         X6zsznFEtqGgSkHr0AxReh5zX3euIuICypf28caBdoNI3gguJVINgMdUL9AUKPuenUlt
         rTv7Tk8fr5ITtIsUhqjx8+VxDKBDicoloZilUM4BWLv2CX4JUGD0+EGahc544bV5nu5B
         06pDnDkzCOxR89RDRV34i9/qAII9jCUvMn2DYFHi5XghBHgREzSQ7XZE7T16UqfSc0i7
         O63sXaw8RnYk+FV75Sd8FWcaVtS2orrq+8IbyPEryXPkKo4jLQxFe95kOxMWgCaeENrh
         mbEA==
X-Forwarded-Encrypted: i=1; AKwUvBwax5L5oTknFpCgByJzqhpvjTMABvlCjAGdBjFo0oBspFfZIo2QzSET/tN+6K3kRvoVgqI+/l3goC94880=@vger.kernel.org
X-Gm-Message-State: AFuF++ldPzUvXG0CEt8gAorFWscdSvKLi7+s8y+wzPKEsIceyKr9Ecu3
	thH+9vzqdd1zofvsS2PO146BT7bTfF6BcjP44TUZIgJuGKrTROiOB5yUnnPRTfBlfx+UU+l2kuz
	NB87QV8gmHh/tFxUSMCYPGlVoFXs+QtDimO8kRHcQ
X-Gm-Gg: AYBFou21DL1HRGbfGOQHJwevaNHDGAMUo7CDH039vQeD76i7h05MsTwtvl8XPmBF25d
	bIQ0QaYtjvvD1FSasphVYRK8oGfiQHBRSSqvjTv8OVEqilsUvFUAbyCJXDRKxfN6uk8HH/H9SVy
	EUoYYEEE9g7h5HoTNduWZocK2Oe/didMUI9Qv1zbUgOyLAYplkQB9sS9RVsfG+pbcUCBUuO3C+g
	XWNFNTlqpMOgKFTA9vfspzeyklvgSxLH1rCl69tu/zs6aKalsl5wA/3YjDBXzNxkI1XJnfi6nOs
	sidIeXTwWM9HlVBWhp2ma5q5RGW/h+GSbibisd3SCGMhTNcQ7lBVNZA=
X-Received: by 2002:a05:622a:4014:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-535131e85f3mr2393841cf.11.1790979196977; Fri, 02 Oct 2026
 15:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-perf-symbol-memory-send-v4-0-0a592bb2539e@uber.com> <20261002-perf-symbol-memory-send-v4-2-0a592bb2539e@uber.com>
In-Reply-To: <20261002-perf-symbol-memory-send-v4-2-0a592bb2539e@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 Oct 2026 15:13:05 -0700
X-Gm-Features: AclHuK-n2inwDRpXE-eHYDXqtUDMB-vcp4C_0X534QicZirvVEBAXRaVDx_u-3o
Message-ID: <CAP-5=fX=BvLMm-JHLqaR6ACmP0buF9TSvRLf_Cs1us-o6aMGRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] perf dso: Allow reading DSO data from an explicit file
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

On Fri, Oct 2, 2026 at 11:46=E2=80=AFAM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> From: Alireza Haghdoost <haghdoost@uber.com>
>
> The DSO data cache derives the file to open from the DSO's binary type,
> which can resolve to the runtime image rather than the file a symbol
> table was read from. The lazy symbol loader added later in this series
> reads symbol names at string-table offsets in the file the symbol table
> came from. With split debuginfo, the data cache would apply those
> debuginfo offsets to the runtime image.
>
> This patch adds dso__data_set_path() so a DSO can be configured to read
> from one exact file while keeping the data cache's descriptor eviction
> and reopening. The path is used only when the data cache opens the file;
> dso__get_filename() and its debuginfo callers are unchanged. Such DSOs
> may be owned privately rather than being part of a dsos collection, so
> the patch also drops the assertion that every opened data DSO is in one.

I think some context is missing here. Why do I want a DSO that isn't
part of a machine's DSOs? I can see a use for testing, do you want
this feature for more than testing?

Thanks,
Ian

> Add a DSO data test that reads through an explicit path, closes the
> descriptor, and reads an uncached offset to exercise reopening.
>
> Signed-off-by: Alireza Haghdoost <haghdoost@uber.com>
> ---
>  tools/perf/tests/dso-data.c | 42 +++++++++++++++++++++++++++++++++++++++=
+++
>  tools/perf/util/dso.c       | 30 ++++++++++++++++++++++++++----
>  tools/perf/util/dso.h       |  2 ++
>  3 files changed, 70 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
> index 46bc3f597260..fbfb2f08d3ba 100644
> --- a/tools/perf/tests/dso-data.c
> +++ b/tools/perf/tests/dso-data.c
> @@ -393,11 +393,53 @@ static int test__dso_data_reopen(struct test_suite =
*test __maybe_unused, int sub
>         return 0;
>  }
>
> +static int test__dso_data_path(struct test_suite *test __maybe_unused, i=
nt subtest __maybe_unused)
> +{
> +       u8 expect[10] =3D { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
> +       char *file =3D test_file(TEST_FILE_SIZE);
> +       struct dso *dso;
> +       long nr, nr_end;
> +       u8 buf[10];
> +
> +       TEST_ASSERT_VAL("No test file", file);
> +       nr =3D open_files_cnt();
> +
> +       /*
> +        * The DSO name does not exist and the DSO is not in a dsos
> +        * collection; reads must come from the configured path.
> +        */
> +       dso =3D dso__new("/nonexistent/perf-test-dso-data-path");
> +       TEST_ASSERT_VAL("Failed to create dso", dso);
> +       dso__set_binary_type(dso, DSO_BINARY_TYPE__SYSTEM_PATH_DSO);
> +       TEST_ASSERT_VAL("Failed to set path", !dso__data_set_path(dso, fi=
le));
> +
> +       TEST_ASSERT_VAL("Wrong size",
> +                       dso__data_read_offset(dso, NULL, 10, buf, 10) =3D=
=3D 10);
> +       TEST_ASSERT_VAL("Wrong data", !memcmp(buf, expect, 10));
> +
> +       /* An uncached offset after close must reopen the configured path=
. */
> +       dso__data_close(dso);
> +       memset(buf, 0, sizeof(buf));
> +       TEST_ASSERT_VAL("Wrong size after reopen",
> +                       dso__data_read_offset(dso, NULL, DSO__DATA_CACHE_=
SIZE * 2 + 10,
> +                                             buf, 10) =3D=3D 10);
> +       TEST_ASSERT_VAL("Wrong data after reopen",
> +                       buf[0] =3D=3D (DSO__DATA_CACHE_SIZE * 2 + 10) % 1=
0);
> +
> +       dso__data_close(dso);
> +       dso__put(dso);
> +       unlink(file);
> +
> +       nr_end =3D open_files_cnt();
> +       TEST_ASSERT_VAL("failed leaking files", nr =3D=3D nr_end);
> +       return 0;
> +}
>
>  static struct test_case tests__dso_data[] =3D {
>         TEST_CASE("read", dso_data),
>         TEST_CASE("cache", dso_data_cache),
>         TEST_CASE("reopen", dso_data_reopen),
> +       TEST_CASE("explicit path", dso_data_path),
>         {       .name =3D NULL, }
>  };
>
> diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> index d3017c82ffb5..5c4872810ada 100644
> --- a/tools/perf/util/dso.c
> +++ b/tools/perf/util/dso.c
> @@ -547,8 +547,6 @@ static void dso__list_add(struct dso *dso) EXCLUSIVE_=
LOCKS_REQUIRED(_dso__data_o
>  #ifdef REFCNT_CHECKING
>         dso__data(dso)->dso =3D dso__get(dso);
>  #endif
> -       /* Assume the dso is part of dsos, hence the optional reference c=
ount above. */
> -       assert(dso__dsos(dso));
>         dso__data_open_cnt++;
>  }
>
> @@ -678,8 +676,11 @@ static int __open_dso(struct dso *dso, struct machin=
e *machine)
>
>         mutex_lock(dso__lock(dso));
>
> -       name =3D dso__get_filename(dso, machine ? machine->root_dir : "",=
 &decomp,
> -                                dso__binary_type(dso));
> +       if (dso__data(dso)->path)
> +               name =3D strdup(dso__data(dso)->path);
> +       else
> +               name =3D dso__get_filename(dso, machine ? machine->root_d=
ir : "",
> +                                        &decomp, dso__binary_type(dso));
>         if (name) {
>                 fd =3D do_open(name);
>         } else {
> @@ -833,6 +834,26 @@ void dso__data_close(struct dso *dso)
>         mutex_unlock(dso__data_open_lock());
>  }
>
> +/**
> + * dso__data_set_path - Read @dso's data from an explicit file
> + * @dso: dso object
> + * @path: file to open instead of the path derived from the binary type
> + *
> + * Used when the data must come from one specific file, such as the sepa=
rate
> + * debuginfo file that a symbol table was read from. Must be called befo=
re any
> + * data is read, as already cached data is not invalidated.
> + */
> +int dso__data_set_path(struct dso *dso, const char *path)
> +{
> +       char *new_path =3D strdup(path);
> +
> +       if (!new_path)
> +               return -ENOMEM;
> +       free(dso__data(dso)->path);
> +       dso__data(dso)->path =3D new_path;
> +       return 0;
> +}
> +
>  static void try_to_open_dso(struct dso *dso, struct machine *machine)
>         EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
>  {
> @@ -1783,6 +1804,7 @@ void dso__delete(struct dso *dso)
>         dso__data_close(dso);
>         auxtrace_cache__free(RC_CHK_ACCESS(dso)->auxtrace_cache);
>         dso_cache__free(dso);
> +       zfree(&RC_CHK_ACCESS(dso)->data.path);
>         dso__free_a2l(dso);
>         dso__free_a2l_libbfd(dso);
>         dso__free_libdw(dso);
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index 3f08d45e7f53..7bcd5ec0c312 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -264,6 +264,7 @@ struct dso_data {
>  #ifdef REFCNT_CHECKING
>         struct dso       *dso;
>  #endif
> +       char             *path;
>         int              fd;
>         int              status;
>         u32              status_seen;
> @@ -921,6 +922,7 @@ bool dso__data_get_fd(struct dso *dso, struct machine=
 *machine, int *fd)
>         EXCLUSIVE_TRYLOCK_FUNCTION(true, _dso__data_open_lock);
>  void dso__data_put_fd(struct dso *dso) UNLOCK_FUNCTION(_dso__data_open_l=
ock);
>  void dso__data_close(struct dso *dso) LOCKS_EXCLUDED(_dso__data_open_loc=
k);
> +int dso__data_set_path(struct dso *dso, const char *path);
>
>  int dso__data_file_size(struct dso *dso, struct machine *machine);
>  off_t dso__data_size(struct dso *dso, struct machine *machine);
>
> --
> Git-157)
>
>
