Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6443C7C1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511521; cv=pass; b=o+Dg33qMVaaFC/iMSigmfvAD1VQw472i1XqarV5Mn5qzOM89/Y7/DPFiVXVEXaVsksnpf7HAJY0+j7TMSkty0F/WJnZ6061KRPUggg++/guHqQcO45Ti05tR1bo/mDuz6PDdtrBh6LsJ5d7EFxGm6u/sBmUAECwBLAr6BeNpDPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511521; c=relaxed/simple;
	bh=HwkUmEeMNJIDc9Gel3SUVMVZAqVSKw+L0prI4S18Yvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRYUOOw8r/trO2+g0gBeAyY0dEcFjkYMSmIDcrkZzejYcHmz1CC4GTzeu8QFdM4BmyjJXid2gxGlHzVWH1KlKvTFpgD3kILtetfr58YaG6oiL6cU1FyXd5gfQsrs0PCxM3g8FOe/hlTKRzg5ZYYNDXH07Foca2DPEe+xuFCE4pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmGLTiyT; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmGLTiyT"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so48631cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789511518; cv=none;
        d=google.com; s=arc-20260327;
        b=PvypG7KdC0C2BqWjhTT85iB2MoR1cvdjTI4EW165iVvnb42JCZd1ywSJww4Zblv56a
         eEL0BsCwV4IpwL3CdrgM933DDklcuVQbEcVbTIXvjsgSpU76BR/b4TJzyvnyq4ECp9QN
         BcZCWW/a1eHCIUQl4qD/Doqwx3vDu77o1hupi0EzNES6XAfPGP5599WZVhzvebA0Cd1L
         /s9OvtxpSEiNqbaJ0GLFjm9HyQykzgoaQBMovjwuWttiY9B+nL0r7xHB9ATNk0mgHue6
         Pr3HAFt7Xk8G+8dsq9BCjSG2/NpOkFqP7S6WbTQ05m+bb9imjWLPR77v2mh54exn6bKH
         5pSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rF3d1NpRpJqESqzYc95bKbTV6mFlbMcr7RivfQo41c8=;
        fh=iUx4k0qcHULyM8I5pB7HP901PUQHuEYBAjf2+TmRRfc=;
        b=SGJCdQoMWqsBhqJkLWok0DF/L/z/YdFhtxb3Kva50aJrffUCyRKTJZGYg1cSyMUrzp
         r8B2ZM3E3JNrLDBXTcCueY35Q5VchXnRvmMaskwXbqKNczqDYPGGbA9ZyLuyayjeqjBk
         GGv+08+KyY3Bm+ybSJw76PjdSULWZ9bJn8qijndw8aLHdTKYJEn1h+5gz6Ow5ujgI+Tu
         FZ3309eNb0dcBcrBc9D6t1aHCDls5uicz7UdTIn8OpmQioQcnjpnVKaEWEgcJOveDDaM
         SSv8q+ncnG/5aRD8PSR+QY+dh5JNTmh5BsvyVkba6Y2MueEbjaUTE0uj059ONcqL+5ne
         FPPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789511518; x=1790116318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rF3d1NpRpJqESqzYc95bKbTV6mFlbMcr7RivfQo41c8=;
        b=rmGLTiyT872aZ7Gv3kYRsdGVVc3aKjEAJwTRbugk1jh3QssVHVzdKVtNJFA3kjgZuf
         mk2gZqUQVhzl9hYPCSX0qDi3UrG4zEZiFBu/L2x3zRgOSBcYzYiQwmyFtuZyG4aa+c0W
         A79j1YeCp9cD5WIDD2D42uwnhmEOKCupj/R613kru1BsCQLyFUht2SfHdd+IPtXdeGRU
         JgQkmSclhfXvYm0G2DChEyUWty0lh+SYNwdDV6pZiHzh2pelutzIDf0b0idIrDOgN/Xu
         j2922DpwX/zgoIL3dEaQ+L5BYiSupjszabRyVJ+E59+ufLnyVEhnI7VEN10UxWIkGaIw
         Qlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511518; x=1790116318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF3d1NpRpJqESqzYc95bKbTV6mFlbMcr7RivfQo41c8=;
        b=ois43vMtYXUH+oAVbfq1oziLOvF8ByBvvnC4Hr+1skufSNZTredUT8G9WcJFPw1qAE
         XcU9ywow+JsAk2+SBrQu99COJlR17FHOl4rjEX3bJCVIXaiMa/KcvcfGrMbKBRcJbM5J
         yEzwoh2+5tpxSlrR6RB3DmFJf+V+Hzatyn7irr7NgCI7Ev02GpnTEvgWfyl04hnSIkps
         8v/oIbeI5cm1J+AddKeo5wOiAoQlE99RsLAPZmtRGzTdcp3L7b44XGLAY31BkQ0rInRj
         8wjD0UV23i3EG5JtHi2HXunwpSu3c75U4RbfiTZyL3VWTkm94vc++RDzeF5TFjgdJI4W
         i6XA==
X-Forwarded-Encrypted: i=1; AKwUvBxfi17t6xaKf7gqLKR9xwf35CQ4BrslYsWPM1GMAoBv9rBS+/OdZGMnn9DyPjaZgNKqtC4+V8Rvahi7mtw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvqBf5iUkV59bLxkLTCUmp1b1UQ/KBUxDnbND5cRQ2Snj4yChz
	9FcO93p133RB6WTjf9SphPUkv1K6IOjgyzJi80ry7bM6FhslstW5SJRvj1RtMhFn7RTkBuV0vnh
	08xUqu6/OcslHYNEirRoIsTbJlfob9D+Kj55aWDNC
X-Gm-Gg: AYBFou0he8FzhfFeEiperdpnyBFm6cTEyGxQtbZ7dUXDoNh/GbqSl2bmMbgSyFHpzJi
	nQy8XqVRvA9uKK/zqqyAOn0489g2AVRcJk/SStfW2YjdQyIwrbGK0dPfkEuBfH5H7eVnWxHiIwD
	JNunp6qjghYHDDP7AMqJ4lcQcwp7UTN4GjaoL12cNgFGaaptS+eee0BGvH28qBR+bFfBlB4J1ne
	Rg2bl1MdUNIcCb8axq4zD8Q7PDj+HbEnMhV3ScDJysP7njktvRNlQcFVpUU8oUmj6oHNfo4nM6o
	AHzj/0zeT3kxauI8UnJVEHIaDV6y0eJHuFGGGR2igPNuuA9i8A+KKDKJg1K3BV38WK4zrVBafDD
	aLAJPMxo/Nw==
X-Received: by 2002:a05:622a:260f:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-5325087c7f5mr5483341cf.12.1789511517300; Tue, 15 Sep 2026
 15:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786728929.git.sandipan.das@amd.com> <10376263-f9e7-4419-9042-074b3a36cfab@linux.intel.com>
In-Reply-To: <10376263-f9e7-4419-9042-074b3a36cfab@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 15:31:45 -0700
X-Gm-Features: AcwNN1UnN_Tnwq8QQ1u5fl9Yt3ytKf6W3FXRQdA0drJuJRJdASR59wa4A4UogVw
Message-ID: <CAP-5=fX5zYcb4=q_BqM+h+5g3ZnuSjEWg1=f5LrtfOfcgtHetA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] perf/x86: Fix perf_event_print_debug() on
 non-Intel PMUs
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Petr Tesarik <ptesarik@suse.com>, Zide Chen <zide.chen@intel.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Ananth Narayan <ananth.narayan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 6:12=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
> The whole patch series looks good to me. Thanks.
>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Ping.

Thanks,
Ian

> On 8/15/2026 1:48 AM, Sandipan Das wrote:
> > Petr Tesarik reported that reading MSR_ARCH_PERFMON_FIXED_CTR_CTRL
> > raises a #GP on AMD processors that support PerfMonV2, and proposed
> > skipping that register when no fixed counters are implemented [1].
> >
> > However, perf_event_print_debug() also dumps the global control and
> > status registers whenever x86_pmu.version >=3D 2, and reads Intel
> > Architectural PerfMon MSRs to do so. That condition used to be
> > Intel-specific, but since commit 21d59e3e2c40 ("perf/x86/amd/core:
> > Detect PerfMonV2 support"), x86_pmu.version is also set to 2 on AMD
> > processors that support PerfMonV2, where none of those registers are
> > available.
> >
> > The same reasoning therefore applies to the other registers read here,
> > so rather than special-casing each one or reinstating a vendor check,
> > this series makes the global register dump a vendor-specific operation.
> >
> > [1] https://lore.kernel.org/all/20260717150315.2868314-1-ptesarik@suse.=
com/
> >
> > Previous versions can be found at
> > v1: https://lore.kernel.org/all/cover.1786010408.git.sandipan.das@amd.c=
om/
> >
> > Changes in v2:
> >   * Address build issue reported by Sashiko.
> >   * Use a static_call as suggested by Dapeng.
> >   * Pick up Tested-by from Petr.
> >
> > Sandipan Das (3):
> >   perf/x86: Add x86_pmu::print_debug
> >   perf/x86: Move MSR_CORE_PERF_GLOBAL_* dump to vendor code
> >   perf/x86/amd: Implement x86_pmu::print_debug
> >
> >  arch/x86/events/amd/core.c     | 20 ++++++++++++
> >  arch/x86/events/core.c         | 60 ++++++++++++++++------------------
> >  arch/x86/events/intel/core.c   | 32 ++++++++++++++++++
> >  arch/x86/events/perf_event.h   |  4 +++
> >  arch/x86/events/zhaoxin/core.c | 18 ++++++++++
> >  5 files changed, 102 insertions(+), 32 deletions(-)
> >
