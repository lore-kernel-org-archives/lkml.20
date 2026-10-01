Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86C3793D2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875063; cv=pass; b=m6l34KQTf3HAW/Rllw6BhbtMSZRxl5Bev75P1o9vQ3ZnDaOUNkfU1s8wwRyFlsRI+eILNMt0PmDkjjKE+9Yneiup4ObCQmnC/BynA3zulIGZhqqewwHuOM3rfWzg6oVESH+I136CbPIoZqw3yO0Sk2JfBX+iW6MRo7cI7t8vfJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875063; c=relaxed/simple;
	bh=2uH7hr08EOHwB76ui46RY+4T4ndldT9uZtoNdMcXwHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQIK/ASgsUuIfnrXz0pWSbC7BXevdNw/K9Tl+0S2LuBFFussNDRgXrYw+tiG5HVzmUMxuanyOgSt6KMCyZlLKWa/DFr5jZ5yUlgy6Vq8Q9V8MyXHk4hy7UxwZLetTvNiJ+qLDOrE/LjphJMnA9E+vk56mgUOlE1z/Vttm3mcAaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z13ei2nZ; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z13ei2nZ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5337fa12431so12841cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790875058; cv=none;
        d=google.com; s=arc-20260327;
        b=Ms7LsIK7TBBzx+U3O5C7F9H5YqING2D7feo2ykkdZ9FVavEQAYnn1oGmZzgVFVbCws
         7mHvCrsl/UWkQKqsUJdsLIsMq/N6xq5dHp7W0G27AiTiWNHWQHT3gByZJX8lHNYFgiJ2
         cHneIi74nk8IAj9MpMA2nf6SyqweKQjMOa6YDLzS1WcZk1746GSxwfEukp76vlpYSOSX
         Ch4r/mjyNX5KQydvL/vGNB+tHUMka/vzUPubeCzn6zxT1W0ihrDzUFh+poQ5TYmxDOJq
         fx88+qT9TKa211Gkcml4fUQaUVgViV588DorAJxSb0TfNLS/DBjpclpxsJV2cU+yvfqk
         tljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DJAijfyrLq+HSksYFFxSL2E4glFtw0mr8iRxcoI5v0M=;
        fh=rRbkM+DntYoijbP98DRPYrddsMazAtczR48fLdQiAB8=;
        b=Q7AM6Pqe8uIX+VBoPjKNGajAlqcj2+IBu7cKnM/youyuXCnstue2So/RAi6v7DpQnk
         9ceKZnk8EXQgbbFx93o3TLYzPMiEytTYJW3pPP2DCIZabkMvceX9BWtZaq3tww8WCSzu
         PBeqFDmFo6hf3rE9gyjZhC+3oCbi354QT0K3r+NRZzMa4xEgqwqmb3GVePdAY2F0Ds1f
         v0wE8cwhaMSvY8t1GLYifr+orbt/RLdrZGdnpNIhepisezdmSIKFmaeiII+MdLQ3HeqI
         35QBS+21s+64AI5mHuQULObu2bgljRcavTJJDii3+UmQaGm67gNZjxQKPnG+u2WvIm3T
         r7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790875058; x=1791479858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DJAijfyrLq+HSksYFFxSL2E4glFtw0mr8iRxcoI5v0M=;
        b=Z13ei2nZzspxwMvwcOjYLoyF/Y8HW7OXU9Un6P8rV7/HevOKezJ3bX+5xMmFC8ox9f
         z135QA55fyvzruZUMVgjxiI2UK14hLjVGeXvuNfyLgi7XqoyqGABFPkO8eVWyNPEItYo
         WowlLa83YFrB3pQkpU1roJa43GX41DZswg+zEjcb8TLhyaBQssYAy7kJQ9ocNfciQP3N
         Z3PLdqoqrhFET+Vo4SLXmwLWtp+eUumqtNQg4d7u67XXWPmHc3OkKJ+c3RnxYDCmqSG0
         GbhJqKCUVhhQnscvox72IVLTq9cSVJVUvy14P1AIT/tiQ98Zzs4gtB2IHXimQrXd1jq+
         zi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875058; x=1791479858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJAijfyrLq+HSksYFFxSL2E4glFtw0mr8iRxcoI5v0M=;
        b=VMNwat2LmImEqsbJc4nQ796Nv46GE5CN6YOfSoHKehjdMlydjnc8t79KwqqjoW9Rh+
         +yw2iGkxjNzut7/n0xnsJmYTI2XyVo4Z7PcyQP43D19qncj/4fcTtguVdDbNXikVkG7F
         A+P870fuqs1imfEHD5RhozM14Evv8DHn7J7zLC8FFHQCSYkgPFhKXAe6OLlztdHHWR5X
         /axtlUfrEUrVfg7rbUzYdQ+om6mG37Sw66A463TBv89JiKaupXFP24uNIqFTQlu+hvVP
         CFKXFPwB0n8yw2AeUwjeRcAsU8tRgw85Ti1hqkpWFd3WwXUG6gFFhBvH5CJOgWpPaLiY
         flew==
X-Forwarded-Encrypted: i=1; AKwUvByxGtYl2Z73h4dtaxrqHmcGZgtDixHTP9t+iPxGACyL6KTYMhih/XHhj6kMt6kWw6KNNAc8oKgG9N06uOs=@vger.kernel.org
X-Gm-Message-State: AFuF++lh55Nx6OkRSAfBSjzjOldnf4EeP6oVGv5ysKH0tCNBBoKNkEbP
	3br1apONLBKSn3GrlcrewdeWvprwk7W3O0a2NAtUuIOuk03dy+zPy9XuWCJS7SwEEVXhzNVt3KG
	kf/20HVy6cWENW8Ifc0FG8lErETveVfpyoAAXeLhy
X-Gm-Gg: AYBFou13IwAlRf9PmJc4/mAK/2yg2TyuwiEnWndfSfr7RcR8Is8R1+Z0j7tVVBEl+Ta
	mwq6XnPgmQVbQd/tj/0xngqXabcQ2YVuIktJpDTVAf2l0kJkGqmZWngIlfXhXilN7zTrKzemCpe
	XHtKNYOf3qBEoRihjiWKYpf+sAQfi+45iK5lsrdyPA06D4jatNzba896Knx8f4OhpurR86oF9cf
	Ka1KcGLX5geiOo0R58nu9niO7OU4HXMlZ6HA8TPTcr5e2RR69A8zqJPOofhHbICgdQlIJoWBZA2
	jMKQVQAjUKajH/T/upzDsbv+zvmQ1cvWU0WecIft6KysneqBwPchndQ=
X-Received: by 2002:a05:622a:8c4:b0:530:e335:4ef with SMTP id
 d75a77b69052e-5339a9bb27emr351341cf.2.1790875057075; Thu, 01 Oct 2026
 10:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
 <20260928182605.3649015-7-irogers@google.com> <ar1fon_Z4uT3Cd22@x2>
 <ar2WYemXnrbDx-Il@google.com> <ar4i6X8g9H4dfiah@x2>
In-Reply-To: <ar4i6X8g9H4dfiah@x2>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 10:17:24 -0700
X-Gm-Features: AclHuK8ldvSXYEgt4e0s7js82CdPyf-jSZ3DUobTCzZslvZN1u8gCyThCITMkIg
Message-ID: <CAP-5=fX8BW97JHE1G=L2G0T9LqqzfMkWgqZOQV_XJJxJzo80dA@mail.gmail.com>
Subject: Re: [PATCH v6 06/26] perf trace: Copy sockaddr arguments by their length
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:07=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> On Wed, Sep 30, 2026 at 04:08:17PM -0700, Namhyung Kim wrote:
> > On Wed, Sep 30, 2026 at 09:14:42PM +0200, Arnaldo Carvalho de Melo wrot=
e:
> > > On Mon, Sep 28, 2026 at 11:25:45AM -0700, Ian Rogers wrote:
> > > > +++ b/tools/perf/builtin-trace.c
> > > > @@ -4159,7 +4159,12 @@ static int trace__bpf_sys_enter_beauty_map(s=
truct trace *trace, int e_machine, i
> > > >                           continue;
>
> > > >                   bt =3D sc->arg_fmt[i].type;
> > > > -                 beauty_array[i] =3D bt->size;
> > > > +                 /* Copy a sockaddr as a buffer sized by the next =
argument, e.g. addrlen. */
> > > > +                 if (strcmp(name, "sockaddr") =3D=3D 0 && field->n=
ext &&
> > > > +                     strstr(field->next->name, "len"))
> > > > +                         beauty_array[i] =3D -((i + 1) + 1);
> > > > +                 else
> > > > +                         beauty_array[i] =3D bt->size;
>
> > > And it knows how many bytes to read by looking at socklen
> > > (args->args[2]), i.e. not use the generic BPF handler that uses this
> > > beauty_array, because knowing how many bytes to read in this case is
> > > dynamic, varies with each syscall, according to one of its arguments =
:-\
>
> > > What am I missing?
>
> > I think Ian's patch update the beauty map which is used by
> > augment_sys_enter() before tail-calling syscall-specific functions.
>
> > It'd be great if we cover all syscalls in the BPF skeleton and switch
> > to the beauty-map and discard the functions.
>
> I was missing the convention that a negative size means read some
> other argument with a cap, as Ian explained in his response.
>
> So checking if a syscall arg is of type sockaddr (or if the name is
> always sockaddr as Ian did above) and the next arg has name "len", then
> we can set the beauty_array[index_of_sockaddr_arg] =3D -index_of_len_arg,
> that extra + 1 looks odd, but must be part of the convention too.

Thanks for merging the series!

Yes, the two + 1s are:
- (i + 1): the 0-based index of the length argument right after the
sockaddr argument.
- -(j + 1): beauty_array's 1-based negative encoding (so arg 0 is -1
rather than 0), which augment_arg() decodes with index =3D -(size + 1).

> Since we have it there already and we may not have BTF and BTF isn't yet
> a hard requirement, we leave the fallbacks in place for the time being?

Agreed, keeping the fallbacks for now makes sense. (Also, in
trace__bpf_sys_enter_beauty_map(), only the struct/union size lookup
actually uses trace->btf; strings, buffers and sockaddr only use the
tracepoint format fields, so moving the trace->btf check into the
bt->size branch would let those work without BTF too.)

> I guess that clamp can be made bigger, 64 maybe? Applying the series
> now.
[ ... ]
> And copying the sockaddr parameters according to its addrlen or the cap
> in the augmented bpf, that probably needs to be a bit bigger for local
> sockets:
>
>   =E2=AC=A2 [acme@toolbx perf-tools-next]$ echo -n /var/run/.heim_org.h5l=
.kcm-soc | wc -c
>   30
>   =E2=AC=A2 [acme@toolbx perf-tools-next]$ ls -la /var/run/.heim_org.h5l.=
kcm-socket
>   srw-rw-rw-. 1 nobody nobody 0 Sep 14 23:13 /var/run/.heim_org.h5l.kcm-s=
ocket

Right, 32 bytes is 2 bytes of sa_family plus 30 bytes of sun_path, so
"/var/run/.heim_org.h5l.kcm-socket" lost its last 3 characters.
augmented_arg->value already has room for PATH_MAX (4096) bytes, so
raising TRACE_AUG_MAX_BUF to 64 (or 128, i.e. SS_MAXSIZE, which covers
all 110 bytes of struct sockaddr_un) works without changing the map
layout. Since syscall_arg__scnprintf_buf() prints all
augmented_arg->size bytes for write(), if we want to keep write()
buffers at 32 bytes while giving sockaddr up to 128 bytes, we could
either cap syscall_arg__scnprintf_buf() at 32 or use a separate
negative range in beauty_array for sockaddr. Happy to send a follow-up
patch whichever way you prefer.

Thanks,
Ian
