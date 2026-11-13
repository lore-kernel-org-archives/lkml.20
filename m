Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587773;
	b=ncEGvWc/SG0W+BmRGQVr2Bx3TPgMoSU16GcQYJHbnG6YRg+jLB9CZjLwGfn3dAgAhbuS
	 wNroCjvSVxk0KAvaMgQyfSu7gxRoJ4z2QlX274sxY70Z75V0u3SQ6Q8OR/uFcY6osMS3T
	 gqJlRd7C3wRZETBsb9MurrP/VBTFmRgB+3NKELyxsozSNs2+gl/iIZXb/F8lJ6n49qJ0f
	 QuHKfge1Kdi8r/SGnCOBNN1dHYQsM4wjksJkGpp0J+41OROvo7Z9jX7kAfrkugo0QxJqG
	 SE4LgQKdGNaS8J5ROnT/rNe6C999i2hobyscxLdoF4vQJpNt6gPEUvAa9dJ2dNdJVQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dk0OfEhBrpGDHTWLxVALNbQxOkqQVK6OYDuzKZG8t+0=;
	b=Zoq+hivJECaOX+mQIkpTsLuB9Hph3QdezfSjlTv6+AYNUvPru0Dr79dGuPB3hfomUsn/
	 43qJxXacREdjs51+VqIJ6AhCo6a2cDTcyE4W88laQeY5Ha2XKfRxk3FZIhxKrKmAWHL8z
	 B/ro9b0I4s5XHg66pG1G1K/b1i30kZcSEX/qNzzoQ9ihk+kRzix10VNqSOQlu3Rd8D5K7
	 bmYXo4MiaUjSxoXDMo4T7ah7b6KTJNL3mmfb9iwe2NfQQxFIYvz7swyyptRLlevefmtH9
	 RR8Zz5hBSDVF5jT6r8gDs8q5xNYwbd3ibsiVxJwKAVj+8a1FwxhiWvY66tMieEVUIRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gRiEHjkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F053606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F053606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gRiEHjkw
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso448601cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587771; cv=none;
        d=google.com; s=arc-20260327;
        b=DOmKBOnDYKDXDAQ6GpguT6TYS72h9MB57xneoU89VC5f7Jibj+MDfMthdK8SO9vqK/
         uYtgop8e8WVxBeJabm2OVRhWYv+0jNazxRPYaFTSRG7UJ7Wt9gJ9nK0MRjXzO591Z6BZ
         r4qXwXhNF1HG671wIxSyKcYOFQu0UGa2DUjSxmNf4fb0GhOZ56MHiObhMnzGL4FFcJ6j
         8fNhNhtl5hHRg8/oQ/2aQHq7QXzcp5HyceS4UyTEXufMwoYRg8gWs109Ffy5zZsDa4Kl
         8COS1wnt5TZQ0vcKFsHwNZs23g35friqAOEj+vlpK7JXZypwfSMkK/QCusn70Smcdfv8
         BXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dk0OfEhBrpGDHTWLxVALNbQxOkqQVK6OYDuzKZG8t+0=;
        fh=PdGEdZBvgMVjK93PjXmYU1V4JqnJTd+gaXcI/zE4wSc=;
        b=FnITQu5cfHCjEFhr8SfKKnZ4Y/CFyVRbk/9gMRXzq4y8YFJOBvWZ+ezXlLIrNNQ9oI
         WVdyc+TA+sRdINoc31e1DTkV4GfcJhCv8n2ZIM9YnKDdsgtC7VDL3kvG5ibpNJasJvKI
         eaSjp8qVpGNAP43widNddhNL6TN2M1J9yY1JuMNKSVMglnGPCUB/HQwtUesNNcbF09zv
         ouFRWueiXMFxrn3rJGEYEfedy+8vqAp6+oetrBBgn7PUV0Aszh7McSyBbcCYIDxqNbIi
         Cq7VDHmNVjJ1q96+QsT8N8/Vb2xZ1pxkpE/T/N4j71LC977qKBVcaYrXjWzlt/2N4rBg
         jdwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587771; x=1795192571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dk0OfEhBrpGDHTWLxVALNbQxOkqQVK6OYDuzKZG8t+0=;
        b=gRiEHjkwvk7qqdRHlCDYHOhhuqcDDiWQbn6wBt7cgNunMgFn4o+g1cfW2aUA3BQPen
         WFhccyDfjGhQRLkcEB++D5BgOTh/j4dyQVCbYWbrr+dGSMsA4T11OGoELrJxwGwcTEDf
         HrgYWGerUbEmjBqxRg/xH67VS5gcaW2uRRz8q/o/OKgpyK4aZXGm+JXk2wpCZko4bpd9
         K84tzLf+Zky+macmhEktj8J8kve7kLd8zjHRwTzQthj7T4KR9XWs+hU2iv93tw2OxwMN
         cdCrGKi2Iv0PVhD6Rb9yfXNsRBb08O7SOjyMgMSSlgkRRqcgZt6OxLU1DeP+uPa/dls+
         0MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587771; x=1795192571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk0OfEhBrpGDHTWLxVALNbQxOkqQVK6OYDuzKZG8t+0=;
        b=TTJkb0PVY7KCGRCqRzPCI3qzdfyoxHsR2UKyF8Am06/0AsV84raHxXSe6cAHbYW0LK
         8s0a1sz7s/RqGpN2kuRzdbR2mpzF2z+i35Y4Ox5rXKex0UInfYz0meD6W/ZLzL758ftz
         yF2AAJgF1/lyhX810GvDvTbcxI8iSZ1O845JJRGIDg4Ss+xmFxeI3Whavh4B4MmpSHVO
         k651/rymv2odSpc2TaX8KPccF5/Q/VzKszZf6KhJ/y6DsVCivrhOAgeDdOGHasvFPCDJ
         3UQ3Smw4SO/BRTbClwnRRbDaVgU/qw3cQA6o3VvuE41dWFIc4dhKVX1fw4TmA7HLEkuh
         BMtQ==
X-Forwarded-Encrypted: i=1; AL+hErHB7IbgqwjEAo5SvRS6LoF2BkrMPT7S+K0f+rVrNYdG+d/qiZ31aPqScZLBF9QvPTE+zhCB2KWhfnLsMwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c7hvXP958RFQFT9OxTMl688zKh2g7R+v1yRdHbNamg15Eq3gq
	TFg3NNVjzkP4NM9kSfgNdQPgxYSHdWz1c0esPxpbJgP3bd9/pFjNuKFed8AG0ZpNEEhqzC2iskW
	Qj/7YSsD/KGc0zqwMrUoO57pFqDwVIgyqZyb1BIzF
X-Gm-Gg: AYBFou1SsuxlNdHNXB0P5e8lkhYBU/dLG9MJVCxFTIFq6gbIA0VkEylFB1+r71BaRI0
	MQq3cYjCIRWjiMUJvsQD9yQESoa+c3O6zsYAopKDfu/+uTdAkdXaXNixK2VmJcZ+gtwVpg5i1Oa
	LRllEnfFasEKuLRL3JAEn7R4H6VJRuDUyiEJQ+b3jgWi9uE1ilO8N72/mSdebcpNaISOY2+/yRN
	7CDVlpQKnoafF8zxxalCfPjyfl/LrMnDQaW3bIHI8/A5jUy6y7Qt8WyT4Lr7hIp2OL3+4GCfM2l
	ynvF1grYfiL3fdIOzSgr08eQh57Hh40mHeIw++gCpgTLOIhndFog4qMa3LxM9BFs8+cL36b58Rl
	iIJDrplhyiGS28ULXyseskRKCRreF2LVhXeTGKEHZeiGj8/ycGn4tZkXYYhj5PqSiEBp5XchSyQ
	W7J5j2dnNJNZeg1A==
X-Received: by 2002:a05:622a:408d:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55ad7e74d7dmr15092651cf.2.1794587770461; Fri, 13 Nov 2026
 08:36:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-18-irogers@google.com>
 <avVlkHSqveDsxDXl@google.com>
In-Reply-To: <avVlkHSqveDsxDXl@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:35:56 -0800
X-Gm-Features: AclHuK_YfAJR9wX6gY0d-A3OjnnLv3XR-7uTAcTHvMU9cB7lOUen6wbC8AEDOwc
Message-ID: <CAP-5=fXJ7h-0OtS-_3pwhsHbzGBXfhzikeWZbPiv62RVMCJ-+w@mail.gmail.com>
Subject: Re: [PATCH v12 17/20] perf config, intel-tpebs, env: Add __guarded_by
 and __must_hold annotations
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:07=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:09AM -0800, Ian Rogers wrote:
> > Add __guarded_by() and __must_hold() annotations to static parser and
> > config state in util/config.c, TPEBS state in util/intel-tpebs.c, and
> > bpf_progs and cgroups trees in struct perf_env.
>
> Looks like an unrelated set of changes.  Probably better to split.  I
> think TPEBS changes can go to the previous commit.

Done in v13: I folded the intel-tpebs annotations into patch 16 and
split the config and env annotations into standalone patches 17 and 18.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/bpf-event.h   |  5 ++--
> >  tools/perf/util/config.c      | 47 +++++++++++++++++++++--------------
> >  tools/perf/util/env.c         |  1 +
> >  tools/perf/util/env.h         | 19 ++++++++------
> >  tools/perf/util/intel-tpebs.c | 18 ++++++++------
> >  5 files changed, 54 insertions(+), 36 deletions(-)
> >
> > diff --git a/tools/perf/util/bpf-event.h b/tools/perf/util/bpf-event.h
> > index da4eeb4a1a73..3f3323f98f49 100644
> > --- a/tools/perf/util/bpf-event.h
> > +++ b/tools/perf/util/bpf-event.h
> > @@ -6,11 +6,11 @@
> >  #include <linux/rbtree.h>
> >  #include <api/fd/array.h>
> >  #include <stdio.h>
> > +#include "env.h"
> >
> >  struct bpf_prog_info;
> >  struct machine;
> >  union perf_event;
> > -struct perf_env;
> >  struct perf_sample;
> >  struct perf_session;
> >  struct record_opts;
> > @@ -42,7 +42,8 @@ int machine__process_bpf(struct machine *machine, uni=
on perf_event *event,
> >  int evlist__add_bpf_sb_event(struct evlist *evlist, struct perf_env *e=
nv);
> >  void __bpf_event__print_bpf_prog_info(struct perf_bpil *info_linear,
> >                                     struct perf_env *env,
> > -                                   FILE *fp);
> > +                                   FILE *fp)
> > +     __must_hold_shared(&env->bpf_progs.lock);
> >  void bpf_metadata_free(struct bpf_metadata *metadata);
> >  #else
> >  static inline int machine__process_bpf(struct machine *machine __maybe=
_unused,
> > diff --git a/tools/perf/util/config.c b/tools/perf/util/config.c
> > index 287401f159e6..0e6b77a0a5e7 100644
> > --- a/tools/perf/util/config.c
> > +++ b/tools/perf/util/config.c
> > @@ -64,15 +64,29 @@ struct perf_stat_config stat_config =3D {
> >
> >  char buildid_dir[MAXPATHLEN]; /* root dir for buildid, binary cache */
> >
> > -static FILE *config_file;
> > -static const char *config_file_name;
> > -static int config_linenr;
> > -static int config_file_eof;
> > -static struct perf_config_set *config_set;
> > +/* Parsing and rewriting share the static parser state. */
> > +static DEFINE_MUTEX(config_mutex);
> > +
> > +/* Serializes whole perf_config__set_variable() updates. */
> > +static DEFINE_MUTEX(config_update_mutex);
> > +
> > +/*
> > + * Protects the global config_set. Separate from config_mutex because
> > + * initializing config_set parses the config files, which acquires
> > + * config_mutex.
> > + */
> > +static DEFINE_MUTEX(config_set_mutex);
> > +
> > +static FILE *config_file __guarded_by(&config_mutex);
> > +static const char *config_file_name __guarded_by(&config_mutex);
> > +static int config_linenr __guarded_by(&config_mutex);
> > +static int config_file_eof __guarded_by(&config_mutex);
> > +static struct perf_config_set *config_set __guarded_by(&config_set_mut=
ex);
> >
> >  const char *config_exclusive_filename;
> >
> >  static int get_next_char(void)
> > +     __must_hold(&config_mutex)
> >  {
> >       int c;
> >       FILE *f;
> > @@ -99,8 +113,9 @@ static int get_next_char(void)
> >  }
> >
> >  static char *parse_value(void)
> > +     __must_hold(&config_mutex)
> >  {
> > -     static char value[1024];
> > +     static char value[1024] __guarded_by(&config_mutex);
> >       int quote =3D 0, comment =3D 0, space =3D 0;
> >       size_t len =3D 0;
> >
> > @@ -170,6 +185,7 @@ static inline int iskeychar(int c)
> >  }
> >
> >  static int get_value(config_fn_t fn, void *data, char *name, unsigned =
int len)
> > +     __must_hold(&config_mutex)
> >  {
> >       int c;
> >       char *value;
> > @@ -201,6 +217,7 @@ static int get_value(config_fn_t fn, void *data, ch=
ar *name, unsigned int len)
> >  }
> >
> >  static int get_extended_base_var(char *name, int baselen, int c)
> > +     __must_hold(&config_mutex)
> >  {
> >       do {
> >               if (c =3D=3D '\n')
> > @@ -237,6 +254,7 @@ static int get_extended_base_var(char *name, int ba=
selen, int c)
> >  }
> >
> >  static int get_base_var(char *name)
> > +     __must_hold(&config_mutex)
> >  {
> >       int baselen =3D 0;
> >
> > @@ -257,10 +275,11 @@ static int get_base_var(char *name)
> >  }
> >
> >  static int perf_parse_file(config_fn_t fn, void *data)
> > +     __must_hold(&config_mutex)
> >  {
> >       int comment =3D 0;
> >       int baselen =3D 0;
> > -     static char var[MAXNAME];
> > +     static char var[MAXNAME] __guarded_by(&config_mutex);
> >
> >       /* U+FEFF Byte Order Mark in UTF8 */
> >       static const unsigned char *utf8_bom =3D (unsigned char *) "\xef\=
xbb\xbf";
> > @@ -549,12 +568,6 @@ int perf_default_config(const char *var, const cha=
r *value,
> >       return 0;
> >  }
> >
> > -/* Parsing and rewriting share the static parser state. */
> > -static DEFINE_MUTEX(config_mutex);
> > -
> > -/* Serializes whole perf_config__set_variable() updates. */
> > -static DEFINE_MUTEX(config_update_mutex);
> > -
> >  static int perf_config_from_file(config_fn_t fn, const char *filename,=
 void *data)
> >  {
> >       int ret;
> > @@ -737,6 +750,7 @@ static int set_value(struct perf_config_item *item,=
 const char *value)
> >
> >  static int collect_config(const char *var, const char *value,
> >                         void *perf_config_set)
> > +     __must_hold(&config_mutex)
> >  {
> >       int ret =3D -1;
> >       char *ptr, *key;
> > @@ -853,11 +867,8 @@ struct perf_config_set *perf_config_set__load_file=
(const char *file)
> >       return set;
> >  }
> >
> > -/* Not config_mutex: building the set parses the config files, which t=
akes it. */
> > -static DEFINE_MUTEX(config_set_mutex);
> > -
> > -/* Called with config_set_mutex held. */
> >  static int perf_config__init(void)
> > +     __must_hold(&config_set_mutex)
> >  {
> >       if (config_set =3D=3D NULL)
> >               config_set =3D perf_config_set__new();
> > @@ -975,7 +986,7 @@ int perf_config__set_variable(const char *var, cons=
t char *value)
> >
> >       /* Static: the parser publishes it as config_file_name. */
> >       {
> > -             static char path[PATH_MAX];
> > +             static char path[PATH_MAX] __guarded_by(&config_update_mu=
tex);
> >               char *user_config =3D mkpath(path, sizeof(path), "%s/.per=
fconfig", getenv("HOME"));
> >
> >               config_filename =3D config_exclusive_filename ?: user_con=
fig;
> > diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
> > index 50993b0dedc5..9e8e5d1d822a 100644
> > --- a/tools/perf/util/env.c
> > +++ b/tools/perf/util/env.c
> > @@ -302,6 +302,7 @@ void perf_env__exit(struct perf_env *env)
> >  }
> >
> >  void perf_env__init(struct perf_env *env)
> > +     __context_unsafe(/* initialization */)
> >  {
> >       memset(env, 0, sizeof(*env));
> >  #ifdef HAVE_LIBBPF_SUPPORT
> > diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
> > index 23d35425efe3..6b2083e3640c 100644
> > --- a/tools/perf/util/env.h
> > +++ b/tools/perf/util/env.h
> > @@ -139,16 +139,16 @@ struct perf_env {
> >        */
> >       struct {
> >               struct rw_semaphore     lock;
> > -             struct rb_root          infos;
> > -             u32                     infos_cnt;
> > -             struct rb_root          btfs;
> > -             u32                     btfs_cnt;
> > +             struct rb_root          infos __guarded_by(&lock);
> > +             u32                     infos_cnt __guarded_by(&lock);
> > +             struct rb_root          btfs __guarded_by(&lock);
> > +             u32                     btfs_cnt __guarded_by(&lock);
> >       } bpf_progs;
> >  #endif // HAVE_LIBBPF_SUPPORT
> >       /* same reason as above (for perf-top) */
> >       struct {
> >               struct rw_semaphore     lock;
> > -             struct rb_root          tree;
> > +             struct rb_root          tree __guarded_by(&lock);
> >       } cgroups;
> >
> >       /* For fast cpu to numa node lookup via perf_env__numa_node */
> > @@ -223,7 +223,8 @@ int perf_env__nr_cpus_avail(struct perf_env *env);
> >  void perf_env__init(struct perf_env *env);
> >  #ifdef HAVE_LIBBPF_SUPPORT
> >  bool __perf_env__insert_bpf_prog_info(struct perf_env *env,
> > -                                   struct bpf_prog_info_node *info_nod=
e);
> > +                                   struct bpf_prog_info_node *info_nod=
e)
> > +     __must_hold(&env->bpf_progs.lock);
> >  bool perf_env__insert_bpf_prog_info(struct perf_env *env,
> >                                   struct bpf_prog_info_node *info_node)=
;
> >  struct bpf_prog_info_node *perf_env__find_bpf_prog_info(struct perf_en=
v *env,
> > @@ -233,9 +234,11 @@ void perf_env__iterate_bpf_prog_info(struct perf_e=
nv *env,
> >                                               void *data),
> >                                    void *data);
> >  bool perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_n=
ode);
> > -bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf=
_node);
> > +bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf=
_node)
> > +     __must_hold(&env->bpf_progs.lock);
> >  struct btf_node *perf_env__find_btf(struct perf_env *env, __u32 btf_id=
);
> > -struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_=
id);
> > +struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_=
id)
> > +     __must_hold_shared(&env->bpf_progs.lock);
> >  #endif // HAVE_LIBBPF_SUPPORT
> >
> >  int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu);
> > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpeb=
s.c
> > index 2edd8297fa1b..d79d42a36a53 100644
> > --- a/tools/perf/util/intel-tpebs.c
> > +++ b/tools/perf/util/intel-tpebs.c
> > @@ -39,15 +39,16 @@
> >  bool tpebs_recording;
> >  enum tpebs_mode tpebs_mode;
> >  static DEFINE_MUTEX(tpebs_mtx);
> > -static LIST_HEAD(tpebs_results);
> > -static pthread_t tpebs_reader_thread;
> > -static struct child_process tpebs_cmd;
> > +static struct list_head tpebs_results __guarded_by(&tpebs_mtx) =3D LIS=
T_HEAD_INIT(tpebs_results);
> > +static pthread_t tpebs_reader_thread __guarded_by(&tpebs_mtx);
> > +static struct child_process tpebs_cmd __guarded_by(&tpebs_mtx);
> >  static struct cond tpebs_cmd_cond =3D { .cond =3D PTHREAD_COND_INITIAL=
IZER };
> > -static int control_fd[2] =3D { -1, -1 }, ack_fd[2] =3D { -1, -1 };
> > -static bool tpebs_stopping;
> > -static bool tpebs_enabled;
> > -static bool tpebs_cmd_in_flight;
> > -static uint64_t tpebs_gen;
> > +static int control_fd[2] __guarded_by(&tpebs_mtx) =3D { -1, -1 };
> > +static int ack_fd[2] __guarded_by(&tpebs_mtx) =3D { -1, -1 };
> > +static bool tpebs_stopping __guarded_by(&tpebs_mtx);
> > +static bool tpebs_enabled __guarded_by(&tpebs_mtx);
> > +static bool tpebs_cmd_in_flight __guarded_by(&tpebs_mtx);
> > +static uint64_t tpebs_gen __guarded_by(&tpebs_mtx);
> >
> >  struct tpebs_retire_lat {
> >       struct list_head nd;
> > @@ -67,6 +68,7 @@ static struct tpebs_retire_lat *tpebs_retire_lat__fin=
d(struct evsel *evsel)
> >       __must_hold(&tpebs_mtx);
> >
> >  static int evsel__tpebs_start_perf_record(struct evsel *evsel)
> > +     __must_hold(&tpebs_mtx)
> >  {
> >       const char **record_argv;
> >       int tpebs_event_size =3D 0, i =3D 0, ret;
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >
