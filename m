Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC0547061
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022716; cv=pass; b=KGp67tgb1LzTjYOJkayVm/JImcTCyt7VKTv84BMa/Dex26KctI3W8KtoUqMfNM2q16E5mXotOV8ybP2zKALFCZ8JV46pWosUpB4nffSR8CV+Yo4N1JryMeVbfHQD5tr+BjFhBv8lGuRspx6Jg8a96XEhyZMdDKzWvnRUWF22+DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022716; c=relaxed/simple;
	bh=IsumSsX68ned4I+XN6qD7vJuuH/AEcDulEb+H0uATVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zj3tTxoKt228+VZc27tdOmDSbEgXHfegmORH8Z9IWPy2cwWwIKTTR+BKbm+kLQuikaIT9NlDFQSfZ2ILZcj8Mqr2QOzX8YdVhsFOPNYREjWubJXWiRMeHUX0vwXceIYOHM2JQ72gqtU3iq2lRB9jmBhvdcUeyUITN2+ip6phOjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWySo1kZ; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWySo1kZ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533972e0cccso53803101cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792022714; cv=none;
        d=google.com; s=arc-20260327;
        b=Oh8hdhy64R9kfZhPEmz+8367r859zE1ljO1pII0InfyO2TepsXuJuITOSf98SuYXzV
         KuL1nkGoPELQMaRDkc+WQPfV7u4Y1/6ByqMC1ImdJSAoeUkxzeizRqlg45zQI5htk+pl
         1CgKnhPZ4wogJ//B8t5PnS0F6Lbeh+bu1cAy8JfAXMYCGmvXaPKHQfspviKm2Ch8mxHK
         JPz071x/jEzCBj7wUxNgBzCF5aTVdFs0thx7HdXp+M0LQDxB7aKSo2PfTXggnfA0KHJJ
         XKYdLVKxRqRX2d62zj5nVSW7y8Et9M+AgoQCmQa+PNYMi9zRttFUeBRrkhtqP5O/GQbh
         mccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2i4ePvZhKbDvNIgqM9w1XHeVFGw/Fx59ZBhSBmCD14=;
        fh=J7uAwMG0rSl6nT0H8LJwoel5DFczg/qtzC/N1XGzAhs=;
        b=mBpvEyaioKde5ugmBvAaYZWgeD3WBQrAZy2Xgl+AHzYzornHvNdDlCpGTr1fBCRiON
         SGBZbyn5kfuQJFqnMi0A/Fa0gFfDbMzMnXN80AlEx6bBKuVUUpzYSIoWlEKvk2dJGxU2
         sg6zmcuGOmv5rvUluOCvss8QVyv+tTDRixakXHycoil7BvADXro3IrKJj0ESm0PiFhqU
         c+ctpl3Snca9TT8G0sJTZJFfIbjxcEx7Ic9aUCW59JNDuqV4koOQX2UZTZXYpEbOr/VW
         2e1ReW7NFgI2Niyt/qkqSkOuj56ZHNkjhhD3sDyQmc+bk8Ydj8xXkvsq4BISlnBnAju4
         M0NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792022714; x=1792627514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2i4ePvZhKbDvNIgqM9w1XHeVFGw/Fx59ZBhSBmCD14=;
        b=mWySo1kZJjySESsIerkLouhQvMgeJlOcPLo4kmSTKcmhIlrwBBb/X/pUk1RWYmoGDp
         bBf7WNBQXaDoEJLif/8btOjKVV8ICJb2TNJWKbKMFtdDNen0tkqiOPzSDKtjj6gI1nb1
         MNcjDwUz9+QcU2/51hHUCSBsm025kFiD9+PVy6Qsv4oLaBCUZxW26ytHKIdREF620N8J
         mfk4IBA8SdW9IniQLj3/IswEQlyLb+JLIDDr9kHZPeVnv6tAR5LGbvZbKhD63OZmq0DZ
         y6p8Uumxz94nOBS7nCBSPS6jgZg14nTlH9+PxqqbJgQUrYuaeXOUdw3k2v8ubb5opXj1
         BIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022714; x=1792627514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2i4ePvZhKbDvNIgqM9w1XHeVFGw/Fx59ZBhSBmCD14=;
        b=jM5R6/pap3PbIvhXVx/NWhRZPO9nb8LEQ4RImTLPcURulpDywTuvbMuJakmDzavxyz
         wOepu2yuw9ubRTRydtl0DhZH6xuN5fS8CbxwUl99RQXoDsRwciFgUuuKT3g4ikRIRH3G
         7ymSbv9NK6Wte5Hq9DCXyjq79gFp9e0/OOpT/HKa8FCt6ZGGolBaFb9mpsBeP2UwUCIj
         sM5ovSeAoOIXaMAXp5MT6MqQ8WHOXMNZGQjNhkDNAg5cye/Ng0kiq6iMTkYieHe3spj2
         f+M7VGlTpzUyQdCV7UyTOaN/zi+wtA5yJWnAGbBri+itGI5O7a7ZmKq8i5QoEV+9Ym4A
         Zudg==
X-Forwarded-Encrypted: i=1; AKwUvBx+4fRLwi3iFh0LvHFJQSzWXauuyK+eAeWfEgF/KUi0Rn4a/jKPFsm7tn7c36Yxs5EnYZGp7Mf/UAaohcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7GX85N9W50e/kP1jq2GQ3MNsKf6ZNtQHU7WtgjUY/7iNAlD/T
	jkcaWfeWKXE/6PCnNJ0F1HGHtTstj4GF+wzMHWhUZkK7QJiX6zYpsPLsG9OV1UzEHZD8eIl+hlX
	pX85IyepD5zn49f2ZtWwZ/2cE8pRXRTk=
X-Gm-Gg: AYBFou0vudB26FfXHyryQ6XWxBfgYhyxrxq3vjvDMOa3P3tGKfCycueAs048gEb3DTV
	HUYIBlLoftoIMUp9XfUTwqzqGaVxC0zQxPCnPe++yDiayyXrv/ZYH1071CaV58aplYM9KYulO7/
	Una+SkCJi2xxCCWiiOqzEgvomkJF88wfLgqIQQjDx6cenkwn0Ur+4u8ajP2Pw+fjhUfvPGuBCg8
	Uf0thN3VgnN3lkssOmR4V3AOwsmWf+vFPRBMiLhMWjr/zttPatFYhwy4162HSyKs92ksRmfJiz3
	2Br2tIkYZbrFtLH8YZw2a+dr0gb2Iu8unZZO62p1yrlC2DSKtrAQq0i9LFYso3UVNLpX1Qc=
X-Received: by 2002:a05:622a:1a81:b0:535:a5fb:6454 with SMTP id
 d75a77b69052e-535a5fb6988mr279210731cf.63.1792022713852; Wed, 14 Oct 2026
 17:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014151326.4142140-1-thepacketgeek@gmail.com> <CAP-5=fXtuEX9zJ0U-a62REgfAXG2z05XCi1f6HB4hhUEfT969w@mail.gmail.com>
In-Reply-To: <CAP-5=fXtuEX9zJ0U-a62REgfAXG2z05XCi1f6HB4hhUEfT969w@mail.gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Wed, 14 Oct 2026 17:05:00 -0700
X-Gm-Features: AclHuK9tPEGCU4rCb0cbubedkPvYOaYtyB9MSzjYpq1TtLkAodyqOy6iHOW3PAQ
Message-ID: <CADvopvbhQL3VAza4jybWq90fOm4n3QjGm_=MXruzxxXZPODgAA@mail.gmail.com>
Subject: Re: [PATCH v1] perf machine: Don't unwind the arm64 leaf frame caller
 without symbols
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:03=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Hi Matthew, I'm not sure if this is a serious patch or a bug report
> about the slowness of DSO marking. Broadly DSO marking is known to be
> slow and many perf tests run with -B and -N for this reason. I believe
> the intent behind DSO marking as a default is to ensure that perf
> provides the best profiling experience. This comes at a cost, but this
> fix looks like it will break things because IPs will be lost.
>

Hi Ian,

Thanks for looking. It is definitely meant as an attempted fix. On a
128-CPU arm64 host, 'perf record -a -e cycles:u --call-graph fp -- sleep 2'
never finishes writing perf.data, and I'm trying to save some unnecessary w=
ork
to solve that. perf sits in __cxa_demangle() on one C++ symbol, with heap
growing by over 1GB every 5 seconds.

You're right about the lost IPs, thanks for mentioning. v1 drops the leaf
frame caller for symbols=3Dfalse so a DSO that is only reached through that
frame wouldn't be marked.

> Trying to look a little more at the ARM64 performance problem, I see
> that we're trying to unwind 2 frames:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.=
git/tree/tools/perf/util/arm64-frame-pointer-unwind-support.c?h=3Dperf-tool=
s-next#n70
> but often just 1 is read. For libunwind the 1 frame case has a special ca=
se:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.=
git/tree/tools/perf/util/unwind-libunwind.c?h=3Dperf-tools-next#n671
> I wonder if we could replicate the 1 frame case with libdw to avoid
> processing the DSO, and update the caller to be:
> ```
> ret =3D unwind__get_entries(add_entry, &entries, thread, sample,
> callchain_param.order =3D=3D ORDER_CALLER ? 1 : 2, true);
> ```

I looked at this but I don't think it would avoid the hang, unless I'm
misreading the code:

- The cost is in loading symbols, not in the DWARF unwind itself.
  libunwind's 1 frame case still goes through entry(), which calls
  thread__find_symbol(). libdw's __report_module() does the same for
  every frame. Either way, the DSO's symbol table gets loaded and every
  name in it demangled.

- callchain_param.order defaults to ORDER_CALLEE so process_buildids()
  would still ask for 2 frames.

- The 1 frame case returns only the sample PC. That's the IP we already
  have, not its caller, and get_leaf_frame_caller_aarch64() needs
  entries.length =3D=3D 2. So in caller order I think it would stop
  recovering the leaf frame caller altogether.

I'm working on and testing a v2 that instead keeps the unwind and frames
as they are, but passes a symbols flag down to unwind__get_entries().
When it's false, libdw and libunwind look up only the map of each frame.
The leaf frame code only uses the addresses, so it never asks for symbols,
and thread__resolve_callchain_unwind() passes its symbols argument through.
That also removes the "Not resolving symbols with an unwinder isn't
currently supported" limitation for 'perf inject' with DWARF
callchains.

On the arm64 host, the 'perf record -a' command above now finishes. To
check that no IPs are lost, I used a small program where one DSO can
only be reached through the leaf frame caller:

  app -> libmid.so:mid() -> libleaf.so:leaf_spin()

leaf_spin() has no frame record, so the kernel's frame pointer chain
goes straight from leaf_spin() to main(). No samples land in mid()
itself, so libmid.so is only marked hit if the leaf frame caller is
kept. Running 'perf record --call-graph fp' without -N and checking
which DSOs end up in the build-id cache:

  unpatched: libmid.so cached
  v1:        libmid.so missing
  v2:        libmid.so cached

'perf script' output is identical between the unpatched perf and v2,
with mid() recovered in the same 2053 samples.

On x86 with libdw, 'perf inject -b' on a --call-graph dwarf profile goes
from 0.24s and 58.5MB max RSS to 0.04s and 15.5MB, with the same
build-ids injected. 'perf report' output and the dwarf unwind test are
unchanged.

I'll send v2 shortly.

Thanks,
Matthew
