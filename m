Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDDF44C64C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834480; cv=pass; b=Za8gDdbcJwX0wHMIKXe7lmeioMPwA9aDetT/ymUC6tuY3rFF5dYUfXhItRb5hFTPDsLFtgKoGoRYdvkL4A0KMa6xLv7F9kDSTHdHfNJsMM8GNLkgfunVfr3g5vg+Oj3xlwx1d8kiUUcAvXE4yakn2S8uTQchxkRf8seK275TU4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834480; c=relaxed/simple;
	bh=orNJIYCPExrhwIMf8GZooIvqSki4abZ9scUo3yGD+8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REBT4wG25aSDWX4iGUK3VTR2DMjLf6BprX7lwdPLhYiOEyID4AJOixkV7EN8OTBTeGrIP6PvW2tJeyKrwqRa1uimgYKB6SYt+3e1Cvv77D/ljk6RmRE+rDO+Qr+JBG2OReG5JrlaK9UwKy5MLa8BpJNuGv40TkCcAobSOfFolHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LgE+0ZZD; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LgE+0ZZD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so196171cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834475; cv=none;
        d=google.com; s=arc-20260327;
        b=fOh2ubskQlw0Fxt5o5ze1U7EvijFdRQtbE2fploYlqs5Zr//FZ9cSbjwWw5ur47ed/
         IyoZYsbLy5xLNQo7b5ZUzAPNVJPhhEScXh7B3ijt82W2Q8jrdKLu81uKx5DVCkoQWt4V
         mD3T6sxwiJbhfNS5JFCu52rOJslhPB8i7llHhgUroDsiQ2H6bQJg4yQorj9qmO0oNdZS
         +elDhSVbrRC8YuNh3ZiuqXkdIYYBwp5AgrjhHAsH9IZ6eTjPQdq/4H1L9FQa0mkOOwKa
         wRq0X/alSI3wyWTiI5cnc6+3T4hkMWBn7lFqXt+tElVsJX0WOfrMOJK7kQgheYqpES+B
         S61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OyPwq39iE32SaL8RXGnmByH8Kd2xuM6EtYTUcKeGtco=;
        fh=0KYVhaB0pQHsMOw902EvoYgN9AZSpWOCzlliIebG1EA=;
        b=a+bLcOXIIDhMGuSY3h+p8CTayxpdwRogY8B9qlGMpWlTGl/Q39jMG+J+Kl4Wz6K7Fc
         PobTBn7cshTzjHDEXCgJg3gThXKcbVybw1xWW9Jr1rzd+J+2xwR1s+W1BkUxnZoczJba
         SsBkLwc3NChFs69ziKmkLT1+f4jpZf5i9XVy6KKxNEruzz4IXnFr6dJKaaoqwWOfWeMZ
         eZafCC3ye1FLxgAKqQAk7lQmTCeXywVpC27QDQwS5Ed1yUF56KdOPH/N79zYB5jMAHiB
         kH8RqUALrcx3MV2NEFrVuiQ74z+o6r7eQ/RTDCOHEFcx6qNiDDOJOHmxGz9Yl/x+So7E
         7D0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790834475; x=1791439275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OyPwq39iE32SaL8RXGnmByH8Kd2xuM6EtYTUcKeGtco=;
        b=LgE+0ZZDVlZChphrTtpq1NQLf9s80p6SdFx4oTRubPKmx/d6Tf4ZjX2j97y/Sxic7s
         rlVJZQXshq1FyLiTxd9CJYDE/bvl+oO1sAWxe4HZDwIuHm0B41MVDUsnhYba+TYKefcZ
         cYKil500gG8eaph83++tn8dJqNaUrJg6PemdqEKbnv2zTc7RJQgXxGAr4fa1hW3VsnvT
         wGjTZfR7wjVOqWjPw+fffvykTCALj6ctTlggpB+f+8mwRXUoR8Gth7HGuxwHZCSB6vQ+
         oyGfg2rqKAwbxM/dqGC7sbIcoJMg0sPfclbNNmoDpPwEp/ICkYUvSSBrDJrhZJmQjieS
         1rWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834475; x=1791439275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyPwq39iE32SaL8RXGnmByH8Kd2xuM6EtYTUcKeGtco=;
        b=LwzLordy4ccps0oJURY3JhkqLkrWgxwvEMhfLiQS5q52kuTr0HSda1QMmMLnj7+1yL
         ZiXOfFCWHwqVr2eemNMeF3Y57+yG/uUDpQEaWl/IHZliJt4oF8F755GdlYH+8Lfyzz+r
         viQYUwT+cGxjXEuOUQp9HcZGasEQCzQ9wwtZK30DPmd9r0vOhlySV2KzG+dTOMnRSMKm
         D1PxZ/UsJ+jLEBb+9F5gBXmlXdmnNtnFS8C7HaaEhOQTC8Q0bZpBCWnQUHBfF50DX524
         UpwUxPsTOk0CL6uUqERw4U7eqk0aSupUbMd8YbgwsUQfXuc0uVssYIK2xz9BDMD8RVq4
         xmOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUox18+HrYJLyrWlpYuOPZGTDr4TFfIrFvIn/ykQEkV3rnzXV1PJ9VSGVVzh6Is/hnJVYVElECFjk118c=@vger.kernel.org
X-Gm-Message-State: AFuF++njJGsM8qDy+1+hgNn9m2QIptCwoBxE3Pc5RIJpZvbYs04ztvjB
	h0efcnLD6AHyaeMnsv4lTZaR+5MgVcxH3KL6I5AlHrAHZARnddeF9Rij95aFdhJx6SdAqnsEwN/
	jRm309EnpDiOaMc6fLrWn32Gxbw/OyKExP1jzrLu7
X-Gm-Gg: AYBFou2dETACkGaMdWl5+d2uLnhNuzGdo3Ax5XDijPdYwUTQE2KrmrskeQbpBb/at7V
	zJ8UA52//BTT8UWHJodRiw/hLOyQwYgbhl5pbc9CjspaKD0UM5pEoT9OKTfEPj4ymFVgAEqTF8q
	z5vvzJqmfJxP+6sz5Y654o4xxImGOo8iUW1Vq0Gf1b5wWvgcK/H7zeQ+DBpu4WsaHGEVWvfwzjA
	Uond4Id1+IySdNYTk3JreB/0lVvRVD7EhMpgB9h29wtvCAXx5jZJSV9A+NYaXMmwFrp9ga98OKb
	5dXxEhNiYLKuC/E3SK9racjQmiFxK8OOdQOXSAbpeGjLu18NWUF80w==
X-Received: by 2002:ac8:570d:0:b0:532:c99e:b16b with SMTP id
 d75a77b69052e-5338456868amr11151001cf.3.1790834473785; Wed, 30 Sep 2026
 23:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
 <20260928182605.3649015-7-irogers@google.com> <ar1fon_Z4uT3Cd22@x2> <ar2WYemXnrbDx-Il@google.com>
In-Reply-To: <ar2WYemXnrbDx-Il@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Sep 2026 23:01:01 -0700
X-Gm-Features: AclHuK_MV7id34lX8cEpkQdw3irzLIYujhfHvytA6kxE1fL6j6ztkyS-gf3QnZY
Message-ID: <CAP-5=fVPANOdM5vFY93SCm=mN5Z1U+jMqa7s6piqgtAbUrCBbg@mail.gmail.com>
Subject: Re: [PATCH v6 06/26] perf trace: Copy sockaddr arguments by their length
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Howard Chu <howardchu95@gmail.com>, 
	Jakub Brnak <jbrnak@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:08=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Sep 30, 2026 at 09:14:42PM +0200, Arnaldo Carvalho de Melo wrote:
> > On Mon, Sep 28, 2026 at 11:25:45AM -0700, Ian Rogers wrote:
> > > The BTF augmenter copies sizeof(struct sockaddr), 16 bytes, for the
> > > sockaddr arguments of connect, bind and sendto, and runs before the
> > > sys_enter_connect and sys_enter_sendto programs that copy their lengt=
h.
> > > An IPv6 address needs 24 or 28 bytes, so the rest was read from past =
the
> > > payload, and now that the printers are bounded only its family is sho=
wn.
> > >
> > > Copy them as buffers sized by the length argument after them, up to t=
he
> > > 32 bytes augmented buffers are limited to. That holds an IPv6 address
> > > and doubles the AF_LOCAL path shown.
> > >
> > > Fixes: a68fd6a6cdd3 ("perf trace: Collect augmented data using BPF")
> > > Assisted-by: Antigravity:gemini-3.1-pro
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  tools/perf/builtin-trace.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> > > index 85db74965280..f94745a60f4a 100644
> > > --- a/tools/perf/builtin-trace.c
> > > +++ b/tools/perf/builtin-trace.c
> > > @@ -4159,7 +4159,12 @@ static int trace__bpf_sys_enter_beauty_map(str=
uct trace *trace, int e_machine, i
> > >                             continue;
> > >
> > >                     bt =3D sc->arg_fmt[i].type;
> > > -                   beauty_array[i] =3D bt->size;
> > > +                   /* Copy a sockaddr as a buffer sized by the next =
argument, e.g. addrlen. */
> > > +                   if (strcmp(name, "sockaddr") =3D=3D 0 && field->n=
ext &&
> > > +                       strstr(field->next->name, "len"))
> > > +                           beauty_array[i] =3D -((i + 1) + 1);
> > > +                   else
> > > +                           beauty_array[i] =3D bt->size;
> >
> >
> > Humm, I thought that this would be called in BPF handlers like:
> >
> > SEC("tp/syscalls/sys_enter_connect")
> > int sys_enter_connect(struct syscall_enter_args *args)
> > {
> >         struct augmented_args_payload *augmented_args =3D augmented_arg=
s_payload();
> >         const void *sockaddr_arg =3D (const void *)args->args[1];
> >         unsigned int socklen =3D args->args[2];
> >         unsigned int len =3D sizeof(u64) + sizeof(augmented_args->args)=
; // the size + err in all 'augmented_arg' structs
> >
> >         if (augmented_args =3D=3D NULL)
> >                 return 1; /* Failure: don't filter */
> >
> >         _Static_assert(is_power_of_2(sizeof(augmented_args->arg.saddr))=
, "sizeof(augmented_args->arg.saddr) needs to be a power of two");
> >         socklen &=3D sizeof(augmented_args->arg.saddr) - 1;
> >
> >         bpf_probe_read_user(&augmented_args->arg.saddr, socklen, sockad=
dr_arg);
> >         augmented_args->arg.size =3D socklen;
> >         augmented_args->arg.err =3D 0;
> >
> >         return augmented__output(args, augmented_args, len + socklen);
> > }
> >
> > And it knows how many bytes to read by looking at socklen
> > (args->args[2]), i.e. not use the generic BPF handler that uses this
> > beauty_array, because knowing how many bytes to read in this case is
> > dynamic, varies with each syscall, according to one of its arguments :-=
\
> >
> > What am I missing?
>
> I think Ian's patch update the beauty map which is used by
> augment_sys_enter() before tail-calling syscall-specific functions.
>
> It'd be great if we cover all syscalls in the BPF skeleton and switch
> to the beauty-map and discard the functions.

Right, as Namhyung says, sys_enter() runs augment_sys_enter() before
tail-calling syscalls_sys_enter, and only falls back to the tail call
if augment_sys_enter() returns non-zero:

  if (augment_sys_enter(args, &augmented_args->args))
    bpf_tail_call(args, &syscalls_sys_enter, augmented_args->args.syscall_n=
r);

trace__init_syscalls_bpf_prog_array_maps() populates beauty_map_enter
for every enabled syscall, even ones with a dedicated sys_enter_*
program. In trace__bpf_sys_enter_beauty_map(), connect, bind and
sendto's "struct sockaddr *" argument matched the struct branch, which
looked up "struct sockaddr" in BTF and put bt->size (16 bytes) in
beauty_array. So whenever BTF was available, augment_sys_enter()
handled connect, bind and sendto by copying 16 bytes and returned 0,
and sys_enter_connect / sys_enter_sendto were never tail-called.

beauty_array already supports dynamic lengths from another syscall
argument: a negative entry -(j + 1) tells augment_arg() to read
args->args[j] bytes (clamped to TRACE_AUG_MAX_BUF =3D 32), which was
added for buffer arguments like write's buf/count. This patch uses
that encoding for struct sockaddr * when the next argument is its
length.

If you'd rather have connect, bind and sendto fall back to
sys_enter_connect and sys_enter_sendto (which copies up to
sizeof(struct sockaddr_storage) =3D 128 bytes, so AF_LOCAL paths over 30
bytes aren't truncated), we could instead skip "struct sockaddr" in
trace__bpf_sys_enter_beauty_map().

On Namhyung's point: all 9 syscalls with dedicated sys_enter_*
programs (connect, sendto, open, openat, rename, renameat2,
clock_nanosleep, nanosleep, perf_event_open) already get
beauty_map_enter entries when BTF is loaded, so the tail-call programs
and trace__find_usable_bpf_prog_entry() are mostly shadowed today. The
main gaps before removing them are:

1. trace__bpf_sys_enter_beauty_map() bails out early if trace->btf is
NULL, even for strings/buffers that don't need BTF.
2. TRACE_AUG_MAX_BUF is 32 bytes vs sizeof(struct sockaddr_storage)
(128 bytes) for AF_LOCAL sockaddrs.
3. perf_event_open reads attr->size from userspace in
sys_enter_perf_event_open if the BTF-sized read of perf_event_attr
faults on an older, smaller struct.

That seems like a good follow-up cleanup.

Thanks,
Ian
