Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385A3E3C4F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049587; cv=pass; b=SuwQftMxdu8ht9Ny0kxH4Tqm4wx75tB/gNZN62ltPDFb9Hue5tE8mD6CSE7dUOsbFoxZg4wu/KbcuOlO8LTSLb25bNMdP26BK9aFsTU2H1sNiOcAUVWlCRqlNldfBVJfU70wBdE9iT8JC/Xca4Tjkx/HKrsfSLTYn7y/UGSUxpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049587; c=relaxed/simple;
	bh=kuDUMkXv3afPL+EnBob0k3BsBJPNiUTO2RsSrSswm60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFCLb7KSH2vf38ra3Z/vOnCdkuozoXXnYr4f0FHwW9hZqCe6/6mY4V/10AGevmIwc9eMgZf9Ak089V82LRovHaAx+DqUAeQNJzBLplaU70GLdE1QJYpfKkY4GyzUDsth6FEkg9P8QqDNnlg8Vg3Pl6zF+qg12va2vVe7GWUx7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eXawhaXk; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eXawhaXk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-530e8c6fb80so91771cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790049585; cv=none;
        d=google.com; s=arc-20260327;
        b=HER+fkc3CJ0fSk799qSAPpoIxXN/Rdb7aNlPjg/c3DwWl1E0ivDrGqkLvOt2/ZEGZC
         ZRCh7oOL62/rBGVf/kWHLwQ/lq3ltM7Nkr19tn5bOPlShkQT5AFkzT+XRuMfon6UZKuZ
         JatbejaumJi7YRy/C7yyycvuDcCvZTo2QxeZD0K/ZRRceRadxIm7IBfGYUZ5fFQ/JFsL
         ublYtuaZ5CE57xgZDsu2yYw2OJUWAR//BR7DQ4TW1vIRO1PaqLniYkNKYCoR1yjZtqJC
         tvBxiwQd/YBVk40StdjV6gymtICYYp22EQm9aFpAtRnyjXTN3RkuWhRUc8j2ytvTD+1l
         9Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kuDUMkXv3afPL+EnBob0k3BsBJPNiUTO2RsSrSswm60=;
        fh=rqY5pzXTVe58AgA4x8DBbAEkga8YXj6gs6u74UfPgao=;
        b=IG2SaIuISzK2KW88Zws/wnCVoYoqGW9yVZyeoLIBBc0WZoeJEUq1U2cboaOUfdSd+a
         KJNKcgn8JFDVOHu5ixy2cy5DnnPts1dXtvTQUx9NmyQm/SkBLZh5IScLztyol8p4Ot11
         RYa4/O/49Z2fSQBzKuxpSpQbsMWFwPlrGCeyJGLdEiYGOfievRkojNXpxw042hm5TWfg
         90PqnRSscnpLN6ldb74663+tD3w0GGZN/322bpMXDRwT3yp7CYrw08m+AngPDn+awtWw
         SL+hNwsGVQ4KC7s676IUEA3hLDEZHWQpA0YtmjlZSxW+b6OUBWDrLLUM6WSeQZKM68fF
         W32A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790049585; x=1790654385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kuDUMkXv3afPL+EnBob0k3BsBJPNiUTO2RsSrSswm60=;
        b=eXawhaXk94aSjo+ppLPm32o8evkbAmy13dVMyBOjTVK9AsgAgjaflgwUCgXDRYsPXH
         dUMashcU+nj/z3qHaEGcwYJVpOnEPcGRT4rQwsoKAQkJCbWjYqqiQcZVS8uIQa2b8aJk
         MFsnzlJ8/u/cKjDZOKJ+29P+IOBrHCqeR+U4TqaW9LeE3k3kGbyenYgt1AGbBGu26co9
         ORNG0Duq8LY45IJtvSuhxmSK968MKNAA/cm2pqR0KA9ZS+YFqxHk14gLa0yBwJOelSUq
         9nUk8Ze+JOvJz+NraEvklRSyZ4awNDE0hNCFJ7Dzp1BES9TsvzL56rg2tgWk/3XE4B4N
         Fy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049585; x=1790654385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuDUMkXv3afPL+EnBob0k3BsBJPNiUTO2RsSrSswm60=;
        b=HKTAAauNBvsDhtoHWzKcl8wesafSYu/UR4HNNcXC8GzY9wfoGD1IsVZMtZvrAVF9x8
         ZctsB1T36iccY6ndcL/PrVcSx7ym41rsGB+ji2V4V9+TxEVEMMWo/WhiAVjog2xYtZtH
         NjXcmJdSrWS2HuSo9MFzy0HzWbUuFWK+rc6FLsA0XDgn1hiDE8/bbzAKn3Q5keQnl124
         /9qMEjwzG3XPqfLlRexYvsD4bKto7iwwWB5+WjDalqqf6FRUTkUke3GY9QIJpidu42w0
         Q3xY7k9HzOvJ0S1IMQ68vQqivsoNK8XChuFiXjwDbZK/gGC8skt/a5jdofi6Bwi91rhi
         PeXw==
X-Forwarded-Encrypted: i=1; AKwUvBxBvwkj8Exc/vp9gRvGv9YBZB3GlLE8MNdQ1QHgayMWBWDNy4Dqa1xqcWSLLayDCECGcTH3ycBBKPddh0s=@vger.kernel.org
X-Gm-Message-State: AFuF++l/bW0ZFIa9l1WvslLcI8q/fOPy+01eWhms9B8trt3Lzqqt5JSs
	6aBMe7HM+SNme2DEdPDNn5exsHPbZVzm33v7b+N4RcXOhay1K4KGPpJaJgSRtIXAHKtGPshWS3i
	YzJRh2McMJtwc+8vCSmtXczzUhpDGU/9ieKl5rIzT
X-Gm-Gg: AYBFou3d0u6eO+skW+D/d8MEeXRwjWlXKLizNEHIvZR0c7rS2t0ZHIa17Jk8XRvZ72I
	LNn6jwhGekF7rNNJcerNK9QiDnrAAfmun+z+5lKM9ATw2+kMSbJ7GaKxrXRTDo6ZIXCuoKdO4dq
	zazJHgI+7Z2eNfCnI8407saoNNmlKy3ohhbLBdf/FzKEU+uC9Tc8fElmeq3wKEyrneP3LFme9Zj
	LBgRqsX+x1qic6jhdVajcy8IJkQi0XKjVjNqJ2BJp3gmdKYc2keyoe6Yo56Ld6Bznjeeg+hOsMP
	nCFnZXmi8qjCVdsX2cJvIvB/Pmy/dNGK0gdiBay+BzeS5xCQs96ogWX5FxduqYjI1V4eoeyLpud
	Ths9KdzDgND5KVXnWFhkOM78MfZUke+A3wH8x5kw=
X-Received: by 2002:a05:622a:418a:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-532ddceafadmr7173951cf.3.1790049584159; Mon, 21 Sep 2026
 20:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918040919.3402577-1-tweek@google.com> <CAEf4BzaeKXEC-gBbxo36wdAGwwZxqkL6pV=oo0dke4S2BmuRmg@mail.gmail.com>
In-Reply-To: <CAEf4BzaeKXEC-gBbxo36wdAGwwZxqkL6pV=oo0dke4S2BmuRmg@mail.gmail.com>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Tue, 22 Sep 2026 13:59:26 +1000
X-Gm-Features: AcwNN1VCSRgYVTkcKQ-igQWPuOPvyTYm8XckPrpz2jX0eeLC27k52LUPgeuDr5M
Message-ID: <CA+zpnLdaqv77PT=azFEzHvnwLzxYLXMkpRy0CcsKKKMgJjxayQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] bpftool: Skip non-autoload programs when
 generating light skeletons
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 7:30=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Sep 17, 2026 at 9:09=E2=80=AFPM Thi=C3=A9baud Weksteen <tweek@goo=
gle.com> wrote:
> >
> > When generating a light skeleton (bpftool gen skeleton -L),
> > bpf_object__load() skips loading programs marked as non-autoload (e.g.
> > SEC("?...")), so the generated loader program only records and populate=
s
> > file descriptors for autoloaded programs.
> >
> > Previously, bpftool emitted struct bpf_prog_desc fields, link fields,
> > and attach/detach/destroy functions for all programs in the BPF object,
> > causing the loader program to store subsequent program FDs into
> > incorrect skeleton struct fields when non-autoload programs were
> > present.
> >
> > Furthermore, bpf_object__load() can update a program's autoload status
> > during preparation (e.g. for struct_ops programs when resolving kernel
> > BTF members or adjusting autoload based on map autocreate settings).
> > Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()
> > into do_skeleton() before counting programs and emitting struct fields =
so
> > that struct field declarations and attach/detach/destroy functions all
> > observe the final post-load autoload state.
> >
> > Skip programs with !bpf_program__autoload(prog) when counting programs
> > and generating progs/links struct fields as well as attach, detach, and
> > destroy functions for light skeletons.
>
> This seems like error prone behavior to me. Wouldn't it be better to
> hard fail if the BPF object has non-autoloaded BPF programs instead,
> as clearly it's not meant to be used with a light skeleton that
> doesn't support such programs? So why not emit a meaningful error and
> exit?

Thanks for the feedback. This was my first approach [1]. I think it
also makes sense. I can send an updated version that addresses
Quentin's feedback ("goto out") if that is the overall preference.

[1] https://lore.kernel.org/bpf/20260904031912.2133476-2-tweek@google.com/

>
> Or I don't know, let's teach light skeleton how to support
> non-loadable programs maybe, not sure what that would take, but worth
> considering to bridge the gap?

This is technically possible, but I'm not sure this is what we want:
it could be implemented by adding a field to struct bpf_prog_desc and
change the behaviour of the loader depending on that field. The issue
is that, for signed light skeleton, we probably want to ignore this
field (for the same reason we are already ignoring initial_value; to
keep the attested blob authoritative). In that case, we end up
silently skipping any non-autoloaded program within a signed light
skeleton. I prefer the hard fail option discussed above, or silently
skipping for all kinds of light skeletons (this patch).

Thanks
